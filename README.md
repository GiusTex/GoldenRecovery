# GoldenRecovery
## WIP
Dev files of my Golden Recovery v3.0 mod for BG3. Patch 8 ready.


### How it works
- The base ring recharges spell slots for free, then when paired with [Script Extender](https://github.com/Norbyte/bg3se/releases/latest) it checks if the player has enough gold to subtract. If possible Script Extender will take the gold, if not possible it will take note of the missing gold, and will try taking it the next time the spell is cast, starting again the "loop".
- I have yet to check if patches 7-8 added spells based on gold, before there weren't any; if now there are, Script Extender could be removed.

### Building from Source
- Download [BG3 Multi-Tool](https://github.com/ShinyHobo/BG3-Modders-Multitool/wiki/Installation) by ShinyHobo.
- Once you update something, drag the main folder "GoldenRecovery" to the light blue square "Drop mod workspace..." to create the mod zip. Unzip it to get the mod `.pak`.

![image](https://github.com/user-attachments/assets/21dd28ae-446d-49b7-a54d-dc8e40aca9a5)

- Then drop the mod `.pak` in the mods folder:

![image](https://github.com/user-attachments/assets/eb519079-7409-49af-ba73-fe2fc5d48d5c)

- The ring works by saving the debt in a config file here: `Local/Larian Studios/Baldur's Gate 3/Script Extender/GoldenRecovery.json`, and supports only 1 campaign at a time. When you start a new campaign, or if you want to play a different one, reset the debt value in the config file.
  - Tip: You can create as much copies of the config file (just name them differently from the main one) as your campaigns, and the read one will be `GoldenRecovery.json` (the main one); this way you can switch between campaigns and their config by renaming the config file.
