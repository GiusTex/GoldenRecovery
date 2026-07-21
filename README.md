# Golden Recovery
Developer files of my Golden Recovery v3.0 mod for BG3. Patch 8 now supported.

### Updates:
- Patch 8 ready, the great overhaul;
- Added condition requirement to cast spells;
- Removed gold debt;
- Added interactive spell cost sliders thanks to MCM.
- Added checkbox to check and retrieve gold from a single character or the whole party.

### To do list
- [ ] Check multiplayer compatibility

### How it works
- The ring recharges spell slots and warlock spell slots when the player has one of the custom Rich I/II/... statuses. [Script extender](https://github.com/Norbyte/bg3se/releases/latest) retrieves them by [Mod Configuration Menu](https://www.nexusmods.com/baldursgate3/mods/9162), where the user can set his preferred cost amount, be it 0 or more. **NOTE**: When changing values/option, you need to close and open again the game; you don't need to start a new save, just close and open the game.
- Script extender checks the player/party's gold each time an object is added or removed from his inventory, then it gives him the highest possible custom status if possible otherwise it lowers/removes it.

### Other info
- The mod works both on new and existing saves.

### Install
- Install [Mod Configuration Menu](https://www.nexusmods.com/baldursgate3/mods/9162), see Installation paragraph, then install [Script Extender](https://github.com/Norbyte/bg3se/releases/latest), see Installation paragraph again for install info.
- Download the Golden Recovery zip from the [releases](https://github.com/GiusTex/GoldenRecovery/releases/latest), then do 1 of the following options:
  - (Manual install) extract the `.pak` in `%LOCALAPPDATA%\Larian Studios\Baldur's Gate 3\Mods`, then in the game from (?) put the Golden Recovery mod under the Mod Configuration Menu mod;
      ![image](https://github.com/user-attachments/assets/eb519079-7409-49af-ba73-fe2fc5d48d5c)

    The mods folder
    
  - ([Baldur's Gate 3 Mod Manager](https://github.com/LaughingLeader/BG3ModManager/releases/latest) auto install [[setup here](https://github.com/laughingleader/bg3modmanager#setup)]) drop the `.zip` in Baldur's Gate 3 Mod Manager, check the mod is in the left tab (active mods) instead of the right tab (turned off mods), drag the Golden Recovery mod under the Mod Configuration Menu mod, save and export the load order, then start the game.
    
    <img width="787" height="147" alt="BG3_MM_Save+ExportButtons" src="https://github.com/user-attachments/assets/a1b63512-012f-4bbd-b3df-e8b8d945340a" />

    Save and Export buttons

### Uninstall
- Remove the Golden Recovery ring from any character still having it;
- then (choose 1 of the options):
   - (Manual): from inside the game, select the Golden Recovery mod and delete it;
   - (B.G.3 Mod Manager): select the Golden Recovery mod, right click and select delete it, select permanent, then again save and export mod load order.

### Build from source
- Download [BG3 Multi-Tool](https://github.com/ShinyHobo/BG3-Modders-Multitool/wiki/Installation) by ShinyHobo.
- Edit what you need.
- When done, drag the root "Golden Recovery" folder (the one containing "Mods" and "Public") to the light blue square "Drop mod workspace..." to create the mod zip.
- See **Install** to see how to install.

  ![image](https://github.com/user-attachments/assets/21dd28ae-446d-49b7-a54d-dc8e40aca9a5)

### Credits
- [Mod Configuration Menu](https://wiki.bg3.community/Tutorials/Mod-Frameworks/mod-configuration-menu) documentation;
- [BG3 Modding Comunity](https://wiki.bg3.community/) Wiki;
- [Baldur's Gate 3 Wiki: Modding](https://bg3.wiki/wiki/Modding:Modding);
- Life savings, old, reddit posts;
- An earlier version of [Gold Digger](https://www.nexusmods.com/baldursgate3/mods/2225) mod, for the logic to check and manipulate gold from the party;
- Microsoft Copilot (for most of the code in the .lua file, once I found the right working ideas in the above links).
