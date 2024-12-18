RedsHouse2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RedsHouse2F_ScriptPointers
	ld a, 0
	call CallFunctionInTable
	ret

RedsHouse2F_ScriptPointers:
	def_script_pointers
	dw_const RedsHouse2FDefaultScript, SCRIPT_REDSHOUSE2F_DEFAULT0
	dw_const RedsHouse2FDefaultScript, SCRIPT_REDSHOUSE2F_DEFAULT1
	dw_const RedsHouse2FDefaultScript, SCRIPT_REDSHOUSE2F_DEFAULT2
	dw_const RedsHouse2FDefaultScript, SCRIPT_REDSHOUSE2F_DEFAULT3
	dw_const RedsHouse2FDefaultScript, SCRIPT_REDSHOUSE2F_DEFAULT4

RedsHouse2FDefaultScript:
	ret

RedsHouse2F_TextPointers:
	def_text_pointers
	dw_const RedsHouse2FDratiniPokeballText, TEXT_REDS_HOUSE_2F_DRATINI_POKEBALL
	text_end

RedsHouse2FDratiniPokeballText:
	text_asm
	lb bc, DRATINI, 50
	call GivePokemon
	jr nc, .party_full
	ld a, HS_REDS_HOUSE_2F_DRATINI_GIFT
	ld [wMissableObjectIndex], a
	predef HideObject
.party_full
	jp TextScriptEnd
