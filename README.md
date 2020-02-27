# q3spenhanced
Enhance Quake III Arena single player mode to include Free For All, Team Deathmatch and Capture the Flag gametypes.

# building
After checking out, code can be compiled to qvm by running buildall.bat in the code folder.
To build cgame, game or q3_ui projects individually, use the .bat files of the same names in their respective folders.
QVM files will be writting to \quake3\baseq3\vm folder.

# changes so far
- Team Deathmatch and Capture the Flag modes possible in single player mode.
- Tracking Capture, Assist and Defense awards in single player mode.
- Single Player level select UI shows gametype for TDM and CTF maps.
- Single Player level select UI slightly changed to allow display of new awards.

# note
This project is still very much a work in progress and not suitable for actual use yet.

# how to use
Once compiled, include the QVM files in a PK3 file together with the following:
- The q3spenhanced.shader file
- A custom arenas.txt file. This file can be created in the same way as the arenas.txt found in baseq3\pak0.pk3. The only difference is that in the "type" attribute, include the strings "spf" for single player free for all, "spt" for single player team deathmatch or "spc" for single player CTF. The gametype "single" is no longer used. In team game modes, bots are spawned in order but alternate between the teams, starting off with the opposing team.
