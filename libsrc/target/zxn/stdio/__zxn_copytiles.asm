


	MODULE		asm_zxn_copytiles

	PUBLIC		__asm_zxn_copytiles

; Copy a standard 8x8 font into tiles
;
; Entry: hl = font
;	  c = starting tile
;	  b = number of tiles
;
; We use palette index 0 and 1 to represent set bits
__asm_zxn_copytiles:
	ex	de,hl
	ld	l,c
	push	bc
	ld	a,$6f
	ld	bc,0x243b
	out	(c),a
	inc	b
	in	b,(c)
	ld	c,0
	; Get the tile position (starting tile *32)
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,bc	;Add on tiledefinition address
	ex	de,hl	;de = tilemaps, hl = font
	pop	bc

loop_char:
	push	bc

	ld	b,8
loop:
	ld	c,(hl)

	xor	a	;Default value
	rlc	c
	jr	nc,notset_7
	ld	a,@00010000
notset_7:
	rlc	c
	jr	nc,notset_6
	or	@00000001
notset_6:
	ld	(de),a
	inc	de

	xor	a	;Default value
	rlc	c
	jr	nc,notset_5
	ld	a,@00010000
notset_5:
	rlc	c
	jr	nc,notset_4
	or	@00000001
notset_4:
	ld	(de),a
	inc	de

	xor	a	;Default value
	rlc	c
	jr	nc,notset_3
	ld	a,@00010000
notset_3:
	rlc	c
	jr	nc,notset_2
	or	@00000001
notset_2:
	ld	(de),a
	inc	de

	xor	a	;Default value
	rlc	c
	jr	nc,notset_1
	ld	a,@00010000
notset_1:
	rlc	c
	jr	nc,notset_0
	or	@00000001
notset_0:
	ld	(de),a
	inc	de
	inc	hl
	djnz	loop
	pop	bc
	djnz	loop_char
	ret



	


