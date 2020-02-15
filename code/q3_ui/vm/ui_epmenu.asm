export EPSkill_StartGame
code
proc EPSkill_StartGame 4 8
file "../ui_epmenu.c"
line 121
;1:#include "ui_local.h"
;2:
;3:#define ID_BACK		1
;4:#define ID_NEXT		2
;5:#define ID_PICTURES	3	// 4, 5, 6
;6:#define ID_PREVPAGE 7
;7:#define ID_NEXTPAGE 8
;8:#define ID_SCORES	14
;9:
;10:#define ID_SKILL1 9
;11:#define ID_SKILL2 10
;12:#define ID_SKILL3 11
;13:#define ID_SKILL4 12
;14:#define ID_SKILL5 13
;15:
;16:#define MAX_MAPSPERPAGE	4
;17:#define MAX_MAPCOLS 2
;18:#define MAX_MAPROWS 2
;19:#define MAX_SERVERMAPS	64
;20:#define MAX_NAMELENGTH	64
;21:#define MAX_DESCRIPTIONLINES 10
;22:#define MAX_DESCRIPTIONLINELENGTH 40
;23:#define MAX_DESCRIPTIONLENGTH	MAX_DESCRIPTIONLINES * MAX_DESCRIPTIONLINELENGTH
;24:
;25:#define ART_FRAME					"menu/art/cut_frame"
;26:#define ART_FIGHT0					"menu/art/fight_0"
;27:#define ART_FIGHT1					"menu/art/fight_1"
;28:#define ART_MAP_COMPLETE1			"menu/art/level_complete1"
;29:#define ART_MAP_COMPLETE2			"menu/art/level_complete2"
;30:#define ART_MAP_COMPLETE3			"menu/art/level_complete3"
;31:#define ART_MAP_COMPLETE4			"menu/art/level_complete4"
;32:#define ART_MAP_COMPLETE5			"menu/art/level_complete5"
;33:
;34:#define ART_BACK0		"menu/art/back_0"
;35:#define ART_BACK1		"menu/art/back_1"	
;36:#define ART_NEXT0		"menu/art/next_0"
;37:#define ART_NEXT1		"menu/art/next_1"
;38:#define ART_SCORES0		"menu/art/scores_0"
;39:#define ART_SCORES1		"menu/art/scores_1"
;40:#define ART_FRAMEL		"menu/art/frame2_l"
;41:#define ART_FRAMER		"menu/art/frame1_r"
;42:#define ART_SELECT		"menu/art/maps_select"
;43:#define ART_SELECTED	"menu/art/maps_selected"
;44:#define ART_UNKNOWNMAP	"menu/art/unknownmap"
;45:#define ART_ARROWS		"menu/art/gs_arrows_0"
;46:#define ART_ARROWSL		"menu/art/gs_arrows_l"
;47:#define ART_ARROWSR		"menu/art/gs_arrows_r"
;48:
;49:
;50:typedef struct {
;51:	menuframework_s	menu;
;52:
;53:	menutext_s		banner;
;54:
;55:	menubitmap_s	framel;
;56:	menubitmap_s	framer;
;57:	menubitmap_s	back;
;58:	menubitmap_s	next;
;59:	menubitmap_s	scores;
;60:	menubitmap_s	mappics[MAX_MAPSPERPAGE];
;61:	menubitmap_s	mapbuttons[MAX_MAPSPERPAGE];
;62:	menubitmap_s	arrows;
;63:	menubitmap_s	prevpage;
;64:	menubitmap_s	nextpage;
;65:
;66:	menutext_s		highScoreCaption;
;67:	menutext_s		highScore;
;68:
;69:	menutext_s		versionWarningsRequires[MAX_MAPSPERPAGE];
;70:	menutext_s		versionWarnings[MAX_MAPSPERPAGE];
;71:	menutext_s		versionWarningsVersion[MAX_MAPSPERPAGE];
;72:
;73:	menutext_s		mapLongName;
;74:	menutext_s		mapAuthor;
;75:	menutext_s		mapDescriptionLines[MAX_DESCRIPTIONLINES];
;76:
;77:	char			maplist[MAX_SERVERMAPS][MAX_NAMELENGTH];
;78:	char			mapversions[MAX_SERVERMAPS][MAX_NAMELENGTH];
;79:	char			mapdescriptions[MAX_SERVERMAPS][MAX_DESCRIPTIONLENGTH];
;80:	char			maplongnames[MAX_SERVERMAPS][MAX_DESCRIPTIONLINELENGTH];
;81:	char			mapauthors[MAX_SERVERMAPS][MAX_DESCRIPTIONLINELENGTH];
;82:	int				page;
;83:	int				currentmap;
;84:	int				nummaps;
;85:	int				maxpages;
;86:	int				mapGamebits[MAX_SERVERMAPS];
;87:} epMenuInfo_t;
;88:
;89:char lines[MAX_DESCRIPTIONLINES][MAX_DESCRIPTIONLINELENGTH];
;90:
;91:typedef struct {
;92:	menuframework_s	menu;
;93:
;94:	menutext_s		banner;
;95:	menutext_s		item_skill1;
;96:	menutext_s		item_skill2;
;97:	menutext_s		item_skill3;
;98:	menutext_s		item_skill4;
;99:	menutext_s		item_skill5;
;100:
;101:	menubitmap_s	frame;
;102:	menubitmap_s	back;
;103:	menubitmap_s	next;
;104:	menubitmap_s	art_skillPic;
;105:
;106:	qhandle_t		skillpics[5];
;107:	sfxHandle_t		nightmareSound;
;108:	sfxHandle_t		silenceSound;
;109:} epSkillInfo_t;
;110:
;111:static epMenuInfo_t		epMenuInfo;
;112:static epSkillInfo_t	epSkillInfo;
;113:
;114:/*
;115:===============
;116:EPSkill_StartGame
;117:
;118:Starts the game at the selected skill level
;119:===============
;120:*/
;121:void EPSkill_StartGame( void ) {
line 122
;122:	trap_Cvar_SetValue( "sv_maxclients", 64 );
ADDRGP4 $71
ARGP4
CNSTF4 1115684864
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 123
;123:	trap_Cvar_SetValue( "sv_pure", 0 );
ADDRGP4 $72
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 124
;124:	trap_Cvar_SetValue ("timelimit", 0 );
ADDRGP4 $73
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 125
;125:	trap_Cvar_SetValue ("fraglimit", 0 );
ADDRGP4 $74
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 127
;126:	//trap_Cvar_SetValue ("con_notifytime", 0 );
;127:	trap_Cvar_SetValue ("g_gametype", GT_ENTITYPLUS );
ADDRGP4 $75
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 128
;128:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "map %s\n", epMenuInfo.maplist[epMenuInfo.currentmap] ) );
ADDRGP4 $76
ARGP4
ADDRGP4 epMenuInfo+42556
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 129
;129:}
LABELV $70
endproc EPSkill_StartGame 4 8
export EPSkill_Cache
proc EPSkill_Cache 28 8
line 138
;130:
;131:/*
;132:===============
;133:EPSkill_Cache
;134:
;135:Caches assets
;136:===============
;137:*/
;138:void EPSkill_Cache( void ) {
line 140
;139:	
;140:	trap_R_RegisterShaderNoMip( ART_FRAME );
ADDRGP4 $80
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 141
;141:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $81
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 142
;142:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $82
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 143
;143:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $83
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 144
;144:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $84
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 146
;145:
;146:	epSkillInfo.skillpics[0] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $86
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 epSkillInfo+1072
ADDRLP4 0
INDIRI4
ASGNI4
line 147
;147:	epSkillInfo.skillpics[1] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $89
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 epSkillInfo+1072+4
ADDRLP4 4
INDIRI4
ASGNI4
line 148
;148:	epSkillInfo.skillpics[2] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $92
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 epSkillInfo+1072+8
ADDRLP4 8
INDIRI4
ASGNI4
line 149
;149:	epSkillInfo.skillpics[3] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $95
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 epSkillInfo+1072+12
ADDRLP4 12
INDIRI4
ASGNI4
line 150
;150:	epSkillInfo.skillpics[4] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $98
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 epSkillInfo+1072+16
ADDRLP4 16
INDIRI4
ASGNI4
line 152
;151:
;152:	epSkillInfo.nightmareSound = trap_S_RegisterSound( "sound/misc/nightmare.wav", qfalse );
ADDRGP4 $100
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 epSkillInfo+1092
ADDRLP4 20
INDIRI4
ASGNI4
line 153
;153:	epSkillInfo.silenceSound = trap_S_RegisterSound( "sound/misc/silence.wav", qfalse );
ADDRGP4 $102
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 epSkillInfo+1096
ADDRLP4 24
INDIRI4
ASGNI4
line 154
;154:}
LABELV $79
endproc EPSkill_Cache 28 8
proc EPSkill_SetSkillColor 4 0
line 161
;155:
;156:/*
;157:===============
;158:EPSkill_SetSkillColor
;159:===============
;160:*/
;161:static void EPSkill_SetSkillColor( int skill, vec4_t color ) {
line 162
;162:	switch( skill ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $105
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $105
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $121-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $121
address $106
address $109
address $112
address $115
address $118
code
LABELV $106
line 164
;163:	case 1:
;164:		epSkillInfo.item_skill1.color = color;
ADDRGP4 epSkillInfo+360+68
ADDRFP4 4
INDIRP4
ASGNP4
line 165
;165:		break;
ADDRGP4 $105
JUMPV
LABELV $109
line 167
;166:	case 2:
;167:		epSkillInfo.item_skill2.color = color;
ADDRGP4 epSkillInfo+432+68
ADDRFP4 4
INDIRP4
ASGNP4
line 168
;168:		break;
ADDRGP4 $105
JUMPV
LABELV $112
line 170
;169:	case 3:
;170:		epSkillInfo.item_skill3.color = color;
ADDRGP4 epSkillInfo+504+68
ADDRFP4 4
INDIRP4
ASGNP4
line 171
;171:		break;
ADDRGP4 $105
JUMPV
LABELV $115
line 173
;172:	case 4:
;173:		epSkillInfo.item_skill4.color = color;
ADDRGP4 epSkillInfo+576+68
ADDRFP4 4
INDIRP4
ASGNP4
line 174
;174:		break;
ADDRGP4 $105
JUMPV
LABELV $118
line 176
;175:	case 5:
;176:		epSkillInfo.item_skill5.color = color;
ADDRGP4 epSkillInfo+648+68
ADDRFP4 4
INDIRP4
ASGNP4
line 177
;177:		break;
line 179
;178:	default:
;179:		break;
LABELV $105
line 181
;180:	}
;181:}
LABELV $103
endproc EPSkill_SetSkillColor 4 0
proc EPSkill_MenuEvent 20 8
line 188
;182:
;183:/*
;184:===============
;185:EPMenu_MenuEvent
;186:===============
;187:*/
;188:static void EPSkill_MenuEvent( void* ptr, int event ) {
line 192
;189:	int		id;
;190:	int		skill;
;191:
;192:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $124
line 193
;193:		return;
ADDRGP4 $123
JUMPV
LABELV $124
line 196
;194:	}
;195:
;196:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $126
ADDRLP4 8
INDIRI4
CNSTI4 13
GTI4 $126
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $141-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $141
address $129
address $130
address $126
address $126
address $126
address $126
address $126
address $126
address $131
address $131
address $131
address $131
address $131
code
LABELV $129
line 198
;197:		case ID_BACK:
;198:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 199
;199:			break;
ADDRGP4 $127
JUMPV
LABELV $130
line 202
;200:		
;201:		case ID_NEXT:
;202:			EPSkill_StartGame();
ADDRGP4 EPSkill_StartGame
CALLV
pop
line 203
;203:			break;
ADDRGP4 $127
JUMPV
LABELV $131
line 210
;204:
;205:		case ID_SKILL1:
;206:		case ID_SKILL2:
;207:		case ID_SKILL3:
;208:		case ID_SKILL4:
;209:		case ID_SKILL5:
;210:			EPSkill_SetSkillColor( (int)trap_Cvar_VariableValue( "g_spSkill" ), color_red );
ADDRGP4 $132
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 EPSkill_SetSkillColor
CALLV
pop
line 212
;211:
;212:			id = ((menucommon_s*)ptr)->id;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 213
;213:			skill = id - ID_SKILL1 + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 9
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 214
;214:			trap_Cvar_SetValue( "g_spSkill", skill );
ADDRGP4 $132
ARGP4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 216
;215:
;216:			EPSkill_SetSkillColor( skill, color_white );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 EPSkill_SetSkillColor
CALLV
pop
line 217
;217:			epSkillInfo.art_skillPic.shader = epSkillInfo.skillpics[skill - 1];
ADDRGP4 epSkillInfo+984+68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 epSkillInfo+1072-4
ADDP4
INDIRI4
ASGNI4
line 219
;218:
;219:			if( id == ID_SKILL5 ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $137
line 220
;220:				trap_S_StartLocalSound( epSkillInfo.nightmareSound, CHAN_ANNOUNCER );
ADDRGP4 epSkillInfo+1092
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 221
;221:			}
ADDRGP4 $127
JUMPV
LABELV $137
line 222
;222:			else {
line 223
;223:				trap_S_StartLocalSound( epSkillInfo.silenceSound, CHAN_ANNOUNCER );
ADDRGP4 epSkillInfo+1096
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 224
;224:			}
line 225
;225:			break;
LABELV $126
LABELV $127
line 227
;226:	}
;227:}
LABELV $123
endproc EPSkill_MenuEvent 20 8
export UI_EPSkillMenu
proc UI_EPSkillMenu 12 12
line 236
;228:
;229:/*
;230:===============
;231:UI_EPSkillMenu
;232:
;233:Builds the EntityPlus skill selection menu
;234:===============
;235:*/
;236:void UI_EPSkillMenu( void ) {
line 240
;237:	int skill;
;238:
;239:	//initialize menu
;240:	memset( &epSkillInfo, 0, sizeof(epSkillInfo) );
ADDRGP4 epSkillInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1100
ARGI4
ADDRGP4 memset
CALLP4
pop
line 241
;241:	epSkillInfo.menu.fullscreen = qtrue;
ADDRGP4 epSkillInfo+280
CNSTI4 1
ASGNI4
line 242
;242:	epSkillInfo.menu.wrapAround = qtrue;
ADDRGP4 epSkillInfo+276
CNSTI4 1
ASGNI4
line 245
;243:
;244:	//cache assets
;245:	EPSkill_Cache();
ADDRGP4 EPSkill_Cache
CALLV
pop
line 248
;246:
;247:	//add text banner
;248:	epSkillInfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 epSkillInfo+288
CNSTI4 10
ASGNI4
line 249
;249:	epSkillInfo.banner.generic.x	   = 320;
ADDRGP4 epSkillInfo+288+12
CNSTI4 320
ASGNI4
line 250
;250:	epSkillInfo.banner.generic.y	   = 16;
ADDRGP4 epSkillInfo+288+16
CNSTI4 16
ASGNI4
line 251
;251:	epSkillInfo.banner.string        = "DIFFICULTY";
ADDRGP4 epSkillInfo+288+60
ADDRGP4 $153
ASGNP4
line 252
;252:	epSkillInfo.banner.color         = color_white;
ADDRGP4 epSkillInfo+288+68
ADDRGP4 color_white
ASGNP4
line 253
;253:	epSkillInfo.banner.style         = UI_CENTER;
ADDRGP4 epSkillInfo+288+64
CNSTI4 1
ASGNI4
line 254
;254:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.banner );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 257
;255:
;256:	//add frame
;257:	epSkillInfo.frame.generic.type		= MTYPE_BITMAP;
ADDRGP4 epSkillInfo+720
CNSTI4 6
ASGNI4
line 258
;258:	epSkillInfo.frame.generic.name		= ART_FRAME;
ADDRGP4 epSkillInfo+720+4
ADDRGP4 $80
ASGNP4
line 259
;259:	epSkillInfo.frame.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 epSkillInfo+720+44
CNSTU4 16388
ASGNU4
line 260
;260:	epSkillInfo.frame.generic.x			= 142;
ADDRGP4 epSkillInfo+720+12
CNSTI4 142
ASGNI4
line 261
;261:	epSkillInfo.frame.generic.y			= 118;
ADDRGP4 epSkillInfo+720+16
CNSTI4 118
ASGNI4
line 262
;262:	epSkillInfo.frame.width				= 359;
ADDRGP4 epSkillInfo+720+76
CNSTI4 359
ASGNI4
line 263
;263:	epSkillInfo.frame.height			= 256;
ADDRGP4 epSkillInfo+720+80
CNSTI4 256
ASGNI4
line 264
;264:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.frame );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+720
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 267
;265:
;266:	//add skill level texts
;267:	epSkillInfo.item_skill1.generic.type		= MTYPE_PTEXT;
ADDRGP4 epSkillInfo+360
CNSTI4 9
ASGNI4
line 268
;268:	epSkillInfo.item_skill1.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epSkillInfo+360+44
CNSTU4 264
ASGNU4
line 269
;269:	epSkillInfo.item_skill1.generic.x			= 320;
ADDRGP4 epSkillInfo+360+12
CNSTI4 320
ASGNI4
line 270
;270:	epSkillInfo.item_skill1.generic.y			= 170;
ADDRGP4 epSkillInfo+360+16
CNSTI4 170
ASGNI4
line 271
;271:	epSkillInfo.item_skill1.generic.callback	= EPSkill_MenuEvent;
ADDRGP4 epSkillInfo+360+48
ADDRGP4 EPSkill_MenuEvent
ASGNP4
line 272
;272:	epSkillInfo.item_skill1.generic.id			= ID_SKILL1;
ADDRGP4 epSkillInfo+360+8
CNSTI4 9
ASGNI4
line 273
;273:	epSkillInfo.item_skill1.string				= "Beginner"; // seems more single player-ish
ADDRGP4 epSkillInfo+360+60
ADDRGP4 $186
ASGNP4
line 274
;274:	epSkillInfo.item_skill1.color				= color_red;
ADDRGP4 epSkillInfo+360+68
ADDRGP4 color_red
ASGNP4
line 275
;275:	epSkillInfo.item_skill1.style				= UI_CENTER;
ADDRGP4 epSkillInfo+360+64
CNSTI4 1
ASGNI4
line 276
;276:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.item_skill1 );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 278
;277:
;278:	epSkillInfo.item_skill2.generic.type		= MTYPE_PTEXT;
ADDRGP4 epSkillInfo+432
CNSTI4 9
ASGNI4
line 279
;279:	epSkillInfo.item_skill2.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epSkillInfo+432+44
CNSTU4 264
ASGNU4
line 280
;280:	epSkillInfo.item_skill2.generic.x			= 320;
ADDRGP4 epSkillInfo+432+12
CNSTI4 320
ASGNI4
line 281
;281:	epSkillInfo.item_skill2.generic.y			= 198;
ADDRGP4 epSkillInfo+432+16
CNSTI4 198
ASGNI4
line 282
;282:	epSkillInfo.item_skill2.generic.callback	= EPSkill_MenuEvent;
ADDRGP4 epSkillInfo+432+48
ADDRGP4 EPSkill_MenuEvent
ASGNP4
line 283
;283:	epSkillInfo.item_skill2.generic.id			= ID_SKILL2;
ADDRGP4 epSkillInfo+432+8
CNSTI4 10
ASGNI4
line 284
;284:	epSkillInfo.item_skill2.string				= "Easy";
ADDRGP4 epSkillInfo+432+60
ADDRGP4 $205
ASGNP4
line 285
;285:	epSkillInfo.item_skill2.color				= color_red;
ADDRGP4 epSkillInfo+432+68
ADDRGP4 color_red
ASGNP4
line 286
;286:	epSkillInfo.item_skill2.style				= UI_CENTER;
ADDRGP4 epSkillInfo+432+64
CNSTI4 1
ASGNI4
line 287
;287:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.item_skill2 );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+432
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 289
;288:
;289:	epSkillInfo.item_skill3.generic.type		= MTYPE_PTEXT;
ADDRGP4 epSkillInfo+504
CNSTI4 9
ASGNI4
line 290
;290:	epSkillInfo.item_skill3.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epSkillInfo+504+44
CNSTU4 264
ASGNU4
line 291
;291:	epSkillInfo.item_skill3.generic.x			= 320;
ADDRGP4 epSkillInfo+504+12
CNSTI4 320
ASGNI4
line 292
;292:	epSkillInfo.item_skill3.generic.y			= 227;
ADDRGP4 epSkillInfo+504+16
CNSTI4 227
ASGNI4
line 293
;293:	epSkillInfo.item_skill3.generic.callback	= EPSkill_MenuEvent;
ADDRGP4 epSkillInfo+504+48
ADDRGP4 EPSkill_MenuEvent
ASGNP4
line 294
;294:	epSkillInfo.item_skill3.generic.id			= ID_SKILL3;
ADDRGP4 epSkillInfo+504+8
CNSTI4 11
ASGNI4
line 295
;295:	epSkillInfo.item_skill3.string				= "Medium";
ADDRGP4 epSkillInfo+504+60
ADDRGP4 $224
ASGNP4
line 296
;296:	epSkillInfo.item_skill3.color				= color_red;
ADDRGP4 epSkillInfo+504+68
ADDRGP4 color_red
ASGNP4
line 297
;297:	epSkillInfo.item_skill3.style				= UI_CENTER;
ADDRGP4 epSkillInfo+504+64
CNSTI4 1
ASGNI4
line 298
;298:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.item_skill3 );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 300
;299:
;300:	epSkillInfo.item_skill4.generic.type		= MTYPE_PTEXT;
ADDRGP4 epSkillInfo+576
CNSTI4 9
ASGNI4
line 301
;301:	epSkillInfo.item_skill4.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epSkillInfo+576+44
CNSTU4 264
ASGNU4
line 302
;302:	epSkillInfo.item_skill4.generic.x			= 320;
ADDRGP4 epSkillInfo+576+12
CNSTI4 320
ASGNI4
line 303
;303:	epSkillInfo.item_skill4.generic.y			= 255;
ADDRGP4 epSkillInfo+576+16
CNSTI4 255
ASGNI4
line 304
;304:	epSkillInfo.item_skill4.generic.callback	= EPSkill_MenuEvent;
ADDRGP4 epSkillInfo+576+48
ADDRGP4 EPSkill_MenuEvent
ASGNP4
line 305
;305:	epSkillInfo.item_skill4.generic.id			= ID_SKILL4;
ADDRGP4 epSkillInfo+576+8
CNSTI4 12
ASGNI4
line 306
;306:	epSkillInfo.item_skill4.string				= "Hard";
ADDRGP4 epSkillInfo+576+60
ADDRGP4 $243
ASGNP4
line 307
;307:	epSkillInfo.item_skill4.color				= color_red;
ADDRGP4 epSkillInfo+576+68
ADDRGP4 color_red
ASGNP4
line 308
;308:	epSkillInfo.item_skill4.style				= UI_CENTER;
ADDRGP4 epSkillInfo+576+64
CNSTI4 1
ASGNI4
line 309
;309:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.item_skill4 );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 311
;310:
;311:	epSkillInfo.item_skill5.generic.type		= MTYPE_PTEXT;
ADDRGP4 epSkillInfo+648
CNSTI4 9
ASGNI4
line 312
;312:	epSkillInfo.item_skill5.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epSkillInfo+648+44
CNSTU4 264
ASGNU4
line 313
;313:	epSkillInfo.item_skill5.generic.x			= 320;
ADDRGP4 epSkillInfo+648+12
CNSTI4 320
ASGNI4
line 314
;314:	epSkillInfo.item_skill5.generic.y			= 283;
ADDRGP4 epSkillInfo+648+16
CNSTI4 283
ASGNI4
line 315
;315:	epSkillInfo.item_skill5.generic.callback	= EPSkill_MenuEvent;
ADDRGP4 epSkillInfo+648+48
ADDRGP4 EPSkill_MenuEvent
ASGNP4
line 316
;316:	epSkillInfo.item_skill5.generic.id			= ID_SKILL5;
ADDRGP4 epSkillInfo+648+8
CNSTI4 13
ASGNI4
line 317
;317:	epSkillInfo.item_skill5.string				= "Nightmare";
ADDRGP4 epSkillInfo+648+60
ADDRGP4 $262
ASGNP4
line 318
;318:	epSkillInfo.item_skill5.color				= color_red;
ADDRGP4 epSkillInfo+648+68
ADDRGP4 color_red
ASGNP4
line 319
;319:	epSkillInfo.item_skill5.style				= UI_CENTER;
ADDRGP4 epSkillInfo+648+64
CNSTI4 1
ASGNI4
line 320
;320:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.item_skill5 );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 323
;321:
;322:	//add skillpic
;323:	epSkillInfo.art_skillPic.generic.type		= MTYPE_BITMAP;
ADDRGP4 epSkillInfo+984
CNSTI4 6
ASGNI4
line 324
;324:	epSkillInfo.art_skillPic.generic.flags	= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 epSkillInfo+984+44
CNSTU4 16388
ASGNU4
line 325
;325:	epSkillInfo.art_skillPic.generic.x		= 320-64;
ADDRGP4 epSkillInfo+984+12
CNSTI4 256
ASGNI4
line 326
;326:	epSkillInfo.art_skillPic.generic.y		= 368;
ADDRGP4 epSkillInfo+984+16
CNSTI4 368
ASGNI4
line 327
;327:	epSkillInfo.art_skillPic.width			= 128;
ADDRGP4 epSkillInfo+984+76
CNSTI4 128
ASGNI4
line 328
;328:	epSkillInfo.art_skillPic.height			= 96;
ADDRGP4 epSkillInfo+984+80
CNSTI4 96
ASGNI4
line 329
;329:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.art_skillPic );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+984
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 332
;330:
;331:	//add back button
;332:	epSkillInfo.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 epSkillInfo+808
CNSTI4 6
ASGNI4
line 333
;333:	epSkillInfo.back.generic.name			= ART_BACK0;
ADDRGP4 epSkillInfo+808+4
ADDRGP4 $81
ASGNP4
line 334
;334:	epSkillInfo.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epSkillInfo+808+44
CNSTU4 260
ASGNU4
line 335
;335:	epSkillInfo.back.generic.x				= 0;
ADDRGP4 epSkillInfo+808+12
CNSTI4 0
ASGNI4
line 336
;336:	epSkillInfo.back.generic.y				= 480-64;
ADDRGP4 epSkillInfo+808+16
CNSTI4 416
ASGNI4
line 337
;337:	epSkillInfo.back.generic.callback		= EPSkill_MenuEvent;
ADDRGP4 epSkillInfo+808+48
ADDRGP4 EPSkill_MenuEvent
ASGNP4
line 338
;338:	epSkillInfo.back.generic.id				= ID_BACK;
ADDRGP4 epSkillInfo+808+8
CNSTI4 1
ASGNI4
line 339
;339:	epSkillInfo.back.width					= 128;
ADDRGP4 epSkillInfo+808+76
CNSTI4 128
ASGNI4
line 340
;340:	epSkillInfo.back.height					= 64;
ADDRGP4 epSkillInfo+808+80
CNSTI4 64
ASGNI4
line 341
;341:	epSkillInfo.back.focuspic				= ART_BACK1;
ADDRGP4 epSkillInfo+808+60
ADDRGP4 $82
ASGNP4
line 342
;342:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.back );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 345
;343:
;344:	//add fight button
;345:	epSkillInfo.next.generic.type			= MTYPE_BITMAP;
ADDRGP4 epSkillInfo+896
CNSTI4 6
ASGNI4
line 346
;346:	epSkillInfo.next.generic.name			= ART_FIGHT0;
ADDRGP4 epSkillInfo+896+4
ADDRGP4 $83
ASGNP4
line 347
;347:	epSkillInfo.next.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epSkillInfo+896+44
CNSTU4 272
ASGNU4
line 348
;348:	epSkillInfo.next.generic.x				= 640;
ADDRGP4 epSkillInfo+896+12
CNSTI4 640
ASGNI4
line 349
;349:	epSkillInfo.next.generic.y				= 480-64;
ADDRGP4 epSkillInfo+896+16
CNSTI4 416
ASGNI4
line 350
;350:	epSkillInfo.next.generic.callback		= EPSkill_MenuEvent;
ADDRGP4 epSkillInfo+896+48
ADDRGP4 EPSkill_MenuEvent
ASGNP4
line 351
;351:	epSkillInfo.next.generic.id				= ID_NEXT;
ADDRGP4 epSkillInfo+896+8
CNSTI4 2
ASGNI4
line 352
;352:	epSkillInfo.next.width					= 128;
ADDRGP4 epSkillInfo+896+76
CNSTI4 128
ASGNI4
line 353
;353:	epSkillInfo.next.height					= 64;
ADDRGP4 epSkillInfo+896+80
CNSTI4 64
ASGNI4
line 354
;354:	epSkillInfo.next.focuspic				= ART_FIGHT1;
ADDRGP4 epSkillInfo+896+60
ADDRGP4 $84
ASGNP4
line 355
;355:	Menu_AddItem( &epSkillInfo.menu, &epSkillInfo.next );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 epSkillInfo+896
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 358
;356:
;357:	//highlight the right skill level
;358:	skill = (int)Com_Clamp( 1, 5, trap_Cvar_VariableValue( "g_spSkill" ) );
ADDRGP4 $132
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1065353216
ARGF4
CNSTF4 1084227584
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 359
;359:	EPSkill_SetSkillColor( skill, color_white );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 EPSkill_SetSkillColor
CALLV
pop
line 360
;360:	epSkillInfo.art_skillPic.shader = epSkillInfo.skillpics[skill - 1];
ADDRGP4 epSkillInfo+984+68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 epSkillInfo+1072-4
ADDP4
INDIRI4
ASGNI4
line 361
;361:	if( skill == 5 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $324
line 362
;362:		trap_S_StartLocalSound( epSkillInfo.nightmareSound, CHAN_ANNOUNCER );
ADDRGP4 epSkillInfo+1092
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 363
;363:	}
LABELV $324
line 366
;364:
;365:	//add menu to stack
;366:	UI_PushMenu( &epSkillInfo.menu );
ADDRGP4 epSkillInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 367
;367:}
LABELV $143
endproc UI_EPSkillMenu 12 12
proc EPMenu_MapGametype 16 8
line 378
;368:
;369:
;370:
;371:
;372:/*
;373:=================
;374:EPMenu_MapGametype
;375:=================
;376:*/
;377:
;378:static qboolean EPMenu_MapGametype( char *string ) {
line 382
;379:	char	*p;
;380:	char	*token;
;381:
;382:	p = string;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $329
JUMPV
LABELV $328
line 383
;383:	while( 1 ) {
line 384
;384:		token = COM_ParseExt( &p, qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 385
;385:		if( token[0] == 0 ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $331
line 386
;386:			break;
ADDRGP4 $330
JUMPV
LABELV $331
line 389
;387:		}
;388:
;389:		if( Q_stricmp( token, "entityplus" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $335
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $333
line 390
;390:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $327
JUMPV
LABELV $333
line 392
;391:		}
;392:	}
LABELV $329
line 383
ADDRGP4 $328
JUMPV
LABELV $330
line 394
;393:
;394:	return qfalse;
CNSTI4 0
RETI4
LABELV $327
endproc EPMenu_MapGametype 16 8
export EPMenu_VersionAccepted
proc EPMenu_VersionAccepted 52 8
line 405
;395:}
;396:
;397:/*
;398:===============
;399:EPMenu_VersionAccepted
;400:
;401:Returns true if the mod version supports the features used in the map
;402:char *version : version specified in the map's arena file
;403:===============
;404:*/
;405:qboolean EPMenu_VersionAccepted( char *version ) {
line 406
;406:	if ( strlen( version ) > 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $337
line 409
;407:		if 
;408:		(	
;409:			Q_stricmp( version, "1.0" ) != 0 && 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $341
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $342
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $343
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $345
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $346
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $347
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $348
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $349
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $351
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $339
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $352
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $339
line 422
;410:			Q_stricmp( version, "1.0.1" ) != 0 &&
;411:			Q_stricmp( version, "1.0.2" ) != 0 &&
;412:			Q_stricmp( version, "1.1" ) != 0 &&
;413:			Q_stricmp( version, "1.1.1" ) != 0 &&
;414:			Q_stricmp( version, "1.1.2" ) != 0 &&
;415:			Q_stricmp( version, "1.1.3" ) != 0 &&
;416:			Q_stricmp( version, "1.1.4" ) != 0 &&
;417:			Q_stricmp( version, "1.1.5" ) != 0 &&
;418:			Q_stricmp( version, "1.1.6" ) != 0 &&
;419:			Q_stricmp( version, "1.1.7" ) != 0 &&
;420:			Q_stricmp( version, "1.1.8" ) != 0
;421:		)
;422:		{
line 423
;423:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $336
JUMPV
LABELV $339
line 425
;424:		}
;425:	}
LABELV $337
line 427
;426:
;427:	return qtrue;
CNSTI4 1
RETI4
LABELV $336
endproc EPMenu_VersionAccepted 52 8
bss
align 1
LABELV $354
skip 256
code
proc EPMenu_Update 700 16
line 435
;428:}
;429:
;430:/*
;431:=================
;432:EPMenu_Update
;433:=================
;434:*/
;435:static void EPMenu_Update( void ) {
line 441
;436:	int				i;
;437:	int				top;
;438:	static	char	picname[MAX_MAPSPERPAGE][64];
;439:	highscores_t	highScores;
;440:
;441:	top = epMenuInfo.page*MAX_MAPSPERPAGE;
ADDRLP4 4
ADDRGP4 epMenuInfo+42552
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 444
;442:
;443:	// clear version warnings
;444:	for (i=0; i<MAX_MAPSPERPAGE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $356
line 445
;445:		epMenuInfo.versionWarningsRequires[i].string = "";
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1912+60
ADDP4
ADDRGP4 $362
ASGNP4
line 446
;446:		epMenuInfo.versionWarningsVersion[i].string = "";
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2488+60
ADDP4
ADDRGP4 $362
ASGNP4
line 447
;447:		epMenuInfo.versionWarnings[i].string = "";
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2200+60
ADDP4
ADDRGP4 $362
ASGNP4
line 448
;448:	}
LABELV $357
line 444
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $356
line 451
;449:
;450:	// clear description
;451:	for ( i = 0; i < MAX_DESCRIPTIONLINES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $367
line 452
;452:		strcpy(lines[i], "");
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 lines
ADDP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 453
;453:		epMenuInfo.mapDescriptionLines[i].string = "";
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2920+60
ADDP4
ADDRGP4 $362
ASGNP4
line 454
;454:	}
LABELV $368
line 451
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $367
line 457
;455:
;456:
;457:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $373
line 458
;458:	{
line 459
;459:		if (top+i >= epMenuInfo.nummaps)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 epMenuInfo+42560
INDIRI4
LTI4 $377
line 460
;460:			break;
ADDRGP4 $407
JUMPV
LABELV $377
line 462
;461:
;462:		Com_sprintf( picname[i], sizeof(picname[i]), "levelshots/%s", epMenuInfo.maplist[top+i] );
ADDRLP4 252
CNSTI4 6
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 252
INDIRI4
LSHI4
ADDRGP4 $354
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 252
INDIRI4
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 464
;463:
;464:		epMenuInfo.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 256
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+44
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
ADDRLP4 256
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 465
;465:		epMenuInfo.mappics[i].generic.name   = picname[i];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $354
ADDP4
ASGNP4
line 466
;466:		epMenuInfo.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+68
ADDP4
CNSTI4 0
ASGNI4
line 469
;467:
;468:		// reset
;469:		epMenuInfo.mapbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 264
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+44
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 470
;470:		epMenuInfo.mapbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 268
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+44
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 473
;471:
;472:		// update version warning
;473:		if ( !EPMenu_VersionAccepted( epMenuInfo.mapversions[top+i] ) ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+7736
ADDP4
ARGP4
ADDRLP4 272
ADDRGP4 EPMenu_VersionAccepted
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $392
line 474
;474:			epMenuInfo.versionWarningsRequires[i].string = "Requires";
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1912+60
ADDP4
ADDRGP4 $397
ASGNP4
line 475
;475:			epMenuInfo.versionWarningsVersion[i].string = "version";
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2488+60
ADDP4
ADDRGP4 $400
ASGNP4
line 476
;476:			epMenuInfo.versionWarnings[i].string = epMenuInfo.mapversions[top+i];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2200+60
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+7736
ADDP4
ASGNP4
line 477
;477:		}
LABELV $392
line 478
;478:	}
LABELV $374
line 457
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $373
line 480
;479:
;480:	for (; i<MAX_MAPSPERPAGE; i++)
ADDRGP4 $407
JUMPV
LABELV $404
line 481
;481:	{
line 482
;482:		epMenuInfo.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 248
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+44
ADDP4
ASGNP4
ADDRLP4 248
INDIRP4
ADDRLP4 248
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 483
;483:		epMenuInfo.mappics[i].generic.name   = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+4
ADDP4
CNSTP4 0
ASGNP4
line 484
;484:		epMenuInfo.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+68
ADDP4
CNSTI4 0
ASGNI4
line 487
;485:
;486:		// disable
;487:		epMenuInfo.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 252
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+44
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
ADDRLP4 252
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 488
;488:		epMenuInfo.mapbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 256
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+44
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
ADDRLP4 256
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 489
;489:	}
LABELV $405
line 480
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $407
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $404
line 493
;490:
;491:
;492:	// no servers to start
;493:	if( !epMenuInfo.nummaps ) {
ADDRGP4 epMenuInfo+42560
INDIRI4
CNSTI4 0
NEI4 $418
line 494
;494:		epMenuInfo.next.generic.flags |= QMF_INACTIVE;
ADDRLP4 248
ADDRGP4 epMenuInfo+624+44
ASGNP4
ADDRLP4 248
INDIRP4
ADDRLP4 248
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 495
;495:	}
ADDRGP4 $419
JUMPV
LABELV $418
line 496
;496:	else {
line 498
;497:		// set the highlight
;498:		epMenuInfo.next.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 248
ADDRGP4 epMenuInfo+624+44
ASGNP4
ADDRLP4 248
INDIRP4
ADDRLP4 248
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 499
;499:		i = epMenuInfo.currentmap - top;
ADDRLP4 0
ADDRGP4 epMenuInfo+42556
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 500
;500:		if ( i >=0 && i < MAX_MAPSPERPAGE ) 
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $426
ADDRLP4 0
INDIRI4
CNSTI4 4
GEI4 $426
line 501
;501:		{
line 502
;502:			epMenuInfo.mappics[i].generic.flags    |= QMF_HIGHLIGHT;
ADDRLP4 256
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+44
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
ADDRLP4 256
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 503
;503:			epMenuInfo.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 260
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+44
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 504
;504:		}
LABELV $426
line 507
;505:
;506:		// set the high score
;507:		highScores = COM_LoadLevelScores( epMenuInfo.maplist[epMenuInfo.currentmap] );
ADDRLP4 8
ARGP4
ADDRGP4 epMenuInfo+42556
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRGP4 COM_LoadLevelScores
CALLV
pop
line 508
;508:		strcpy( epMenuInfo.highScore.string, va("%i", highScores.highscores[0].totalScore ) );
ADDRGP4 $436
ARGP4
ADDRLP4 8+44
INDIRI4
ARGI4
ADDRLP4 256
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 epMenuInfo+1840+60
INDIRP4
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 511
;509:
;510:		// set the longname
;511:		if ( strlen(epMenuInfo.maplongnames[epMenuInfo.currentmap]) == 0 )
CNSTI4 40
ADDRGP4 epMenuInfo+42556
INDIRI4
MULI4
ADDRGP4 epMenuInfo+37432
ADDP4
ARGP4
ADDRLP4 260
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $438
line 512
;512:			strcpy( epMenuInfo.mapLongName.string, epMenuInfo.maplist[epMenuInfo.currentmap] );	//display mapname if no longname is specified
ADDRGP4 epMenuInfo+2776+60
INDIRP4
ARGP4
ADDRGP4 epMenuInfo+42556
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $439
JUMPV
LABELV $438
line 514
;513:		else
;514:			strcpy( epMenuInfo.mapLongName.string, epMenuInfo.maplongnames[epMenuInfo.currentmap] );
ADDRGP4 epMenuInfo+2776+60
INDIRP4
ARGP4
CNSTI4 40
ADDRGP4 epMenuInfo+42556
INDIRI4
MULI4
ADDRGP4 epMenuInfo+37432
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $439
line 515
;515:			Q_strupr( epMenuInfo.mapLongName.string );
ADDRGP4 epMenuInfo+2776+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 519
;516:
;517:
;518:		// set the author
;519:		if ( strlen( epMenuInfo.mapauthors[epMenuInfo.currentmap] ) > 0 ) {
CNSTI4 40
ADDRGP4 epMenuInfo+42556
INDIRI4
MULI4
ADDRGP4 epMenuInfo+39992
ADDP4
ARGP4
ADDRLP4 264
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
LEI4 $452
line 520
;520:			strcpy( epMenuInfo.mapAuthor.string, "by: ");
ADDRGP4 epMenuInfo+2848+60
INDIRP4
ARGP4
ADDRGP4 $458
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 521
;521:			strcat( epMenuInfo.mapAuthor.string, epMenuInfo.mapauthors[epMenuInfo.currentmap] );
ADDRGP4 epMenuInfo+2848+60
INDIRP4
ARGP4
CNSTI4 40
ADDRGP4 epMenuInfo+42556
INDIRI4
MULI4
ADDRGP4 epMenuInfo+39992
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 522
;522:		} else {
ADDRGP4 $453
JUMPV
LABELV $452
line 523
;523:			strcpy( epMenuInfo.mapAuthor.string, "");
ADDRGP4 epMenuInfo+2848+60
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 524
;524:		}
LABELV $453
line 527
;525:
;526:		// set the description
;527:		if ( strlen( epMenuInfo.mapdescriptions[epMenuInfo.currentmap] ) ) {
CNSTI4 400
ADDRGP4 epMenuInfo+42556
INDIRI4
MULI4
ADDRGP4 epMenuInfo+11832
ADDP4
ARGP4
ADDRLP4 268
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $465
line 529
;528:			char desc[MAX_DESCRIPTIONLENGTH];
;529:			int spaceIndex, prevSpaceIndex = 0;
ADDRLP4 280
CNSTI4 0
ASGNI4
line 530
;530:			int currentLine = 0;
ADDRLP4 688
CNSTI4 0
ASGNI4
line 531
;531:			int lineIndex = 0;
ADDRLP4 272
CNSTI4 0
ASGNI4
line 534
;532:			char c[2];
;533:
;534:			Q_strncpyz(desc, epMenuInfo.mapdescriptions[epMenuInfo.currentmap], sizeof(desc));
ADDRLP4 288
ARGP4
ADDRLP4 692
CNSTI4 400
ASGNI4
ADDRLP4 692
INDIRI4
ADDRGP4 epMenuInfo+42556
INDIRI4
MULI4
ADDRGP4 epMenuInfo+11832
ADDP4
ARGP4
ADDRLP4 692
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 536
;535:
;536:			for ( i = 0; i < MAX_DESCRIPTIONLENGTH; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $471
line 537
;537:				c[0] = desc[i];
ADDRLP4 276
ADDRLP4 0
INDIRI4
ADDRLP4 288
ADDP4
INDIRI1
ASGNI1
line 538
;538:				c[1] = '\0';
ADDRLP4 276+1
CNSTI1 0
ASGNI1
line 540
;539:
;540:				if ( c[0] == ' ' && lineIndex < MAX_DESCRIPTIONLINELENGTH ) {
ADDRLP4 276
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $476
ADDRLP4 272
INDIRI4
CNSTI4 40
GEI4 $476
line 541
;541:					spaceIndex = i;
ADDRLP4 284
ADDRLP4 0
INDIRI4
ASGNI4
line 542
;542:				}
LABELV $476
line 544
;543:
;544:				if (lineIndex == MAX_DESCRIPTIONLINELENGTH) {
ADDRLP4 272
INDIRI4
CNSTI4 40
NEI4 $478
line 545
;545:					if (spaceIndex - prevSpaceIndex <= 0) {
ADDRLP4 284
INDIRI4
ADDRLP4 280
INDIRI4
SUBI4
CNSTI4 0
GTI4 $480
line 546
;546:						strcat(lines[currentLine-1], &desc[prevSpaceIndex-1]);
CNSTI4 40
ADDRLP4 688
INDIRI4
MULI4
ADDRGP4 lines-40
ADDP4
ARGP4
ADDRLP4 280
INDIRI4
ADDRLP4 288-1
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 547
;547:						break;
ADDRGP4 $473
JUMPV
LABELV $480
line 548
;548:					} else {
line 549
;549:						Q_strncpyz(lines[currentLine], &desc[prevSpaceIndex], (spaceIndex - prevSpaceIndex) + 1);
CNSTI4 40
ADDRLP4 688
INDIRI4
MULI4
ADDRGP4 lines
ADDP4
ARGP4
ADDRLP4 280
INDIRI4
ADDRLP4 288
ADDP4
ARGP4
ADDRLP4 284
INDIRI4
ADDRLP4 280
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 550
;550:					}
line 551
;551:					prevSpaceIndex = spaceIndex;
ADDRLP4 280
ADDRLP4 284
INDIRI4
ASGNI4
line 552
;552:					prevSpaceIndex++;
ADDRLP4 280
ADDRLP4 280
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 553
;553:					i = spaceIndex;
ADDRLP4 0
ADDRLP4 284
INDIRI4
ASGNI4
line 554
;554:					lineIndex = -1;
ADDRLP4 272
CNSTI4 -1
ASGNI4
line 555
;555:					currentLine++;
ADDRLP4 688
ADDRLP4 688
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 556
;556:				}
LABELV $478
line 557
;557:				lineIndex++;
ADDRLP4 272
ADDRLP4 272
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 558
;558:			}
LABELV $472
line 536
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 400
LTI4 $471
LABELV $473
line 560
;559:
;560:			for ( i = 0; i < MAX_DESCRIPTIONLINES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $484
line 561
;561:				epMenuInfo.mapDescriptionLines[i].string = lines[i];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2920+60
ADDP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 lines
ADDP4
ASGNP4
line 562
;562:			}
LABELV $485
line 560
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $484
line 563
;563:		} else {
ADDRGP4 $466
JUMPV
LABELV $465
line 564
;564:			epMenuInfo.mapDescriptionLines[0].string = "no description available...";
ADDRGP4 epMenuInfo+2920+60
ADDRGP4 $492
ASGNP4
line 565
;565:		}
LABELV $466
line 567
;566:		
;567:	}
LABELV $419
line 568
;568:}
LABELV $353
endproc EPMenu_Update 700 16
proc EPMenu_GametypeFilter 72 12
line 576
;569:
;570:
;571:/*
;572:=================
;573:EPMenu_GametypeEvent
;574:=================
;575:*/
;576:static void EPMenu_GametypeFilter( void ) {
line 583
;577:	int			i;
;578:	int			count;
;579:	int			gamebits;
;580:	const char	*info;
;581:	qboolean	show;
;582:
;583:	show = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 584
;584:	count = UI_GetNumArenas();
ADDRLP4 20
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 585
;585:	epMenuInfo.nummaps = 0;
ADDRGP4 epMenuInfo+42560
CNSTI4 0
ASGNI4
line 586
;586:	for( i = 0; i < count; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $498
JUMPV
LABELV $495
line 587
;587:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 589
;588:
;589:		show = EPMenu_MapGametype( Info_ValueForKey( info, "type") );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $499
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 EPMenu_MapGametype
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 590
;590:		if ( !show )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $500
line 591
;591:			continue;
ADDRGP4 $496
JUMPV
LABELV $500
line 593
;592:
;593:		Q_strncpyz( epMenuInfo.maplist[epMenuInfo.nummaps], Info_ValueForKey( info, "map" ), MAX_NAMELENGTH );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $504
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 epMenuInfo+42560
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 594
;594:		Q_strupr( epMenuInfo.maplist[epMenuInfo.nummaps] );
ADDRGP4 epMenuInfo+42560
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 595
;595:		Q_strncpyz( epMenuInfo.mapversions[epMenuInfo.nummaps], Info_ValueForKey( info, "minversion" ), MAX_NAMELENGTH);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $509
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 epMenuInfo+42560
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+7736
ADDP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 596
;596:		Q_strncpyz( epMenuInfo.mapdescriptions[epMenuInfo.nummaps], Info_ValueForKey( info, "description" ), MAX_DESCRIPTIONLENGTH);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $512
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
CNSTI4 400
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 epMenuInfo+42560
INDIRI4
MULI4
ADDRGP4 epMenuInfo+11832
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 597
;597:		Q_strncpyz( epMenuInfo.maplongnames[epMenuInfo.nummaps], Info_ValueForKey( info, "longname" ), MAX_DESCRIPTIONLINELENGTH);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $515
ARGP4
ADDRLP4 52
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
CNSTI4 40
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 epMenuInfo+42560
INDIRI4
MULI4
ADDRGP4 epMenuInfo+37432
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 598
;598:		Q_strncpyz( epMenuInfo.mapauthors[epMenuInfo.nummaps], Info_ValueForKey( info, "author" ), MAX_DESCRIPTIONLINELENGTH);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $518
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 64
CNSTI4 40
ASGNI4
ADDRLP4 64
INDIRI4
ADDRGP4 epMenuInfo+42560
INDIRI4
MULI4
ADDRGP4 epMenuInfo+39992
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 599
;599:		epMenuInfo.mapGamebits[epMenuInfo.nummaps] = GT_ENTITYPLUS;
ADDRGP4 epMenuInfo+42560
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 epMenuInfo+42568
ADDP4
CNSTI4 8
ASGNI4
line 600
;600:		epMenuInfo.nummaps++;
ADDRLP4 68
ADDRGP4 epMenuInfo+42560
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 601
;601:	}
LABELV $496
line 586
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $498
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $495
line 602
;602:	epMenuInfo.maxpages = (epMenuInfo.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRGP4 epMenuInfo+42564
ADDRGP4 epMenuInfo+42560
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 24
INDIRI4
DIVI4
ASGNI4
line 603
;603:	epMenuInfo.page = 0;
ADDRGP4 epMenuInfo+42552
CNSTI4 0
ASGNI4
line 604
;604:	epMenuInfo.currentmap = 0;
ADDRGP4 epMenuInfo+42556
CNSTI4 0
ASGNI4
line 606
;605:
;606:	EPMenu_Update();
ADDRGP4 EPMenu_Update
CALLV
pop
line 607
;607:}
LABELV $493
endproc EPMenu_GametypeFilter 72 12
proc EPMenu_MenuEvent 12 4
line 615
;608:
;609:
;610:/*
;611:===============
;612:EPMenu_MenuEvent
;613:===============
;614:*/
;615:static void EPMenu_MenuEvent( void* ptr, int event ) {
line 616
;616:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $527
line 617
;617:		return;
ADDRGP4 $526
JUMPV
LABELV $527
line 620
;618:	}
;619:
;620:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $529
ADDRLP4 0
INDIRI4
CNSTI4 8
GTI4 $548
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $549-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $549
address $532
address $533
address $529
address $529
address $529
address $529
address $534
address $539
code
LABELV $548
ADDRLP4 0
INDIRI4
CNSTI4 14
EQI4 $545
ADDRGP4 $529
JUMPV
LABELV $532
line 622
;621:		case ID_BACK:
;622:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 623
;623:			break;
ADDRGP4 $530
JUMPV
LABELV $533
line 626
;624:		
;625:		case ID_NEXT:
;626:			UI_EPSkillMenu();
ADDRGP4 UI_EPSkillMenu
CALLV
pop
line 627
;627:			break;
ADDRGP4 $530
JUMPV
LABELV $534
line 630
;628:
;629:		case ID_PREVPAGE:
;630:			if( epMenuInfo.page > 0 ) {
ADDRGP4 epMenuInfo+42552
INDIRI4
CNSTI4 0
LEI4 $530
line 631
;631:				epMenuInfo.page--;
ADDRLP4 8
ADDRGP4 epMenuInfo+42552
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 632
;632:				EPMenu_Update();
ADDRGP4 EPMenu_Update
CALLV
pop
line 633
;633:			}
line 634
;634:			break;
ADDRGP4 $530
JUMPV
LABELV $539
line 637
;635:
;636:		case ID_NEXTPAGE:
;637:			if( epMenuInfo.page < epMenuInfo.maxpages - 1 ) {
ADDRGP4 epMenuInfo+42552
INDIRI4
ADDRGP4 epMenuInfo+42564
INDIRI4
CNSTI4 1
SUBI4
GEI4 $530
line 638
;638:				epMenuInfo.page++;
ADDRLP4 8
ADDRGP4 epMenuInfo+42552
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 639
;639:				EPMenu_Update();
ADDRGP4 EPMenu_Update
CALLV
pop
line 640
;640:			}
line 641
;641:			break;
ADDRGP4 $530
JUMPV
LABELV $545
line 644
;642:
;643:		case ID_SCORES:
;644:			UI_ScoresMenu( epMenuInfo.maplist[epMenuInfo.currentmap] );
ADDRGP4 epMenuInfo+42556
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRGP4 UI_ScoresMenu
CALLV
pop
line 645
;645:			break;
LABELV $529
LABELV $530
line 647
;646:	}
;647:}
LABELV $526
endproc EPMenu_MenuEvent 12 4
proc EPMenu_LevelshotDraw 48 20
line 654
;648:
;649:/*
;650:===============
;651:EPMenu_LevelshotDraw
;652:===============
;653:*/
;654:static void EPMenu_LevelshotDraw( void *self ) {
line 662
;655:	menubitmap_s	*b;
;656:	int				x;
;657:	int				y;
;658:	int				w;
;659:	int				h;
;660:	int				n;
;661:
;662:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 664
;663:
;664:	if( !b->generic.name ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $552
line 665
;665:		return;
ADDRGP4 $551
JUMPV
LABELV $552
line 668
;666:	}
;667:
;668:	if( b->generic.name && !b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $554
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $554
line 669
;669:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 670
;670:		if( !b->shader && b->errorpic ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $556
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $556
line 671
;671:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 672
;672:		}
LABELV $556
line 673
;673:	}
LABELV $554
line 675
;674:
;675:	if( b->focuspic && !b->focusshader ) {
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $558
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $558
line 676
;676:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 677
;677:	}
LABELV $558
line 679
;678:
;679:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 680
;680:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 681
;681:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 682
;682:	h =	b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 683
;683:	if( b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $560
line 684
;684:		UI_DrawHandlePic( x, y, w, h, b->shader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 685
;685:	}
LABELV $560
line 687
;686:
;687:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 688
;688:	y = b->generic.y + b->height;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDI4
ASGNI4
line 689
;689:	UI_FillRect( x, y, b->width, 28, colorBlack );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1105199104
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 691
;690:
;691:	x += b->width / 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 692
;692:	y += 4;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 693
;693:	n = epMenuInfo.page * MAX_MAPSPERPAGE + b->generic.id - ID_PICTURES;
ADDRLP4 20
ADDRGP4 epMenuInfo+42552
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
CNSTI4 3
SUBI4
ASGNI4
line 694
;694:	UI_DrawString( x, y, epMenuInfo.maplist[n], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 696
;695:
;696:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 697
;697:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 698
;698:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 699
;699:	h =	b->height + 28;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 700
;700:	if( b->generic.flags & QMF_HIGHLIGHT ) {	
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $564
line 701
;701:		UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 702
;702:	}
LABELV $564
line 703
;703:}
LABELV $551
endproc EPMenu_LevelshotDraw 48 20
proc EPMenu_MapEvent 0 0
line 710
;704:
;705:/*
;706:=================
;707:EPMenu_MapEvent
;708:=================
;709:*/
;710:static void EPMenu_MapEvent( void* ptr, int event ) {
line 711
;711:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $567
line 712
;712:		return;
ADDRGP4 $566
JUMPV
LABELV $567
line 715
;713:	}
;714:
;715:	epMenuInfo.currentmap = (epMenuInfo.page*MAX_MAPSPERPAGE) + (((menucommon_s*)ptr)->id - ID_PICTURES);
ADDRGP4 epMenuInfo+42556
ADDRGP4 epMenuInfo+42552
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 3
SUBI4
ADDI4
ASGNI4
line 716
;716:	EPMenu_Update();
ADDRGP4 EPMenu_Update
CALLV
pop
line 717
;717:}
LABELV $566
endproc EPMenu_MapEvent 0 0
export EPMenu_Cache
proc EPMenu_Cache 92 16
line 726
;718:
;719:/*
;720:===============
;721:EPMenu_Cache
;722:
;723:Caches assets
;724:===============
;725:*/
;726:void EPMenu_Cache( void ) {
line 733
;727:	int			i;
;728:	qboolean	precache;
;729:	char		picname[64];
;730:	const char	*info;
;731:
;732:	//register artwork shaders
;733:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $572
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 734
;734:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $573
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 735
;735:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $81
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 736
;736:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $82
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 737
;737:	trap_R_RegisterShaderNoMip( ART_NEXT0 );
ADDRGP4 $574
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 738
;738:	trap_R_RegisterShaderNoMip( ART_NEXT1 );
ADDRGP4 $575
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 739
;739:	trap_R_RegisterShaderNoMip( ART_SELECT );
ADDRGP4 $576
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 740
;740:	trap_R_RegisterShaderNoMip( ART_SELECTED );
ADDRGP4 $577
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 741
;741:	trap_R_RegisterShaderNoMip( ART_UNKNOWNMAP );
ADDRGP4 $578
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 742
;742:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $579
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 743
;743:	trap_R_RegisterShaderNoMip( ART_ARROWSL );
ADDRGP4 $580
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 744
;744:	trap_R_RegisterShaderNoMip( ART_ARROWSR );
ADDRGP4 $581
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 747
;745:
;746:	//cache maps
;747:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $582
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 76
INDIRF4
CVFI4 4
ASGNI4
line 749
;748:
;749:	epMenuInfo.nummaps = UI_GetNumArenas();
ADDRLP4 80
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRGP4 epMenuInfo+42560
ADDRLP4 80
INDIRI4
ASGNI4
line 751
;750:
;751:	for( i = 0; i < epMenuInfo.nummaps; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $587
JUMPV
LABELV $584
line 752
;752:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRP4
ASGNP4
line 754
;753:
;754:		Q_strncpyz( epMenuInfo.maplist[i], Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $504
ARGP4
ADDRLP4 88
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 755
;755:		Q_strupr( epMenuInfo.maplist[i] );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 756
;756:		epMenuInfo.mapGamebits[i] = GT_ENTITYPLUS;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 epMenuInfo+42568
ADDP4
CNSTI4 8
ASGNI4
line 758
;757:
;758:		if( precache ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $592
line 759
;759:			Com_sprintf( picname, sizeof(picname), "levelshots/%s", epMenuInfo.maplist[i] );
ADDRLP4 8
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 epMenuInfo+3640
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 760
;760:			trap_R_RegisterShaderNoMip(picname);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 761
;761:		}
LABELV $592
line 762
;762:	}
LABELV $585
line 751
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $587
ADDRLP4 0
INDIRI4
ADDRGP4 epMenuInfo+42560
INDIRI4
LTI4 $584
line 764
;763:
;764:	epMenuInfo.maxpages = (epMenuInfo.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
ADDRLP4 84
CNSTI4 4
ASGNI4
ADDRGP4 epMenuInfo+42564
ADDRGP4 epMenuInfo+42560
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 84
INDIRI4
DIVI4
ASGNI4
line 765
;765:}
LABELV $571
endproc EPMenu_Cache 92 16
bss
align 1
LABELV $598
skip 64
align 1
LABELV $599
skip 64
align 1
LABELV $600
skip 40
align 1
LABELV $601
skip 40
export UI_EPLevelMenu
code
proc UI_EPLevelMenu 24 12
line 774
;766:
;767:/*
;768:===============
;769:UI_EPLevelMenu
;770:
;771:Builds the EntityPlus Single Player menu
;772:===============
;773:*/
;774:void UI_EPLevelMenu( void ) {
line 784
;775:	int i;
;776:	int top;
;777:	int x, y;
;778:	static char mapnamebuffer[64];
;779:	static char mapscorebuffer[64];
;780:	static char maplongnamebuffer[MAX_DESCRIPTIONLINELENGTH];
;781:	static char mapauthorbuffer[MAX_DESCRIPTIONLINELENGTH];
;782:
;783:	//initialize menu
;784:	memset( &epMenuInfo, 0, sizeof(epMenuInfo) );
ADDRGP4 epMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 42824
ARGI4
ADDRGP4 memset
CALLP4
pop
line 785
;785:	epMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 epMenuInfo+280
CNSTI4 1
ASGNI4
line 786
;786:	epMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 epMenuInfo+276
CNSTI4 1
ASGNI4
line 789
;787:
;788:	//cache assets
;789:	EPMenu_Cache();
ADDRGP4 EPMenu_Cache
CALLV
pop
line 792
;790:
;791:	//add text banner
;792:	epMenuInfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 epMenuInfo+288
CNSTI4 10
ASGNI4
line 793
;793:	epMenuInfo.banner.generic.x	   = 320;
ADDRGP4 epMenuInfo+288+12
CNSTI4 320
ASGNI4
line 794
;794:	epMenuInfo.banner.generic.y	   = 16;
ADDRGP4 epMenuInfo+288+16
CNSTI4 16
ASGNI4
line 795
;795:	epMenuInfo.banner.string        = "NEW GAME";
ADDRGP4 epMenuInfo+288+60
ADDRGP4 $611
ASGNP4
line 796
;796:	epMenuInfo.banner.color         = color_white;
ADDRGP4 epMenuInfo+288+68
ADDRGP4 color_white
ASGNP4
line 797
;797:	epMenuInfo.banner.style         = UI_CENTER;
ADDRGP4 epMenuInfo+288+64
CNSTI4 1
ASGNI4
line 798
;798:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.banner );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 801
;799:
;800:	//add left frame
;801:	epMenuInfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 epMenuInfo+360
CNSTI4 6
ASGNI4
line 802
;802:	epMenuInfo.framel.generic.name  = ART_FRAMEL;
ADDRGP4 epMenuInfo+360+4
ADDRGP4 $572
ASGNP4
line 803
;803:	epMenuInfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 epMenuInfo+360+44
CNSTU4 16384
ASGNU4
line 804
;804:	epMenuInfo.framel.generic.x	   = 0;  
ADDRGP4 epMenuInfo+360+12
CNSTI4 0
ASGNI4
line 805
;805:	epMenuInfo.framel.generic.y	   = 78;
ADDRGP4 epMenuInfo+360+16
CNSTI4 78
ASGNI4
line 806
;806:	epMenuInfo.framel.width  	   = 256;
ADDRGP4 epMenuInfo+360+76
CNSTI4 256
ASGNI4
line 807
;807:	epMenuInfo.framel.height  	   = 329;
ADDRGP4 epMenuInfo+360+80
CNSTI4 329
ASGNI4
line 811
;808:	//Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.framel );
;809:
;810:	//add right frame
;811:	epMenuInfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 epMenuInfo+448
CNSTI4 6
ASGNI4
line 812
;812:	epMenuInfo.framer.generic.name  = ART_FRAMER;
ADDRGP4 epMenuInfo+448+4
ADDRGP4 $573
ASGNP4
line 813
;813:	epMenuInfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 epMenuInfo+448+44
CNSTU4 16384
ASGNU4
line 814
;814:	epMenuInfo.framer.generic.x	   = 376;
ADDRGP4 epMenuInfo+448+12
CNSTI4 376
ASGNI4
line 815
;815:	epMenuInfo.framer.generic.y	   = 76;
ADDRGP4 epMenuInfo+448+16
CNSTI4 76
ASGNI4
line 816
;816:	epMenuInfo.framer.width  	   = 256;
ADDRGP4 epMenuInfo+448+76
CNSTI4 256
ASGNI4
line 817
;817:	epMenuInfo.framer.height  	   = 334;
ADDRGP4 epMenuInfo+448+80
CNSTI4 334
ASGNI4
line 821
;818:	//Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.framer );
;819:
;820:	//add back button
;821:	epMenuInfo.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 epMenuInfo+536
CNSTI4 6
ASGNI4
line 822
;822:	epMenuInfo.back.generic.name			= ART_BACK0;
ADDRGP4 epMenuInfo+536+4
ADDRGP4 $81
ASGNP4
line 823
;823:	epMenuInfo.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epMenuInfo+536+44
CNSTU4 260
ASGNU4
line 824
;824:	epMenuInfo.back.generic.x				= 0;
ADDRGP4 epMenuInfo+536+12
CNSTI4 0
ASGNI4
line 825
;825:	epMenuInfo.back.generic.y				= 480-64;
ADDRGP4 epMenuInfo+536+16
CNSTI4 416
ASGNI4
line 826
;826:	epMenuInfo.back.generic.callback		= EPMenu_MenuEvent;
ADDRGP4 epMenuInfo+536+48
ADDRGP4 EPMenu_MenuEvent
ASGNP4
line 827
;827:	epMenuInfo.back.generic.id				= ID_BACK;
ADDRGP4 epMenuInfo+536+8
CNSTI4 1
ASGNI4
line 828
;828:	epMenuInfo.back.width					= 128;
ADDRGP4 epMenuInfo+536+76
CNSTI4 128
ASGNI4
line 829
;829:	epMenuInfo.back.height					= 64;
ADDRGP4 epMenuInfo+536+80
CNSTI4 64
ASGNI4
line 830
;830:	epMenuInfo.back.focuspic				= ART_BACK1;
ADDRGP4 epMenuInfo+536+60
ADDRGP4 $82
ASGNP4
line 831
;831:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.back );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 834
;832:
;833:	//add scores button
;834:	epMenuInfo.scores.generic.type			= MTYPE_BITMAP;
ADDRGP4 epMenuInfo+712
CNSTI4 6
ASGNI4
line 835
;835:	epMenuInfo.scores.generic.name			= ART_SCORES0;
ADDRGP4 epMenuInfo+712+4
ADDRGP4 $666
ASGNP4
line 836
;836:	epMenuInfo.scores.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epMenuInfo+712+44
CNSTU4 260
ASGNU4
line 837
;837:	epMenuInfo.scores.generic.x				= (640-128) / 2;
ADDRGP4 epMenuInfo+712+12
CNSTI4 256
ASGNI4
line 838
;838:	epMenuInfo.scores.generic.y				= 480-64;
ADDRGP4 epMenuInfo+712+16
CNSTI4 416
ASGNI4
line 839
;839:	epMenuInfo.scores.generic.callback		= EPMenu_MenuEvent;
ADDRGP4 epMenuInfo+712+48
ADDRGP4 EPMenu_MenuEvent
ASGNP4
line 840
;840:	epMenuInfo.scores.generic.id			= ID_SCORES;
ADDRGP4 epMenuInfo+712+8
CNSTI4 14
ASGNI4
line 841
;841:	epMenuInfo.scores.width					= 128;
ADDRGP4 epMenuInfo+712+76
CNSTI4 128
ASGNI4
line 842
;842:	epMenuInfo.scores.height				= 64;
ADDRGP4 epMenuInfo+712+80
CNSTI4 64
ASGNI4
line 843
;843:	epMenuInfo.scores.focuspic				= ART_SCORES1;
ADDRGP4 epMenuInfo+712+60
ADDRGP4 $683
ASGNP4
line 844
;844:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.scores );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+712
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 847
;845:
;846:	//add next button
;847:	epMenuInfo.next.generic.type			= MTYPE_BITMAP;
ADDRGP4 epMenuInfo+624
CNSTI4 6
ASGNI4
line 848
;848:	epMenuInfo.next.generic.name			= ART_NEXT0;
ADDRGP4 epMenuInfo+624+4
ADDRGP4 $574
ASGNP4
line 849
;849:	epMenuInfo.next.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epMenuInfo+624+44
CNSTU4 272
ASGNU4
line 850
;850:	epMenuInfo.next.generic.x				= 640;
ADDRGP4 epMenuInfo+624+12
CNSTI4 640
ASGNI4
line 851
;851:	epMenuInfo.next.generic.y				= 480-64;
ADDRGP4 epMenuInfo+624+16
CNSTI4 416
ASGNI4
line 852
;852:	epMenuInfo.next.generic.callback		= EPMenu_MenuEvent;
ADDRGP4 epMenuInfo+624+48
ADDRGP4 EPMenu_MenuEvent
ASGNP4
line 853
;853:	epMenuInfo.next.generic.id				= ID_NEXT;
ADDRGP4 epMenuInfo+624+8
CNSTI4 2
ASGNI4
line 854
;854:	epMenuInfo.next.width					= 128;
ADDRGP4 epMenuInfo+624+76
CNSTI4 128
ASGNI4
line 855
;855:	epMenuInfo.next.height					= 64;
ADDRGP4 epMenuInfo+624+80
CNSTI4 64
ASGNI4
line 856
;856:	epMenuInfo.next.focuspic				= ART_NEXT1;
ADDRGP4 epMenuInfo+624+60
ADDRGP4 $575
ASGNP4
line 857
;857:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.next );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 860
;858:
;859:	//add map selectors
;860:	for ( i = 0; i < MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $705
line 861
;861:	{
line 862
;862:		x =	(i % MAX_MAPCOLS) * (128+8) + 16;
ADDRLP4 4
CNSTI4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
MODI4
MULI4
CNSTI4 16
ADDI4
ASGNI4
line 863
;863:		y = (i / MAX_MAPROWS) * (128+8) + 96;
ADDRLP4 8
CNSTI4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
MULI4
CNSTI4 96
ADDI4
ASGNI4
line 865
;864:
;865:		epMenuInfo.mappics[i].generic.type		= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800
ADDP4
CNSTI4 6
ASGNI4
line 866
;866:		epMenuInfo.mappics[i].generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+44
ADDP4
CNSTU4 16388
ASGNU4
line 867
;867:		epMenuInfo.mappics[i].generic.x			= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 868
;868:		epMenuInfo.mappics[i].generic.y			= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 869
;869:		epMenuInfo.mappics[i].generic.id		= ID_PICTURES+i;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 870
;870:		epMenuInfo.mappics[i].width				= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+76
ADDP4
CNSTI4 128
ASGNI4
line 871
;871:		epMenuInfo.mappics[i].height			= 96;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+80
ADDP4
CNSTI4 96
ASGNI4
line 872
;872:		epMenuInfo.mappics[i].focuspic			= ART_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+60
ADDP4
ADDRGP4 $577
ASGNP4
line 873
;873:		epMenuInfo.mappics[i].errorpic			= ART_UNKNOWNMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+64
ADDP4
ADDRGP4 $578
ASGNP4
line 874
;874:		epMenuInfo.mappics[i].generic.ownerdraw	= EPMenu_LevelshotDraw;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800+56
ADDP4
ADDRGP4 EPMenu_LevelshotDraw
ASGNP4
line 875
;875:		Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.mappics[i] );
ADDRGP4 epMenuInfo
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+800
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 877
;876:		
;877:		epMenuInfo.mapbuttons[i].generic.type		= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152
ADDP4
CNSTI4 6
ASGNI4
line 878
;878:		epMenuInfo.mapbuttons[i].generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_NODEFAULTINIT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+44
ADDP4
CNSTU4 33028
ASGNU4
line 879
;879:		epMenuInfo.mapbuttons[i].generic.id			= ID_PICTURES+i;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 880
;880:		epMenuInfo.mapbuttons[i].generic.callback	= EPMenu_MapEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+48
ADDP4
ADDRGP4 EPMenu_MapEvent
ASGNP4
line 881
;881:		epMenuInfo.mapbuttons[i].generic.x			= x - 30;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 30
SUBI4
ASGNI4
line 882
;882:		epMenuInfo.mapbuttons[i].generic.y			= y - 32;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 883
;883:		epMenuInfo.mapbuttons[i].width				= 256;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+76
ADDP4
CNSTI4 256
ASGNI4
line 884
;884:		epMenuInfo.mapbuttons[i].height				= 248;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+80
ADDP4
CNSTI4 248
ASGNI4
line 885
;885:		epMenuInfo.mapbuttons[i].generic.left		= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 886
;886:		epMenuInfo.mapbuttons[i].generic.top		= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 887
;887:		epMenuInfo.mapbuttons[i].generic.right		= x + 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 888
;888:		epMenuInfo.mapbuttons[i].generic.bottom		= y + 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 889
;889:		epMenuInfo.mapbuttons[i].focuspic			= ART_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152+60
ADDP4
ADDRGP4 $576
ASGNP4
line 890
;890:		Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.mapbuttons[i] );
ADDRGP4 epMenuInfo
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1152
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 892
;891:
;892:		epMenuInfo.versionWarningsRequires[i].generic.type = MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1912
ADDP4
CNSTI4 7
ASGNI4
line 893
;893:		epMenuInfo.versionWarningsRequires[i].generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1912+44
ADDP4
CNSTU4 16392
ASGNU4
line 894
;894:		epMenuInfo.versionWarningsRequires[i].generic.x = x;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1912+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 895
;895:		epMenuInfo.versionWarningsRequires[i].generic.y = y;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1912+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 896
;896:		epMenuInfo.versionWarningsRequires[i].style = UI_LEFT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1912+64
ADDP4
CNSTI4 0
ASGNI4
line 897
;897:		epMenuInfo.versionWarningsRequires[i].color = color_yellow;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1912+68
ADDP4
ADDRGP4 color_yellow
ASGNP4
line 898
;898:		Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.versionWarningsRequires[i] );
ADDRGP4 epMenuInfo
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+1912
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 900
;899:
;900:		epMenuInfo.versionWarningsVersion[i].generic.type = MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2488
ADDP4
CNSTI4 7
ASGNI4
line 901
;901:		epMenuInfo.versionWarningsVersion[i].generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2488+44
ADDP4
CNSTU4 16392
ASGNU4
line 902
;902:		epMenuInfo.versionWarningsVersion[i].generic.x = x;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2488+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 903
;903:		epMenuInfo.versionWarningsVersion[i].generic.y = y + 16;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2488+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 904
;904:		epMenuInfo.versionWarningsVersion[i].style = UI_LEFT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2488+64
ADDP4
CNSTI4 0
ASGNI4
line 905
;905:		epMenuInfo.versionWarningsVersion[i].color = color_yellow;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2488+68
ADDP4
ADDRGP4 color_yellow
ASGNP4
line 906
;906:		Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.versionWarningsVersion[i] );
ADDRGP4 epMenuInfo
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2488
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 908
;907:
;908:		epMenuInfo.versionWarnings[i].generic.type = MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2200
ADDP4
CNSTI4 7
ASGNI4
line 909
;909:		epMenuInfo.versionWarnings[i].generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2200+44
ADDP4
CNSTU4 16392
ASGNU4
line 910
;910:		epMenuInfo.versionWarnings[i].generic.x = x;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2200+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 911
;911:		epMenuInfo.versionWarnings[i].generic.y = y + 32;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2200+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 912
;912:		epMenuInfo.versionWarnings[i].style = UI_LEFT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2200+64
ADDP4
CNSTI4 0
ASGNI4
line 913
;913:		epMenuInfo.versionWarnings[i].color = color_yellow;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2200+68
ADDP4
ADDRGP4 color_yellow
ASGNP4
line 914
;914:		Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.versionWarnings[i] );
ADDRGP4 epMenuInfo
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2200
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 915
;915:	}
LABELV $706
line 860
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $705
line 918
;916:	
;917:	//add longname
;918:	epMenuInfo.mapLongName.generic.type = MTYPE_TEXT;
ADDRGP4 epMenuInfo+2776
CNSTI4 7
ASGNI4
line 919
;919:	epMenuInfo.mapLongName.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 epMenuInfo+2776+44
CNSTU4 16392
ASGNU4
line 920
;920:	epMenuInfo.mapLongName.generic.x = 298;
ADDRGP4 epMenuInfo+2776+12
CNSTI4 298
ASGNI4
line 921
;921:	epMenuInfo.mapLongName.generic.y = 96;
ADDRGP4 epMenuInfo+2776+16
CNSTI4 96
ASGNI4
line 922
;922:	epMenuInfo.mapLongName.style = UI_LEFT|UI_SMALLFONT;
ADDRGP4 epMenuInfo+2776+64
CNSTI4 16
ASGNI4
line 923
;923:	epMenuInfo.mapLongName.color = color_red;
ADDRGP4 epMenuInfo+2776+68
ADDRGP4 color_red
ASGNP4
line 924
;924:	epMenuInfo.mapLongName.string = maplongnamebuffer;
ADDRGP4 epMenuInfo+2776+60
ADDRGP4 $600
ASGNP4
line 925
;925:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.mapLongName );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+2776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 928
;926:
;927:	//add author
;928:	epMenuInfo.mapAuthor.generic.type = MTYPE_TEXT;
ADDRGP4 epMenuInfo+2848
CNSTI4 7
ASGNI4
line 929
;929:	epMenuInfo.mapAuthor.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 epMenuInfo+2848+44
CNSTU4 16392
ASGNU4
line 930
;930:	epMenuInfo.mapAuthor.generic.x = 298;
ADDRGP4 epMenuInfo+2848+12
CNSTI4 298
ASGNI4
line 931
;931:	epMenuInfo.mapAuthor.generic.y = 112;
ADDRGP4 epMenuInfo+2848+16
CNSTI4 112
ASGNI4
line 932
;932:	epMenuInfo.mapAuthor.style = UI_LEFT|UI_SMALLFONT;
ADDRGP4 epMenuInfo+2848+64
CNSTI4 16
ASGNI4
line 933
;933:	epMenuInfo.mapAuthor.color = color_red;
ADDRGP4 epMenuInfo+2848+68
ADDRGP4 color_red
ASGNP4
line 934
;934:	epMenuInfo.mapAuthor.string = mapauthorbuffer;
ADDRGP4 epMenuInfo+2848+60
ADDRGP4 $601
ASGNP4
line 935
;935:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.mapAuthor );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+2848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 938
;936:
;937:	//add description
;938:	for (i = 0; i < MAX_DESCRIPTIONLINES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $819
line 939
;939:		epMenuInfo.mapDescriptionLines[i].generic.type = MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2920
ADDP4
CNSTI4 7
ASGNI4
line 940
;940:		epMenuInfo.mapDescriptionLines[i].generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2920+44
ADDP4
CNSTU4 16392
ASGNU4
line 941
;941:		epMenuInfo.mapDescriptionLines[i].generic.x = 298;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2920+12
ADDP4
CNSTI4 298
ASGNI4
line 942
;942:		epMenuInfo.mapDescriptionLines[i].generic.y = 128 + (i * 16);
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2920+16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 128
ADDI4
ASGNI4
line 943
;943:		epMenuInfo.mapDescriptionLines[i].style = UI_LEFT|UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2920+64
ADDP4
CNSTI4 16
ASGNI4
line 944
;944:		epMenuInfo.mapDescriptionLines[i].color = color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2920+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 945
;945:		Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.mapDescriptionLines[i] );
ADDRGP4 epMenuInfo
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 epMenuInfo+2920
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 946
;946:	}
LABELV $820
line 938
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $819
line 949
;947:
;948:	//add next/prev page buttons
;949:	epMenuInfo.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 epMenuInfo+1504
CNSTI4 6
ASGNI4
line 950
;950:	epMenuInfo.arrows.generic.name  = ART_ARROWS;
ADDRGP4 epMenuInfo+1504+4
ADDRGP4 $579
ASGNP4
line 951
;951:	epMenuInfo.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 epMenuInfo+1504+44
CNSTU4 16384
ASGNU4
line 952
;952:	epMenuInfo.arrows.generic.x	   = 96;
ADDRGP4 epMenuInfo+1504+12
CNSTI4 96
ASGNI4
line 953
;953:	epMenuInfo.arrows.generic.y	   = 360;
ADDRGP4 epMenuInfo+1504+16
CNSTI4 360
ASGNI4
line 954
;954:	epMenuInfo.arrows.width  	   = 128;
ADDRGP4 epMenuInfo+1504+76
CNSTI4 128
ASGNI4
line 955
;955:	epMenuInfo.arrows.height  	   = 32;
ADDRGP4 epMenuInfo+1504+80
CNSTI4 32
ASGNI4
line 956
;956:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.arrows );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+1504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 959
;957:
;958:	//add prev page button overlay
;959:	epMenuInfo.prevpage.generic.type	 = MTYPE_BITMAP;
ADDRGP4 epMenuInfo+1592
CNSTI4 6
ASGNI4
line 960
;960:	epMenuInfo.prevpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epMenuInfo+1592+44
CNSTU4 260
ASGNU4
line 961
;961:	epMenuInfo.prevpage.generic.callback = EPMenu_MenuEvent;
ADDRGP4 epMenuInfo+1592+48
ADDRGP4 EPMenu_MenuEvent
ASGNP4
line 962
;962:	epMenuInfo.prevpage.generic.id	    = ID_PREVPAGE;
ADDRGP4 epMenuInfo+1592+8
CNSTI4 7
ASGNI4
line 963
;963:	epMenuInfo.prevpage.generic.x		= 96;
ADDRGP4 epMenuInfo+1592+12
CNSTI4 96
ASGNI4
line 964
;964:	epMenuInfo.prevpage.generic.y		= 360;
ADDRGP4 epMenuInfo+1592+16
CNSTI4 360
ASGNI4
line 965
;965:	epMenuInfo.prevpage.width  		    = 64;
ADDRGP4 epMenuInfo+1592+76
CNSTI4 64
ASGNI4
line 966
;966:	epMenuInfo.prevpage.height			= 32;
ADDRGP4 epMenuInfo+1592+80
CNSTI4 32
ASGNI4
line 967
;967:	epMenuInfo.prevpage.focuspic        = ART_ARROWSL;
ADDRGP4 epMenuInfo+1592+60
ADDRGP4 $580
ASGNP4
line 968
;968:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.prevpage );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+1592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 971
;969:
;970:	//add next page button overlay
;971:	epMenuInfo.nextpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 epMenuInfo+1680
CNSTI4 6
ASGNI4
line 972
;972:	epMenuInfo.nextpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 epMenuInfo+1680+44
CNSTU4 260
ASGNU4
line 973
;973:	epMenuInfo.nextpage.generic.callback = EPMenu_MenuEvent;
ADDRGP4 epMenuInfo+1680+48
ADDRGP4 EPMenu_MenuEvent
ASGNP4
line 974
;974:	epMenuInfo.nextpage.generic.id	    = ID_NEXTPAGE;
ADDRGP4 epMenuInfo+1680+8
CNSTI4 8
ASGNI4
line 975
;975:	epMenuInfo.nextpage.generic.x		= 157;
ADDRGP4 epMenuInfo+1680+12
CNSTI4 157
ASGNI4
line 976
;976:	epMenuInfo.nextpage.generic.y		= 360;
ADDRGP4 epMenuInfo+1680+16
CNSTI4 360
ASGNI4
line 977
;977:	epMenuInfo.nextpage.width  		    = 64;
ADDRGP4 epMenuInfo+1680+76
CNSTI4 64
ASGNI4
line 978
;978:	epMenuInfo.nextpage.height  		 = 32;
ADDRGP4 epMenuInfo+1680+80
CNSTI4 32
ASGNI4
line 979
;979:	epMenuInfo.nextpage.focuspic         = ART_ARROWSR;
ADDRGP4 epMenuInfo+1680+60
ADDRGP4 $581
ASGNP4
line 980
;980:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.nextpage );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+1680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 983
;981:
;982:	//add high score caption
;983:	epMenuInfo.highScoreCaption.generic.type = MTYPE_TEXT;
ADDRGP4 epMenuInfo+1768
CNSTI4 7
ASGNI4
line 984
;984:	epMenuInfo.highScoreCaption.generic.flags = QMF_INACTIVE;
ADDRGP4 epMenuInfo+1768+44
CNSTU4 16384
ASGNU4
line 985
;985:	epMenuInfo.highScoreCaption.generic.x = 300;
ADDRGP4 epMenuInfo+1768+12
CNSTI4 300
ASGNI4
line 986
;986:	epMenuInfo.highScoreCaption.generic.y = 400;
ADDRGP4 epMenuInfo+1768+16
CNSTI4 400
ASGNI4
line 987
;987:	epMenuInfo.highScoreCaption.string = "HIGH SCORE:";
ADDRGP4 epMenuInfo+1768+60
ADDRGP4 $894
ASGNP4
line 988
;988:	epMenuInfo.highScoreCaption.color = text_color_normal;
ADDRGP4 epMenuInfo+1768+68
ADDRGP4 text_color_normal
ASGNP4
line 989
;989:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.highScoreCaption );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+1768
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 992
;990:
;991:	//add high score
;992:	epMenuInfo.highScore.generic.type = MTYPE_TEXT;
ADDRGP4 epMenuInfo+1840
CNSTI4 7
ASGNI4
line 993
;993:	epMenuInfo.highScore.generic.flags = QMF_INACTIVE;
ADDRGP4 epMenuInfo+1840+44
CNSTU4 16384
ASGNU4
line 994
;994:	epMenuInfo.highScore.generic.x = 480;
ADDRGP4 epMenuInfo+1840+12
CNSTI4 480
ASGNI4
line 995
;995:	epMenuInfo.highScore.generic.y = 400;
ADDRGP4 epMenuInfo+1840+16
CNSTI4 400
ASGNI4
line 996
;996:	epMenuInfo.highScore.string = mapscorebuffer;
ADDRGP4 epMenuInfo+1840+60
ADDRGP4 $599
ASGNP4
line 997
;997:	Menu_AddItem( &epMenuInfo.menu, &epMenuInfo.highScore );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 epMenuInfo+1840
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1000
;998:
;999:	//add menu to stack
;1000:	UI_PushMenu( &epMenuInfo.menu );
ADDRGP4 epMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1003
;1001:
;1002:	//filter the levels to show
;1003:	EPMenu_GametypeFilter();
ADDRGP4 EPMenu_GametypeFilter
CALLV
pop
line 1004
;1004:}
LABELV $597
endproc UI_EPLevelMenu 24 12
bss
align 4
LABELV epSkillInfo
skip 1100
align 4
LABELV epMenuInfo
skip 42824
export lines
align 1
LABELV lines
skip 400
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
import Mutators_Cache
import UI_MutatorsMenu
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
LABELV $894
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 32
byte 1 83
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 58
byte 1 0
align 1
LABELV $683
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $666
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $611
byte 1 78
byte 1 69
byte 1 87
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $582
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $581
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $580
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $579
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $578
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $577
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $576
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $575
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $574
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $573
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
LABELV $572
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
LABELV $518
byte 1 97
byte 1 117
byte 1 116
byte 1 104
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $515
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $512
byte 1 100
byte 1 101
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $509
byte 1 109
byte 1 105
byte 1 110
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $504
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $499
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $492
byte 1 110
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $458
byte 1 98
byte 1 121
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $436
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $400
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $397
byte 1 82
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $380
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $362
byte 1 0
align 1
LABELV $352
byte 1 49
byte 1 46
byte 1 49
byte 1 46
byte 1 56
byte 1 0
align 1
LABELV $351
byte 1 49
byte 1 46
byte 1 49
byte 1 46
byte 1 55
byte 1 0
align 1
LABELV $350
byte 1 49
byte 1 46
byte 1 49
byte 1 46
byte 1 54
byte 1 0
align 1
LABELV $349
byte 1 49
byte 1 46
byte 1 49
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $348
byte 1 49
byte 1 46
byte 1 49
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $347
byte 1 49
byte 1 46
byte 1 49
byte 1 46
byte 1 51
byte 1 0
align 1
LABELV $346
byte 1 49
byte 1 46
byte 1 49
byte 1 46
byte 1 50
byte 1 0
align 1
LABELV $345
byte 1 49
byte 1 46
byte 1 49
byte 1 46
byte 1 49
byte 1 0
align 1
LABELV $344
byte 1 49
byte 1 46
byte 1 49
byte 1 0
align 1
LABELV $343
byte 1 49
byte 1 46
byte 1 48
byte 1 46
byte 1 50
byte 1 0
align 1
LABELV $342
byte 1 49
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 0
align 1
LABELV $341
byte 1 49
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $335
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 112
byte 1 108
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $262
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $243
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $224
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $205
byte 1 69
byte 1 97
byte 1 115
byte 1 121
byte 1 0
align 1
LABELV $186
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $153
byte 1 68
byte 1 73
byte 1 70
byte 1 70
byte 1 73
byte 1 67
byte 1 85
byte 1 76
byte 1 84
byte 1 89
byte 1 0
align 1
LABELV $132
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $102
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $100
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 110
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $98
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 53
byte 1 0
align 1
LABELV $95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $92
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $89
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $86
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $84
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $83
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $82
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
LABELV $81
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
LABELV $80
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $76
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $75
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $74
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $73
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $72
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $71
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
