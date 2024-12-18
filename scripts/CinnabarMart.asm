CinnabarMart_Script:
	jp EnableAutoTextBoxDrawing

CinnabarMart_TextPointers:
	def_text_pointers
	dw_const CinnabarMartClerkText,        TEXT_CINNABARMART_CLERK
	dw_const CinnabarMartSilphWorkerFText, TEXT_CINNABARMART_SILPH_WORKER_F
	dw_const CinnabarMartScientistText,    TEXT_CINNABARMART_SCIENTIST

CinnabarMartSilphWorkerFText:
	text_far _CinnabarMartSilphWorkerFText
	text_end

CinnabarMartScientistText:
	text_far _CinnabarMartScientistText
	text_end

CinnabarMartClerkText::
	script_mart MASTER_BALL, RARE_CANDY, DOME_FOSSIL, HELIX_FOSSIL, HYPER_POTION, MAX_REPEL, ESCAPE_ROPE, TM_DIG, TM_MIMIC, TM_METRONOME, TM_SELFDESTRUCT, TM_SKULL_BASH, TM_PSYWAVE, TM_TRI_ATTACK