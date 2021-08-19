# Q3SPEnhanced
Enhance Quake III Arena single player mode to include Free For All, Tournament, Team Deathmatch and Capture the Flag gametypes.

# Building the project
After checking out, code can be compiled to qvm by running buildall.bat in the code folder.
To build cgame, game or q3_ui projects individually, use the .bat files of the same names in their respective folders.
QVM files will be writting to \quake3\baseq3\vm folder.

# Features so far
- Tournament, Team Deathmatch and Capture the Flag modes possible in single player mode.
- Tracking Capture, Assist and Defense awards in single player mode.
- Single Player level select UI shows gametype for Tournament, TDM and CTF maps.
- Single Player level select UI slightly changed to allow display of new awards.
- In Single Player CTF gametype, the "perfect" award is awarded when the enemy team scores no caps.
- Alternative intermission screen in single player TDM and CTF.
- Added example arenas.txt
- Having only a single tier won't put game into demo mode.
- Single player progress, scores and unlocked videos are stored under different cvar to make sure progress isn't carried over from baseq3 q3config.cfg files.
- Console command "q3spenhanced" echoes out the version of the q3spenhanced mod that's running.
- When clicking the "next" button after finishing a single player arena, the game kicks all bots and loads the next level. The g_spNextLevelDelay cvar (default 500) determines the amount of time (in ms) between kicking the bots and loading the next level. If you are experiencing problems with loading bots for the next level (they don't properly join the game or become invisible) increase the value for this setting.
- New cvar setting cg_drawTimelimit. When set to 1, the time remaining in the match will be displayed in the lower right corner of the screen.
- The cg_drawTimer cvar can now be set to 2 to display the time remaining in the match. When set to 1, or when no timelimit is set, it will display the old timer.

In the single player tournament (1v1) gametype, the player needs to beat each bot in the game in a 1v1 match to complete the arena. Losing a single 1v1 fight automatically results in a complete loss for the player.

# How to use
Once compiled, include the QVM files in a PK3 file together with the following:
- All of the assets.
- A custom arenas.txt file. This file can be created in the same way as the arenas.txt found in baseq3\pak0.pk3. The only difference is that in the "type" attribute, include the strings "spf" for single player free for all, "sp1v1" for single player tournament, "spt" for single player team deathmatch or "spc" for single player CTF. The "single" type is ignored in q3spenhanced. In team game modes, bots are spawned in order but alternate between the teams, starting off with the opposing team. Additionally, capturelimit and timelimit can be set through arenas.txt as well.
- It's also possible to download the release package (see "Downloads" below), customize that and re-package it as a new mod.

# Backwards compatibility
Version 3.1 and onwards are not compatible with older versions of the mod due to a change in the way the mod saves level progress. If you have released a mappack with a previous version of q3spenhanced, it is not possible to update the mappack to version 3.1 of the mod without players losing all their level progress.

# Downloads
The latest release (3.1) can be downloaded here: https://github.com/TheEnginesOfCreation/q3spenhanced/releases/tag/3.1
Because it contains an example arenas.txt, the mod can be played as is to get a taste for how things look. The idea is that people can use it to build their own mappacks with it though. To release your own mappack, download this release, customize the arenas.txt that is included and repackage the mod under a different name. It is advised to put the arenas.txt inside a pk3 file when repackaging for release.
Important: because arenas.txt is not inside a pk3 file in this release package, the game might refuse to load it after completing a map if the sv_pure cvar is set to 1. Either Set it to 0 or put arenas.txt inside a pk3 file.
