code
proc Scores_Event 4 0
file "../ui_scores.c"
line 32
;1:#include "ui_local.h"
;2:
;3:
;4:#define ART_TABLE				"menu/art/table"
;5:#define ART_BACK0				"menu/art/back_0"
;6:#define ART_BACK1				"menu/art/back_1"
;7:
;8:#define ID_BACK					99
;9:
;10:typedef struct {
;11:	menuframework_s		menu;
;12:
;13:	menutext_s			banner;
;14:	menutext_s			levelname;
;15:	
;16:	menutext_s			tableheader;
;17:	menubitmap_s		table;
;18:	menutext_s			scoretexts[SCOREBOARD_LENGTH];
;19:	
;20:	menuradiobutton_s	paintballmode;
;21:	menuradiobutton_s	bigheadmode;
;22:	menuradiobutton_s	machinegunonly;
;23:	menuradiobutton_s	instagib;
;24:	menuradiobutton_s	resetscoreafterdeath;
;25:
;26:	menubitmap_s		back;
;27:} scores_t;
;28:
;29:static scores_t s_scores;
;30:char	*levelname;
;31:
;32:static void Scores_Event( void* ptr, int notification ) {
line 33
;33:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $70
line 34
;34:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 37
;35:	}
;36:
;37:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 99
EQI4 $75
ADDRGP4 $72
JUMPV
LABELV $75
line 39
;38:		case ID_BACK:
;39:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 40
;40:			break;
LABELV $72
LABELV $73
line 42
;41:	}
;42:}
LABELV $69
endproc Scores_Event 4 0
export Scores_GenerateScoringTable
proc Scores_GenerateScoringTable 504 100
line 44
;43:
;44:void Scores_GenerateScoringTable( void ) {
line 58
;45:	highscores_t	hs;
;46:	int				i, n, ds;
;47:	char			carnagePad[5][7];
;48:	char			accuracyScorePad[5][5];
;49:	char			accuracyPad[5][3];
;50:	char			secretsScorePad[5][5];
;51:	char			secretsFoundPad[5][3];
;52:	char			secretsCountPad[5][3];
;53:	char			deathsScorePad[5][6];
;54:	char			deathsCountPad[5][2];
;55:	char			skillScorePad[5][5];
;56:	char			totalScorePad[5][6];
;57:
;58:	hs = COM_LoadLevelScores( levelname );
ADDRLP4 8
ARGP4
ADDRGP4 levelname
INDIRP4
ARGP4
ADDRGP4 COM_LoadLevelScores
CALLV
pop
line 61
;59:
;60:	
;61:	for ( i = 0; i < SCOREBOARD_LENGTH; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $77
line 63
;62:		//calculate paddings for carnage
;63:		strcpy( carnagePad[i], "") ;
CNSTI4 7
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 252
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 64
;64:		n = 1000000;
ADDRLP4 0
CNSTI4 1000000
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $82
line 65
;65:		while ( n > 1 ) {
line 66
;66:			if ( hs.highscores[i].carnageScore < n ) {
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $84
line 67
;67:				strcat( carnagePad[i], " " );
CNSTI4 7
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 252
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 68
;68:				n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 69
;69:			} else
line 70
;70:				break;
LABELV $86
line 71
;71:		}
LABELV $83
line 65
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $82
LABELV $84
line 74
;72:
;73:		//calculate paddings for accuracy score
;74:		strcpy( accuracyScorePad[i], "") ;
CNSTI4 5
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 287
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 75
;75:		n = 10000;
ADDRLP4 0
CNSTI4 10000
ASGNI4
ADDRGP4 $89
JUMPV
LABELV $88
line 76
;76:		while ( n > 1 ) {
line 77
;77:			if ( hs.highscores[i].accuracyScore < n ) {
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+8
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $90
line 78
;78:				strcat( accuracyScorePad[i], " " );
CNSTI4 5
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 287
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 79
;79:				n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 80
;80:			} else
line 81
;81:				break;
LABELV $92
line 82
;82:		}
LABELV $89
line 76
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $88
LABELV $90
line 85
;83:
;84:		//calculate paddings for accuracy percentage
;85:		strcpy( accuracyPad[i], "") ;
CNSTI4 3
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 312
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 86
;86:		n = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $94
line 87
;87:		while ( n > 1 ) {
line 88
;88:			if ( hs.highscores[i].accuracy < n ) {
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $96
line 89
;89:				strcat( accuracyPad[i], " " );
CNSTI4 3
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 312
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 90
;90:				n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 91
;91:			} else
line 92
;92:				break;
LABELV $98
line 93
;93:		}
LABELV $95
line 87
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $94
LABELV $96
line 96
;94:
;95:		//calculate paddings for secrets score
;96:		strcpy( secretsScorePad[i], "") ;
CNSTI4 5
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 327
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 97
;97:		n = 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
ADDRGP4 $101
JUMPV
LABELV $100
line 98
;98:		while ( n > 1 ) {
line 99
;99:			if ( hs.highscores[i].secretsScore < n ) {
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+28
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $102
line 100
;100:				strcat( secretsScorePad[i], " " );
CNSTI4 5
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 327
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 101
;101:				n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 102
;102:			} else
line 103
;103:				break;
LABELV $104
line 104
;104:		}
LABELV $101
line 98
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $100
LABELV $102
line 107
;105:
;106:		//calculate padding for secrets found
;107:		strcpy( secretsFoundPad[i], "") ;
CNSTI4 3
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 352
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 108
;108:		n = 10;
ADDRLP4 0
CNSTI4 10
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $106
line 109
;109:		while ( n > 1 ) {
line 110
;110:			if ( hs.highscores[i].secretsFound < n ) {
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+20
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $108
line 111
;111:				strcat( secretsFoundPad[i], " " );
CNSTI4 3
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 352
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 112
;112:				n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 113
;113:			} else
line 114
;114:				break;
LABELV $110
line 115
;115:		}
LABELV $107
line 109
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $106
LABELV $108
line 118
;116:
;117:		//calculate padding for secrets count
;118:		strcpy( secretsCountPad[i], "") ;
CNSTI4 3
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 367
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 119
;119:		n = 10;
ADDRLP4 0
CNSTI4 10
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $112
line 120
;120:		while ( n > 1 ) {
line 121
;121:			if ( hs.highscores[i].secretsCount < n ) {
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+24
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $114
line 122
;122:				strcat( secretsCountPad[i], " " );
CNSTI4 3
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 367
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 123
;123:				n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 124
;124:			} else
line 125
;125:				break;
LABELV $116
line 126
;126:		}
LABELV $113
line 120
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $112
LABELV $114
line 129
;127:
;128:		//calculate padding for deathsscore
;129:		strcpy( deathsScorePad[i], "");
CNSTI4 6
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 447
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 130
;130:		n = 10000;
ADDRLP4 0
CNSTI4 10000
ASGNI4
line 131
;131:		ds = 0 - hs.highscores[i].deathsScore;
ADDRLP4 248
CNSTI4 0
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 132
;132:		if (ds == 0)
ADDRLP4 248
INDIRI4
CNSTI4 0
NEI4 $123
line 133
;133:			strcpy( deathsScorePad[i], "     ");
CNSTI4 6
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 447
ADDP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $120
JUMPV
line 134
;134:		else {
LABELV $122
line 135
;135:			while ( n > 1 ) {
line 136
;136:				if ( ds < n ) {
ADDRLP4 248
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $124
line 137
;137:					strcat( deathsScorePad[i], " " );
CNSTI4 6
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 447
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 138
;138:					n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 139
;139:				} else
line 140
;140:					break;
LABELV $126
line 141
;141:			}
LABELV $123
line 135
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $122
LABELV $124
line 142
;142:		}
LABELV $120
line 145
;143:		
;144:		//calculate padding for deaths count
;145:		strcpy( deathsCountPad[i], "") ;
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 382
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 146
;146:		n = 10;
ADDRLP4 0
CNSTI4 10
ASGNI4
ADDRGP4 $128
JUMPV
LABELV $127
line 147
;147:		while ( n > 1 ) {
line 148
;148:			if ( hs.highscores[i].deaths < n ) {
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+12
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $129
line 149
;149:				strcat( deathsCountPad[i], " " );
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 382
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 150
;150:				n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 151
;151:			} else
line 152
;152:				break;
LABELV $131
line 153
;153:		}
LABELV $128
line 147
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $127
LABELV $129
line 156
;154:
;155:		//calculate padding for skill score
;156:		strcpy( skillScorePad[i], "");
CNSTI4 5
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 392
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 157
;157:		n = 10000;
ADDRLP4 0
CNSTI4 10000
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $133
line 158
;158:		while ( n > 1 ) {
line 159
;159:			if ( hs.highscores[i].skillScore < n ) {
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+40
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $135
line 160
;160:				strcat( skillScorePad[i], " " );
CNSTI4 5
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 392
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 161
;161:				n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 162
;162:			} else
line 163
;163:				break;
LABELV $137
line 164
;164:		}
LABELV $134
line 158
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $133
LABELV $135
line 167
;165:
;166:		//calculate padding for total score
;167:		strcpy( totalScorePad[i], "");
CNSTI4 6
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 417
ADDP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 168
;168:		n = 10000;
ADDRLP4 0
CNSTI4 10000
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $139
line 169
;169:		while ( n > 1 ) {
line 170
;170:			if ( hs.highscores[i].totalScore < n ) {
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+44
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $141
line 171
;171:				strcat( totalScorePad[i], " " );
CNSTI4 6
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 417
ADDP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 172
;172:				n = n / 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 173
;173:			} else
line 174
;174:				break;
LABELV $143
line 175
;175:		}
LABELV $140
line 169
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $139
LABELV $141
line 176
;176:	}
LABELV $78
line 61
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $77
line 179
;177:
;178:
;179:	for (i = 0; i < SCOREBOARD_LENGTH; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $145
line 180
;180:		Com_sprintf(s_scores.scoretexts[i].string, 80, "%i.    %s%i   %s%i %s(%i%%)   %s%i %s%s(%i/%i)   %s%i %s(%ix)   %s%i (%1.0f)   %s%i",
CNSTI4 72
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_scores+592+60
ADDP4
INDIRP4
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 $151
ARGP4
ADDRLP4 484
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 484
INDIRI4
ADDI4
ARGI4
CNSTI4 7
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 252
ADDP4
ARGP4
ADDRLP4 488
CNSTI4 48
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 488
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 492
CNSTI4 5
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 492
INDIRI4
ADDRLP4 287
ADDP4
ARGP4
ADDRLP4 488
INDIRI4
ADDRLP4 8+8
ADDP4
INDIRI4
ARGI4
ADDRLP4 496
CNSTI4 3
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 496
INDIRI4
ADDRLP4 312
ADDP4
ARGP4
ADDRLP4 488
INDIRI4
ADDRLP4 8+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 492
INDIRI4
ADDRLP4 327
ADDP4
ARGP4
ADDRLP4 488
INDIRI4
ADDRLP4 8+28
ADDP4
INDIRI4
ARGI4
ADDRLP4 496
INDIRI4
ADDRLP4 352
ADDP4
ARGP4
ADDRLP4 496
INDIRI4
ADDRLP4 367
ADDP4
ARGP4
ADDRLP4 488
INDIRI4
ADDRLP4 8+20
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ADDRLP4 8+24
ADDP4
INDIRI4
ARGI4
ADDRLP4 500
CNSTI4 6
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 500
INDIRI4
ADDRLP4 447
ADDP4
ARGP4
ADDRLP4 488
INDIRI4
ADDRLP4 8+16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 484
INDIRI4
LSHI4
ADDRLP4 382
ADDP4
ARGP4
ADDRLP4 488
INDIRI4
ADDRLP4 8+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 492
INDIRI4
ADDRLP4 392
ADDP4
ARGP4
ADDRLP4 488
INDIRI4
ADDRLP4 8+40
ADDP4
INDIRI4
ARGI4
ADDRLP4 488
INDIRI4
ADDRLP4 8+32
ADDP4
INDIRF4
ARGF4
ADDRLP4 500
INDIRI4
ADDRLP4 417
ADDP4
ARGP4
ADDRLP4 488
INDIRI4
ADDRLP4 8+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 189
;181:		//sprintf( s_scores.scoretexts[i].string, "%i.    %s%i   %s%i %s(%i%%)   %s%i %s%s(%i/%i)   %s%i %s(%ix)   %s%i (%1.0f)   %s%i", 
;182:			i + 1,
;183:			carnagePad[i], hs.highscores[i].carnageScore,
;184:			accuracyScorePad[i], hs.highscores[i].accuracyScore, accuracyPad[i], hs.highscores[i].accuracy,
;185:			secretsScorePad[i], hs.highscores[i].secretsScore, secretsFoundPad[i], secretsCountPad[i], hs.highscores[i].secretsFound, hs.highscores[i].secretsCount,
;186:			deathsScorePad[i], hs.highscores[i].deathsScore, deathsCountPad[i], hs.highscores[i].deaths,
;187:			skillScorePad[i], hs.highscores[i].skillScore, hs.highscores[i].skill,
;188:			totalScorePad[i], hs.highscores[i].totalScore);
;189:	}
LABELV $146
line 179
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $145
line 190
;190:}
LABELV $76
endproc Scores_GenerateScoringTable 504 100
bss
align 1
LABELV $163
skip 20480
code
proc Scores_MenuInit 16 12
line 192
;191:
;192:static void Scores_MenuInit( void ) {
line 197
;193:	int				i;
;194:	int				x, y;
;195:	static			char scorebuffers[SCOREBOARD_LENGTH][4096];
;196:
;197:	memset( &s_scores, 0, sizeof(scores_t) );
ADDRGP4 s_scores
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1360
ARGI4
ADDRGP4 memset
CALLP4
pop
line 199
;198:
;199:	Scores_Cache();
ADDRGP4 Scores_Cache
CALLV
pop
line 201
;200:
;201:	s_scores.menu.wrapAround = qtrue;
ADDRGP4 s_scores+276
CNSTI4 1
ASGNI4
line 202
;202:	s_scores.menu.fullscreen = qtrue;
ADDRGP4 s_scores+280
CNSTI4 1
ASGNI4
line 204
;203:
;204:	s_scores.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_scores+288
CNSTI4 10
ASGNI4
line 205
;205:	s_scores.banner.generic.x		= 320;
ADDRGP4 s_scores+288+12
CNSTI4 320
ASGNI4
line 206
;206:	s_scores.banner.generic.y		= 16;
ADDRGP4 s_scores+288+16
CNSTI4 16
ASGNI4
line 207
;207:	s_scores.banner.string			= "SCORES";
ADDRGP4 s_scores+288+60
ADDRGP4 $173
ASGNP4
line 208
;208:	s_scores.banner.color			= color_white;
ADDRGP4 s_scores+288+68
ADDRGP4 color_white
ASGNP4
line 209
;209:	s_scores.banner.style			= UI_CENTER;
ADDRGP4 s_scores+288+64
CNSTI4 1
ASGNI4
line 211
;210:
;211:	s_scores.levelname.generic.type	= MTYPE_TEXT;
ADDRGP4 s_scores+360
CNSTI4 7
ASGNI4
line 212
;212:	s_scores.levelname.generic.x	= 320;
ADDRGP4 s_scores+360+12
CNSTI4 320
ASGNI4
line 213
;213:	s_scores.levelname.generic.y	= 48;
ADDRGP4 s_scores+360+16
CNSTI4 48
ASGNI4
line 214
;214:	s_scores.levelname.string		= levelname;
ADDRGP4 s_scores+360+60
ADDRGP4 levelname
INDIRP4
ASGNP4
line 215
;215:	s_scores.levelname.color		= text_color_normal;
ADDRGP4 s_scores+360+68
ADDRGP4 text_color_normal
ASGNP4
line 216
;216:	s_scores.levelname.style		= UI_CENTER;
ADDRGP4 s_scores+360+64
CNSTI4 1
ASGNI4
line 218
;217:
;218:	s_scores.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_scores+1272
CNSTI4 6
ASGNI4
line 219
;219:	s_scores.back.generic.name		= ART_BACK0;
ADDRGP4 s_scores+1272+4
ADDRGP4 $192
ASGNP4
line 220
;220:	s_scores.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_scores+1272+44
CNSTU4 260
ASGNU4
line 221
;221:	s_scores.back.generic.callback	= Scores_Event;
ADDRGP4 s_scores+1272+48
ADDRGP4 Scores_Event
ASGNP4
line 222
;222:	s_scores.back.generic.id		= ID_BACK;
ADDRGP4 s_scores+1272+8
CNSTI4 99
ASGNI4
line 223
;223:	s_scores.back.generic.x			= 0;
ADDRGP4 s_scores+1272+12
CNSTI4 0
ASGNI4
line 224
;224:	s_scores.back.generic.y			= 480-64;
ADDRGP4 s_scores+1272+16
CNSTI4 416
ASGNI4
line 225
;225:	s_scores.back.width				= 128;
ADDRGP4 s_scores+1272+76
CNSTI4 128
ASGNI4
line 226
;226:	s_scores.back.height			= 64;
ADDRGP4 s_scores+1272+80
CNSTI4 64
ASGNI4
line 227
;227:	s_scores.back.focuspic			= ART_BACK1;
ADDRGP4 s_scores+1272+60
ADDRGP4 $209
ASGNP4
line 229
;228:
;229:	y = 96;
ADDRLP4 4
CNSTI4 96
ASGNI4
line 230
;230:	x = 320;
ADDRLP4 8
CNSTI4 320
ASGNI4
line 231
;231:	s_scores.tableheader.generic.type	= MTYPE_TEXT;
ADDRGP4 s_scores+432
CNSTI4 7
ASGNI4
line 232
;232:	s_scores.tableheader.generic.flags	= QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_scores+432+44
CNSTU4 16392
ASGNU4
line 233
;233:	s_scores.tableheader.generic.x		= x;
ADDRGP4 s_scores+432+12
ADDRLP4 8
INDIRI4
ASGNI4
line 234
;234:	s_scores.tableheader.generic.y		= y;
ADDRGP4 s_scores+432+16
ADDRLP4 4
INDIRI4
ASGNI4
line 235
;235:	s_scores.tableheader.style			= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_scores+432+64
CNSTI4 17
ASGNI4
line 236
;236:	s_scores.tableheader.color			= color_red;
ADDRGP4 s_scores+432+68
ADDRGP4 color_red
ASGNP4
line 237
;237:	s_scores.tableheader.string			= "POS   CARNAGE     ACCURACY       SECRETS         DEATHS        SKILL     TOTAL";
ADDRGP4 s_scores+432+60
ADDRGP4 $223
ASGNP4
line 239
;238:
;239:	s_scores.table.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_scores+504
CNSTI4 6
ASGNI4
line 240
;240:	s_scores.table.generic.name		= ART_TABLE;
ADDRGP4 s_scores+504+4
ADDRGP4 $227
ASGNP4
line 241
;241:	s_scores.table.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_scores+504+44
CNSTU4 16384
ASGNU4
line 242
;242:	s_scores.table.generic.x		= 0;
ADDRGP4 s_scores+504+12
CNSTI4 0
ASGNI4
line 243
;243:	s_scores.table.generic.y		= y;
ADDRGP4 s_scores+504+16
ADDRLP4 4
INDIRI4
ASGNI4
line 244
;244:	s_scores.table.width  			= 640;
ADDRGP4 s_scores+504+76
CNSTI4 640
ASGNI4
line 245
;245:	s_scores.table.height  			= 128;
ADDRGP4 s_scores+504+80
CNSTI4 128
ASGNI4
line 247
;246:
;247:	y += 20;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 248
;248:	for (i = 0; i < SCOREBOARD_LENGTH; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $238
line 249
;249:		s_scores.scoretexts[i].generic.type		= MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scores+592
ADDP4
CNSTI4 7
ASGNI4
line 250
;250:		s_scores.scoretexts[i].generic.flags	= QMF_CENTER_JUSTIFY|QMF_INACTIVE;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scores+592+44
ADDP4
CNSTU4 16392
ASGNU4
line 251
;251:		s_scores.scoretexts[i].generic.x		= x;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scores+592+12
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 252
;252:		s_scores.scoretexts[i].generic.y		= y;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scores+592+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 253
;253:		s_scores.scoretexts[i].style			= UI_CENTER|UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scores+592+64
ADDP4
CNSTI4 17
ASGNI4
line 254
;254:		s_scores.scoretexts[i].color			= color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scores+592+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 255
;255:		s_scores.scoretexts[i].string			= scorebuffers[i];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scores+592+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 12
LSHI4
ADDRGP4 $163
ADDP4
ASGNP4
line 256
;256:		y += 16;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 257
;257:	}
LABELV $239
line 248
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $238
line 259
;258:	
;259:	Menu_AddItem( &s_scores.menu, &s_scores.banner );
ADDRGP4 s_scores
ARGP4
ADDRGP4 s_scores+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 260
;260:	Menu_AddItem( &s_scores.menu, &s_scores.levelname );
ADDRGP4 s_scores
ARGP4
ADDRGP4 s_scores+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 261
;261:	Menu_AddItem( &s_scores.menu, &s_scores.back );
ADDRGP4 s_scores
ARGP4
ADDRGP4 s_scores+1272
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 263
;262:
;263:	Menu_AddItem( &s_scores.menu, &s_scores.tableheader );
ADDRGP4 s_scores
ARGP4
ADDRGP4 s_scores+432
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 264
;264:	Menu_AddItem( &s_scores.menu, &s_scores.table );
ADDRGP4 s_scores
ARGP4
ADDRGP4 s_scores+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 265
;265:	for (i = 0; i < SCOREBOARD_LENGTH; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $260
line 266
;266:		Menu_AddItem( &s_scores.menu, &s_scores.scoretexts[i] );
ADDRGP4 s_scores
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scores+592
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $261
line 265
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $260
line 268
;267:
;268:	Scores_GenerateScoringTable();
ADDRGP4 Scores_GenerateScoringTable
CALLV
pop
line 269
;269:}
LABELV $162
endproc Scores_MenuInit 16 12
export Scores_Cache
proc Scores_Cache 0 4
line 272
;270:
;271:
;272:void Scores_Cache( void ) {
line 273
;273:	trap_R_RegisterShaderNoMip( ART_TABLE );
ADDRGP4 $227
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 274
;274:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $192
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 275
;275:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $209
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 276
;276:}
LABELV $265
endproc Scores_Cache 0 4
export UI_ScoresMenu
proc UI_ScoresMenu 0 4
line 278
;277:
;278:void UI_ScoresMenu( char *mapname ) {
line 279
;279:	levelname = mapname;
ADDRGP4 levelname
ADDRFP4 0
INDIRP4
ASGNP4
line 280
;280:	Scores_MenuInit();
ADDRGP4 Scores_MenuInit
CALLV
pop
line 281
;281:	UI_PushMenu( &s_scores.menu );
ADDRGP4 s_scores
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 282
;282:}
LABELV $266
endproc UI_ScoresMenu 0 4
bss
export levelname
align 4
LABELV levelname
skip 4
align 4
LABELV s_scores
skip 1360
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
import Mutators_Cache
import UI_MutatorsMenu
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
LABELV $227
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $223
byte 1 80
byte 1 79
byte 1 83
byte 1 32
byte 1 32
byte 1 32
byte 1 67
byte 1 65
byte 1 82
byte 1 78
byte 1 65
byte 1 71
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 65
byte 1 67
byte 1 67
byte 1 85
byte 1 82
byte 1 65
byte 1 67
byte 1 89
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 83
byte 1 69
byte 1 67
byte 1 82
byte 1 69
byte 1 84
byte 1 83
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 83
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 83
byte 1 75
byte 1 73
byte 1 76
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 84
byte 1 79
byte 1 84
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $209
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
LABELV $192
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
LABELV $173
byte 1 83
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $151
byte 1 37
byte 1 105
byte 1 46
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 40
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 41
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 40
byte 1 37
byte 1 105
byte 1 47
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 40
byte 1 37
byte 1 105
byte 1 120
byte 1 41
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 41
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $121
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $87
byte 1 32
byte 1 0
align 1
LABELV $81
byte 1 0
