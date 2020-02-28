/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Foobar; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
//
#include "ui_local.h"

void UI_SPArena_Start(const char* arenaInfo) {
	char map[MAX_INFO_VALUE];
	int		level;
	int		n;
	char txt[MAX_INFO_VALUE];
	char type[MAX_INFO_VALUE];
	int fraglimit = 0;
	int capturelimit = 0;
	int timelimit = 0;

	char			key[MAX_INFO_KEY];
	char			value[MAX_INFO_VALUE];

	n = (int)trap_Cvar_VariableValue("sv_maxclients");
	if (n < 8) {
		trap_Cvar_SetValue("sv_maxclients", 8);
	}

	while (arenaInfo) {
		Info_NextPair(&arenaInfo, key, value);
		if (!key[0]) {
			break;
		}

		//trap_Print(va("%s => %s\n", key, value));

		if (!strcmp(key, "num")) {
			level = atoi(value);
			trap_Cvar_SetValue("ui_spSelection", level);
		}

		if (!strcmp(key, "special")) {
			strcpy(txt, value);
			if (txt[0]) {
				if (Q_stricmp(txt, "training") == 0) {
					level = -4;
				}
				else if (Q_stricmp(txt, "final") == 0) {
					level = UI_GetNumSPTiers() * ARENAS_PER_TIER;
				}
			}
		}

		if (!strcmp(key, "map")) {
			strcpy(map, value);
		}

		if (!strcmp(key, "type")) {
			strcpy(type, value);
		}

		if (!strcmp(key, "fraglimit")) {
			fraglimit = atoi(value);
		}

		if (!strcmp(key, "capturelimit")) {
			capturelimit = atoi(value);
		}

		if (!strcmp(key, "timelimit")) {
			timelimit = atoi(value);
		}
	}
	
	trap_Cvar_SetValue("fraglimit", fraglimit);
	trap_Cvar_SetValue("capturelimit", capturelimit);
	trap_Cvar_SetValue("timelimit", timelimit);

	if (strstr(type, "single")) {
		trap_Cvar_SetValue("g_gametype", GT_SINGLE_PLAYER);
		trap_Cmd_ExecuteText(EXEC_APPEND, va("spmap %s\n", map));
	} else if (strstr(type, "spt")) {
		trap_Cvar_SetValue("g_friendlyFire", 1);
		UI_Emulate_SPMap(GT_SINGLE_PLAYER_TEAM, map);
	} else if (strstr(type, "spc")) {
		trap_Cvar_SetValue("g_friendlyFire", 0);
		UI_Emulate_SPMap(GT_SINGLE_PLAYER_CTF, map);
	} else {
		trap_Print("^1No SP gametype found in arenaInfo!\n");
		return;
	}
}

void UI_Emulate_SPMap(gametype_t gameType, const char* map) {
	trap_Cvar_SetValue("g_gametype", gameType);
	trap_Cvar_SetValue("g_doWarmup", 0);
	trap_Cmd_ExecuteText(EXEC_APPEND, va("map %s\n", map));
}
