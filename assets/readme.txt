Q3SPENHANCED v3.1
-----------------

A mod by THE ENGINES OF CREATION for QUAKE III ARENA.

This mod allows you to set up an arenas.txt file that includes TDM, CTF and 1v1 maps as part of the list of single player arenas.
This means you can create your own map packs with single player arena support that include not just FFA maps, but also TDM, CTF and 1v1 maps.

Features:
- Tournament, Team Deathmatch and Capture the Flag modes possible in single player mode.
- Tracking of Capture, Assist and Defense awards in single player mode.
- Single Player level select UI shows gametype for Tournament, TDM and CTF maps.
- Single Player level select UI slightly changed to allow display of new awards.
- In Single Player CTF gametype, the "perfect" award is awarded when the enemy team scores no caps.
- Alternative intermission scoreboard screen in single player TDM and CTF.
- Having only a single tier won't put game into demo mode.
- Unlocked videos and awards are stored under different cvars to make sure progress isn't carried over from baseq3 q3config.cfg files.
- Console command "q3spenhanced" echoes out the version of the q3spenhanced mod that's running.
- New cvar setting cg_drawTimelimit. When set to 1, the time remaining in the match will be displayed in the lower right corner of the screen.
- The cg_drawTimer cvar can now be set to 2 to display the time remaining in the match. When set to 1, or when no timelimit is set, it will display the old timer.
- When clicking the "next" button after finishing a single player arena, the game kicks all bots and loads the next level. The g_spNextLevelDelay cvar (default 500) determines the amount of time (in ms) between kicking the bots and loading the next level. If you are experiencing problems with loading bots for the next level (they don't properly join the game or become invisible) increase the value for this setting.
- Single player progress is stored in a progress.dat file to accomodate large numbers of tiers.

In the single player tournament (1v1) gametype, the player needs to beat each bot in the game in a 1v1 match to complete the arena. Losing a single 1v1 fight automatically results in a complete loss for the player.

This mod can be freely distributed and used as basis for a custom single player arena listing.

A custom arena file should be built using the following syntax:

{
map				"q3ctf1"
longname		"Dueling Keeps"
bots			"mynx ranger sorlag stripe sarge"
capturelimit	3
type			"spc ctf"
}


MAP          : the filename of the bsp file.
LONGNAME     : the full name of the map.
BOTS         : the bots to fight against. In team games, bots are spawned in order, alternating between teams (starting with the opposing team).
FRAGLIMIT    : the fraglimit for FFA and TDM games.
CAPTURELIMIT : the capturelimit for CTF games.
TIMELIMIT    : the timelimit for FFA, TDM or CTF games.
TYPE         : the gametype(s) for this map. For single player arenas, use:
                - "spf" for Free For All
				- "sp1v1" for Tournament
                - "spt" for Team Deathmatch
                - "spc" for Capture the Flag
				note that the "single" gametype is ignored. Use the old "ffa", "tourney", "team" and "ctf" types for multiplayer.
SPECIAL      : use "training" to specify this map is a tier 0 introduction map.
               use "final" to specify this map is a final tier boss map.
               maps with either special indications will be the only map in their respective tiers (like q3dm0 and q3tourney6 in standard Quake 3)

Note that the game will only display tiers that consist of a full 4 maps (other than the special tiers). If a tier does not show up, it means
the game doesn't find four maps to fill up another tier.

Go to https://github.com/TheEnginesOfCreation/q3spenhanced for more information.


Version history
---------------
v3.2 - August 20th, 2021
- Fixed issue causing a level to be marked as completed when losing the match.

v3.1 - August 19th, 2021
- Increased maximum size of arenas.txt to 16384 bytes.
- Single player level progress is stored outside of q3config.cfg now.
- Items with "nosingle" attribute now do spawn in spt, spc and sp1v1 gametypes. Only not in spf gametype.

v2.2 - May 1st, 2020
- Really fixed entities with a "ctf", "team" or "tournament" value for gametype key not spawning in single player modes.
- Fixed entities with a "single" value for gametype not spawning in single player Free For All (spf) gametype.
- Fixed timelimit timer (cg_drawtimelimit) going all wonky in sudden death overtime.

v2.1 - March 27th, 2020
- Cinematics menu only shows videos for available tiers
- Fixed entities with a "ctf", "team" or "tournament" value for gametype key not spawning in single player modes.
- Added cg_drawTimelimit cvar.
- cg_drawtimer can be set to 2 to display time remaining instead.

v2.0 - March 13th, 2020
- Added single player tournament (1v1) mode
- "Perfect" award is now awarded in SP CTF mode when the enemy team has not scored any caps
- Single player progress, awards and unlocked cinematics are stored in a different cvar so that progress from a baseq3 q3config.cfg isn't carried over.

v1.0 - March 6th, 2020
- Added single player CTF mode
- Added single player TDM mode
- Added Capture, Defense and Assist award tracking in SP mode
- Redesigned single player level select screen