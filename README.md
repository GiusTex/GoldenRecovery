# Golden Recovery
## WIP
Developer files of my Golden Recovery v3.0 mod for BG3. Patch 8 now supported.

### To do list:
- [x] 10 version
- [x] 25 version
- [x] 50 version
- [x] 100 version
- [ ] Custom version
- [ ] x1,7 version
- [ ] Free version


![Spell costs](https://github.com/user-attachments/assets/28649e5b-a56e-42a3-ace9-6ca67f57b8b9)

### How it works
- The base ring recharges spell slots for free, then when paired with [Script Extender](https://github.com/Norbyte/bg3se/releases/latest) it checks if the player has enough gold to subtract. If possible Script Extender will take the gold, if not possible it will take note of the missing gold, and will try taking it the next time the spell is cast, starting again the "loop". The free (no gold cost) version doesn't require Script Extender, since it doesn't use it.
- I have yet to check if patches 7-8 added spells based on gold, before there weren't any; if now there are, Script Extender could be removed.
- The ring works by saving the debt in a config file here: `Local/Larian Studios/Baldur's Gate 3/Script Extender/GoldenRecovery.json`, and supports only 1 campaign at a time. When you start a new campaign, or if you want to play a different one, reset the debt value in the config file.
  - Tip: You can create as much copies of the config file (just name them differently from the main one) as your campaigns, and the read one will be `GoldenRecovery.json` (the main one); this way you can switch between campaigns and their config by renaming the config file.

### Downloading the files
- Inside each root folder (+10 folder, +25 folder, +50 folder, ...) you can find both the developer files of that version and the mod `.pak` file. You can download the zip with the `.pak` file also from [Nexus Mods](https://www.nexusmods.com/baldursgate3/mods/8322).
- I'll upload first here the working versions, compatible with patch 8, and later on Nexus Mods, so if you want to download the mod from Nexus check if the version is updated.

### Building from Source
- Download [BG3 Multi-Tool](https://github.com/ShinyHobo/BG3-Modders-Multitool/wiki/Installation) by ShinyHobo.
- **Recovering folders and files from the .pak**
  - Drag the `.pak` file to the light blue square "Drop mod workspace..." to create in `bg3-modders-multitool\UnpackedMods` the mod folder with its files inside.

  ![image](https://github.com/user-attachments/assets/21dd28ae-446d-49b7-a54d-dc8e40aca9a5)

  - Edit what you need, then pack again all into a `.pak` file.
  
- **Creating the mod .pak file**
  - Once you updated something, drag the root folder (the one containing "Mods" and "Public") to the light blue square "Drop mod workspace..." to create the mod zip. Unzip it to get the mod `.pak`.

  ![image](https://github.com/user-attachments/assets/21dd28ae-446d-49b7-a54d-dc8e40aca9a5)

  - Then drop the mod `.pak` in the mods folder:

  ![image](https://github.com/user-attachments/assets/eb519079-7409-49af-ba73-fe2fc5d48d5c)
