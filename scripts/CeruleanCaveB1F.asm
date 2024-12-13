CeruleanCaveB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCaveB1FTrainerHeaders
	ld de, CeruleanCaveB1F_ScriptPointers
	ld a, [wCeruleanCaveB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeruleanCaveB1FCurScript], a
	ret

CeruleanCaveB1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_CERULEANCAVEB1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CERULEANCAVEB1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CERULEANCAVEB1F_END_BATTLE

CeruleanCaveB1F_TextPointers:
	def_text_pointers
	dw_const CeruleanCaveB1FMewtwoText, TEXT_CERULEANCAVEB1F_MEWTWO
	dw_const PickUpItemText,            TEXT_CERULEANCAVEB1F_ULTRA_BALL1
	dw_const PickUpItemText,            TEXT_CERULEANCAVEB1F_ULTRA_BALL2
	dw_const PickUpItemText,            TEXT_CERULEANCAVEB1F_MAX_REVIVE
	dw_const PickUpItemText,            TEXT_CERULEANCAVEB1F_MAX_ELIXER
	dw_const CeruleanCaveSmithText1, 	TEXT_CCERULEANCAVEB1F_SMITH

CeruleanCaveB1FTrainerHeaders:
	def_trainers
MewtwoTrainerHeader:
	trainer EVENT_BEAT_MEWTWO, 0, MewtwoBattleText, MewtwoBattleText, MewtwoBattleText
SmithTrainerHeader:
	trainer EVENT_BEAT_SMITH, 5, CeruleanCaveSmithBattleText1, CeruleanCaveSmithEndBattleText1, CeruleanCaveSmithAfterBattleText1
	db -1 ; end

CeruleanCaveSmithText1:
	text_asm
	ld hl, SmithTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd
	
CeruleanCaveSmithBattleText1:
	text_far _CeruleanCaveSmithBattleText1
	text_end
	
CeruleanCaveSmithEndBattleText1:
	text_far _CeruleanCaveSmithEndBattleText1
	text_end
	
CeruleanCaveSmithAfterBattleText1:
	text_far _CeruleanCaveSmithAfterBattleText1
	text_end

CeruleanCaveB1FMewtwoText:
	text_asm
	ld hl, MewtwoTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewtwoBattleText:
	text_far _MewtwoBattleText
	text_asm
	ld a, MEWTWO
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
