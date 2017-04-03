divert(-1)

###############################################################
# DEVKITSMS CONFIGURATION March 29, 2017
# rebuild the library if changes are made
#

# SMSLIB

define(`__SMSLIB_MAXSPRITES',  64)

define(`__SMSLIB_PNTADDRESS',  0x7800)
define(`__SMSLIB_SATADDRESS',  0x7f00)
define(`__SMSLIB_CRAMADDRESS', 0xc000)

define(`__SMSLIB_ISRST_SMSCRT0RST08', 0x08)   # make zero to turn into call
define(`__SMSLIB_ISRST_SMSCRT0RST18', 0x18)   # make zero to turn into call

#
# BELOW ARE DEFINED CONSTANTS ONLY
#

# PSGLIB

define(`__PSGLIB_PSG_STOPPED', 0)
define(`__PSGLIB_PSG_PLAYING', 1)

define(`__PSGLIB_SFX_CHANNEL2',      0x01)
define(`__PSGLIB_SFX_CHANNEL3',      0x02)
define(`__PSGLIB_SFX_CHANNELS2AND3', 0x03)

# SMSLIB

define(`__SMSLIB_VDPFEATURE_EXTRAHEIGHT',   0x0002)
define(`__SMSLIB_VDPFEATURE_SHIFTSPRITES',  0x0008)
define(`__SMSLIB_VDPFEATURE_HIDEFIRSTCOL',  0x0020)
define(`__SMSLIB_VDPFEATURE_LEFTCOLBLANK',  0x0020)
define(`__SMSLIB_VDPFEATURE_LOCKHSCROLL',   0x0040)
define(`__SMSLIB_VDPFEATURE_LOCKVSCROLL',   0x0080)

define(`__SMSLIB_VDPFEATURE_ZOOMSPRITES',   0x0101)
define(`__SMSLIB_VDPFEATURE_USETALLSPRITES', 0x0102)
define(`__SMSLIB_VDPFEATURE_240LINES',      0x0108)
define(`__SMSLIB_VDPFEATURE_224LINES',      0x0110)
define(`__SMSLIB_VDPFEATURE_FRAMEIRQ',      0x0120)
define(`__SMSLIB_VDPFEATURE_SHOWDISPLAY',   0x0140)

define(`__SMSLIB_SPRITEMODE_NORMAL',      0x00)
define(`__SMSLIB_SPRITEMODE_TALL',        0x01)
define(`__SMSLIB_SPRITEMODE_ZOOMED',      0x02)
define(`__SMSLIB_SPRITEMODE_TALL_ZOOMED', 0x03)

define(`__SMSLIB_TILE_FLIPPED_X',          0x0200)
define(`__SMSLIB_TILE_FLIPPED_Y',          0x0400)
define(`__SMSLIB_TILE_USE_SPRITE_PALETTE', 0x0800)
define(`__SMSLIB_TILE_PRIORITY',           0x1000)

define(`__SMSLIB_PORT_A_KEY_UP',    0x0001)
define(`__SMSLIB_PORT_A_KEY_DOWN',  0x0002)
define(`__SMSLIB_PORT_A_KEY_LEFT',  0x0004)
define(`__SMSLIB_PORT_A_KEY_RIGHT', 0x0008)
define(`__SMSLIB_PORT_A_KEY_1',     0x0010)
define(`__SMSLIB_PORT_A_KEY_2',     0x0020)
define(`__SMSLIB_PORT_A_KEY_START', __SMSLIB_PORT_A_KEY_1)

define(`__SMSLIB_PORT_B_KEY_UP',    0x0040)
define(`__SMSLIB_PORT_B_KEY_DOWN',  0x0080)
define(`__SMSLIB_PORT_B_KEY_LEFT',  0x0100)
define(`__SMSLIB_PORT_B_KEY_RIGHT', 0x0200)
define(`__SMSLIB_PORT_B_KEY_1',     0x0400)
define(`__SMSLIB_PORT_B_KEY_2',     0x0800)
define(`__SMSLIB_PORT_B_KEY_START', __SMSLIB_PORT_A_KEY_1)

define(`__SMSLIB_RESET_KEY',        0x1000)
define(`__SMSLIB_CARTRIDGE_SLOT',   0x2000)
define(`__SMSLIB_PORT_A_TH',        0x4000)
define(`__SMSLIB_PORT_B_TH',        0x8000)

define(`__SMSLIB_PORT_A_MD_KEY_Z',     0x0001)
define(`__SMSLIB_PORT_A_MD_KEY_Y',     0x0002)
define(`__SMSLIB_PORT_A_MD_KEY_X',     0x0004)
define(`__SMSLIB_PORT_A_MD_KEY_MODE',  0x0008)
define(`__SMSLIB_PORT_A_MD_KEY_A',     0x0010)
define(`__SMSLIB_PORT_A_MD_KEY_START', 0x0020)

define(`__SMSLIB_VDP_PAL',  0x80)
define(`__SMSLIB_VDP_NTSC', 0x40)

define(`__SMSLIB_VDPFLAG_SPRITEOVERFLOW',  0x40)
define(`__SMSLIB_VDPFLAG_SPRITECOLLISION', 0x20)

#
# END OF USER CONFIGURATION
###############################################################

divert(0)

dnl#
dnl# COMPILE TIME CONFIG EXPORT FOR ASSEMBLY LANGUAGE
dnl#

ifdef(`CFG_ASM_PUB',
`
PUBLIC `__SMSLIB_MAXSPRITES'

PUBLIC `__SMSLIB_PNTADDRESS'
PUBLIC `__SMSLIB_SATADDRESS'
PUBLIC `__SMSLIB_CRAMADDRESS'

PUBLIC `__SMSLIB_ISRST_SMSCRT0RST08'
PUBLIC `__SMSLIB_ISRST_SMSCRT0RST18'

PUBLIC `__PSGLIB_PSG_STOPPED'
PUBLIC `__PSGLIB_PSG_PLAYING'

PUBLIC `__PSGLIB_SFX_CHANNEL2'
PUBLIC `__PSGLIB_SFX_CHANNEL3'
PUBLIC `__PSGLIB_SFX_CHANNELS2AND3'

PUBLIC `__SMSLIB_VDPFEATURE_EXTRAHEIGHT'
PUBLIC `__SMSLIB_VDPFEATURE_SHIFTSPRITES'
PUBLIC `__SMSLIB_VDPFEATURE_HIDEFIRSTCOL'
PUBLIC `__SMSLIB_VDPFEATURE_LEFTCOLBLANK'
PUBLIC `__SMSLIB_VDPFEATURE_LOCKHSCROLL'
PUBLIC `__SMSLIB_VDPFEATURE_LOCKVSCROLL'

PUBLIC `__SMSLIB_VDPFEATURE_ZOOMSPRITES'
PUBLIC `__SMSLIB_VDPFEATURE_USETALLSPRITES'
PUBLIC `__SMSLIB_VDPFEATURE_240LINES'
PUBLIC `__SMSLIB_VDPFEATURE_224LINES'
PUBLIC `__SMSLIB_VDPFEATURE_FRAMEIRQ'
PUBLIC `__SMSLIB_VDPFEATURE_SHOWDISPLAY'

PUBLIC `__SMSLIB_SPRITEMODE_NORMAL'
PUBLIC `__SMSLIB_SPRITEMODE_TALL'
PUBLIC `__SMSLIB_SPRITEMODE_ZOOMED'
PUBLIC `__SMSLIB_SPRITEMODE_TALL_ZOOMED'

PUBLIC `__SMSLIB_TILE_FLIPPED_X'
PUBLIC `__SMSLIB_TILE_FLIPPED_Y'
PUBLIC `__SMSLIB_TILE_USE_SPRITE_PALETTE'
PUBLIC `__SMSLIB_TILE_PRIORITY'

PUBLIC `__SMSLIB_PORT_A_KEY_UP'
PUBLIC `__SMSLIB_PORT_A_KEY_DOWN'
PUBLIC `__SMSLIB_PORT_A_KEY_LEFT'
PUBLIC `__SMSLIB_PORT_A_KEY_RIGHT'
PUBLIC `__SMSLIB_PORT_A_KEY_1'
PUBLIC `__SMSLIB_PORT_A_KEY_2'
PUBLIC `__SMSLIB_PORT_A_KEY_START'

PUBLIC `__SMSLIB_PORT_B_KEY_UP'
PUBLIC `__SMSLIB_PORT_B_KEY_DOWN'
PUBLIC `__SMSLIB_PORT_B_KEY_LEFT'
PUBLIC `__SMSLIB_PORT_B_KEY_RIGHT'
PUBLIC `__SMSLIB_PORT_B_KEY_1'
PUBLIC `__SMSLIB_PORT_B_KEY_2'
PUBLIC `__SMSLIB_PORT_B_KEY_START'

PUBLIC `__SMSLIB_RESET_KEY'
PUBLIC `__SMSLIB_CARTRIDGE_SLOT'
PUBLIC `__SMSLIB_PORT_A_TH'
PUBLIC `__SMSLIB_PORT_B_TH'

PUBLIC `__SMSLIB_PORT_A_MD_KEY_Z'
PUBLIC `__SMSLIB_PORT_A_MD_KEY_Y'
PUBLIC `__SMSLIB_PORT_A_MD_KEY_X'
PUBLIC `__SMSLIB_PORT_A_MD_KEY_MODE'
PUBLIC `__SMSLIB_PORT_A_MD_KEY_A'
PUBLIC `__SMSLIB_PORT_A_MD_KEY_START'

PUBLIC `__SMSLIB_VDP_PAL'
PUBLIC `__SMSLIB_VDP_NTSC'

PUBLIC `__SMSLIB_VDPFLAG_SPRITEOVERFLOW'
PUBLIC `__SMSLIB_VDPFLAG_SPRITECOLLISION'
')

dnl#
dnl# LIBRARY BUILD TIME CONFIG FOR ASSEMBLY LANGUAGE
dnl#

ifdef(`CFG_ASM_DEF',
`
defc `__SMSLIB_MAXSPRITES' = __SMSLIB_MAXSPRITES

defc `__SMSLIB_PNTADDRESS' = __SMSLIB_PNTADDRESS
defc `__SMSLIB_SATADDRESS' = __SMSLIB_SATADDRESS
defc `__SMSLIB_CRAMADDRESS' = __SMSLIB_CRAMADDRESS

defc `__SMSLIB_ISRST_SMSCRT0RST08' = __SMSLIB_ISRST_SMSCRT0RST08
defc `__SMSLIB_ISRST_SMSCRT0RST18' = __SMSLIB_ISRST_SMSCRT0RST18

defc `__PSGLIB_PSG_STOPPED' = __PSGLIB_PSG_STOPPED
defc `__PSGLIB_PSG_PLAYING' = __PSGLIB_PSG_PLAYING

defc `__PSGLIB_SFX_CHANNEL2' = __PSGLIB_SFX_CHANNEL2
defc `__PSGLIB_SFX_CHANNEL3' = __PSGLIB_SFX_CHANNEL3
defc `__PSGLIB_SFX_CHANNELS2AND3' = __PSGLIB_SFX_CHANNELS2AND3

defc `__SMSLIB_VDPFEATURE_EXTRAHEIGHT' = __SMSLIB_VDPFEATURE_EXTRAHEIGHT
defc `__SMSLIB_VDPFEATURE_SHIFTSPRITES' = __SMSLIB_VDPFEATURE_SHIFTSPRITES
defc `__SMSLIB_VDPFEATURE_HIDEFIRSTCOL' = __SMSLIB_VDPFEATURE_HIDEFIRSTCOL
defc `__SMSLIB_VDPFEATURE_LEFTCOLBLANK' = __SMSLIB_VDPFEATURE_LEFTCOLBLANK
defc `__SMSLIB_VDPFEATURE_LOCKHSCROLL' = __SMSLIB_VDPFEATURE_LOCKHSCROLL
defc `__SMSLIB_VDPFEATURE_LOCKVSCROLL' = __SMSLIB_VDPFEATURE_LOCKVSCROLL

defc `__SMSLIB_VDPFEATURE_ZOOMSPRITES' = __SMSLIB_VDPFEATURE_ZOOMSPRITES
defc `__SMSLIB_VDPFEATURE_USETALLSPRITES' = __SMSLIB_VDPFEATURE_USETALLSPRITES
defc `__SMSLIB_VDPFEATURE_240LINES' = __SMSLIB_VDPFEATURE_240LINES
defc `__SMSLIB_VDPFEATURE_224LINES' = __SMSLIB_VDPFEATURE_224LINES
defc `__SMSLIB_VDPFEATURE_FRAMEIRQ' = __SMSLIB_VDPFEATURE_FRAMEIRQ
defc `__SMSLIB_VDPFEATURE_SHOWDISPLAY' = __SMSLIB_VDPFEATURE_SHOWDISPLAY

defc `__SMSLIB_SPRITEMODE_NORMAL' = __SMSLIB_SPRITEMODE_NORMAL
defc `__SMSLIB_SPRITEMODE_TALL' = __SMSLIB_SPRITEMODE_TALL
defc `__SMSLIB_SPRITEMODE_ZOOMED' = __SMSLIB_SPRITEMODE_ZOOMED
defc `__SMSLIB_SPRITEMODE_TALL_ZOOMED' = __SMSLIB_SPRITEMODE_TALL_ZOOMED

defc `__SMSLIB_TILE_FLIPPED_X' = __SMSLIB_TILE_FLIPPED_X
defc `__SMSLIB_TILE_FLIPPED_Y' = __SMSLIB_TILE_FLIPPED_Y
defc `__SMSLIB_TILE_USE_SPRITE_PALETTE' = __SMSLIB_TILE_USE_SPRITE_PALETTE
defc `__SMSLIB_TILE_PRIORITY' = __SMSLIB_TILE_PRIORITY

defc `__SMSLIB_PORT_A_KEY_UP' = __SMSLIB_PORT_A_KEY_UP
defc `__SMSLIB_PORT_A_KEY_DOWN' = __SMSLIB_PORT_A_KEY_DOWN
defc `__SMSLIB_PORT_A_KEY_LEFT' = __SMSLIB_PORT_A_KEY_LEFT
defc `__SMSLIB_PORT_A_KEY_RIGHT' = __SMSLIB_PORT_A_KEY_RIGHT
defc `__SMSLIB_PORT_A_KEY_1' = __SMSLIB_PORT_A_KEY_1
defc `__SMSLIB_PORT_A_KEY_2' = __SMSLIB_PORT_A_KEY_2
defc `__SMSLIB_PORT_A_KEY_START' = __SMSLIB_PORT_A_KEY_START

defc `__SMSLIB_PORT_B_KEY_UP' = __SMSLIB_PORT_B_KEY_UP
defc `__SMSLIB_PORT_B_KEY_DOWN' = __SMSLIB_PORT_B_KEY_DOWN
defc `__SMSLIB_PORT_B_KEY_LEFT' = __SMSLIB_PORT_B_KEY_LEFT
defc `__SMSLIB_PORT_B_KEY_RIGHT' = __SMSLIB_PORT_B_KEY_RIGHT
defc `__SMSLIB_PORT_B_KEY_1' = __SMSLIB_PORT_B_KEY_1
defc `__SMSLIB_PORT_B_KEY_2' = __SMSLIB_PORT_B_KEY_2
defc `__SMSLIB_PORT_B_KEY_START' = __SMSLIB_PORT_B_KEY_START

defc `__SMSLIB_RESET_KEY' = __SMSLIB_RESET_KEY
defc `__SMSLIB_CARTRIDGE_SLOT' = __SMSLIB_CARTRIDGE_SLOT
defc `__SMSLIB_PORT_A_TH' = __SMSLIB_PORT_A_TH
defc `__SMSLIB_PORT_B_TH' = __SMSLIB_PORT_B_TH

defc `__SMSLIB_PORT_A_MD_KEY_Z' = __SMSLIB_PORT_A_MD_KEY_Z
defc `__SMSLIB_PORT_A_MD_KEY_Y' = __SMSLIB_PORT_A_MD_KEY_Y
defc `__SMSLIB_PORT_A_MD_KEY_X' = __SMSLIB_PORT_A_MD_KEY_X
defc `__SMSLIB_PORT_A_MD_KEY_MODE' = __SMSLIB_PORT_A_MD_KEY_MODE
defc `__SMSLIB_PORT_A_MD_KEY_A' = __SMSLIB_PORT_A_MD_KEY_A
defc `__SMSLIB_PORT_A_MD_KEY_START' = __SMSLIB_PORT_A_MD_KEY_START

defc `__SMSLIB_VDP_PAL' = __SMSLIB_VDP_PAL
defc `__SMSLIB_VDP_NTSC' = __SMSLIB_VDP_NTSC

defc `__SMSLIB_VDPFLAG_SPRITEOVERFLOW' = __SMSLIB_VDPFLAG_SPRITEOVERFLOW
defc `__SMSLIB_VDPFLAG_SPRITECOLLISION' = __SMSLIB_VDPFLAG_SPRITECOLLISION
')

dnl#
dnl# COMPILE TIME CONFIG EXPORT FOR C
dnl#

ifdef(`CFG_C_DEF',
`
`#define' `__SMSLIB_MAXSPRITES'   __SMSLIB_MAXSPRITES

`#define' `__SMSLIB_PNTADDRESS'   __SMSLIB_PNTADDRESS
`#define' `__SMSLIB_SATADDRESS'   __SMSLIB_SATADDRESS
`#define' `__SMSLIB_CRAMADDRESS'   __SMSLIB_CRAMADDRESS

`#define' `__SMSLIB_ISRST_SMSCRT0RST08'   __SMSLIB_ISRST_SMSCRT0RST08
`#define' `__SMSLIB_ISRST_SMSCRT0RST18'   __SMSLIB_ISRST_SMSCRT0RST18

`#define' `__PSGLIB_PSG_STOPPED'   __PSGLIB_PSG_STOPPED
`#define' `__PSGLIB_PSG_PLAYING'   __PSGLIB_PSG_PLAYING

`#define' `__PSGLIB_SFX_CHANNEL2'   __PSGLIB_SFX_CHANNEL2
`#define' `__PSGLIB_SFX_CHANNEL3'   __PSGLIB_SFX_CHANNEL3
`#define' `__PSGLIB_SFX_CHANNELS2AND3'   __PSGLIB_SFX_CHANNELS2AND3

`#define' `__SMSLIB_VDPFEATURE_EXTRAHEIGHT'   __SMSLIB_VDPFEATURE_EXTRAHEIGHT
`#define' `__SMSLIB_VDPFEATURE_SHIFTSPRITES'   __SMSLIB_VDPFEATURE_SHIFTSPRITES
`#define' `__SMSLIB_VDPFEATURE_HIDEFIRSTCOL'   __SMSLIB_VDPFEATURE_HIDEFIRSTCOL
`#define' `__SMSLIB_VDPFEATURE_LEFTCOLBLANK'   __SMSLIB_VDPFEATURE_LEFTCOLBLANK
`#define' `__SMSLIB_VDPFEATURE_LOCKHSCROLL'   __SMSLIB_VDPFEATURE_LOCKHSCROLL
`#define' `__SMSLIB_VDPFEATURE_LOCKVSCROLL'   __SMSLIB_VDPFEATURE_LOCKVSCROLL

`#define' `__SMSLIB_VDPFEATURE_ZOOMSPRITES'   __SMSLIB_VDPFEATURE_ZOOMSPRITES
`#define' `__SMSLIB_VDPFEATURE_USETALLSPRITES'   __SMSLIB_VDPFEATURE_USETALLSPRITES
`#define' `__SMSLIB_VDPFEATURE_240LINES'   __SMSLIB_VDPFEATURE_240LINES
`#define' `__SMSLIB_VDPFEATURE_224LINES'   __SMSLIB_VDPFEATURE_224LINES
`#define' `__SMSLIB_VDPFEATURE_FRAMEIRQ'   __SMSLIB_VDPFEATURE_FRAMEIRQ
`#define' `__SMSLIB_VDPFEATURE_SHOWDISPLAY'   __SMSLIB_VDPFEATURE_SHOWDISPLAY

`#define' `__SMSLIB_SPRITEMODE_NORMAL'   __SMSLIB_SPRITEMODE_NORMAL
`#define' `__SMSLIB_SPRITEMODE_TALL'   __SMSLIB_SPRITEMODE_TALL
`#define' `__SMSLIB_SPRITEMODE_ZOOMED'   __SMSLIB_SPRITEMODE_ZOOMED
`#define' `__SMSLIB_SPRITEMODE_TALL_ZOOMED'   __SMSLIB_SPRITEMODE_TALL_ZOOMED

`#define' `__SMSLIB_TILE_FLIPPED_X'   __SMSLIB_TILE_FLIPPED_X
`#define' `__SMSLIB_TILE_FLIPPED_Y'   __SMSLIB_TILE_FLIPPED_Y
`#define' `__SMSLIB_TILE_USE_SPRITE_PALETTE'   __SMSLIB_TILE_USE_SPRITE_PALETTE
`#define' `__SMSLIB_TILE_PRIORITY'   __SMSLIB_TILE_PRIORITY

`#define' `__SMSLIB_PORT_A_KEY_UP'   __SMSLIB_PORT_A_KEY_UP
`#define' `__SMSLIB_PORT_A_KEY_DOWN'   __SMSLIB_PORT_A_KEY_DOWN
`#define' `__SMSLIB_PORT_A_KEY_LEFT'   __SMSLIB_PORT_A_KEY_LEFT
`#define' `__SMSLIB_PORT_A_KEY_RIGHT'   __SMSLIB_PORT_A_KEY_RIGHT
`#define' `__SMSLIB_PORT_A_KEY_1'   __SMSLIB_PORT_A_KEY_1
`#define' `__SMSLIB_PORT_A_KEY_2'   __SMSLIB_PORT_A_KEY_2
`#define' `__SMSLIB_PORT_A_KEY_START'   __SMSLIB_PORT_A_KEY_START

`#define' `__SMSLIB_PORT_B_KEY_UP'   __SMSLIB_PORT_B_KEY_UP
`#define' `__SMSLIB_PORT_B_KEY_DOWN'   __SMSLIB_PORT_B_KEY_DOWN
`#define' `__SMSLIB_PORT_B_KEY_LEFT'   __SMSLIB_PORT_B_KEY_LEFT
`#define' `__SMSLIB_PORT_B_KEY_RIGHT'   __SMSLIB_PORT_B_KEY_RIGHT
`#define' `__SMSLIB_PORT_B_KEY_1'   __SMSLIB_PORT_B_KEY_1
`#define' `__SMSLIB_PORT_B_KEY_2'   __SMSLIB_PORT_B_KEY_2
`#define' `__SMSLIB_PORT_B_KEY_START'   __SMSLIB_PORT_B_KEY_START

`#define' `__SMSLIB_RESET_KEY'   __SMSLIB_RESET_KEY
`#define' `__SMSLIB_CARTRIDGE_SLOT'   __SMSLIB_CARTRIDGE_SLOT
`#define' `__SMSLIB_PORT_A_TH'   __SMSLIB_PORT_A_TH
`#define' `__SMSLIB_PORT_B_TH'   __SMSLIB_PORT_B_TH

`#define' `__SMSLIB_PORT_A_MD_KEY_Z'   __SMSLIB_PORT_A_MD_KEY_Z
`#define' `__SMSLIB_PORT_A_MD_KEY_Y'   __SMSLIB_PORT_A_MD_KEY_Y
`#define' `__SMSLIB_PORT_A_MD_KEY_X'   __SMSLIB_PORT_A_MD_KEY_X
`#define' `__SMSLIB_PORT_A_MD_KEY_MODE'   __SMSLIB_PORT_A_MD_KEY_MODE
`#define' `__SMSLIB_PORT_A_MD_KEY_A'   __SMSLIB_PORT_A_MD_KEY_A
`#define' `__SMSLIB_PORT_A_MD_KEY_START'   __SMSLIB_PORT_A_MD_KEY_START

`#define' `__SMSLIB_VDP_PAL'   __SMSLIB_VDP_PAL
`#define' `__SMSLIB_VDP_NTSC'   __SMSLIB_VDP_NTSC

`#define' `__SMSLIB_VDPFLAG_SPRITEOVERFLOW'   __SMSLIB_VDPFLAG_SPRITEOVERFLOW
`#define' `__SMSLIB_VDPFLAG_SPRITECOLLISION'   __SMSLIB_VDPFLAG_SPRITECOLLISION
')
