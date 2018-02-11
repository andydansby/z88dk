
// automatically generated by m4 from headers in proto subdir


#ifndef __IM2_H__
#define __IM2_H__

#include <stdint.h>

extern void __LIB__ im2_init(void *im2_table_address) __smallc __z88dk_fastcall;


extern void __LIB__ *im2_install_isr(uint8_t vector,void *isr) __smallc;
extern void __LIB__ *im2_install_isr_callee(uint8_t vector,void *isr) __smallc __z88dk_callee;
#define im2_install_isr(a,b) im2_install_isr_callee(a,b)


extern void __LIB__ *im2_create_generic_isr(uint8_t num_callbacks,void *address) __smallc;
extern void __LIB__ *im2_create_generic_isr_callee(uint8_t num_callbacks,void *address) __smallc __z88dk_callee;
#define im2_create_generic_isr(a,b) im2_create_generic_isr_callee(a,b)


extern void __LIB__ *im2_create_generic_isr_8080(uint8_t num_callbacks,void *address) __smallc;
extern void __LIB__ *im2_create_generic_isr_8080_callee(uint8_t num_callbacks,void *address) __smallc __z88dk_callee;
#define im2_create_generic_isr_8080(a,b) im2_create_generic_isr_8080_callee(a,b)


extern void __LIB__ im2_append_generic_callback(uint8_t vector,void *callback) __smallc;
extern void __LIB__ im2_append_generic_callback_callee(uint8_t vector,void *callback) __smallc __z88dk_callee;
#define im2_append_generic_callback(a,b) im2_append_generic_callback_callee(a,b)


extern void __LIB__ im2_prepend_generic_callback(uint8_t vector,void *callback) __smallc;
extern void __LIB__ im2_prepend_generic_callback_callee(uint8_t vector,void *callback) __smallc __z88dk_callee;
#define im2_prepend_generic_callback(a,b) im2_prepend_generic_callback_callee(a,b)


extern int __LIB__ im2_remove_generic_callback(uint8_t vector,void *callback) __smallc;
extern int __LIB__ im2_remove_generic_callback_callee(uint8_t vector,void *callback) __smallc __z88dk_callee;
#define im2_remove_generic_callback(a,b) im2_remove_generic_callback_callee(a,b)



#ifdef __CLANG

#define IM2_DEFINE_ISR(name)       error clang does not support IM2_DEFINE_ISR;
#define IM2_DEFINE_ISR_8080(name)  error clang does not support IM2_DEFINE_ISR_8080;

#endif

#ifdef __SCCZ80

#define IM2_DEFINE_ISR(name)  void name(void) \
{ \
asm("\tEXTERN\tasm_im2_push_registers\n" \
"\tEXTERN\tasm_im2_pop_registers\n" \
"\n" \
"\tcall\tasm_im2_push_registers\n" \
"\tcall\t__im2_isr_" #name "\n" \
"\tcall\tasm_im2_pop_registers\n" \
"\n" \
"\tei\n" \
"\treti\n" \
); \
} \
void _im2_isr_##name(void)

#define IM2_DEFINE_ISR_8080(name)  void name(void) \
{ \
asm("\tEXTERN\tasm_im2_push_registers_8080\n" \
"\tEXTERN\tasm_im2_pop_registers_8080\n" \
"\n" \
"\tcall\tasm_im2_push_registers_8080\n" \
"\tcall\t__im2_isr_8080_" #name "\n" \
"\tcall\tasm_im2_pop_registers_8080\n" \
"\n" \
"\tei\n" \
"\treti\n" \
); \
} \
void _im2_isr_8080_##name(void)

#if __SPECTRUM || __ZXNEXT

#define IM2_DEFINE_ISR_WITH_BASIC(name)  void name(void) \
{ \
asm("\tEXTERN\tasm_im2_push_registers\n" \
"\tEXTERN\tasm_im2_pop_registers\n" \
"\n" \
"\tcall\tasm_im2_push_registers\n" \
"\tcall\t__im2_isr_" #name "\n" \
"\tcall\tasm_im2_pop_registers\n" \
"\n" \
"\tpush iy\n" \
"\tld iy,0x5c3a\n" \
"\tcall 0x0038\n" \
"\tpop iy\n" \
"\treti\n" \
); \
} \
void _im2_isr_##name(void)

#endif

#endif

#ifdef __SDCC

#define IM2_DEFINE_ISR(name)  void name(void) __naked \
{ \
	__asm \
	EXTERN	asm_im2_push_registers \
   EXTERN	asm_im2_pop_registers \
	\
	call	asm_im2_push_registers \
	call   __im2_isr_##name \
	call   asm_im2_pop_registers \
	\
	ei \
	reti \
	__endasm; \
} \
void _im2_isr_##name(void)

#define IM2_DEFINE_ISR_8080(name)  void name(void) __critical __interrupt(0)

#if __SPECTRUM || __ZXNEXT

#define IM2_DEFINE_ISR_WITH_BASIC(name)  void name(void) __naked \
{ \
	__asm \
	EXTERN	asm_im2_push_registers \
	EXTERN	asm_im2_pop_registers \
	\
	call	asm_im2_push_registers \
	call   __im2_isr_##name \
	call   asm_im2_pop_registers \
	\
	push iy \
	ld iy,0x5c3a \
	call 0x0038 \
	pop iy \
	ret \
	__endasm; \
} \
void _im2_isr_##name(void)

#endif

#endif


#endif
