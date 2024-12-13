RedsHouse1FPrintMomText::
	CheckEvent EVENT_MOM_CONGRATULATE_CHAMPION
	jr nz, .continue
	ld a, [wGameStage]
	and a
	jr z, .continue ; skip if not beat the game
	ld hl, RedsHouse1FMomChampionText
	call PrintText
	SetEvent EVENT_MOM_CONGRATULATE_CHAMPION
	jr .done
.continue
	ld a, [wd72e]
	bit 3, a ; received a Pokémon from Oak?
	jp nz, RedsHouse1FMomHealScript
	ld hl, .WakeUpText
	call PrintText
.done
	ret

.WakeUpText:
	text_far _RedsHouse1FMomWakeUpText
	text_end
RedsHouse1FMomChampionText:
	text_far _RedsHouse1FMomChampionText
	text_end

RedsHouse1FMomHealScript:
	ld hl, RedsHouse1FMomYouShouldRestText
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
.next
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .next
	ld a, [wMapMusicSoundID]
	ld [wNewSoundID], a
	call PlaySound
	call GBFadeInFromWhite
	ld hl, RedsHouse1FMomLookingGreatText
	call PrintText
	ret

RedsHouse1FMomYouShouldRestText:
	text_far _RedsHouse1FMomYouShouldRestText
	text_end
RedsHouse1FMomLookingGreatText:
	text_far _RedsHouse1FMomLookingGreatText
	text_end

RedsHouse1FPrintTVText::
	ld hl, .WrongSideText
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jp nz, .got_text
	ld hl, .StandByMeMovieText
.got_text
	call PrintText
	ret

.StandByMeMovieText:
	text_far _RedsHouse1FTVStandByMeMovieText
	text_end

.WrongSideText:
	text_far _RedsHouse1FTVWrongSideText
	text_end
