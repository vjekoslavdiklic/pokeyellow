	object_const_def
	const_export SAFFRONCITY_ROCKET1
	const_export SAFFRONCITY_ROCKET2
	const_export SAFFRONCITY_ROCKET3
	const_export SAFFRONCITY_ROCKET4
	const_export SAFFRONCITY_ROCKET5
	const_export SAFFRONCITY_ROCKET6
	const_export SAFFRONCITY_ROCKET7
	const_export SAFFRONCITY_SCIENTIST
	const_export SAFFRONCITY_SILPH_WORKER_M
	const_export SAFFRONCITY_SILPH_WORKER_F
	const_export SAFFRONCITY_GENTLEMAN
	const_export SAFFRONCITY_PIDGEOT
	const_export SAFFRONCITY_ROCKER
	const_export SAFFRONCITY_ROCKET8
	const_export SAFFRONCITY_ROCKET9 ; removed in yellow, but still referenced in data/maps/hide_show_data.asm

SaffronCity_Object:
	db $f ; border block

	def_warp_events
	warp_event  7,  5, COPYCATS_HOUSE_1F, 1
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 13, 11, SAFFRON_PIDGEY_HOUSE, 1
	warp_event 25, 11, SAFFRON_MART, 1
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 29, SAFFRON_POKECENTER, 1
	warp_event 29, 29, MR_PSYCHICS_HOUSE, 1

	def_bg_events
	bg_event 17,  5, TEXT_SAFFRONCITY_SIGN
	bg_event 27,  5, TEXT_SAFFRONCITY_FIGHTING_DOJO_SIGN
	bg_event 35,  5, TEXT_SAFFRONCITY_GYM_SIGN
	bg_event 26, 11, TEXT_SAFFRONCITY_MART_SIGN
	bg_event 39, 19, TEXT_SAFFRONCITY_TRAINER_TIPS1
	bg_event  5, 21, TEXT_SAFFRONCITY_TRAINER_TIPS2
	bg_event 15, 21, TEXT_SAFFRONCITY_SILPH_CO_SIGN
	bg_event 10, 29, TEXT_SAFFRONCITY_POKECENTER_SIGN
	bg_event 27, 29, TEXT_SAFFRONCITY_MR_PSYCHICS_HOUSE_SIGN
	bg_event  1, 19, TEXT_SAFFRONCITY_SILPH_CO_LATEST_PRODUCT_SIGN

	def_object_events
	object_event  7,  6, SPRITE_ROCKET, STAY, NONE, TEXT_SAFFRONCITY_ROCKET1
	object_event 20,  8, SPRITE_ROCKET, WALK, LEFT_RIGHT, TEXT_SAFFRONCITY_ROCKET2
	object_event 34,  4, SPRITE_ROCKET, STAY, NONE, TEXT_SAFFRONCITY_ROCKET3
	object_event 13, 12, SPRITE_ROCKET, STAY, NONE, TEXT_SAFFRONCITY_ROCKET4
	object_event 11, 25, SPRITE_ROCKET, WALK, LEFT_RIGHT, TEXT_SAFFRONCITY_ROCKET5
	object_event 32, 13, SPRITE_ROCKET, WALK, LEFT_RIGHT, TEXT_SAFFRONCITY_ROCKET6
	object_event 18, 30, SPRITE_ROCKET, WALK, LEFT_RIGHT, TEXT_SAFFRONCITY_ROCKET7
	object_event  8, 14, SPRITE_SCIENTIST, WALK, ANY_DIR, TEXT_SAFFRONCITY_SCIENTIST
	object_event 23, 23, SPRITE_SILPH_WORKER_M, STAY, NONE, TEXT_SAFFRONCITY_SILPH_WORKER_M
	object_event 17, 30, SPRITE_SILPH_WORKER_F, WALK, LEFT_RIGHT, TEXT_SAFFRONCITY_SILPH_WORKER_F
	object_event 30, 12, SPRITE_GENTLEMAN, STAY, DOWN, TEXT_SAFFRONCITY_GENTLEMAN
	object_event 31, 12, SPRITE_PIDGEOT, STAY, DOWN, TEXT_SAFFRONCITY_PIDGEOT
	object_event 18,  8, SPRITE_ROCKER, STAY, UP, TEXT_SAFFRONCITY_ROCKER
	object_event 18, 22, SPRITE_ROCKET, STAY, DOWN, TEXT_SAFFRONCITY_ROCKET8

	def_warps_to SAFFRON_CITY
