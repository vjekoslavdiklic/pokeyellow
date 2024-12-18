	object_const_def
	const_export REDS_HOUSE_2F_DRATINI_POKEBALL
	
RedsHouse2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  1, REDS_HOUSE_1F, 3
IF DEF(_DEBUG)
	warp_event  7,  2, MT_MOON_B2F, 4
	warp_event  7,  3, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event  7,  4, POKEMON_TOWER_7F, 1
	warp_event  7,  5, SILPH_CO_11F, 4
	warp_event  0,  3, CELADON_MANSION_ROOF_HOUSE, 4
ENDC

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_POKE_BALL, STAY, NONE, TEXT_REDS_HOUSE_2F_DRATINI_POKEBALL

	def_warps_to REDS_HOUSE_2F
