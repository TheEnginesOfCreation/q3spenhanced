code
proc Mutators_SetMenuItems 16 4
file "../ui_mutators.c"
line 32
;1:#include "ui_local.h"
;2:
;3:
;4:#define ART_FRAMEL				"menu/art/frame2_l"
;5:#define ART_FRAMER				"menu/art/frame1_r"
;6:#define ART_BACK0				"menu/art/back_0"
;7:#define ART_BACK1				"menu/art/back_1"
;8:
;9:#define MUTATORS_X_POS		360
;10:
;11:#define ID_MACHINEGUNONLY		MT_MACHINEGUNONLY
;12:#define ID_INSTAGIB				MT_INSTAGIB
;13:
;14:#define ID_BACK					99
;15:
;16:typedef struct {
;17:	menuframework_s		menu;
;18:
;19:	menutext_s			banner;
;20:	menubitmap_s		framel;
;21:	menubitmap_s		framer;
;22:	
;23:	menuradiobutton_s	machinegunonly;
;24:	menuradiobutton_s	instagib;
;25:	menuradiobutton_s	resetscoreafterdeath;
;26:
;27:	menubitmap_s		back;
;28:} mutators_t;
;29:
;30:static mutators_t s_mutators;
;31:
;32:static void Mutators_SetMenuItems( void ) {
line 33
;33:	int value = trap_Cvar_VariableValue("g_mutators");
ADDRGP4 $70
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 35
;34:
;35:	s_mutators.machinegunonly.curvalue = (value & MT_MACHINEGUNONLY) != 0;
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $74
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $75
ADDRGP4 s_mutators+536+60
ADDRLP4 8
INDIRI4
ASGNI4
line 36
;36:	s_mutators.instagib.curvalue = (value & MT_INSTAGIB) != 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $79
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $80
JUMPV
LABELV $79
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $80
ADDRGP4 s_mutators+600+60
ADDRLP4 12
INDIRI4
ASGNI4
line 37
;37:}
LABELV $69
endproc Mutators_SetMenuItems 16 4
proc Mutators_UpdateCvar 8 8
line 39
;38:
;39:static void Mutators_UpdateCvar( int id ) {
line 40
;40:	int value = trap_Cvar_VariableValue("g_mutators");
ADDRGP4 $70
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 42
;41:
;42:	if ( value & id )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $82
line 43
;43:		value -= id;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $82
line 44
;44:	else {
line 45
;45:		value += id;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 48
;46:
;47:		//make sure "machinegun only" and "instagib" are mutually exclusive
;48:		if ( id == MT_MACHINEGUNONLY && (value & MT_INSTAGIB) ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $84
line 49
;49:			value -= MT_INSTAGIB;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 50
;50:			s_mutators.instagib.curvalue = 0;
ADDRGP4 s_mutators+600+60
CNSTI4 0
ASGNI4
line 51
;51:		}
LABELV $84
line 52
;52:		if ( id == MT_INSTAGIB && (value & MT_MACHINEGUNONLY) ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $88
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $88
line 53
;53:			value -= MT_MACHINEGUNONLY;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 54
;54:			s_mutators.machinegunonly.curvalue = 0;
ADDRGP4 s_mutators+536+60
CNSTI4 0
ASGNI4
line 55
;55:		}
LABELV $88
line 56
;56:	}
LABELV $83
line 58
;57:
;58:	trap_Cvar_SetValue("g_mutators", value);
ADDRGP4 $70
ARGP4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 59
;59:}
LABELV $81
endproc Mutators_UpdateCvar 8 8
proc Mutators_Event 4 4
line 61
;60:
;61:static void Mutators_Event( void* ptr, int notification ) {
line 64
;62:	int id;
;63:
;64:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $93
line 65
;65:		return;
ADDRGP4 $92
JUMPV
LABELV $93
line 68
;66:	}
;67:
;68:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 70
;69:
;70:	switch( id ) {
ADDRLP4 0
INDIRI4
CNSTI4 99
EQI4 $97
ADDRGP4 $95
JUMPV
LABELV $97
line 72
;71:		case ID_BACK:
;72:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 73
;73:			break;
ADDRGP4 $96
JUMPV
LABELV $95
line 76
;74:		
;75:		default:
;76:			Mutators_UpdateCvar(id);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Mutators_UpdateCvar
CALLV
pop
line 77
;77:			break;
LABELV $96
line 79
;78:	}
;79:}
LABELV $92
endproc Mutators_Event 4 4
proc Mutators_MenuInit 4 12
line 81
;80:
;81:static void Mutators_MenuInit( void ) {
line 84
;82:	int				y;
;83:
;84:	memset( &s_mutators, 0, sizeof(mutators_t) );
ADDRGP4 s_mutators
ARGP4
CNSTI4 0
ARGI4
CNSTI4 816
ARGI4
ADDRGP4 memset
CALLP4
pop
line 86
;85:
;86:	Mutators_Cache();
ADDRGP4 Mutators_Cache
CALLV
pop
line 88
;87:
;88:	s_mutators.menu.wrapAround = qtrue;
ADDRGP4 s_mutators+276
CNSTI4 1
ASGNI4
line 89
;89:	s_mutators.menu.fullscreen = qtrue;
ADDRGP4 s_mutators+280
CNSTI4 1
ASGNI4
line 91
;90:
;91:	s_mutators.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_mutators+288
CNSTI4 10
ASGNI4
line 92
;92:	s_mutators.banner.generic.x		= 320;
ADDRGP4 s_mutators+288+12
CNSTI4 320
ASGNI4
line 93
;93:	s_mutators.banner.generic.y		= 16;
ADDRGP4 s_mutators+288+16
CNSTI4 16
ASGNI4
line 94
;94:	s_mutators.banner.string		= "MUTATORS";
ADDRGP4 s_mutators+288+60
ADDRGP4 $108
ASGNP4
line 95
;95:	s_mutators.banner.color         = color_white;
ADDRGP4 s_mutators+288+68
ADDRGP4 color_white
ASGNP4
line 96
;96:	s_mutators.banner.style         = UI_CENTER;
ADDRGP4 s_mutators+288+64
CNSTI4 1
ASGNI4
line 98
;97:
;98:	s_mutators.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mutators+360
CNSTI4 6
ASGNI4
line 99
;99:	s_mutators.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_mutators+360+4
ADDRGP4 $116
ASGNP4
line 100
;100:	s_mutators.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_mutators+360+44
CNSTU4 16384
ASGNU4
line 101
;101:	s_mutators.framel.generic.x		= 0;
ADDRGP4 s_mutators+360+12
CNSTI4 0
ASGNI4
line 102
;102:	s_mutators.framel.generic.y		= 78;
ADDRGP4 s_mutators+360+16
CNSTI4 78
ASGNI4
line 103
;103:	s_mutators.framel.width  		= 256;
ADDRGP4 s_mutators+360+76
CNSTI4 256
ASGNI4
line 104
;104:	s_mutators.framel.height  		 = 329;
ADDRGP4 s_mutators+360+80
CNSTI4 329
ASGNI4
line 106
;105:
;106:	s_mutators.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mutators+448
CNSTI4 6
ASGNI4
line 107
;107:	s_mutators.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_mutators+448+4
ADDRGP4 $130
ASGNP4
line 108
;108:	s_mutators.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_mutators+448+44
CNSTU4 16384
ASGNU4
line 109
;109:	s_mutators.framer.generic.x		= 376;
ADDRGP4 s_mutators+448+12
CNSTI4 376
ASGNI4
line 110
;110:	s_mutators.framer.generic.y		= 76;
ADDRGP4 s_mutators+448+16
CNSTI4 76
ASGNI4
line 111
;111:	s_mutators.framer.width  		= 256;
ADDRGP4 s_mutators+448+76
CNSTI4 256
ASGNI4
line 112
;112:	s_mutators.framer.height  		= 334;
ADDRGP4 s_mutators+448+80
CNSTI4 334
ASGNI4
line 115
;113:
;114:	//machinegun only
;115:	y = 144;
ADDRLP4 0
CNSTI4 144
ASGNI4
line 116
;116:	s_mutators.machinegunonly.generic.type        = MTYPE_RADIOBUTTON;
ADDRGP4 s_mutators+536
CNSTI4 5
ASGNI4
line 117
;117:	s_mutators.machinegunonly.generic.name	      = "Machinegun only:";
ADDRGP4 s_mutators+536+4
ADDRGP4 $144
ASGNP4
line 118
;118:	s_mutators.machinegunonly.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mutators+536+44
CNSTU4 258
ASGNU4
line 119
;119:	s_mutators.machinegunonly.generic.callback    = Mutators_Event;
ADDRGP4 s_mutators+536+48
ADDRGP4 Mutators_Event
ASGNP4
line 120
;120:	s_mutators.machinegunonly.generic.id          = ID_MACHINEGUNONLY;
ADDRGP4 s_mutators+536+8
CNSTI4 1
ASGNI4
line 121
;121:	s_mutators.machinegunonly.generic.x	          = MUTATORS_X_POS;
ADDRGP4 s_mutators+536+12
CNSTI4 360
ASGNI4
line 122
;122:	s_mutators.machinegunonly.generic.y	          = y;
ADDRGP4 s_mutators+536+16
ADDRLP4 0
INDIRI4
ASGNI4
line 125
;123:
;124:	//instagib
;125:	y += BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 126
;126:	s_mutators.instagib.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 s_mutators+600
CNSTI4 5
ASGNI4
line 127
;127:	s_mutators.instagib.generic.name		= "Instagib:";
ADDRGP4 s_mutators+600+4
ADDRGP4 $158
ASGNP4
line 128
;128:	s_mutators.instagib.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mutators+600+44
CNSTU4 258
ASGNU4
line 129
;129:	s_mutators.instagib.generic.callback	= Mutators_Event;
ADDRGP4 s_mutators+600+48
ADDRGP4 Mutators_Event
ASGNP4
line 130
;130:	s_mutators.instagib.generic.id			= ID_INSTAGIB;
ADDRGP4 s_mutators+600+8
CNSTI4 2
ASGNI4
line 131
;131:	s_mutators.instagib.generic.x			= MUTATORS_X_POS;
ADDRGP4 s_mutators+600+12
CNSTI4 360
ASGNI4
line 132
;132:	s_mutators.instagib.generic.y			= y;
ADDRGP4 s_mutators+600+16
ADDRLP4 0
INDIRI4
ASGNI4
line 134
;133:
;134:	s_mutators.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mutators+728
CNSTI4 6
ASGNI4
line 135
;135:	s_mutators.back.generic.name		= ART_BACK0;
ADDRGP4 s_mutators+728+4
ADDRGP4 $172
ASGNP4
line 136
;136:	s_mutators.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mutators+728+44
CNSTU4 260
ASGNU4
line 137
;137:	s_mutators.back.generic.callback	= Mutators_Event;
ADDRGP4 s_mutators+728+48
ADDRGP4 Mutators_Event
ASGNP4
line 138
;138:	s_mutators.back.generic.id			= ID_BACK;
ADDRGP4 s_mutators+728+8
CNSTI4 99
ASGNI4
line 139
;139:	s_mutators.back.generic.x			= 0;
ADDRGP4 s_mutators+728+12
CNSTI4 0
ASGNI4
line 140
;140:	s_mutators.back.generic.y			= 480-64;
ADDRGP4 s_mutators+728+16
CNSTI4 416
ASGNI4
line 141
;141:	s_mutators.back.width				= 128;
ADDRGP4 s_mutators+728+76
CNSTI4 128
ASGNI4
line 142
;142:	s_mutators.back.height				= 64;
ADDRGP4 s_mutators+728+80
CNSTI4 64
ASGNI4
line 143
;143:	s_mutators.back.focuspic			= ART_BACK1;
ADDRGP4 s_mutators+728+60
ADDRGP4 $189
ASGNP4
line 145
;144:
;145:	Menu_AddItem( &s_mutators.menu, &s_mutators.banner );
ADDRGP4 s_mutators
ARGP4
ADDRGP4 s_mutators+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 146
;146:	Menu_AddItem( &s_mutators.menu, &s_mutators.framel );
ADDRGP4 s_mutators
ARGP4
ADDRGP4 s_mutators+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 147
;147:	Menu_AddItem( &s_mutators.menu, &s_mutators.framer );
ADDRGP4 s_mutators
ARGP4
ADDRGP4 s_mutators+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 149
;148:	
;149:	Menu_AddItem( &s_mutators.menu, &s_mutators.machinegunonly );
ADDRGP4 s_mutators
ARGP4
ADDRGP4 s_mutators+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 150
;150:	Menu_AddItem( &s_mutators.menu, &s_mutators.instagib );
ADDRGP4 s_mutators
ARGP4
ADDRGP4 s_mutators+600
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 151
;151:	Menu_AddItem( &s_mutators.menu, &s_mutators.back );
ADDRGP4 s_mutators
ARGP4
ADDRGP4 s_mutators+728
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 153
;152:
;153:	Mutators_SetMenuItems();
ADDRGP4 Mutators_SetMenuItems
CALLV
pop
line 154
;154:}
LABELV $98
endproc Mutators_MenuInit 4 12
export Mutators_Cache
proc Mutators_Cache 0 4
line 157
;155:
;156:
;157:void Mutators_Cache( void ) {
line 158
;158:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $116
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 159
;159:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $130
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 160
;160:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $172
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 161
;161:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $189
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 162
;162:}
LABELV $196
endproc Mutators_Cache 0 4
export UI_MutatorsMenu
proc UI_MutatorsMenu 0 4
line 164
;163:
;164:void UI_MutatorsMenu( void ) {
line 165
;165:	Mutators_MenuInit();
ADDRGP4 Mutators_MenuInit
CALLV
pop
line 166
;166:	UI_PushMenu( &s_mutators.menu );
ADDRGP4 s_mutators
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 167
;167:}
LABELV $197
endproc UI_MutatorsMenu 0 4
bss
align 4
LABELV s_mutators
skip 816
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import Scores_Cache
import UI_ScoresMenu
import EPSkill_Cache
import EPMenu_Cache
import UI_EPLevelMenu
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_ochre
import color_dim
import color_red
import color_orange
import color_lightBlue
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForBackpack
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import COM_LoadLevelScores
import COM_CalculatePlayerScore
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $189
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $172
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $158
byte 1 73
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 105
byte 1 98
byte 1 58
byte 1 0
align 1
LABELV $144
byte 1 77
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $130
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $116
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $108
byte 1 77
byte 1 85
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $70
byte 1 103
byte 1 95
byte 1 109
byte 1 117
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 0
