# Dobby Peon Pack for OpenCode

A house-elf themed sound pack featuring Dobby from Harry Potter for use with OpenCode's peon-ping plugin.

## Description

Dobby is here to help! This sound pack brings the lovable house-elf Dobby to your OpenCode sessions, providing audio feedback for various events like task completion, errors, and more.

## Installation

1. Copy the `dobby-peon-pack` folder to `~/.openpeon/packs/dobby/`
2. Update your peon-ping configuration at `~/.config/opencode/peon-ping/config.json`:
   ```json
   {
     "active_pack": "dobby"
   }
   ```
3. Restart OpenCode

## Sound Categories

This pack includes sounds for the following events:

- **session.start**: When you start OpenCode
  - "Dobby is here to help, Master!"
  - "Dobby is free to serve!"

- **task.acknowledge**: When Dobby acknowledges a task
  - "Yes, Master!"
  - "Dobby will do it!"
  - "Right away, sir!"
  - "Dobby is happy to help!"

- **task.complete**: When a task is finished
  - "Dobby has finished!"
  - "Task completed, sir!"
  - "Dobby did it!"

- **task.error**: When an error occurs
  - "Dobby has failed you!"
  - "Bad Dobby!"
  - "Dobby is so sorry!"

- **input.required**: When Dobby needs your input
  - "What can Dobby do for you?"
  - "Dobby is listening..."
  - "Does Master need Dobby's help?"

- **resource.limit**: When resources are exhausted
  - "Dobby cannot do this!"
  - "Too much for Dobby!"

- **user.spam**: When you're sending too many commands
  - "Dobby is overwhelmed!"
  - "Too many tasks at once!"
  - "Please, Master, slow down!"

## Adding Sound Files

To complete this pack, you'll need to add `.wav` audio files to the `sounds/` directory:

1. Place your Dobby voice clips as `.wav` files in the `sounds/` folder
2. Name them according to the `openpeon.json` manifest
3. Run `./generate-hashes.sh` to automatically update SHA256 hashes
4. The pack will be ready to use!

### Required Sound Files

```
sounds/
├── dobby-ready.wav
├── dobby-hello.wav
├── dobby-yes.wav
├── dobby-will-do.wav
├── dobby-right-away.wav
├── dobby-happy-to-help.wav
├── dobby-finished.wav
├── dobby-done.wav
├── dobby-success.wav
├── dobby-failed.wav
├── dobby-bad.wav
├── dobby-sorry.wav
├── dobby-what-can-do.wav
├── dobby-listening.wav
├── dobby-need-help.wav
├── dobby-cannot.wav
├── dobby-too-much.wav
├── dobby-overwhelmed.wav
├── dobby-too-many.wav
└── dobby-slow-down.wav
```

## Generating SHA256 Hashes

After adding your sound files, run:

```bash
./generate-hashes.sh
```

This will automatically calculate and update the SHA256 hashes in `openpeon.json`.

## Testing

Test individual sounds with:

```bash
paplay sounds/dobby-ready.wav
```

## Requirements

- OpenCode with peon-ping plugin installed
- Audio files in `.wav` format (16-bit PCM recommended)
- `paplay`, `pw-play`, or compatible audio player

## License

CC-BY-NC-4.0

## Author

Created by johmara

## Credits

Harry Potter and all related characters are property of Warner Bros. and J.K. Rowling. This is a fan-made project for personal use only.
