	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:
Leh_func_begin1:
	pushq	%rbp
Ltmp0:
	movq	%rsp, %rbp
Ltmp1:
	subq	$32, %rsp
Ltmp2:
	movl	$0, -16(%rbp)
	movl	$10, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	xorb	%cl, %cl
	leaq	L_.str(%rip), %rdx
	movq	%rdx, %rdi
	movl	%eax, %esi
	movb	%cl, %al
	callq	_printf
	movl	$3, -20(%rbp)
	movl	$5, -24(%rbp)
	movl	-20(%rbp), %ecx
	movl	-24(%rbp), %edx
	xorl	%edx, %ecx
	movl	%ecx, -20(%rbp)
	movl	-24(%rbp), %ecx
	movl	-20(%rbp), %edx
	xorl	%edx, %ecx
	movl	%ecx, -24(%rbp)
	movl	-20(%rbp), %ecx
	movl	-24(%rbp), %edx
	xorl	%edx, %ecx
	movl	%ecx, -20(%rbp)
	movl	-20(%rbp), %ecx
	movl	%ecx, -12(%rbp)
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	xorb	%dl, %dl
	movq	%rcx, %rdi
	movb	%dl, %al
	callq	_printf
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	xorb	%dl, %dl
	movq	%rcx, %rdi
	movb	%dl, %al
	callq	_printf
	movl	$0, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	ret
Leh_func_end1:

	.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	 "The value of size is [%d]\n"

	.section	__TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame0:
Lsection_eh_frame:
Leh_frame_common:
Lset0 = Leh_frame_common_end-Leh_frame_common_begin
	.long	Lset0
Leh_frame_common_begin:
	.long	0
	.byte	1
	.asciz	 "zR"
	.byte	1
	.byte	120
	.byte	16
	.byte	1
	.byte	16
	.byte	12
	.byte	7
	.byte	8
	.byte	144
	.byte	1
	.align	3
Leh_frame_common_end:
	.globl	_main.eh
_main.eh:
Lset1 = Leh_frame_end1-Leh_frame_begin1
	.long	Lset1
Leh_frame_begin1:
Lset2 = Leh_frame_begin1-Leh_frame_common
	.long	Lset2
Ltmp3:
	.quad	Leh_func_begin1-Ltmp3
Lset3 = Leh_func_end1-Leh_func_begin1
	.quad	Lset3
	.byte	0
	.byte	4
Lset4 = Ltmp0-Leh_func_begin1
	.long	Lset4
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset5 = Ltmp1-Ltmp0
	.long	Lset5
	.byte	13
	.byte	6
	.align	3
Leh_frame_end1:


.subsections_via_symbols
