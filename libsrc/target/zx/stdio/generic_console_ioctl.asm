
	MODULE	generic_console_ioctl
	PUBLIC	generic_console_ioctl

	SECTION	code_clib
	INCLUDE	"ioctl.def"

	EXTERN	generic_console_cls
	EXTERN	__zx_32col_font
	EXTERN	__zx_64col_font
	EXTERN	__zx_32col_udgs
	EXTERN	__zx_screenmode
	EXTERN	__console_w

	EXTERN	__asm_zxn_copytiles


        PUBLIC          CLIB_GENCON_CAPS
        defc            CLIB_GENCON_CAPS = CAP_GENCON_INVERSE | CAP_GENCON_BOLD | CAP_GENCON_UNDERLINE | CAP_GENCON_CUSTOM_FONT | CAP_GENCON_UDGS | CAP_GENCON_FG_COLOUR | CAP_GENCON_BG_COLOUR

; a = ioctl
; de = arg
generic_console_ioctl:
	ex	de,hl
	ld	c,(hl)	;bc = where we point to
	inc	hl
	ld	b,(hl)
	cp	IOCTL_GENCON_SET_FONT32
	jr	nz,check_set_font64
	ld	(__zx_32col_font),bc
IF FORzxn
	ld	de,$6020
ENDIF
font_success:
IF FORzxn
	ld	a,(__zx_screenmode)
	bit	6,a
	jr	z,success
	; Register shuffle
	ld	l,c
	ld	h,b
	ld	c,e
	ld	b,d
	call	__asm_zxn_copytiles
ENDIF
success:
	and	a
	ret
check_set_font64:
	cp	IOCTL_GENCON_SET_FONT64
	jr	nz,check_set_udg
	ld	(__zx_64col_font),bc
	jr	success
check_set_udg:
	cp	IOCTL_GENCON_SET_UDGS
	jr	nz,check_mode
	ld	(__zx_32col_udgs),bc
	ld	de,$8080
	jr	font_success
check_mode:
IF FORts2068 | FORzxn
	cp	IOCTL_GENCON_SET_MODE
	jr	nz,failure
	ld	a,c
	; 0 = screen 0
	; 1 = screen 1
	; 2 = high colour
	; 6 = hires
	ld	l,64
	cp	0
	jr	z,set_mode
	cp	1
	jr	z,set_mode
	cp	2
	jr	z,set_mode
	and	7
	cp	6
	ld	l,128
IF !FORzxn
	jr	nz,failure
ELSE
	jr	z,set_mode
;zxn modes
	ld	a,r
	out	(254),a
	ld	a,c
	ld	(__zx_screenmode),a
	nextreg	$6b,@10000001
	nextreg	$6c,@10000000
	nextreg	$6e,$6c ;tile map
	nextreg	$6f,$5c	;tile definition
	ld	hl,$2028
	ld	(__console_w),hl
	jr	success
ENDIF
set_mode:
	ld	(__zx_screenmode),a
	ld	h,$18
	ld	(__console_w),hl
	in	a,($ff)
	and	@1100000
	ld	b,a
	ld	a,c
	and	@00111111
	or	b
	out	($ff),a
	call	generic_console_cls
	jr	success
ENDIF
failure:
	scf
	ret
