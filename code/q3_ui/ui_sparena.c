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

void UI_SPArena_Start( const char *arenaInfo ) {
	char	*map;
	int		level;
	int		n;
	char	*txt;
	char	*type;

	n = (int)trap_Cvar_VariableValue( "sv_maxclients" );
	if ( n < 10 ) {
		trap_Cvar_SetValue( "sv_maxclients", 10 );
	}

	level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
	txt = Info_ValueForKey( arenaInfo, "special" );
	if( txt[0] ) {
		if( Q_stricmp( txt, "training" ) == 0 ) {
			level = -4;
		}
		else if( Q_stricmp( txt, "final" ) == 0 ) {
			level = UI_GetNumSPTiers() * ARENAS_PER_TIER;
		}
	}
	trap_Cvar_SetValue( "ui_spSelection", level );

	map = Info_ValueForKey( arenaInfo, "map" );

	type = Info_ValueForKey(arenaInfo, "type");

	if (strstr(type, "spf")) {
		trap_Cvar_SetValue("g_gametype", GT_SINGLE_PLAYER);
	}
	else if (strstr(type, "spt")) {
		trap_Cvar_SetValue("g_gametype", GT_SINGLE_PLAYER_TEAM);
	}
	else if (strstr(type, "spc")) {
		trap_Cvar_SetValue("g_gametype", GT_SINGLE_PLAYER_CTF);
	}
	else {
		//trap_Print(va("%s\n", arenaInfo));
		trap_Print("^2No SP gametype found in arenaInfo!\n");
		return;
	}

	trap_Cmd_ExecuteText( EXEC_APPEND, va( "map %s\n", map ) );
}
