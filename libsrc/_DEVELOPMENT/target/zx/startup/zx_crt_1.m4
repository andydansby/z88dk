
dnl############################################################
dnl##      ZX_CRT_1.M4 - GENERATOR FOR ZX_CRT_1.ASM          ##
dnl############################################################
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                    zx spectrum crt_1                      ;;
;;      generated by target/zx/startup/zx_crt_1.m4           ;;
;;                                                           ;;
;;      48k memory model  (flat 64k address space)           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CRT AND CLIB CONFIGURATION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../crt_defaults.inc"
include "crt_target_defaults.inc"
include "../crt_rules.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SET UP MEMORY MODEL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../crt_memory_model.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GLOBAL SYMBOLS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../clib_constants.inc"
include "clib_target_constants.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INSTANTIATE DRIVERS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dnl
dnl############################################################
dnl## LIST OF AVAILABLE DRIVERS WITH STATIC INSTANTIATORS #####
dnl############################################################
dnl
dnl## input terminals
dnl
dnl#include(../driver/terminal/zx_01_input_kbd_inkey.m4)dnl
dnl#include(../driver/terminal/zx_01_input_kbd_lastk.m4)dnl
dnl
dnl## output terminals
dnl
dnl#include(../driver/terminal/zx_01_output_char_32.m4)dnl
dnl#include(../driver/terminal/zx_01_output_char_32_tty_z88dk.m4)dnl
dnl#include(../driver/terminal/zx_01_output_char_64.m4)dnl
dnl#include(../driver/terminal/zx_01_output_char_64_tty_z88dk.m4)dnl
dnl#include(../driver/terminal/zx_01_output_fzx.m4)dnl
dnl#include(../driver/terminal/zx_01_output_fzx_tty_z88dk.m4)dnl
dnl
dnl## file dup
dnl
dnl#include(../../m4_file_dup.m4)dnl
dnl
dnl## empty fd slot
dnl
dnl#include(../../m4_file_absent.m4)dnl
dnl
dnl############################################################
dnl## INSTANTIATE DRIVERS #####################################
dnl############################################################

EXTERN _font_4x8_def

include(../../clib_instantiate_begin.m4)

include(../driver/terminal/zx_01_input_kbd_inkey.m4)dnl
m4_zx_01_input_kbd_inkey(_stdin, __i_fcntl_fdstruct_3, 0x02b0, 64, 0, 500, 15)dnl

include(../driver/terminal/zx_01_output_char_64.m4)dnl
m4_zx_01_output_char_64(_stdout, 0x2370, 0, 0, 2, 44, 1, 18, 0, _font_4x8_def - 256, 0x0f, 0, 0x0f)dnl

include(../../m4_file_dup.m4)dnl
m4_file_dup(_stderr, 0x80, __i_fcntl_fdstruct_1)dnl

include(../driver/terminal/zx_01_output_char_32.m4)dnl
m4_zx_01_output_char_32(_edit, 0x2230, 0, 0, 1, 30, 20, 3, 0, 15360, 56, 0, 56)dnl

include(../driver/terminal/zx_01_output_char_64.m4)dnl
m4_zx_01_output_char_64(_sidebar, 0x20b0, 0, 0, 48, 14, 1, 18, 0, _font_4x8_def - 256, 0x27, 0, 0x27)dnl

include(../../clib_instantiate_end.m4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STARTUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION code_crt_start

PUBLIC __Start, __Exit

EXTERN _main

__Start:

   IF __crt_enable_restart = 0
   
      ; save state required for successful return to basic
      
      push iy
      exx
      push hl
   
   ENDIF

   ; save stack address for safe exit
   
   ld (__sp),sp
   include "../clib_init_sp.inc"

   ; parse command line
   
   IF 1                        ; IF __crt_enable_commandline = 1
      
      IF __SDCC | __SDCC_IX | __SDCC_IY
      
         ld hl,0
         push hl               ; char *argv[]
         push hl               ; int argc

      ELSE
            
         ld hl,0
         push hl               ; int argc
         push hl               ; char *argv[]
   
      ENDIF
   
   ENDIF
   
   ; initialize sections
   
   include "../clib_init_bss.inc"
   include "../clib_init_data.inc"

SECTION code_crt_init          ; user and library initialization
SECTION code_crt_main

   ; call user program
   
   call _main                  ; hl = return status

   ; run exit stack

   IF __clib_exit_stack_size > 0
   
      EXTERN asm_exit
      jp asm_exit              ; exit function jumps to __Exit
   
   ENDIF

__Exit:

   IF __crt_enable_restart = 0
   
      ; returning to caller

      push hl                  ; save return status
   
   ENDIF
   
SECTION code_crt_exit          ; user and library cleanup
SECTION code_crt_return

   ; close files
   
   include "../clib_close.inc"

   ; exit program
   
   IF __crt_enable_restart = 0
   
      ; returning to basic
      
      pop bc                   ; bc = return status
      
      ld sp,(__sp)             ; reset stack location
      
      exx
      pop hl
      exx
      pop iy
      
      im 1
      ei
      ret
   
   ELSE
   
      ; restarting program
      
      ld sp,(__sp)             ; reset stack location
      jp __Start
   
   ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RUNTIME VARS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION bss_user

__sp:  defw 0

include "../clib_variables.inc"
include "clib_target_variables.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLIB STUBS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../clib_stubs.inc"
