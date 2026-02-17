#!/bin/bash

# Generate SHA256 hashes for sound files and update openpeon.json
# This script will scan all .wav files in the sounds/ directory and update the manifest

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOUNDS_DIR="$SCRIPT_DIR/sounds"
MANIFEST="$SCRIPT_DIR/openpeon.json"

if [ ! -d "$SOUNDS_DIR" ]; then
    echo "Error: sounds/ directory not found"
    exit 1
fi

if [ ! -f "$MANIFEST" ]; then
    echo "Error: openpeon.json not found"
    exit 1
fi

echo "Generating SHA256 hashes for sound files..."
echo

# Create a temporary file for the updated manifest
TEMP_MANIFEST=$(mktemp)
cp "$MANIFEST" "$TEMP_MANIFEST"

# Find all .wav files and compute their hashes
find "$SOUNDS_DIR" -name "*.wav" | while read -r sound_file; do
    filename=$(basename "$sound_file")
    filepath="sounds/$filename"
    hash=$(sha256sum "$sound_file" | awk '{print $1}')
    
    echo "✓ $filename"
    echo "  SHA256: $hash"
    
    # Update the JSON with the hash using jq if available, otherwise use sed
    if command -v jq &> /dev/null; then
        jq --arg file "$filepath" --arg hash "$hash" \
            'walk(if type == "object" and .file == $file then .sha256 = $hash else . end)' \
            "$TEMP_MANIFEST" > "${TEMP_MANIFEST}.tmp"
        mv "${TEMP_MANIFEST}.tmp" "$TEMP_MANIFEST"
    else
        # Fallback to sed for simple replacement
        sed -i "s|\"file\": \"$filepath\",.*\"sha256\": \".*\"|\"file\": \"$filepath\",\n          \"label\": \".*\",\n          \"sha256\": \"$hash\"|g" "$TEMP_MANIFEST"
    fi
done

# Only update if we found files
if [ -f "$TEMP_MANIFEST" ]; then
    mv "$TEMP_MANIFEST" "$MANIFEST"
    echo
    echo "✓ openpeon.json updated successfully!"
else
    echo "Error: Failed to update manifest"
    exit 1
fi

echo
echo "Done! Your pack is ready to use."
echo "To install: cp -r $(basename "$SCRIPT_DIR") ~/.openpeon/packs/"
