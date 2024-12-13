HandleLedges::
	ld a, [wd736]
	bit 6, a ; already jumping down ledge
	ret nz
	ld a, [wCurMapTileset]
	and a ; OVERWORLD
	ret nz
	predef GetTileAndCoordsInFrontOfPlayer
	ld a, [wSpritePlayerStateData1FacingDirection]
	ld b, a
	lda_coord 8, 9
	ld c, a
	ld a, [wTileInFrontOfPlayer]
	ld d, a
	ld hl, LedgeTiles
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr nz, .nextLedgeTile1
	ld a, [hli]
	cp c
	jr nz, .nextLedgeTile2
	ld a, [hli]
	cp d
	jr nz, .nextLedgeTile3
	ld a, [hl]
	ld e, a
	jr .foundMatch
.nextLedgeTile1
	inc hl
.nextLedgeTile2
	inc hl
.nextLedgeTile3
	inc hl
	jr .loop
.foundMatch
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_DOWN
	lda_coord  8, 13
	jr z, .checkCollision
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_LEFT
	lda_coord  4,  9
	jr z, .checkCollision
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	lda_coord 12,  9
	jr z, .checkCollision
.noCollisionTile
	ldh a, [hJoyHeld]
	and e
	ret z
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld hl, wd736
	set 6, [hl] ; jumping down ledge
	call StartSimulatingJoypadStates
	ld a, e
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, $2
	ld [wSimulatedJoypadStatesIndex], a
	call LoadHoppingShadowOAM
	ld a, SFX_LEDGE
	call PlaySound
	ret

.checkCollision
	cp $00
	jr z, .noCollisionTile
	cp $10
	jr z, .noCollisionTile
	cp $20
	jr z, .noCollisionTile
	cp $21
	jr z, .noCollisionTile
	cp $23
	jr z, .noCollisionTile
	cp $2c
	jr z, .noCollisionTile
	cp $2e
	jr z, .noCollisionTile
	cp $30
	jr z, .noCollisionTile
	cp $39
	jr z, .noCollisionTile
	cp $3c
	jr z, .noCollisionTile
	cp $52
	jr z, .noCollisionTile
	cp $5b
	jr z, .noCollisionTile
	ret

INCLUDE "data/tilesets/ledge_tiles.asm"

LoadHoppingShadowOAM:
	ld hl, vChars1 tile $7f
	ld de, LedgeHoppingShadow
	lb bc, BANK(LedgeHoppingShadow), (LedgeHoppingShadowEnd - LedgeHoppingShadow) / $8
	call CopyVideoDataDouble
	ld hl, LedgeHoppingShadowOAM
	ld de, wShadowOAMSprite36
	ld bc, LedgeHoppingShadowOAMEnd - LedgeHoppingShadowOAM
	call CopyData
	ld a, $a0
	ld [wShadowOAMSprite38YCoord], a
	ld [wShadowOAMSprite39YCoord], a
	ret

LedgeHoppingShadow:
	INCBIN "gfx/overworld/shadow.1bpp"
LedgeHoppingShadowEnd:

LedgeHoppingShadowOAM:
	dbsprite  9, 11,  0,  0, $ff, 0
	dbsprite 10, 11,  0,  0, $ff, OAM_HFLIP
LedgeHoppingShadowOAMEnd:
