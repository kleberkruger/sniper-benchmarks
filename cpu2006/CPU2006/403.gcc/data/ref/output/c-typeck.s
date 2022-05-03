	.file	"c-typeck.in"
	.section	.rodata.str1.32,"aMS",@progbits,1
	.align 32
.LC18:
	.string	"comparison between signed and unsigned"
	.align 32
.LC19:
	.string	"comparison of promoted ~unsigned with constant"
	.align 32
.LC20:
	.string	"comparison of promoted ~unsigned with unsigned"
	.align 32
.LC10:
	.string	"function types not truly compatible in ISO C"
	.align 32
.LC1:
	.string	"types are not quite compatible"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"division by zero"
	.section	.rodata.str1.32
	.align 32
.LC14:
	.string	"ISO C forbids ordered comparisons of pointers to functions"
	.align 32
.LC12:
	.string	"comparison of distinct pointer types lacks a cast"
	.section	.rodata.str1.1
.LC5:
	.string	"left shift count is negative"
	.section	.rodata.str1.32
	.align 32
.LC6:
	.string	"left shift count >= width of type"
	.section	.rodata.str1.1
.LC3:
	.string	"right shift count is negative"
	.section	.rodata.str1.32
	.align 32
.LC4:
	.string	"right shift count >= width of type"
	.section	.rodata.str1.1
.LC7:
	.string	"shift count is negative"
.LC8:
	.string	"shift count >= width of type"
	.section	.rodata.str1.32
	.align 32
.LC13:
	.string	"comparison between pointer and integer"
	.align 32
.LC16:
	.string	"ordered comparison of pointer with integer zero"
	.align 32
.LC15:
	.string	"comparison of complete and incomplete pointers"
	.align 32
.LC11:
	.string	"ISO C forbids comparison of `void *' with function pointer"
	.align 32
.LC9:
	.string	"comparing floating point with == or != is unsafe"
	.align 32
.LC17:
	.string	"unordered comparison on non-floating point argument"
	.align 32
.LC0:
	.string	"void value not ignored as it ought to be"
	.text
	.align 2
	.p2align 4,,15
.globl build_binary_op
	.type	build_binary_op,@function
build_binary_op:
.LFB1:
	pushq	%r15
.LCFI0:
	xorl	%r15d, %r15d
	pushq	%r14
.LCFI1:
	pushq	%r13
.LCFI2:
	pushq	%r12
.LCFI3:
	pushq	%rbp
.LCFI4:
	pushq	%rbx
.LCFI5:
	subq	$664, %rsp
.LCFI6:
	testl	%ecx, %ecx
	movl	%edi, 608(%rsp)
	movq	%rsi, 600(%rsp)
	movq	%rdx, 592(%rsp)
	movl	%edi, 16(%rsp)
	movl	$0, 20(%rsp)
	movq	$0, (%rsp)
	movq	$0, 24(%rsp)
	movl	$0, 180(%rsp)
	movl	$0, 184(%rsp)
	movl	$0, 188(%rsp)
	movl	$0, 192(%rsp)
	je	.L2
	movq	8(%rsi), %r12
	movq	%rsi, %rbx
	movzbl	16(%r12), %r13d
	cmpl	$23, %r13d
	je	.L4
	cmpl	$18, %r13d
	je	.L4
	movq	600(%rsp), %rsi
	movzbl	16(%rsi), %eax
	cmpb	$32, %al
	je	.L3530
	movl	optimize(%rip), %esi
	testl	%esi, %esi
	je	.L31
	cmpb	$34, %al
	je	.L3531
.L31:
	movzbl	16(%rbx), %ecx
	movq	%rbx, %rdx
	cmpb	$116, %cl
	je	.L3313
	cmpb	$115, %cl
	je	.L3532
.L40:
	movzbl	%cl, %ebp 
	movzbl	tree_code_type(%rbp), %eax
	cmpb	$60, %al
	je	.L45
	cmpb	$49, %al
	je	.L45
	cmpb	$50, %al
	je	.L45
	cmpb	$101, %al
	je	.L45
.L44:
	cmpl	$10, %r13d
	je	.L3533
	cmpb	$39, %cl
	je	.L3534
.L53:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L58
	testb	$32, 17(%r12)
	je	.L59
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L60
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r12), %r13d
	movzwl	60(%rdx), %r12d
	andl	$511, %r13d
	andl	$511, %r12d
	cmpl	%r12d, %r13d
	je	.L60
.L59:
	movq	integer_types+40(%rip), %rdi
.L3342:
	movq	%rbx, %rsi
.L3343:
	call	convert
.L3344:
	movq	%rax, 8(%rsp)
.L29:
	movq	592(%rsp), %rbx
	movq	8(%rbx), %r12
	movzbl	16(%r12), %r13d
	cmpl	$23, %r13d
	je	.L64
	cmpl	$18, %r13d
	je	.L64
	movq	592(%rsp), %rcx
	movzbl	16(%rcx), %eax
	cmpb	$32, %al
	je	.L3535
	movl	optimize(%rip), %edi
	testl	%edi, %edi
	je	.L91
	cmpb	$34, %al
	je	.L3536
.L91:
	movzbl	16(%rbx), %ecx
	movq	%rbx, %rdx
	cmpb	$116, %cl
	je	.L3318
	cmpb	$115, %cl
	je	.L3537
.L100:
	movzbl	%cl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L105
	cmpb	$49, %al
	je	.L105
	cmpb	$50, %al
	je	.L105
	cmpb	$101, %al
	je	.L105
.L104:
	cmpl	$10, %r13d
	je	.L3538
	cmpb	$39, %cl
	je	.L3539
.L113:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L118
	testb	$32, 17(%r12)
	je	.L119
	movl	flag_traditional(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L120
	movq	integer_types+40(%rip), %rsi
	movzwl	60(%r12), %edi
	movzwl	60(%rsi), %r12d
	andl	$511, %edi
	andl	$511, %r12d
	cmpl	%r12d, %edi
	je	.L120
.L119:
	movq	integer_types+40(%rip), %rdi
.L3345:
	movq	%rbx, %rsi
.L3346:
	call	convert
.L3348:
	movq	%rax, %r14
.L123:
	movq	8(%rsp), %rdx
	movq	8(%rdx), %rbx
	movq	8(%rsp), %rdx
	movq	%rbx, 96(%rsp)
	movq	8(%r14), %rbp
	movq	%rbp, 168(%rsp)
	movzbl	16(%rbx), %r11d
	movl	%r11d, 588(%rsp)
	movzbl	16(%rbp), %ecx
	movl	%ecx, 584(%rsp)
	movzbl	16(%rdx), %r8d
	subb	$114, %r8b
	cmpb	$2, %r8b
	ja	.L125
	movq	32(%rdx), %rax
	movq	global_trees(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L125
	cmpq	8(%rax), %rbx
	je	.L128
.L125:
	movzbl	16(%r14), %edx
	leal	-114(%rdx), %edi
	cmpb	$2, %dil
	ja	.L130
	movq	32(%r14), %rax
	movq	global_trees(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L130
	movq	168(%rsp), %r9
	cmpq	8(%rax), %r9
	je	.L133
.L130:
	movl	588(%rsp), %eax
	testl	%eax, %eax
	je	.L3439
	movl	584(%rsp), %ebx
	testl	%ebx, %ebx
	je	.L3439
	movl	608(%rsp), %eax
	subl	$59, %eax
	cmpl	$50, %eax
	ja	.L136
	mov	%eax, %r8d
	jmp	*.L2117(,%r8,8)
	.section	.rodata
	.align 8
	.align 4
.L2117:
	.quad	.L137
	.quad	.L142
	.quad	.L2114
	.quad	.L313
	.quad	.L313
	.quad	.L313
	.quad	.L313
	.quad	.L327
	.quad	.L136
	.quad	.L327
	.quad	.L136
	.quad	.L136
	.quad	.L313
	.quad	.L136
	.quad	.L136
	.quad	.L136
	.quad	.L136
	.quad	.L136
	.quad	.L136
	.quad	.L955
	.quad	.L955
	.quad	.L136
	.quad	.L136
	.quad	.L349
	.quad	.L340
	.quad	.L358
	.quad	.L358
	.quad	.L324
	.quad	.L324
	.quad	.L324
	.quad	.L324
	.quad	.L136
	.quad	.L336
	.quad	.L336
	.quad	.L336
	.quad	.L336
	.quad	.L336
	.quad	.L136
	.quad	.L1525
	.quad	.L1525
	.quad	.L1525
	.quad	.L1525
	.quad	.L367
	.quad	.L367
	.quad	.L2113
	.quad	.L2113
	.quad	.L2113
	.quad	.L2113
	.quad	.L2113
	.quad	.L2113
	.quad	.L2113
	.text
.L137:
	cmpl	$13, 588(%rsp)
	je	.L3540
.L138:
	cmpl	$13, 584(%rsp)
	je	.L3541
.L2114:
	movl	$1, 192(%rsp)
.L136:
	movl	588(%rsp), %eax
	subl	$6, %eax
	cmpl	$2, %eax
	ja	.L2118
	movl	584(%rsp), %eax
	subl	$6, %eax
	cmpl	$2, %eax
	ja	.L2118
	cmpl	$8, 588(%rsp)
	movl	$0, 176(%rsp)
	je	.L2119
	cmpl	$8, 584(%rsp)
	movl	$1, %eax
	cmove	176(%rsp), %eax
	movl	%eax, 176(%rsp)
.L2119:
	movl	180(%rsp), %eax
	testl	%eax, %eax
	jne	.L2121
	movl	192(%rsp), %r8d
	testl	%r8d, %r8d
	jne	.L2121
	movl	184(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L2120
.L2121:
	movq	168(%rsp), %r15
	cmpq	%r15, 96(%rsp)
	je	.L2123
	movq	global_trees(%rip), %rax
	cmpq	%rax, 96(%rsp)
	je	.L3542
	cmpq	%rax, 168(%rsp)
	je	.L2123
	movq	96(%rsp), %rdi
	movq	168(%rsp), %rsi
	call	*targetm+248(%rip)
	movq	96(%rsp), %rcx
	movq	%rax, 456(%rsp)
	cmpb	$10, 16(%rcx)
	je	.L3543
.L2126:
	movq	168(%rsp), %rbx
	movzbl	16(%rbx), %eax
	cmpb	$10, %al
	je	.L3544
.L2127:
	movq	96(%rsp), %rsi
	movzbl	%al, %ebp
	movzbl	16(%rsi), %ebx
	cmpl	$8, %ebx
	je	.L3260
	cmpl	$8, %ebp
	je	.L3307
	leal	-6(%rbx), %eax
	cmpl	$17, %eax
	ja	.L2519
	mov	%eax, %r12d
	jmp	*.L2520(,%r12,8)
	.section	.rodata
	.align 8
	.align 4
.L2520:
	.quad	.L2140
	.quad	.L2140
	.quad	.L2519
	.quad	.L2519
	.quad	.L2519
	.quad	.L2519
	.quad	.L2519
	.quad	.L2157
	.quad	.L2519
	.quad	.L2519
	.quad	.L2519
	.quad	.L2519
	.quad	.L2162
	.quad	.L2519
	.quad	.L2519
	.quad	.L2519
	.quad	.L2519
	.quad	.L2169
	.text
.L2140:
	cmpl	$7, %ebx
	je	.L3546
	cmpl	$7, %ebp
	je	.L3261
.L2142:
	movq	96(%rsp), %rsi
	movq	168(%rsp), %r11
	movzwl	60(%rsi), %edx
	movzwl	60(%r11), %eax
	movq	%rsi, %rdi
	andl	$511, %edx
	andl	$511, %eax
	cmpl	%eax, %edx
	jg	.L3412
	cmpl	%edx, %eax
	jg	.L2155
	movq	96(%rsp), %rbx
	movq	integer_types+64(%rip), %rcx
	movq	128(%rbx), %rdx
	cmpq	%rcx, %rdx
	je	.L3416
	movq	168(%rsp), %r8
	movq	128(%r8), %rax
	cmpq	%rcx, %rax
	je	.L3416
	movq	integer_types+56(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L2149
	cmpq	%rdi, %rax
	je	.L2149
	movq	global_trees+208(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L3412
	cmpq	%rdi, %rax
	je	.L3412
	movq	96(%rsp), %rax
	testb	$32, 17(%rax)
	jne	.L3421
.L2155:
	movq	168(%rsp), %rdi
.L3412:
	movq	456(%rsp), %rsi
	call	build_type_attribute_variant
	movq	%rax, 96(%rsp)
.L2123:
	movq	96(%rsp), %r15
.L2120:
	movl	180(%rsp), %r13d
	testl	%r13d, %r13d
	je	.L2521
	movl	176(%rsp), %eax
	testl	%eax, %eax
	jne	.L3547
.L2521:
	movl	188(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L3548
.L2928:
	movl	184(%rsp), %ebx
	testl	%ebx, %ebx
	jne	.L3549
.L2118:
	testq	%r15, %r15
	je	.L3550
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jne	.L2972
	movq	8(%rsp), %rax
	cmpq	%r15, 8(%rax)
	je	.L2973
	movq	%r15, %rdi
	movq	%rax, %rsi
	call	convert
	movq	%rax, 8(%rsp)
.L2973:
	cmpq	%r15, 8(%r14)
	je	.L2972
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	convert
	movq	%rax, %r14
.L2972:
	cmpq	$0, (%rsp)
	movl	16(%rsp), %edi
	movq	%r14, %rcx
	cmovne	(%rsp), %r15
	movq	8(%rsp), %rdx
	xorl	%eax, %eax
	movq	%r15, %rsi
	movq	%r15, (%rsp)
	call	build
	movq	%rax, %rdi
	movq	%rax, %r15
	call	fold
	cmpq	%r15, %rax
	movq	%rax, %r8
	je	.L3551
.L2976:
	cmpq	$0, 24(%rsp)
	jne	.L3552
	movq	%r8, %rax
	.p2align 4,,7
.L1:
	addq	$664, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L3552:
	movq	24(%rsp), %rdi
	movq	%r8, %rsi
	call	convert
	jmp	.L1
.L3551:
	movq	8(%rsp), %r12
	movzbl	17(%r14), %ebx
	movzbl	17(%r8), %r14d
	movzbl	17(%r12), %eax
	shrb	$1, %bl
	andb	$-3, %r14b
	shrb	$1, %al
	andl	%eax, %ebx
	movl	%ebx, %r13d
	andb	$1, %r13b
	addb	%r13b, %r13b
	orb	%r13b, %r14b
	movb	%r14b, 17(%r8)
	jmp	.L2976
.L3550:
	movl	608(%rsp), %edi
	call	binary_op_error
.L3439:
	movq	global_trees(%rip), %rax
	jmp	.L1
.L3549:
	movq	8(%rsp), %r11
	movq	%r14, 632(%rsp)
	leaq	640(%rsp), %rdi
	movl	16(%rsp), %r14d
	leaq	632(%rsp), %rsi
	leaq	624(%rsp), %rdx
	leaq	620(%rsp), %rcx
	movq	%r15, 624(%rsp)
	movq	%r11, 640(%rsp)
	movl	%r14d, 620(%rsp)
	call	shorten_compare
	testq	%rax, %rax
	jne	.L1
	movl	warn_sign_compare(%rip), %eax
	movq	640(%rsp), %r9
	movl	$1, 20(%rsp)
	movl	620(%rsp), %r12d
	movq	632(%rsp), %r14
	testl	%eax, %eax
	movq	%r9, 8(%rsp)
	movl	%r12d, 16(%rsp)
	js	.L2936
	testl	%eax, %eax
.L3437:
	je	.L2118
	movl	skip_evaluation(%rip), %eax
	testl	%eax, %eax
	jne	.L2118
	movq	600(%rsp), %rsi
	movq	592(%rsp), %rdi
	xorl	%ebx, %ebx
	movq	8(%rsi), %rdx
	movq	8(%rdi), %rcx
	leaq	616(%rsp), %rsi
	movq	8(%rsp), %rdi
	testb	$32, 17(%rdx)
	sete	%bl
	testb	$32, 17(%rcx)
	sete	%bpl
	call	get_narrower
	leaq	612(%rsp), %rsi
	movq	%r14, %rdi
	movzbl	%bpl, %r13d
	movq	%rax, %rbp
	call	get_narrower
	movq	600(%rsp), %r10
	movq	592(%rsp), %r8
	movq	%rax, %r12
	movq	global_trees(%rip), %rdi
	movq	%r10, %rdx
	movq	%r10, 640(%rsp)
	movq	%r8, 632(%rsp)
.L2938:
	movzbl	16(%rdx), %r11d
	movq	%rdx, %rcx
	subb	$114, %r11b
	cmpb	$2, %r11b
	ja	.L3341
	movq	32(%rdx), %rax
	cmpq	%rdi, %rax
	je	.L3341
	movq	8(%rax), %r9
	cmpq	%r9, 8(%rdx)
	jne	.L3341
	movq	%rax, %rdx
	jmp	.L2938
.L3341:
	movq	%rdx, 640(%rsp)
	movq	global_trees(%rip), %rsi
	movq	632(%rsp), %rdx
.L2943:
	movzbl	16(%rdx), %r10d
	movq	%rdx, %rdi
	subb	$114, %r10b
	cmpb	$2, %r10b
	ja	.L3340
	movq	32(%rdx), %rax
	cmpq	%rsi, %rax
	je	.L3340
	movq	8(%rax), %r11
	cmpq	%r11, 8(%rdx)
	jne	.L3340
	movq	%rax, %rdx
	jmp	.L2943
.L3340:
	movq	%rdx, 632(%rsp)
	testb	$32, 17(%r15)
	je	.L2949
	cmpl	%r13d, %ebx
	je	.L2949
	testl	%ebx, %ebx
	je	.L2952
	movq	%rcx, %rax
	movq	%rdi, %rbx
.L2953:
	movq	%rax, %rdi
	call	tree_expr_nonnegative_p
	testl	%eax, %eax
	jne	.L2949
	movzbl	16(%rbx), %edx
	cmpb	$25, %dl
	je	.L3553
.L2958:
	movl	$.LC18, %edi
	xorl	%eax, %eax
	call	warning
.L2949:
	movzbl	16(%rbp), %ecx
	cmpb	$90, %cl
	sete	%al
	cmpb	$90, 16(%r12)
	sete	%bl
	xorl	%eax, %ebx
	andl	$1, %ebx
	je	.L2118
	cmpb	$90, %cl
	je	.L3554
	movq	32(%r12), %rdi
	leaq	612(%rsp), %rsi
	call	get_narrower
	movq	%rax, %r12
.L2962:
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	host_integerp
	testl	%eax, %eax
	jne	.L2964
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	host_integerp
	testl	%eax, %eax
	je	.L2963
.L2964:
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	host_integerp
	testl	%eax, %eax
	je	.L2965
	movq	%rbp, %rdi
	movl	612(%rsp), %ebx
	xorl	%esi, %esi
	call	tree_low_cst
	movq	%r12, %rbp
	movq	%rax, %rdx
.L2966:
	movq	8(%rbp), %rdi
	movzwl	60(%r15), %r12d
	movzwl	60(%rdi), %ecx
	andl	$511, %r12d
	andl	$511, %ecx
	cmpl	%r12d, %ecx
	jge	.L2118
	cmpl	$63, %ecx
	jg	.L2118
	testl	%ebx, %ebx
	je	.L2118
	movq	$-1, %rbp
	movl	$.LC19, %edi
	salq	%cl, %rbp
	andq	%rbp, %rdx
	cmpq	%rbp, %rdx
	je	.L2118
.L3438:
	xorl	%eax, %eax
	call	warning
	jmp	.L2118
.L2965:
	movq	%r12, %rdi
	xorl	%esi, %esi
	movl	616(%rsp), %ebx
	call	tree_low_cst
	movq	%rax, %rdx
	jmp	.L2966
.L2963:
	movl	616(%rsp), %edx
	testl	%edx, %edx
	je	.L2118
	movl	612(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L2118
	movq	8(%rbp), %r9
	movzwl	60(%r15), %edx
	movzwl	60(%r9), %esi
	andl	$511, %edx
	andl	$511, %esi
	cmpl	%edx, %esi
	jge	.L2118
	movq	8(%r12), %r11
	movzwl	60(%r11), %r10d
	andl	$511, %r10d
	cmpl	%edx, %r10d
	jge	.L2118
	movl	$.LC20, %edi
	jmp	.L3438
.L3554:
	movq	32(%rbp), %rdi
	leaq	616(%rsp), %rsi
	call	get_narrower
	movq	%rax, %rbp
	jmp	.L2962
.L3553:
	movl	16(%rsp), %eax
	subl	$101, %eax
	cmpl	$1, %eax
	jbe	.L3556
.L2956:
	cmpb	$25, %dl
	jne	.L2958
	movq	8(%rbx), %r13
	cmpb	$10, 16(%r13)
	jne	.L2958
	movq	%r15, %rdi
	call	signed_type
	movq	8(%rbx), %r8
	movq	%rax, %rsi
	movq	112(%r8), %rdi
	call	int_fits_type_p
	testl	%eax, %eax
	jne	.L2949
	jmp	.L2958
.L3556:
	movq	%r15, %rdi
	call	signed_type
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	int_fits_type_p
	testl	%eax, %eax
	jne	.L2949
	movzbl	16(%rbx), %edx
	jmp	.L2956
.L2952:
	movq	%rdi, %rax
	movq	%rcx, %rbx
	jmp	.L2953
	.p2align 6,,7
.L2936:
	movl	extra_warnings(%rip), %r13d
	testl	%r13d, %r13d
	jmp	.L3437
.L3548:
	movq	8(%rsp), %rdi
	leaq	652(%rsp), %rsi
	call	get_narrower
	movq	%r15, 24(%rsp)
	cmpq	8(%rsp), %rax
	movq	%rax, %rbx
	je	.L3557
.L2929:
	movq	8(%rbx), %rsi
	movzwl	60(%r15), %edi
	movzwl	60(%rsi), %edx
	andl	$511, %edi
	andl	$511, %edx
	cmpl	%edi, %edx
	jge	.L2928
	mov	%edx, %esi
	movq	%r14, %rdi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L2928
	testb	$32, 17(%r15)
	je	.L3339
	movl	652(%rsp), %edi
	testl	%edi, %edi
	je	.L2928
.L2931:
	movq	8(%rbx), %rsi
	call	signed_or_unsigned_type
	movq	%rax, %r15
	movq	8(%rsp), %rax
	cmpq	%r15, 8(%rax)
	je	.L2932
	movq	%r15, %rdi
	movq	%rax, %rsi
	call	convert
	movq	%rax, 8(%rsp)
.L2932:
	movl	$1, 20(%rsp)
	jmp	.L2928
.L3339:
	movl	652(%rsp), %edi
	jmp	.L2931
.L3557:
	movq	8(%rsp), %r10
	cmpq	8(%r10), %r15
	jne	.L2929
	movzbl	17(%r15), %edx
	movl	$1, %r8d
	shrb	$5, %dl
	andl	%edx, %r8d
	movl	%r8d, 652(%rsp)
	jmp	.L2929
.L3547:
	movq	8(%rsp), %rdi
	leaq	660(%rsp), %rsi
	movl	$1, %r13d
	call	get_narrower
	leaq	656(%rsp), %rsi
	movq	%r14, %rdi
	movq	%rax, %rbp
	call	get_narrower
	movq	8(%rsp), %rsi
	movzbl	17(%r15), %ecx
	movq	%r15, 24(%rsp)
	movq	%rax, %r12
	movq	8(%rbp), %r10
	shrb	$5, %cl
	movzwl	60(%r10), %r8d
	andl	%ecx, %r13d
	movq	8(%rsi), %rcx
	movzwl	60(%rcx), %r9d
	andl	$511, %r8d
	andl	$511, %r9d
	cmpl	%r8d, %r9d
	je	.L3558
.L2522:
	movq	8(%r14), %rcx
	movq	8(%r12), %r8
	movzwl	60(%rcx), %r11d
	movzwl	60(%r8), %edi
	andl	$511, %r11d
	andl	$511, %edi
	cmpl	%edi, %r11d
	je	.L3559
.L2523:
	cmpl	$-1, 180(%rsp)
	je	.L3560
.L2524:
	movq	8(%rbp), %r8
	movzwl	60(%r15), %edx
	movzwl	60(%r8), %ecx
	movl	%edx, %r10d
	andl	$511, %r10d
	andl	$511, %ecx
	cmpl	%r10d, %ecx
	jge	.L2525
	movq	8(%r12), %rsi
	movzwl	60(%rsi), %ebx
	andl	$511, %ebx
	cmpl	%ecx, %ebx
	je	.L3561
.L2525:
	cmpb	$25, 16(%rbp)
	je	.L3562
.L2923:
	cmpb	$25, 16(%r12)
	jne	.L2521
	movl	660(%rsp), %edi
	testl	%edi, %edi
	jne	.L2927
	testl	%r13d, %r13d
	jne	.L2521
.L2927:
	movq	8(%rbp), %rsi
	movzwl	60(%r15), %r13d
	movzwl	60(%rsi), %eax
	andl	$511, %r13d
	andl	$511, %eax
	cmpl	%r13d, %eax
	jge	.L2521
	call	signed_or_unsigned_type
	movq	%r12, %rdi
	movq	%rax, %rsi
	movq	%rax, %rbp
	call	int_fits_type_p
	testl	%eax, %eax
	cmovne	%rbp, %r15
	jmp	.L2521
.L3562:
	movl	656(%rsp), %edi
	testl	%edi, %edi
	jne	.L2924
	testl	%r13d, %r13d
	jne	.L2923
.L2924:
	movq	8(%r12), %rsi
	andl	$511, %edx
	movzwl	60(%rsi), %r9d
	andl	$511, %r9d
	cmpl	%edx, %r9d
	jge	.L2923
	call	signed_or_unsigned_type
	movq	%rbp, %rdi
	movq	%rax, %rsi
	movq	%rax, %rbx
	call	int_fits_type_p
	testl	%eax, %eax
	je	.L2923
	movq	%rbx, %r15
	jmp	.L2521
	.p2align 6,,7
.L3561:
	movl	660(%rsp), %edi
	cmpl	656(%rsp), %edi
	jne	.L2525
	testl	%edi, %edi
	jne	.L2526
	testl	%r13d, %r13d
	jne	.L2525
.L2526:
	cmpq	%rsi, %r8
	movq	%r8, %rbx
	movq	%rsi, %rbp
	je	.L2528
	movq	global_trees(%rip), %rax
	cmpq	%rax, %r8
	je	.L3563
	cmpq	%rax, %rsi
	je	.L2528
	movq	%r8, %rdi
	call	*targetm+248(%rip)
	movq	%rax, 432(%rsp)
	cmpb	$10, 16(%rbx)
	je	.L3564
.L2531:
	cmpb	$10, 16(%rbp)
	je	.L3565
.L2532:
	movzbl	16(%rbx), %r12d
	movzbl	16(%rbp), %r13d
	cmpl	$8, %r12d
	je	.L3282
	cmpl	$8, %r13d
	je	.L3308
	leal	-6(%r12), %eax
	cmpl	$17, %eax
	ja	.L2920
	mov	%eax, %r15d
	jmp	*.L2921(,%r15,8)
	.section	.rodata
	.align 8
	.align 4
.L2921:
	.quad	.L2545
	.quad	.L2545
	.quad	.L2920
	.quad	.L2920
	.quad	.L2920
	.quad	.L2920
	.quad	.L2920
	.quad	.L2562
	.quad	.L2920
	.quad	.L2920
	.quad	.L2920
	.quad	.L2920
	.quad	.L2565
	.quad	.L2920
	.quad	.L2920
	.quad	.L2920
	.quad	.L2920
	.quad	.L2570
	.text
.L2545:
	cmpl	$7, %r12d
	je	.L3567
	cmpl	$7, %r13d
	je	.L3283
.L2547:
	movzwl	60(%rbx), %edx
	movzwl	60(%rbp), %eax
	andl	$511, %edx
	andl	$511, %eax
	cmpl	%eax, %edx
	jg	.L2920
	cmpl	%edx, %eax
	jg	.L3434
	movq	128(%rbx), %rdx
	movq	integer_types+64(%rip), %rcx
	cmpq	%rcx, %rdx
	je	.L2556
	movq	128(%rbp), %rax
	cmpq	%rcx, %rax
	je	.L2556
	movq	integer_types+56(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L2554
	cmpq	%rdi, %rax
	je	.L2554
	movq	global_trees+208(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L3428
	cmpq	%rdi, %rax
	je	.L3428
	testb	$32, 17(%rbx)
	jne	.L2920
.L3434:
	movq	%rbp, %rdi
.L3428:
	movq	432(%rsp), %rsi
	call	build_type_attribute_variant
	movl	660(%rsp), %edi
	movq	%rax, %rbx
.L2528:
	movq	%rbx, %rsi
	call	signed_or_unsigned_type
	movq	%rax, %r15
	jmp	.L2521
.L2920:
	movq	%rbx, %rdi
	jmp	.L3428
.L2554:
	testb	$32, 17(%rbx)
	jne	.L2556
	testb	$32, 17(%rbp)
	je	.L3428
.L2556:
	movq	%rcx, %rdi
	jmp	.L3428
.L3283:
	cmpl	$7, %r12d
	jne	.L3434
	jmp	.L2547
.L3567:
	cmpl	$7, %r13d
	je	.L3283
	jmp	.L2920
.L2562:
	movq	8(%rbx), %rbx
	movq	8(%rbp), %rbp
	movq	128(%rbx), %rdi
	movq	128(%rbp), %rsi
	call	common_type
	xorl	%ecx, %ecx
	movzbl	62(%rbx), %r12d
	movzbl	17(%rbx), %r13d
	movq	%rax, %rdi
	shrb	$5, %r12b
	movl	%r13d, %edx
	andl	$1, %r12d
	shrb	$3, %r13b
	shrb	$4, %dl
	andl	$1, %r13d
	sall	$2, %r12d
	andl	$1, %edx
	addl	%r13d, %r13d
	orl	%r13d, %edx
	orl	%r12d, %edx
	cmpb	$20, 16(%rbx)
	je	.L3568
.L2563:
	movzbl	17(%rbp), %r11d
	leal	0(,%rcx,8), %esi
	movzbl	62(%rbp), %ecx
	orl	%edx, %esi
	movl	%r11d, %edx
	shrb	$5, %cl
	shrb	$3, %r11b
	shrb	$4, %dl
	andl	$1, %r11d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r11d, %r11d
	sall	$2, %ecx
	orl	%r11d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, 16(%rbp)
	je	.L3569
.L2564:
	leal	0(,%rcx,8), %ebp
	orl	%ebp, %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movq	%rax, %rdi
	call	build_pointer_type
.L3436:
	movq	%rax, %rdi
	jmp	.L3428
.L3569:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2564
.L3568:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2563
.L2565:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	call	common_type
	cmpq	8(%rbx), %rax
	movq	%rax, %rdi
	je	.L3570
.L2566:
	cmpq	8(%rbp), %rdi
	je	.L3571
.L2567:
	cmpq	$0, 24(%rbx)
	cmove	%rbp, %rbx
	movq	24(%rbx), %rsi
	call	build_array_type
	jmp	.L3436
.L3571:
	cmpq	$0, 24(%rbp)
	je	.L2567
	jmp	.L3434
.L3570:
	cmpq	$0, 24(%rbx)
	je	.L2566
	jmp	.L2920
.L2570:
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	call	common_type
	movq	%rax, 424(%rsp)
	movq	424(%rsp), %rax
	movq	24(%rbx), %rsi
	movq	%rsi, 64(%rsp)
	movq	24(%rbp), %rdx
	movq	%rdx, 72(%rsp)
	cmpq	8(%rbx), %rax
	je	.L3572
.L2571:
	movq	424(%rsp), %rdx
	cmpq	8(%rbp), %rdx
	je	.L3573
	cmpq	$0, 64(%rsp)
	je	.L3574
.L2573:
	cmpq	$0, 72(%rsp)
	jne	.L2574
	movq	424(%rsp), %rdi
	movq	64(%rsp), %rsi
.L3510:
	call	build_function_type
	jmp	.L3436
.L2574:
	xorl	%edi, %edi
	call	pushlevel
	movl	$1, %edi
	call	declare_parm_level
	movq	64(%rsp), %rdi
	call	list_length
	movq	$0, 88(%rsp)
	testl	%eax, %eax
	jle	.L3081
	movl	%eax, %ebx
.L2579:
	movq	88(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	call	tree_cons
	decl	%ebx
	movq	%rax, 88(%rsp)
	jne	.L2579
.L3081:
	cmpq	$0, 64(%rsp)
	movq	88(%rsp), %rdi
	movq	%rdi, 80(%rsp)
	je	.L3083
.L2919:
	movq	64(%rsp), %r9
	movq	32(%r9), %rdx
	testq	%rdx, %rdx
	jne	.L2584
	movq	72(%rsp), %rbx
	movq	80(%rsp), %r8
	movq	32(%rbx), %r10
	movq	%r10, 32(%r8)
.L2585:
.L2582:
	movq	64(%rsp), %r12
	movq	72(%rsp), %r11
	movq	80(%rsp), %rbp
	movq	(%r12), %rdx
	movq	%rdx, 64(%rsp)
	testq	%rdx, %rdx
	movq	(%r11), %rsi
	movq	%rsi, 72(%rsp)
	movq	(%rbp), %rdi
	movq	%rdi, 80(%rsp)
	jne	.L2919
.L3083:
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	call	poplevel
	movq	88(%rsp), %rsi
	movq	424(%rsp), %rdi
	call	build_function_type
	movq	%rax, %rbx
	jmp	.L2920
.L2584:
	movq	72(%rsp), %r15
	movq	32(%r15), %rax
	testq	%rax, %rax
	jne	.L2586
	movq	80(%rsp), %r12
	movq	%rdx, 32(%r12)
	jmp	.L2582
.L2586:
	cmpb	$21, 16(%rdx)
	je	.L3575
.L2587:
	cmpb	$21, 16(%rax)
	je	.L3576
.L2753:
	movq	64(%rsp), %r8
	movq	72(%rsp), %r10
	movq	32(%r8), %rdi
	movq	32(%r10), %rsi
	call	common_type
	movq	80(%rsp), %rbx
	movq	%rax, 32(%rbx)
	jmp	.L2582
.L3576:
	movq	64(%rsp), %rdx
	movq	32(%rdx), %rcx
	cmpq	%rcx, %rax
	je	.L2753
	movq	24(%rax), %rbx
	testq	%rbx, %rbx
	movq	%rbx, 40(%rsp)
	je	.L2753
.L2918:
	movq	40(%rsp), %r11
	movq	%rcx, %rbp
	movq	8(%r11), %rbx
	cmpq	%rcx, %rbx
	je	.L3426
	testq	%rbx, %rbx
	je	.L3426
	testq	%rcx, %rcx
	je	.L3426
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L3426
	movzbl	16(%rcx), %eax
	testb	%al, %al
	je	.L3426
	cmpb	$6, %dl
	je	.L3577
.L2762:
	cmpb	$6, %al
	je	.L3578
.L2763:
	cmpb	$10, %dl
	je	.L3579
.L2764:
	cmpb	$10, 16(%rbp)
	je	.L3580
.L2765:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L2761
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L2767
	xorl	%r15d, %r15d
.L2761:
	testl	%r15d, %r15d
	jne	.L3581
.L2756:
	movq	40(%rsp), %rcx
	movq	(%rcx), %r9
	testq	%r9, %r9
	movq	%r9, 40(%rsp)
	je	.L2753
	movq	64(%rsp), %rax
	movq	32(%rax), %rcx
	jmp	.L2918
.L3581:
	movq	64(%rsp), %rax
	movq	80(%rsp), %r12
	movq	32(%rax), %r13
	movq	%r13, 32(%r12)
.L3519:
	movl	pedantic(%rip), %r15d
	testl	%r15d, %r15d
	je	.L2582
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L2582
.L2767:
	movzbl	17(%rbx), %r12d
	movzbl	62(%rbx), %ecx
	movl	%r12d, %edx
	shrb	$5, %cl
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r12d, %r12d
	sall	$2, %ecx
	orl	%r12d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L3582
.L2769:
	movzbl	17(%rbp), %r8d
	movzbl	62(%rbp), %r13d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r13b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r13d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r13d
	orl	%r8d, %edx
	orl	%r13d, %edx
	cmpb	$20, %sil
	je	.L3583
.L2770:
	leal	0(,%rcx,8), %r15d
	orl	%r15d, %edx
	xorl	%r15d, %r15d
	cmpl	%edx, %edi
	jne	.L2761
	movq	128(%rbp), %rsi
	cmpq	%rsi, 128(%rbx)
	je	.L3426
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%r15d, %r15d
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 416(%rsp)
	je	.L2761
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L2896
	cmpl	$18, %eax
	ja	.L2913
	cmpl	$13, %eax
	je	.L2774
.L2773:
	cmpl	$2, 416(%rsp)
	jne	.L2761
	cmpl	$1, %r15d
	cmove	416(%rsp), %r15d
	jmp	.L2761
.L2774:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L2775
	call	comptypes
	movl	%eax, %r15d
	jmp	.L2773
.L2775:
	movl	$1, %r15d
	jmp	.L2773
.L2913:
	cmpl	$20, %eax
	je	.L2909
	cmpl	$23, %eax
	jne	.L2773
	movl	$1, 36(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L2778
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 36(%rsp)
	je	.L2773
.L2778:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3584
	testq	%r12, %r12
	je	.L3585
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L2893:
	testq	%r13, %r13
	je	.L3586
	testq	%r12, %r12
	je	.L2882
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3587
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L2868
.L3518:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2882
.L2867:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L2893
.L2882:
	xorl	%r15d, %r15d
.L2862:
	cmpl	$1, %r15d
	cmove	36(%rsp), %r15d
	jmp	.L2773
.L2868:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L2867
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3589
.L2872:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L2882
	cmpq	$0, 96(%rax)
	je	.L2883
	testb	$8, 62(%rax)
	je	.L2882
.L2883:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2882
	movq	32(%r13), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2882
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L2882
.L2889:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2885
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2889
	jmp	.L2882
.L2885:
	testq	%rbx, %rbx
	jne	.L2867
	jmp	.L2882
.L3589:
	cmpq	$0, 96(%rax)
	je	.L2873
	testb	$8, 62(%rax)
	je	.L2872
.L2873:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2872
	movq	32(%r12), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2872
	movq	32(%r13), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L2882
.L2879:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2885
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2879
	jmp	.L2882
.L3587:
	movq	32(%r12), %rdi
	jmp	.L3518
.L3586:
	testq	%r12, %r12
	je	.L2862
	jmp	.L2882
.L3585:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L2773
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3153
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L2857:
	testq	%r13, %r13
	je	.L3590
	testq	%rbp, %rbp
	je	.L2846
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3591
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2832
.L3516:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2846
.L2831:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L2857
.L2846:
	xorl	%r12d, %r12d
.L2826:
	movl	$2, %r15d
	decl	%r12d
.L3517:
	jne	.L2773
.L3153:
	movl	36(%rsp), %r15d
	jmp	.L2773
.L2832:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L2831
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3593
.L2836:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L2846
	cmpq	$0, 96(%rax)
	je	.L2847
	testb	$8, 62(%rax)
	je	.L2846
.L2847:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2846
	movq	32(%r13), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2846
	movq	32(%rbp), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L2846
.L2853:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2849
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2853
	jmp	.L2846
.L2849:
	testq	%rbx, %rbx
	jne	.L2831
	jmp	.L2846
.L3593:
	cmpq	$0, 96(%rax)
	je	.L2837
	testb	$8, 62(%rax)
	je	.L2836
.L2837:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2836
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2836
	movq	32(%r13), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L2846
.L2843:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2849
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2843
	jmp	.L2846
.L3591:
	movq	32(%rbp), %rdi
	jmp	.L3516
.L3590:
	testq	%rbp, %rbp
	je	.L2826
	jmp	.L2846
.L3584:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L2773
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3153
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L2818:
	testq	%r12, %r12
	je	.L3594
	testq	%rbp, %rbp
	je	.L2807
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3595
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2793
.L3515:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2807
.L2792:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L2818
.L2807:
	xorl	%r13d, %r13d
.L2787:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3517
.L2793:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L2792
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3597
.L2797:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L2807
	cmpq	$0, 96(%rax)
	je	.L2808
	testb	$8, 62(%rax)
	je	.L2807
.L2808:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2807
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2807
	movq	32(%rbp), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L2807
.L2814:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2810
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2814
	jmp	.L2807
.L2810:
	testq	%rbx, %rbx
	jne	.L2792
	jmp	.L2807
.L3597:
	cmpq	$0, 96(%rax)
	je	.L2798
	testb	$8, 62(%rax)
	je	.L2797
.L2798:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2797
	movq	32(%rbp), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2797
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L2807
.L2804:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2810
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2804
	jmp	.L2807
.L3595:
	movq	32(%rbp), %rdi
	jmp	.L3515
.L3594:
	testq	%rbp, %rbp
	je	.L2787
	jmp	.L2807
.L2909:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L2773
.L2896:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L2897
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L2756
.L2897:
	testq	%r12, %r12
	je	.L2773
	testq	%r13, %r13
	je	.L2773
	cmpq	%r13, %r12
	je	.L2773
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L2900
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3598
.L2901:
	movl	$1, %r8d
.L2900:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L2902
	movq	104(%r13), %r11
	cmpb	$25, 16(%r11)
	je	.L3599
.L2903:
	movl	$1, %ecx
.L2902:
	testb	%r8b, %r8b
	jne	.L2773
	testb	%cl, %cl
	jne	.L2773
	testb	%dil, %dil
	je	.L3303
	testb	%dl, %dl
.L3425:
	jne	.L2773
.L2908:
	xorl	%r15d, %r15d
	jmp	.L2773
.L3303:
	testb	%dl, %dl
	jne	.L2908
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2908
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3425
.L3599:
	cmpb	$25, 16(%rsi)
	jne	.L2903
	jmp	.L2902
.L3598:
	cmpb	$25, 16(%rcx)
	jne	.L2901
	jmp	.L2900
.L3426:
	movl	$1, %r15d
	jmp	.L2761
.L3583:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2770
.L3582:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2769
.L3580:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L2765
.L3579:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L2764
.L3578:
	testb	$2, 62(%rcx)
	je	.L2763
	movq	24(%rcx), %r9
	testq	%r9, %r9
	cmovne	%r9, %rbp
	jmp	.L2763
.L3577:
	testb	$2, 62(%rbx)
	je	.L2762
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2762
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L2762
.L3575:
	cmpq	%rax, %rdx
	je	.L2587
	movq	24(%rdx), %r13
	testq	%r13, %r13
	movq	%r13, 56(%rsp)
	je	.L2587
.L2752:
	movq	56(%rsp), %rcx
	movq	%rax, %rbp
	movq	8(%rcx), %rbx
	cmpq	%rax, %rbx
	je	.L2594
	testq	%rbx, %rbx
	je	.L2594
	testq	%rax, %rax
	je	.L2594
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L2594
	movzbl	16(%rax), %ecx
	testb	%cl, %cl
	jne	.L2593
.L2594:
	movl	$1, %r15d
.L2595:
	testl	%r15d, %r15d
	jne	.L3600
.L2590:
	movq	56(%rsp), %rdi
	movq	(%rdi), %r10
	testq	%r10, %r10
	movq	%r10, 56(%rsp)
	jne	.L2752
	jmp	.L2587
.L3600:
	movq	80(%rsp), %r15
	movq	%rax, 32(%r15)
	jmp	.L3519
.L2593:
	cmpb	$6, %dl
	je	.L3601
.L2596:
	cmpb	$6, %cl
	je	.L3602
.L2597:
	cmpb	$10, %dl
	je	.L3603
.L2598:
	cmpb	$10, 16(%rbp)
	je	.L3604
.L2599:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L3424
	movzbl	16(%rbx), %edi
	cmpb	16(%rbp), %dil
	je	.L2601
	xorl	%r15d, %r15d
.L3423:
	movq	72(%rsp), %r12
	movq	32(%r12), %rax
	jmp	.L2595
.L2601:
	movzbl	17(%rbx), %r9d
	movzbl	62(%rbx), %esi
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %sil
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %esi
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %esi
	orl	%r9d, %edx
	orl	%esi, %edx
	cmpb	$20, %dil
	je	.L3605
.L2603:
	movzbl	17(%rbp), %r10d
	movzbl	62(%rbp), %r8d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r10d, %edx
	shrb	$5, %r8b
	shrb	$3, %r10b
	shrb	$4, %dl
	andl	$1, %r10d
	andl	$1, %r8d
	andl	$1, %edx
	addl	%r10d, %r10d
	sall	$2, %r8d
	orl	%r10d, %edx
	orl	%r8d, %edx
	cmpb	$20, %dil
	je	.L3606
.L2604:
	leal	0(,%rcx,8), %edi
	orl	%edi, %edx
	cmpl	%edx, %esi
	je	.L2602
	xorl	%r15d, %r15d
.L3336:
	movq	72(%rsp), %r13
	movq	32(%r13), %rax
	jmp	.L2595
.L2602:
	movq	128(%rbp), %rax
	cmpq	%rax, 128(%rbx)
	je	.L3607
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 420(%rsp)
	jne	.L2606
	xorl	%r15d, %r15d
.L3424:
	movq	72(%rsp), %rbx
	movq	32(%rbx), %rax
	jmp	.L2595
.L2606:
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L2730
	cmpl	$18, %eax
	ja	.L2747
	cmpl	$13, %eax
	je	.L2608
.L2607:
	cmpl	$2, 420(%rsp)
	jne	.L3336
	cmpl	$1, %r15d
	je	.L3608
	movq	72(%rsp), %r8
	movq	32(%r8), %rax
	jmp	.L2595
.L3608:
	movl	$2, %r15d
	jmp	.L3423
.L2608:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L2609
	call	comptypes
	movl	%eax, %r15d
	jmp	.L2607
.L2609:
	movl	$1, %r15d
	jmp	.L2607
.L2747:
	cmpl	$20, %eax
	je	.L2743
	cmpl	$23, %eax
	jne	.L2607
	movl	$1, 52(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L2612
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 52(%rsp)
	je	.L2607
.L2612:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3609
	testq	%r12, %r12
	je	.L3610
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L2727:
	testq	%r13, %r13
	je	.L3611
	testq	%r12, %r12
	je	.L2716
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3612
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L2702
.L3514:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2716
.L2701:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L2727
.L2716:
	xorl	%r15d, %r15d
.L2696:
	cmpl	$1, %r15d
	cmove	52(%rsp), %r15d
	jmp	.L2607
.L2702:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L2701
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3614
.L2706:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L2716
	cmpq	$0, 96(%rax)
	je	.L2717
	testb	$8, 62(%rax)
	je	.L2716
.L2717:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2716
	movq	32(%r13), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2716
	movq	32(%r12), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L2716
.L2723:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2719
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2723
	jmp	.L2716
.L2719:
	testq	%rbx, %rbx
	jne	.L2701
	jmp	.L2716
.L3614:
	cmpq	$0, 96(%rax)
	je	.L2707
	testb	$8, 62(%rax)
	je	.L2706
.L2707:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2706
	movq	32(%r12), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2706
	movq	32(%r13), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L2716
.L2713:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2719
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2713
	jmp	.L2716
.L3612:
	movq	32(%r12), %rdi
	jmp	.L3514
.L3611:
	testq	%r12, %r12
	je	.L2696
	jmp	.L2716
.L3610:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L2607
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3149
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L2691:
	testq	%r13, %r13
	je	.L3615
	testq	%rbp, %rbp
	je	.L2680
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3616
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2666
.L3512:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2680
.L2665:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L2691
.L2680:
	xorl	%r12d, %r12d
.L2660:
	movl	$2, %r15d
	decl	%r12d
.L3513:
	jne	.L2607
.L3149:
	movl	52(%rsp), %r15d
	jmp	.L2607
.L2666:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L2665
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3618
.L2670:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L2680
	cmpq	$0, 96(%rax)
	je	.L2681
	testb	$8, 62(%rax)
	je	.L2680
.L2681:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2680
	movq	32(%r13), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2680
	movq	32(%rbp), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L2680
.L2687:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2683
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2687
	jmp	.L2680
.L2683:
	testq	%rbx, %rbx
	jne	.L2665
	jmp	.L2680
.L3618:
	cmpq	$0, 96(%rax)
	je	.L2671
	testb	$8, 62(%rax)
	je	.L2670
.L2671:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2670
	movq	32(%rbp), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2670
	movq	32(%r13), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L2680
.L2677:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2683
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2677
	jmp	.L2680
.L3616:
	movq	32(%rbp), %rdi
	jmp	.L3512
.L3615:
	testq	%rbp, %rbp
	je	.L2660
	jmp	.L2680
.L3609:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L2607
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3149
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L2652:
	testq	%r12, %r12
	je	.L3619
	testq	%rbp, %rbp
	je	.L2641
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3620
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2627
.L3511:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2641
.L2626:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L2652
.L2641:
	xorl	%r13d, %r13d
.L2621:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3513
.L2627:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L2626
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3622
.L2631:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L2641
	cmpq	$0, 96(%rax)
	je	.L2642
	testb	$8, 62(%rax)
	je	.L2641
.L2642:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2641
	movq	32(%r12), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2641
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L2641
.L2648:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2644
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2648
	jmp	.L2641
.L2644:
	testq	%rbx, %rbx
	jne	.L2626
	jmp	.L2641
.L3622:
	cmpq	$0, 96(%rax)
	je	.L2632
	testb	$8, 62(%rax)
	je	.L2631
.L2632:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2631
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2631
	movq	32(%r12), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L2641
.L2638:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2644
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2638
	jmp	.L2641
.L3620:
	movq	32(%rbp), %rdi
	jmp	.L3511
.L3619:
	testq	%rbp, %rbp
	je	.L2621
	jmp	.L2641
.L2743:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L2607
.L2730:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L2731
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L3335
.L2731:
	testq	%r12, %r12
	je	.L2607
	testq	%r13, %r13
	je	.L2607
	cmpq	%r13, %r12
	je	.L2607
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L2734
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3623
.L2735:
	movl	$1, %r8d
.L2734:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L2736
	movq	104(%r13), %r9
	cmpb	$25, 16(%r9)
	je	.L3624
.L2737:
	movl	$1, %ecx
.L2736:
	testb	%r8b, %r8b
	jne	.L2607
	testb	%cl, %cl
	jne	.L2607
	testb	%dil, %dil
	je	.L3293
	testb	%dl, %dl
.L3422:
	jne	.L2607
.L2742:
	xorl	%r15d, %r15d
	jmp	.L2607
.L3293:
	testb	%dl, %dl
	jne	.L2742
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2742
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3422
.L3624:
	cmpb	$25, 16(%rsi)
	jne	.L2737
	jmp	.L2736
.L3623:
	cmpb	$25, 16(%rcx)
	jne	.L2735
	jmp	.L2734
.L3335:
	movq	72(%rsp), %rsi
	movq	32(%rsi), %rax
	jmp	.L2590
.L3607:
	movq	72(%rsp), %rbp
	movl	$1, %r15d
	movq	32(%rbp), %rax
	jmp	.L2595
.L3606:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2604
.L3605:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2603
.L3604:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L2599
.L3603:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L2598
.L3602:
	testb	$2, 62(%rax)
	je	.L2597
	movq	24(%rax), %r11
	testq	%r11, %r11
	cmovne	%r11, %rbp
	jmp	.L2597
.L3601:
	testb	$2, 62(%rbx)
	je	.L2596
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2596
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L2596
.L3574:
	movq	424(%rsp), %rdi
	movq	24(%rbp), %rsi
	jmp	.L3510
.L3573:
	cmpq	$0, 64(%rsp)
	jne	.L2573
	jmp	.L3434
.L3572:
	testq	%rdx, %rdx
	jne	.L2571
	jmp	.L2920
.L3308:
	movq	%rbx, %rdi
.L2536:
	cmpl	$8, %r13d
	movq	%rbp, %rsi
	je	.L3625
.L2538:
	call	common_type
	cmpl	$8, %r12d
	movq	%rax, %rdi
	je	.L3626
.L2539:
	cmpl	$8, %r13d
	je	.L3627
.L2541:
	call	build_complex_type
	jmp	.L3436
.L3627:
	cmpq	%rdi, 8(%rbp)
	jne	.L2541
	jmp	.L3434
.L3626:
	cmpq	%rax, 8(%rbx)
	jne	.L2539
	jmp	.L2920
.L3625:
	movq	8(%rbp), %rsi
	jmp	.L2538
.L3282:
	movq	8(%rbx), %rdi
	jmp	.L2536
.L3565:
	movzwl	60(%rbp), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L2532
.L3564:
	movzwl	60(%rbx), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L2531
.L3563:
	movq	%rsi, %rbx
	jmp	.L2528
	.p2align 6,,7
.L3560:
	movl	660(%rsp), %r13d
	jmp	.L2524
.L3559:
	cmpq	%r15, %rcx
	je	.L2523
	movzbl	17(%rcx), %r9d
	shrb	$5, %r9b
	andl	$1, %r9d
	movl	%r9d, 656(%rsp)
	jmp	.L2523
.L3558:
	cmpq	%r15, %rcx
	je	.L2522
	movzbl	17(%rcx), %ebx
	movl	$1, %edx
	shrb	$5, %bl
	andl	%ebx, %edx
	movl	%edx, 660(%rsp)
	jmp	.L2522
.L3421:
	movq	%rax, %rdi
	jmp	.L3412
.L2149:
	movq	96(%rsp), %rdx
	testb	$32, 17(%rdx)
	jne	.L3416
	movq	168(%rsp), %rax
	testb	$32, 17(%rax)
	je	.L3412
.L3416:
	movq	%rcx, %rdi
	jmp	.L3412
.L3261:
	cmpl	$7, %ebx
	jne	.L2155
	jmp	.L2142
.L3546:
	cmpl	$7, %ebp
	je	.L3261
.L2519:
	movq	96(%rsp), %rdi
	jmp	.L3412
.L2157:
	movq	96(%rsp), %rdi
	movq	168(%rsp), %r15
	movq	8(%rdi), %rbx
	movq	8(%r15), %rbp
	movq	128(%rbx), %rdi
	movq	128(%rbp), %rsi
	call	common_type
	movzbl	62(%rbx), %ecx
	movzbl	17(%rbx), %r9d
	movq	%rax, %rdi
	movl	%r9d, %edx
	shrb	$5, %cl
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %ecx
	orl	%r9d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, 16(%rbx)
	je	.L3628
.L2160:
	movzbl	17(%rbp), %r13d
	movzbl	62(%rbp), %r10d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r13d, %edx
	shrb	$5, %r10b
	shrb	$3, %r13b
	shrb	$4, %dl
	andl	$1, %r13d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r13d, %r13d
	sall	$2, %r10d
	orl	%r13d, %edx
	orl	%r10d, %edx
	cmpb	$20, 16(%rbp)
	je	.L3629
.L2161:
	leal	0(,%rcx,8), %ebp
	orl	%ebp, %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movq	%rax, %rdi
	call	build_pointer_type
	jmp	.L3421
.L3629:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2161
.L3628:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2160
	.p2align 6,,7
.L2162:
	movq	96(%rsp), %rbx
	movq	168(%rsp), %r12
	movq	8(%rbx), %rdi
	movq	8(%r12), %rsi
	call	common_type
	cmpq	8(%rbx), %rax
	movq	%rax, %rdi
	je	.L3630
.L2163:
	movq	168(%rsp), %rax
	cmpq	8(%rax), %rdi
	je	.L3631
.L2164:
	movq	96(%rsp), %r11
	cmpq	$0, 24(%r11)
	cmove	168(%rsp), %r11
	movq	24(%r11), %rsi
	call	build_array_type
	jmp	.L3421
.L3631:
	cmpq	$0, 24(%rax)
	je	.L2164
	jmp	.L3421
.L3630:
	cmpq	$0, 24(%rbx)
	je	.L2163
.L3413:
	movq	%rbx, %rdi
	jmp	.L3412
	.p2align 6,,7
.L2169:
	movq	96(%rsp), %rsi
	movq	168(%rsp), %r15
	movq	8(%rsi), %rdi
	movq	8(%r15), %rsi
	call	common_type
	movq	96(%rsp), %rdx
	movq	96(%rsp), %r8
	movq	%rax, 448(%rsp)
	movq	24(%r8), %rbx
	movq	%rbx, 136(%rsp)
	movq	24(%r15), %r8
	movq	%r8, 144(%rsp)
	cmpq	8(%rdx), %rax
	je	.L3632
.L2170:
	movq	168(%rsp), %rcx
	movq	448(%rsp), %rdx
	cmpq	8(%rcx), %rdx
	je	.L3633
	cmpq	$0, 136(%rsp)
	je	.L3634
.L2172:
	cmpq	$0, 144(%rsp)
	jne	.L2173
	movq	448(%rsp), %rdi
	movq	136(%rsp), %rsi
.L3500:
	call	build_function_type
	jmp	.L3421
.L2173:
	xorl	%edi, %edi
	call	pushlevel
	movl	$1, %edi
	call	declare_parm_level
	movq	136(%rsp), %rdi
	call	list_length
	movq	$0, 160(%rsp)
	testl	%eax, %eax
	jle	.L3063
	movl	%eax, %ebx
.L2178:
	movq	160(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	call	tree_cons
	decl	%ebx
	movq	%rax, 160(%rsp)
	jne	.L2178
.L3063:
	cmpq	$0, 136(%rsp)
	movq	160(%rsp), %rcx
	movq	%rcx, 152(%rsp)
	je	.L3065
.L2518:
	movq	136(%rsp), %r9
	movq	32(%r9), %rdx
	testq	%rdx, %rdx
	jne	.L2183
	movq	144(%rsp), %r13
	movq	152(%rsp), %rdi
	movq	32(%r13), %r10
	movq	%r10, 32(%rdi)
.L2184:
.L2181:
	movq	136(%rsp), %r12
	movq	144(%rsp), %r11
	movq	152(%rsp), %rdi
	movq	(%r12), %rdx
	movq	%rdx, 136(%rsp)
	testq	%rdx, %rdx
	movq	(%r11), %rbp
	movq	%rbp, 144(%rsp)
	movq	(%rdi), %rbx
	movq	%rbx, 152(%rsp)
	jne	.L2518
.L3065:
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	call	poplevel
	movq	160(%rsp), %rsi
	movq	448(%rsp), %rdi
	call	build_function_type
	movq	%rax, 96(%rsp)
	jmp	.L2519
	.p2align 6,,7
.L2183:
	movq	144(%rsp), %rbp
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2185
	movq	152(%rsp), %r12
	movq	%rdx, 32(%r12)
	jmp	.L2181
.L2185:
	cmpb	$21, 16(%rdx)
	je	.L3635
.L2186:
	cmpb	$21, 16(%rax)
	je	.L3636
.L2352:
	movq	136(%rsp), %rsi
	movq	144(%rsp), %r10
	movq	32(%rsi), %rdi
	movq	32(%r10), %rsi
	call	common_type
	movq	152(%rsp), %rcx
	movq	%rax, 32(%rcx)
	jmp	.L2181
.L3636:
	movq	136(%rsp), %rbx
	movq	32(%rbx), %rcx
	cmpq	%rcx, %rax
	je	.L2352
	movq	24(%rax), %r11
	testq	%r11, %r11
	movq	%r11, 112(%rsp)
	je	.L2352
.L2517:
	movq	112(%rsp), %r8
	movq	%rcx, %rbp
	movq	8(%r8), %rbx
	cmpq	%rcx, %rbx
	je	.L3410
	testq	%rbx, %rbx
	je	.L3410
	testq	%rcx, %rcx
	je	.L3410
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L3410
	movzbl	16(%rcx), %eax
	testb	%al, %al
	je	.L3410
	cmpb	$6, %dl
	je	.L3637
.L2361:
	cmpb	$6, %al
	je	.L3638
.L2362:
	cmpb	$10, %dl
	je	.L3639
.L2363:
	cmpb	$10, 16(%rbp)
	je	.L3640
.L2364:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L2360
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L2366
	xorl	%r15d, %r15d
.L2360:
	testl	%r15d, %r15d
	jne	.L3641
.L2355:
	movq	112(%rsp), %r9
	movq	(%r9), %r8
	testq	%r8, %r8
	movq	%r8, 112(%rsp)
	je	.L2352
	movq	136(%rsp), %rax
	movq	32(%rax), %rcx
	jmp	.L2517
.L3641:
	movq	136(%rsp), %rax
	movq	152(%rsp), %r12
	movq	32(%rax), %r13
	movq	%r13, 32(%r12)
.L3509:
	movl	pedantic(%rip), %r15d
	testl	%r15d, %r15d
	je	.L2181
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L2181
.L2366:
	movzbl	17(%rbx), %r12d
	movzbl	62(%rbx), %ecx
	movl	%r12d, %edx
	shrb	$5, %cl
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r12d, %r12d
	sall	$2, %ecx
	orl	%r12d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L3642
.L2368:
	movzbl	17(%rbp), %r15d
	movzbl	62(%rbp), %r13d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	shrb	$5, %r13b
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	$1, %r15d
	andl	$1, %r13d
	andl	$1, %edx
	addl	%r15d, %r15d
	sall	$2, %r13d
	orl	%r15d, %edx
	orl	%r13d, %edx
	cmpb	$20, %sil
	je	.L3643
.L2369:
	leal	0(,%rcx,8), %esi
	xorl	%r15d, %r15d
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L2360
	movq	128(%rbp), %r10
	cmpq	%r10, 128(%rbx)
	je	.L3410
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%r15d, %r15d
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 440(%rsp)
	je	.L2360
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L2495
	cmpl	$18, %eax
	ja	.L2512
	cmpl	$13, %eax
	je	.L2373
.L2372:
	cmpl	$2, 440(%rsp)
	jne	.L2360
	cmpl	$1, %r15d
	cmove	440(%rsp), %r15d
	jmp	.L2360
.L2373:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L2374
	call	comptypes
	movl	%eax, %r15d
	jmp	.L2372
.L2374:
	movl	$1, %r15d
	jmp	.L2372
.L2512:
	cmpl	$20, %eax
	je	.L2508
	cmpl	$23, %eax
	jne	.L2372
	movl	$1, 108(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L2377
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 108(%rsp)
	je	.L2372
.L2377:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3644
	testq	%r12, %r12
	je	.L3645
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L2492:
	testq	%r13, %r13
	je	.L3646
	testq	%r12, %r12
	je	.L2481
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3647
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L2467
.L3508:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2481
.L2466:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L2492
.L2481:
	xorl	%r15d, %r15d
.L2461:
	cmpl	$1, %r15d
	cmove	108(%rsp), %r15d
	jmp	.L2372
.L2467:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L2466
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3649
.L2471:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L2481
	cmpq	$0, 96(%rax)
	je	.L2482
	testb	$8, 62(%rax)
	je	.L2481
.L2482:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2481
	movq	32(%r13), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2481
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L2481
.L2488:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2484
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2488
	jmp	.L2481
.L2484:
	testq	%rbx, %rbx
	jne	.L2466
	jmp	.L2481
.L3649:
	cmpq	$0, 96(%rax)
	je	.L2472
	testb	$8, 62(%rax)
	je	.L2471
.L2472:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2471
	movq	32(%r12), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2471
	movq	32(%r13), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L2481
.L2478:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2484
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2478
	jmp	.L2481
.L3647:
	movq	32(%r12), %rdi
	jmp	.L3508
.L3646:
	testq	%r12, %r12
	je	.L2461
	jmp	.L2481
.L3645:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L2372
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3145
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L2456:
	testq	%r13, %r13
	je	.L3650
	testq	%rbp, %rbp
	je	.L2445
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3651
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2431
.L3506:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2445
.L2430:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L2456
.L2445:
	xorl	%r12d, %r12d
.L2425:
	movl	$2, %r15d
	decl	%r12d
.L3507:
	jne	.L2372
.L3145:
	movl	108(%rsp), %r15d
	jmp	.L2372
.L2431:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L2430
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3653
.L2435:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L2445
	cmpq	$0, 96(%rax)
	je	.L2446
	testb	$8, 62(%rax)
	je	.L2445
.L2446:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2445
	movq	32(%r13), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2445
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L2445
.L2452:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2448
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2452
	jmp	.L2445
.L2448:
	testq	%rbx, %rbx
	jne	.L2430
	jmp	.L2445
.L3653:
	cmpq	$0, 96(%rax)
	je	.L2436
	testb	$8, 62(%rax)
	je	.L2435
.L2436:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2435
	movq	32(%rbp), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2435
	movq	32(%r13), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L2445
.L2442:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2448
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2442
	jmp	.L2445
.L3651:
	movq	32(%rbp), %rdi
	jmp	.L3506
.L3650:
	testq	%rbp, %rbp
	je	.L2425
	jmp	.L2445
.L3644:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L2372
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3145
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L2417:
	testq	%r12, %r12
	je	.L3654
	testq	%rbp, %rbp
	je	.L2406
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3655
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2392
.L3505:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2406
.L2391:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L2417
.L2406:
	xorl	%r13d, %r13d
.L2386:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3507
.L2392:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L2391
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3657
.L2396:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L2406
	cmpq	$0, 96(%rax)
	je	.L2407
	testb	$8, 62(%rax)
	je	.L2406
.L2407:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2406
	movq	32(%r12), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2406
	movq	32(%rbp), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L2406
.L2413:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2409
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2413
	jmp	.L2406
.L2409:
	testq	%rbx, %rbx
	jne	.L2391
	jmp	.L2406
.L3657:
	cmpq	$0, 96(%rax)
	je	.L2397
	testb	$8, 62(%rax)
	je	.L2396
.L2397:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2396
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2396
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L2406
.L2403:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2409
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2403
	jmp	.L2406
.L3655:
	movq	32(%rbp), %rdi
	jmp	.L3505
.L3654:
	testq	%rbp, %rbp
	je	.L2386
	jmp	.L2406
.L2508:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L2372
.L2495:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L2496
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L2355
.L2496:
	testq	%r12, %r12
	je	.L2372
	testq	%r13, %r13
	je	.L2372
	cmpq	%r13, %r12
	je	.L2372
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L2499
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3658
.L2500:
	movl	$1, %r8d
.L2499:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L2501
	movq	104(%r13), %r11
	cmpb	$25, 16(%r11)
	je	.L3659
.L2502:
	movl	$1, %ecx
.L2501:
	testb	%r8b, %r8b
	jne	.L2372
	testb	%cl, %cl
	jne	.L2372
	testb	%dil, %dil
	je	.L3281
	testb	%dl, %dl
.L3409:
	jne	.L2372
.L2507:
	xorl	%r15d, %r15d
	jmp	.L2372
.L3281:
	testb	%dl, %dl
	jne	.L2507
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2507
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3409
.L3659:
	cmpb	$25, 16(%rsi)
	jne	.L2502
	jmp	.L2501
.L3658:
	cmpb	$25, 16(%rcx)
	jne	.L2500
	jmp	.L2499
	.p2align 6,,7
.L3410:
	movl	$1, %r15d
	jmp	.L2360
.L3643:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2369
.L3642:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2368
.L3640:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L2364
.L3639:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L2363
.L3638:
	testb	$2, 62(%rcx)
	je	.L2362
	movq	24(%rcx), %r9
	testq	%r9, %r9
	cmovne	%r9, %rbp
	jmp	.L2362
.L3637:
	testb	$2, 62(%rbx)
	je	.L2361
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2361
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L2361
.L3635:
	cmpq	%rax, %rdx
	je	.L2186
	movq	24(%rdx), %r11
	testq	%r11, %r11
	movq	%r11, 128(%rsp)
	je	.L2186
.L2351:
	movq	128(%rsp), %r15
	movq	%rax, %rbp
	movq	8(%r15), %rbx
	cmpq	%rax, %rbx
	je	.L2193
	testq	%rbx, %rbx
	je	.L2193
	testq	%rax, %rax
	je	.L2193
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L2193
	movzbl	16(%rax), %ecx
	testb	%cl, %cl
	jne	.L2192
.L2193:
	movl	$1, %r15d
.L2194:
	testl	%r15d, %r15d
	jne	.L3660
.L2189:
	movq	128(%rsp), %rdi
	movq	(%rdi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 128(%rsp)
	jne	.L2351
	jmp	.L2186
.L3660:
	movq	152(%rsp), %r15
	movq	%rax, 32(%r15)
	jmp	.L3509
.L2192:
	cmpb	$6, %dl
	je	.L3661
.L2195:
	cmpb	$6, %cl
	je	.L3662
.L2196:
	cmpb	$10, %dl
	je	.L3663
.L2197:
	cmpb	$10, 16(%rbp)
	je	.L3664
.L2198:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L3408
	movzbl	16(%rbx), %edi
	cmpb	16(%rbp), %dil
	je	.L2200
	xorl	%r15d, %r15d
.L3407:
	movq	144(%rsp), %r12
	movq	32(%r12), %rax
	jmp	.L2194
.L2200:
	movzbl	17(%rbx), %ecx
	movzbl	62(%rbx), %esi
	movl	%ecx, %edx
	shrb	$5, %sil
	shrb	$3, %cl
	shrb	$4, %dl
	andl	$1, %ecx
	andl	$1, %esi
	addl	%ecx, %ecx
	andl	$1, %edx
	sall	$2, %esi
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	orl	%esi, %edx
	cmpb	$20, %dil
	je	.L3665
.L2202:
	movzbl	17(%rbp), %r10d
	movzbl	62(%rbp), %r9d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r10d, %edx
	shrb	$5, %r9b
	shrb	$3, %r10b
	shrb	$4, %dl
	andl	$1, %r10d
	andl	$1, %r9d
	andl	$1, %edx
	addl	%r10d, %r10d
	sall	$2, %r9d
	orl	%r10d, %edx
	orl	%r9d, %edx
	cmpb	$20, %dil
	je	.L3666
.L2203:
	leal	0(,%rcx,8), %edi
	orl	%edi, %edx
	cmpl	%edx, %esi
	je	.L2201
	xorl	%r15d, %r15d
.L3332:
	movq	144(%rsp), %r13
	movq	32(%r13), %rax
	jmp	.L2194
.L2201:
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L3667
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 444(%rsp)
	jne	.L2205
	xorl	%r15d, %r15d
.L3408:
	movq	144(%rsp), %r13
	movq	32(%r13), %rax
	jmp	.L2194
.L2205:
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L2329
	cmpl	$18, %eax
	ja	.L2346
	cmpl	$13, %eax
	je	.L2207
.L2206:
	cmpl	$2, 444(%rsp)
	jne	.L3332
	cmpl	$1, %r15d
	je	.L3668
	movq	144(%rsp), %rsi
	movq	32(%rsi), %rax
	jmp	.L2194
.L3668:
	movl	$2, %r15d
	jmp	.L3407
.L2207:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L2208
	call	comptypes
	movl	%eax, %r15d
	jmp	.L2206
.L2208:
	movl	$1, %r15d
	jmp	.L2206
.L2346:
	cmpl	$20, %eax
	je	.L2342
	cmpl	$23, %eax
	jne	.L2206
	movl	$1, 124(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L2211
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 124(%rsp)
	je	.L2206
.L2211:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3669
	testq	%r12, %r12
	je	.L3670
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L2326:
	testq	%r13, %r13
	je	.L3671
	testq	%r12, %r12
	je	.L2315
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3672
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L2301
.L3504:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2315
.L2300:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L2326
.L2315:
	xorl	%r15d, %r15d
.L2295:
	cmpl	$1, %r15d
	cmove	124(%rsp), %r15d
	jmp	.L2206
.L2301:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L2300
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3674
.L2305:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L2315
	cmpq	$0, 96(%rax)
	je	.L2316
	testb	$8, 62(%rax)
	je	.L2315
.L2316:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2315
	movq	32(%r13), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2315
	movq	32(%r12), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L2315
.L2322:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2318
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2322
	jmp	.L2315
.L2318:
	testq	%rbx, %rbx
	jne	.L2300
	jmp	.L2315
.L3674:
	cmpq	$0, 96(%rax)
	je	.L2306
	testb	$8, 62(%rax)
	je	.L2305
.L2306:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2305
	movq	32(%r12), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2305
	movq	32(%r13), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L2315
.L2312:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2318
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2312
	jmp	.L2315
.L3672:
	movq	32(%r12), %rdi
	jmp	.L3504
.L3671:
	testq	%r12, %r12
	je	.L2295
	jmp	.L2315
.L3670:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L2206
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3141
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L2290:
	testq	%r13, %r13
	je	.L3675
	testq	%rbp, %rbp
	je	.L2279
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3676
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2265
.L3502:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2279
.L2264:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L2290
.L2279:
	xorl	%r12d, %r12d
.L2259:
	movl	$2, %r15d
	decl	%r12d
.L3503:
	jne	.L2206
.L3141:
	movl	124(%rsp), %r15d
	jmp	.L2206
.L2265:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L2264
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3678
.L2269:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L2279
	cmpq	$0, 96(%rax)
	je	.L2280
	testb	$8, 62(%rax)
	je	.L2279
.L2280:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2279
	movq	32(%r13), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2279
	movq	32(%rbp), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L2279
.L2286:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2282
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2286
	jmp	.L2279
.L2282:
	testq	%rbx, %rbx
	jne	.L2264
	jmp	.L2279
.L3678:
	cmpq	$0, 96(%rax)
	je	.L2270
	testb	$8, 62(%rax)
	je	.L2269
.L2270:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2269
	movq	32(%rbp), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2269
	movq	32(%r13), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L2279
.L2276:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2282
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2276
	jmp	.L2279
.L3676:
	movq	32(%rbp), %rdi
	jmp	.L3502
.L3675:
	testq	%rbp, %rbp
	je	.L2259
	jmp	.L2279
.L3669:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L2206
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3141
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L2251:
	testq	%r12, %r12
	je	.L3679
	testq	%rbp, %rbp
	je	.L2240
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3680
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2226
.L3501:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2240
.L2225:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L2251
.L2240:
	xorl	%r13d, %r13d
.L2220:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3503
.L2226:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L2225
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3682
.L2230:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L2240
	cmpq	$0, 96(%rax)
	je	.L2241
	testb	$8, 62(%rax)
	je	.L2240
.L2241:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2240
	movq	32(%r12), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2240
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L2240
.L2247:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2243
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2247
	jmp	.L2240
.L2243:
	testq	%rbx, %rbx
	jne	.L2225
	jmp	.L2240
.L3682:
	cmpq	$0, 96(%rax)
	je	.L2231
	testb	$8, 62(%rax)
	je	.L2230
.L2231:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2230
	movq	32(%rbp), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2230
	movq	32(%r12), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L2240
.L2237:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2243
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2237
	jmp	.L2240
.L3680:
	movq	32(%rbp), %rdi
	jmp	.L3501
.L3679:
	testq	%rbp, %rbp
	je	.L2220
	jmp	.L2240
.L2342:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L2206
.L2329:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L2330
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L3331
.L2330:
	testq	%r12, %r12
	je	.L2206
	testq	%r13, %r13
	je	.L2206
	cmpq	%r13, %r12
	je	.L2206
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L2333
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3683
.L2334:
	movl	$1, %r8d
.L2333:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L2335
	movq	104(%r13), %r9
	cmpb	$25, 16(%r9)
	je	.L3684
.L2336:
	movl	$1, %ecx
.L2335:
	testb	%r8b, %r8b
	jne	.L2206
	testb	%cl, %cl
	jne	.L2206
	testb	%dil, %dil
	je	.L3271
	testb	%dl, %dl
.L3406:
	jne	.L2206
.L2341:
	xorl	%r15d, %r15d
	jmp	.L2206
.L3271:
	testb	%dl, %dl
	jne	.L2341
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2341
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3406
.L3684:
	cmpb	$25, 16(%rsi)
	jne	.L2336
	jmp	.L2335
.L3683:
	cmpb	$25, 16(%rcx)
	jne	.L2334
	jmp	.L2333
.L3331:
	movq	144(%rsp), %r10
	movq	32(%r10), %rax
	jmp	.L2189
.L3667:
	movq	144(%rsp), %rbx
	movl	$1, %r15d
	movq	32(%rbx), %rax
	jmp	.L2194
.L3666:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2203
.L3665:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L2202
.L3664:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L2198
.L3663:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L2197
.L3662:
	testb	$2, 62(%rax)
	je	.L2196
	movq	24(%rax), %r8
	testq	%r8, %r8
	cmovne	%r8, %rbp
	jmp	.L2196
.L3661:
	testb	$2, 62(%rbx)
	je	.L2195
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2195
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L2195
.L3634:
	movq	168(%rsp), %rax
	movq	448(%rsp), %rdi
	movq	24(%rax), %rsi
	jmp	.L3500
.L3633:
	cmpq	$0, 136(%rsp)
	jne	.L2172
	jmp	.L3416
.L3632:
	testq	%r8, %r8
	movq	%rdx, %rdi
	jne	.L2170
	jmp	.L3412
	.p2align 6,,7
.L3307:
	movq	96(%rsp), %rdi
.L2131:
	cmpl	$8, %ebp
	movq	168(%rsp), %rsi
	je	.L3685
.L2133:
	call	common_type
	cmpl	$8, %ebx
	movq	%rax, %rdi
	je	.L3686
.L2134:
	cmpl	$8, %ebp
	je	.L3687
.L2136:
	call	build_complex_type
	jmp	.L3421
.L3687:
	movq	168(%rsp), %rbx
	cmpq	%rdi, 8(%rbx)
	jne	.L2136
	jmp	.L3413
	.p2align 6,,7
.L3686:
	movq	96(%rsp), %rcx
	cmpq	%rax, 8(%rcx)
	jne	.L2134
	jmp	.L3416
	.p2align 6,,7
.L3685:
	movq	8(%rsi), %rsi
	jmp	.L2133
.L3260:
	movq	96(%rsp), %r10
	movq	8(%r10), %rdi
	jmp	.L2131
.L3544:
	movzwl	60(%rbx), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, 168(%rsp)
	movzbl	16(%rax), %eax
	jmp	.L2127
.L3543:
	movzwl	60(%rcx), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, 96(%rsp)
	jmp	.L2126
.L3542:
	movq	168(%rsp), %rdi
	movq	%rdi, 96(%rsp)
	jmp	.L2123
.L3541:
	cmpl	$6, 588(%rsp)
	jne	.L2114
	movq	8(%rsp), %rdx
	movl	$59, %edi
	movq	%r14, %rsi
.L3440:
	call	pointer_int_sum
	jmp	.L1
	.p2align 6,,7
.L3540:
	cmpl	$6, 584(%rsp)
	jne	.L138
	movl	$59, %edi
.L3444:
	movq	8(%rsp), %rsi
	movq	%r14, %rdx
	jmp	.L3440
	.p2align 6,,7
.L142:
	cmpl	$13, 588(%rsp)
	jne	.L2114
	cmpl	$13, 584(%rsp)
	je	.L3688
.L143:
	cmpl	$13, 588(%rsp)
	jne	.L2114
	cmpl	$6, 584(%rsp)
	jne	.L2114
	movl	$60, %edi
	jmp	.L3444
.L3688:
	movq	96(%rsp), %rdi
	movq	168(%rsp), %rsi
	movl	$1, %edx
	call	maybe_objc_comptypes
	testl	%eax, %eax
	js	.L3689
.L145:
	testl	%eax, %eax
	je	.L143
	movq	8(%rsp), %rdi
	movq	%r14, %rsi
	call	pointer_diff
	jmp	.L1
.L3689:
	movq	168(%rsp), %rbp
	movq	96(%rsp), %r13
	movq	8(%rbp), %r11
	movq	8(%r13), %rcx
	movq	128(%r11), %rbp
	movq	128(%rcx), %rbx
	cmpq	%rbp, %rbx
	je	.L3351
	testq	%rbx, %rbx
	je	.L3351
	testq	%rbp, %rbp
	je	.L3351
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L3351
	movzbl	16(%rbp), %eax
	testb	%al, %al
	je	.L3351
	cmpb	$6, %dl
	je	.L3690
.L149:
	cmpb	$6, %al
	je	.L3691
.L150:
	cmpb	$10, %dl
	je	.L3692
.L151:
	cmpb	$10, 16(%rbp)
	je	.L3693
.L152:
	cmpq	%rbp, %rbx
	movl	$1, 400(%rsp)
	je	.L148
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L154
	movl	$0, 400(%rsp)
.L148:
	cmpl	$2, 400(%rsp)
	je	.L3694
.L304:
	movl	400(%rsp), %eax
	jmp	.L145
.L3694:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L304
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L304
.L154:
	movzbl	17(%rbx), %r9d
	movzbl	62(%rbx), %edi
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %dil
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %edi
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %edi
	orl	%r9d, %edx
	orl	%edi, %edx
	cmpb	$20, %sil
	je	.L3695
.L156:
	movzbl	17(%rbp), %r8d
	movzbl	62(%rbp), %r10d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r10b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r10d
	orl	%r8d, %edx
	orl	%r10d, %edx
	cmpb	$20, %sil
	je	.L3696
.L157:
	leal	0(,%rcx,8), %esi
	movl	$0, 400(%rsp)
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L148
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L3351
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 400(%rsp)
	testl	%eax, %eax
	movl	%eax, 580(%rsp)
	je	.L148
	movl	$0, 400(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L283
	cmpl	$18, %eax
	ja	.L300
	cmpl	$13, %eax
	je	.L161
.L160:
	cmpl	$2, 580(%rsp)
	jne	.L148
	cmpl	$1, 400(%rsp)
	movl	580(%rsp), %eax
	cmovne	400(%rsp), %eax
	movl	%eax, 400(%rsp)
	jmp	.L148
.L161:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L162
	call	comptypes
.L3350:
	movl	%eax, 400(%rsp)
	jmp	.L160
.L162:
	movl	$1, 400(%rsp)
	jmp	.L160
.L300:
	cmpl	$20, %eax
	je	.L296
	cmpl	$23, %eax
	jne	.L160
	movl	$1, 412(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L165
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 412(%rsp)
	je	.L160
.L165:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3697
	testq	%r12, %r12
	je	.L3698
	movl	$1, 400(%rsp)
	xorl	%ebp, %ebp
.L280:
	testq	%r13, %r13
	je	.L3699
	testq	%r12, %r12
	je	.L269
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3700
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L255
.L3443:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L269
.L254:
	cmpl	400(%rsp), %ebp
	movl	400(%rsp), %edi
	cmovg	%ebp, %edi
	movl	%edi, 400(%rsp)
	movq	(%r12), %r12
	movq	(%r13), %r13
	jmp	.L280
.L269:
	movl	$0, 400(%rsp)
.L249:
	cmpl	$1, 400(%rsp)
	movl	400(%rsp), %r12d
	cmove	412(%rsp), %r12d
	movl	%r12d, 400(%rsp)
	jmp	.L160
.L255:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L254
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3702
.L259:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L269
	cmpq	$0, 96(%rax)
	je	.L270
	testb	$8, 62(%rax)
	je	.L269
.L270:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L269
	movq	32(%r13), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L269
	movq	32(%r12), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L269
.L276:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L272
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L276
	jmp	.L269
.L272:
	testq	%rbx, %rbx
	jne	.L254
	jmp	.L269
.L3702:
	cmpq	$0, 96(%rax)
	je	.L260
	testb	$8, 62(%rax)
	je	.L259
.L260:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L259
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L259
	movq	32(%r13), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L269
.L266:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L272
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L266
	jmp	.L269
.L3700:
	movq	32(%r12), %rdi
	jmp	.L3443
.L3699:
	testq	%r12, %r12
	je	.L249
	jmp	.L269
.L3698:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L160
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3100
	movq	%rax, %rbp
	movl	$1, %r12d
	movl	$0, 404(%rsp)
.L244:
	testq	%r13, %r13
	je	.L3703
	testq	%rbp, %rbp
	je	.L233
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3704
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L219
.L3442:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L233
.L218:
	cmpl	%r12d, 404(%rsp)
	movq	(%r13), %r13
	cmovg	404(%rsp), %r12d
	movq	(%rbp), %rbp
	jmp	.L244
.L233:
	xorl	%r12d, %r12d
.L213:
	decl	%r12d
	movl	$2, 400(%rsp)
	jne	.L160
	movl	412(%rsp), %r13d
	movl	%r13d, 400(%rsp)
	jmp	.L160
.L219:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 404(%rsp)
	jne	.L218
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3706
.L223:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L233
	cmpq	$0, 96(%rax)
	je	.L234
	testb	$8, 62(%rax)
	je	.L233
.L234:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L233
	movq	32(%r13), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L233
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L233
.L240:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L236
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L240
	jmp	.L233
.L236:
	testq	%rbx, %rbx
	jne	.L218
	jmp	.L233
.L3706:
	cmpq	$0, 96(%rax)
	je	.L224
	testb	$8, 62(%rax)
	je	.L223
.L224:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L223
	movq	32(%rbp), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L223
	movq	32(%r13), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L233
.L230:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L236
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L230
	jmp	.L233
.L3704:
	movq	32(%rbp), %rdi
	jmp	.L3442
.L3703:
	testq	%rbp, %rbp
	je	.L213
	jmp	.L233
.L3100:
	movl	412(%rsp), %ebp
	movl	%ebp, 400(%rsp)
	jmp	.L160
.L3697:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L160
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3098
	movq	%rax, %rbp
	movl	$1, %r13d
	movl	$0, 408(%rsp)
.L205:
	testq	%r12, %r12
	je	.L3707
	testq	%rbp, %rbp
	je	.L194
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3708
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L180
.L3441:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L194
.L179:
	cmpl	%r13d, 408(%rsp)
	movq	(%r12), %r12
	cmovg	408(%rsp), %r13d
	movq	(%rbp), %rbp
	jmp	.L205
.L194:
	xorl	%r13d, %r13d
.L174:
	decl	%r13d
	movl	$2, 400(%rsp)
	jne	.L160
	movl	412(%rsp), %eax
	jmp	.L3350
.L180:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 408(%rsp)
	jne	.L179
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3710
.L184:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L194
	cmpq	$0, 96(%rax)
	je	.L195
	testb	$8, 62(%rax)
	je	.L194
.L195:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L194
	movq	32(%r12), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L194
	movq	32(%rbp), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L194
.L201:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L197
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L201
	jmp	.L194
.L197:
	testq	%rbx, %rbx
	jne	.L179
	jmp	.L194
.L3710:
	cmpq	$0, 96(%rax)
	je	.L185
	testb	$8, 62(%rax)
	je	.L184
.L185:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L184
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L184
	movq	32(%r12), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L194
.L191:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L197
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L191
	jmp	.L194
.L3708:
	movq	32(%rbp), %rdi
	jmp	.L3441
.L3707:
	testq	%rbp, %rbp
	je	.L174
	jmp	.L194
.L3098:
	movl	412(%rsp), %eax
	movl	%eax, 400(%rsp)
	jmp	.L160
.L296:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	400(%rsp), %eax
	jmp	.L3350
.L283:
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	movl	$1, 400(%rsp)
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L284
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 400(%rsp)
	je	.L148
.L284:
	testq	%r12, %r12
	je	.L160
	testq	%r13, %r13
	je	.L160
	cmpq	%r13, %r12
	je	.L160
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L287
	movq	104(%r12), %r9
	cmpb	$25, 16(%r9)
	je	.L3711
.L288:
	movl	$1, %r8d
.L287:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L289
	movq	104(%r13), %r10
	cmpb	$25, 16(%r10)
	je	.L3712
.L290:
	movl	$1, %ecx
.L289:
	testb	%r8b, %r8b
	jne	.L160
	testb	%cl, %cl
	jne	.L160
	testb	%dil, %dil
	je	.L3163
	testb	%dl, %dl
.L3349:
	jne	.L160
.L295:
	movl	$0, 400(%rsp)
	jmp	.L160
.L3163:
	testb	%dl, %dl
	jne	.L295
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L295
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3349
.L3712:
	cmpb	$25, 16(%rsi)
	jne	.L290
	jmp	.L289
.L3711:
	cmpb	$25, 16(%rcx)
	jne	.L288
	jmp	.L287
.L3351:
	movl	$1, 400(%rsp)
	jmp	.L148
.L3696:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L157
.L3695:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L156
.L3693:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L152
.L3692:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L151
.L3691:
	testb	$2, 62(%rbp)
	je	.L150
	movq	24(%rbp), %r12
	testq	%r12, %r12
	cmovne	%r12, %rbp
	jmp	.L150
.L3690:
	testb	$2, 62(%rbx)
	je	.L149
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L149
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L149
	.p2align 6,,7
.L327:
	movl	warn_div_by_zero(%rip), %eax
	testl	%eax, %eax
	je	.L328
	movl	skip_evaluation(%rip), %eax
	testl	%eax, %eax
	je	.L3713
.L328:
	cmpl	$6, 588(%rsp)
	jne	.L136
	cmpl	$6, 584(%rsp)
	jne	.L136
	movq	600(%rsp), %rsi
	movl	$0, 180(%rsp)
	movq	8(%rsi), %rax
.L3525:
	testb	$32, 17(%rax)
	jne	.L331
	cmpb	$25, 16(%r14)
	jne	.L2114
	movq	%r14, %rdi
	call	integer_all_onesp
	testl	%eax, %eax
	jne	.L2114
.L331:
	movl	$1, 180(%rsp)
	jmp	.L2114
	.p2align 6,,7
.L3713:
	movq	%r14, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L328
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L328
	.p2align 6,,7
.L313:
	movl	warn_div_by_zero(%rip), %eax
	testl	%eax, %eax
	je	.L314
	movl	skip_evaluation(%rip), %eax
	testl	%eax, %eax
	je	.L3714
.L314:
	movl	588(%rsp), %eax
	subl	$6, %eax
	cmpl	$2, %eax
	ja	.L136
	movl	584(%rsp), %eax
	subl	$6, %eax
	cmpl	$2, %eax
	ja	.L136
	cmpl	$6, 588(%rsp)
	je	.L3715
.L317:
	movl	$70, 16(%rsp)
	jmp	.L2114
.L3715:
	cmpl	$6, 584(%rsp)
	jne	.L317
	movq	600(%rsp), %r8
	movl	$0, 180(%rsp)
	movq	8(%r8), %rax
	jmp	.L3525
	.p2align 6,,7
.L3714:
	movq	%r14, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L314
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L314
	.p2align 6,,7
.L955:
	movl	588(%rsp), %eax
	subl	$6, %eax
	cmpl	$1, %eax
	ja	.L956
	movl	584(%rsp), %eax
	subl	$6, %eax
	cmpl	$1, %eax
	ja	.L956
	movl	$1, 180(%rsp)
	jmp	.L136
.L956:
	cmpl	$13, 588(%rsp)
	jne	.L136
	cmpl	$13, 584(%rsp)
	jne	.L136
	movq	96(%rsp), %rdi
	movq	168(%rsp), %rsi
	movl	$1, %edx
	call	maybe_objc_comptypes
	testl	%eax, %eax
	js	.L3716
.L961:
	testl	%eax, %eax
	je	.L1529
	movq	96(%rsp), %r15
	movq	168(%rsp), %rbx
	cmpq	%rbx, %r15
	je	.L1122
	movq	global_trees(%rip), %rax
	cmpq	%rax, %r15
	je	.L3717
	cmpq	%rax, 168(%rsp)
	je	.L1122
	movq	%r15, %rdi
	movq	168(%rsp), %rsi
	call	*targetm+248(%rip)
	movq	%rax, 512(%rsp)
	cmpb	$10, 16(%r15)
	je	.L3718
.L1125:
	movq	168(%rsp), %rsi
	cmpb	$10, 16(%rsi)
	je	.L3719
.L1126:
	movzbl	16(%r15), %ebp
	movzbl	16(%rbx), %r12d
	cmpl	$8, %ebp
	je	.L3206
	cmpl	$8, %r12d
	je	.L3305
	leal	-6(%rbp), %eax
	cmpl	$17, %eax
	ja	.L1518
	mov	%eax, %edi
	jmp	*.L1519(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L1519:
	.quad	.L1139
	.quad	.L1139
	.quad	.L1518
	.quad	.L1518
	.quad	.L1518
	.quad	.L1518
	.quad	.L1518
	.quad	.L1156
	.quad	.L1518
	.quad	.L1518
	.quad	.L1518
	.quad	.L1518
	.quad	.L1161
	.quad	.L1518
	.quad	.L1518
	.quad	.L1518
	.quad	.L1518
	.quad	.L1168
	.text
.L1139:
	cmpl	$7, %ebp
	je	.L3721
	cmpl	$7, %r12d
	je	.L3207
.L1141:
	movzwl	60(%r15), %edx
	movzwl	60(%rbx), %eax
	andl	$511, %edx
	andl	$511, %eax
	cmpl	%eax, %edx
	jg	.L1518
	cmpl	%edx, %eax
	jg	.L3383
	movq	128(%r15), %rdx
	movq	integer_types+64(%rip), %rcx
	cmpq	%rcx, %rdx
	je	.L1150
	movq	128(%rbx), %rax
	cmpq	%rcx, %rax
	je	.L1150
	movq	integer_types+56(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L1148
	cmpq	%rdi, %rax
	je	.L1148
	movq	global_trees+208(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L3377
	cmpq	%rdi, %rax
	je	.L3377
	testb	$32, 17(%r15)
	jne	.L1518
.L3383:
	movq	%rbx, %rdi
.L3377:
	movq	512(%rsp), %rsi
	call	build_type_attribute_variant
	movq	%rax, %r15
.L1122:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	je	.L136
	movq	96(%rsp), %rax
	movq	8(%rax), %rdi
	cmpb	$23, 16(%rdi)
.L3523:
	jne	.L136
	movl	$.LC14, %edi
.L3404:
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L136
.L1518:
	movq	%r15, %rdi
	jmp	.L3377
.L1148:
	testb	$32, 17(%r15)
	jne	.L1150
	testb	$32, 17(%rbx)
	je	.L3377
.L1150:
	movq	%rcx, %rdi
	jmp	.L3377
.L3207:
	cmpl	$7, %ebp
	jne	.L3383
	jmp	.L1141
.L3721:
	cmpl	$7, %r12d
	je	.L3207
	jmp	.L1518
.L1156:
	movq	8(%r15), %rbp
	movq	8(%rbx), %rbx
	movq	128(%rbp), %rdi
	movq	128(%rbx), %rsi
	call	common_type
	xorl	%ecx, %ecx
	movzbl	62(%rbp), %r15d
	movzbl	17(%rbp), %r12d
	movq	%rax, %rdi
	shrb	$5, %r15b
	movl	%r12d, %edx
	andl	$1, %r15d
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	sall	$2, %r15d
	andl	$1, %edx
	addl	%r12d, %r12d
	orl	%r12d, %edx
	orl	%r15d, %edx
	cmpb	$20, 16(%rbp)
	je	.L3722
.L1159:
	movzbl	17(%rbx), %r8d
	movzbl	62(%rbx), %r10d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r10b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r10d
	orl	%r8d, %edx
	orl	%r10d, %edx
	cmpb	$20, 16(%rbx)
	je	.L3723
.L1160:
	leal	0(,%rcx,8), %r11d
	orl	%r11d, %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movq	%rax, %rdi
	call	build_pointer_type
.L3385:
	movq	%rax, %rdi
	jmp	.L3377
.L3723:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1160
.L3722:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1159
.L1161:
	movq	8(%r15), %rdi
	movq	8(%rbx), %rsi
	call	common_type
	cmpq	8(%r15), %rax
	movq	%rax, %rdi
	je	.L3724
.L1162:
	cmpq	8(%rbx), %rdi
	je	.L3725
.L1163:
	cmpq	$0, 24(%r15)
	cmove	%rbx, %r15
	movq	24(%r15), %rsi
	call	build_array_type
	jmp	.L3385
.L3725:
	cmpq	$0, 24(%rbx)
	je	.L1163
	jmp	.L3383
.L3724:
	cmpq	$0, 24(%r15)
	je	.L1162
	jmp	.L1518
.L1168:
	movq	8(%rbx), %rsi
	movq	8(%r15), %rdi
	call	common_type
	movq	%rax, 504(%rsp)
	movq	504(%rsp), %rsi
	movq	24(%r15), %rax
	movq	%rax, 288(%rsp)
	movq	24(%rbx), %rax
	movq	%rax, 296(%rsp)
	cmpq	8(%r15), %rsi
	je	.L3726
.L1169:
	movq	504(%rsp), %r9
	cmpq	8(%rbx), %r9
	je	.L3727
	cmpq	$0, 288(%rsp)
	je	.L3728
.L1171:
	cmpq	$0, 296(%rsp)
	jne	.L1172
	movq	504(%rsp), %rdi
	movq	288(%rsp), %rsi
.L3473:
	call	build_function_type
	jmp	.L3385
.L1172:
	xorl	%edi, %edi
	call	pushlevel
	movl	$1, %edi
	call	declare_parm_level
	movq	288(%rsp), %rdi
	call	list_length
	movq	$0, 312(%rsp)
	testl	%eax, %eax
	jle	.L3021
	movl	%eax, %ebx
.L1177:
	movq	312(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	call	tree_cons
	decl	%ebx
	movq	%rax, 312(%rsp)
	jne	.L1177
.L3021:
	cmpq	$0, 288(%rsp)
	movq	312(%rsp), %rcx
	movq	%rcx, 304(%rsp)
	je	.L3023
.L1517:
	movq	288(%rsp), %rbp
	movq	32(%rbp), %rdx
	testq	%rdx, %rdx
	jne	.L1182
	movq	296(%rsp), %rdx
	movq	32(%rdx), %rax
.L3376:
	movq	304(%rsp), %r11
	movq	%rax, 32(%r11)
.L1183:
.L1180:
	movq	288(%rsp), %rbx
	movq	296(%rsp), %r12
	movq	304(%rsp), %rbp
	movq	(%rbx), %r9
	movq	%r9, 288(%rsp)
	testq	%r9, %r9
	movq	(%r12), %rsi
	movq	%rsi, 296(%rsp)
	movq	(%rbp), %rdx
	movq	%rdx, 304(%rsp)
	jne	.L1517
.L3023:
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	call	poplevel
	movq	312(%rsp), %rsi
	movq	504(%rsp), %rdi
	call	build_function_type
	movq	%rax, %r15
	jmp	.L1518
.L1182:
	movq	296(%rsp), %rbx
	movq	32(%rbx), %rax
	testq	%rax, %rax
	jne	.L1184
	movq	304(%rsp), %r13
	movq	%rdx, 32(%r13)
	jmp	.L1180
.L1184:
	cmpb	$21, 16(%rdx)
	je	.L3729
.L1185:
	cmpb	$21, 16(%rax)
	je	.L3730
.L1351:
	movq	288(%rsp), %r8
	movq	296(%rsp), %rcx
	movq	32(%r8), %rdi
	movq	32(%rcx), %rsi
	call	common_type
	jmp	.L3376
.L3730:
	movq	288(%rsp), %rdx
	movq	32(%rdx), %rcx
	cmpq	%rcx, %rax
	je	.L1351
	movq	24(%rax), %rbx
	testq	%rbx, %rbx
	movq	%rbx, 264(%rsp)
	je	.L1351
.L1516:
	movq	264(%rsp), %rdi
	movq	%rcx, %rbp
	movq	8(%rdi), %rbx
	cmpq	%rcx, %rbx
	je	.L3374
	testq	%rbx, %rbx
	je	.L3374
	testq	%rcx, %rcx
	je	.L3374
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L3374
	movzbl	16(%rcx), %eax
	testb	%al, %al
	je	.L3374
	cmpb	$6, %dl
	je	.L3731
.L1360:
	cmpb	$6, %al
	je	.L3732
.L1361:
	cmpb	$10, %dl
	je	.L3733
.L1362:
	cmpb	$10, 16(%rbp)
	je	.L3734
.L1363:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L1359
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L1365
	xorl	%r15d, %r15d
.L1359:
	testl	%r15d, %r15d
	jne	.L3735
.L1354:
	movq	264(%rsp), %r10
	movq	(%r10), %rdi
	testq	%rdi, %rdi
	movq	%rdi, 264(%rsp)
	je	.L1351
	movq	288(%rsp), %rax
	movq	32(%rax), %rcx
	jmp	.L1516
.L3735:
	movq	288(%rsp), %rax
	movq	304(%rsp), %r12
	movq	32(%rax), %r13
	movq	%r13, 32(%r12)
.L3482:
	movl	pedantic(%rip), %r15d
	testl	%r15d, %r15d
	je	.L1180
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L1180
.L1365:
	movzbl	17(%rbx), %r12d
	movzbl	62(%rbx), %ecx
	movl	%r12d, %edx
	shrb	$5, %cl
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r12d, %r12d
	sall	$2, %ecx
	orl	%r12d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L3736
.L1367:
	movzbl	17(%rbp), %r8d
	movzbl	62(%rbp), %r13d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r13b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r13d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r13d
	orl	%r8d, %edx
	orl	%r13d, %edx
	cmpb	$20, %sil
	je	.L3737
.L1368:
	leal	0(,%rcx,8), %r15d
	orl	%r15d, %edx
	xorl	%r15d, %r15d
	cmpl	%edx, %edi
	jne	.L1359
	movq	128(%rbp), %r11
	cmpq	%r11, 128(%rbx)
	je	.L3374
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%r15d, %r15d
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 496(%rsp)
	je	.L1359
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L1494
	cmpl	$18, %eax
	ja	.L1511
	cmpl	$13, %eax
	je	.L1372
.L1371:
	cmpl	$2, 496(%rsp)
	jne	.L1359
	cmpl	$1, %r15d
	cmove	496(%rsp), %r15d
	jmp	.L1359
.L1372:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L1373
	call	comptypes
	movl	%eax, %r15d
	jmp	.L1371
.L1373:
	movl	$1, %r15d
	jmp	.L1371
.L1511:
	cmpl	$20, %eax
	je	.L1507
	cmpl	$23, %eax
	jne	.L1371
	movl	$1, 260(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L1376
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 260(%rsp)
	je	.L1371
.L1376:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3738
	testq	%r12, %r12
	je	.L3739
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L1491:
	testq	%r13, %r13
	je	.L3740
	testq	%r12, %r12
	je	.L1480
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3741
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L1466
.L3481:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1480
.L1465:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L1491
.L1480:
	xorl	%r15d, %r15d
.L1460:
	cmpl	$1, %r15d
	cmove	260(%rsp), %r15d
	jmp	.L1371
.L1466:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L1465
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3743
.L1470:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L1480
	cmpq	$0, 96(%rax)
	je	.L1481
	testb	$8, 62(%rax)
	je	.L1480
.L1481:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1480
	movq	32(%r13), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1480
	movq	32(%r12), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L1480
.L1487:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1483
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1487
	jmp	.L1480
.L1483:
	testq	%rbx, %rbx
	jne	.L1465
	jmp	.L1480
.L3743:
	cmpq	$0, 96(%rax)
	je	.L1471
	testb	$8, 62(%rax)
	je	.L1470
.L1471:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1470
	movq	32(%r12), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1470
	movq	32(%r13), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L1480
.L1477:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1483
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1477
	jmp	.L1480
.L3741:
	movq	32(%r12), %rdi
	jmp	.L3481
.L3740:
	testq	%r12, %r12
	je	.L1460
	jmp	.L1480
.L3739:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1371
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3125
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L1455:
	testq	%r13, %r13
	je	.L3744
	testq	%rbp, %rbp
	je	.L1444
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3745
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1430
.L3479:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1444
.L1429:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L1455
.L1444:
	xorl	%r12d, %r12d
.L1424:
	movl	$2, %r15d
	decl	%r12d
.L3480:
	jne	.L1371
.L3125:
	movl	260(%rsp), %r15d
	jmp	.L1371
.L1430:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1429
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3747
.L1434:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1444
	cmpq	$0, 96(%rax)
	je	.L1445
	testb	$8, 62(%rax)
	je	.L1444
.L1445:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1444
	movq	32(%r13), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1444
	movq	32(%rbp), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L1444
.L1451:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1447
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1451
	jmp	.L1444
.L1447:
	testq	%rbx, %rbx
	jne	.L1429
	jmp	.L1444
.L3747:
	cmpq	$0, 96(%rax)
	je	.L1435
	testb	$8, 62(%rax)
	je	.L1434
.L1435:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1434
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1434
	movq	32(%r13), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L1444
.L1441:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1447
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1441
	jmp	.L1444
.L3745:
	movq	32(%rbp), %rdi
	jmp	.L3479
.L3744:
	testq	%rbp, %rbp
	je	.L1424
	jmp	.L1444
.L3738:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1371
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3125
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L1416:
	testq	%r12, %r12
	je	.L3748
	testq	%rbp, %rbp
	je	.L1405
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3749
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1391
.L3478:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1405
.L1390:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L1416
.L1405:
	xorl	%r13d, %r13d
.L1385:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3480
.L1391:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1390
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3751
.L1395:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1405
	cmpq	$0, 96(%rax)
	je	.L1406
	testb	$8, 62(%rax)
	je	.L1405
.L1406:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1405
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1405
	movq	32(%rbp), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L1405
.L1412:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1408
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1412
	jmp	.L1405
.L1408:
	testq	%rbx, %rbx
	jne	.L1390
	jmp	.L1405
.L3751:
	cmpq	$0, 96(%rax)
	je	.L1396
	testb	$8, 62(%rax)
	je	.L1395
.L1396:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1395
	movq	32(%rbp), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1395
	movq	32(%r12), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L1405
.L1402:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1408
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1402
	jmp	.L1405
.L3749:
	movq	32(%rbp), %rdi
	jmp	.L3478
.L3748:
	testq	%rbp, %rbp
	je	.L1385
	jmp	.L1405
.L1507:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L1371
.L1494:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L1495
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L1354
.L1495:
	testq	%r12, %r12
	je	.L1371
	testq	%r13, %r13
	je	.L1371
	cmpq	%r13, %r12
	je	.L1371
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L1498
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3752
.L1499:
	movl	$1, %r8d
.L1498:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L1500
	movq	104(%r13), %rbx
	cmpb	$25, 16(%rbx)
	je	.L3753
.L1501:
	movl	$1, %ecx
.L1500:
	testb	%r8b, %r8b
	jne	.L1371
	testb	%cl, %cl
	jne	.L1371
	testb	%dil, %dil
	je	.L3227
	testb	%dl, %dl
.L3373:
	jne	.L1371
.L1506:
	xorl	%r15d, %r15d
	jmp	.L1371
.L3227:
	testb	%dl, %dl
	jne	.L1506
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1506
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3373
.L3753:
	cmpb	$25, 16(%rsi)
	jne	.L1501
	jmp	.L1500
.L3752:
	cmpb	$25, 16(%rcx)
	jne	.L1499
	jmp	.L1498
.L3374:
	movl	$1, %r15d
	jmp	.L1359
.L3737:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1368
.L3736:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1367
.L3734:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L1363
.L3733:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L1362
.L3732:
	testb	$2, 62(%rcx)
	je	.L1361
	movq	24(%rcx), %r10
	testq	%r10, %r10
	cmovne	%r10, %rbp
	jmp	.L1361
.L3731:
	testb	$2, 62(%rbx)
	je	.L1360
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1360
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L1360
.L3729:
	cmpq	%rax, %rdx
	je	.L1185
	movq	24(%rdx), %rdi
	testq	%rdi, %rdi
	movq	%rdi, 280(%rsp)
	je	.L1185
.L1350:
	movq	280(%rsp), %r15
	movq	%rax, %rbp
	movq	8(%r15), %rbx
	cmpq	%rax, %rbx
	je	.L1192
	testq	%rbx, %rbx
	je	.L1192
	testq	%rax, %rax
	je	.L1192
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L1192
	movzbl	16(%rax), %ecx
	testb	%cl, %cl
	jne	.L1191
.L1192:
	movl	$1, %r15d
.L1193:
	testl	%r15d, %r15d
	jne	.L3754
.L1188:
	movq	280(%rsp), %rsi
	movq	(%rsi), %r9
	testq	%r9, %r9
	movq	%r9, 280(%rsp)
	jne	.L1350
	jmp	.L1185
.L3754:
	movq	304(%rsp), %r15
	movq	%rax, 32(%r15)
	jmp	.L3482
.L1191:
	cmpb	$6, %dl
	je	.L3755
.L1194:
	cmpb	$6, %cl
	je	.L3756
.L1195:
	cmpb	$10, %dl
	je	.L3757
.L1196:
	cmpb	$10, 16(%rbp)
	je	.L3758
.L1197:
	cmpq	%rbp, %rbx
	je	.L3372
	movzbl	16(%rbx), %edi
	cmpb	16(%rbp), %dil
	je	.L3759
.L3371:
	movq	296(%rsp), %rcx
	xorl	%r15d, %r15d
	movq	32(%rcx), %rax
	jmp	.L1193
.L3759:
	movzbl	17(%rbx), %r8d
	movzbl	62(%rbx), %r10d
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r10b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r10d
	orl	%r8d, %edx
	orl	%r10d, %edx
	cmpb	$20, %dil
	je	.L3760
.L1201:
	movzbl	17(%rbp), %r9d
	movzbl	62(%rbp), %r11d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %r11b
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %r11d
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %r11d
	orl	%r9d, %edx
	orl	%r11d, %edx
	cmpb	$20, %dil
	je	.L3761
.L1202:
	leal	0(,%rcx,8), %r13d
	orl	%r13d, %edx
	cmpl	%edx, %esi
	je	.L1200
	xorl	%r15d, %r15d
.L3370:
	movq	296(%rsp), %r12
	movq	32(%r12), %rax
	jmp	.L1193
.L1200:
	movq	128(%rbp), %rax
	cmpq	%rax, 128(%rbx)
	je	.L3372
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 500(%rsp)
	je	.L3371
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L1328
	cmpl	$18, %eax
	ja	.L1345
	cmpl	$13, %eax
	je	.L1206
.L1205:
	cmpl	$2, 500(%rsp)
	je	.L3762
	movq	296(%rsp), %r13
	movq	32(%r13), %rax
	jmp	.L1193
.L3762:
	cmpl	$1, %r15d
	je	.L3763
	movq	296(%rsp), %r8
	movq	32(%r8), %rax
	jmp	.L1193
.L3763:
	movl	$2, %r15d
	jmp	.L3370
.L1206:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L1207
	call	comptypes
	movl	%eax, %r15d
	jmp	.L1205
.L1207:
	movl	$1, %r15d
	jmp	.L1205
.L1345:
	cmpl	$20, %eax
	je	.L1341
	cmpl	$23, %eax
	jne	.L1205
	movl	$1, 276(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L1210
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 276(%rsp)
	je	.L1205
.L1210:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3764
	testq	%r12, %r12
	je	.L3765
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L1325:
	testq	%r13, %r13
	je	.L3766
	testq	%r12, %r12
	je	.L1314
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3767
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L1300
.L3477:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1314
.L1299:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L1325
.L1314:
	xorl	%r15d, %r15d
.L1294:
	cmpl	$1, %r15d
	cmove	276(%rsp), %r15d
	jmp	.L1205
.L1300:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L1299
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3769
.L1304:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L1314
	cmpq	$0, 96(%rax)
	je	.L1315
	testb	$8, 62(%rax)
	je	.L1314
.L1315:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1314
	movq	32(%r13), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1314
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L1314
.L1321:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1317
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1321
	jmp	.L1314
.L1317:
	testq	%rbx, %rbx
	jne	.L1299
	jmp	.L1314
.L3769:
	cmpq	$0, 96(%rax)
	je	.L1305
	testb	$8, 62(%rax)
	je	.L1304
.L1305:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1304
	movq	32(%r12), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1304
	movq	32(%r13), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L1314
.L1311:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1317
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1311
	jmp	.L1314
.L3767:
	movq	32(%r12), %rdi
	jmp	.L3477
.L3766:
	testq	%r12, %r12
	je	.L1294
	jmp	.L1314
.L3765:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1205
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3121
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L1289:
	testq	%r13, %r13
	je	.L3770
	testq	%rbp, %rbp
	je	.L1278
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3771
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1264
.L3475:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1278
.L1263:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L1289
.L1278:
	xorl	%r12d, %r12d
.L1258:
	movl	$2, %r15d
	decl	%r12d
.L3476:
	jne	.L1205
.L3121:
	movl	276(%rsp), %r15d
	jmp	.L1205
.L1264:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1263
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3773
.L1268:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1278
	cmpq	$0, 96(%rax)
	je	.L1279
	testb	$8, 62(%rax)
	je	.L1278
.L1279:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1278
	movq	32(%r13), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1278
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L1278
.L1285:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1281
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1285
	jmp	.L1278
.L1281:
	testq	%rbx, %rbx
	jne	.L1263
	jmp	.L1278
.L3773:
	cmpq	$0, 96(%rax)
	je	.L1269
	testb	$8, 62(%rax)
	je	.L1268
.L1269:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1268
	movq	32(%rbp), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1268
	movq	32(%r13), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L1278
.L1275:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1281
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1275
	jmp	.L1278
.L3771:
	movq	32(%rbp), %rdi
	jmp	.L3475
.L3770:
	testq	%rbp, %rbp
	je	.L1258
	jmp	.L1278
.L3764:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1205
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3121
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L1250:
	testq	%r12, %r12
	je	.L3774
	testq	%rbp, %rbp
	je	.L1239
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3775
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1225
.L3474:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1239
.L1224:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L1250
.L1239:
	xorl	%r13d, %r13d
.L1219:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3476
.L1225:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1224
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3777
.L1229:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1239
	cmpq	$0, 96(%rax)
	je	.L1240
	testb	$8, 62(%rax)
	je	.L1239
.L1240:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1239
	movq	32(%r12), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1239
	movq	32(%rbp), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L1239
.L1246:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1242
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1246
	jmp	.L1239
.L1242:
	testq	%rbx, %rbx
	jne	.L1224
	jmp	.L1239
.L3777:
	cmpq	$0, 96(%rax)
	je	.L1230
	testb	$8, 62(%rax)
	je	.L1229
.L1230:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1229
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1229
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L1239
.L1236:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1242
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1236
	jmp	.L1239
.L3775:
	movq	32(%rbp), %rdi
	jmp	.L3474
.L3774:
	testq	%rbp, %rbp
	je	.L1219
	jmp	.L1239
.L1341:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L1205
.L1328:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L1329
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L3323
.L1329:
	testq	%r12, %r12
	je	.L1205
	testq	%r13, %r13
	je	.L1205
	cmpq	%r13, %r12
	je	.L1205
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L1332
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3778
.L1333:
	movl	$1, %r8d
.L1332:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L1334
	movq	104(%r13), %r10
	cmpb	$25, 16(%r10)
	je	.L3779
.L1335:
	movl	$1, %ecx
.L1334:
	testb	%r8b, %r8b
	jne	.L1205
	testb	%cl, %cl
	jne	.L1205
	testb	%dil, %dil
	je	.L3217
	testb	%dl, %dl
.L3369:
	jne	.L1205
.L1340:
	xorl	%r15d, %r15d
	jmp	.L1205
.L3217:
	testb	%dl, %dl
	jne	.L1340
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1340
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3369
.L3779:
	cmpb	$25, 16(%rsi)
	jne	.L1335
	jmp	.L1334
.L3778:
	cmpb	$25, 16(%rcx)
	jne	.L1333
	jmp	.L1332
.L3323:
	movq	296(%rsp), %r11
	movq	32(%r11), %rax
	jmp	.L1188
.L3372:
	movq	296(%rsp), %rsi
	movl	$1, %r15d
	movq	32(%rsi), %rax
	jmp	.L1193
.L3761:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1202
.L3760:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1201
.L3758:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L1197
.L3757:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L1196
.L3756:
	testb	$2, 62(%rax)
	je	.L1195
	movq	24(%rax), %r12
	testq	%r12, %r12
	cmovne	%r12, %rbp
	jmp	.L1195
.L3755:
	testb	$2, 62(%rbx)
	je	.L1194
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1194
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L1194
.L3728:
	movq	504(%rsp), %rdi
	movq	24(%rbx), %rsi
	jmp	.L3473
.L3727:
	cmpq	$0, 288(%rsp)
	jne	.L1171
	jmp	.L3383
.L3726:
	testq	%rax, %rax
	jne	.L1169
	jmp	.L1518
.L3305:
	movq	%r15, %rdi
.L1130:
	cmpl	$8, %r12d
	movq	%rbx, %rsi
	je	.L3780
.L1132:
	call	common_type
	cmpl	$8, %ebp
	movq	%rax, %rdi
	je	.L3781
.L1133:
	cmpl	$8, %r12d
	je	.L3782
.L1135:
	call	build_complex_type
	jmp	.L3385
.L3782:
	cmpq	%rdi, 8(%rbx)
	jne	.L1135
	jmp	.L3383
.L3781:
	cmpq	%rax, 8(%r15)
	jne	.L1133
	jmp	.L1518
.L3780:
	movq	8(%rbx), %rsi
	jmp	.L1132
.L3206:
	movq	8(%r15), %rdi
	jmp	.L1130
.L3719:
	movzwl	60(%rsi), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L1126
.L3718:
	movzwl	60(%r15), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %r15
	jmp	.L1125
.L3717:
	movq	%rbx, %r15
	jmp	.L1122
.L1529:
	movq	global_trees+224(%rip), %r15
	movl	$.LC12, %edi
	jmp	.L3404
.L3716:
	movq	96(%rsp), %rbx
	movq	168(%rsp), %rdi
	movq	8(%rbx), %rbp
	movq	8(%rdi), %r15
	movq	128(%rbp), %rbx
	movq	128(%r15), %rbp
	cmpq	%rbp, %rbx
	je	.L3368
	testq	%rbx, %rbx
	je	.L3368
	testq	%rbp, %rbp
	je	.L3368
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L3368
	movzbl	16(%rbp), %eax
	testb	%al, %al
	je	.L3368
	cmpb	$6, %dl
	je	.L3783
.L965:
	cmpb	$6, %al
	je	.L3784
.L966:
	cmpb	$10, %dl
	je	.L3785
.L967:
	cmpb	$10, 16(%rbp)
	je	.L3786
.L968:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L964
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L970
	xorl	%r15d, %r15d
.L964:
	cmpl	$2, %r15d
	je	.L3787
.L1120:
	movl	%r15d, %eax
	jmp	.L961
.L3787:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	je	.L1120
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L1120
.L970:
	movzbl	17(%rbx), %r13d
	movzbl	62(%rbx), %r10d
	xorl	%ecx, %ecx
	movl	%r13d, %edx
	shrb	$5, %r10b
	shrb	$3, %r13b
	shrb	$4, %dl
	andl	$1, %r13d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r13d, %r13d
	sall	$2, %r10d
	orl	%r13d, %edx
	orl	%r10d, %edx
	cmpb	$20, %sil
	je	.L3788
.L972:
	movzbl	17(%rbp), %r8d
	movzbl	62(%rbp), %r12d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r12b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r12d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r12d
	orl	%r8d, %edx
	orl	%r12d, %edx
	cmpb	$20, %sil
	je	.L3789
.L973:
	leal	0(,%rcx,8), %r11d
	xorl	%r15d, %r15d
	orl	%r11d, %edx
	cmpl	%edx, %edi
	jne	.L964
	movq	128(%rbp), %rax
	cmpq	%rax, 128(%rbx)
	je	.L3368
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%r15d, %r15d
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 524(%rsp)
	je	.L964
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L1099
	cmpl	$18, %eax
	ja	.L1116
	cmpl	$13, %eax
	je	.L977
.L976:
	cmpl	$2, 524(%rsp)
	jne	.L964
	cmpl	$1, %r15d
	cmove	524(%rsp), %r15d
	jmp	.L964
.L977:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L978
	call	comptypes
	movl	%eax, %r15d
	jmp	.L976
.L978:
	movl	$1, %r15d
	jmp	.L976
.L1116:
	cmpl	$20, %eax
	je	.L1112
	cmpl	$23, %eax
	jne	.L976
	movl	$1, 320(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L981
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 320(%rsp)
	je	.L976
.L981:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3790
	testq	%r12, %r12
	je	.L3791
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L1096:
	testq	%r13, %r13
	je	.L3792
	testq	%r12, %r12
	je	.L1085
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3793
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L1071
.L3472:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1085
.L1070:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L1096
.L1085:
	xorl	%r15d, %r15d
.L1065:
	cmpl	$1, %r15d
	cmove	320(%rsp), %r15d
	jmp	.L976
.L1071:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L1070
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3795
.L1075:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L1085
	cmpq	$0, 96(%rax)
	je	.L1086
	testb	$8, 62(%rax)
	je	.L1085
.L1086:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1085
	movq	32(%r13), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1085
	movq	32(%r12), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L1085
.L1092:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1088
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1092
	jmp	.L1085
.L1088:
	testq	%rbx, %rbx
	jne	.L1070
	jmp	.L1085
.L3795:
	cmpq	$0, 96(%rax)
	je	.L1076
	testb	$8, 62(%rax)
	je	.L1075
.L1076:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1075
	movq	32(%r12), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1075
	movq	32(%r13), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L1085
.L1082:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1088
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1082
	jmp	.L1085
.L3793:
	movq	32(%r12), %rdi
	jmp	.L3472
.L3792:
	testq	%r12, %r12
	je	.L1065
	jmp	.L1085
.L3791:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L976
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3117
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L1060:
	testq	%r13, %r13
	je	.L3796
	testq	%rbp, %rbp
	je	.L1049
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3797
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1035
.L3470:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1049
.L1034:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L1060
.L1049:
	xorl	%r12d, %r12d
.L1029:
	movl	$2, %r15d
	decl	%r12d
.L3471:
	jne	.L976
.L3117:
	movl	320(%rsp), %r15d
	jmp	.L976
.L1035:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1034
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3799
.L1039:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1049
	cmpq	$0, 96(%rax)
	je	.L1050
	testb	$8, 62(%rax)
	je	.L1049
.L1050:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1049
	movq	32(%r13), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1049
	movq	32(%rbp), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L1049
.L1056:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1052
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1056
	jmp	.L1049
.L1052:
	testq	%rbx, %rbx
	jne	.L1034
	jmp	.L1049
.L3799:
	cmpq	$0, 96(%rax)
	je	.L1040
	testb	$8, 62(%rax)
	je	.L1039
.L1040:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1039
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1039
	movq	32(%r13), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L1049
.L1046:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1052
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1046
	jmp	.L1049
.L3797:
	movq	32(%rbp), %rdi
	jmp	.L3470
.L3796:
	testq	%rbp, %rbp
	je	.L1029
	jmp	.L1049
.L3790:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L976
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3117
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L1021:
	testq	%r12, %r12
	je	.L3800
	testq	%rbp, %rbp
	je	.L1010
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3801
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L996
.L3469:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1010
.L995:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L1021
.L1010:
	xorl	%r13d, %r13d
.L990:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3471
.L996:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L995
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3803
.L1000:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1010
	cmpq	$0, 96(%rax)
	je	.L1011
	testb	$8, 62(%rax)
	je	.L1010
.L1011:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1010
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1010
	movq	32(%rbp), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L1010
.L1017:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1013
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1017
	jmp	.L1010
.L1013:
	testq	%rbx, %rbx
	jne	.L995
	jmp	.L1010
.L3803:
	cmpq	$0, 96(%rax)
	je	.L1001
	testb	$8, 62(%rax)
	je	.L1000
.L1001:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1000
	movq	32(%rbp), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1000
	movq	32(%r12), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L1010
.L1007:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1013
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1007
	jmp	.L1010
.L3801:
	movq	32(%rbp), %rdi
	jmp	.L3469
.L3800:
	testq	%rbp, %rbp
	je	.L990
	jmp	.L1010
.L1112:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L976
.L1099:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L1100
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L964
.L1100:
	testq	%r12, %r12
	je	.L976
	testq	%r13, %r13
	je	.L976
	cmpq	%r13, %r12
	je	.L976
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L1103
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3804
.L1104:
	movl	$1, %r8d
.L1103:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L1105
	movq	104(%r13), %rbx
	cmpb	$25, 16(%rbx)
	je	.L3805
.L1106:
	movl	$1, %ecx
.L1105:
	testb	%r8b, %r8b
	jne	.L976
	testb	%cl, %cl
	jne	.L976
	testb	%dil, %dil
	je	.L3205
	testb	%dl, %dl
.L3367:
	jne	.L976
.L1111:
	xorl	%r15d, %r15d
	jmp	.L976
.L3205:
	testb	%dl, %dl
	jne	.L1111
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1111
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3367
.L3805:
	cmpb	$25, 16(%rsi)
	jne	.L1106
	jmp	.L1105
.L3804:
	cmpb	$25, 16(%rcx)
	jne	.L1104
	jmp	.L1103
.L3368:
	movl	$1, %r15d
	jmp	.L964
.L3789:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L973
.L3788:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L972
.L3786:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L968
.L3785:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L967
.L3784:
	testb	$2, 62(%rbp)
	je	.L966
	movq	24(%rbp), %rsi
	testq	%rsi, %rsi
	cmovne	%rsi, %rbp
	jmp	.L966
.L3783:
	testb	$2, 62(%rbx)
	je	.L965
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L965
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L965
	.p2align 6,,7
.L349:
	cmpl	$6, 588(%rsp)
	jne	.L136
	cmpl	$6, 584(%rsp)
	jne	.L136
	cmpb	$25, %dl
	je	.L3806
.L360:
	movl	flag_traditional(%rip), %ebx
	movq	96(%rsp), %r15
	testl	%ebx, %ebx
	jne	.L136
	movq	8(%r14), %rcx
	movq	integer_types+40(%rip), %rdi
	cmpq	%rdi, 128(%rcx)
	je	.L365
	movq	%r14, %rsi
	call	convert
.L3446:
	movq	%rax, %r14
.L365:
	movl	$1, 20(%rsp)
	jmp	.L136
.L3806:
	movl	skip_evaluation(%rip), %ebp
	testl	%ebp, %ebp
	jne	.L360
	movq	%r14, %rdi
	call	tree_int_cst_sgn
	movl	$.LC5, %edi
	testl	%eax, %eax
	js	.L3354
	movq	96(%rsp), %r13
	movq	%r14, %rdi
	movzwl	60(%r13), %esi
	andl	$511, %esi
	call	compare_tree_int
	movl	$.LC6, %edi
	testl	%eax, %eax
	js	.L360
.L3354:
	xorl	%eax, %eax
	call	warning
	jmp	.L360
	.p2align 6,,7
.L340:
	cmpl	$6, 588(%rsp)
	jne	.L136
	cmpl	$6, 584(%rsp)
	jne	.L136
	cmpb	$25, %dl
	jne	.L360
	movl	skip_evaluation(%rip), %eax
	testl	%eax, %eax
	jne	.L360
	movq	%r14, %rdi
	call	tree_int_cst_sgn
	movl	$.LC3, %edi
	testl	%eax, %eax
	js	.L3354
	movq	%r14, %rdi
	call	integer_zerop
	movq	%r14, %rdi
	movq	96(%rsp), %r15
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	188(%rsp), %eax
	movzwl	60(%r15), %esi
	movl	%eax, 188(%rsp)
	andl	$511, %esi
	call	compare_tree_int
	movl	$.LC4, %edi
	testl	%eax, %eax
	jns	.L3354
	jmp	.L360
	.p2align 6,,7
.L358:
	cmpl	$6, 588(%rsp)
	jne	.L136
	cmpl	$6, 584(%rsp)
	jne	.L136
	cmpb	$25, %dl
	jne	.L360
	movl	skip_evaluation(%rip), %edx
	testl	%edx, %edx
	jne	.L360
	movq	%r14, %rdi
	call	tree_int_cst_sgn
	movl	$.LC7, %edi
	testl	%eax, %eax
	js	.L3354
	movq	96(%rsp), %r11
	movq	%r14, %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	js	.L360
	movl	$.LC8, %edi
	jmp	.L3354
	.p2align 6,,7
.L324:
	cmpl	$6, 588(%rsp)
	jne	.L136
	cmpl	$6, 584(%rsp)
	jne	.L136
	movl	$-1, 180(%rsp)
	jmp	.L136
.L336:
	cmpl	$6, 588(%rsp)
	je	.L338
	cmpl	$13, 588(%rsp)
	je	.L338
	cmpl	$7, 588(%rsp)
	je	.L338
	cmpl	$8, 588(%rsp)
	jne	.L136
.L338:
	cmpl	$6, 584(%rsp)
	je	.L339
	cmpl	$13, 584(%rsp)
	je	.L339
	cmpl	$7, 584(%rsp)
	je	.L339
	cmpl	$8, 584(%rsp)
	jne	.L136
.L339:
	movq	8(%rsp), %rdi
	movq	integer_types+40(%rip), %r15
	call	truthvalue_conversion
	movq	%r14, %rdi
	movq	%rax, 8(%rsp)
	call	truthvalue_conversion
	jmp	.L3446
.L1525:
	movl	588(%rsp), %eax
	movq	integer_types+40(%rip), %r10
	subl	$6, %eax
	movq	%r10, (%rsp)
	cmpl	$1, %eax
	ja	.L1526
	movl	584(%rsp), %eax
	subl	$6, %eax
	cmpl	$1, %eax
	ja	.L1526
.L3405:
	movl	$1, 184(%rsp)
	jmp	.L136
.L1526:
	cmpl	$13, 588(%rsp)
	je	.L3808
.L2095:
	cmpl	$13, 584(%rsp)
	je	.L3809
.L2099:
	cmpl	$13, 588(%rsp)
	je	.L3810
.L2102:
	cmpl	$6, 588(%rsp)
	jne	.L136
	cmpl	$13, 584(%rsp)
	jne	.L136
	movq	168(%rsp), %r15
.L3497:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L136
	movl	$.LC13, %edi
	jmp	.L3404
	.p2align 6,,7
.L3810:
	cmpl	$6, 584(%rsp)
	jne	.L2102
	movq	96(%rsp), %r15
	jmp	.L3497
.L3809:
	movq	8(%rsp), %rsi
	cmpb	$25, 16(%rsi)
	jne	.L2099
	movq	%rsi, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L2099
	movl	pedantic(%rip), %eax
	movq	168(%rsp), %r15
	testl	%eax, %eax
.L3524:
	je	.L136
.L3499:
	movl	$.LC16, %edi
	jmp	.L3404
	.p2align 6,,7
.L3808:
	cmpl	$13, 584(%rsp)
	je	.L3811
	cmpb	$25, %dl
	jne	.L2095
	movq	%r14, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L2095
	movl	pedantic(%rip), %eax
	movq	96(%rsp), %r15
	testl	%eax, %eax
	jne	.L3499
	movl	extra_warnings(%rip), %eax
	testl	%eax, %eax
	jmp	.L3524
.L3811:
	movq	96(%rsp), %rdi
	movq	168(%rsp), %rsi
	movl	$1, %edx
	call	maybe_objc_comptypes
	testl	%eax, %eax
	js	.L3812
.L1531:
	testl	%eax, %eax
	je	.L1529
	movq	96(%rsp), %r15
	movq	168(%rsp), %rbx
	cmpq	%rbx, %r15
	je	.L1692
	movq	global_trees(%rip), %rax
	cmpq	%rax, %r15
	je	.L3813
	cmpq	%rax, 168(%rsp)
	je	.L1692
	movq	%r15, %rdi
	movq	168(%rsp), %rsi
	call	*targetm+248(%rip)
	movq	%rax, 480(%rsp)
	cmpb	$10, 16(%r15)
	je	.L3814
.L1695:
	movq	168(%rsp), %r8
	cmpb	$10, 16(%r8)
	je	.L3815
.L1696:
	movzbl	16(%r15), %ebp
	movzbl	16(%rbx), %r12d
	cmpl	$8, %ebp
	je	.L3238
	cmpl	$8, %r12d
	je	.L3306
	leal	-6(%rbp), %eax
	cmpl	$17, %eax
	ja	.L2088
	mov	%eax, %r13d
	jmp	*.L2089(,%r13,8)
	.section	.rodata
	.align 8
	.align 4
.L2089:
	.quad	.L1709
	.quad	.L1709
	.quad	.L2088
	.quad	.L2088
	.quad	.L2088
	.quad	.L2088
	.quad	.L2088
	.quad	.L1726
	.quad	.L2088
	.quad	.L2088
	.quad	.L2088
	.quad	.L2088
	.quad	.L1731
	.quad	.L2088
	.quad	.L2088
	.quad	.L2088
	.quad	.L2088
	.quad	.L1738
	.text
.L1709:
	cmpl	$7, %ebp
	je	.L3817
	cmpl	$7, %r12d
	je	.L3239
.L1711:
	movzwl	60(%r15), %edx
	movzwl	60(%rbx), %eax
	andl	$511, %edx
	andl	$511, %eax
	cmpl	%eax, %edx
	jg	.L2088
	cmpl	%edx, %eax
	jg	.L3400
	movq	128(%r15), %rdx
	movq	integer_types+64(%rip), %rcx
	cmpq	%rcx, %rdx
	je	.L1720
	movq	128(%rbx), %rax
	cmpq	%rcx, %rax
	je	.L1720
	movq	integer_types+56(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L1718
	cmpq	%rdi, %rax
	je	.L1718
	movq	global_trees+208(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L3394
	cmpq	%rdi, %rax
	je	.L3394
	testb	$32, 17(%r15)
	jne	.L2088
.L3400:
	movq	%rbx, %rdi
.L3394:
	movq	480(%rsp), %rsi
	call	build_type_attribute_variant
	movq	%rax, %r15
.L1692:
	movq	96(%rsp), %rbx
	movq	168(%rsp), %rax
	movq	8(%rbx), %rcx
	movq	8(%rax), %rdx
	cmpq	$0, 32(%rcx)
	sete	%r11b
	cmpq	$0, 32(%rdx)
	sete	%r12b
	xorl	%r11d, %r12d
	andl	$1, %r12d
	jne	.L3818
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L136
	cmpb	$23, 16(%rcx)
	jmp	.L3523
.L3818:
	movl	$.LC15, %edi
	jmp	.L3404
.L2088:
	movq	%r15, %rdi
	jmp	.L3394
.L1718:
	testb	$32, 17(%r15)
	jne	.L1720
	testb	$32, 17(%rbx)
	je	.L3394
.L1720:
	movq	%rcx, %rdi
	jmp	.L3394
.L3239:
	cmpl	$7, %ebp
	jne	.L3400
	jmp	.L1711
.L3817:
	cmpl	$7, %r12d
	je	.L3239
	jmp	.L2088
.L1726:
	movq	8(%r15), %rbp
	movq	8(%rbx), %rbx
	movq	128(%rbp), %rdi
	movq	128(%rbx), %rsi
	call	common_type
	xorl	%ecx, %ecx
	movzbl	62(%rbp), %r12d
	movzbl	17(%rbp), %r15d
	movq	%rax, %rdi
	shrb	$5, %r12b
	movl	%r15d, %edx
	andl	$1, %r12d
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	$1, %r15d
	sall	$2, %r12d
	andl	$1, %edx
	addl	%r15d, %r15d
	orl	%r15d, %edx
	orl	%r12d, %edx
	cmpb	$20, 16(%rbp)
	je	.L3819
.L1729:
	movzbl	17(%rbx), %r9d
	leal	0(,%rcx,8), %esi
	movzbl	62(%rbx), %ecx
	orl	%edx, %esi
	movl	%r9d, %edx
	shrb	$5, %cl
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %ecx
	orl	%r9d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, 16(%rbx)
	je	.L3820
.L1730:
	leal	0(,%rcx,8), %r10d
	orl	%r10d, %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movq	%rax, %rdi
	call	build_pointer_type
.L3402:
	movq	%rax, %rdi
	jmp	.L3394
.L3820:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1730
.L3819:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1729
.L1731:
	movq	8(%r15), %rdi
	movq	8(%rbx), %rsi
	call	common_type
	cmpq	8(%r15), %rax
	movq	%rax, %rdi
	je	.L3821
.L1732:
	cmpq	8(%rbx), %rdi
	je	.L3822
.L1733:
	cmpq	$0, 24(%r15)
	cmove	%rbx, %r15
	movq	24(%r15), %rsi
	call	build_array_type
	jmp	.L3402
.L3822:
	cmpq	$0, 24(%rbx)
	je	.L1733
	jmp	.L3400
.L3821:
	cmpq	$0, 24(%r15)
	je	.L1732
	jmp	.L2088
.L1738:
	movq	8(%rbx), %rsi
	movq	8(%r15), %rdi
	call	common_type
	movq	%rax, 472(%rsp)
	movq	472(%rsp), %rsi
	movq	24(%r15), %rdx
	movq	%rdx, 224(%rsp)
	movq	24(%rbx), %rdx
	movq	%rdx, 232(%rsp)
	cmpq	8(%r15), %rsi
	je	.L3823
.L1739:
	movq	472(%rsp), %rdi
	cmpq	8(%rbx), %rdi
	je	.L3824
	cmpq	$0, 224(%rsp)
	je	.L3825
.L1741:
	cmpq	$0, 232(%rsp)
	jne	.L1742
	movq	472(%rsp), %rdi
	movq	224(%rsp), %rsi
.L3487:
	call	build_function_type
	jmp	.L3402
.L1742:
	xorl	%edi, %edi
	call	pushlevel
	movl	$1, %edi
	call	declare_parm_level
	movq	224(%rsp), %rdi
	call	list_length
	movq	$0, 248(%rsp)
	testl	%eax, %eax
	jle	.L3045
	movl	%eax, %ebx
.L1747:
	movq	248(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	call	tree_cons
	decl	%ebx
	movq	%rax, 248(%rsp)
	jne	.L1747
.L3045:
	cmpq	$0, 224(%rsp)
	movq	248(%rsp), %rbx
	movq	%rbx, 240(%rsp)
	je	.L3047
.L2087:
	movq	224(%rsp), %r8
	movq	32(%r8), %rdx
	testq	%rdx, %rdx
	jne	.L1752
	movq	232(%rsp), %rax
	movq	240(%rsp), %rbp
	movq	32(%rax), %r11
	movq	%r11, 32(%rbp)
.L1753:
.L1750:
	movq	224(%rsp), %r13
	movq	232(%rsp), %r10
	movq	240(%rsp), %rbp
	movq	(%r13), %r9
	movq	%r9, 224(%rsp)
	testq	%r9, %r9
	movq	(%r10), %rsi
	movq	%rsi, 232(%rsp)
	movq	(%rbp), %rdi
	movq	%rdi, 240(%rsp)
	jne	.L2087
.L3047:
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	call	poplevel
	movq	248(%rsp), %rsi
	movq	472(%rsp), %rdi
	call	build_function_type
	movq	%rax, %r15
	jmp	.L2088
.L1752:
	movq	232(%rsp), %r13
	movq	32(%r13), %rax
	testq	%rax, %rax
	jne	.L1754
	movq	240(%rsp), %r12
	movq	%rdx, 32(%r12)
	jmp	.L1750
.L1754:
	cmpb	$21, 16(%rdx)
	je	.L3826
.L1755:
	cmpb	$21, 16(%rax)
	je	.L3827
.L1921:
	movq	224(%rsp), %r8
	movq	232(%rsp), %rdx
	movq	32(%r8), %rdi
	movq	32(%rdx), %rsi
	call	common_type
	movq	240(%rsp), %rbx
	movq	%rax, 32(%rbx)
	jmp	.L1750
.L3827:
	movq	224(%rsp), %r9
	movq	32(%r9), %rcx
	cmpq	%rcx, %rax
	je	.L1921
	movq	24(%rax), %rbx
	testq	%rbx, %rbx
	movq	%rbx, 200(%rsp)
	je	.L1921
.L2086:
	movq	200(%rsp), %r10
	movq	%rcx, %rbp
	movq	8(%r10), %rbx
	cmpq	%rcx, %rbx
	je	.L3392
	testq	%rbx, %rbx
	je	.L3392
	testq	%rcx, %rcx
	je	.L3392
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L3392
	movzbl	16(%rcx), %eax
	testb	%al, %al
	je	.L3392
	cmpb	$6, %dl
	je	.L3828
.L1930:
	cmpb	$6, %al
	je	.L3829
.L1931:
	cmpb	$10, %dl
	je	.L3830
.L1932:
	cmpb	$10, 16(%rbp)
	je	.L3831
.L1933:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L1929
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L1935
	xorl	%r15d, %r15d
.L1929:
	testl	%r15d, %r15d
	jne	.L3832
.L1924:
	movq	200(%rsp), %rcx
	movq	(%rcx), %r11
	testq	%r11, %r11
	movq	%r11, 200(%rsp)
	je	.L1921
	movq	224(%rsp), %rax
	movq	32(%rax), %rcx
	jmp	.L2086
.L3832:
	movq	224(%rsp), %rax
	movq	240(%rsp), %r13
	movq	32(%rax), %r12
	movq	%r12, 32(%r13)
.L3496:
	movl	pedantic(%rip), %r15d
	testl	%r15d, %r15d
	je	.L1750
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L1750
.L1935:
	movzbl	17(%rbx), %r13d
	movzbl	62(%rbx), %ecx
	movl	%r13d, %edx
	shrb	$5, %cl
	shrb	$3, %r13b
	shrb	$4, %dl
	andl	$1, %r13d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r13d, %r13d
	sall	$2, %ecx
	orl	%r13d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L3833
.L1937:
	movzbl	17(%rbp), %r8d
	movzbl	62(%rbp), %r12d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r12b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r12d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r12d
	orl	%r8d, %edx
	orl	%r12d, %edx
	cmpb	$20, %sil
	je	.L3834
.L1938:
	leal	0(,%rcx,8), %r15d
	orl	%r15d, %edx
	xorl	%r15d, %r15d
	cmpl	%edx, %edi
	jne	.L1929
	movq	128(%rbp), %rsi
	cmpq	%rsi, 128(%rbx)
	je	.L3392
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%r15d, %r15d
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 464(%rsp)
	je	.L1929
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L2064
	cmpl	$18, %eax
	ja	.L2081
	cmpl	$13, %eax
	je	.L1942
.L1941:
	cmpl	$2, 464(%rsp)
	jne	.L1929
	cmpl	$1, %r15d
	cmove	464(%rsp), %r15d
	jmp	.L1929
.L1942:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L1943
	call	comptypes
	movl	%eax, %r15d
	jmp	.L1941
.L1943:
	movl	$1, %r15d
	jmp	.L1941
.L2081:
	cmpl	$20, %eax
	je	.L2077
	cmpl	$23, %eax
	jne	.L1941
	movl	$1, 196(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L1946
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 196(%rsp)
	je	.L1941
.L1946:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3835
	testq	%r12, %r12
	je	.L3836
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L2061:
	testq	%r13, %r13
	je	.L3837
	testq	%r12, %r12
	je	.L2050
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3838
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L2036
.L3495:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2050
.L2035:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L2061
.L2050:
	xorl	%r15d, %r15d
.L2030:
	cmpl	$1, %r15d
	cmove	196(%rsp), %r15d
	jmp	.L1941
.L2036:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L2035
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3840
.L2040:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L2050
	cmpq	$0, 96(%rax)
	je	.L2051
	testb	$8, 62(%rax)
	je	.L2050
.L2051:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2050
	movq	32(%r13), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2050
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L2050
.L2057:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2053
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2057
	jmp	.L2050
.L2053:
	testq	%rbx, %rbx
	jne	.L2035
	jmp	.L2050
.L3840:
	cmpq	$0, 96(%rax)
	je	.L2041
	testb	$8, 62(%rax)
	je	.L2040
.L2041:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2040
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2040
	movq	32(%r13), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L2050
.L2047:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2053
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2047
	jmp	.L2050
.L3838:
	movq	32(%r12), %rdi
	jmp	.L3495
.L3837:
	testq	%r12, %r12
	je	.L2030
	jmp	.L2050
.L3836:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1941
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3137
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L2025:
	testq	%r13, %r13
	je	.L3841
	testq	%rbp, %rbp
	je	.L2014
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3842
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L2000
.L3493:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L2014
.L1999:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L2025
.L2014:
	xorl	%r12d, %r12d
.L1994:
	movl	$2, %r15d
	decl	%r12d
.L3494:
	jne	.L1941
.L3137:
	movl	196(%rsp), %r15d
	jmp	.L1941
.L2000:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1999
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3844
.L2004:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L2014
	cmpq	$0, 96(%rax)
	je	.L2015
	testb	$8, 62(%rax)
	je	.L2014
.L2015:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2014
	movq	32(%r13), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2014
	movq	32(%rbp), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L2014
.L2021:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2017
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2021
	jmp	.L2014
.L2017:
	testq	%rbx, %rbx
	jne	.L1999
	jmp	.L2014
.L3844:
	cmpq	$0, 96(%rax)
	je	.L2005
	testb	$8, 62(%rax)
	je	.L2004
.L2005:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L2004
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2004
	movq	32(%r13), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L2014
.L2011:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L2017
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2011
	jmp	.L2014
.L3842:
	movq	32(%rbp), %rdi
	jmp	.L3493
.L3841:
	testq	%rbp, %rbp
	je	.L1994
	jmp	.L2014
.L3835:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1941
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3137
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L1986:
	testq	%r12, %r12
	je	.L3845
	testq	%rbp, %rbp
	je	.L1975
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3846
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1961
.L3492:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1975
.L1960:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L1986
.L1975:
	xorl	%r13d, %r13d
.L1955:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3494
.L1961:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1960
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3848
.L1965:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1975
	cmpq	$0, 96(%rax)
	je	.L1976
	testb	$8, 62(%rax)
	je	.L1975
.L1976:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1975
	movq	32(%r12), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1975
	movq	32(%rbp), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L1975
.L1982:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1978
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1982
	jmp	.L1975
.L1978:
	testq	%rbx, %rbx
	jne	.L1960
	jmp	.L1975
.L3848:
	cmpq	$0, 96(%rax)
	je	.L1966
	testb	$8, 62(%rax)
	je	.L1965
.L1966:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1965
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1965
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L1975
.L1972:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1978
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1972
	jmp	.L1975
.L3846:
	movq	32(%rbp), %rdi
	jmp	.L3492
.L3845:
	testq	%rbp, %rbp
	je	.L1955
	jmp	.L1975
.L2077:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L1941
.L2064:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L2065
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L1924
.L2065:
	testq	%r12, %r12
	je	.L1941
	testq	%r13, %r13
	je	.L1941
	cmpq	%r13, %r12
	je	.L1941
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L2068
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3849
.L2069:
	movl	$1, %r8d
.L2068:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L2070
	movq	104(%r13), %r10
	cmpb	$25, 16(%r10)
	je	.L3850
.L2071:
	movl	$1, %ecx
.L2070:
	testb	%r8b, %r8b
	jne	.L1941
	testb	%cl, %cl
	jne	.L1941
	testb	%dil, %dil
	je	.L3259
	testb	%dl, %dl
.L3391:
	jne	.L1941
.L2076:
	xorl	%r15d, %r15d
	jmp	.L1941
.L3259:
	testb	%dl, %dl
	jne	.L2076
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L2076
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3391
.L3850:
	cmpb	$25, 16(%rsi)
	jne	.L2071
	jmp	.L2070
.L3849:
	cmpb	$25, 16(%rcx)
	jne	.L2069
	jmp	.L2068
.L3392:
	movl	$1, %r15d
	jmp	.L1929
.L3834:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1938
.L3833:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1937
.L3831:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L1933
.L3830:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L1932
.L3829:
	testb	$2, 62(%rcx)
	je	.L1931
	movq	24(%rcx), %r11
	testq	%r11, %r11
	cmovne	%r11, %rbp
	jmp	.L1931
.L3828:
	testb	$2, 62(%rbx)
	je	.L1930
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1930
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L1930
.L3826:
	cmpq	%rax, %rdx
	je	.L1755
	movq	24(%rdx), %r15
	testq	%r15, %r15
	movq	%r15, 216(%rsp)
	je	.L1755
.L1920:
	movq	216(%rsp), %rcx
	movq	%rax, %rbp
	movq	8(%rcx), %rbx
	cmpq	%rax, %rbx
	je	.L1762
	testq	%rbx, %rbx
	je	.L1762
	testq	%rax, %rax
	je	.L1762
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L1762
	movzbl	16(%rax), %ecx
	testb	%cl, %cl
	jne	.L1761
.L1762:
	movl	$1, %r15d
.L1763:
	testl	%r15d, %r15d
	jne	.L3851
.L1758:
	movq	216(%rsp), %rdi
	movq	(%rdi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 216(%rsp)
	jne	.L1920
	jmp	.L1755
.L3851:
	movq	240(%rsp), %r15
	movq	%rax, 32(%r15)
	jmp	.L3496
.L1761:
	cmpb	$6, %dl
	je	.L3852
.L1764:
	cmpb	$6, %cl
	je	.L3853
.L1765:
	cmpb	$10, %dl
	je	.L3854
.L1766:
	cmpb	$10, 16(%rbp)
	je	.L3855
.L1767:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L3390
	movzbl	16(%rbx), %edi
	cmpb	16(%rbp), %dil
	je	.L1769
	xorl	%r15d, %r15d
.L3389:
	movq	232(%rsp), %r13
	movq	32(%r13), %rax
	jmp	.L1763
.L1769:
	movzbl	17(%rbx), %esi
	movzbl	62(%rbx), %r10d
	xorl	%ecx, %ecx
	movl	%esi, %edx
	shrb	$5, %r10b
	shrb	$3, %sil
	shrb	$4, %dl
	andl	$1, %esi
	andl	$1, %r10d
	andl	$1, %edx
	addl	%esi, %esi
	sall	$2, %r10d
	orl	%esi, %edx
	orl	%r10d, %edx
	cmpb	$20, %dil
	je	.L3856
.L1771:
	movzbl	17(%rbp), %r11d
	movzbl	62(%rbp), %r8d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r11d, %edx
	shrb	$5, %r8b
	shrb	$3, %r11b
	shrb	$4, %dl
	andl	$1, %r11d
	andl	$1, %r8d
	andl	$1, %edx
	addl	%r11d, %r11d
	sall	$2, %r8d
	orl	%r11d, %edx
	orl	%r8d, %edx
	cmpb	$20, %dil
	je	.L3857
.L1772:
	leal	0(,%rcx,8), %edi
	orl	%edi, %edx
	cmpl	%edx, %esi
	je	.L1770
	xorl	%r15d, %r15d
.L3328:
	movq	232(%rsp), %r12
	movq	32(%r12), %rax
	jmp	.L1763
.L1770:
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L3858
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 468(%rsp)
	jne	.L1774
	xorl	%r15d, %r15d
.L3390:
	movq	232(%rsp), %rbp
	movq	32(%rbp), %rax
	jmp	.L1763
.L1774:
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L1898
	cmpl	$18, %eax
	ja	.L1915
	cmpl	$13, %eax
	je	.L1776
.L1775:
	cmpl	$2, 468(%rsp)
	jne	.L3328
	cmpl	$1, %r15d
	je	.L3859
	movq	232(%rsp), %r8
	movq	32(%r8), %rax
	jmp	.L1763
.L3859:
	movl	$2, %r15d
	jmp	.L3389
.L1776:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L1777
	call	comptypes
	movl	%eax, %r15d
	jmp	.L1775
.L1777:
	movl	$1, %r15d
	jmp	.L1775
.L1915:
	cmpl	$20, %eax
	je	.L1911
	cmpl	$23, %eax
	jne	.L1775
	movl	$1, 212(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L1780
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 212(%rsp)
	je	.L1775
.L1780:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3860
	testq	%r12, %r12
	je	.L3861
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L1895:
	testq	%r13, %r13
	je	.L3862
	testq	%r12, %r12
	je	.L1884
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3863
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L1870
.L3491:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1884
.L1869:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L1895
.L1884:
	xorl	%r15d, %r15d
.L1864:
	cmpl	$1, %r15d
	cmove	212(%rsp), %r15d
	jmp	.L1775
.L1870:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L1869
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3865
.L1874:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L1884
	cmpq	$0, 96(%rax)
	je	.L1885
	testb	$8, 62(%rax)
	je	.L1884
.L1885:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1884
	movq	32(%r13), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1884
	movq	32(%r12), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L1884
.L1891:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1887
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1891
	jmp	.L1884
.L1887:
	testq	%rbx, %rbx
	jne	.L1869
	jmp	.L1884
.L3865:
	cmpq	$0, 96(%rax)
	je	.L1875
	testb	$8, 62(%rax)
	je	.L1874
.L1875:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1874
	movq	32(%r12), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1874
	movq	32(%r13), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L1884
.L1881:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1887
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1881
	jmp	.L1884
.L3863:
	movq	32(%r12), %rdi
	jmp	.L3491
.L3862:
	testq	%r12, %r12
	je	.L1864
	jmp	.L1884
.L3861:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1775
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3133
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L1859:
	testq	%r13, %r13
	je	.L3866
	testq	%rbp, %rbp
	je	.L1848
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3867
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1834
.L3489:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1848
.L1833:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L1859
.L1848:
	xorl	%r12d, %r12d
.L1828:
	movl	$2, %r15d
	decl	%r12d
.L3490:
	jne	.L1775
.L3133:
	movl	212(%rsp), %r15d
	jmp	.L1775
.L1834:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1833
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3869
.L1838:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1848
	cmpq	$0, 96(%rax)
	je	.L1849
	testb	$8, 62(%rax)
	je	.L1848
.L1849:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1848
	movq	32(%r13), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1848
	movq	32(%rbp), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L1848
.L1855:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1851
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1855
	jmp	.L1848
.L1851:
	testq	%rbx, %rbx
	jne	.L1833
	jmp	.L1848
.L3869:
	cmpq	$0, 96(%rax)
	je	.L1839
	testb	$8, 62(%rax)
	je	.L1838
.L1839:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1838
	movq	32(%rbp), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1838
	movq	32(%r13), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L1848
.L1845:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1851
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1845
	jmp	.L1848
.L3867:
	movq	32(%rbp), %rdi
	jmp	.L3489
.L3866:
	testq	%rbp, %rbp
	je	.L1828
	jmp	.L1848
.L3860:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1775
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3133
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L1820:
	testq	%r12, %r12
	je	.L3870
	testq	%rbp, %rbp
	je	.L1809
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3871
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1795
.L3488:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1809
.L1794:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L1820
.L1809:
	xorl	%r13d, %r13d
.L1789:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3490
.L1795:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1794
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3873
.L1799:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1809
	cmpq	$0, 96(%rax)
	je	.L1810
	testb	$8, 62(%rax)
	je	.L1809
.L1810:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1809
	movq	32(%r12), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1809
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L1809
.L1816:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1812
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1816
	jmp	.L1809
.L1812:
	testq	%rbx, %rbx
	jne	.L1794
	jmp	.L1809
.L3873:
	cmpq	$0, 96(%rax)
	je	.L1800
	testb	$8, 62(%rax)
	je	.L1799
.L1800:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1799
	movq	32(%rbp), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1799
	movq	32(%r12), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L1809
.L1806:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1812
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1806
	jmp	.L1809
.L3871:
	movq	32(%rbp), %rdi
	jmp	.L3488
.L3870:
	testq	%rbp, %rbp
	je	.L1789
	jmp	.L1809
.L1911:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L1775
.L1898:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L1899
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L3327
.L1899:
	testq	%r12, %r12
	je	.L1775
	testq	%r13, %r13
	je	.L1775
	cmpq	%r13, %r12
	je	.L1775
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L1902
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3874
.L1903:
	movl	$1, %r8d
.L1902:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L1904
	movq	104(%r13), %r11
	cmpb	$25, 16(%r11)
	je	.L3875
.L1905:
	movl	$1, %ecx
.L1904:
	testb	%r8b, %r8b
	jne	.L1775
	testb	%cl, %cl
	jne	.L1775
	testb	%dil, %dil
	je	.L3249
	testb	%dl, %dl
.L3388:
	jne	.L1775
.L1910:
	xorl	%r15d, %r15d
	jmp	.L1775
.L3249:
	testb	%dl, %dl
	jne	.L1910
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1910
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3388
.L3875:
	cmpb	$25, 16(%rsi)
	jne	.L1905
	jmp	.L1904
.L3874:
	cmpb	$25, 16(%rcx)
	jne	.L1903
	jmp	.L1902
.L3327:
	movq	232(%rsp), %rsi
	movq	32(%rsi), %rax
	jmp	.L1758
.L3858:
	movq	232(%rsp), %rbx
	movl	$1, %r15d
	movq	32(%rbx), %rax
	jmp	.L1763
.L3857:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1772
.L3856:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1771
.L3855:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L1767
.L3854:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L1766
.L3853:
	testb	$2, 62(%rax)
	je	.L1765
	movq	24(%rax), %r9
	testq	%r9, %r9
	cmovne	%r9, %rbp
	jmp	.L1765
.L3852:
	testb	$2, 62(%rbx)
	je	.L1764
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1764
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L1764
.L3825:
	movq	472(%rsp), %rdi
	movq	24(%rbx), %rsi
	jmp	.L3487
.L3824:
	cmpq	$0, 224(%rsp)
	jne	.L1741
	jmp	.L3400
.L3823:
	testq	%rdx, %rdx
	jne	.L1739
	jmp	.L2088
.L3306:
	movq	%r15, %rdi
.L1700:
	cmpl	$8, %r12d
	movq	%rbx, %rsi
	je	.L3876
.L1702:
	call	common_type
	cmpl	$8, %ebp
	movq	%rax, %rdi
	je	.L3877
.L1703:
	cmpl	$8, %r12d
	je	.L3878
.L1705:
	call	build_complex_type
	jmp	.L3402
.L3878:
	cmpq	%rdi, 8(%rbx)
	jne	.L1705
	jmp	.L3400
.L3877:
	cmpq	%rax, 8(%r15)
	jne	.L1703
	jmp	.L2088
.L3876:
	movq	8(%rbx), %rsi
	jmp	.L1702
.L3238:
	movq	8(%r15), %rdi
	jmp	.L1700
.L3815:
	movzwl	60(%r8), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L1696
.L3814:
	movzwl	60(%r15), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %r15
	jmp	.L1695
.L3813:
	movq	%rbx, %r15
	jmp	.L1692
.L3812:
	movq	96(%rsp), %r11
	movq	168(%rsp), %r8
	movq	8(%r11), %rcx
	movq	8(%r8), %r15
	movq	128(%rcx), %rbx
	movq	128(%r15), %rbp
	cmpq	%rbp, %rbx
	je	.L3387
	testq	%rbx, %rbx
	je	.L3387
	testq	%rbp, %rbp
	je	.L3387
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L3387
	movzbl	16(%rbp), %eax
	testb	%al, %al
	je	.L3387
	cmpb	$6, %dl
	je	.L3879
.L1535:
	cmpb	$6, %al
	je	.L3880
.L1536:
	cmpb	$10, %dl
	je	.L3881
.L1537:
	cmpb	$10, 16(%rbp)
	je	.L3882
.L1538:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L1534
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L1540
	xorl	%r15d, %r15d
.L1534:
	cmpl	$2, %r15d
	je	.L3883
.L1690:
	movl	%r15d, %eax
	jmp	.L1531
.L3883:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L1690
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L1690
.L1540:
	movzbl	17(%rbx), %r13d
	movzbl	62(%rbx), %r12d
	xorl	%ecx, %ecx
	movl	%r13d, %edx
	shrb	$5, %r12b
	shrb	$3, %r13b
	shrb	$4, %dl
	andl	$1, %r13d
	andl	$1, %r12d
	andl	$1, %edx
	addl	%r13d, %r13d
	sall	$2, %r12d
	orl	%r13d, %edx
	orl	%r12d, %edx
	cmpb	$20, %sil
	je	.L3884
.L1542:
	movzbl	17(%rbp), %r15d
	movzbl	62(%rbp), %r10d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	shrb	$5, %r10b
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	$1, %r15d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r15d, %r15d
	sall	$2, %r10d
	orl	%r15d, %edx
	orl	%r10d, %edx
	cmpb	$20, %sil
	je	.L3885
.L1543:
	leal	0(,%rcx,8), %esi
	xorl	%r15d, %r15d
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L1534
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L3387
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%r15d, %r15d
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 492(%rsp)
	je	.L1534
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L1669
	cmpl	$18, %eax
	ja	.L1686
	cmpl	$13, %eax
	je	.L1547
.L1546:
	cmpl	$2, 492(%rsp)
	jne	.L1534
	cmpl	$1, %r15d
	cmove	492(%rsp), %r15d
	jmp	.L1534
.L1547:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L1548
	call	comptypes
	movl	%eax, %r15d
	jmp	.L1546
.L1548:
	movl	$1, %r15d
	jmp	.L1546
.L1686:
	cmpl	$20, %eax
	je	.L1682
	cmpl	$23, %eax
	jne	.L1546
	movl	$1, 256(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L1551
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 256(%rsp)
	je	.L1546
.L1551:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3886
	testq	%r12, %r12
	je	.L3887
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L1666:
	testq	%r13, %r13
	je	.L3888
	testq	%r12, %r12
	je	.L1655
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3889
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L1641
.L3486:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1655
.L1640:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L1666
.L1655:
	xorl	%r15d, %r15d
.L1635:
	cmpl	$1, %r15d
	cmove	256(%rsp), %r15d
	jmp	.L1546
.L1641:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L1640
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3891
.L1645:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L1655
	cmpq	$0, 96(%rax)
	je	.L1656
	testb	$8, 62(%rax)
	je	.L1655
.L1656:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1655
	movq	32(%r13), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1655
	movq	32(%r12), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L1655
.L1662:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1658
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1662
	jmp	.L1655
.L1658:
	testq	%rbx, %rbx
	jne	.L1640
	jmp	.L1655
.L3891:
	cmpq	$0, 96(%rax)
	je	.L1646
	testb	$8, 62(%rax)
	je	.L1645
.L1646:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1645
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1645
	movq	32(%r13), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L1655
.L1652:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1658
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1652
	jmp	.L1655
.L3889:
	movq	32(%r12), %rdi
	jmp	.L3486
.L3888:
	testq	%r12, %r12
	je	.L1635
	jmp	.L1655
.L3887:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1546
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3129
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L1630:
	testq	%r13, %r13
	je	.L3892
	testq	%rbp, %rbp
	je	.L1619
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3893
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1605
.L3484:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1619
.L1604:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L1630
.L1619:
	xorl	%r12d, %r12d
.L1599:
	movl	$2, %r15d
	decl	%r12d
.L3485:
	jne	.L1546
.L3129:
	movl	256(%rsp), %r15d
	jmp	.L1546
.L1605:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1604
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3895
.L1609:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1619
	cmpq	$0, 96(%rax)
	je	.L1620
	testb	$8, 62(%rax)
	je	.L1619
.L1620:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1619
	movq	32(%r13), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1619
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L1619
.L1626:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1622
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1626
	jmp	.L1619
.L1622:
	testq	%rbx, %rbx
	jne	.L1604
	jmp	.L1619
.L3895:
	cmpq	$0, 96(%rax)
	je	.L1610
	testb	$8, 62(%rax)
	je	.L1609
.L1610:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1609
	movq	32(%rbp), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1609
	movq	32(%r13), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L1619
.L1616:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1622
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1616
	jmp	.L1619
.L3893:
	movq	32(%rbp), %rdi
	jmp	.L3484
.L3892:
	testq	%rbp, %rbp
	je	.L1599
	jmp	.L1619
.L3886:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L1546
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3129
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L1591:
	testq	%r12, %r12
	je	.L3896
	testq	%rbp, %rbp
	je	.L1580
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3897
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L1566
.L3483:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L1580
.L1565:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L1591
.L1580:
	xorl	%r13d, %r13d
.L1560:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3485
.L1566:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L1565
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3899
.L1570:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L1580
	cmpq	$0, 96(%rax)
	je	.L1581
	testb	$8, 62(%rax)
	je	.L1580
.L1581:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1580
	movq	32(%r12), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1580
	movq	32(%rbp), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L1580
.L1587:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1583
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1587
	jmp	.L1580
.L1583:
	testq	%rbx, %rbx
	jne	.L1565
	jmp	.L1580
.L3899:
	cmpq	$0, 96(%rax)
	je	.L1571
	testb	$8, 62(%rax)
	je	.L1570
.L1571:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L1570
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1570
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L1580
.L1577:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L1583
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1577
	jmp	.L1580
.L3897:
	movq	32(%rbp), %rdi
	jmp	.L3483
.L3896:
	testq	%rbp, %rbp
	je	.L1560
	jmp	.L1580
.L1682:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L1546
.L1669:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L1670
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L1534
.L1670:
	testq	%r12, %r12
	je	.L1546
	testq	%r13, %r13
	je	.L1546
	cmpq	%r13, %r12
	je	.L1546
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L1673
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3900
.L1674:
	movl	$1, %r8d
.L1673:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L1675
	movq	104(%r13), %r11
	cmpb	$25, 16(%r11)
	je	.L3901
.L1676:
	movl	$1, %ecx
.L1675:
	testb	%r8b, %r8b
	jne	.L1546
	testb	%cl, %cl
	jne	.L1546
	testb	%dil, %dil
	je	.L3237
	testb	%dl, %dl
.L3386:
	jne	.L1546
.L1681:
	xorl	%r15d, %r15d
	jmp	.L1546
.L3237:
	testb	%dl, %dl
	jne	.L1681
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L1681
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3386
.L3901:
	cmpb	$25, 16(%rsi)
	jne	.L1676
	jmp	.L1675
.L3900:
	cmpb	$25, 16(%rcx)
	jne	.L1674
	jmp	.L1673
.L3387:
	movl	$1, %r15d
	jmp	.L1534
.L3885:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1543
.L3884:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L1542
.L3882:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L1538
.L3881:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L1537
.L3880:
	testb	$2, 62(%rbp)
	je	.L1536
	movq	24(%rbp), %r9
	testq	%r9, %r9
	cmovne	%r9, %rbp
	jmp	.L1536
.L3879:
	testb	$2, 62(%rbx)
	je	.L1535
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L1535
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L1535
	.p2align 6,,7
.L367:
	movl	warn_float_equal(%rip), %edi
	testl	%edi, %edi
	je	.L368
	cmpl	$7, 588(%rsp)
	je	.L369
	cmpl	$7, 584(%rsp)
	je	.L369
.L368:
	movl	588(%rsp), %eax
	movq	integer_types+40(%rip), %r12
	subl	$6, %eax
	movq	%r12, (%rsp)
	cmpl	$2, %eax
	ja	.L370
	movl	584(%rsp), %eax
	subl	$6, %eax
	cmpl	$2, %eax
	jbe	.L3405
.L370:
	cmpl	$13, 588(%rsp)
	je	.L3902
.L945:
	cmpl	$13, 584(%rsp)
	jne	.L2099
	movq	8(%rsp), %rsi
	cmpb	$25, 16(%rsi)
	jne	.L2099
	movq	%rsi, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L2099
	movq	168(%rsp), %r15
	jmp	.L136
	.p2align 6,,7
.L3902:
	cmpl	$13, 584(%rsp)
	je	.L3903
	cmpb	$25, 16(%r14)
	jne	.L945
	movq	%r14, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L945
	movq	96(%rsp), %r15
	jmp	.L136
.L3903:
	movq	96(%rsp), %r8
	movq	168(%rsp), %r10
	movl	$1, %edx
	movq	96(%rsp), %rdi
	movq	168(%rsp), %rsi
	movq	8(%r8), %rax
	movq	%rax, 568(%rsp)
	movq	8(%r10), %r9
	movq	%r9, 560(%rsp)
	call	maybe_objc_comptypes
	testl	%eax, %eax
	js	.L3904
.L375:
	testl	%eax, %eax
	je	.L373
	movq	96(%rsp), %r15
	movq	168(%rsp), %rbx
	cmpq	%rbx, %r15
	je	.L934
	movq	global_trees(%rip), %rax
	cmpq	%rax, %r15
	je	.L3905
	cmpq	%rax, 168(%rsp)
	je	.L934
	movq	%r15, %rdi
	movq	168(%rsp), %rsi
	call	*targetm+248(%rip)
	movq	%rax, 544(%rsp)
	cmpb	$10, 16(%r15)
	je	.L3906
.L539:
	movq	168(%rsp), %rcx
	cmpb	$10, 16(%rcx)
	je	.L3907
.L540:
	movzbl	16(%r15), %ebp
	movzbl	16(%rbx), %r12d
	cmpl	$8, %ebp
	je	.L3174
	cmpl	$8, %r12d
	je	.L3304
	leal	-6(%rbp), %eax
	cmpl	$17, %eax
	ja	.L932
	mov	%eax, %edi
	jmp	*.L933(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L933:
	.quad	.L553
	.quad	.L553
	.quad	.L932
	.quad	.L932
	.quad	.L932
	.quad	.L932
	.quad	.L932
	.quad	.L570
	.quad	.L932
	.quad	.L932
	.quad	.L932
	.quad	.L932
	.quad	.L575
	.quad	.L932
	.quad	.L932
	.quad	.L932
	.quad	.L932
	.quad	.L582
	.text
.L553:
	cmpl	$7, %ebp
	je	.L3909
	cmpl	$7, %r12d
	je	.L3175
.L555:
	movzwl	60(%r15), %edx
	movzwl	60(%rbx), %eax
	andl	$511, %edx
	andl	$511, %eax
	cmpl	%eax, %edx
	jg	.L932
	cmpl	%edx, %eax
	jg	.L3465
	movq	128(%r15), %rdx
	movq	integer_types+64(%rip), %rcx
	cmpq	%rcx, %rdx
	je	.L564
	movq	128(%rbx), %rax
	cmpq	%rcx, %rax
	je	.L564
	movq	integer_types+56(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L562
	cmpq	%rdi, %rax
	je	.L562
	movq	global_trees+208(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L3365
	cmpq	%rdi, %rax
	je	.L3365
	testb	$32, 17(%r15)
	jne	.L932
.L3465:
	movq	%rbx, %rdi
.L3365:
	movq	544(%rsp), %rsi
	call	build_type_attribute_variant
	movq	%rax, %r15
.L934:
	testq	%r15, %r15
	jne	.L136
	movq	global_trees+224(%rip), %r15
	jmp	.L136
.L932:
	movq	%r15, %rdi
	jmp	.L3365
.L562:
	testb	$32, 17(%r15)
	jne	.L564
	testb	$32, 17(%rbx)
	je	.L3365
.L564:
	movq	%rcx, %rdi
	jmp	.L3365
.L3175:
	cmpl	$7, %ebp
	jne	.L3465
	jmp	.L555
.L3909:
	cmpl	$7, %r12d
	je	.L3175
	jmp	.L932
.L570:
	movq	8(%r15), %rbp
	movq	8(%rbx), %rbx
	movq	128(%rbp), %rdi
	movq	128(%rbx), %rsi
	call	common_type
	xorl	%ecx, %ecx
	movzbl	62(%rbp), %r15d
	movzbl	17(%rbp), %r10d
	movq	%rax, %rdi
	shrb	$5, %r15b
	movl	%r10d, %edx
	andl	$1, %r15d
	shrb	$3, %r10b
	shrb	$4, %dl
	andl	$1, %r10d
	sall	$2, %r15d
	andl	$1, %edx
	addl	%r10d, %r10d
	orl	%r10d, %edx
	orl	%r15d, %edx
	cmpb	$20, 16(%rbp)
	je	.L3910
.L573:
	movzbl	17(%rbx), %r12d
	movzbl	62(%rbx), %r13d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r12d, %edx
	shrb	$5, %r13b
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	andl	$1, %r13d
	andl	$1, %edx
	addl	%r12d, %r12d
	sall	$2, %r13d
	orl	%r12d, %edx
	orl	%r13d, %edx
	cmpb	$20, 16(%rbx)
	je	.L3911
.L574:
	leal	0(,%rcx,8), %r8d
	orl	%r8d, %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movq	%rax, %rdi
	call	build_pointer_type
.L3467:
	movq	%rax, %rdi
	jmp	.L3365
.L3911:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L574
.L3910:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L573
.L575:
	movq	8(%r15), %rdi
	movq	8(%rbx), %rsi
	call	common_type
	cmpq	8(%r15), %rax
	movq	%rax, %rdi
	je	.L3912
.L576:
	cmpq	8(%rbx), %rdi
	je	.L3913
.L577:
	cmpq	$0, 24(%r15)
	cmove	%rbx, %r15
	movq	24(%r15), %rsi
	call	build_array_type
	jmp	.L3467
.L3913:
	cmpq	$0, 24(%rbx)
	je	.L577
	jmp	.L3465
.L3912:
	cmpq	$0, 24(%r15)
	je	.L576
	jmp	.L932
.L582:
	movq	8(%r15), %rdi
	movq	8(%rbx), %rsi
	call	common_type
	movq	%rax, 536(%rsp)
	movq	24(%r15), %rdx
	movq	%rdx, 352(%rsp)
	movq	24(%rbx), %r8
	movq	%r8, 360(%rsp)
	cmpq	8(%r15), %rax
	je	.L3914
.L583:
	movq	536(%rsp), %rsi
	cmpq	8(%rbx), %rsi
	je	.L3915
	cmpq	$0, 352(%rsp)
	je	.L3916
.L585:
	cmpq	$0, 360(%rsp)
	jne	.L586
	movq	536(%rsp), %rdi
	movq	352(%rsp), %rsi
.L3522:
	call	build_function_type
	jmp	.L3467
.L586:
	xorl	%edi, %edi
	call	pushlevel
	movl	$1, %edi
	call	declare_parm_level
	movq	352(%rsp), %rdi
	call	list_length
	movq	$0, 376(%rsp)
	testl	%eax, %eax
	jle	.L2997
	movl	%eax, %ebx
.L591:
	movq	376(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	call	tree_cons
	decl	%ebx
	movq	%rax, 376(%rsp)
	jne	.L591
.L2997:
	cmpq	$0, 352(%rsp)
	movq	376(%rsp), %rbx
	movq	%rbx, 368(%rsp)
	je	.L2999
.L931:
	movq	352(%rsp), %r11
	movq	32(%r11), %rdx
	testq	%rdx, %rdx
	jne	.L596
	movq	360(%rsp), %rax
	movq	368(%rsp), %rbp
	movq	32(%rax), %r9
	movq	%r9, 32(%rbp)
.L597:
.L594:
	movq	352(%rsp), %r13
	movq	360(%rsp), %r10
	movq	368(%rsp), %rbp
	movq	(%r13), %rdi
	movq	%rdi, 352(%rsp)
	testq	%rdi, %rdi
	movq	(%r10), %rsi
	movq	%rsi, 360(%rsp)
	movq	(%rbp), %rbx
	movq	%rbx, 368(%rsp)
	jne	.L931
.L2999:
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	call	poplevel
	movq	376(%rsp), %rsi
	movq	536(%rsp), %rdi
	call	build_function_type
	movq	%rax, %r15
	jmp	.L932
.L596:
	movq	360(%rsp), %rcx
	movq	32(%rcx), %rax
	testq	%rax, %rax
	jne	.L598
	movq	368(%rsp), %rdi
	movq	%rdx, 32(%rdi)
	jmp	.L594
.L598:
	cmpb	$21, 16(%rdx)
	je	.L3917
.L599:
	cmpb	$21, 16(%rax)
	je	.L3918
.L765:
	movq	352(%rsp), %rdx
	movq	360(%rsp), %r9
	movq	32(%rdx), %rdi
	movq	32(%r9), %rsi
	call	common_type
	movq	368(%rsp), %rcx
	movq	%rax, 32(%rcx)
	jmp	.L594
.L3918:
	movq	352(%rsp), %rbx
	movq	32(%rbx), %rcx
	cmpq	%rcx, %rax
	je	.L765
	movq	24(%rax), %r10
	testq	%r10, %r10
	movq	%r10, 328(%rsp)
	je	.L765
.L930:
	movq	328(%rsp), %r8
	movq	%rcx, %rbp
	movq	8(%r8), %rbx
	cmpq	%rcx, %rbx
	je	.L3362
	testq	%rbx, %rbx
	je	.L3362
	testq	%rcx, %rcx
	je	.L3362
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L3362
	movzbl	16(%rcx), %eax
	testb	%al, %al
	je	.L3362
	cmpb	$6, %dl
	je	.L3919
.L774:
	cmpb	$6, %al
	je	.L3920
.L775:
	cmpb	$10, %dl
	je	.L3921
.L776:
	cmpb	$10, 16(%rbp)
	je	.L3922
.L777:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L773
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L779
	xorl	%r15d, %r15d
.L773:
	testl	%r15d, %r15d
	jne	.L3923
.L768:
	movq	328(%rsp), %r11
	movq	(%r11), %r8
	testq	%r8, %r8
	movq	%r8, 328(%rsp)
	je	.L765
	movq	352(%rsp), %rax
	movq	32(%rax), %rcx
	jmp	.L930
.L3923:
	movq	352(%rsp), %rax
	movq	368(%rsp), %r13
	movq	32(%rax), %r12
	movq	%r12, 32(%r13)
.L3459:
	movl	pedantic(%rip), %r15d
	testl	%r15d, %r15d
	je	.L594
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L594
.L779:
	movzbl	17(%rbx), %r13d
	movzbl	62(%rbx), %ecx
	movl	%r13d, %edx
	shrb	$5, %cl
	shrb	$3, %r13b
	shrb	$4, %dl
	andl	$1, %r13d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r13d, %r13d
	sall	$2, %ecx
	orl	%r13d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L3924
.L781:
	movzbl	17(%rbp), %r9d
	movzbl	62(%rbp), %r12d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %r12b
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %r12d
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %r12d
	orl	%r9d, %edx
	orl	%r12d, %edx
	cmpb	$20, %sil
	je	.L3925
.L782:
	leal	0(,%rcx,8), %r15d
	orl	%r15d, %edx
	xorl	%r15d, %r15d
	cmpl	%edx, %edi
	jne	.L773
	movq	128(%rbp), %rdi
	cmpq	%rdi, 128(%rbx)
	je	.L3362
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%r15d, %r15d
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 528(%rsp)
	je	.L773
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L908
	cmpl	$18, %eax
	ja	.L925
	cmpl	$13, %eax
	je	.L786
.L785:
	cmpl	$2, 528(%rsp)
	jne	.L773
	cmpl	$1, %r15d
	cmove	528(%rsp), %r15d
	jmp	.L773
.L786:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L787
	call	comptypes
	movl	%eax, %r15d
	jmp	.L785
.L787:
	movl	$1, %r15d
	jmp	.L785
.L925:
	cmpl	$20, %eax
	je	.L921
	cmpl	$23, %eax
	jne	.L785
	movl	$1, 324(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L790
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 324(%rsp)
	je	.L785
.L790:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3926
	testq	%r12, %r12
	je	.L3927
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L905:
	testq	%r13, %r13
	je	.L3928
	testq	%r12, %r12
	je	.L894
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3929
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L880
.L3458:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L894
.L879:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L905
.L894:
	xorl	%r15d, %r15d
.L874:
	cmpl	$1, %r15d
	cmove	324(%rsp), %r15d
	jmp	.L785
.L880:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L879
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3931
.L884:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L894
	cmpq	$0, 96(%rax)
	je	.L895
	testb	$8, 62(%rax)
	je	.L894
.L895:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L894
	movq	32(%r13), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L894
	movq	32(%r12), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L894
.L901:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L897
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L901
	jmp	.L894
.L897:
	testq	%rbx, %rbx
	jne	.L879
	jmp	.L894
.L3931:
	cmpq	$0, 96(%rax)
	je	.L885
	testb	$8, 62(%rax)
	je	.L884
.L885:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L884
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L884
	movq	32(%r13), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L894
.L891:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L897
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L891
	jmp	.L894
.L3929:
	movq	32(%r12), %rdi
	jmp	.L3458
.L3928:
	testq	%r12, %r12
	je	.L874
	jmp	.L894
.L3927:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L785
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3113
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L869:
	testq	%r13, %r13
	je	.L3932
	testq	%rbp, %rbp
	je	.L858
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3933
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L844
.L3456:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L858
.L843:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L869
.L858:
	xorl	%r12d, %r12d
.L838:
	movl	$2, %r15d
	decl	%r12d
.L3457:
	jne	.L785
.L3113:
	movl	324(%rsp), %r15d
	jmp	.L785
.L844:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L843
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3935
.L848:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L858
	cmpq	$0, 96(%rax)
	je	.L859
	testb	$8, 62(%rax)
	je	.L858
.L859:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L858
	movq	32(%r13), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L858
	movq	32(%rbp), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L858
.L865:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L861
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L865
	jmp	.L858
.L861:
	testq	%rbx, %rbx
	jne	.L843
	jmp	.L858
.L3935:
	cmpq	$0, 96(%rax)
	je	.L849
	testb	$8, 62(%rax)
	je	.L848
.L849:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L848
	movq	32(%rbp), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L848
	movq	32(%r13), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L858
.L855:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L861
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L855
	jmp	.L858
.L3933:
	movq	32(%rbp), %rdi
	jmp	.L3456
.L3932:
	testq	%rbp, %rbp
	je	.L838
	jmp	.L858
.L3926:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L785
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3113
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L830:
	testq	%r12, %r12
	je	.L3936
	testq	%rbp, %rbp
	je	.L819
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3937
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L805
.L3455:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L819
.L804:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L830
.L819:
	xorl	%r13d, %r13d
.L799:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3457
.L805:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L804
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3939
.L809:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L819
	cmpq	$0, 96(%rax)
	je	.L820
	testb	$8, 62(%rax)
	je	.L819
.L820:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L819
	movq	32(%r12), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L819
	movq	32(%rbp), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L819
.L826:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L822
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L826
	jmp	.L819
.L822:
	testq	%rbx, %rbx
	jne	.L804
	jmp	.L819
.L3939:
	cmpq	$0, 96(%rax)
	je	.L810
	testb	$8, 62(%rax)
	je	.L809
.L810:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L809
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L809
	movq	32(%r12), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L819
.L816:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L822
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L816
	jmp	.L819
.L3937:
	movq	32(%rbp), %rdi
	jmp	.L3455
.L3936:
	testq	%rbp, %rbp
	je	.L799
	jmp	.L819
.L921:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L785
.L908:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L909
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L768
.L909:
	testq	%r12, %r12
	je	.L785
	testq	%r13, %r13
	je	.L785
	cmpq	%r13, %r12
	je	.L785
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L912
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3940
.L913:
	movl	$1, %r8d
.L912:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L914
	movq	104(%r13), %r10
	cmpb	$25, 16(%r10)
	je	.L3941
.L915:
	movl	$1, %ecx
.L914:
	testb	%r8b, %r8b
	jne	.L785
	testb	%cl, %cl
	jne	.L785
	testb	%dil, %dil
	je	.L3195
	testb	%dl, %dl
.L3361:
	jne	.L785
.L920:
	xorl	%r15d, %r15d
	jmp	.L785
.L3195:
	testb	%dl, %dl
	jne	.L920
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L920
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3361
.L3941:
	cmpb	$25, 16(%rsi)
	jne	.L915
	jmp	.L914
.L3940:
	cmpb	$25, 16(%rcx)
	jne	.L913
	jmp	.L912
.L3362:
	movl	$1, %r15d
	jmp	.L773
.L3925:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L782
.L3924:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L781
.L3922:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L777
.L3921:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L776
.L3920:
	testb	$2, 62(%rcx)
	je	.L775
	movq	24(%rcx), %r11
	testq	%r11, %r11
	cmovne	%r11, %rbp
	jmp	.L775
.L3919:
	testb	$2, 62(%rbx)
	je	.L774
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L774
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L774
.L3917:
	cmpq	%rax, %rdx
	je	.L599
	movq	24(%rdx), %r15
	testq	%r15, %r15
	movq	%r15, 344(%rsp)
	je	.L599
.L764:
	movq	344(%rsp), %r10
	movq	%rax, %rbp
	movq	8(%r10), %rbx
	cmpq	%rax, %rbx
	je	.L606
	testq	%rbx, %rbx
	je	.L606
	testq	%rax, %rax
	je	.L606
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L606
	movzbl	16(%rax), %ecx
	testb	%cl, %cl
	jne	.L605
.L606:
	movl	$1, %r15d
.L607:
	testl	%r15d, %r15d
	jne	.L3942
.L602:
	movq	344(%rsp), %rsi
	movq	(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 344(%rsp)
	jne	.L764
	jmp	.L599
.L3942:
	movq	368(%rsp), %r15
	movq	%rax, 32(%r15)
	jmp	.L3459
.L605:
	cmpb	$6, %dl
	je	.L3943
.L608:
	cmpb	$6, %cl
	je	.L3944
.L609:
	cmpb	$10, %dl
	je	.L3945
.L610:
	cmpb	$10, 16(%rbp)
	je	.L3946
.L611:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L3360
	movzbl	16(%rbx), %edi
	cmpb	16(%rbp), %dil
	je	.L613
	xorl	%r15d, %r15d
.L3359:
	movq	360(%rsp), %r13
	movq	32(%r13), %rax
	jmp	.L607
.L613:
	movzbl	17(%rbx), %r8d
	movzbl	62(%rbx), %r12d
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r12b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r12d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r12d
	orl	%r8d, %edx
	orl	%r12d, %edx
	cmpb	$20, %dil
	je	.L3947
.L615:
	movzbl	17(%rbp), %r9d
	movzbl	62(%rbp), %r11d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %r11b
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %r11d
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %r11d
	orl	%r9d, %edx
	orl	%r11d, %edx
	cmpb	$20, %dil
	je	.L3948
.L616:
	leal	0(,%rcx,8), %edi
	orl	%edi, %edx
	cmpl	%edx, %esi
	je	.L614
	xorl	%r15d, %r15d
.L3320:
	movq	360(%rsp), %r12
	movq	32(%r12), %rax
	jmp	.L607
.L614:
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L3949
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 532(%rsp)
	jne	.L618
	xorl	%r15d, %r15d
.L3360:
	movq	360(%rsp), %rbx
	movq	32(%rbx), %rax
	jmp	.L607
.L618:
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L742
	cmpl	$18, %eax
	ja	.L759
	cmpl	$13, %eax
	je	.L620
.L619:
	cmpl	$2, 532(%rsp)
	jne	.L3320
	cmpl	$1, %r15d
	je	.L3950
	movq	360(%rsp), %r9
	movq	32(%r9), %rax
	jmp	.L607
.L3950:
	movl	$2, %r15d
	jmp	.L3359
.L620:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L621
	call	comptypes
	movl	%eax, %r15d
	jmp	.L619
.L621:
	movl	$1, %r15d
	jmp	.L619
.L759:
	cmpl	$20, %eax
	je	.L755
	cmpl	$23, %eax
	jne	.L619
	movl	$1, 340(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L624
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 340(%rsp)
	je	.L619
.L624:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3951
	testq	%r12, %r12
	je	.L3952
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L739:
	testq	%r13, %r13
	je	.L3953
	testq	%r12, %r12
	je	.L728
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3954
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L714
.L3454:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L728
.L713:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L739
.L728:
	xorl	%r15d, %r15d
.L708:
	cmpl	$1, %r15d
	cmove	340(%rsp), %r15d
	jmp	.L619
.L714:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L713
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3956
.L718:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L728
	cmpq	$0, 96(%rax)
	je	.L729
	testb	$8, 62(%rax)
	je	.L728
.L729:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L728
	movq	32(%r13), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L728
	movq	32(%r12), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L728
.L735:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L731
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L735
	jmp	.L728
.L731:
	testq	%rbx, %rbx
	jne	.L713
	jmp	.L728
.L3956:
	cmpq	$0, 96(%rax)
	je	.L719
	testb	$8, 62(%rax)
	je	.L718
.L719:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L718
	movq	32(%r12), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L718
	movq	32(%r13), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L728
.L725:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L731
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L725
	jmp	.L728
.L3954:
	movq	32(%r12), %rdi
	jmp	.L3454
.L3953:
	testq	%r12, %r12
	je	.L708
	jmp	.L728
.L3952:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L619
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3109
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L703:
	testq	%r13, %r13
	je	.L3957
	testq	%rbp, %rbp
	je	.L692
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3958
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L678
.L3452:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L692
.L677:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L703
.L692:
	xorl	%r12d, %r12d
.L672:
	movl	$2, %r15d
	decl	%r12d
.L3453:
	jne	.L619
.L3109:
	movl	340(%rsp), %r15d
	jmp	.L619
.L678:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L677
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3960
.L682:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L692
	cmpq	$0, 96(%rax)
	je	.L693
	testb	$8, 62(%rax)
	je	.L692
.L693:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L692
	movq	32(%r13), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L692
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L692
.L699:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L695
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L699
	jmp	.L692
.L695:
	testq	%rbx, %rbx
	jne	.L677
	jmp	.L692
.L3960:
	cmpq	$0, 96(%rax)
	je	.L683
	testb	$8, 62(%rax)
	je	.L682
.L683:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L682
	movq	32(%rbp), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L682
	movq	32(%r13), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L692
.L689:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L695
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L689
	jmp	.L692
.L3958:
	movq	32(%rbp), %rdi
	jmp	.L3452
.L3957:
	testq	%rbp, %rbp
	je	.L672
	jmp	.L692
.L3951:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L619
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3109
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r15d, %r15d
.L664:
	testq	%r12, %r12
	je	.L3961
	testq	%rbp, %rbp
	je	.L653
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3962
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L639
.L3451:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L653
.L638:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r15d
	cmovg	%r15d, %r13d
	jmp	.L664
.L653:
	xorl	%r13d, %r13d
.L633:
	movl	$2, %r15d
	decl	%r13d
	jmp	.L3453
.L639:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L638
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3964
.L643:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L653
	cmpq	$0, 96(%rax)
	je	.L654
	testb	$8, 62(%rax)
	je	.L653
.L654:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L653
	movq	32(%r12), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L653
	movq	32(%rbp), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L653
.L660:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L656
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L660
	jmp	.L653
.L656:
	testq	%rbx, %rbx
	jne	.L638
	jmp	.L653
.L3964:
	cmpq	$0, 96(%rax)
	je	.L644
	testb	$8, 62(%rax)
	je	.L643
.L644:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L643
	movq	32(%rbp), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L643
	movq	32(%r12), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L653
.L650:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L656
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L650
	jmp	.L653
.L3962:
	movq	32(%rbp), %rdi
	jmp	.L3451
.L3961:
	testq	%rbp, %rbp
	je	.L633
	jmp	.L653
.L755:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L619
.L742:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L743
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L3319
.L743:
	testq	%r12, %r12
	je	.L619
	testq	%r13, %r13
	je	.L619
	cmpq	%r13, %r12
	je	.L619
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L746
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3965
.L747:
	movl	$1, %r8d
.L746:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L748
	movq	104(%r13), %r11
	cmpb	$25, 16(%r11)
	je	.L3966
.L749:
	movl	$1, %ecx
.L748:
	testb	%r8b, %r8b
	jne	.L619
	testb	%cl, %cl
	jne	.L619
	testb	%dil, %dil
	je	.L3185
	testb	%dl, %dl
.L3358:
	jne	.L619
.L754:
	xorl	%r15d, %r15d
	jmp	.L619
.L3185:
	testb	%dl, %dl
	jne	.L754
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L754
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3358
.L3966:
	cmpb	$25, 16(%rsi)
	jne	.L749
	jmp	.L748
.L3965:
	cmpb	$25, 16(%rcx)
	jne	.L747
	jmp	.L746
.L3319:
	movq	360(%rsp), %rdi
	movq	32(%rdi), %rax
	jmp	.L602
.L3949:
	movq	360(%rsp), %rsi
	movl	$1, %r15d
	movq	32(%rsi), %rax
	jmp	.L607
.L3948:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L616
.L3947:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L615
.L3946:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L611
.L3945:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L610
.L3944:
	testb	$2, 62(%rax)
	je	.L609
	movq	24(%rax), %r13
	testq	%r13, %r13
	cmovne	%r13, %rbp
	jmp	.L609
.L3943:
	testb	$2, 62(%rbx)
	je	.L608
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L608
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L608
.L3916:
	movq	536(%rsp), %rdi
	movq	24(%rbx), %rsi
	jmp	.L3522
.L3915:
	cmpq	$0, 352(%rsp)
	jne	.L585
	jmp	.L3465
.L3914:
	testq	%r8, %r8
	jne	.L583
	jmp	.L932
.L3304:
	movq	%r15, %rdi
.L544:
	cmpl	$8, %r12d
	movq	%rbx, %rsi
	je	.L3967
.L546:
	call	common_type
	cmpl	$8, %ebp
	movq	%rax, %rdi
	je	.L3968
.L547:
	cmpl	$8, %r12d
	je	.L3969
.L549:
	call	build_complex_type
	jmp	.L3467
.L3969:
	cmpq	%rdi, 8(%rbx)
	jne	.L549
	jmp	.L3465
.L3968:
	cmpq	%rax, 8(%r15)
	jne	.L547
	jmp	.L932
.L3967:
	movq	8(%rbx), %rsi
	jmp	.L546
.L3174:
	movq	8(%r15), %rdi
	jmp	.L544
.L3907:
	movzwl	60(%rcx), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L540
.L3906:
	movzwl	60(%r15), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %r15
	jmp	.L539
.L3905:
	movq	%rbx, %r15
	jmp	.L934
.L373:
	movq	568(%rsp), %r12
	cmpb	$5, 16(%r12)
	je	.L3970
	movq	560(%rsp), %r9
	cmpb	$5, 16(%r9)
	je	.L3971
	movl	$.LC12, %edi
.L3364:
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L934
.L3971:
	movl	pedantic(%rip), %ecx
	testl	%ecx, %ecx
	je	.L934
	movq	%r14, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L941
	cmpq	592(%rsp), %r14
	je	.L934
.L941:
	movq	568(%rsp), %rdx
	cmpb	$23, 16(%rdx)
.L3468:
	jne	.L934
	movl	$.LC11, %edi
	jmp	.L3364
.L3970:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L934
	movq	8(%rsp), %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L937
	movq	600(%rsp), %r8
	cmpq	%r8, 8(%rsp)
	je	.L934
.L937:
	movq	560(%rsp), %r11
	cmpb	$23, 16(%r11)
	jmp	.L3468
.L3904:
	movq	168(%rsp), %rbp
	movq	96(%rsp), %rdx
	movq	8(%rbp), %rsi
	movq	8(%rdx), %r13
	movq	128(%rsi), %rbp
	movq	128(%r13), %rbx
	cmpq	%rbp, %rbx
	je	.L3357
	testq	%rbx, %rbx
	je	.L3357
	testq	%rbp, %rbp
	je	.L3357
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L3357
	movzbl	16(%rbp), %eax
	testb	%al, %al
	je	.L3357
	cmpb	$6, %dl
	je	.L3972
.L379:
	cmpb	$6, %al
	je	.L3973
.L380:
	cmpb	$10, %dl
	je	.L3974
.L381:
	cmpb	$10, 16(%rbp)
	je	.L3975
.L382:
	cmpq	%rbp, %rbx
	movl	$1, 384(%rsp)
	je	.L378
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L384
	movl	$0, 384(%rsp)
.L378:
	cmpl	$2, 384(%rsp)
	je	.L3976
.L534:
	movl	384(%rsp), %eax
	jmp	.L375
.L3976:
	movl	pedantic(%rip), %ecx
	testl	%ecx, %ecx
	je	.L534
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L534
.L384:
	movzbl	17(%rbx), %edi
	movzbl	62(%rbx), %ecx
	movl	%edi, %edx
	shrb	$5, %cl
	shrb	$3, %dil
	shrb	$4, %dl
	andl	$1, %edi
	andl	$1, %ecx
	andl	$1, %edx
	addl	%edi, %edi
	sall	$2, %ecx
	orl	%edi, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L3977
.L386:
	movzbl	17(%rbp), %r9d
	movzbl	62(%rbp), %r12d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %r12b
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %r12d
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %r12d
	orl	%r9d, %edx
	orl	%r12d, %edx
	cmpb	$20, %sil
	je	.L3978
.L387:
	leal	0(,%rcx,8), %r10d
	movl	$0, 384(%rsp)
	orl	%r10d, %edx
	cmpl	%edx, %edi
	jne	.L378
	movq	128(%rbp), %r8
	cmpq	%r8, 128(%rbx)
	je	.L3357
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 384(%rsp)
	testl	%eax, %eax
	movl	%eax, 556(%rsp)
	je	.L378
	movl	$0, 384(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L513
	cmpl	$18, %eax
	ja	.L530
	cmpl	$13, %eax
	je	.L391
.L390:
	cmpl	$2, 556(%rsp)
	jne	.L378
	cmpl	$1, 384(%rsp)
	movl	556(%rsp), %eax
	cmovne	384(%rsp), %eax
	movl	%eax, 384(%rsp)
	jmp	.L378
.L391:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L392
	call	comptypes
.L3356:
	movl	%eax, 384(%rsp)
	jmp	.L390
.L392:
	movl	$1, 384(%rsp)
	jmp	.L390
.L530:
	cmpl	$20, %eax
	je	.L526
	cmpl	$23, %eax
	jne	.L390
	movl	$1, 396(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L395
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 396(%rsp)
	je	.L390
.L395:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L3979
	testq	%r12, %r12
	je	.L3980
	movl	$1, 384(%rsp)
	xorl	%ebp, %ebp
.L510:
	testq	%r13, %r13
	je	.L3981
	testq	%r12, %r12
	je	.L499
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3982
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L485
.L3450:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L499
.L484:
	cmpl	384(%rsp), %ebp
	movl	384(%rsp), %r11d
	cmovg	%ebp, %r11d
	movl	%r11d, 384(%rsp)
	movq	(%r12), %r12
	movq	(%r13), %r13
	jmp	.L510
.L499:
	movl	$0, 384(%rsp)
.L479:
	cmpl	$1, 384(%rsp)
	movl	384(%rsp), %eax
	cmove	396(%rsp), %eax
	jmp	.L3356
.L485:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L484
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3984
.L489:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L499
	cmpq	$0, 96(%rax)
	je	.L500
	testb	$8, 62(%rax)
	je	.L499
.L500:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L499
	movq	32(%r13), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L499
	movq	32(%r12), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L499
.L506:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L502
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L506
	jmp	.L499
.L502:
	testq	%rbx, %rbx
	jne	.L484
	jmp	.L499
.L3984:
	cmpq	$0, 96(%rax)
	je	.L490
	testb	$8, 62(%rax)
	je	.L489
.L490:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L489
	movq	32(%r12), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L489
	movq	32(%r13), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L499
.L496:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L502
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L496
	jmp	.L499
.L3982:
	movq	32(%r12), %rdi
	jmp	.L3450
.L3981:
	testq	%r12, %r12
	je	.L479
	jmp	.L499
.L3980:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L390
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L3104
	movq	%rax, %rbp
	movl	$1, %r12d
	movl	$0, 388(%rsp)
.L474:
	testq	%r13, %r13
	je	.L3985
	testq	%rbp, %rbp
	je	.L463
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L3986
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L449
.L3449:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L463
.L448:
	cmpl	%r12d, 388(%rsp)
	movq	(%r13), %r13
	cmovg	388(%rsp), %r12d
	movq	(%rbp), %rbp
	jmp	.L474
.L463:
	xorl	%r12d, %r12d
.L443:
	decl	%r12d
	movl	$2, 384(%rsp)
	jne	.L390
	movl	396(%rsp), %r12d
	movl	%r12d, 384(%rsp)
	jmp	.L390
.L449:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 388(%rsp)
	jne	.L448
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L3988
.L453:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L463
	cmpq	$0, 96(%rax)
	je	.L464
	testb	$8, 62(%rax)
	je	.L463
.L464:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L463
	movq	32(%r13), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L463
	movq	32(%rbp), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L463
.L470:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L466
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L470
	jmp	.L463
.L466:
	testq	%rbx, %rbx
	jne	.L448
	jmp	.L463
.L3988:
	cmpq	$0, 96(%rax)
	je	.L454
	testb	$8, 62(%rax)
	je	.L453
.L454:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L453
	movq	32(%rbp), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L453
	movq	32(%r13), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L463
.L460:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L466
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L460
	jmp	.L463
.L3986:
	movq	32(%rbp), %rdi
	jmp	.L3449
.L3985:
	testq	%rbp, %rbp
	je	.L443
	jmp	.L463
.L3104:
	movl	396(%rsp), %r13d
	movl	%r13d, 384(%rsp)
	jmp	.L390
.L3979:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L390
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L3102
	movq	%rax, %rbp
	movl	$1, %r13d
	movl	$0, 392(%rsp)
.L435:
	testq	%r12, %r12
	je	.L3989
	testq	%rbp, %rbp
	je	.L424
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L3990
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L410
.L3448:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L424
.L409:
	cmpl	%r13d, 392(%rsp)
	movq	(%r12), %r12
	cmovg	392(%rsp), %r13d
	movq	(%rbp), %rbp
	jmp	.L435
.L424:
	xorl	%r13d, %r13d
.L404:
	decl	%r13d
	movl	$2, 384(%rsp)
	jne	.L390
	movl	396(%rsp), %ebp
	movl	%ebp, 384(%rsp)
	jmp	.L390
.L410:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 392(%rsp)
	jne	.L409
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L3992
.L414:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L424
	cmpq	$0, 96(%rax)
	je	.L425
	testb	$8, 62(%rax)
	je	.L424
.L425:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L424
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L424
	movq	32(%rbp), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L424
.L431:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L427
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L431
	jmp	.L424
.L427:
	testq	%rbx, %rbx
	jne	.L409
	jmp	.L424
.L3992:
	cmpq	$0, 96(%rax)
	je	.L415
	testb	$8, 62(%rax)
	je	.L414
.L415:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L414
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L414
	movq	32(%r12), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L424
.L421:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L427
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L421
	jmp	.L424
.L3990:
	movq	32(%rbp), %rdi
	jmp	.L3448
.L3989:
	testq	%rbp, %rbp
	je	.L404
	jmp	.L424
.L3102:
	movl	396(%rsp), %eax
	movl	%eax, 384(%rsp)
	jmp	.L390
.L526:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	384(%rsp), %eax
	jmp	.L3356
.L513:
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	movl	$1, 384(%rsp)
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L514
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 384(%rsp)
	je	.L378
.L514:
	testq	%r12, %r12
	je	.L390
	testq	%r13, %r13
	je	.L390
	cmpq	%r13, %r12
	je	.L390
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L517
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L3993
.L518:
	movl	$1, %r8d
.L517:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L519
	movq	104(%r13), %r9
	cmpb	$25, 16(%r9)
	je	.L3994
.L520:
	movl	$1, %ecx
.L519:
	testb	%r8b, %r8b
	jne	.L390
	testb	%cl, %cl
	jne	.L390
	testb	%dil, %dil
	je	.L3173
	testb	%dl, %dl
.L3355:
	jne	.L390
.L525:
	movl	$0, 384(%rsp)
	jmp	.L390
.L3173:
	testb	%dl, %dl
	jne	.L525
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L525
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L3355
.L3994:
	cmpb	$25, 16(%rsi)
	jne	.L520
	jmp	.L519
.L3993:
	cmpb	$25, 16(%rcx)
	jne	.L518
	jmp	.L517
.L3357:
	movl	$1, 384(%rsp)
	jmp	.L378
.L3978:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L387
.L3977:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L386
.L3975:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L382
.L3974:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L381
.L3973:
	testb	$2, 62(%rbp)
	je	.L380
	movq	24(%rbp), %r11
	testq	%r11, %r11
	cmovne	%r11, %rbp
	jmp	.L380
.L3972:
	testb	$2, 62(%rbx)
	je	.L379
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L379
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L379
	.p2align 6,,7
.L369:
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L368
.L2113:
	cmpl	$7, 588(%rsp)
	movq	integer_types+40(%rip), %rcx
	movq	%rcx, (%rsp)
	je	.L3995
.L2115:
	movl	$.LC17, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L3439
.L3995:
	cmpl	$7, 584(%rsp)
	jne	.L2115
	jmp	.L2114
	.p2align 6,,7
.L133:
	movzbl	16(%rax), %edx
	movq	%rax, %r14
	leal	-114(%rdx), %esi
	cmpb	$2, %sil
	ja	.L130
	movq	32(%rax), %rax
	cmpq	%rcx, %rax
	je	.L130
	movq	8(%rax), %r10
	cmpq	%r10, 8(%r14)
	je	.L133
	jmp	.L130
	.p2align 6,,7
.L128:
	movq	%rax, 8(%rsp)
	movq	%rax, %rcx
	movzbl	16(%rax), %r13d
	subb	$114, %r13b
	cmpb	$2, %r13b
	ja	.L125
	movq	32(%rax), %rax
	cmpq	%rdx, %rax
	je	.L125
	movq	8(%rax), %r12
	cmpq	%r12, 8(%rcx)
	je	.L128
	jmp	.L125
.L120:
	movq	integer_types+48(%rip), %rdi
	jmp	.L3345
.L118:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L121
	movl	flag_allow_single_precision(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L121
	movq	global_trees+192(%rip), %r10
	cmpq	%r10, 128(%r12)
	je	.L3996
.L121:
	cmpl	$5, %r13d
	je	.L3997
.L122:
	movq	%rbx, %r14
	jmp	.L123
.L3997:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L3347:
	movq	global_trees(%rip), %r14
	jmp	.L123
.L3996:
	movq	global_trees+200(%rip), %rdi
	jmp	.L3345
	.p2align 6,,7
.L3539:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L113
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L113
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	je	.L119
	testb	$32, 17(%r12)
	jne	.L120
	jmp	.L119
	.p2align 6,,7
.L3538:
	movq	integer_types+40(%rip), %rbp
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %ecx
	movzwl	60(%rbp), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ecx, %ecx
	jne	.L112
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L111
.L112:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L111:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L3345
.L105:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L104
.L3537:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rsi)
	jne	.L100
	.p2align 4,,7
.L103:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %rbx
	cmpb	$116, %cl
	jne	.L3998
.L3318:
	movq	32(%rbx), %rsi
	jmp	.L103
.L3998:
	cmpb	$115, %cl
	jne	.L100
	movq	32(%rsi), %r14
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%r14)
	movq	%r14, %rsi
	je	.L103
	jmp	.L100
.L3536:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L94
	movq	592(%rsp), %rsi
	cmpb	$51, 48(%rsi)
	je	.L94
	cmpq	$0, current_function_decl(%rip)
	je	.L97
	movq	592(%rsp), %rsi
	movzbl	17(%rsi), %ebx
	andb	$24, %bl
	cmpb	$16, %bl
	je	.L3999
.L97:
	movq	592(%rsp), %rsi
.L98:
	movq	%rsi, %rbx
.L95:
	movq	8(%rbx), %r12
	jmp	.L91
.L3999:
	movq	104(%rsi), %rax
	testq	%rax, %rax
	je	.L97
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L97
	testb	$2, 17(%rax)
	je	.L97
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L98
	jmp	.L97
	.p2align 6,,7
.L94:
	movq	592(%rsp), %rbx
	jmp	.L95
.L3535:
	movq	104(%rcx), %rbx
	jmp	.L91
.L64:
	movq	592(%rsp), %rbx
	xorl	%ebp, %ebp
	movzbl	16(%rbx), %edx
	cmpb	$116, %dl
	je	.L2980
	cmpb	$115, %dl
	je	.L4000
	movq	592(%rsp), %r10
	movzbl	16(%r10), %ecx
.L66:
	movzbl	%cl, %r14d 
	movzbl	tree_code_type(%r14), %eax
	cmpb	$60, %al
	je	.L72
	cmpb	$49, %al
	je	.L72
	cmpb	$50, %al
	je	.L72
	cmpb	$101, %al
	je	.L72
.L71:
	cmpl	$23, %r13d
	je	.L4001
	cmpl	$18, %r13d
	jne	.L122
	movzbl	%cl, %edi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%r12), %r13
	cmpb	$114, %al
	je	.L77
	cmpb	$100, %al
	je	.L77
.L76:
	movzbl	17(%r12), %r8d
	movl	$1, %esi
	movzbl	16(%r12), %edi
	movl	%r8d, %r9d
	movl	%r8d, %r14d
	shrb	$3, %r9b
	shrb	$4, %r14b
	andl	$1, %r9d
	andl	%r14d, %esi
	addl	%r9d, %r9d
	orl	%r9d, %esi
	movzbl	62(%r12), %r9d
	movl	%r9d, %r10d
	shrb	$5, %r10b
	andl	$1, %r10d
	sall	$2, %r10d
	orl	%r10d, %esi
	xorl	%r10d, %r10d
	cmpb	$20, %dil
	je	.L4002
.L80:
	leal	0(,%r10,8), %r12d
	orl	%r12d, %esi
	jne	.L79
	testl	%edx, %edx
	jne	.L79
	testl	%r11d, %r11d
	je	.L78
.L79:
	movl	%r8d, %r14d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r14b
	movl	%r9d, %ecx
	movl	%r8d, %r10d
	andl	%r14d, %esi
	andl	$1, %ecx
	andl	$1, %r10d
	sall	$2, %ecx
	addl	%r10d, %r10d
	orl	%r10d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L4003
.L82:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r13
.L78:
	cmpb	$41, %cl
	je	.L4004
	cmpb	$47, %cl
	je	.L4005
	xorl	%r12d, %r12d
	testl	%ebp, %ebp
	je	.L4006
.L85:
	movl	flag_isoc99(%rip), %ebp
	testl	%ebp, %ebp
	jne	.L86
	testl	%r12d, %r12d
	movq	%rbx, %r14
	je	.L123
.L86:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L4007
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L3346
.L4007:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	mark_addressable
	testl	%eax, %eax
	je	.L3347
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%r14), %r11d
	movl	%eax, %r13d
	andb	$1, %r13b
	addb	%r13b, %r13b
	andb	$-4, %r11b
	orb	%r13b, %r11b
	movb	%r11b, 17(%r14)
	jmp	.L123
.L4006:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L85
.L4005:
	movq	40(%rbx), %rdi
	call	default_conversion
	movq	32(%rbx), %rdx
	movl	$47, %edi
	movq	8(%rax), %rsi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	build
	jmp	.L3348
.L4004:
	movq	72(%r13), %rdi
	movq	32(%rbx), %rsi
	jmp	.L3346
.L4003:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L82
.L4002:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L80
.L77:
	movzbl	17(%rbx), %esi
	movl	$1, %r11d
	movl	%esi, %edx
	shrb	$3, %sil
	shrb	$4, %dl
	andl	%esi, %r11d
	andl	$1, %edx
	jmp	.L76
.L4001:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L3348
.L72:
	movq	592(%rsp), %r8
	movl	24(%r8), %eax
	movl	%eax, 24(%rbx)
	jmp	.L71
.L4000:
	movq	32(%rbx), %r9
	cmpq	%r12, 8(%r9)
	je	.L2980
	movl	$115, %ecx
	jmp	.L66
.L2980:
	movl	%edx, %ecx
	movq	592(%rsp), %rbx
	.p2align 4,,7
.L3316:
	movq	32(%rbx), %rsi
.L70:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbx
	movzbl	16(%rsi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	je	.L3316
	cmpb	$115, %cl
	jne	.L66
	movq	32(%rsi), %rsi
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rsi)
	je	.L70
	jmp	.L66
.L60:
	movq	integer_types+48(%rip), %rdi
	jmp	.L3342
.L58:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L61
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L61
	movq	global_trees+192(%rip), %rsi
	cmpq	%rsi, 128(%r12)
	je	.L4008
.L61:
	cmpl	$5, %r13d
	je	.L4009
.L62:
	movq	%rbx, 8(%rsp)
	jmp	.L29
.L4009:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
	movq	global_trees(%rip), %rbx
	movq	%rbx, 8(%rsp)
	jmp	.L29
.L4008:
	movq	global_trees+200(%rip), %rdi
	jmp	.L3342
	.p2align 6,,7
.L3534:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L53
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%rdi), %esi
	movq	40(%rdx), %rdi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L53
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L59
	testb	$32, 17(%r12)
	jne	.L60
	jmp	.L59
	.p2align 6,,7
.L3533:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %r11d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r11d, %r11d
	jne	.L52
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L51
.L52:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L51:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L3342
.L45:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L44
.L3532:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L40
	.p2align 4,,7
.L43:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %rbx
	cmpb	$116, %cl
	jne	.L4010
.L3313:
	movq	32(%rbx), %rsi
	jmp	.L43
.L4010:
	cmpb	$115, %cl
	jne	.L40
	movq	32(%rsi), %r8
	movq	8(%rbx), %r14
	cmpq	%r14, 8(%r8)
	movq	%r8, %rsi
	je	.L43
	jmp	.L40
.L3531:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L34
	movq	600(%rsp), %rdi
	cmpb	$51, 48(%rdi)
	je	.L34
	cmpq	$0, current_function_decl(%rip)
	je	.L37
	movq	600(%rsp), %rdx
	movzbl	17(%rdx), %r9d
	andb	$24, %r9b
	cmpb	$16, %r9b
	je	.L4011
.L37:
	movq	600(%rsp), %rsi
.L38:
	movq	%rsi, %rbx
.L35:
	movq	8(%rbx), %r12
	jmp	.L31
.L4011:
	movq	104(%rdx), %rax
	testq	%rax, %rax
	je	.L37
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L37
	testb	$2, 17(%rax)
	je	.L37
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L38
	jmp	.L37
	.p2align 6,,7
.L34:
	movq	600(%rsp), %rbx
	jmp	.L35
.L3530:
	movq	104(%rsi), %rbx
	jmp	.L31
.L4:
	movq	600(%rsp), %rbx
	xorl	%ebp, %ebp
	movzbl	16(%rbx), %edx
	cmpb	$116, %dl
	je	.L2978
	cmpb	$115, %dl
	je	.L4012
	movq	600(%rsp), %rdi
	movzbl	16(%rdi), %ecx
.L6:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L12
	cmpb	$49, %al
	je	.L12
	cmpb	$50, %al
	je	.L12
	cmpb	$101, %al
	je	.L12
.L11:
	cmpl	$23, %r13d
	je	.L4013
	cmpl	$18, %r13d
	jne	.L62
	movzbl	%cl, %r8d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r8), %eax
	movq	8(%r12), %r13
	cmpb	$114, %al
	je	.L17
	cmpb	$100, %al
	je	.L17
.L16:
	movzbl	17(%r12), %r8d
	movl	$1, %esi
	xorl	%r10d, %r10d
	movl	%r8d, %r9d
	movl	%r8d, %edi
	shrb	$4, %r9b
	shrb	$3, %dil
	andl	%r9d, %esi
	andl	$1, %edi
	movzbl	62(%r12), %r9d
	addl	%edi, %edi
	orl	%edi, %esi
	movzbl	16(%r12), %edi
	movl	%r9d, %r14d
	shrb	$5, %r14b
	andl	$1, %r14d
	sall	$2, %r14d
	orl	%r14d, %esi
	cmpb	$20, %dil
	je	.L4014
.L20:
	leal	0(,%r10,8), %r12d
	orl	%r12d, %esi
	jne	.L19
	testl	%edx, %edx
	jne	.L19
	testl	%r11d, %r11d
	je	.L18
.L19:
	movl	%r8d, %r14d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r14b
	movl	%r9d, %ecx
	movl	%r8d, %r10d
	andl	%r14d, %esi
	andl	$1, %ecx
	andl	$1, %r10d
	sall	$2, %ecx
	addl	%r10d, %r10d
	orl	%r10d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L4015
.L22:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r13
.L18:
	cmpb	$41, %cl
	je	.L4016
	cmpb	$47, %cl
	je	.L4017
	xorl	%r12d, %r12d
	testl	%ebp, %ebp
	je	.L4018
.L25:
	movl	flag_isoc99(%rip), %ebp
	testl	%ebp, %ebp
	jne	.L26
	testl	%r12d, %r12d
	movq	%rbx, 8(%rsp)
	je	.L29
.L26:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L4019
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L3343
.L4019:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	mark_addressable
	testl	%eax, %eax
	jne	.L28
	movq	global_trees(%rip), %rax
	jmp	.L3344
.L28:
	movq	%rbx, %rdi
	call	staticp
	movq	8(%rsp), %rbx
	movl	%eax, %r13d
	andb	$1, %r13b
	movzbl	17(%rbx), %r11d
	addb	%r13b, %r13b
	andb	$-4, %r11b
	orb	%r13b, %r11b
	movb	%r11b, 17(%rbx)
	jmp	.L29
.L4018:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L25
.L4017:
	movq	40(%rbx), %rdi
	call	default_conversion
	movq	32(%rbx), %rdx
	movl	$47, %edi
	movq	8(%rax), %rsi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	build
	jmp	.L3344
.L4016:
	movq	72(%r13), %rdi
	movq	32(%rbx), %rsi
	jmp	.L3343
.L4015:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L22
.L4014:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L20
.L17:
	movzbl	17(%rbx), %r10d
	movl	$1, %r11d
	movl	%r10d, %edx
	shrb	$3, %r10b
	shrb	$4, %dl
	andl	%r10d, %r11d
	andl	$1, %edx
	jmp	.L16
.L4013:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L3344
.L12:
	movq	600(%rsp), %r9
	movl	24(%r9), %eax
	movl	%eax, 24(%rbx)
	jmp	.L11
.L4012:
	movq	32(%rbx), %rcx
	cmpq	%r12, 8(%rcx)
	je	.L2978
	movl	$115, %ecx
	jmp	.L6
.L2978:
	movl	%edx, %ecx
	movq	600(%rsp), %rdx
	movq	32(%rdx), %rsi
	.p2align 4,,7
.L10:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbx
	movzbl	16(%rsi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L4020
	movq	32(%rbx), %rsi
	jmp	.L10
.L4020:
	cmpb	$115, %cl
	jne	.L6
	movq	32(%rsi), %rsi
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rsi)
	je	.L10
	jmp	.L6
.L2:
	movq	600(%rsp), %rbx
	movq	592(%rsp), %r14
	movq	%rbx, 8(%rsp)
	jmp	.L123
.LFE1:
.Lfe1:
	.size	build_binary_op,.Lfe1-build_binary_op
	.section	.rodata.str1.32
	.align 32
.LC23:
	.string	"arithmetic on pointer to an incomplete type"
	.align 32
.LC22:
	.string	"pointer to a function used in subtraction"
	.align 32
.LC21:
	.string	"pointer of type `void *' used in subtraction"
	.text
	.align 2
	.p2align 4,,15
	.type	pointer_diff,@function
pointer_diff:
.LFB2:
	pushq	%r15
.LCFI7:
	pushq	%r14
.LCFI8:
	pushq	%r13
.LCFI9:
	pushq	%r12
.LCFI10:
	movq	%rdi, %r12
	pushq	%rbp
.LCFI11:
	movq	%rsi, %rbp
	pushq	%rbx
.LCFI12:
	subq	$8, %rsp
.LCFI13:
	movl	pedantic(%rip), %eax
	movq	8(%rdi), %rdx
	movq	global_trees+240(%rip), %r14
	testl	%eax, %eax
	movq	8(%rdx), %r15
	movq	%rsi, (%rsp)
	jne	.L4023
	movl	warn_pointer_arith(%rip), %eax
	testl	%eax, %eax
	je	.L4022
.L4023:
	movzbl	16(%r15), %eax
	cmpb	$5, %al
	je	.L4045
.L4024:
	cmpb	$23, %al
	je	.L4046
.L4022:
	cmpb	$115, 16(%r12)
	je	.L4047
	movq	%r12, %rdi
.L4027:
	cmpb	$115, 16(%rbp)
	je	.L4048
	movq	%rbp, %rsi
.L4029:
	cmpb	$59, 16(%rdi)
	je	.L4049
	movq	global_trees+88(%rip), %rbx
.L4031:
	cmpb	$59, 16(%rsi)
	je	.L4050
	movq	global_trees+88(%rip), %r13
.L4033:
	xorl	%edx, %edx
	call	operand_equal_p
	testl	%eax, %eax
	je	.L4043
	movq	%r13, %rbp
.L4034:
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	convert
	movq	%rbp, %rsi
	movq	%r14, %rdi
	movq	%rax, %r12
	call	convert
	xorl	%ecx, %ecx
	movq	%r12, %rsi
	movl	$60, %edi
	movq	%rax, %rdx
	call	build_binary_op
	movq	(%rsp), %rbx
	movq	%rax, %r12
	movq	8(%rbx), %rcx
	movq	8(%rcx), %rax
	cmpq	$0, 32(%rax)
	jne	.L4035
	cmpb	$5, 16(%rax)
	je	.L4035
	movl	$.LC23, %edi
	xorl	%eax, %eax
	call	error
.L4035:
	movzbl	16(%r15), %edx
	movzbl	%dl, %eax
	cmpl	$23, %eax
	je	.L4044
	cmpl	$5, %eax
	je	.L4044
	testl	%eax, %eax
	je	.L4044
	cmpq	$0, 32(%r15)
	jne	.L4039
	cmpb	$5, %dl
	je	.L4039
	movl	$.LC23, %edi
	xorl	%eax, %eax
	call	error
	.p2align 4,,7
.L4044:
	movq	global_trees+128(%rip), %rbp
.L4038:
	movq	%r14, %rdi
	movq	%rbp, %rsi
	call	convert
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rax, %rcx
	movl	$71, %edi
	xorl	%eax, %eax
	call	build
	movq	%rax, %rdi
	movq	%rax, %r13
	call	fold
	cmpq	%r13, %rax
	movq	%rax, %rcx
	je	.L4051
.L4042:
	addq	$8, %rsp
	movq	%rcx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 6,,7
.L4051:
	movzbl	17(%rbp), %r8d
	movzbl	17(%r12), %r9d
	movzbl	17(%rax), %edi
	shrb	$1, %r9b
	shrb	$1, %r8b
	andl	%r9d, %r8d
	andb	$-3, %dil
	movl	%r8d, %ebp
	andb	$1, %bpl
	addb	%bpl, %bpl
	orb	%bpl, %dil
	movb	%dil, 17(%rax)
	jmp	.L4042
	.p2align 6,,7
.L4039:
	movq	integer_types(%rip), %rsi
	movzwl	60(%rsi), %edi
	xorl	%esi, %esi
	shrq	$3, %rdi
	andl	$63, %edi
	call	size_int_wide
	movq	40(%r15), %rsi
	movl	$63, %edi
	movq	%rax, %rdx
	call	size_binop
	movq	%rax, %rbp
	jmp	.L4038
	.p2align 6,,7
.L4043:
	movq	%r12, %rbx
	jmp	.L4034
	.p2align 6,,7
.L4050:
	movq	40(%rsi), %r13
	movq	32(%rsi), %rsi
	jmp	.L4033
	.p2align 6,,7
.L4049:
	movq	40(%rdi), %rbx
	movq	32(%rdi), %rdi
	jmp	.L4031
	.p2align 6,,7
.L4048:
	movq	32(%rbp), %rsi
	jmp	.L4029
	.p2align 6,,7
.L4047:
	movq	32(%r12), %rdi
	jmp	.L4027
	.p2align 6,,7
.L4046:
	movl	$.LC22, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L4022
	.p2align 6,,7
.L4045:
	xorl	%eax, %eax
	movl	$.LC21, %edi
	call	pedwarn
	movzbl	16(%r15), %eax
	jmp	.L4024
.LFE2:
.Lfe2:
	.size	pointer_diff,.Lfe2-pointer_diff
	.section	.rodata.str1.32
	.align 32
.LC24:
	.string	"wrong type argument to unary plus"
	.align 32
.LC25:
	.string	"wrong type argument to unary minus"
	.section	.rodata.str1.1
.LC28:
	.string	"wrong type argument to abs"
	.section	.rodata.str1.32
	.align 32
.LC27:
	.string	"wrong type argument to bit-complement"
	.align 32
.LC26:
	.string	"ISO C does not support `~' for complex conjugation"
	.align 32
.LC30:
	.string	"wrong type argument to unary exclamation mark"
	.align 32
.LC41:
	.string	"attempt to take address of bit-field structure member `%s'"
	.section	.rodata.str1.1
.LC40:
	.string	"invalid lvalue in unary `&'"
	.section	.rodata.str1.32
	.align 32
.LC29:
	.string	"wrong type argument to conjugation"
	.align 32
.LC33:
	.string	"wrong type argument to decrement"
	.align 32
.LC32:
	.string	"wrong type argument to increment"
	.section	.rodata.str1.1
.LC37:
	.string	"invalid lvalue in decrement"
.LC39:
	.string	"decrement"
.LC38:
	.string	"increment"
.LC36:
	.string	"invalid lvalue in increment"
	.section	.rodata.str1.32
	.align 32
.LC35:
	.string	"decrement of pointer to unknown structure"
	.align 32
.LC34:
	.string	"increment of pointer to unknown structure"
	.align 32
.LC31:
	.string	"ISO C does not support `++' and `--' on complex types"
	.text
	.align 2
	.p2align 4,,15
.globl build_unary_op
	.type	build_unary_op,@function
build_unary_op:
.LFB3:
	pushq	%r15
.LCFI14:
	movl	%edi, %r15d
	pushq	%r14
.LCFI15:
	pushq	%r13
.LCFI16:
	movl	%edx, %r13d
	pushq	%r12
.LCFI17:
	pushq	%rbp
.LCFI18:
	movq	%rsi, %rbp
	pushq	%rbx
.LCFI19:
	subq	$8, %rsp
.LCFI20:
	movq	$0, (%rsp)
	movq	8(%rsi), %rcx
	movzbl	16(%rcx), %ebx
	movq	%rcx, %r14
	testl	%ebx, %ebx
	je	.L4608
	leal	-10(%rbx), %edx
	movl	$6, %eax
	movq	%rsi, %r12
	cmpl	$1, %edx
	cmovbe	%eax, %ebx
	leal	-77(%r15), %eax
	cmpl	$55, %eax
	ja	.L4055
	mov	%eax, %edx
	jmp	*.L4546(,%rdx,8)
	.section	.rodata
	.align 8
	.align 4
.L4546:
	.quad	.L4121
	.quad	.L4567
	.quad	.L4567
	.quad	.L4313
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4185
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4441
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4056
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4528
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4567
	.quad	.L4377
	.quad	.L4444
	.quad	.L4449
	.quad	.L4457
	.quad	.L4457
	.quad	.L4457
	.quad	.L4457
	.text
.L4056:
	leal	-6(%rbx), %esi
	movl	$.LC24, %edi
	cmpl	$2, %esi
	ja	.L4597
	testl	%r13d, %r13d
	jne	.L4567
	movzbl	16(%rcx), %r12d
	cmpl	$23, %r12d
	je	.L4061
	cmpl	$18, %r12d
	je	.L4061
	movzbl	16(%rbp), %ebx
	cmpb	$32, %bl
	je	.L4661
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L4089
	cmpb	$34, %bl
	je	.L4662
.L4089:
	cmpb	$116, %bl
	movq	%rbp, %rdx
	je	.L4571
	cmpb	$115, %bl
	je	.L4663
.L4418:
	movzbl	%bl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L4423
	cmpb	$49, %al
	je	.L4423
	cmpb	$50, %al
	je	.L4423
	cmpb	$101, %al
	je	.L4423
.L4422:
	cmpl	$10, %r12d
	je	.L4664
	cmpb	$39, %bl
	je	.L4665
.L4431:
	movq	%r14, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L4436
	testb	$32, 17(%r14)
	je	.L4437
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L4438
	movzwl	60(%r14), %edx
.L4635:
	movq	integer_types+40(%rip), %r13
	andl	$511, %edx
	movzwl	60(%r13), %r14d
	andl	$511, %r14d
	cmpl	%r14d, %edx
	je	.L4438
.L4437:
	movq	integer_types+40(%rip), %rdi
.L4604:
	movq	%rbp, %rsi
.L4605:
	call	convert
.L4607:
	movq	%rax, %r12
	.p2align 4,,7
.L4055:
	cmpq	$0, (%rsp)
	jne	.L4547
	movq	8(%r12), %rdx
	movq	%rdx, (%rsp)
.L4547:
	movl	%r15d, %edi
	movq	(%rsp), %rsi
	movq	%r12, %rdx
.L4609:
	call	build1
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	movq	%rax, %rdi
	jmp	fold
.L4438:
	movq	integer_types+48(%rip), %rdi
	jmp	.L4604
.L4436:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L4439
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L4439
	movq	global_trees+192(%rip), %rdx
	cmpq	%rdx, 128(%r14)
.L4639:
	je	.L4666
.L4439:
	cmpl	$5, %r12d
	je	.L4667
.L4567:
	movq	%rbp, %r12
	jmp	.L4055
.L4667:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L4606:
	movq	global_trees(%rip), %r12
	jmp	.L4055
.L4666:
	movq	global_trees+200(%rip), %rdi
	jmp	.L4604
	.p2align 6,,7
.L4665:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L4431
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L4431
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L4437
	testb	$32, 17(%r14)
.L4636:
	jne	.L4438
	jmp	.L4437
	.p2align 6,,7
.L4664:
	movq	integer_types+40(%rip), %rbx
	movzwl	60(%r14), %edx
	movl	flag_traditional(%rip), %r12d
	movzwl	60(%rbx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r12d, %r12d
	jne	.L4430
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L4429
.L4430:
	testb	$32, 17(%r14)
.L4632:
	movl	$1, %eax
	cmovne	%eax, %esi
.L4429:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L4604
.L4423:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L4422
.L4663:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%rsi)
	jne	.L4418
	.p2align 4,,7
.L4101:
	movzbl	16(%rsi), %ebx
	movq	%rsi, %rbp
	cmpb	$116, %bl
	jne	.L4668
.L4571:
	movq	32(%rbp), %rsi
	jmp	.L4101
.L4668:
	cmpb	$115, %bl
	jne	.L4418
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r9
	cmpq	%r9, 8(%rsi)
	je	.L4101
	jmp	.L4418
.L4662:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L4089
	cmpb	$51, 48(%rbp)
	je	.L4089
	cmpq	$0, current_function_decl(%rip)
	je	.L4095
	movzbl	17(%rbp), %ecx
	andb	$24, %cl
	cmpb	$16, %cl
	je	.L4669
.L4095:
	movq	%rbp, %rsi
.L4096:
	movq	%rsi, %rbp
	movq	8(%rsi), %r14
.L4592:
	movzbl	16(%rbp), %ebx
	jmp	.L4089
.L4669:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L4095
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L4095
	testb	$2, 17(%rax)
	je	.L4095
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L4096
	jmp	.L4095
	.p2align 6,,7
.L4661:
	movq	104(%rbp), %rbp
	jmp	.L4592
.L4061:
	movzbl	16(%rbp), %ebx
	movl	%r12d, %edx
	movq	%rbp, %rdi
	xorl	%r12d, %r12d
	cmpb	$116, %bl
	je	.L4569
	cmpb	$115, %bl
	je	.L4670
.L4384:
	movzbl	%bl, %r9d 
	movzbl	tree_code_type(%r9), %eax
	cmpb	$60, %al
	je	.L4390
	cmpb	$49, %al
	je	.L4390
	cmpb	$50, %al
	je	.L4390
	cmpb	$101, %al
	je	.L4390
.L4389:
	cmpl	$23, %edx
	je	.L4619
	cmpl	$18, %edx
	jne	.L4567
	movzbl	%bl, %edi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%rcx), %r13
	cmpb	$114, %al
	je	.L4395
	cmpb	$100, %al
	je	.L4395
.L4394:
	movzbl	17(%rcx), %r8d
	movl	$1, %r9d
	xorl	%esi, %esi
	movl	%r8d, %r10d
	movl	%r8d, %edi
	shrb	$3, %r10b
	shrb	$4, %dil
	andl	$1, %r10d
	andl	%edi, %r9d
	movzbl	16(%rcx), %edi
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rcx), %r10d
	movl	%r10d, %r14d
	shrb	$5, %r14b
	andl	$1, %r14d
	sall	$2, %r14d
	orl	%r14d, %r9d
	cmpb	$20, %dil
	je	.L4671
.L4398:
	leal	0(,%rsi,8), %ecx
	orl	%ecx, %r9d
	jne	.L4397
	testl	%edx, %edx
	jne	.L4397
	testl	%r11d, %r11d
	je	.L4396
.L4397:
	movl	%r8d, %r14d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r14b
	movl	%r10d, %ebx
	movl	%r8d, %r9d
	andl	%r14d, %esi
	andl	$1, %ebx
	andl	$1, %r9d
	sall	$2, %ebx
	xorl	%ecx, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ebx, %esi
	cmpb	$20, %dil
	je	.L4672
.L4400:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbp), %ebx
	movq	%rax, %r13
.L4396:
	cmpb	$41, %bl
	je	.L4673
	cmpb	$47, %bl
	je	.L4620
	xorl	%ebx, %ebx
	testl	%r12d, %r12d
	je	.L4674
.L4403:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L4404
	testl	%ebx, %ebx
	movq	%rbp, %r12
	je	.L4055
.L4404:
	movq	%r13, %rdi
.L4631:
	call	build_pointer_type
	cmpb	$34, 16(%rbp)
	movq	%rax, %rbx
	je	.L4675
	movl	$121, %edi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L4605
.L4675:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbp, %rdx
	call	build1
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	mark_addressable
	testl	%eax, %eax
	je	.L4606
	movq	%rbp, %rdi
	call	staticp
	movzbl	17(%r12), %ebp
	movl	%eax, %r11d
	andb	$1, %r11b
	addb	%r11b, %r11b
	andb	$-4, %bpl
	orb	%r11b, %bpl
	movb	%bpl, 17(%r12)
	jmp	.L4055
	.p2align 6,,7
.L4674:
	movq	%rbp, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebx
	jmp	.L4403
.L4620:
	movq	40(%rbp), %rdi
	call	default_conversion
	movq	32(%rbp), %rdx
	movl	$47, %edi
	movq	8(%rax), %rsi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	build
	jmp	.L4607
.L4673:
	movq	72(%r13), %rdi
.L4629:
	movq	32(%rbp), %rsi
	jmp	.L4605
.L4672:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L4400
.L4671:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L4398
.L4395:
	movzbl	17(%rbp), %esi
	movl	$1, %r11d
	movl	%esi, %edx
	shrb	$3, %sil
	shrb	$4, %dl
	andl	%esi, %r11d
	andl	$1, %edx
	jmp	.L4394
.L4619:
	movl	$121, %edi
	movq	%rbp, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L4607
.L4390:
	movl	24(%rdi), %eax
	movl	%eax, 24(%rbp)
	jmp	.L4389
.L4670:
	movq	32(%rbp), %rsi
	cmpq	%rcx, 8(%rsi)
	jne	.L4384
	.p2align 4,,7
.L4067:
	cmpb	$116, %bl
	movl	$1, %eax
	movq	%rsi, %rbp
	movzbl	16(%rsi), %ebx
	cmove	%eax, %r12d
	cmpb	$116, %bl
	jne	.L4676
.L4569:
	movq	32(%rbp), %rsi
	jmp	.L4067
.L4676:
	cmpb	$115, %bl
	jne	.L4384
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r8
	cmpq	%r8, 8(%rsi)
	je	.L4067
	jmp	.L4384
	.p2align 6,,7
.L4597:
	xorl	%eax, %eax
	call	error
	.p2align 4,,7
.L4608:
	movq	global_trees(%rip), %r12
.L4052:
	addq	$8, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L4121:
	leal	-6(%rbx), %r10d
	movl	$.LC25, %edi
	cmpl	$2, %r10d
	ja	.L4597
	testl	%r13d, %r13d
	jne	.L4567
	movzbl	16(%rcx), %r12d
	cmpl	$23, %r12d
	je	.L4126
	cmpl	$18, %r12d
	je	.L4126
	movzbl	16(%rsi), %ebx
	cmpb	$32, %bl
	je	.L4677
	movl	optimize(%rip), %r13d
	testl	%r13d, %r13d
	je	.L4153
	cmpb	$34, %bl
	je	.L4678
.L4153:
	cmpb	$116, %bl
	movq	%rbp, %rdx
	je	.L4575
	cmpb	$115, %bl
	jne	.L4418
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r8
	cmpq	%r8, 8(%rsi)
	jne	.L4418
	.p2align 4,,7
.L4165:
	movzbl	16(%rsi), %ebx
	movq	%rsi, %rbp
	cmpb	$116, %bl
	jne	.L4679
.L4575:
	movq	32(%rbp), %rsi
	jmp	.L4165
.L4679:
	cmpb	$115, %bl
	jne	.L4418
	movq	32(%rsi), %rsi
	movq	8(%rbp), %rcx
	cmpq	%rcx, 8(%rsi)
	je	.L4165
	jmp	.L4418
.L4678:
	movl	pedantic(%rip), %edx
	testl	%edx, %edx
	jne	.L4153
	cmpb	$51, 48(%rsi)
	je	.L4153
	cmpq	$0, current_function_decl(%rip)
	je	.L4159
	movzbl	17(%rsi), %ebx
	andb	$24, %bl
	cmpb	$16, %bl
	je	.L4680
.L4159:
	movq	%rbp, %rsi
.L4160:
	movq	%rsi, %rbp
	movq	8(%rsi), %r14
.L4593:
	movzbl	16(%rbp), %ebx
	jmp	.L4153
.L4680:
	movq	104(%rsi), %rax
	testq	%rax, %rax
	je	.L4159
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L4159
	testb	$2, 17(%rax)
	je	.L4159
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L4160
	jmp	.L4159
	.p2align 6,,7
.L4677:
	movq	104(%rsi), %rbp
	jmp	.L4593
.L4126:
	movzbl	16(%rbp), %ebx
	movl	%r12d, %edx
	movq	%rbp, %rdi
	xorl	%r12d, %r12d
	cmpb	$116, %bl
	je	.L4573
	cmpb	$115, %bl
	jne	.L4384
	movq	32(%rbp), %rsi
	cmpq	%rcx, 8(%rsi)
	jne	.L4384
	.p2align 4,,7
.L4132:
	cmpb	$116, %bl
	movl	$1, %eax
	movq	%rsi, %rbp
	movzbl	16(%rsi), %ebx
	cmove	%eax, %r12d
	cmpb	$116, %bl
	jne	.L4681
.L4573:
	movq	32(%rbp), %rsi
	jmp	.L4132
.L4681:
	cmpb	$115, %bl
	jne	.L4384
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r11
	cmpq	%r11, 8(%rsi)
	je	.L4132
	jmp	.L4384
	.p2align 6,,7
.L4313:
	leal	-6(%rbx), %esi
	movl	$.LC28, %edi
	cmpl	$2, %esi
	ja	.L4597
	testl	%r13d, %r13d
	jne	.L4567
	movzbl	16(%rcx), %r12d
	cmpl	$23, %r12d
	je	.L4318
	cmpl	$18, %r12d
	je	.L4318
	movzbl	16(%rbp), %ebx
	cmpb	$32, %bl
	je	.L4682
	movl	optimize(%rip), %ecx
	testl	%ecx, %ecx
	je	.L4345
	cmpb	$34, %bl
	je	.L4683
.L4345:
	cmpb	$116, %bl
	movq	%rbp, %rdx
	je	.L4587
	cmpb	$115, %bl
	jne	.L4418
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r8
	cmpq	%r8, 8(%rsi)
	jne	.L4418
	.p2align 4,,7
.L4357:
	movzbl	16(%rsi), %ebx
	movq	%rsi, %rbp
	cmpb	$116, %bl
	jne	.L4684
.L4587:
	movq	32(%rbp), %rsi
	jmp	.L4357
.L4684:
	cmpb	$115, %bl
	jne	.L4418
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r13
	cmpq	%r13, 8(%rsi)
	je	.L4357
	jmp	.L4418
.L4683:
	movl	pedantic(%rip), %edx
	testl	%edx, %edx
	jne	.L4345
	cmpb	$51, 48(%rbp)
	je	.L4345
	cmpq	$0, current_function_decl(%rip)
	je	.L4351
	movzbl	17(%rbp), %ebx
	andb	$24, %bl
	cmpb	$16, %bl
	je	.L4685
.L4351:
	movq	%rbp, %rsi
.L4352:
	movq	%rsi, %rbp
	movq	8(%rsi), %r14
.L4595:
	movzbl	16(%rbp), %ebx
	jmp	.L4345
.L4685:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L4351
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L4351
	testb	$2, 17(%rax)
	je	.L4351
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L4352
	jmp	.L4351
	.p2align 6,,7
.L4682:
	movq	104(%rbp), %rbp
	jmp	.L4595
.L4318:
	movzbl	16(%rbp), %ebx
	movl	%r12d, %edx
	movq	%rbp, %rdi
	xorl	%r12d, %r12d
	cmpb	$116, %bl
	je	.L4585
	cmpb	$115, %bl
	jne	.L4384
	movq	32(%rbp), %rsi
	cmpq	%rcx, 8(%rsi)
	jne	.L4384
	.p2align 4,,7
.L4324:
	cmpb	$116, %bl
	movl	$1, %eax
	movq	%rsi, %rbp
	movzbl	16(%rsi), %ebx
	cmove	%eax, %r12d
	cmpb	$116, %bl
	jne	.L4686
.L4585:
	movq	32(%rbp), %rsi
	jmp	.L4324
.L4686:
	cmpb	$115, %bl
	jne	.L4384
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r14
	cmpq	%r14, 8(%rsi)
	je	.L4324
	jmp	.L4384
	.p2align 6,,7
.L4185:
	cmpl	$8, %ebx
	je	.L4687
	cmpl	$6, %ebx
	movl	$.LC27, %edi
	jne	.L4597
	testl	%r13d, %r13d
	jne	.L4567
	movzbl	16(%rcx), %r12d
	cmpl	$23, %r12d
	je	.L4254
	cmpl	$18, %r12d
	je	.L4254
	movzbl	16(%rsi), %ebx
	cmpb	$32, %bl
	je	.L4688
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L4281
	cmpb	$34, %bl
	je	.L4689
.L4281:
	cmpb	$116, %bl
	movq	%rbp, %rdx
	je	.L4583
	cmpb	$115, %bl
	jne	.L4418
	movq	32(%rbp), %rsi
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%rsi)
	jne	.L4418
.L4293:
	movzbl	16(%rsi), %ebx
	movq	%rsi, %rbp
	cmpb	$116, %bl
	jne	.L4690
.L4583:
	movq	32(%rbp), %rsi
	jmp	.L4293
.L4690:
	cmpb	$115, %bl
	jne	.L4418
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r11
	cmpq	%r11, 8(%rsi)
	je	.L4293
	jmp	.L4418
.L4689:
	movl	pedantic(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L4281
	cmpb	$51, 48(%rsi)
	je	.L4281
	cmpq	$0, current_function_decl(%rip)
	je	.L4287
	movzbl	17(%rsi), %r9d
	andb	$24, %r9b
	cmpb	$16, %r9b
	je	.L4691
.L4287:
	movq	%rbp, %rsi
.L4288:
	movq	%rsi, %rbp
	movq	8(%rsi), %r14
.L4594:
	movzbl	16(%rbp), %ebx
	jmp	.L4281
.L4691:
	movq	104(%rsi), %rax
	testq	%rax, %rax
	je	.L4287
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L4287
	testb	$2, 17(%rax)
	je	.L4287
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L4288
	jmp	.L4287
	.p2align 6,,7
.L4688:
	movq	104(%rsi), %rbp
	jmp	.L4594
.L4254:
	movzbl	16(%rbp), %ebx
	movl	%r12d, %edx
	movq	%rbp, %rdi
	xorl	%r12d, %r12d
	cmpb	$116, %bl
	je	.L4581
	cmpb	$115, %bl
	jne	.L4384
	movq	32(%rbp), %rsi
	cmpq	%rcx, 8(%rsi)
	jne	.L4384
.L4260:
	cmpb	$116, %bl
	movl	$1, %eax
	movq	%rsi, %rbp
	movzbl	16(%rsi), %ebx
	cmove	%eax, %r12d
	cmpb	$116, %bl
	jne	.L4692
.L4581:
	movq	32(%rbp), %rsi
	jmp	.L4260
.L4692:
	cmpb	$115, %bl
	jne	.L4384
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r13
	cmpq	%r13, 8(%rsi)
	je	.L4260
	jmp	.L4384
.L4687:
	movl	pedantic(%rip), %r12d
	movl	$126, %r15d
	testl	%r12d, %r12d
	jne	.L4693
.L4187:
	testl	%r13d, %r13d
	jne	.L4567
	movq	8(%rbp), %r14
	movzbl	16(%r14), %r12d
	movq	%r14, %r13
	cmpl	$23, %r12d
	je	.L4190
	cmpl	$18, %r12d
	je	.L4190
	movzbl	16(%rbp), %ebx
	cmpb	$32, %bl
	je	.L4694
	movl	optimize(%rip), %r10d
	testl	%r10d, %r10d
	je	.L4217
	cmpb	$34, %bl
	je	.L4695
.L4217:
	cmpb	$116, %bl
	movq	%rbp, %rdx
	je	.L4579
	cmpb	$115, %bl
	je	.L4696
.L4226:
	movzbl	%bl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L4231
	cmpb	$49, %al
	je	.L4231
	cmpb	$50, %al
	je	.L4231
	cmpb	$101, %al
	je	.L4231
.L4230:
	cmpl	$10, %r12d
	je	.L4697
	cmpb	$39, %bl
	je	.L4698
.L4239:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L4244
	testb	$32, 17(%r13)
	je	.L4437
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L4438
	movzwl	60(%r13), %edx
	jmp	.L4635
.L4244:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L4439
	movl	flag_allow_single_precision(%rip), %edx
	testl	%edx, %edx
	jne	.L4439
	movq	global_trees+192(%rip), %r8
	cmpq	%r8, 128(%r13)
	jmp	.L4639
.L4698:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L4239
	movq	integer_types+40(%rip), %rcx
	movq	40(%rdx), %rdi
	movzwl	60(%rcx), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L4239
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L4437
	testb	$32, 17(%r13)
	jmp	.L4636
	.p2align 6,,7
.L4697:
	movq	integer_types+40(%rip), %rbx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r12d
	movzwl	60(%rbx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r12d, %r12d
	jne	.L4238
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L4429
.L4238:
	testb	$32, 17(%r13)
	jmp	.L4632
.L4231:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L4230
.L4696:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%rsi)
	jne	.L4226
.L4229:
	movzbl	16(%rsi), %ebx
	movq	%rsi, %rbp
	cmpb	$116, %bl
	jne	.L4699
.L4579:
	movq	32(%rbp), %rsi
	jmp	.L4229
.L4699:
	cmpb	$115, %bl
	jne	.L4226
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r11
	cmpq	%r11, 8(%rsi)
	je	.L4229
	jmp	.L4226
.L4695:
	movl	pedantic(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L4221
	cmpb	$51, 48(%rbp)
	je	.L4221
	cmpq	$0, current_function_decl(%rip)
	je	.L4223
	movzbl	17(%rbp), %r14d
	andb	$24, %r14b
	cmpb	$16, %r14b
	je	.L4700
.L4223:
	movq	%rbp, %rsi
.L4224:
	movq	%rsi, %rbp
	movq	8(%rsi), %r14
	movzbl	16(%rsi), %ebx
.L4221:
	movq	%r14, %r13
	jmp	.L4217
.L4700:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L4223
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L4223
	testb	$2, 17(%rax)
	je	.L4223
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L4224
	jmp	.L4223
	.p2align 6,,7
.L4694:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %ebx
	jmp	.L4217
.L4190:
	movzbl	16(%rbp), %ebx
	movl	%r12d, %ecx
	movq	%rbp, %rdx
	xorl	%r12d, %r12d
	cmpb	$116, %bl
	je	.L4577
	cmpb	$115, %bl
	je	.L4701
.L4192:
	movzbl	%bl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L4198
	cmpb	$49, %al
	je	.L4198
	cmpb	$50, %al
	je	.L4198
	cmpb	$101, %al
	je	.L4198
.L4197:
	cmpl	$23, %ecx
	je	.L4619
	cmpl	$18, %ecx
	jne	.L4567
	movzbl	%bl, %edi 
	xorl	%edx, %edx
	xorl	%r10d, %r10d
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%r13), %r14
	cmpb	$114, %al
	je	.L4203
	cmpb	$100, %al
	je	.L4203
.L4202:
	movzbl	17(%r13), %r8d
	movzbl	62(%r13), %r9d
	movl	$1, %esi
	movl	%r8d, %edi
	movl	%r8d, %ecx
	movl	%r9d, %r11d
	shrb	$4, %dil
	shrb	$3, %cl
	shrb	$5, %r11b
	andl	%edi, %esi
	andl	$1, %ecx
	andl	$1, %r11d
	movzbl	16(%r13), %edi
	addl	%ecx, %ecx
	sall	$2, %r11d
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	orl	%r11d, %esi
	cmpb	$20, %dil
	je	.L4702
.L4206:
	leal	0(,%rcx,8), %r13d
	orl	%r13d, %esi
	jne	.L4205
	testl	%edx, %edx
	jne	.L4205
	testl	%r10d, %r10d
	je	.L4204
.L4205:
	movl	%r8d, %ecx
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %cl
	movl	%r9d, %ebx
	movl	%r8d, %r11d
	andl	%ecx, %esi
	andl	$1, %ebx
	andl	$1, %r11d
	sall	$2, %ebx
	xorl	%ecx, %ecx
	addl	%r11d, %r11d
	orl	%r11d, %esi
	orl	%ebx, %esi
	cmpb	$20, %dil
	je	.L4703
.L4208:
	leal	0(,%rcx,8), %r8d
	movq	%r14, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r10,%r10), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbp), %ebx
	movq	%rax, %r14
.L4204:
	cmpb	$41, %bl
	je	.L4704
	cmpb	$47, %bl
	je	.L4620
	xorl	%ebx, %ebx
	testl	%r12d, %r12d
	je	.L4705
.L4211:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L4212
	testl	%ebx, %ebx
	movq	%rbp, %r12
	je	.L4055
.L4212:
	movq	%r14, %rdi
	jmp	.L4631
.L4705:
	movq	%rbp, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebx
	jmp	.L4211
.L4704:
	movq	72(%r14), %rdi
	jmp	.L4629
.L4703:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L4208
.L4702:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L4206
.L4203:
	movzbl	17(%rbp), %r9d
	movl	$1, %r10d
	movl	%r9d, %edx
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	%r9d, %r10d
	andl	$1, %edx
	jmp	.L4202
.L4198:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L4197
.L4701:
	movq	32(%rbp), %rsi
	cmpq	%r14, 8(%rsi)
	jne	.L4192
.L4196:
	cmpb	$116, %bl
	movl	$1, %eax
	movq	%rsi, %rbp
	movzbl	16(%rsi), %ebx
	cmove	%eax, %r12d
	cmpb	$116, %bl
	jne	.L4706
.L4577:
	movq	32(%rbp), %rsi
	jmp	.L4196
.L4706:
	cmpb	$115, %bl
	jne	.L4192
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r14
	cmpq	%r14, 8(%rsi)
	je	.L4196
	jmp	.L4192
.L4693:
	movl	$.LC26, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L4187
	.p2align 6,,7
.L4441:
	leal	-6(%rbx), %r15d
	cmpl	$1, %r15d
	jbe	.L4442
	cmpl	$13, %ebx
	je	.L4442
	cmpl	$8, %ebx
	je	.L4442
	cmpl	$18, %ebx
	je	.L4442
	cmpl	$23, %ebx
	movl	$.LC30, %edi
	jne	.L4597
.L4442:
	movq	%rbp, %rdi
	call	truthvalue_conversion
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	movq	%rax, %rdi
	jmp	invert_truthvalue
.L4528:
	movzbl	16(%rsi), %eax
	cmpb	$41, %al
	je	.L4707
	cmpb	$43, %al
	je	.L4708
	movl	%r13d, %edx
	call	unary_complex_lvalue
	testq	%rax, %rax
	movq	%rax, %r12
	jne	.L4052
	cmpl	$23, %ebx
	je	.L4534
	testl	%r13d, %r13d
	je	.L4709
.L4534:
	movzbq	16(%rbp), %r12
	movq	8(%rbp), %rdi
	movzbl	tree_code_type(%r12), %eax
	cmpb	$100, %al
	je	.L4537
	cmpb	$114, %al
	je	.L4537
.L4536:
	call	build_pointer_type
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	mark_addressable
	testl	%eax, %eax
	je	.L4608
	cmpb	$39, 16(%rbp)
	je	.L4710
	movl	%r15d, %edi
	movq	%r12, %rsi
	movq	%rbp, %rdx
	call	build1
.L4603:
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	staticp
	testl	%eax, %eax
	je	.L4052
	cmpb	$30, 16(%rbp)
	je	.L4711
.L4544:
	orb	$2, 17(%r12)
	jmp	.L4052
.L4711:
	cmpq	$0, 80(%rbp)
	je	.L4544
	jmp	.L4052
.L4710:
	movq	40(%rbp), %r14
	movq	32(%rbp), %rsi
	movl	$121, %edi
	movl	%r13d, %edx
	call	build_unary_op
	testb	$2, 53(%r14)
	movq	%rax, %rsi
	jne	.L4712
	movq	%r12, %rdi
	call	convert
	movq	%r14, %rdi
	movq	%rax, %r15
	call	byte_position
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	convert
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%rax, %rcx
	movl	$59, %edi
	xorl	%eax, %eax
	call	build
	movq	%rax, %rdi
	call	fold
	jmp	.L4603
.L4712:
	movq	72(%r14), %r13
	movl	$.LC41, %edi
	xorl	%eax, %eax
	movq	32(%r13), %rsi
	call	error
	jmp	.L4608
	.p2align 6,,7
.L4537:
	movzbl	17(%rbp), %edx
	testb	$24, %dl
	je	.L4536
	testb	$16, %dl
	setne	%bl
	movzbl	%bl, %esi
	movl	%esi, %r14d
	orl	$2, %r14d
	andb	$8, %dl
	cmovne	%r14d, %esi
	call	c_build_qualified_type
	movq	%rax, %rdi
	jmp	.L4536
.L4709:
	movq	%rbp, %rdi
	movl	$.LC40, %esi
	call	lvalue_or_else
	testl	%eax, %eax
	je	.L4608
	jmp	.L4534
.L4708:
	movq	32(%rsi), %rdi
	call	mark_addressable
	testl	%eax, %eax
	je	.L4608
	movq	32(%rbp), %rsi
	movq	40(%rbp), %rdx
	movl	$59, %edi
	addq	$8, %rsp
	movl	$1, %ecx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	build_binary_op
.L4707:
	movq	32(%rsi), %rdi
	call	lvalue_p
	testl	%eax, %eax
	jne	.L4713
.L4530:
	movq	32(%rbp), %r12
	jmp	.L4052
.L4713:
	movq	32(%rbp), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	non_lvalue
	.p2align 6,,7
.L4377:
	leal	-6(%rbx), %r12d
	movl	$.LC29, %edi
	cmpl	$2, %r12d
	ja	.L4597
	testl	%r13d, %r13d
	jne	.L4567
	movzbl	16(%rcx), %r12d
	cmpl	$23, %r12d
	je	.L4382
	cmpl	$18, %r12d
	je	.L4382
	movzbl	16(%rsi), %ebx
	cmpb	$32, %bl
	je	.L4714
	movl	optimize(%rip), %r13d
	testl	%r13d, %r13d
	je	.L4409
	cmpb	$34, %bl
	je	.L4715
.L4409:
	cmpb	$116, %bl
	movq	%rbp, %rdx
	je	.L4591
	cmpb	$115, %bl
	jne	.L4418
	movq	32(%rbp), %rsi
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%rsi)
	jne	.L4418
	.p2align 4,,7
.L4421:
	movzbl	16(%rsi), %ebx
	movq	%rsi, %rbp
	cmpb	$116, %bl
	jne	.L4716
.L4591:
	movq	32(%rbp), %rsi
	jmp	.L4421
.L4716:
	cmpb	$115, %bl
	jne	.L4418
	movq	32(%rsi), %r9
	movq	8(%rbp), %rcx
	cmpq	%rcx, 8(%r9)
	movq	%r9, %rsi
	je	.L4421
	jmp	.L4418
.L4715:
	movl	pedantic(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L4409
	cmpb	$51, 48(%rsi)
	je	.L4409
	cmpq	$0, current_function_decl(%rip)
	je	.L4415
	movzbl	17(%rsi), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L4717
.L4415:
	movq	%rbp, %rsi
.L4416:
	movq	%rsi, %rbp
	movq	8(%rsi), %r14
.L4596:
	movzbl	16(%rbp), %ebx
	jmp	.L4409
.L4717:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L4415
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L4415
	testb	$2, 17(%rax)
	je	.L4415
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L4416
	jmp	.L4415
	.p2align 6,,7
.L4714:
	movq	104(%rsi), %rbp
	jmp	.L4596
.L4382:
	movzbl	16(%rbp), %ebx
	movl	%r12d, %edx
	movq	%rbp, %rdi
	xorl	%r12d, %r12d
	cmpb	$116, %bl
	je	.L4589
	cmpb	$115, %bl
	jne	.L4384
	movq	32(%rbp), %rsi
	cmpq	%rcx, 8(%rsi)
	jne	.L4384
	.p2align 4,,7
.L4388:
	cmpb	$116, %bl
	movl	$1, %eax
	movq	%rsi, %rbp
	movzbl	16(%rsi), %ebx
	cmove	%eax, %r12d
	cmpb	$116, %bl
	jne	.L4718
.L4589:
	movq	32(%rbp), %rsi
	jmp	.L4388
.L4718:
	cmpb	$115, %bl
	jne	.L4384
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r10
	cmpq	%r10, 8(%rsi)
	je	.L4388
	jmp	.L4384
	.p2align 6,,7
.L4444:
	cmpb	$27, 16(%rsi)
	je	.L4530
	cmpb	$8, 16(%rcx)
	je	.L4719
	movq	%rsi, %r12
	jmp	.L4052
.L4719:
	movl	$127, %edi
.L4627:
	movq	8(%rcx), %rsi
	movq	%rbp, %rdx
	jmp	.L4609
.L4449:
	cmpb	$27, 16(%rsi)
	je	.L4720
	cmpb	$8, 16(%rcx)
	je	.L4721
	movq	global_trees+88(%rip), %rsi
	movq	%rcx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	convert
.L4721:
	movl	$128, %edi
	jmp	.L4627
.L4720:
	movq	40(%rsi), %r12
	jmp	.L4052
.L4457:
	xorl	%edx, %edx
	call	unary_complex_lvalue
	testq	%rax, %rax
	movq	%rax, %r12
	jne	.L4052
	cmpl	$8, %ebx
	je	.L4722
	cmpl	$13, %ebx
	je	.L4461
	cmpl	$6, %ebx
	je	.L4461
	cmpl	$7, %ebx
	je	.L4461
	cmpl	$130, %r15d
	je	.L4463
	cmpl	$132, %r15d
	movl	$.LC33, %edi
	jne	.L4597
.L4463:
	movl	$.LC32, %edi
	jmp	.L4597
.L4461:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	movq	8(%rbp), %r12
	call	get_unwidened
	cmpl	$13, %ebx
	movq	%rax, %rbp
	movq	8(%rax), %r13
	je	.L4723
	movq	global_trees+96(%rip), %rsi
.L4483:
	movq	%r13, %rdi
	call	convert
	movq	%rax, %r14
.L4510:
	movzbl	16(%rbp), %eax
	cmpl	$72, %eax
	jb	.L4508
	cmpl	$76, %eax
	jbe	.L4494
	subl	$114, %eax
	cmpl	$1, %eax
	ja	.L4508
.L4494:
	movl	$114, %edi
	call	pedantic_lvalue_warning
	movq	32(%rbp), %rdi
	movq	8(%rbp), %rcx
	movq	8(%rdi), %rsi
	movzbl	16(%rsi), %r9d
	cmpb	%r9b, 16(%rcx)
	jne	.L4495
	movzbl	61(%rcx), %eax
	movzbl	61(%rsi), %r8d
	andb	$-2, %al
	andb	$-2, %r8b
	cmpb	%r8b, %al
	jne	.L4495
	movq	%rdi, %rbp
	jmp	.L4510
.L4495:
	cmpb	$11, 16(%rcx)
	je	.L4724
	movq	%rbp, %rdi
	call	stabilize_reference
	leal	-129(%r15), %edi
	cmpl	$1, %edi
	movq	%rax, %rbx
	movq	%rax, %rbp
	ja	.L4725
.L4500:
	cmpl	$130, %r15d
	je	.L4506
	cmpl	$132, %r15d
	movl	$60, %edi
	je	.L4506
.L4505:
	movq	%r14, %rcx
	movq	%r13, %rsi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	call	build
	movl	$115, %esi
	movq	%rbx, %rdi
	orb	$1, 17(%rax)
	movq	%rax, %rdx
	call	build_modify_expr
	movq	%rbp, %rcx
	movq	8(%rbx), %rsi
	movq	%rax, %rdx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
.L4602:
	orb	$1, 18(%rax)
	movq	%rax, %r12
	jmp	.L4052
.L4506:
	movl	$59, %edi
	jmp	.L4505
.L4725:
	movq	%rax, %rdi
	call	save_expr
	movq	%rax, %rbp
	jmp	.L4500
.L4724:
	movl	%r15d, %edi
	movq	%rbp, %rsi
	call	boolean_increment
	jmp	.L4602
.L4508:
	cmpl	$130, %r15d
	je	.L4517
	cmpl	$132, %r15d
	movl	$.LC37, %esi
	je	.L4517
.L4516:
	movq	%rbp, %rdi
	call	lvalue_or_else
	testl	%eax, %eax
	je	.L4608
	testb	$16, 17(%rbp)
	je	.L4518
	cmpl	$130, %r15d
	je	.L4524
	cmpl	$132, %r15d
	movl	$.LC39, %esi
	je	.L4524
.L4523:
	movq	%rbp, %rdi
	call	readonly_warning
.L4518:
	movq	8(%rbp), %rsi
	cmpb	$11, 16(%rsi)
	je	.L4726
	movl	%r15d, %edi
	movq	%rbp, %rdx
	movq	%r14, %rcx
	xorl	%eax, %eax
	call	build
.L4526:
	orb	$1, 17(%rax)
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	convert
	movzbl	16(%rax), %r11d
	movq	%rax, %r12
	cmpl	%r15d, %r11d
	je	.L4052
	orb	$4, 18(%rax)
	jmp	.L4052
.L4726:
	movl	%r15d, %edi
	movq	%rbp, %rsi
	call	boolean_increment
	jmp	.L4526
.L4524:
	movl	$.LC38, %esi
	jmp	.L4523
.L4517:
	movl	$.LC36, %esi
	jmp	.L4516
.L4723:
	movq	8(%r12), %rbx
	cmpq	$0, 32(%rbx)
	movq	%rbx, %rax
	jne	.L4466
	cmpb	$5, 16(%rbx)
	je	.L4466
	cmpl	$130, %r15d
	je	.L4468
	cmpl	$132, %r15d
	movl	$.LC35, %edi
	je	.L4468
.L4600:
	xorl	%eax, %eax
	call	error
.L4599:
	movq	8(%r12), %rbx
.L4470:
	movzbl	16(%rbx), %edx
	movzbl	%dl, %eax
	cmpl	$23, %eax
	je	.L4601
	cmpl	$5, %eax
	je	.L4601
	testl	%eax, %eax
	je	.L4601
	cmpq	$0, 32(%rbx)
	jne	.L4480
	cmpb	$5, %dl
	je	.L4480
	movl	$.LC23, %edi
	xorl	%eax, %eax
	call	error
.L4601:
	movq	global_trees+128(%rip), %rsi
	jmp	.L4483
.L4480:
	movq	integer_types(%rip), %rcx
	xorl	%esi, %esi
	movzwl	60(%rcx), %edi
	shrq	$3, %rdi
	andl	$63, %edi
	call	size_int_wide
	movq	40(%rbx), %rsi
	movl	$63, %edi
	movq	%rax, %rdx
	call	size_binop
	movq	%rax, %rsi
	jmp	.L4483
.L4468:
	movl	$.LC34, %edi
	jmp	.L4600
.L4466:
	movl	pedantic(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L4472
	movl	warn_pointer_arith(%rip), %esi
	testl	%esi, %esi
	je	.L4470
.L4472:
	movzbl	16(%rax), %eax
	cmpb	$23, %al
	je	.L4473
	cmpb	$5, %al
	jne	.L4470
.L4473:
	cmpl	$130, %r15d
	je	.L4475
	cmpl	$132, %r15d
	movl	$.LC33, %edi
	je	.L4475
.L4598:
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L4599
.L4475:
	movl	$.LC32, %edi
	jmp	.L4598
	.p2align 6,,7
.L4722:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L4727
.L4460:
	movq	%rbp, %rdi
	call	stabilize_reference
	movl	$1, %edx
	movl	$127, %edi
	movq	%rax, %rsi
	movq	%rax, %r14
	call	build_unary_op
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rax, %rbx
	movl	$128, %edi
	call	build_unary_op
	movl	$1, %edx
	movq	%rbx, %rsi
	movl	%r15d, %edi
	movq	%rax, %rbp
	call	build_unary_op
	movq	%rbp, %rcx
	movq	8(%r14), %rsi
	addq	$8, %rsp
	movq	%rax, %rdx
	movl	$125, %edi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	xorl	%eax, %eax
	jmp	build
.L4727:
	movl	$.LC31, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L4460
.LFE3:
.Lfe3:
	.size	build_unary_op,.Lfe3-build_unary_op
	.align 2
	.p2align 4,,15
.globl lvalue_p
	.type	lvalue_p,@function
lvalue_p:
.LFB4:
	.p2align 4,,7
.L4733:
	movzbl	16(%rdi), %eax
	cmpl	$41, %eax
	je	.L4741
	cmpl	$41, %eax
	ja	.L4747
	cmpl	$36, %eax
	jbe	.L4751
	cmpl	$39, %eax
	jne	.L4745
.L4732:
	movq	32(%rdi), %rdi
	jmp	.L4733
.L4745:
	xorl	%edx, %edx
.L4728:
	movl	%edx, %eax
	ret
.L4751:
	cmpl	$34, %eax
	jae	.L4741
	testl	%eax, %eax
	je	.L4741
	cmpl	$29, %eax
.L4750:
	jne	.L4745
	movl	$1, %edx
	jmp	.L4728
.L4741:
	movq	8(%rdi), %rcx
	xorl	%edx, %edx
	movzbl	16(%rcx), %eax
	cmpb	$23, %al
	je	.L4728
	cmpb	$16, %al
	movl	$1, %eax
	cmovne	%eax, %edx
	jmp	.L4728
	.p2align 6,,7
.L4747:
	cmpl	$120, %eax
	je	.L4744
	cmpl	$120, %eax
	jbe	.L4753
	cmpl	$127, %eax
	jb	.L4745
	cmpl	$128, %eax
	jbe	.L4732
	cmpl	$170, %eax
	jmp	.L4750
.L4753:
	cmpl	$43, %eax
	je	.L4741
	cmpl	$52, %eax
	jne	.L4745
.L4744:
	movq	8(%rdi), %rcx
	xorl	%edx, %edx
	cmpb	$18, 16(%rcx)
	sete	%dl
	jmp	.L4728
.LFE4:
.Lfe4:
	.size	lvalue_p,.Lfe4-lvalue_p
	.section	.rodata.str1.1
.LC42:
	.string	"%s"
	.text
	.align 2
	.p2align 4,,15
.globl lvalue_or_else
	.type	lvalue_or_else,@function
lvalue_or_else:
.LFB5:
	subq	$24, %rsp
.LCFI21:
	movq	%rbx, 8(%rsp)
.LCFI22:
	movq	%rbp, 16(%rsp)
.LCFI23:
	movq	%rsi, %rbp
	call	lvalue_p
	testl	%eax, %eax
	movl	%eax, %ebx
	je	.L4756
.L4755:
	movl	%ebx, %eax
	movq	16(%rsp), %rbp
	movq	8(%rsp), %rbx
	addq	$24, %rsp
	ret
	.p2align 6,,7
.L4756:
	movl	$.LC42, %edi
	movq	%rbp, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L4755
.LFE5:
.Lfe5:
	.size	lvalue_or_else,.Lfe5-lvalue_or_else
	.align 2
	.p2align 4,,15
	.type	unary_complex_lvalue,@function
unary_complex_lvalue:
.LFB6:
	subq	$40, %rsp
.LCFI24:
	movq	%rbp, 16(%rsp)
.LCFI25:
	movq	%r12, 24(%rsp)
.LCFI26:
	movq	%r13, 32(%rsp)
.LCFI27:
	movq	%rbx, 8(%rsp)
.LCFI28:
	movl	%edi, %r12d
	movq	%rsi, %rbp
	movzbl	16(%rsi), %eax
	movl	%edx, %r13d
	cmpb	$47, %al
	je	.L4763
	cmpb	$51, %al
	je	.L4764
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	xorl	%eax, %eax
	movq	24(%rsp), %r12
	movq	32(%rsp), %r13
	addq	$40, %rsp
	ret
	.p2align 6,,7
.L4764:
	testl	%edx, %edx
	je	.L4765
.L4761:
	movq	8(%rbp), %rdx
	cmpb	$23, 16(%rdx)
	je	.L4762
	testl	%r13d, %r13d
	je	.L4766
.L4762:
	movq	40(%rbp), %rsi
	movl	%r12d, %edi
	movl	%r13d, %edx
	call	build_unary_op
	movl	%r13d, %edx
	movq	48(%rbp), %rsi
	movl	%r12d, %edi
	movq	%rax, %rbx
	call	build_unary_op
	movq	32(%rsp), %r13
	movq	24(%rsp), %r12
	movq	32(%rbp), %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	addq	$40, %rsp
	jmp	build_conditional_expr
.L4766:
	movl	$47, %edi
	call	pedantic_lvalue_warning
	jmp	.L4762
.L4765:
	movl	$51, %edi
	call	pedantic_lvalue_warning
	jmp	.L4761
	.p2align 6,,7
.L4763:
	movq	40(%rsi), %rsi
	xorl	%edx, %edx
	call	build_unary_op
	movq	8(%rbp), %rdx
	movq	%rax, %rbx
	cmpb	$23, 16(%rdx)
	je	.L4759
	testl	%r13d, %r13d
	je	.L4767
.L4759:
	movq	8(%rbx), %rsi
	movq	32(%rbp), %rdx
	movq	%rbx, %rcx
	movq	16(%rsp), %rbp
	movq	24(%rsp), %r12
	movl	$47, %edi
	movq	8(%rsp), %rbx
	movq	32(%rsp), %r13
	xorl	%eax, %eax
	addq	$40, %rsp
	jmp	build
.L4767:
	movl	$47, %edi
	call	pedantic_lvalue_warning
	jmp	.L4759
.LFE6:
.Lfe6:
	.size	unary_complex_lvalue,.Lfe6-unary_complex_lvalue
	.section	.rodata.str1.32
	.align 32
.LC45:
	.string	"ISO C forbids use of cast expressions as lvalues"
	.align 32
.LC43:
	.string	"ISO C forbids use of conditional expressions as lvalues"
	.align 32
.LC44:
	.string	"ISO C forbids use of compound expressions as lvalues"
	.text
	.align 2
	.p2align 4,,15
	.type	pedantic_lvalue_warning,@function
pedantic_lvalue_warning:
.LFB7:
	subq	$8, %rsp
.LCFI29:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L4768
	cmpl	$47, %edi
	je	.L4772
	cmpl	$51, %edi
	je	.L4776
	movl	$.LC45, %edi
	xorl	%eax, %eax
	call	pedwarn
.L4768:
	addq	$8, %rsp
	ret
	.p2align 6,,7
.L4776:
	movl	$.LC43, %edi
.L4775:
	xorl	%eax, %eax
	addq	$8, %rsp
	jmp	pedwarn
.L4772:
	movl	$.LC44, %edi
	jmp	.L4775
.LFE7:
.Lfe7:
	.size	pedantic_lvalue_warning,.Lfe7-pedantic_lvalue_warning
	.section	.rodata.str1.1
.LC46:
	.string	"%s of read-only member `%s'"
.LC48:
	.string	"%s of read-only location"
.LC47:
	.string	"%s of read-only variable `%s'"
	.text
	.align 2
	.p2align 4,,15
.globl readonly_warning
	.type	readonly_warning,@function
readonly_warning:
.LFB8:
	.p2align 4,,7
.L4785:
	movzbl	16(%rdi), %eax
	movq	%rdi, %rdx
	cmpb	$39, %al
	jne	.L4778
	movq	32(%rdi), %rdi
	movq	8(%rdi), %rcx
	testb	$16, 17(%rcx)
	jne	.L4785
	movq	40(%rdx), %rcx
	movl	$.LC46, %edi
	movq	72(%rcx), %rax
.L4786:
	movq	32(%rax), %rdx
	xorl	%eax, %eax
	jmp	pedwarn
.L4778:
	cmpb	$34, %al
	je	.L4787
	movl	$.LC48, %edi
	xorl	%eax, %eax
	jmp	pedwarn
.L4787:
	movq	72(%rdi), %rax
	movl	$.LC47, %edi
	jmp	.L4786
.LFE8:
.Lfe8:
	.size	readonly_warning,.Lfe8-readonly_warning
	.section	.rodata.str1.32
	.align 32
.LC49:
	.string	"cannot take address of bit-field `%s'"
	.align 32
.LC50:
	.string	"global register variable `%s' used in nested function"
	.align 32
.LC51:
	.string	"register variable `%s' used in nested function"
	.align 32
.LC53:
	.string	"cannot put object with volatile field into register"
	.align 32
.LC54:
	.string	"address of register variable `%s' requested"
	.align 32
.LC52:
	.string	"address of global register variable `%s' requested"
	.text
	.align 2
	.p2align 4,,15
.globl mark_addressable
	.type	mark_addressable,@function
mark_addressable:
.LFB9:
	pushq	%rbx
.LCFI30:
	movq	%rdi, %rbx
	.p2align 4,,7
.L4818:
	movzbl	16(%rbx), %eax
	cmpl	$43, %eax
	je	.L4798
	cmpl	$43, %eax
	ja	.L4815
	cmpl	$36, %eax
	jbe	.L4823
	cmpl	$39, %eax
	jne	.L4813
	movq	40(%rbx), %rax
	testb	$2, 53(%rax)
	jne	.L4825
.L4798:
	movq	32(%rbx), %rbx
	jmp	.L4818
.L4825:
	movq	72(%rax), %rax
	movl	$.LC49, %edi
.L4822:
	movq	32(%rax), %rsi
	xorl	%eax, %eax
	call	error
.L4820:
	xorl	%eax, %eax
.L4788:
	popq	%rbx
	ret
.L4813:
	movl	$1, %eax
	jmp	.L4788
.L4823:
	cmpl	$34, %eax
	jae	.L4804
	cmpl	$30, %eax
	je	.L4812
	cmpl	$32, %eax
	jne	.L4813
.L4804:
	movzbl	49(%rbx), %eax
	testb	$4, %al
	je	.L4805
	testb	$4, 17(%rbx)
	jne	.L4805
	testb	$2, %al
	je	.L4805
	testb	$8, 18(%rbx)
	je	.L4806
	movq	72(%rbx), %rax
	movl	$.LC50, %edi
	jmp	.L4822
.L4806:
	movq	72(%rbx), %rax
	movl	$.LC51, %edi
.L4819:
	movq	32(%rax), %rsi
	xorl	%eax, %eax
	call	pedwarn
.L4807:
	movq	%rbx, %rdi
	call	put_var_into_stack
.L4812:
	orb	$4, 17(%rbx)
	jmp	.L4813
.L4805:
	testb	$4, %al
	je	.L4807
	testb	$4, 17(%rbx)
	jne	.L4807
	testb	$8, 18(%rbx)
	jne	.L4826
	movq	8(%rbx), %rdx
	testb	$4, 19(%rdx)
	je	.L4810
	movl	$.LC53, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L4820
.L4810:
	movq	72(%rbx), %rax
	movl	$.LC54, %edi
	jmp	.L4819
.L4826:
	movq	72(%rbx), %rax
	movl	$.LC52, %edi
	jmp	.L4822
	.p2align 6,,7
.L4815:
	cmpl	$128, %eax
	ja	.L4817
	cmpl	$127, %eax
	jae	.L4798
	cmpl	$46, %eax
	je	.L4812
	cmpl	$121, %eax
	je	.L4798
	jmp	.L4813
.L4817:
	cmpl	$170, %eax
	je	.L4812
	jmp	.L4813
.LFE9:
.Lfe9:
	.size	mark_addressable,.Lfe9-mark_addressable
	.section	.rodata.str1.32
	.align 32
.LC55:
	.string	"signed and unsigned type in conditional expression"
	.align 32
.LC60:
	.string	"type mismatch in conditional expression"
	.align 32
.LC59:
	.string	"pointer/integer type mismatch in conditional expression"
	.align 32
.LC58:
	.string	"pointer type mismatch in conditional expression"
	.align 32
.LC57:
	.string	"ISO C forbids conditional expr between `void *' and function pointer"
	.align 32
.LC56:
	.string	"ISO C forbids conditional expr with only one void side"
	.text
	.align 2
	.p2align 4,,15
.globl build_conditional_expr
	.type	build_conditional_expr,@function
build_conditional_expr:
.LFB10:
	pushq	%r15
.LCFI31:
	pushq	%r14
.LCFI32:
	movq	%rdx, %r14
	pushq	%r13
.LCFI33:
	movq	%rsi, %r13
	pushq	%r12
.LCFI34:
	pushq	%rbp
.LCFI35:
	pushq	%rbx
.LCFI36:
	movq	%rdi, %rbx
	subq	$328, %rsp
.LCFI37:
	movq	$0, 8(%rsp)
	movq	%rsi, 320(%rsp)
	movq	%rdx, 312(%rsp)
	movq	8(%rdi), %r12
	movzbl	16(%r12), %ebp
	movq	%r12, %rax
	cmpl	$23, %ebp
	je	.L4829
	cmpl	$18, %ebp
	je	.L4829
	movzbl	16(%rdi), %ecx
	cmpb	$32, %cl
	je	.L6278
	movl	optimize(%rip), %r15d
	testl	%r15d, %r15d
	je	.L4855
	cmpb	$34, %cl
	je	.L6279
.L4855:
	cmpb	$116, %cl
	movq	%rbx, %rdx
	je	.L6164
	cmpb	$115, %cl
	je	.L6280
.L4864:
	movzbl	%cl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L4869
	cmpb	$49, %al
	je	.L4869
	cmpb	$50, %al
	je	.L4869
	cmpb	$101, %al
	je	.L4869
.L4868:
	cmpl	$10, %ebp
	je	.L6281
	cmpb	$39, %cl
	je	.L6282
.L4874:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L4877
	testb	$32, 17(%r12)
	je	.L4878
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L4879
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r12), %r9d
	movzwl	60(%rdx), %r12d
	andl	$511, %r9d
	andl	$511, %r12d
	cmpl	%r12d, %r9d
	je	.L4879
.L4878:
	movq	integer_types+40(%rip), %rdi
.L6182:
	movq	%rbx, %rsi
.L6183:
	call	convert
.L6185:
	movq	%rax, %rbp
.L4853:
	movq	%rbp, %rdi
	call	truthvalue_conversion
	movq	%rax, 232(%rsp)
	movq	8(%r13), %rbp
	movzbl	16(%rbp), %eax
	movq	%rbp, %rdi
	cmpb	$5, %al
	je	.L4882
	movzbl	%al, %ebx
	cmpl	$23, %ebx
	je	.L4884
	cmpl	$18, %ebx
	je	.L4884
	movzbl	16(%r13), %ecx
	cmpb	$32, %cl
	je	.L6283
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L4911
	cmpb	$34, %cl
	je	.L6284
.L4911:
	cmpb	$116, %cl
	movq	%r13, %rdx
	je	.L6168
	cmpb	$115, %cl
	je	.L6285
.L4920:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L4925
	cmpb	$49, %al
	je	.L4925
	cmpb	$50, %al
	je	.L4925
	cmpb	$101, %al
	je	.L4925
.L4924:
	cmpl	$10, %ebx
	je	.L6286
	cmpb	$39, %cl
	je	.L6287
.L4933:
	movq	%rbp, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L4938
	testb	$32, 17(%rbp)
	je	.L4939
	movl	flag_traditional(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L4940
	movq	integer_types+40(%rip), %r12
	movzwl	60(%rbp), %r11d
	movzwl	60(%r12), %ebp
	andl	$511, %r11d
	andl	$511, %ebp
	cmpl	%ebp, %r11d
	je	.L4940
.L4939:
	movq	integer_types+40(%rip), %rdi
.L6187:
	movq	%r13, %rsi
.L6188:
	call	convert
.L6190:
	movq	%rax, %rbx
.L4909:
	movq	%rbx, %r13
.L4882:
	movq	8(%r14), %rbp
	movzbl	16(%rbp), %eax
	movq	%rbp, %rsi
	cmpb	$5, %al
	je	.L4943
	movzbl	%al, %ebx
	cmpl	$23, %ebx
	je	.L4945
	cmpl	$18, %ebx
	je	.L4945
	movzbl	16(%r14), %ecx
	cmpb	$32, %cl
	je	.L6288
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L4972
	cmpb	$34, %cl
	je	.L6289
.L4972:
	cmpb	$116, %cl
	movq	%r14, %rsi
	je	.L6172
	cmpb	$115, %cl
	je	.L6290
.L4981:
	movzbl	%cl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L4986
	cmpb	$49, %al
	je	.L4986
	cmpb	$50, %al
	je	.L4986
	cmpb	$101, %al
	je	.L4986
.L4985:
	cmpl	$10, %ebx
	je	.L6291
	cmpb	$39, %cl
	je	.L6292
.L4994:
	movq	%rbp, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L4999
	testb	$32, 17(%rbp)
	je	.L5000
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L5001
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%rbp), %r12d
	movzwl	60(%rdx), %edi
	andl	$511, %r12d
	andl	$511, %edi
	cmpl	%edi, %r12d
	je	.L5001
.L5000:
	movq	integer_types+40(%rip), %rdi
.L6192:
	movq	%r14, %rsi
.L6193:
	call	convert
.L6195:
	movq	%rax, %rbx
.L4970:
	movq	%rbx, %r14
.L4943:
	movq	232(%rsp), %r11
	cmpb	$0, 16(%r11)
	je	.L6232
	movq	8(%r13), %r12
	movzbl	16(%r12), %eax
	testb	%al, %al
	je	.L6232
	movq	8(%r14), %r15
	movzbl	16(%r15), %edx
	testb	%dl, %dl
	je	.L6232
	movq	%r15, 96(%rsp)
	movzbl	%al, %esi
	movzbl	%dl, %edx
	movq	128(%r12), %rax
	cmpq	128(%r15), %rax
	je	.L6293
	leal	-6(%rsi), %ebp
	cmpl	$2, %ebp
	ja	.L5010
	leal	-6(%rdx), %r9d
	cmpl	$2, %r9d
	ja	.L5010
	cmpq	%r15, %r12
	movq	%r12, 8(%rsp)
	je	.L5012
	movq	global_trees(%rip), %rax
	cmpq	%rax, %r12
	je	.L6294
	cmpq	%rax, %r15
	je	.L5012
	movq	8(%rsp), %rdi
	movq	%r15, %rsi
	call	*targetm+248(%rip)
	movq	8(%rsp), %rbx
	movq	%rax, 304(%rsp)
	cmpb	$10, 16(%rbx)
	je	.L6295
.L5015:
	cmpb	$10, 16(%r15)
	je	.L6296
.L5016:
	movq	8(%rsp), %r10
	movq	96(%rsp), %r15
	movzbl	16(%r10), %ebx
	movzbl	16(%r15), %ebp
	cmpl	$8, %ebx
	je	.L6105
	cmpl	$8, %ebp
	je	.L6159
	leal	-6(%rbx), %eax
	cmpl	$17, %eax
	ja	.L5408
	mov	%eax, %esi
	jmp	*.L5409(,%rsi,8)
	.section	.rodata
	.align 8
	.align 4
.L5409:
	.quad	.L5029
	.quad	.L5029
	.quad	.L5408
	.quad	.L5408
	.quad	.L5408
	.quad	.L5408
	.quad	.L5408
	.quad	.L5046
	.quad	.L5408
	.quad	.L5408
	.quad	.L5408
	.quad	.L5408
	.quad	.L5051
	.quad	.L5408
	.quad	.L5408
	.quad	.L5408
	.quad	.L5408
	.quad	.L5058
	.text
.L5029:
	cmpl	$7, %ebx
	je	.L6298
	cmpl	$7, %ebp
	je	.L6106
.L5031:
	movq	8(%rsp), %rbx
	movq	96(%rsp), %rdi
	movzwl	60(%rbx), %edx
	movzwl	60(%rdi), %eax
	andl	$511, %edx
	andl	$511, %eax
	cmpl	%eax, %edx
	jg	.L6209
	cmpl	%edx, %eax
	jg	.L5044
	movq	8(%rsp), %r12
	movq	integer_types+64(%rip), %rcx
	movq	128(%r12), %rdx
	cmpq	%rcx, %rdx
	je	.L6211
	movq	96(%rsp), %r11
	movq	128(%r11), %rax
	cmpq	%rcx, %rax
	je	.L6211
	movq	integer_types+56(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L5038
	cmpq	%rdi, %rax
	je	.L5038
	movq	global_trees+208(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L6205
	cmpq	%rdi, %rax
	je	.L6205
	movq	8(%rsp), %rcx
	testb	$32, 17(%rcx)
	jne	.L6211
.L5044:
	movq	96(%rsp), %rdi
.L6205:
	movq	304(%rsp), %rsi
	call	build_type_attribute_variant
	movq	%rax, 8(%rsp)
.L5012:
	movl	warn_sign_compare(%rip), %eax
	testl	%eax, %eax
	js	.L5411
	testl	%eax, %eax
.L6216:
	je	.L5009
	movl	skip_evaluation(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L5009
	movq	320(%rsp), %rdx
	movq	312(%rsp), %r11
	movq	8(%rdx), %r9
	movq	8(%r11), %rcx
	movzbl	17(%r9), %esi
	movzbl	17(%rcx), %eax
	shrb	$5, %sil
	shrb	$5, %al
	movl	%esi, %ebx
	andl	$1, %eax
	andl	$1, %ebx
	cmpl	%eax, %ebx
	je	.L5009
	movq	8(%rsp), %r10
	testb	$32, 17(%r10)
	je	.L5009
	testl	%eax, %eax
	jne	.L6299
.L5418:
	testl	%ebx, %ebx
	je	.L5416
	movq	%r14, %rdi
	call	tree_expr_nonnegative_p
	testl	%eax, %eax
	jne	.L5009
.L5416:
	movl	$.LC55, %edi
	xorl	%eax, %eax
	call	warning
.L5009:
	cmpq	$0, 8(%rsp)
	jne	.L6023
	movl	flag_cond_mismatch(%rip), %eax
	testl	%eax, %eax
	je	.L6024
	movq	global_trees+216(%rip), %rdx
	movq	%rdx, 8(%rsp)
.L6023:
	movzbl	17(%r13), %eax
	xorl	%esi, %esi
	testb	$16, %al
	jne	.L6027
	testb	$16, 17(%r14)
	je	.L6026
.L6027:
	movl	$1, %esi
.L6026:
	testb	$8, %al
	jne	.L6029
	testb	$8, 17(%r14)
	je	.L6028
.L6029:
	orl	$2, %esi
.L6028:
	movq	8(%rsp), %rdi
	call	build_qualified_type
	cmpq	8(%r13), %rax
	movq	%rax, %rbx
	je	.L6030
	movq	%r13, %rsi
	movq	%rax, %rdi
	call	convert_and_check
	movq	%rax, %r13
.L6030:
	cmpq	8(%r14), %rbx
	je	.L6031
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	convert_and_check
	movq	%rax, %r14
.L6031:
	movq	232(%rsp), %rdx
	cmpb	$25, 16(%rdx)
	je	.L6300
	movq	232(%rsp), %rdx
	movl	$51, %edi
	movq	%rbx, %rsi
	movq	%r13, %rcx
	movq	%r14, %r8
	xorl	%eax, %eax
	call	build
	addq	$328, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	movq	%rax, %rdi
	jmp	fold
.L6300:
	movq	%rdx, %rdi
	call	integer_zerop
	testl	%eax, %eax
	cmove	%r13, %r14
	addq	$328, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	movq	%r14, %rdi
	popq	%r14
	popq	%r15
	jmp	pedantic_non_lvalue
.L6024:
	movl	$.LC60, %edi
	xorl	%eax, %eax
	call	error
.L6232:
	movq	global_trees(%rip), %rax
	addq	$328, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L6299:
	movq	%r13, %rdi
	call	tree_expr_nonnegative_p
	testl	%eax, %eax
	jne	.L5009
	jmp	.L5418
	.p2align 6,,7
.L5411:
	movl	extra_warnings(%rip), %r8d
	testl	%r8d, %r8d
	jmp	.L6216
.L6211:
	movq	%rcx, %rdi
	jmp	.L6205
.L5038:
	movq	8(%rsp), %rbx
	testb	$32, 17(%rbx)
	jne	.L6211
	movq	96(%rsp), %rax
	testb	$32, 17(%rax)
	je	.L6205
	jmp	.L6211
.L6209:
	movq	%rbx, %rdi
	jmp	.L6205
.L6106:
	cmpl	$7, %ebx
	jne	.L5044
	jmp	.L5031
.L6298:
	cmpl	$7, %ebp
	je	.L6106
.L5408:
	movq	8(%rsp), %rdi
	jmp	.L6205
.L5046:
	movq	8(%rsp), %rdx
	movq	96(%rsp), %r10
	movq	8(%rdx), %rbx
	movq	8(%r10), %rbp
	movq	128(%rbx), %rdi
	movq	128(%rbp), %rsi
	call	common_type
	xorl	%ecx, %ecx
	movzbl	62(%rbx), %r9d
	movzbl	17(%rbx), %r15d
	movq	%rax, %rdi
	shrb	$5, %r9b
	movl	%r15d, %edx
	andl	$1, %r9d
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	$1, %r15d
	sall	$2, %r9d
	andl	$1, %edx
	addl	%r15d, %r15d
	orl	%r15d, %edx
	orl	%r9d, %edx
	cmpb	$20, 16(%rbx)
	je	.L6301
.L5049:
	leal	0(,%rcx,8), %esi
	movzbl	62(%rbp), %r8d
	movzbl	17(%rbp), %ecx
	orl	%edx, %esi
	movl	%ecx, %edx
	shrb	$5, %r8b
	shrb	$3, %cl
	shrb	$4, %dl
	andl	$1, %ecx
	andl	$1, %r8d
	addl	%ecx, %ecx
	andl	$1, %edx
	sall	$2, %r8d
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	orl	%r8d, %edx
	cmpb	$20, 16(%rbp)
	je	.L6302
.L5050:
	leal	0(,%rcx,8), %ebp
	orl	%ebp, %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movq	%rax, %rdi
	call	build_pointer_type
.L6215:
	movq	%rax, %rdi
	jmp	.L6205
.L6302:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5050
.L6301:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5049
.L5051:
	movq	8(%rsp), %rsi
	movq	96(%rsp), %r12
	movq	8(%rsi), %rdi
	movq	8(%r12), %rsi
	call	common_type
	movq	%rax, %rdi
	movq	8(%rsp), %rax
	cmpq	8(%rax), %rdi
	je	.L6303
.L5052:
	movq	96(%rsp), %rdx
	cmpq	8(%rdx), %rdi
	je	.L6304
.L5053:
	movq	8(%rsp), %r11
	cmpq	$0, 24(%r11)
	cmove	96(%rsp), %r11
	movq	24(%r11), %rsi
	call	build_array_type
	jmp	.L6215
.L6304:
	cmpq	$0, 24(%rdx)
	je	.L5053
.L6206:
	movq	%rdx, %rdi
	jmp	.L6205
.L6303:
	cmpq	$0, 24(%rax)
	je	.L5052
	jmp	.L6215
.L5058:
	movq	8(%rsp), %rbx
	movq	96(%rsp), %r15
	movq	8(%rbx), %rdi
	movq	8(%r15), %rsi
	call	common_type
	movq	96(%rsp), %r9
	movq	%rax, 296(%rsp)
	movq	296(%rsp), %rdi
	movq	24(%rbx), %rax
	movq	%rax, 200(%rsp)
	movq	24(%r9), %rax
	movq	%rax, 208(%rsp)
	cmpq	8(%rbx), %rdi
	je	.L6305
.L5059:
	movq	96(%rsp), %rcx
	movq	296(%rsp), %r10
	cmpq	8(%rcx), %r10
	je	.L6306
	cmpq	$0, 200(%rsp)
	je	.L6307
.L5061:
	cmpq	$0, 208(%rsp)
	jne	.L5062
	movq	296(%rsp), %rdi
	movq	200(%rsp), %rsi
.L6233:
	call	build_function_type
	jmp	.L6215
.L5062:
	xorl	%edi, %edi
	call	pushlevel
	movl	$1, %edi
	call	declare_parm_level
	movq	200(%rsp), %rdi
	call	list_length
	movq	$0, 224(%rsp)
	testl	%eax, %eax
	jle	.L6044
	movl	%eax, %ebx
.L5067:
	movq	224(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	call	tree_cons
	decl	%ebx
	movq	%rax, 224(%rsp)
	jne	.L5067
.L6044:
	cmpq	$0, 200(%rsp)
	movq	224(%rsp), %r8
	movq	%r8, 216(%rsp)
	je	.L6046
.L5407:
	movq	200(%rsp), %rbp
	movq	32(%rbp), %rdx
	testq	%rdx, %rdx
	jne	.L5072
	movq	208(%rsp), %r12
	movq	216(%rsp), %rcx
	movq	32(%r12), %rdx
	movq	%rdx, 32(%rcx)
.L5073:
.L5070:
	movq	200(%rsp), %rax
	movq	208(%rsp), %rdi
	movq	216(%rsp), %r15
	movq	(%rax), %r10
	movq	%r10, 200(%rsp)
	testq	%r10, %r10
	movq	(%rdi), %r12
	movq	%r12, 208(%rsp)
	movq	(%r15), %rbp
	movq	%rbp, 216(%rsp)
	jne	.L5407
.L6046:
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	call	poplevel
	movq	224(%rsp), %rsi
	movq	296(%rsp), %rdi
	call	build_function_type
	movq	%rax, 8(%rsp)
	jmp	.L5408
.L5072:
	movq	208(%rsp), %rsi
	movq	32(%rsi), %rax
	testq	%rax, %rax
	jne	.L5074
	movq	216(%rsp), %r11
	movq	%rdx, 32(%r11)
	jmp	.L5070
.L5074:
	cmpb	$21, 16(%rdx)
	je	.L6308
.L5075:
	cmpb	$21, 16(%rax)
	je	.L6309
.L5241:
	movq	200(%rsp), %rdx
	movq	208(%rsp), %r9
	movq	32(%rdx), %rdi
	movq	32(%r9), %rsi
	call	common_type
	movq	216(%rsp), %rsi
	movq	%rax, 32(%rsi)
	jmp	.L5070
.L6309:
	movq	200(%rsp), %rbx
	movq	32(%rbx), %rcx
	cmpq	%rcx, %rax
	je	.L5241
	movq	24(%rax), %r9
	testq	%r9, %r9
	movq	%r9, 168(%rsp)
	je	.L5241
.L5406:
	movq	168(%rsp), %rbp
	movq	8(%rbp), %rbx
	movq	%rcx, %rbp
	cmpq	%rcx, %rbx
	je	.L6203
	testq	%rbx, %rbx
	je	.L6203
	testq	%rcx, %rcx
	je	.L6203
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L6203
	movzbl	16(%rcx), %eax
	testb	%al, %al
	je	.L6203
	cmpb	$6, %dl
	je	.L6310
.L5250:
	cmpb	$6, %al
	je	.L6311
.L5251:
	cmpb	$10, %dl
	je	.L6312
.L5252:
	cmpb	$10, 16(%rbp)
	je	.L6313
.L5253:
	cmpq	%rbp, %rbx
	movl	$1, 152(%rsp)
	je	.L5249
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L5255
	movl	$0, 152(%rsp)
.L5249:
	movl	152(%rsp), %r15d
	testl	%r15d, %r15d
	jne	.L6314
.L5244:
	movq	168(%rsp), %r11
	movq	(%r11), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 168(%rsp)
	je	.L5241
	movq	200(%rsp), %rax
	movq	32(%rax), %rcx
	jmp	.L5406
.L6314:
	movq	200(%rsp), %rax
	movq	216(%rsp), %r12
	movq	32(%rax), %rdi
	movq	%rdi, 32(%r12)
.L6241:
	movl	pedantic(%rip), %r8d
	testl	%r8d, %r8d
	je	.L5070
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L5070
.L5255:
	movzbl	17(%rbx), %edi
	movzbl	62(%rbx), %r12d
	xorl	%ecx, %ecx
	movl	%edi, %edx
	shrb	$5, %r12b
	shrb	$3, %dil
	shrb	$4, %dl
	andl	$1, %edi
	andl	$1, %r12d
	andl	$1, %edx
	addl	%edi, %edi
	sall	$2, %r12d
	orl	%edi, %edx
	orl	%r12d, %edx
	cmpb	$20, %sil
	je	.L6315
.L5257:
	leal	0(,%rcx,8), %edi
	movzbl	62(%rbp), %r8d
	movzbl	17(%rbp), %ecx
	orl	%edx, %edi
	movl	%ecx, %edx
	shrb	$5, %r8b
	shrb	$3, %cl
	shrb	$4, %dl
	andl	$1, %ecx
	andl	$1, %r8d
	addl	%ecx, %ecx
	andl	$1, %edx
	sall	$2, %r8d
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	orl	%r8d, %edx
	cmpb	$20, %sil
	je	.L6316
.L5258:
	leal	0(,%rcx,8), %esi
	movl	$0, 152(%rsp)
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L5249
	movq	128(%rbp), %r15
	cmpq	%r15, 128(%rbx)
	je	.L6203
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 152(%rsp)
	testl	%eax, %eax
	movl	%eax, 288(%rsp)
	je	.L5249
	movl	$0, 152(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L5384
	cmpl	$18, %eax
	ja	.L5401
	cmpl	$13, %eax
	je	.L5262
.L5261:
	cmpl	$2, 288(%rsp)
	jne	.L5249
	cmpl	$1, 152(%rsp)
	movl	288(%rsp), %eax
	cmovne	152(%rsp), %eax
	movl	%eax, 152(%rsp)
	jmp	.L5249
.L5262:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L5263
	call	comptypes
.L6201:
	movl	%eax, 152(%rsp)
	jmp	.L5261
.L5263:
	movl	$1, 152(%rsp)
	jmp	.L5261
.L5401:
	cmpl	$20, %eax
	je	.L5397
	cmpl	$23, %eax
	jne	.L5261
	movl	$1, 164(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L5266
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 164(%rsp)
	je	.L5261
.L5266:
	movq	24(%rbx), %r15
	movq	24(%rbp), %r12
	testq	%r15, %r15
	je	.L6317
	testq	%r12, %r12
	je	.L6318
	movl	$1, 152(%rsp)
	xorl	%ebp, %ebp
.L5381:
	testq	%r15, %r15
	je	.L6319
	testq	%r12, %r12
	je	.L5370
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L6320
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L5356
.L6240:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5370
.L5355:
	cmpl	152(%rsp), %ebp
	movl	152(%rsp), %ebx
	cmovg	%ebp, %ebx
	movl	%ebx, 152(%rsp)
	movq	(%r12), %r12
	movq	(%r15), %r15
	jmp	.L5381
.L5370:
	movl	$0, 152(%rsp)
.L5350:
	cmpl	$1, 152(%rsp)
	movl	152(%rsp), %ebx
	cmove	164(%rsp), %ebx
.L6202:
	movl	%ebx, 152(%rsp)
	jmp	.L5261
.L5356:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L5355
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L6322
.L5360:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L5370
	cmpq	$0, 96(%rax)
	je	.L5371
	testb	$8, 62(%rax)
	je	.L5370
.L5371:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5370
	movq	32(%r15), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5370
	movq	32(%r12), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L5370
.L5377:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5373
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5377
	jmp	.L5370
.L5373:
	testq	%rbx, %rbx
	jne	.L5355
	jmp	.L5370
.L6322:
	cmpq	$0, 96(%rax)
	je	.L5361
	testb	$8, 62(%rax)
	je	.L5360
.L5361:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5360
	movq	32(%r12), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5360
	movq	32(%r15), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L5370
.L5367:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5373
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5367
	jmp	.L5370
.L6320:
	movq	32(%r12), %rdi
	jmp	.L6240
.L6319:
	testq	%r12, %r12
	je	.L5350
	jmp	.L5370
.L6318:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5261
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L6091
	movq	%rax, %rbp
	movl	$1, %r12d
	movl	$0, 156(%rsp)
.L5345:
	testq	%r15, %r15
	je	.L6323
	testq	%rbp, %rbp
	je	.L5334
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L6324
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5320
.L6239:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5334
.L5319:
	cmpl	%r12d, 156(%rsp)
	movq	(%r15), %r15
	cmovg	156(%rsp), %r12d
	movq	(%rbp), %rbp
	jmp	.L5345
.L5334:
	xorl	%r12d, %r12d
.L5314:
	decl	%r12d
	movl	$2, 152(%rsp)
	jne	.L5261
	movl	164(%rsp), %ebp
	movl	%ebp, 152(%rsp)
	jmp	.L5261
.L5320:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 156(%rsp)
	jne	.L5319
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L6326
.L5324:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5334
	cmpq	$0, 96(%rax)
	je	.L5335
	testb	$8, 62(%rax)
	je	.L5334
.L5335:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5334
	movq	32(%r15), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5334
	movq	32(%rbp), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L5334
.L5341:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5337
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5341
	jmp	.L5334
.L5337:
	testq	%rbx, %rbx
	jne	.L5319
	jmp	.L5334
.L6326:
	cmpq	$0, 96(%rax)
	je	.L5325
	testb	$8, 62(%rax)
	je	.L5324
.L5325:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5324
	movq	32(%rbp), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5324
	movq	32(%r15), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L5334
.L5331:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5337
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5331
	jmp	.L5334
.L6324:
	movq	32(%rbp), %rdi
	jmp	.L6239
.L6323:
	testq	%rbp, %rbp
	je	.L5314
	jmp	.L5334
.L6091:
	movl	164(%rsp), %eax
	jmp	.L6201
.L6317:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5261
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L6089
	movq	%rax, %rbp
	movl	$1, %r15d
	movl	$0, 160(%rsp)
.L5306:
	testq	%r12, %r12
	je	.L6327
	testq	%rbp, %rbp
	je	.L5295
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L6328
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5281
.L6238:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5295
.L5280:
	cmpl	%r15d, 160(%rsp)
	movq	(%r12), %r12
	cmovg	160(%rsp), %r15d
	movq	(%rbp), %rbp
	jmp	.L5306
.L5295:
	xorl	%r15d, %r15d
.L5275:
	decl	%r15d
	movl	$2, 152(%rsp)
	jne	.L5261
	movl	164(%rsp), %ebx
	jmp	.L6202
.L5281:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 160(%rsp)
	jne	.L5280
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L6330
.L5285:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5295
	cmpq	$0, 96(%rax)
	je	.L5296
	testb	$8, 62(%rax)
	je	.L5295
.L5296:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5295
	movq	32(%r12), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5295
	movq	32(%rbp), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L5295
.L5302:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5298
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5302
	jmp	.L5295
.L5298:
	testq	%rbx, %rbx
	jne	.L5280
	jmp	.L5295
.L6330:
	cmpq	$0, 96(%rax)
	je	.L5286
	testb	$8, 62(%rax)
	je	.L5285
.L5286:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5285
	movq	32(%rbp), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5285
	movq	32(%r12), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L5295
.L5292:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5298
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5292
	jmp	.L5295
.L6328:
	movq	32(%rbp), %rdi
	jmp	.L6238
.L6327:
	testq	%rbp, %rbp
	je	.L5275
	jmp	.L5295
.L6089:
	movl	164(%rsp), %eax
	movl	%eax, 152(%rsp)
	jmp	.L5261
.L5397:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	152(%rsp), %eax
	jmp	.L6201
.L5384:
	movq	24(%rbx), %r12
	movq	24(%rbp), %r15
	movl	$1, 152(%rsp)
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L5385
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 152(%rsp)
	je	.L5244
.L5385:
	testq	%r12, %r12
	je	.L5261
	testq	%r15, %r15
	je	.L5261
	cmpq	%r15, %r12
	je	.L5261
	movq	112(%r12), %rcx
	movq	112(%r15), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L5388
	movq	104(%r12), %r10
	cmpb	$25, 16(%r10)
	je	.L6331
.L5389:
	movl	$1, %r8d
.L5388:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L5390
	movq	104(%r15), %rbp
	cmpb	$25, 16(%rbp)
	je	.L6332
.L5391:
	movl	$1, %ecx
.L5390:
	testb	%r8b, %r8b
	jne	.L5261
	testb	%cl, %cl
	jne	.L5261
	testb	%dil, %dil
	je	.L6126
	testb	%dl, %dl
.L6200:
	jne	.L5261
.L5396:
	movl	$0, 152(%rsp)
	jmp	.L5261
.L6126:
	testb	%dl, %dl
	jne	.L5396
	movq	104(%r12), %rdi
	movq	104(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5396
	movq	112(%r12), %rdi
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L6200
.L6332:
	cmpb	$25, 16(%rsi)
	jne	.L5391
	jmp	.L5390
.L6331:
	cmpb	$25, 16(%rcx)
	jne	.L5389
	jmp	.L5388
.L6203:
	movl	$1, 152(%rsp)
	jmp	.L5249
.L6316:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5258
.L6315:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5257
.L6313:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L5253
.L6312:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L5252
.L6311:
	testb	$2, 62(%rcx)
	je	.L5251
	movq	24(%rcx), %r10
	testq	%r10, %r10
	cmovne	%r10, %rbp
	jmp	.L5251
.L6310:
	testb	$2, 62(%rbx)
	je	.L5250
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5250
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L5250
.L6308:
	cmpq	%rax, %rdx
	je	.L5075
	movq	24(%rdx), %rdi
	testq	%rdi, %rdi
	movq	%rdi, 192(%rsp)
	je	.L5075
.L5240:
	movq	192(%rsp), %r9
	movq	%rax, %rbp
	movq	8(%r9), %rbx
	cmpq	%rax, %rbx
	je	.L5082
	testq	%rbx, %rbx
	je	.L5082
	testq	%rax, %rax
	je	.L5082
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L5082
	movzbl	16(%rax), %ecx
	testb	%cl, %cl
	jne	.L5081
.L5082:
	movl	$1, 176(%rsp)
.L5083:
	movl	176(%rsp), %r8d
	testl	%r8d, %r8d
	jne	.L6333
.L5078:
	movq	192(%rsp), %rdx
	movq	(%rdx), %r11
	testq	%r11, %r11
	movq	%r11, 192(%rsp)
	jne	.L5240
	jmp	.L5075
.L6333:
	movq	216(%rsp), %rcx
	movq	%rax, 32(%rcx)
	jmp	.L6241
.L5081:
	cmpb	$6, %dl
	je	.L6334
.L5084:
	cmpb	$6, %cl
	je	.L6335
.L5085:
	cmpb	$10, %dl
	je	.L6336
.L5086:
	cmpb	$10, 16(%rbp)
	je	.L6337
.L5087:
	cmpq	%rbp, %rbx
	je	.L6338
	movzbl	16(%rbx), %edi
	cmpb	16(%rbp), %dil
	je	.L5089
	movl	$0, 176(%rsp)
.L6175:
	movq	208(%rsp), %rdi
	movq	32(%rdi), %rax
	jmp	.L5083
.L5089:
	movzbl	17(%rbx), %r8d
	movzbl	62(%rbx), %r10d
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r10b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r10d
	orl	%r8d, %edx
	orl	%r10d, %edx
	cmpb	$20, %dil
	je	.L6339
.L5091:
	movzbl	17(%rbp), %r12d
	leal	0(,%rcx,8), %esi
	movzbl	62(%rbp), %ecx
	orl	%edx, %esi
	movl	%r12d, %edx
	shrb	$5, %cl
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r12d, %r12d
	sall	$2, %ecx
	orl	%r12d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L6340
.L5092:
	leal	0(,%rcx,8), %r11d
	orl	%r11d, %edx
	cmpl	%edx, %esi
	je	.L6341
.L6237:
	movl	$0, 176(%rsp)
.L6199:
	movq	208(%rsp), %r12
	movq	32(%r12), %rax
	jmp	.L5083
.L6341:
	movq	128(%rbp), %rax
	cmpq	%rax, 128(%rbx)
	je	.L6342
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 292(%rsp)
	je	.L6237
	movl	$0, 176(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L5218
	cmpl	$18, %eax
	ja	.L5235
	cmpl	$13, %eax
	je	.L5096
.L5095:
	cmpl	$2, 292(%rsp)
	je	.L6343
.L6174:
	movq	208(%rsp), %rsi
	movq	32(%rsi), %rax
	jmp	.L5083
.L6343:
	cmpl	$1, 176(%rsp)
	jne	.L6175
	movl	$2, 176(%rsp)
	jmp	.L6199
.L5096:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L5097
	call	comptypes
.L6197:
	movl	%eax, 176(%rsp)
	jmp	.L5095
.L5097:
	movl	$1, 176(%rsp)
	jmp	.L5095
.L5235:
	cmpl	$20, %eax
	je	.L5231
	cmpl	$23, %eax
	jne	.L5095
	movl	$1, 188(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L5100
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 188(%rsp)
	je	.L5095
.L5100:
	movq	24(%rbx), %r15
	movq	24(%rbp), %r12
	testq	%r15, %r15
	je	.L6344
	testq	%r12, %r12
	je	.L6345
	movl	$1, 176(%rsp)
	xorl	%ebp, %ebp
.L5215:
	testq	%r15, %r15
	je	.L6346
	testq	%r12, %r12
	je	.L5204
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L6347
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L5190
.L6236:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5204
.L5189:
	cmpl	176(%rsp), %ebp
	movl	176(%rsp), %eax
	cmovg	%ebp, %eax
	movl	%eax, 176(%rsp)
	movq	(%r12), %r12
	movq	(%r15), %r15
	jmp	.L5215
.L5204:
	movl	$0, 176(%rsp)
.L5184:
	cmpl	$1, 176(%rsp)
	movl	176(%rsp), %ebx
	cmove	188(%rsp), %ebx
.L6198:
	movl	%ebx, 176(%rsp)
	jmp	.L5095
.L5190:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L5189
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L6349
.L5194:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L5204
	cmpq	$0, 96(%rax)
	je	.L5205
	testb	$8, 62(%rax)
	je	.L5204
.L5205:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5204
	movq	32(%r15), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5204
	movq	32(%r12), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L5204
.L5211:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5207
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5211
	jmp	.L5204
.L5207:
	testq	%rbx, %rbx
	jne	.L5189
	jmp	.L5204
.L6349:
	cmpq	$0, 96(%rax)
	je	.L5195
	testb	$8, 62(%rax)
	je	.L5194
.L5195:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5194
	movq	32(%r12), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5194
	movq	32(%r15), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L5204
.L5201:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5207
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5201
	jmp	.L5204
.L6347:
	movq	32(%r12), %rdi
	jmp	.L6236
.L6346:
	testq	%r12, %r12
	je	.L5184
	jmp	.L5204
.L6345:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5095
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L6087
	movq	%rax, %rbp
	movl	$1, %r12d
	movl	$0, 180(%rsp)
.L5179:
	testq	%r15, %r15
	je	.L6350
	testq	%rbp, %rbp
	je	.L5168
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L6351
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5154
.L6235:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5168
.L5153:
	cmpl	%r12d, 180(%rsp)
	movq	(%r15), %r15
	cmovg	180(%rsp), %r12d
	movq	(%rbp), %rbp
	jmp	.L5179
.L5168:
	xorl	%r12d, %r12d
.L5148:
	decl	%r12d
	movl	$2, 176(%rsp)
	jne	.L5095
	movl	188(%rsp), %r15d
	movl	%r15d, 176(%rsp)
	jmp	.L5095
.L5154:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 180(%rsp)
	jne	.L5153
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L6353
.L5158:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5168
	cmpq	$0, 96(%rax)
	je	.L5169
	testb	$8, 62(%rax)
	je	.L5168
.L5169:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5168
	movq	32(%r15), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5168
	movq	32(%rbp), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L5168
.L5175:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5171
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5175
	jmp	.L5168
.L5171:
	testq	%rbx, %rbx
	jne	.L5153
	jmp	.L5168
.L6353:
	cmpq	$0, 96(%rax)
	je	.L5159
	testb	$8, 62(%rax)
	je	.L5158
.L5159:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5158
	movq	32(%rbp), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5158
	movq	32(%r15), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L5168
.L5165:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5171
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5165
	jmp	.L5168
.L6351:
	movq	32(%rbp), %rdi
	jmp	.L6235
.L6350:
	testq	%rbp, %rbp
	je	.L5148
	jmp	.L5168
.L6087:
	movl	188(%rsp), %eax
	jmp	.L6197
.L6344:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5095
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L6085
	movq	%rax, %rbp
	movl	$1, %r15d
	movl	$0, 184(%rsp)
.L5140:
	testq	%r12, %r12
	je	.L6354
	testq	%rbp, %rbp
	je	.L5129
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L6355
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5115
.L6234:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5129
.L5114:
	cmpl	%r15d, 184(%rsp)
	movq	(%r12), %r12
	cmovg	184(%rsp), %r15d
	movq	(%rbp), %rbp
	jmp	.L5140
.L5129:
	xorl	%r15d, %r15d
.L5109:
	decl	%r15d
	movl	$2, 176(%rsp)
	jne	.L5095
	movl	188(%rsp), %ebx
	jmp	.L6198
.L5115:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 184(%rsp)
	jne	.L5114
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L6357
.L5119:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5129
	cmpq	$0, 96(%rax)
	je	.L5130
	testb	$8, 62(%rax)
	je	.L5129
.L5130:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5129
	movq	32(%r12), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5129
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L5129
.L5136:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5132
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5136
	jmp	.L5129
.L5132:
	testq	%rbx, %rbx
	jne	.L5114
	jmp	.L5129
.L6357:
	cmpq	$0, 96(%rax)
	je	.L5120
	testb	$8, 62(%rax)
	je	.L5119
.L5120:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5119
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5119
	movq	32(%r12), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L5129
.L5126:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5132
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5126
	jmp	.L5129
.L6355:
	movq	32(%rbp), %rdi
	jmp	.L6234
.L6354:
	testq	%rbp, %rbp
	je	.L5109
	jmp	.L5129
.L6085:
	movl	188(%rsp), %ebp
	movl	%ebp, 176(%rsp)
	jmp	.L5095
.L5231:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	176(%rsp), %eax
	jmp	.L6197
.L5218:
	movq	24(%rbx), %r12
	movq	24(%rbp), %r15
	movl	$1, 176(%rsp)
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L5219
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 176(%rsp)
	je	.L6173
.L5219:
	testq	%r12, %r12
	je	.L5095
	testq	%r15, %r15
	je	.L5095
	cmpq	%r15, %r12
	je	.L5095
	movq	112(%r12), %rcx
	movq	112(%r15), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L5222
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L6358
.L5223:
	movl	$1, %r8d
.L5222:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L5224
	movq	104(%r15), %r10
	cmpb	$25, 16(%r10)
	je	.L6359
.L5225:
	movl	$1, %ecx
.L5224:
	testb	%r8b, %r8b
	jne	.L5095
	testb	%cl, %cl
	jne	.L5095
	testb	%dil, %dil
	je	.L6116
	testb	%dl, %dl
.L6196:
	jne	.L5095
.L5230:
	movl	$0, 176(%rsp)
	jmp	.L5095
.L6116:
	testb	%dl, %dl
	jne	.L5230
	movq	104(%r12), %rdi
	movq	104(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5230
	movq	112(%r12), %rdi
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L6196
.L6359:
	cmpb	$25, 16(%rsi)
	jne	.L5225
	jmp	.L5224
.L6358:
	cmpb	$25, 16(%rcx)
	jne	.L5223
	jmp	.L5222
.L6173:
	movq	208(%rsp), %r15
	movq	32(%r15), %rax
	jmp	.L5078
.L6342:
	movl	$1, 176(%rsp)
	jmp	.L6175
.L6340:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5092
.L6339:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5091
.L6338:
	movl	$1, 176(%rsp)
	jmp	.L6174
.L6337:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L5087
.L6336:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L5086
.L6335:
	testb	$2, 62(%rax)
	je	.L5085
	movq	24(%rax), %r15
	testq	%r15, %r15
	cmovne	%r15, %rbp
	jmp	.L5085
.L6334:
	testb	$2, 62(%rbx)
	je	.L5084
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5084
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L5084
.L6307:
	movq	96(%rsp), %rbx
	movq	296(%rsp), %rdi
	movq	24(%rbx), %rsi
	jmp	.L6233
.L6306:
	cmpq	$0, 200(%rsp)
	jne	.L5061
	jmp	.L6211
.L6305:
	testq	%rax, %rax
	jne	.L5059
	jmp	.L6209
	.p2align 6,,7
.L6159:
	movq	8(%rsp), %rdi
.L5020:
	cmpl	$8, %ebp
	movq	96(%rsp), %rsi
	je	.L6360
.L5022:
	call	common_type
	cmpl	$8, %ebx
	movq	%rax, %rdi
	je	.L6361
.L5023:
	cmpl	$8, %ebp
	je	.L6362
.L5025:
	call	build_complex_type
	jmp	.L6215
.L6362:
	movq	96(%rsp), %rcx
	cmpq	%rdi, 8(%rcx)
	jne	.L5025
	jmp	.L6211
	.p2align 6,,7
.L6361:
	movq	8(%rsp), %rdx
	cmpq	%rax, 8(%rdx)
	jne	.L5023
	jmp	.L6206
	.p2align 6,,7
.L6360:
	movq	8(%rsi), %rsi
	jmp	.L5022
.L6105:
	movq	8(%rsp), %r8
	movq	8(%r8), %rdi
	jmp	.L5020
.L6296:
	movzwl	60(%r15), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, 96(%rsp)
	jmp	.L5016
.L6295:
	movzwl	60(%rbx), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, 8(%rsp)
	jmp	.L5015
.L6294:
	movq	%r15, 8(%rsp)
	jmp	.L5012
	.p2align 6,,7
.L5010:
	cmpl	$5, %esi
	je	.L5422
	cmpl	$5, %edx
	je	.L5422
	cmpl	$13, %esi
	je	.L6363
.L6016:
	cmpl	$13, %edx
	jne	.L5009
	cmpl	$6, %esi
	jne	.L5009
	movq	%r13, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L6364
	movq	global_trees+112(%rip), %r13
.L6022:
	movq	%r15, 8(%rsp)
	jmp	.L5009
.L6364:
	movl	$.LC59, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L6022
	.p2align 6,,7
.L6363:
	cmpl	$13, %edx
	je	.L6365
	cmpl	$6, %edx
	jne	.L6016
	movq	%r14, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L6366
	movq	global_trees+112(%rip), %r14
.L6018:
	movq	%r12, 8(%rsp)
	jmp	.L5009
.L6366:
	movl	$.LC59, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L6018
	.p2align 6,,7
.L6365:
	movq	%r12, %rdi
	movq	%r15, %rsi
	movl	$1, %edx
	call	maybe_objc_comptypes
	testl	%eax, %eax
	js	.L6367
.L5429:
	testl	%eax, %eax
	je	.L5427
	cmpq	%r15, %r12
	movq	%r12, 8(%rsp)
	je	.L5009
	movq	global_trees(%rip), %rax
	cmpq	%rax, %r12
	je	.L6022
	cmpq	%rax, %r15
	je	.L5009
	movq	8(%rsp), %rdi
	movq	%r15, %rsi
	call	*targetm+248(%rip)
	movq	8(%rsp), %rdx
	movq	%rax, 256(%rsp)
	cmpb	$10, 16(%rdx)
	je	.L6368
.L5593:
	cmpb	$10, 16(%r15)
	je	.L6369
.L5594:
	movq	8(%rsp), %r15
	movq	96(%rsp), %r12
	movzbl	16(%r15), %ebx
	movzbl	16(%r12), %ebp
	cmpl	$8, %ebx
	je	.L6137
	cmpl	$8, %ebp
	je	.L6160
	leal	-6(%rbx), %eax
	cmpl	$17, %eax
	ja	.L5986
	mov	%eax, %r9d
	jmp	*.L5987(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L5987:
	.quad	.L5607
	.quad	.L5607
	.quad	.L5986
	.quad	.L5986
	.quad	.L5986
	.quad	.L5986
	.quad	.L5986
	.quad	.L5624
	.quad	.L5986
	.quad	.L5986
	.quad	.L5986
	.quad	.L5986
	.quad	.L5629
	.quad	.L5986
	.quad	.L5986
	.quad	.L5986
	.quad	.L5986
	.quad	.L5636
	.text
.L5607:
	cmpl	$7, %ebx
	je	.L6371
	cmpl	$7, %ebp
	je	.L6138
.L5609:
	movq	8(%rsp), %rcx
	movq	96(%rsp), %rbp
	movzwl	60(%rcx), %edx
	movzwl	60(%rbp), %eax
	andl	$511, %edx
	andl	$511, %eax
	cmpl	%eax, %edx
	jg	.L6277
	cmpl	%edx, %eax
	jg	.L5622
	movq	8(%rsp), %r10
	movq	integer_types+64(%rip), %rcx
	movq	128(%r10), %rdx
	cmpq	%rcx, %rdx
	je	.L6277
	movq	96(%rsp), %r8
	movq	128(%r8), %rax
	cmpq	%rcx, %rax
	je	.L6277
	movq	integer_types+56(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L5616
	cmpq	%rdi, %rax
	je	.L5616
	movq	global_trees+208(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L6272
	cmpq	%rdi, %rax
	je	.L6272
	movq	8(%rsp), %rcx
	testb	$32, 17(%rcx)
	je	.L5622
.L6277:
	movq	%rcx, %rdi
.L6272:
	movq	256(%rsp), %rsi
	call	build_type_attribute_variant
.L6231:
	movq	%rax, 8(%rsp)
	jmp	.L5009
.L5622:
	movq	96(%rsp), %rdi
	jmp	.L6272
.L5616:
	movq	8(%rsp), %rbx
	testb	$32, 17(%rbx)
	jne	.L6277
	movq	96(%rsp), %rax
	testb	$32, 17(%rax)
	je	.L6272
	jmp	.L6277
.L6138:
	cmpl	$7, %ebx
	jne	.L5622
	jmp	.L5609
.L6371:
	cmpl	$7, %ebp
	je	.L6138
.L5986:
	movq	8(%rsp), %rdi
	jmp	.L6272
.L5624:
	movq	8(%rsp), %rdx
	movq	96(%rsp), %rdi
	movq	8(%rdx), %rbx
	movq	8(%rdi), %rbp
	movq	128(%rbx), %rdi
	movq	128(%rbp), %rsi
	call	common_type
	movzbl	62(%rbx), %ecx
	movzbl	17(%rbx), %r12d
	movq	%rax, %rdi
	movl	%r12d, %edx
	shrb	$5, %cl
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r12d, %r12d
	sall	$2, %ecx
	orl	%r12d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, 16(%rbx)
	je	.L6372
.L5627:
	movzbl	17(%rbp), %r11d
	movzbl	62(%rbp), %r15d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r11d, %edx
	shrb	$5, %r15b
	shrb	$3, %r11b
	shrb	$4, %dl
	andl	$1, %r11d
	andl	$1, %r15d
	andl	$1, %edx
	addl	%r11d, %r11d
	sall	$2, %r15d
	orl	%r11d, %edx
	orl	%r15d, %edx
	cmpb	$20, 16(%rbp)
	je	.L6373
.L5628:
	leal	0(,%rcx,8), %r9d
	orl	%r9d, %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movq	%rax, %rdi
	call	build_pointer_type
.L6276:
	movq	%rax, %rdi
	jmp	.L6272
.L6373:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5628
.L6372:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5627
.L5629:
	movq	8(%rsp), %rsi
	movq	96(%rsp), %rbp
	movq	8(%rsi), %rdi
	movq	8(%rbp), %rsi
	call	common_type
	movq	%rax, %rdi
	movq	8(%rsp), %rax
	cmpq	8(%rax), %rdi
	je	.L6374
.L5630:
	movq	96(%rsp), %rdx
	cmpq	8(%rdx), %rdi
	je	.L6375
.L5631:
	movq	8(%rsp), %r10
	cmpq	$0, 24(%r10)
	cmove	96(%rsp), %r10
	movq	24(%r10), %rsi
	call	build_array_type
	jmp	.L6276
.L6375:
	cmpq	$0, 24(%rdx)
	je	.L5631
	movq	%rdx, %rdi
	jmp	.L6272
.L6374:
	cmpq	$0, 24(%rax)
	je	.L5630
	jmp	.L6276
.L5636:
	movq	8(%rsp), %rbx
	movq	96(%rsp), %r12
	movq	8(%rbx), %rdi
	movq	8(%r12), %rsi
	call	common_type
	movq	96(%rsp), %r8
	movq	%rax, 248(%rsp)
	movq	24(%rbx), %rcx
	movq	%rcx, 64(%rsp)
	movq	24(%r8), %rcx
	movq	%rcx, 72(%rsp)
	cmpq	8(%rbx), %rax
	je	.L6376
.L5637:
	movq	96(%rsp), %rbx
	movq	248(%rsp), %rdi
	cmpq	8(%rbx), %rdi
	je	.L6377
	cmpq	$0, 64(%rsp)
	je	.L6378
.L5639:
	cmpq	$0, 72(%rsp)
	jne	.L5640
	movq	248(%rsp), %rdi
	movq	64(%rsp), %rsi
.L6274:
	call	build_function_type
	jmp	.L6276
.L5640:
	xorl	%edi, %edi
	call	pushlevel
	movl	$1, %edi
	call	declare_parm_level
	movq	64(%rsp), %rdi
	call	list_length
	movq	$0, 88(%rsp)
	testl	%eax, %eax
	jle	.L6068
	movl	%eax, %ebx
.L5645:
	movq	88(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	call	tree_cons
	decl	%ebx
	movq	%rax, 88(%rsp)
	jne	.L5645
.L6068:
	cmpq	$0, 64(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 80(%rsp)
	je	.L6070
.L5985:
	movq	64(%rsp), %r15
	movq	32(%r15), %rdx
	testq	%rdx, %rdx
	jne	.L5650
	movq	72(%rsp), %r11
	movq	32(%r11), %rax
.L6229:
	movq	80(%rsp), %rdi
	movq	%rax, 32(%rdi)
.L5651:
.L5648:
	movq	64(%rsp), %r8
	movq	72(%rsp), %r15
	movq	80(%rsp), %r9
	movq	(%r8), %r11
	movq	%r11, 64(%rsp)
	testq	%r11, %r11
	movq	(%r15), %r12
	movq	%r12, 72(%rsp)
	movq	(%r9), %rbp
	movq	%rbp, 80(%rsp)
	jne	.L5985
.L6070:
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	call	poplevel
	movq	88(%rsp), %rsi
	movq	248(%rsp), %rdi
	call	build_function_type
	movq	%rax, 8(%rsp)
	jmp	.L5986
.L5650:
	movq	72(%rsp), %r9
	movq	32(%r9), %rax
	testq	%rax, %rax
	jne	.L5652
	movq	80(%rsp), %rbp
	movq	%rdx, 32(%rbp)
	jmp	.L5648
.L5652:
	cmpb	$21, 16(%rdx)
	je	.L6379
.L5653:
	cmpb	$21, 16(%rax)
	je	.L6380
.L5819:
	movq	64(%rsp), %rsi
	movq	72(%rsp), %rbx
	movq	32(%rsi), %rdi
	movq	32(%rbx), %rsi
	call	common_type
	jmp	.L6229
.L6380:
	movq	64(%rsp), %rbx
	movq	32(%rbx), %rcx
	cmpq	%rcx, %rax
	je	.L5819
	movq	24(%rax), %rsi
	testq	%rsi, %rsi
	movq	%rsi, 32(%rsp)
	je	.L5819
.L5984:
	movq	32(%rsp), %r11
	movq	%rcx, %rbp
	movq	8(%r11), %rbx
	cmpq	%rcx, %rbx
	je	.L6227
	testq	%rbx, %rbx
	je	.L6227
	testq	%rcx, %rcx
	je	.L6227
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L6227
	movzbl	16(%rcx), %eax
	testb	%al, %al
	je	.L6227
	cmpb	$6, %dl
	je	.L6381
.L5828:
	cmpb	$6, %al
	je	.L6382
.L5829:
	cmpb	$10, %dl
	je	.L6383
.L5830:
	cmpb	$10, 16(%rbp)
	je	.L6384
.L5831:
	cmpq	%rbp, %rbx
	movl	$1, 16(%rsp)
	je	.L5827
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L5833
	movl	$0, 16(%rsp)
.L5827:
	movl	16(%rsp), %r12d
	testl	%r12d, %r12d
	jne	.L6385
.L5822:
	movq	32(%rsp), %rdx
	movq	(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, 32(%rsp)
	je	.L5819
	movq	64(%rsp), %rax
	movq	32(%rax), %rcx
	jmp	.L5984
.L6385:
	movq	64(%rsp), %rcx
	movq	80(%rsp), %r15
	movq	32(%rcx), %r8
	movq	%r8, 32(%r15)
.L6253:
	movl	pedantic(%rip), %r10d
	testl	%r10d, %r10d
	je	.L5648
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L5648
.L5833:
	movzbl	17(%rbx), %r8d
	movzbl	62(%rbx), %r15d
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r15b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r15d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r15d
	orl	%r8d, %edx
	orl	%r15d, %edx
	cmpb	$20, %sil
	je	.L6386
.L5835:
	movzbl	17(%rbp), %r9d
	leal	0(,%rcx,8), %edi
	movzbl	62(%rbp), %ecx
	orl	%edx, %edi
	movl	%r9d, %edx
	shrb	$5, %cl
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %ecx
	orl	%r9d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L6387
.L5836:
	leal	0(,%rcx,8), %r10d
	movl	$0, 16(%rsp)
	orl	%r10d, %edx
	cmpl	%edx, %edi
	jne	.L5827
	movq	128(%rbp), %rdi
	cmpq	%rdi, 128(%rbx)
	je	.L6227
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 16(%rsp)
	testl	%eax, %eax
	movl	%eax, 240(%rsp)
	je	.L5827
	movl	$0, 16(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L5962
	cmpl	$18, %eax
	ja	.L5979
	cmpl	$13, %eax
	je	.L5840
.L5839:
	cmpl	$2, 240(%rsp)
	jne	.L5827
	cmpl	$1, 16(%rsp)
	movl	240(%rsp), %eax
	cmovne	16(%rsp), %eax
	movl	%eax, 16(%rsp)
	jmp	.L5827
.L5840:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L5841
	call	comptypes
.L6225:
	movl	%eax, 16(%rsp)
	jmp	.L5839
.L5841:
	movl	$1, 16(%rsp)
	jmp	.L5839
.L5979:
	cmpl	$20, %eax
	je	.L5975
	cmpl	$23, %eax
	jne	.L5839
	movl	$1, 28(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L5844
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 28(%rsp)
	je	.L5839
.L5844:
	movq	24(%rbx), %r15
	movq	24(%rbp), %r12
	testq	%r15, %r15
	je	.L6388
	testq	%r12, %r12
	je	.L6389
	movl	$1, 16(%rsp)
	xorl	%ebp, %ebp
.L5959:
	testq	%r15, %r15
	je	.L6390
	testq	%r12, %r12
	je	.L5948
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L6391
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L5934
.L6252:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5948
.L5933:
	cmpl	16(%rsp), %ebp
	movl	16(%rsp), %r11d
	cmovg	%ebp, %r11d
	movl	%r11d, 16(%rsp)
	movq	(%r12), %r12
	movq	(%r15), %r15
	jmp	.L5959
.L5948:
	movl	$0, 16(%rsp)
.L5928:
	cmpl	$1, 16(%rsp)
	movl	16(%rsp), %ebx
	cmove	28(%rsp), %ebx
.L6226:
	movl	%ebx, 16(%rsp)
	jmp	.L5839
.L5934:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L5933
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L6393
.L5938:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L5948
	cmpq	$0, 96(%rax)
	je	.L5949
	testb	$8, 62(%rax)
	je	.L5948
.L5949:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5948
	movq	32(%r15), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5948
	movq	32(%r12), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L5948
.L5955:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5951
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5955
	jmp	.L5948
.L5951:
	testq	%rbx, %rbx
	jne	.L5933
	jmp	.L5948
.L6393:
	cmpq	$0, 96(%rax)
	je	.L5939
	testb	$8, 62(%rax)
	je	.L5938
.L5939:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5938
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5938
	movq	32(%r15), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L5948
.L5945:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5951
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5945
	jmp	.L5948
.L6391:
	movq	32(%r12), %rdi
	jmp	.L6252
.L6390:
	testq	%r12, %r12
	je	.L5928
	jmp	.L5948
.L6389:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5839
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L6103
	movq	%rax, %rbp
	movl	$1, %r12d
	movl	$0, 20(%rsp)
.L5923:
	testq	%r15, %r15
	je	.L6394
	testq	%rbp, %rbp
	je	.L5912
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L6395
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5898
.L6251:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5912
.L5897:
	cmpl	%r12d, 20(%rsp)
	movq	(%r15), %r15
	cmovg	20(%rsp), %r12d
	movq	(%rbp), %rbp
	jmp	.L5923
.L5912:
	xorl	%r12d, %r12d
.L5892:
	decl	%r12d
	movl	$2, 16(%rsp)
	jne	.L5839
	movl	28(%rsp), %eax
	movl	%eax, 16(%rsp)
	jmp	.L5839
.L5898:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 20(%rsp)
	jne	.L5897
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L6397
.L5902:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5912
	cmpq	$0, 96(%rax)
	je	.L5913
	testb	$8, 62(%rax)
	je	.L5912
.L5913:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5912
	movq	32(%r15), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5912
	movq	32(%rbp), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L5912
.L5919:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5915
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5919
	jmp	.L5912
.L5915:
	testq	%rbx, %rbx
	jne	.L5897
	jmp	.L5912
.L6397:
	cmpq	$0, 96(%rax)
	je	.L5903
	testb	$8, 62(%rax)
	je	.L5902
.L5903:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5902
	movq	32(%rbp), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5902
	movq	32(%r15), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L5912
.L5909:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5915
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5909
	jmp	.L5912
.L6395:
	movq	32(%rbp), %rdi
	jmp	.L6251
.L6394:
	testq	%rbp, %rbp
	je	.L5892
	jmp	.L5912
.L6103:
	movl	28(%rsp), %eax
	jmp	.L6225
.L6388:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5839
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L6101
	movq	%rax, %rbp
	movl	$1, %r15d
	movl	$0, 24(%rsp)
.L5884:
	testq	%r12, %r12
	je	.L6398
	testq	%rbp, %rbp
	je	.L5873
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L6399
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5859
.L6250:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5873
.L5858:
	cmpl	%r15d, 24(%rsp)
	movq	(%r12), %r12
	cmovg	24(%rsp), %r15d
	movq	(%rbp), %rbp
	jmp	.L5884
.L5873:
	xorl	%r15d, %r15d
.L5853:
	decl	%r15d
	movl	$2, 16(%rsp)
	jne	.L5839
	movl	28(%rsp), %ebx
	jmp	.L6226
.L5859:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 24(%rsp)
	jne	.L5858
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L6401
.L5863:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5873
	cmpq	$0, 96(%rax)
	je	.L5874
	testb	$8, 62(%rax)
	je	.L5873
.L5874:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5873
	movq	32(%r12), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5873
	movq	32(%rbp), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L5873
.L5880:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5876
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5880
	jmp	.L5873
.L5876:
	testq	%rbx, %rbx
	jne	.L5858
	jmp	.L5873
.L6401:
	cmpq	$0, 96(%rax)
	je	.L5864
	testb	$8, 62(%rax)
	je	.L5863
.L5864:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5863
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5863
	movq	32(%r12), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L5873
.L5870:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5876
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5870
	jmp	.L5873
.L6399:
	movq	32(%rbp), %rdi
	jmp	.L6250
.L6398:
	testq	%rbp, %rbp
	je	.L5853
	jmp	.L5873
.L6101:
	movl	28(%rsp), %ebp
	movl	%ebp, 16(%rsp)
	jmp	.L5839
.L5975:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	16(%rsp), %eax
	jmp	.L6225
.L5962:
	movq	24(%rbx), %r12
	movq	24(%rbp), %r15
	movl	$1, 16(%rsp)
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L5963
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 16(%rsp)
	je	.L5822
.L5963:
	testq	%r12, %r12
	je	.L5839
	testq	%r15, %r15
	je	.L5839
	cmpq	%r15, %r12
	je	.L5839
	movq	112(%r12), %rcx
	movq	112(%r15), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L5966
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L6402
.L5967:
	movl	$1, %r8d
.L5966:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L5968
	movq	104(%r15), %r9
	cmpb	$25, 16(%r9)
	je	.L6403
.L5969:
	movl	$1, %ecx
.L5968:
	testb	%r8b, %r8b
	jne	.L5839
	testb	%cl, %cl
	jne	.L5839
	testb	%dil, %dil
	je	.L6158
	testb	%dl, %dl
.L6224:
	jne	.L5839
.L5974:
	movl	$0, 16(%rsp)
	jmp	.L5839
.L6158:
	testb	%dl, %dl
	jne	.L5974
	movq	104(%r12), %rdi
	movq	104(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5974
	movq	112(%r12), %rdi
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L6224
.L6403:
	cmpb	$25, 16(%rsi)
	jne	.L5969
	jmp	.L5968
.L6402:
	cmpb	$25, 16(%rcx)
	jne	.L5967
	jmp	.L5966
.L6227:
	movl	$1, 16(%rsp)
	jmp	.L5827
.L6387:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5836
.L6386:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5835
.L6384:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L5831
.L6383:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L5830
.L6382:
	testb	$2, 62(%rcx)
	je	.L5829
	movq	24(%rcx), %r12
	testq	%r12, %r12
	cmovne	%r12, %rbp
	jmp	.L5829
.L6381:
	testb	$2, 62(%rbx)
	je	.L5828
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5828
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L5828
.L6379:
	cmpq	%rax, %rdx
	je	.L5653
	movq	24(%rdx), %rsi
	testq	%rsi, %rsi
	movq	%rsi, 56(%rsp)
	je	.L5653
.L5818:
	movq	56(%rsp), %r10
	movq	%rax, %rbp
	movq	8(%r10), %rbx
	cmpq	%rax, %rbx
	je	.L5660
	testq	%rbx, %rbx
	je	.L5660
	testq	%rax, %rax
	je	.L5660
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L5660
	movzbl	16(%rax), %ecx
	testb	%cl, %cl
	jne	.L5659
.L5660:
	movl	$1, 40(%rsp)
.L5661:
	movl	40(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L6404
.L5656:
	movq	56(%rsp), %r10
	movq	(%r10), %r9
	testq	%r9, %r9
	movq	%r9, 56(%rsp)
	jne	.L5818
	jmp	.L5653
.L6404:
	movq	80(%rsp), %rdi
	movq	%rax, 32(%rdi)
	jmp	.L6253
.L5659:
	cmpb	$6, %dl
	je	.L6405
.L5662:
	cmpb	$6, %cl
	je	.L6406
.L5663:
	cmpb	$10, %dl
	je	.L6407
.L5664:
	cmpb	$10, 16(%rbp)
	je	.L6408
.L5665:
	cmpq	%rbp, %rbx
	je	.L6409
	movzbl	16(%rbx), %edi
	cmpb	16(%rbp), %dil
	je	.L5667
	movl	$0, 40(%rsp)
.L6179:
	movq	72(%rsp), %r8
	movq	32(%r8), %rax
	jmp	.L5661
.L5667:
	movzbl	17(%rbx), %r12d
	movzbl	62(%rbx), %ecx
	movl	%r12d, %edx
	shrb	$5, %cl
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r12d, %r12d
	sall	$2, %ecx
	orl	%r12d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L6410
.L5669:
	movzbl	17(%rbp), %r11d
	movzbl	62(%rbp), %r15d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r11d, %edx
	shrb	$5, %r15b
	shrb	$3, %r11b
	shrb	$4, %dl
	andl	$1, %r11d
	andl	$1, %r15d
	andl	$1, %edx
	addl	%r11d, %r11d
	sall	$2, %r15d
	orl	%r11d, %edx
	orl	%r15d, %edx
	cmpb	$20, %dil
	je	.L6411
.L5670:
	leal	0(,%rcx,8), %edi
	orl	%edi, %edx
	cmpl	%edx, %esi
	je	.L6412
.L6249:
	movl	$0, 40(%rsp)
.L6223:
	movq	72(%rsp), %r12
	movq	32(%r12), %rax
	jmp	.L5661
.L6412:
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L6413
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 244(%rsp)
	je	.L6249
	movl	$0, 40(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L5796
	cmpl	$18, %eax
	ja	.L5813
	cmpl	$13, %eax
	je	.L5674
.L5673:
	cmpl	$2, 244(%rsp)
	je	.L6414
.L6178:
	movq	72(%rsp), %r15
	movq	32(%r15), %rax
	jmp	.L5661
.L6414:
	cmpl	$1, 40(%rsp)
	jne	.L6179
	movl	$2, 40(%rsp)
	jmp	.L6223
.L5674:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L5675
	call	comptypes
.L6221:
	movl	%eax, 40(%rsp)
	jmp	.L5673
.L5675:
	movl	$1, 40(%rsp)
	jmp	.L5673
.L5813:
	cmpl	$20, %eax
	je	.L5809
	cmpl	$23, %eax
	jne	.L5673
	movl	$1, 52(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L5678
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 52(%rsp)
	je	.L5673
.L5678:
	movq	24(%rbx), %r15
	movq	24(%rbp), %r12
	testq	%r15, %r15
	je	.L6415
	testq	%r12, %r12
	je	.L6416
	movl	$1, 40(%rsp)
	xorl	%ebp, %ebp
.L5793:
	testq	%r15, %r15
	je	.L6417
	testq	%r12, %r12
	je	.L5782
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L6418
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L5768
.L6248:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5782
.L5767:
	cmpl	40(%rsp), %ebp
	movl	40(%rsp), %esi
	cmovg	%ebp, %esi
	movl	%esi, 40(%rsp)
	movq	(%r12), %r12
	movq	(%r15), %r15
	jmp	.L5793
.L5782:
	movl	$0, 40(%rsp)
.L5762:
	cmpl	$1, 40(%rsp)
	movl	40(%rsp), %ebx
	cmove	52(%rsp), %ebx
.L6222:
	movl	%ebx, 40(%rsp)
	jmp	.L5673
.L5768:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L5767
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L6420
.L5772:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L5782
	cmpq	$0, 96(%rax)
	je	.L5783
	testb	$8, 62(%rax)
	je	.L5782
.L5783:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5782
	movq	32(%r15), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5782
	movq	32(%r12), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L5782
.L5789:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5785
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5789
	jmp	.L5782
.L5785:
	testq	%rbx, %rbx
	jne	.L5767
	jmp	.L5782
.L6420:
	cmpq	$0, 96(%rax)
	je	.L5773
	testb	$8, 62(%rax)
	je	.L5772
.L5773:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5772
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5772
	movq	32(%r15), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L5782
.L5779:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5785
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5779
	jmp	.L5782
.L6418:
	movq	32(%r12), %rdi
	jmp	.L6248
.L6417:
	testq	%r12, %r12
	je	.L5762
	jmp	.L5782
.L6416:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5673
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L6099
	movq	%rax, %rbp
	movl	$1, %r12d
	movl	$0, 44(%rsp)
.L5757:
	testq	%r15, %r15
	je	.L6421
	testq	%rbp, %rbp
	je	.L5746
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L6422
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5732
.L6247:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5746
.L5731:
	cmpl	%r12d, 44(%rsp)
	movq	(%r15), %r15
	cmovg	44(%rsp), %r12d
	movq	(%rbp), %rbp
	jmp	.L5757
.L5746:
	xorl	%r12d, %r12d
.L5726:
	decl	%r12d
	movl	$2, 40(%rsp)
	jne	.L5673
	movl	52(%rsp), %ebp
	movl	%ebp, 40(%rsp)
	jmp	.L5673
.L5732:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 44(%rsp)
	jne	.L5731
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L6424
.L5736:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5746
	cmpq	$0, 96(%rax)
	je	.L5747
	testb	$8, 62(%rax)
	je	.L5746
.L5747:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5746
	movq	32(%r15), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5746
	movq	32(%rbp), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L5746
.L5753:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5749
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5753
	jmp	.L5746
.L5749:
	testq	%rbx, %rbx
	jne	.L5731
	jmp	.L5746
.L6424:
	cmpq	$0, 96(%rax)
	je	.L5737
	testb	$8, 62(%rax)
	je	.L5736
.L5737:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5736
	movq	32(%rbp), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5736
	movq	32(%r15), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L5746
.L5743:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5749
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5743
	jmp	.L5746
.L6422:
	movq	32(%rbp), %rdi
	jmp	.L6247
.L6421:
	testq	%rbp, %rbp
	je	.L5726
	jmp	.L5746
.L6099:
	movl	52(%rsp), %eax
	jmp	.L6221
.L6415:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5673
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L6097
	movq	%rax, %rbp
	movl	$1, %r15d
	movl	$0, 48(%rsp)
.L5718:
	testq	%r12, %r12
	je	.L6425
	testq	%rbp, %rbp
	je	.L5707
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L6426
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5693
.L6246:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5707
.L5692:
	cmpl	%r15d, 48(%rsp)
	movq	(%r12), %r12
	cmovg	48(%rsp), %r15d
	movq	(%rbp), %rbp
	jmp	.L5718
.L5707:
	xorl	%r15d, %r15d
.L5687:
	decl	%r15d
	movl	$2, 40(%rsp)
	jne	.L5673
	movl	52(%rsp), %ebx
	jmp	.L6222
.L5693:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 48(%rsp)
	jne	.L5692
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L6428
.L5697:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5707
	cmpq	$0, 96(%rax)
	je	.L5708
	testb	$8, 62(%rax)
	je	.L5707
.L5708:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5707
	movq	32(%r12), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5707
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L5707
.L5714:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5710
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5714
	jmp	.L5707
.L5710:
	testq	%rbx, %rbx
	jne	.L5692
	jmp	.L5707
.L6428:
	cmpq	$0, 96(%rax)
	je	.L5698
	testb	$8, 62(%rax)
	je	.L5697
.L5698:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5697
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5697
	movq	32(%r12), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L5707
.L5704:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5710
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5704
	jmp	.L5707
.L6426:
	movq	32(%rbp), %rdi
	jmp	.L6246
.L6425:
	testq	%rbp, %rbp
	je	.L5687
	jmp	.L5707
.L6097:
	movl	52(%rsp), %eax
	movl	%eax, 40(%rsp)
	jmp	.L5673
.L5809:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	40(%rsp), %eax
	jmp	.L6221
.L5796:
	movq	24(%rbx), %r12
	movq	24(%rbp), %r15
	movl	$1, 40(%rsp)
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L5797
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 40(%rsp)
	je	.L6177
.L5797:
	testq	%r12, %r12
	je	.L5673
	testq	%r15, %r15
	je	.L5673
	cmpq	%r15, %r12
	je	.L5673
	movq	112(%r12), %rcx
	movq	112(%r15), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L5800
	movq	104(%r12), %r11
	cmpb	$25, 16(%r11)
	je	.L6429
.L5801:
	movl	$1, %r8d
.L5800:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L5802
	movq	104(%r15), %rbp
	cmpb	$25, 16(%rbp)
	je	.L6430
.L5803:
	movl	$1, %ecx
.L5802:
	testb	%r8b, %r8b
	jne	.L5673
	testb	%cl, %cl
	jne	.L5673
	testb	%dil, %dil
	je	.L6148
	testb	%dl, %dl
.L6220:
	jne	.L5673
.L5808:
	movl	$0, 40(%rsp)
	jmp	.L5673
.L6148:
	testb	%dl, %dl
	jne	.L5808
	movq	104(%r12), %rdi
	movq	104(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5808
	movq	112(%r12), %rdi
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L6220
.L6430:
	cmpb	$25, 16(%rsi)
	jne	.L5803
	jmp	.L5802
.L6429:
	cmpb	$25, 16(%rcx)
	jne	.L5801
	jmp	.L5800
.L6177:
	movq	72(%rsp), %rdx
	movq	32(%rdx), %rax
	jmp	.L5656
.L6413:
	movl	$1, 40(%rsp)
	jmp	.L6179
.L6411:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5670
.L6410:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5669
.L6409:
	movl	$1, 40(%rsp)
	jmp	.L6178
.L6408:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L5665
.L6407:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L5664
.L6406:
	testb	$2, 62(%rax)
	je	.L5663
	movq	24(%rax), %r8
	testq	%r8, %r8
	cmovne	%r8, %rbp
	jmp	.L5663
.L6405:
	testb	$2, 62(%rbx)
	je	.L5662
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5662
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L5662
.L6378:
	movq	96(%rsp), %rbx
	movq	248(%rsp), %rdi
	movq	24(%rbx), %rsi
	jmp	.L6274
.L6377:
	cmpq	$0, 64(%rsp)
	jne	.L5639
.L6275:
	movq	%rbx, %rdi
	jmp	.L6272
.L6376:
	testq	%rcx, %rcx
	jne	.L5637
	jmp	.L6275
.L6160:
	movq	8(%rsp), %rdi
.L5598:
	cmpl	$8, %ebp
	movq	96(%rsp), %rsi
	je	.L6431
.L5600:
	call	common_type
	cmpl	$8, %ebx
	movq	%rax, %rdi
	je	.L6432
.L5601:
	cmpl	$8, %ebp
	je	.L6433
.L5603:
	call	build_complex_type
	jmp	.L6276
.L6433:
	movq	96(%rsp), %rax
	cmpq	%rdi, 8(%rax)
	jne	.L5603
	jmp	.L6276
.L6432:
	movq	8(%rsp), %rbx
	cmpq	%rax, 8(%rbx)
	jne	.L5601
	jmp	.L6275
.L6431:
	movq	8(%rsi), %rsi
	jmp	.L5600
.L6137:
	movq	8(%rsp), %rsi
	movq	8(%rsi), %rdi
	jmp	.L5598
.L6369:
	movzwl	60(%r15), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, 96(%rsp)
	jmp	.L5594
.L6368:
	movzwl	60(%rdx), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, 8(%rsp)
	jmp	.L5593
.L5427:
	movq	%r13, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L5989
	movq	8(%r12), %rdi
	cmpq	global_trees+216(%rip), %rdi
	je	.L6434
.L5989:
	movq	%r14, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L6181
	movq	8(%r15), %r8
	cmpq	global_trees+216(%rip), %r8
	je	.L6435
.L5996:
	movq	8(%r12), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$5, %al
	je	.L6436
	cmpb	$5, 16(%r8)
	je	.L6437
	movl	$.LC58, %edi
	xorl	%eax, %eax
	call	pedwarn
	movq	global_trees+216(%rip), %rdi
.L6230:
	call	build_pointer_type
	jmp	.L6231
.L6437:
	movl	pedantic(%rip), %esi
	testl	%esi, %esi
	je	.L6010
	cmpb	$23, %al
	je	.L6438
.L6010:
	movzbl	17(%r8), %r10d
	movzbl	62(%r8), %r9d
	xorl	%ecx, %ecx
	movl	%r10d, %edx
	shrb	$5, %r9b
	shrb	$3, %r10b
	shrb	$4, %dl
	andl	$1, %r10d
	andl	$1, %r9d
	andl	$1, %edx
	addl	%r10d, %r10d
	sall	$2, %r9d
	orl	%r10d, %edx
	orl	%r9d, %edx
	cmpb	$20, 16(%r8)
	je	.L6439
.L6011:
	movzbl	17(%rdi), %r15d
	leal	0(,%rcx,8), %esi
	movzbl	62(%rdi), %ecx
	orl	%edx, %esi
	movl	%r15d, %edx
	shrb	$5, %cl
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	$1, %r15d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r15d, %r15d
	sall	$2, %ecx
	orl	%r15d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, 16(%rdi)
	je	.L6440
.L6012:
	leal	0(,%rcx,8), %edi
	orl	%edi, %edx
	movq	%r8, %rdi
	orl	%edx, %esi
.L6254:
	call	c_build_qualified_type
	movq	%rax, %rdi
	jmp	.L6230
.L6440:
	cmpq	$0, 8(%rdi)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6012
.L6439:
	cmpq	$0, 8(%r8)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6011
.L6438:
	movl	$.LC57, %edi
	xorl	%eax, %eax
	call	pedwarn
	movq	8(%r12), %rdi
	movq	8(%r15), %r8
	jmp	.L6010
.L6436:
	movl	pedantic(%rip), %edx
	testl	%edx, %edx
	je	.L6004
	cmpb	$23, 16(%r8)
	je	.L6441
.L6004:
	movzbl	17(%rdi), %ebx
	movzbl	62(%rdi), %r12d
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	shrb	$5, %r12b
	shrb	$3, %bl
	shrb	$4, %dl
	andl	$1, %ebx
	andl	$1, %r12d
	andl	$1, %edx
	addl	%ebx, %ebx
	sall	$2, %r12d
	orl	%ebx, %edx
	orl	%r12d, %edx
	cmpb	$20, 16(%rdi)
	je	.L6442
.L6005:
	movzbl	17(%r8), %ebp
	movzbl	62(%r8), %r11d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%ebp, %edx
	shrb	$5, %r11b
	shrb	$3, %bpl
	shrb	$4, %dl
	andl	$1, %ebp
	andl	$1, %r11d
	andl	$1, %edx
	addl	%ebp, %ebp
	sall	$2, %r11d
	orl	%ebp, %edx
	orl	%r11d, %edx
	cmpb	$20, 16(%r8)
	je	.L6443
.L6006:
	leal	0(,%rcx,8), %r8d
	orl	%r8d, %edx
	orl	%edx, %esi
	jmp	.L6254
.L6443:
	cmpq	$0, 8(%r8)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6006
.L6442:
	cmpq	$0, 8(%rdi)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6005
.L6441:
	movl	$.LC57, %edi
	xorl	%eax, %eax
	call	pedwarn
	movq	8(%r12), %rdi
	movq	8(%r15), %r8
	jmp	.L6004
.L6435:
	movq	312(%rsp), %rax
	cmpb	$115, 16(%rax)
	je	.L5996
	movzbl	17(%r12), %r9d
	movzbl	62(%r12), %esi
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %sil
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %esi
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %esi
	orl	%r9d, %edx
	orl	%esi, %edx
	cmpb	$20, 16(%r12)
	je	.L6444
.L5999:
	leal	0(,%rcx,8), %esi
	movzbl	62(%r15), %r10d
	movzbl	17(%r15), %ecx
	orl	%edx, %esi
	movl	%ecx, %edx
	shrb	$5, %r10b
	shrb	$3, %cl
	shrb	$4, %dl
	andl	$1, %ecx
	andl	$1, %r10d
	addl	%ecx, %ecx
	andl	$1, %edx
	sall	$2, %r10d
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	orl	%r10d, %edx
	cmpb	$20, 16(%r15)
	je	.L6445
.L6000:
	leal	0(,%rcx,8), %r15d
	movq	%r12, %rdi
	orl	%r15d, %edx
	orl	%edx, %esi
.L6273:
	call	c_build_qualified_type
	jmp	.L6231
.L6445:
	testq	%r8, %r8
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6000
.L6444:
	cmpq	$0, 8(%r12)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5999
.L6181:
	movq	8(%r15), %r8
	jmp	.L5996
.L6434:
	movq	320(%rsp), %r10
	cmpb	$115, 16(%r10)
	je	.L5989
	movzbl	17(%r15), %ebx
	movzbl	62(%r15), %ecx
	movl	%ebx, %edx
	shrb	$5, %cl
	shrb	$3, %bl
	shrb	$4, %dl
	andl	$1, %ebx
	andl	$1, %ecx
	andl	$1, %edx
	addl	%ebx, %ebx
	sall	$2, %ecx
	orl	%ebx, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, 16(%r15)
	je	.L6446
.L5992:
	movzbl	17(%r12), %ebp
	movzbl	62(%r12), %r11d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%ebp, %edx
	shrb	$5, %r11b
	shrb	$3, %bpl
	shrb	$4, %dl
	andl	$1, %ebp
	andl	$1, %r11d
	andl	$1, %edx
	addl	%ebp, %ebp
	sall	$2, %r11d
	orl	%ebp, %edx
	orl	%r11d, %edx
	cmpb	$20, 16(%r12)
	je	.L6447
.L5993:
	leal	0(,%rcx,8), %edi
	orl	%edi, %edx
	movq	%r15, %rdi
	orl	%edx, %esi
	jmp	.L6273
.L6447:
	testq	%rdi, %rdi
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5993
.L6446:
	cmpq	$0, 8(%r15)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5992
.L6367:
	movq	8(%r12), %r8
	movq	8(%r15), %rdi
	movq	128(%r8), %rbx
	movq	128(%rdi), %rbp
	cmpq	%rbp, %rbx
	je	.L6219
	testq	%rbx, %rbx
	je	.L6219
	testq	%rbp, %rbp
	je	.L6219
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L6219
	movzbl	16(%rbp), %eax
	testb	%al, %al
	je	.L6219
	cmpb	$6, %dl
	je	.L6448
.L5433:
	cmpb	$6, %al
	je	.L6449
.L5434:
	cmpb	$10, %dl
	je	.L6450
.L5435:
	cmpb	$10, 16(%rbp)
	je	.L6451
.L5436:
	cmpq	%rbp, %rbx
	movl	$1, 108(%rsp)
	je	.L5432
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L5438
	movl	$0, 108(%rsp)
.L5432:
	cmpl	$2, 108(%rsp)
	je	.L6452
.L5588:
	movl	108(%rsp), %eax
	jmp	.L5429
.L6452:
	movl	pedantic(%rip), %edi
	testl	%edi, %edi
	je	.L5588
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L5588
.L5438:
	movzbl	17(%rbx), %r9d
	movzbl	62(%rbx), %r11d
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %r11b
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %r11d
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %r11d
	orl	%r9d, %edx
	orl	%r11d, %edx
	cmpb	$20, %sil
	je	.L6453
.L5440:
	movzbl	17(%rbp), %r8d
	movzbl	62(%rbp), %r10d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r10b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r10d
	orl	%r8d, %edx
	orl	%r10d, %edx
	cmpb	$20, %sil
	je	.L6454
.L5441:
	leal	0(,%rcx,8), %esi
	movl	$0, 108(%rsp)
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L5432
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L6219
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 108(%rsp)
	testl	%eax, %eax
	movl	%eax, 284(%rsp)
	je	.L5432
	movl	$0, 108(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L5567
	cmpl	$18, %eax
	ja	.L5584
	cmpl	$13, %eax
	je	.L5445
.L5444:
	cmpl	$2, 284(%rsp)
	jne	.L5432
	cmpl	$1, 108(%rsp)
	movl	284(%rsp), %eax
	cmovne	108(%rsp), %eax
	movl	%eax, 108(%rsp)
	jmp	.L5432
.L5445:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L5446
	call	comptypes
.L6218:
	movl	%eax, 108(%rsp)
	jmp	.L5444
.L5446:
	movl	$1, 108(%rsp)
	jmp	.L5444
.L5584:
	cmpl	$20, %eax
	je	.L5580
	cmpl	$23, %eax
	jne	.L5444
	movl	$1, 148(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L5449
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 148(%rsp)
	je	.L5444
.L5449:
	movq	24(%rbx), %rax
	movq	%rax, 112(%rsp)
	testq	%rax, %rax
	movq	24(%rbp), %rcx
	movq	%rcx, 120(%rsp)
	je	.L6455
	cmpq	$0, 120(%rsp)
	je	.L6456
	movl	$1, 108(%rsp)
	xorl	%ebp, %ebp
.L5564:
	cmpq	$0, 112(%rsp)
	je	.L6457
	cmpq	$0, 120(%rsp)
	je	.L5553
	movq	112(%rsp), %r8
	movq	32(%r8), %rdi
	testq	%rdi, %rdi
	je	.L6458
	movq	120(%rsp), %rcx
	movq	32(%rcx), %rax
	testq	%rax, %rax
	jne	.L5539
.L6245:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5553
.L5538:
	cmpl	108(%rsp), %ebp
	movl	108(%rsp), %r8d
	movq	112(%rsp), %r10
	movq	120(%rsp), %r9
	cmovg	%ebp, %r8d
	movl	%r8d, 108(%rsp)
	movq	(%r10), %rdi
	movq	%rdi, 112(%rsp)
	movq	(%r9), %rax
	movq	%rax, 120(%rsp)
	jmp	.L5564
.L5553:
	movl	$0, 108(%rsp)
.L5533:
	cmpl	$1, 108(%rsp)
	movl	108(%rsp), %eax
	cmove	148(%rsp), %eax
	jmp	.L6218
.L5539:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L5538
	movq	112(%rsp), %rdx
	movq	32(%rdx), %rax
	cmpb	$21, 16(%rax)
	je	.L6460
.L5543:
	movq	120(%rsp), %r8
	movq	32(%r8), %rax
	cmpb	$21, 16(%rax)
	jne	.L5553
	cmpq	$0, 96(%rax)
	je	.L5554
	testb	$8, 62(%rax)
	je	.L5553
.L5554:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5553
	movq	112(%rsp), %rsi
	movq	32(%rsi), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5553
	movq	120(%rsp), %r11
	movq	32(%r11), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L5553
.L5560:
	movq	112(%rsp), %rcx
	movq	8(%rbx), %rdi
	movq	32(%rcx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5556
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5560
	jmp	.L5553
.L5556:
	testq	%rbx, %rbx
	jne	.L5538
	jmp	.L5553
.L6460:
	cmpq	$0, 96(%rax)
	je	.L5544
	testb	$8, 62(%rax)
	je	.L5543
.L5544:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5543
	movq	120(%rsp), %rax
	movq	32(%rax), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5543
	movq	112(%rsp), %rdi
	movq	32(%rdi), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L5553
.L5550:
	movq	120(%rsp), %r10
	movq	8(%rbx), %rdi
	movq	32(%r10), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5556
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5550
	jmp	.L5553
.L6458:
	movq	120(%rsp), %rsi
	movq	32(%rsi), %rdi
	jmp	.L6245
.L6457:
	cmpq	$0, 120(%rsp)
	je	.L5533
	jmp	.L5553
.L6456:
	movq	112(%rsp), %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5444
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L6095
	movq	%rax, %rbp
	movl	$1, 132(%rsp)
	movl	$0, 136(%rsp)
.L5528:
	cmpq	$0, 112(%rsp)
	je	.L6461
	testq	%rbp, %rbp
	je	.L5517
	movq	112(%rsp), %r9
	movq	32(%r9), %rdi
	testq	%rdi, %rdi
	je	.L6462
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5503
.L6243:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5517
.L5502:
	movl	132(%rsp), %r10d
	movl	136(%rsp), %ebx
	cmpl	%r10d, 136(%rsp)
	movq	112(%rsp), %rdi
	cmovle	%r10d, %ebx
	movl	%ebx, 132(%rsp)
	movq	(%rdi), %r9
	movq	%r9, 112(%rsp)
	movq	(%rbp), %rbp
	jmp	.L5528
.L5517:
	movl	$0, 132(%rsp)
.L5497:
	movl	$2, 108(%rsp)
	cmpl	$1, 132(%rsp)
.L6244:
	jne	.L5444
	movl	148(%rsp), %ebp
	movl	%ebp, 108(%rsp)
	jmp	.L5444
.L5503:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 136(%rsp)
	jne	.L5502
	movq	112(%rsp), %rdi
	movq	32(%rdi), %rax
	cmpb	$21, 16(%rax)
	je	.L6464
.L5507:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5517
	cmpq	$0, 96(%rax)
	je	.L5518
	testb	$8, 62(%rax)
	je	.L5517
.L5518:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5517
	movq	112(%rsp), %rax
	movq	32(%rax), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5517
	movq	32(%rbp), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L5517
.L5524:
	movq	112(%rsp), %r11
	movq	8(%rbx), %rdi
	movq	32(%r11), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5520
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5524
	jmp	.L5517
.L5520:
	testq	%rbx, %rbx
	jne	.L5502
	jmp	.L5517
.L6464:
	cmpq	$0, 96(%rax)
	je	.L5508
	testb	$8, 62(%rax)
	je	.L5507
.L5508:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5507
	movq	32(%rbp), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5507
	movq	112(%rsp), %rsi
	movq	32(%rsi), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L5517
.L5514:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5520
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5514
	jmp	.L5517
.L6462:
	movq	32(%rbp), %rdi
	jmp	.L6243
.L6461:
	testq	%rbp, %rbp
	je	.L5497
	jmp	.L5517
.L6095:
	movl	148(%rsp), %eax
	jmp	.L6218
.L6455:
	movq	%rcx, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L5444
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L6095
	movq	%rax, %rbp
	movl	$1, 140(%rsp)
	movl	$0, 144(%rsp)
.L5489:
	cmpq	$0, 120(%rsp)
	je	.L6465
	testq	%rbp, %rbp
	je	.L5478
	movq	120(%rsp), %rcx
	movq	32(%rcx), %rdi
	testq	%rdi, %rdi
	je	.L6466
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L5464
.L6242:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L5478
.L5463:
	movl	140(%rsp), %r11d
	movl	144(%rsp), %ebx
	cmpl	%r11d, 144(%rsp)
	movq	120(%rsp), %rcx
	cmovle	%r11d, %ebx
	movl	%ebx, 140(%rsp)
	movq	(%rcx), %rax
	movq	%rax, 120(%rsp)
	movq	(%rbp), %rbp
	jmp	.L5489
.L5478:
	movl	$0, 140(%rsp)
.L5458:
	cmpl	$1, 140(%rsp)
	movl	$2, 108(%rsp)
	jmp	.L6244
.L5464:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 144(%rsp)
	jne	.L5463
	movq	120(%rsp), %rbx
	movq	32(%rbx), %rax
	cmpb	$21, 16(%rax)
	je	.L6468
.L5468:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L5478
	cmpq	$0, 96(%rax)
	je	.L5479
	testb	$8, 62(%rax)
	je	.L5478
.L5479:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5478
	movq	120(%rsp), %r8
	movq	32(%r8), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5478
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L5478
.L5485:
	movq	120(%rsp), %rdx
	movq	8(%rbx), %rdi
	movq	32(%rdx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5481
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5485
	jmp	.L5478
.L5481:
	testq	%rbx, %rbx
	jne	.L5463
	jmp	.L5478
.L6468:
	cmpq	$0, 96(%rax)
	je	.L5469
	testb	$8, 62(%rax)
	je	.L5468
.L5469:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L5468
	movq	32(%rbp), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5468
	movq	120(%rsp), %r9
	movq	32(%r9), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L5478
.L5475:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L5481
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L5475
	jmp	.L5478
.L6466:
	movq	32(%rbp), %rdi
	jmp	.L6242
.L6465:
	testq	%rbp, %rbp
	je	.L5458
	jmp	.L5478
.L5580:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	108(%rsp), %eax
	jmp	.L6218
.L5567:
	movq	24(%rbx), %r11
	movq	%r11, 272(%rsp)
	movq	24(%rbp), %rsi
	movl	$1, 108(%rsp)
	movq	%rsi, 264(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L5568
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 108(%rsp)
	je	.L5432
.L5568:
	cmpq	$0, 272(%rsp)
	je	.L5444
	cmpq	$0, 264(%rsp)
	je	.L5444
	movq	264(%rsp), %rbx
	cmpq	%rbx, 272(%rsp)
	je	.L5444
	movq	272(%rsp), %rax
	movq	112(%rbx), %rsi
	movq	112(%rax), %rcx
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L5571
	movq	104(%rax), %rbp
	cmpb	$25, 16(%rbp)
	je	.L6469
.L5572:
	movl	$1, %r8d
.L5571:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L5573
	movq	264(%rsp), %rax
	movq	104(%rax), %r10
	cmpb	$25, 16(%r10)
	je	.L6470
.L5574:
	movl	$1, %ecx
.L5573:
	testb	%r8b, %r8b
	jne	.L5444
	testb	%cl, %cl
	jne	.L5444
	testb	%dil, %dil
	je	.L6136
	testb	%dl, %dl
.L6217:
	jne	.L5444
.L5579:
	movl	$0, 108(%rsp)
	jmp	.L5444
.L6136:
	testb	%dl, %dl
	jne	.L5579
	movq	272(%rsp), %rdx
	movq	264(%rsp), %rbx
	movq	104(%rdx), %rdi
	movq	104(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L5579
	movq	272(%rsp), %r8
	movq	264(%rsp), %rcx
	movq	112(%r8), %rdi
	movq	112(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L6217
.L6470:
	cmpb	$25, 16(%rsi)
	jne	.L5574
	jmp	.L5573
.L6469:
	cmpb	$25, 16(%rcx)
	jne	.L5572
	jmp	.L5571
.L6219:
	movl	$1, 108(%rsp)
	jmp	.L5432
.L6454:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5441
.L6453:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L5440
.L6451:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L5436
.L6450:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L5435
.L6449:
	testb	$2, 62(%rbp)
	je	.L5434
	movq	24(%rbp), %rcx
	testq	%rcx, %rcx
	cmovne	%rcx, %rbp
	jmp	.L5434
.L6448:
	testb	$2, 62(%rbx)
	je	.L5433
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5433
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L5433
	.p2align 6,,7
.L5422:
	movl	pedantic(%rip), %ebp
	testl	%ebp, %ebp
	je	.L5423
	cmpl	$5, %esi
	je	.L6471
.L5424:
	movl	$.LC56, %edi
	xorl	%eax, %eax
	call	pedwarn
.L5423:
	movq	global_trees+216(%rip), %r15
	movq	%r15, 8(%rsp)
	jmp	.L5009
.L6471:
	cmpl	$5, %edx
	jne	.L5424
	jmp	.L5423
	.p2align 6,,7
.L6293:
	cmpq	%r15, %r12
	cmovne	%rax, %r15
	jmp	.L6022
.L5001:
	movq	integer_types+48(%rip), %rdi
	jmp	.L6192
.L4999:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L5002
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L5002
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%rbp)
	je	.L6472
.L5002:
	cmpl	$5, %ebx
	je	.L6473
.L5003:
	movq	%r14, %rbx
	jmp	.L4970
.L6473:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L6194:
	movq	global_trees(%rip), %rbx
	jmp	.L4970
.L6472:
	movq	global_trees+200(%rip), %rdi
	jmp	.L6192
	.p2align 6,,7
.L6292:
	movq	40(%r14), %rdx
	testb	$2, 53(%rdx)
	je	.L4994
	movq	integer_types+40(%rip), %rcx
	movq	40(%rdx), %rdi
	movzwl	60(%rcx), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L4994
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L5000
	testb	$32, 17(%rbp)
	jne	.L5001
	jmp	.L5000
	.p2align 6,,7
.L6291:
	movq	integer_types+40(%rip), %rsi
	movzwl	60(%rbp), %edx
	movl	flag_traditional(%rip), %ebx
	movzwl	60(%rsi), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ebx, %ebx
	jne	.L4993
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L4992
.L4993:
	testb	$32, 17(%rbp)
	movl	$1, %eax
	cmovne	%eax, %esi
.L4992:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L6192
.L4986:
	movl	24(%rsi), %eax
	movl	%eax, 24(%r14)
	jmp	.L4985
.L6290:
	movq	32(%r14), %rdx
	movq	8(%r14), %r15
	cmpq	%r15, 8(%rdx)
	jne	.L4981
	.p2align 4,,7
.L4984:
	movzbl	16(%rdx), %ecx
	movq	%rdx, %r14
	cmpb	$116, %cl
	jne	.L6474
.L6172:
	movq	32(%r14), %rdx
	jmp	.L4984
.L6474:
	cmpb	$115, %cl
	jne	.L4981
	movq	32(%rdx), %r10
	movq	8(%r14), %r9
	cmpq	%r9, 8(%r10)
	movq	%r10, %rdx
	je	.L4984
	jmp	.L4981
.L6289:
	movl	pedantic(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L4972
	cmpb	$51, 48(%r14)
	je	.L4972
	cmpq	$0, current_function_decl(%rip)
	je	.L4978
	movzbl	17(%r14), %ebp
	andb	$24, %bpl
	cmpb	$16, %bpl
	je	.L6475
.L4978:
	movq	%r14, %rdx
.L4979:
	movq	%rdx, %r14
	movq	8(%rdx), %rbp
.L6191:
	movzbl	16(%r14), %ecx
	jmp	.L4972
.L6475:
	movq	104(%r14), %rax
	testq	%rax, %rax
	je	.L4978
	movzbl	16(%rax), %ecx
	testb	%cl, %cl
	je	.L4978
	testb	$2, 17(%rax)
	je	.L4978
	cmpb	$46, %cl
	movq	%rax, %rdx
	jne	.L4979
	jmp	.L4978
	.p2align 6,,7
.L6288:
	movq	104(%r14), %r14
	jmp	.L6191
.L4945:
	movzbl	16(%r14), %ecx
	movl	%ebx, %edi
	movq	%r14, %r8
	xorl	%ebx, %ebx
	cmpb	$116, %cl
	je	.L6170
	cmpb	$115, %cl
	je	.L6476
.L4947:
	movzbl	%cl, %ebp 
	movzbl	tree_code_type(%rbp), %eax
	cmpb	$60, %al
	je	.L4953
	cmpb	$49, %al
	je	.L4953
	cmpb	$50, %al
	je	.L4953
	cmpb	$101, %al
	je	.L4953
.L4952:
	cmpl	$23, %edi
	je	.L6477
	cmpl	$18, %edi
	jne	.L5003
	movzbl	%cl, %edi 
	xorl	%edx, %edx
	xorl	%ebp, %ebp
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%rsi), %r12
	cmpb	$114, %al
	je	.L4958
	cmpb	$100, %al
	je	.L4958
.L4957:
	movzbl	17(%rsi), %edi
	movl	$1, %r8d
	xorl	%r10d, %r10d
	movl	%edi, %r9d
	movl	%edi, %r15d
	shrb	$4, %r9b
	shrb	$3, %r15b
	andl	%r9d, %r8d
	andl	$1, %r15d
	movzbl	62(%rsi), %r9d
	addl	%r15d, %r15d
	orl	%r15d, %r8d
	movl	%r9d, %r11d
	shrb	$5, %r11b
	andl	$1, %r11d
	sall	$2, %r11d
	orl	%r11d, %r8d
	movzbl	16(%rsi), %r11d
	cmpb	$20, %r11b
	je	.L6478
.L4961:
	leal	0(,%r10,8), %esi
	orl	%esi, %r8d
	jne	.L4960
	testl	%edx, %edx
	jne	.L4960
	testl	%ebp, %ebp
	je	.L4959
.L4960:
	movl	%edi, %r8d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %dil
	shrb	$4, %r8b
	movl	%r9d, %ecx
	movl	%edi, %r10d
	andl	%r8d, %esi
	andl	$1, %ecx
	andl	$1, %r10d
	sall	$2, %ecx
	addl	%r10d, %r10d
	orl	%r10d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %r11b
	je	.L6479
.L4963:
	leal	0(,%rcx,8), %edi
	orl	%edi, %esi
	movq	%r12, %rdi
	orl	%edx, %esi
	leal	(%rbp,%rbp), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%r14), %ecx
	movq	%rax, %r12
.L4959:
	cmpb	$41, %cl
	je	.L6480
	cmpb	$47, %cl
	je	.L6481
	xorl	%ebp, %ebp
	testl	%ebx, %ebx
	je	.L6482
.L4966:
	movl	flag_isoc99(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L4967
	testl	%ebp, %ebp
	movq	%r14, %rbx
	je	.L4970
.L4967:
	movq	%r12, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r14)
	movq	%rax, %rbx
	je	.L6483
	movl	$121, %edi
	movq	%r14, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L6193
.L6483:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r14, %rdx
	call	build1
	movq	%r14, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L6194
	movq	%r14, %rdi
	call	staticp
	movzbl	17(%rbx), %r14d
	movl	%eax, %r12d
	andb	$1, %r12b
	addb	%r12b, %r12b
	andb	$-4, %r14b
	orb	%r12b, %r14b
	movb	%r14b, 17(%rbx)
	jmp	.L4970
.L6482:
	movq	%r14, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebp
	jmp	.L4966
.L6481:
	movq	40(%r14), %rdi
	call	default_conversion
	movq	32(%r14), %rdx
	movl	$47, %edi
	movq	8(%rax), %rsi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	build
	jmp	.L6195
.L6480:
	movq	72(%r12), %rdi
	movq	32(%r14), %rsi
	jmp	.L6193
.L6479:
	testq	%r12, %r12
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L4963
.L6478:
	testq	%r12, %r12
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L4961
.L4958:
	movzbl	17(%r14), %r8d
	movl	$1, %ebp
	movl	%r8d, %edx
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	%r8d, %ebp
	andl	$1, %edx
	jmp	.L4957
.L6477:
	movl	$121, %edi
	movq	%r14, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L6195
.L4953:
	movl	24(%r8), %eax
	movl	%eax, 24(%r14)
	jmp	.L4952
.L6476:
	movq	32(%r14), %rdx
	cmpq	%rbp, 8(%rdx)
	jne	.L4947
	.p2align 4,,7
.L4951:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rdx, %r14
	movzbl	16(%rdx), %ecx
	cmove	%eax, %ebx
	cmpb	$116, %cl
	jne	.L6484
.L6170:
	movq	32(%r14), %rdx
	jmp	.L4951
.L6484:
	cmpb	$115, %cl
	jne	.L4947
	movq	32(%rdx), %rdx
	movq	8(%r14), %r10
	cmpq	%r10, 8(%rdx)
	je	.L4951
	jmp	.L4947
.L4940:
	movq	integer_types+48(%rip), %rdi
	jmp	.L6187
.L4938:
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	je	.L4941
	movl	flag_allow_single_precision(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L4941
	movq	global_trees+192(%rip), %r9
	cmpq	%r9, 128(%rbp)
	je	.L6485
.L4941:
	cmpl	$5, %ebx
	je	.L6486
.L4942:
	movq	%r13, %rbx
	jmp	.L4909
.L6486:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L6189:
	movq	global_trees(%rip), %rbx
	jmp	.L4909
.L6485:
	movq	global_trees+200(%rip), %rdi
	jmp	.L6187
	.p2align 6,,7
.L6287:
	movq	40(%r13), %rdx
	testb	$2, 53(%rdx)
	je	.L4933
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%rdi), %esi
	movq	40(%rdx), %rdi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L4933
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L4939
	testb	$32, 17(%rbp)
	jne	.L4940
	jmp	.L4939
	.p2align 6,,7
.L6286:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%rbp), %edx
	movl	flag_traditional(%rip), %ebx
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ebx, %ebx
	jne	.L4932
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L4931
.L4932:
	testb	$32, 17(%rbp)
	movl	$1, %eax
	cmovne	%eax, %esi
.L4931:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L6187
.L4925:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r13)
	jmp	.L4924
.L6285:
	movq	32(%r13), %rsi
	movq	8(%r13), %r9
	cmpq	%r9, 8(%rsi)
	jne	.L4920
	.p2align 4,,7
.L4923:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r13
	cmpb	$116, %cl
	jne	.L6487
.L6168:
	movq	32(%r13), %rsi
	jmp	.L4923
.L6487:
	cmpb	$115, %cl
	jne	.L4920
	movq	32(%rsi), %r10
	movq	8(%r13), %r15
	cmpq	%r15, 8(%r10)
	movq	%r10, %rsi
	je	.L4923
	jmp	.L4920
.L6284:
	movl	pedantic(%rip), %r12d
	testl	%r12d, %r12d
	jne	.L4911
	cmpb	$51, 48(%r13)
	je	.L4911
	cmpq	$0, current_function_decl(%rip)
	je	.L4917
	movzbl	17(%r13), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L6488
.L4917:
	movq	%r13, %rsi
.L4918:
	movq	%rsi, %r13
	movq	8(%rsi), %rbp
.L6186:
	movzbl	16(%r13), %ecx
	jmp	.L4911
.L6488:
	movq	104(%r13), %rax
	testq	%rax, %rax
	je	.L4917
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L4917
	testb	$2, 17(%rax)
	je	.L4917
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L4918
	jmp	.L4917
	.p2align 6,,7
.L6283:
	movq	104(%r13), %r13
	jmp	.L6186
.L4884:
	movzbl	16(%r13), %ecx
	movl	%ebx, %edx
	movq	%r13, %r8
	xorl	%ebx, %ebx
	cmpb	$116, %cl
	je	.L6166
	cmpb	$115, %cl
	je	.L6489
.L4886:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L4892
	cmpb	$49, %al
	je	.L4892
	cmpb	$50, %al
	je	.L4892
	cmpb	$101, %al
	je	.L4892
.L4891:
	cmpl	$23, %edx
	je	.L6490
	cmpl	$18, %edx
	jne	.L4942
	movzbl	%cl, %r8d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r8), %eax
	movq	8(%rdi), %r12
	cmpb	$114, %al
	je	.L4897
	cmpb	$100, %al
	je	.L4897
.L4896:
	movzbl	17(%rdi), %r8d
	movl	$1, %esi
	movl	%r8d, %r9d
	movl	%r8d, %r10d
	shrb	$3, %r9b
	shrb	$4, %r10b
	andl	$1, %r9d
	andl	%r10d, %esi
	xorl	%r10d, %r10d
	addl	%r9d, %r9d
	orl	%r9d, %esi
	movzbl	62(%rdi), %r9d
	movzbl	16(%rdi), %edi
	movl	%r9d, %r15d
	shrb	$5, %r15b
	andl	$1, %r15d
	sall	$2, %r15d
	orl	%r15d, %esi
	cmpb	$20, %dil
	je	.L6491
.L4900:
	leal	0(,%r10,8), %ebp
	orl	%ebp, %esi
	jne	.L4899
	testl	%edx, %edx
	jne	.L4899
	testl	%r11d, %r11d
	je	.L4898
.L4899:
	movl	%r8d, %r10d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r10b
	movl	%r9d, %ecx
	movl	%r8d, %r15d
	andl	%r10d, %esi
	andl	$1, %ecx
	andl	$1, %r15d
	sall	$2, %ecx
	addl	%r15d, %r15d
	orl	%r15d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L6492
.L4902:
	leal	0(,%rcx,8), %r8d
	leal	(%r11,%r11), %edi
	orl	%r8d, %esi
	orl	%edx, %esi
	orl	%edi, %esi
	movq	%r12, %rdi
	call	c_build_qualified_type
	movzbl	16(%r13), %ecx
	movq	%rax, %r12
.L4898:
	cmpb	$41, %cl
	je	.L6493
	cmpb	$47, %cl
	je	.L6494
	xorl	%ebp, %ebp
	testl	%ebx, %ebx
	je	.L6495
.L4905:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L4906
	testl	%ebp, %ebp
	movq	%r13, %rbx
	je	.L4909
.L4906:
	movq	%r12, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r13)
	movq	%rax, %rbx
	je	.L6496
	movl	$121, %edi
	movq	%r13, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L6188
.L6496:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r13, %rdx
	call	build1
	movq	%r13, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L6189
	movq	%r13, %rdi
	call	staticp
	movzbl	17(%rbx), %r13d
	movl	%eax, %r11d
	andb	$1, %r11b
	addb	%r11b, %r11b
	andb	$-4, %r13b
	orb	%r11b, %r13b
	movb	%r13b, 17(%rbx)
	jmp	.L4909
.L6495:
	movq	%r13, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebp
	jmp	.L4905
.L6494:
	movq	40(%r13), %rdi
	call	default_conversion
	movq	32(%r13), %rdx
	movl	$47, %edi
	movq	8(%rax), %rsi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	build
	jmp	.L6190
.L6493:
	movq	72(%r12), %rdi
	movq	32(%r13), %rsi
	jmp	.L6188
.L6492:
	testq	%r12, %r12
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L4902
.L6491:
	testq	%r12, %r12
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L4900
.L4897:
	movzbl	17(%r13), %ebp
	movl	$1, %r11d
	movl	%ebp, %edx
	shrb	$3, %bpl
	shrb	$4, %dl
	andl	%ebp, %r11d
	andl	$1, %edx
	jmp	.L4896
.L6490:
	movl	$121, %edi
	movq	%r13, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L6190
.L4892:
	movl	24(%r8), %eax
	movl	%eax, 24(%r13)
	jmp	.L4891
.L6489:
	movq	32(%r13), %rsi
	cmpq	%rbp, 8(%rsi)
	jne	.L4886
	.p2align 4,,7
.L4890:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r13
	movzbl	16(%rsi), %ecx
	cmove	%eax, %ebx
	cmpb	$116, %cl
	jne	.L6497
.L6166:
	movq	32(%r13), %rsi
	jmp	.L4890
.L6497:
	cmpb	$115, %cl
	jne	.L4886
	movq	32(%rsi), %rsi
	movq	8(%r13), %r10
	cmpq	%r10, 8(%rsi)
	je	.L4890
	jmp	.L4886
.L4879:
	movq	integer_types+48(%rip), %rdi
	jmp	.L6182
.L4877:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L4880
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L4880
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%r12)
	je	.L6498
.L4880:
	cmpl	$5, %ebp
	je	.L6499
.L4881:
	movq	%rbx, %rbp
	jmp	.L4853
.L6499:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L6184:
	movq	global_trees(%rip), %rbp
	jmp	.L4853
.L6498:
	movq	global_trees+200(%rip), %rdi
	jmp	.L6182
	.p2align 6,,7
.L6282:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L4874
	movq	integer_types+40(%rip), %r15
	movq	40(%rdx), %rdi
	movzwl	60(%r15), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L4874
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L4878
	testb	$32, 17(%r12)
	jne	.L4879
	jmp	.L4878
	.p2align 6,,7
.L6281:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %ebp
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ebp, %ebp
	jne	.L4873
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L4872
.L4873:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L4872:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L6182
.L4869:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L4868
.L6280:
	movq	32(%rbx), %rdi
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rdi)
	jne	.L4864
	.p2align 4,,7
.L4867:
	movzbl	16(%rdi), %ecx
	movq	%rdi, %rbx
	cmpb	$116, %cl
	jne	.L6500
.L6164:
	movq	32(%rbx), %rdi
	jmp	.L4867
.L6500:
	cmpb	$115, %cl
	jne	.L4864
	movq	32(%rdi), %r11
	movq	8(%rbx), %r8
	cmpq	%r8, 8(%r11)
	movq	%r11, %rdi
	je	.L4867
	jmp	.L4864
.L6279:
	movl	pedantic(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L4859
	cmpb	$51, 48(%rdi)
	je	.L4859
	cmpq	$0, current_function_decl(%rip)
	je	.L4861
	movzbl	17(%rdi), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L6501
.L4861:
	movq	%rbx, %rdi
.L4862:
	movq	%rdi, %rbx
	movq	8(%rdi), %rax
	movzbl	16(%rdi), %ecx
.L4859:
	movq	%rax, %r12
	jmp	.L4855
.L6501:
	movq	104(%rdi), %rax
	testq	%rax, %rax
	je	.L4861
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L4861
	testb	$2, 17(%rax)
	je	.L4861
	cmpb	$46, %dl
	movq	%rax, %rdi
	jne	.L4862
	jmp	.L4861
	.p2align 6,,7
.L6278:
	movq	104(%rdi), %rbx
	movzbl	16(%rbx), %ecx
	jmp	.L4855
.L4829:
	movzbl	16(%rbx), %ecx
	movl	%ebp, %edx
	movq	%rbx, %rsi
	xorl	%ebp, %ebp
	cmpb	$116, %cl
	je	.L6162
	cmpb	$115, %cl
	je	.L6502
.L4831:
	movzbl	%cl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L4837
	cmpb	$49, %al
	je	.L4837
	cmpb	$50, %al
	je	.L4837
	cmpb	$101, %al
	je	.L4837
.L4836:
	cmpl	$23, %edx
	je	.L6503
	cmpl	$18, %edx
	jne	.L4881
	movzbl	%cl, %esi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rsi), %eax
	movq	8(%r12), %r15
	cmpb	$114, %al
	je	.L4842
	cmpb	$100, %al
	je	.L4842
.L4841:
	movzbl	17(%r12), %r8d
	movl	$1, %esi
	movl	%r8d, %r9d
	movl	%r8d, %edi
	shrb	$3, %r9b
	shrb	$4, %dil
	andl	$1, %r9d
	andl	%edi, %esi
	movzbl	16(%r12), %edi
	addl	%r9d, %r9d
	orl	%r9d, %esi
	movzbl	62(%r12), %r9d
	movl	%r9d, %r10d
	shrb	$5, %r10b
	andl	$1, %r10d
	sall	$2, %r10d
	orl	%r10d, %esi
	xorl	%r10d, %r10d
	cmpb	$20, %dil
	je	.L6504
.L4845:
	leal	0(,%r10,8), %r12d
	orl	%r12d, %esi
	jne	.L4844
	testl	%edx, %edx
	jne	.L4844
	testl	%r11d, %r11d
	je	.L4843
.L4844:
	movl	%r8d, %r12d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r12b
	movl	%r9d, %ecx
	movl	%r8d, %r10d
	andl	%r12d, %esi
	andl	$1, %ecx
	andl	$1, %r10d
	sall	$2, %ecx
	addl	%r10d, %r10d
	orl	%r10d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L6505
.L4846:
	leal	0(,%rcx,8), %r8d
	movq	%r15, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r15
.L4843:
	cmpb	$41, %cl
	je	.L6506
	cmpb	$47, %cl
	je	.L6507
	xorl	%r12d, %r12d
	testl	%ebp, %ebp
	je	.L6508
.L4849:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L4850
	testl	%r12d, %r12d
	movq	%rbx, %rbp
	je	.L4853
.L4850:
	movq	%r15, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L6509
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L6183
.L6509:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	mark_addressable
	testl	%eax, %eax
	je	.L6184
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%rbp), %ebx
	movl	%eax, %r11d
	andb	$1, %r11b
	addb	%r11b, %r11b
	andb	$-4, %bl
	orb	%r11b, %bl
	movb	%bl, 17(%rbp)
	jmp	.L4853
.L6508:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L4849
.L6507:
	movq	40(%rbx), %rdi
	call	default_conversion
	movq	32(%rbx), %rdx
	movl	$47, %edi
	movq	8(%rax), %rsi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	build
	jmp	.L6185
.L6506:
	movq	72(%r15), %rdi
	movq	32(%rbx), %rsi
	jmp	.L6183
.L6505:
	testq	%r15, %r15
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L4846
.L6504:
	testq	%r15, %r15
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L4845
.L4842:
	movzbl	17(%rbx), %r8d
	movl	$1, %r11d
	movl	%r8d, %edx
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	%r8d, %r11d
	andl	$1, %edx
	jmp	.L4841
.L6503:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L6185
.L4837:
	movl	24(%rsi), %eax
	movl	%eax, 24(%rbx)
	jmp	.L4836
.L6502:
	movq	32(%rbx), %rdi
	cmpq	%r12, 8(%rdi)
	jne	.L4831
	.p2align 4,,7
.L4835:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rdi, %rbx
	movzbl	16(%rdi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L6510
.L6162:
	movq	32(%rbx), %rdi
	jmp	.L4835
.L6510:
	cmpb	$115, %cl
	jne	.L4831
	movq	32(%rdi), %rdi
	movq	8(%rbx), %r8
	cmpq	%r8, 8(%rdi)
	je	.L4835
	jmp	.L4831
.LFE10:
.Lfe10:
	.size	build_conditional_expr,.Lfe10-build_conditional_expr
	.section	.rodata.str1.1
.LC62:
	.string	"struct"
	.section	.rodata.str1.32
	.align 32
.LC71:
	.string	"invalid use of incomplete typedef `%s'"
	.section	.rodata.str1.1
.LC72:
	.string	"invalid lvalue in assignment"
.LC73:
	.string	"assignment"
	.section	.rodata.str1.32
	.align 32
.LC70:
	.string	"invalid use of undefined type `%s %s'"
	.align 32
.LC65:
	.string	"invalid use of void expression"
	.section	.rodata.str1.1
.LC64:
	.string	"enum"
	.section	.rodata.str1.32
	.align 32
.LC66:
	.string	"invalid use of flexible array member"
	.align 32
.LC67:
	.string	"invalid use of array with unspecified bounds"
	.section	.rodata.str1.1
.LC63:
	.string	"union"
.LC61:
	.string	"`%s' has an incomplete type"
.LC68:
	.string	"c-typeck.c"
.LC69:
	.string	"incomplete_type_error"
	.text
	.align 2
	.p2align 4,,15
.globl build_modify_expr
	.type	build_modify_expr,@function
build_modify_expr:
.LFB11:
	pushq	%r15
.LCFI38:
	pushq	%r14
.LCFI39:
	movl	%esi, %r14d
	pushq	%r13
.LCFI40:
	pushq	%r12
.LCFI41:
	movq	%rdi, %r12
	pushq	%rbp
.LCFI42:
	movq	%rdx, %rbp
	pushq	%rbx
.LCFI43:
	subq	$8, %rsp
.LCFI44:
	movq	global_trees(%rip), %rax
	movq	8(%rdi), %r13
	cmpq	%rax, %rdi
	movq	%r13, %r15
	movq	%r13, %rcx
	je	.L6517
	cmpq	%rax, %r13
	je	.L6517
	cmpq	$0, 32(%r13)
	jne	.L6514
	movzbl	16(%r13), %edx
	testb	%dl, %dl
	je	.L6517
	testq	%rdi, %rdi
	je	.L6520
	movzbl	16(%rdi), %ebx
	subb	$34, %bl
	cmpb	$1, %bl
	jbe	.L6639
.L6520:
	movzbl	%dl, %eax
	subl	$5, %eax
	cmpl	$16, %eax
	ja	.L6529
	mov	%eax, %edx
	jmp	*.L6530(,%rdx,8)
	.section	.rodata
	.align 8
	.align 4
.L6530:
	.quad	.L6525
	.quad	.L6529
	.quad	.L6529
	.quad	.L6529
	.quad	.L6529
	.quad	.L6524
	.quad	.L6529
	.quad	.L6529
	.quad	.L6529
	.quad	.L6529
	.quad	.L6529
	.quad	.L6529
	.quad	.L6529
	.quad	.L6526
	.quad	.L6529
	.quad	.L6522
	.quad	.L6523
	.text
.L6522:
	movl	$.LC62, %esi
.L6521:
	movq	96(%rcx), %rax
	cmpb	$1, 16(%rax)
	je	.L6640
	movq	72(%rax), %rax
	movl	$.LC71, %edi
.L6631:
	movq	32(%rax), %rsi
	xorl	%eax, %eax
	call	error
.L6630:
	movq	global_trees(%rip), %rax
.L6517:
	movq	%rax, %r12
.L6514:
	movzbl	16(%r12), %ecx
	testb	%cl, %cl
	je	.L6534
	movzbl	16(%rbp), %edx
	testb	%dl, %dl
	jne	.L6533
.L6534:
	movq	%rax, %rbx
.L6511:
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L6533:
	cmpb	$116, %dl
	je	.L6641
.L6535:
	movzbl	%cl, %eax
	movq	%rbp, %rbx
	cmpl	$47, %eax
	je	.L6537
	cmpl	$51, %eax
	je	.L6540
	cmpl	$115, %r14d
	je	.L6544
	movq	%r12, %rdi
	call	stabilize_reference
	movl	$1, %ecx
	movq	%rbp, %rdx
	movl	%r14d, %edi
	movq	%rax, %rsi
	movq	%rax, %r12
	call	build_binary_op
	movzbl	16(%r12), %ecx
	movq	%rax, %rbx
.L6544:
	movzbl	%cl, %eax
	cmpl	$72, %eax
	jb	.L6545
	cmpl	$76, %eax
	jbe	.L6552
	subl	$114, %eax
	cmpl	$1, %eax
	ja	.L6545
.L6552:
	movzbl	16(%rbx), %ecx
	movq	8(%rbx), %r8
	xorl	%ebp, %ebp
	movq	%rbx, %rdi
	movzbl	16(%r8), %esi
	cmpb	$116, %cl
	je	.L6627
	cmpb	$115, %cl
	je	.L6642
.L6554:
	movzbl	%cl, %r11d 
	movzbl	tree_code_type(%r11), %eax
	cmpb	$60, %al
	je	.L6560
	cmpb	$49, %al
	je	.L6560
	cmpb	$50, %al
	je	.L6560
	cmpb	$101, %al
	je	.L6560
.L6559:
	cmpl	$23, %esi
	je	.L6643
	cmpl	$18, %esi
	je	.L6644
	movq	%rbx, %rbp
.L6562:
	movq	32(%r12), %r15
	movq	%r13, %rdi
	movq	%rbp, %rsi
	call	convert
	movq	%rax, %rsi
	movq	8(%r15), %rdi
	call	convert
	movl	$115, %esi
	movq	%r15, %rdi
	movq	%rax, %rdx
	call	build_modify_expr
	cmpb	$0, 16(%rax)
	movq	%rax, %rbx
	je	.L6511
	movl	$114, %edi
	call	pedantic_lvalue_warning
	movq	8(%r12), %rdi
	movq	%rbx, %rsi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	convert
.L6644:
	movzbl	%cl, %esi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rsi), %eax
	movq	8(%r8), %r15
	cmpb	$114, %al
	je	.L6565
	cmpb	$100, %al
	je	.L6565
.L6564:
	movzbl	17(%r8), %edi
	movl	$1, %esi
	movl	%edi, %r10d
	movl	%edi, %r9d
	shrb	$4, %r10b
	shrb	$3, %r9b
	andl	%r10d, %esi
	andl	$1, %r9d
	movzbl	62(%r8), %r10d
	movzbl	16(%r8), %r8d
	addl	%r9d, %r9d
	orl	%r9d, %esi
	xorl	%r9d, %r9d
	movl	%r10d, %r14d
	shrb	$5, %r14b
	andl	$1, %r14d
	sall	$2, %r14d
	orl	%r14d, %esi
	cmpb	$20, %r8b
	je	.L6645
.L6568:
	leal	0(,%r9,8), %r14d
	orl	%r14d, %esi
	jne	.L6567
	testl	%edx, %edx
	jne	.L6567
	testl	%r11d, %r11d
	je	.L6566
.L6567:
	movl	%edi, %r14d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %dil
	shrb	$4, %r14b
	movl	%r10d, %ecx
	movl	%edi, %r9d
	andl	%r14d, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %r8b
	je	.L6646
.L6570:
	leal	0(,%rcx,8), %edi
	leal	(%r11,%r11), %r8d
	orl	%edi, %esi
	movq	%r15, %rdi
	orl	%edx, %esi
	orl	%r8d, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r15
.L6566:
	cmpb	$41, %cl
	je	.L6647
	cmpb	$47, %cl
	je	.L6648
	xorl	%r14d, %r14d
	testl	%ebp, %ebp
	je	.L6649
.L6609:
	movl	flag_isoc99(%rip), %ebp
	testl	%ebp, %ebp
	jne	.L6610
	testl	%r14d, %r14d
	movq	%rbx, %rbp
	je	.L6562
.L6610:
	movq	%r15, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L6650
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
.L6638:
	call	convert
.L6635:
	movq	%rax, %rbp
	jmp	.L6562
.L6650:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	mark_addressable
	testl	%eax, %eax
	jne	.L6612
	movq	global_trees(%rip), %rbp
	jmp	.L6562
.L6612:
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%rbp), %ebx
	movl	%eax, %esi
	andb	$1, %sil
	addb	%sil, %sil
	andb	$-4, %bl
	orb	%sil, %bl
	movb	%bl, 17(%rbp)
	jmp	.L6562
.L6649:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r14d
	jmp	.L6609
.L6648:
	movq	40(%rbx), %rbp
	movq	8(%rbp), %r14
	movzbl	16(%r14), %r15d
	movq	%r14, %rax
	cmpl	$23, %r15d
	je	.L6574
	cmpl	$18, %r15d
	je	.L6574
	movzbl	16(%rbp), %edx
	cmpb	$32, %dl
	je	.L6651
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L6577
	cmpb	$34, %dl
	je	.L6652
.L6577:
	cmpb	$116, %dl
	movq	%rbp, %rcx
	je	.L6629
	cmpb	$115, %dl
	je	.L6653
.L6586:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L6591
	cmpb	$49, %al
	je	.L6591
	cmpb	$50, %al
	je	.L6591
	cmpb	$101, %al
	je	.L6591
.L6590:
	cmpl	$10, %r15d
	je	.L6654
	cmpb	$39, %dl
	je	.L6655
.L6599:
	movq	%r14, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L6604
	testb	$32, 17(%r14)
	je	.L6605
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L6606
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r14), %r10d
	movzwl	60(%rdx), %r14d
	andl	$511, %r10d
	andl	$511, %r14d
	cmpl	%r14d, %r10d
	je	.L6606
.L6605:
	movq	integer_types+40(%rip), %rdi
.L6634:
	movq	%rbp, %rsi
	call	convert
.L6575:
	movq	8(%rax), %rsi
	movq	32(%rbx), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L6635
.L6606:
	movq	integer_types+48(%rip), %rdi
	jmp	.L6634
.L6604:
	movl	flag_traditional(%rip), %r9d
	testl	%r9d, %r9d
	je	.L6607
	movl	flag_allow_single_precision(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L6607
	movq	global_trees+192(%rip), %rdi
	cmpq	%rdi, 128(%r14)
	je	.L6656
.L6607:
	cmpl	$5, %r15d
	je	.L6657
	movq	%rbp, %rax
	jmp	.L6575
.L6657:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L6575
.L6656:
	movq	global_trees+200(%rip), %rdi
	jmp	.L6634
	.p2align 6,,7
.L6655:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L6599
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L6599
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L6605
	testb	$32, 17(%r14)
	jne	.L6606
	jmp	.L6605
	.p2align 6,,7
.L6654:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r14), %edx
	movl	flag_traditional(%rip), %r15d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r15d, %r15d
	jne	.L6598
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L6597
.L6598:
	testb	$32, 17(%r14)
	movl	$1, %eax
	cmovne	%eax, %esi
.L6597:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L6634
.L6591:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L6590
.L6653:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r9
	cmpq	%r9, 8(%rsi)
	jne	.L6586
.L6589:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbp
	cmpb	$116, %dl
	jne	.L6658
.L6629:
	movq	32(%rbp), %rsi
	jmp	.L6589
.L6658:
	cmpb	$115, %dl
	jne	.L6586
	movq	32(%rsi), %rdi
	movq	8(%rbp), %r8
	cmpq	%r8, 8(%rdi)
	movq	%rdi, %rsi
	je	.L6589
	jmp	.L6586
.L6652:
	movl	pedantic(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L6581
	cmpb	$51, 48(%rbp)
	je	.L6581
	cmpq	$0, current_function_decl(%rip)
	je	.L6583
	movzbl	17(%rbp), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L6659
.L6583:
	movq	%rbp, %rsi
.L6584:
	movq	%rsi, %rbp
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L6581:
	movq	%rax, %r14
	jmp	.L6577
.L6659:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L6583
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L6583
	testb	$2, 17(%rax)
	je	.L6583
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L6584
	jmp	.L6583
	.p2align 6,,7
.L6651:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %edx
	jmp	.L6577
.L6574:
	movq	%rbp, %rdi
	call	default_function_array_conversion
	jmp	.L6575
.L6647:
	movq	72(%r15), %rdi
	movq	32(%rbx), %rsi
	jmp	.L6638
.L6646:
	testq	%r15, %r15
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6570
.L6645:
	testq	%r15, %r15
	movl	$1, %eax
	cmovne	%eax, %r9d
	jmp	.L6568
.L6565:
	movzbl	17(%rbx), %edi
	movl	$1, %r11d
	movl	%edi, %edx
	shrb	$3, %dil
	shrb	$4, %dl
	andl	%edi, %r11d
	andl	$1, %edx
	jmp	.L6564
.L6643:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L6635
.L6560:
	movl	24(%rdi), %eax
	movl	%eax, 24(%rbx)
	jmp	.L6559
.L6642:
	movq	32(%rbx), %rdx
	cmpq	%r8, 8(%rdx)
	jne	.L6554
	.p2align 4,,7
.L6558:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rdx, %rbx
	movzbl	16(%rdx), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L6660
.L6627:
	movq	32(%rbx), %rdx
	jmp	.L6558
.L6660:
	cmpb	$115, %cl
	jne	.L6554
	movq	32(%rdx), %r10
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%r10)
	movq	%r10, %rdx
	je	.L6558
	jmp	.L6554
.L6545:
	movq	%r12, %rdi
	movl	$.LC72, %esi
	call	lvalue_or_else
	testl	%eax, %eax
	je	.L6636
	testb	$16, 17(%r12)
	jne	.L6618
	testb	$16, 17(%r13)
	jne	.L6618
	movzbl	16(%r13), %ecx
	subb	$20, %cl
	cmpb	$1, %cl
	ja	.L6617
	testb	$2, 19(%r13)
	je	.L6617
.L6618:
	movq	%r12, %rdi
	movl	$.LC73, %esi
	call	readonly_warning
.L6617:
	cmpb	$39, 16(%r12)
	je	.L6661
.L6619:
	cmpq	8(%r12), %r15
	je	.L6621
	movq	%r12, %rdi
	call	copy_node
	movq	%rax, %r12
	movq	%r15, 8(%rax)
.L6621:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movl	$.LC73, %edx
	call	convert_for_assignment
	cmpb	$0, 16(%rax)
	jne	.L6622
.L6636:
	movq	global_trees(%rip), %rbx
	jmp	.L6511
.L6622:
	movq	%rax, %rcx
	movl	$48, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	movq	%r12, %rdx
	call	build
	orb	$1, 17(%rax)
	movq	%rax, %rbx
	cmpq	8(%rax), %r13
	je	.L6511
	addq	$8, %rsp
	movq	%r13, %rdi
	movq	%rax, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	movl	$.LC73, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	jmp	convert_for_assignment
.L6661:
	movzbl	16(%r13), %eax
	cmpb	$6, %al
	je	.L6620
	cmpb	$11, %al
	je	.L6620
	cmpb	$7, %al
	je	.L6620
	cmpb	$10, %al
	jne	.L6619
.L6620:
	movq	%r12, %rdi
	xorl	%esi, %esi
	call	get_unwidened
	movq	8(%rax), %r15
	jmp	.L6619
.L6540:
	movl	$51, %edi
	call	pedantic_lvalue_warning
	movq	%rbp, %rdi
	call	save_expr
	movl	%r14d, %esi
	movq	40(%r12), %rdi
	movq	%rax, %rdx
	movq	%rax, %rbp
	call	build_modify_expr
	movq	%rbp, %rdx
	movl	%r14d, %esi
	movq	48(%r12), %rdi
	movq	%rax, %r13
	call	build_modify_expr
	movq	%r13, %rsi
	movq	32(%r12), %rdi
	movq	%rax, %rdx
	call	build_conditional_expr
	cmpb	$0, 16(%rax)
	movq	%rax, %rbx
	je	.L6511
	movq	global_trees+216(%rip), %rdi
	movq	%rbp, %rsi
	call	convert
	movq	%rbx, %rcx
	movq	8(%r12), %rsi
	movl	$47, %edi
	movq	%rax, %rdx
.L6637:
	addq	$8, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	build
.L6537:
	movl	$47, %edi
	call	pedantic_lvalue_warning
	movq	40(%r12), %rdi
	movl	%r14d, %esi
	movq	%rbp, %rdx
	call	build_modify_expr
	cmpb	$0, 16(%rax)
	je	.L6636
	movq	32(%r12), %rdx
	movl	$47, %edi
	movq	%r13, %rsi
	movq	%rax, %rcx
	jmp	.L6637
.L6641:
	movq	32(%rbp), %rbp
	jmp	.L6535
.L6640:
	movq	32(%rax), %rdx
	movl	$.LC70, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L6630
.L6525:
	movl	$.LC65, %edi
.L6633:
	xorl	%eax, %eax
	call	error
	jmp	.L6630
.L6524:
	movl	$.LC64, %esi
	jmp	.L6521
.L6526:
	movq	24(%rcx), %rax
	testq	%rax, %rax
	je	.L6527
	cmpq	$0, 112(%rax)
	je	.L6662
	movq	8(%rcx), %rcx
	movzbl	16(%rcx), %edx
	jmp	.L6520
.L6662:
	movl	$.LC66, %edi
	jmp	.L6633
.L6527:
	movl	$.LC67, %edi
	jmp	.L6633
	.p2align 6,,7
.L6523:
	movl	$.LC63, %esi
	jmp	.L6521
.L6639:
	movq	72(%rdi), %rax
	movl	$.LC61, %edi
	jmp	.L6631
.L6529:
	movl	$.LC68, %edi
	movl	$163, %esi
	movl	$.LC69, %edx
	call	fancy_abort
.LFE11:
.Lfe11:
	.size	build_modify_expr,.Lfe11-build_modify_expr
	.section	.rodata.str1.1
.LC84:
	.string	"incompatible types in %s"
	.section	.rodata.str1.32
	.align 32
.LC82:
	.string	"incompatible type for argument %d of `%s'"
	.align 32
.LC83:
	.string	"incompatible type for argument %d of indirect function call"
	.align 32
.LC81:
	.string	"%s makes integer from pointer without a cast"
	.align 32
.LC80:
	.string	"%s makes pointer from integer without a cast"
	.align 32
.LC75:
	.string	"%s discards qualifiers from pointer target type"
	.align 32
.LC78:
	.string	"pointer targets in %s differ in signedness"
	.align 32
.LC74:
	.string	"%s makes qualified function pointer from unqualified"
	.align 32
.LC77:
	.string	"ISO C forbids %s between function pointer and `void *'"
	.align 32
.LC79:
	.string	"%s from incompatible pointer type"
	.align 32
.LC76:
	.string	"ISO C prohibits argument conversion to union type"
	.text
	.align 2
	.p2align 4,,15
	.type	convert_for_assignment,@function
convert_for_assignment:
.LFB12:
	pushq	%r15
.LCFI45:
	pushq	%r14
.LCFI46:
	pushq	%r13
.LCFI47:
	movq	%rsi, %r13
	pushq	%r12
.LCFI48:
	pushq	%rbp
.LCFI49:
	pushq	%rbx
.LCFI50:
	subq	$296, %rsp
.LCFI51:
	movq	%rdi, 288(%rsp)
	movq	%rdx, 280(%rsp)
	movq	%rcx, 272(%rsp)
	movq	%r8, 264(%rsp)
	movl	%r9d, 260(%rsp)
	cmpb	$116, 16(%rsi)
	movzbl	16(%rdi), %r15d
	je	.L7794
.L6664:
	movq	8(%r13), %r14
	movzbl	16(%r14), %eax
	movq	%r14, %rdi
	cmpb	$18, %al
	je	.L6666
	cmpb	$23, %al
	je	.L6666
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L6727
	cmpb	$34, 16(%r13)
	je	.L7795
.L6727:
	movzbl	16(%r14), %eax
	movzbl	%al, %r12d
	testl	%r12d, %r12d
	je	.L7623
	movq	288(%rsp), %rsi
	movq	128(%r14), %rdx
	cmpq	%rdx, 128(%rsi)
	je	.L7796
	cmpl	$5, %r12d
	je	.L7797
	cmpl	$15, %r15d
	je	.L7798
.L6738:
	leal	-6(%r15), %edi
	cmpl	$1, %edi
	jbe	.L6901
	cmpl	$10, %r15d
	je	.L6901
	cmpl	$8, %r15d
	je	.L6901
	cmpl	$11, %r15d
	je	.L6901
.L6900:
	cmpl	$21, %r15d
	je	.L7799
.L6904:
	cmpl	$13, %r15d
	je	.L7263
	cmpl	$15, %r15d
	je	.L7263
.L7262:
	cmpl	$13, %r15d
	je	.L7800
.L7610:
	cmpl	$6, %r15d
	je	.L7801
.L7615:
	cmpl	$11, %r15d
	je	.L7802
.L6899:
	cmpq	$0, 280(%rsp)
	je	.L7803
	movq	280(%rsp), %rsi
	movl	$.LC84, %edi
	xorl	%eax, %eax
	call	error
.L7623:
	movq	global_trees(%rip), %r13
.L6663:
	addq	$296, %rsp
	movq	%r13, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L7803:
	cmpq	$0, 264(%rsp)
	je	.L7619
	call	maybe_building_objc_message_expr
	testq	%rax, %rax
	je	.L7620
	cmpl	$2, 260(%rsp)
	jg	.L7804
.L7620:
	movl	$.LC82, %edi
	movl	260(%rsp), %esi
	movq	264(%rsp), %rax
.L7770:
	movq	32(%rax), %rdx
	xorl	%eax, %eax
	call	error
	jmp	.L7623
.L7804:
	movl	260(%rsp), %esi
	movl	$.LC82, %edi
	subl	$2, %esi
	jmp	.L7770
.L7619:
	movl	260(%rsp), %esi
	movl	$.LC83, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L7623
.L7802:
	cmpl	$13, %r12d
	jne	.L6899
.L7771:
	movq	288(%rsp), %rdi
	movq	%r13, %rsi
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	convert
.L7801:
	cmpl	$13, %r12d
	jne	.L7615
	movl	$.LC81, %edi
.L7793:
	movq	280(%rsp), %rsi
	movq	264(%rsp), %rdx
	movl	260(%rsp), %ecx
	call	warn_for_assignment
	jmp	.L7771
.L7800:
	cmpl	$6, %r12d
	jne	.L7610
	movzbl	16(%r13), %eax
	cmpb	$25, %al
	je	.L7805
.L7612:
	cmpb	$115, %al
	jne	.L7613
	movq	8(%r13), %rcx
	cmpb	$6, 16(%rcx)
	je	.L7806
.L7613:
	movl	$.LC80, %edi
	jmp	.L7793
.L7806:
	movq	32(%r13), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7613
	call	integer_zerop
	testl	%eax, %eax
	je	.L7613
.L7611:
	movq	global_trees+112(%rip), %r13
	jmp	.L6663
.L7805:
	movq	%r13, %rdi
	call	integer_zerop
	testl	%eax, %eax
	jne	.L7611
	movzbl	16(%r13), %eax
	jmp	.L7612
	.p2align 6,,7
.L7263:
	cmpl	$13, %r12d
	je	.L7264
	cmpl	$15, %r12d
	jne	.L7262
.L7264:
	movq	288(%rsp), %r10
	movq	8(%r10), %r12
	movq	%r12, 176(%rsp)
	movq	8(%r14), %rcx
	movq	%rcx, 168(%rsp)
	movzbl	16(%r12), %esi
	cmpb	$5, %sil
	je	.L7736
	movzbl	16(%rcx), %ecx
	cmpb	$5, %cl
	je	.L7266
	movq	288(%rsp), %rdi
	movq	%r14, %rsi
	movl	$1, %edx
	call	maybe_objc_comptypes
	testl	%eax, %eax
	js	.L7807
.L7268:
	testl	%eax, %eax
	je	.L7808
.L7737:
	movq	176(%rsp), %rdi
	movq	168(%rsp), %rax
	movzbl	16(%rdi), %esi
	movzbl	16(%rax), %ecx
.L7266:
	movl	pedantic(%rip), %ebx
	testl	%ebx, %ebx
	je	.L7428
	cmpb	$5, %sil
	je	.L7809
.L7430:
	cmpb	$5, %cl
	je	.L7810
.L7428:
	cmpb	$23, %cl
	je	.L7433
	cmpb	$23, %sil
	je	.L7740
	movq	168(%rsp), %r15
	movq	168(%rsp), %rbx
	xorl	%edi, %edi
	movzbl	17(%r15), %r8d
	movzbl	62(%rbx), %r12d
	movl	%r8d, %edx
	shrb	$5, %r12b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r12d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r12d
	orl	%r8d, %edx
	orl	%r12d, %edx
	cmpb	$20, %cl
	je	.L7811
.L7435:
	movq	176(%rsp), %rax
	leal	0(,%rdi,8), %r8d
	orl	%edx, %r8d
	movzbl	17(%rax), %ebx
	movl	%ebx, %edx
	shrb	$3, %bl
	shrb	$4, %dl
	andl	$1, %ebx
	addl	%ebx, %ebx
	andl	$1, %edx
	orl	%ebx, %edx
	movq	176(%rsp), %rbx
	movzbl	62(%rbx), %edi
	shrb	$5, %dil
	andl	$1, %edi
	sall	$2, %edi
	orl	%edi, %edx
	xorl	%edi, %edi
	cmpb	$20, %sil
	je	.L7812
.L7436:
	leal	0(,%rdi,8), %r9d
	movl	$.LC75, %edi
	orl	%r9d, %edx
	notl	%edx
	testl	%edx, %r8d
	jne	.L7793
	cmpb	$5, %sil
	je	.L7771
	cmpb	$5, %cl
	je	.L7771
	movq	288(%rsp), %rdi
	movq	%r14, %rsi
	movl	$1, %edx
	call	maybe_objc_comptypes
	testl	%eax, %eax
	js	.L7813
.L7441:
	testl	%eax, %eax
	jne	.L7771
	movl	pedantic(%rip), %r14d
	testl	%r14d, %r14d
	je	.L7771
	movl	$.LC78, %edi
	jmp	.L7793
.L7813:
	movq	288(%rsp), %r11
	movq	8(%r14), %rcx
	movq	8(%r11), %rsi
	movq	128(%rcx), %rbp
	movq	128(%rsi), %rbx
	cmpq	%rbp, %rbx
	je	.L7768
	testq	%rbx, %rbx
	je	.L7768
	testq	%rbp, %rbp
	je	.L7768
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L7768
	movzbl	16(%rbp), %eax
	testb	%al, %al
	je	.L7768
	cmpb	$6, %dl
	je	.L7814
.L7445:
	cmpb	$6, %al
	je	.L7815
.L7446:
	cmpb	$10, %dl
	je	.L7816
.L7447:
	cmpb	$10, 16(%rbp)
	je	.L7817
.L7448:
	cmpq	%rbp, %rbx
	movl	$1, %r15d
	je	.L7444
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L7450
	xorl	%r15d, %r15d
.L7444:
	cmpl	$2, %r15d
	je	.L7818
.L7600:
	movl	%r15d, %eax
	jmp	.L7441
.L7818:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L7600
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L7600
.L7450:
	movzbl	17(%rbx), %r12d
	movzbl	62(%rbx), %r10d
	xorl	%ecx, %ecx
	movl	%r12d, %edx
	shrb	$5, %r10b
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r12d, %r12d
	sall	$2, %r10d
	orl	%r12d, %edx
	orl	%r10d, %edx
	cmpb	$20, %sil
	je	.L7819
.L7452:
	movzbl	17(%rbp), %r15d
	movzbl	62(%rbp), %r8d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	shrb	$5, %r8b
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	$1, %r15d
	andl	$1, %r8d
	andl	$1, %edx
	addl	%r15d, %r15d
	sall	$2, %r8d
	orl	%r15d, %edx
	orl	%r8d, %edx
	cmpb	$20, %sil
	je	.L7820
.L7453:
	leal	0(,%rcx,8), %r9d
	xorl	%r15d, %r15d
	orl	%r9d, %edx
	cmpl	%edx, %edi
	jne	.L7444
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L7768
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	xorl	%r15d, %r15d
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 160(%rsp)
	je	.L7444
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L7579
	cmpl	$18, %eax
	ja	.L7596
	cmpl	$13, %eax
	je	.L7457
.L7456:
	cmpl	$2, 160(%rsp)
	jne	.L7444
	cmpl	$1, %r15d
	cmove	160(%rsp), %r15d
	jmp	.L7444
.L7457:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L7458
	call	comptypes
	movl	%eax, %r15d
	jmp	.L7456
.L7458:
	movl	$1, %r15d
	jmp	.L7456
.L7596:
	cmpl	$20, %eax
	je	.L7592
	cmpl	$23, %eax
	jne	.L7456
	movl	$1, 12(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L7461
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 12(%rsp)
	je	.L7456
.L7461:
	movq	24(%rbx), %r14
	movq	24(%rbp), %r12
	testq	%r14, %r14
	je	.L7821
	testq	%r12, %r12
	je	.L7822
	movl	$1, %r15d
	xorl	%ebp, %ebp
.L7576:
	testq	%r14, %r14
	je	.L7823
	testq	%r12, %r12
	je	.L7565
	movq	32(%r14), %rdi
	testq	%rdi, %rdi
	je	.L7824
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L7551
.L7791:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7565
.L7550:
	movq	(%r14), %r14
	movq	(%r12), %r12
	cmpl	%r15d, %ebp
	cmovg	%ebp, %r15d
	jmp	.L7576
.L7565:
	xorl	%r15d, %r15d
.L7545:
	cmpl	$1, %r15d
	cmove	12(%rsp), %r15d
	jmp	.L7456
.L7551:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L7550
	movq	32(%r14), %rax
	cmpb	$21, 16(%rax)
	je	.L7826
.L7555:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L7565
	cmpq	$0, 96(%rax)
	je	.L7566
	testb	$8, 62(%rax)
	je	.L7565
.L7566:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7565
	movq	32(%r14), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7565
	movq	32(%r12), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L7565
.L7572:
	movq	8(%rbx), %rdi
	movq	32(%r14), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7568
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7572
	jmp	.L7565
.L7568:
	testq	%rbx, %rbx
	jne	.L7550
	jmp	.L7565
.L7826:
	cmpq	$0, 96(%rax)
	je	.L7556
	testb	$8, 62(%rax)
	je	.L7555
.L7556:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7555
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7555
	movq	32(%r14), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L7565
.L7562:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7568
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7562
	jmp	.L7565
.L7824:
	movq	32(%r12), %rdi
	jmp	.L7791
.L7823:
	testq	%r12, %r12
	je	.L7545
	jmp	.L7565
.L7822:
	movq	%r14, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L7456
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L7676
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r15d, %r15d
.L7540:
	testq	%r14, %r14
	je	.L7827
	testq	%rbp, %rbp
	je	.L7529
	movq	32(%r14), %rdi
	testq	%rdi, %rdi
	je	.L7828
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L7515
.L7789:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7529
.L7514:
	movq	(%r14), %r14
	movq	(%rbp), %rbp
	cmpl	%r12d, %r15d
	cmovg	%r15d, %r12d
	jmp	.L7540
.L7529:
	xorl	%r12d, %r12d
.L7509:
	movl	$2, %r15d
	decl	%r12d
.L7790:
	jne	.L7456
.L7676:
	movl	12(%rsp), %r15d
	jmp	.L7456
.L7515:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L7514
	movq	32(%r14), %rax
	cmpb	$21, 16(%rax)
	je	.L7830
.L7519:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L7529
	cmpq	$0, 96(%rax)
	je	.L7530
	testb	$8, 62(%rax)
	je	.L7529
.L7530:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7529
	movq	32(%r14), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7529
	movq	32(%rbp), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L7529
.L7536:
	movq	8(%rbx), %rdi
	movq	32(%r14), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7532
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7536
	jmp	.L7529
.L7532:
	testq	%rbx, %rbx
	jne	.L7514
	jmp	.L7529
.L7830:
	cmpq	$0, 96(%rax)
	je	.L7520
	testb	$8, 62(%rax)
	je	.L7519
.L7520:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7519
	movq	32(%rbp), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7519
	movq	32(%r14), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L7529
.L7526:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7532
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7526
	jmp	.L7529
.L7828:
	movq	32(%rbp), %rdi
	jmp	.L7789
.L7827:
	testq	%rbp, %rbp
	je	.L7509
	jmp	.L7529
.L7821:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L7456
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L7676
	movq	%rax, %rbp
	movl	$1, %r14d
	xorl	%r15d, %r15d
.L7501:
	testq	%r12, %r12
	je	.L7831
	testq	%rbp, %rbp
	je	.L7490
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L7832
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L7476
.L7788:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7490
.L7475:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r14d, %r15d
	cmovg	%r15d, %r14d
	jmp	.L7501
.L7490:
	xorl	%r14d, %r14d
.L7470:
	movl	$2, %r15d
	decl	%r14d
	jmp	.L7790
.L7476:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L7475
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L7834
.L7480:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L7490
	cmpq	$0, 96(%rax)
	je	.L7491
	testb	$8, 62(%rax)
	je	.L7490
.L7491:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7490
	movq	32(%r12), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7490
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L7490
.L7497:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7493
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7497
	jmp	.L7490
.L7493:
	testq	%rbx, %rbx
	jne	.L7475
	jmp	.L7490
.L7834:
	cmpq	$0, 96(%rax)
	je	.L7481
	testb	$8, 62(%rax)
	je	.L7480
.L7481:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7480
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7480
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L7490
.L7487:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7493
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7487
	jmp	.L7490
.L7832:
	movq	32(%rbp), %rdi
	jmp	.L7788
.L7831:
	testq	%rbp, %rbp
	je	.L7470
	jmp	.L7490
.L7592:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L7456
.L7579:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r15d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r14
	cmpq	%rsi, %rdi
	je	.L7580
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L7444
.L7580:
	testq	%r12, %r12
	je	.L7456
	testq	%r14, %r14
	je	.L7456
	cmpq	%r14, %r12
	je	.L7456
	movq	112(%r12), %rcx
	movq	112(%r14), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L7583
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L7835
.L7584:
	movl	$1, %r8d
.L7583:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L7585
	movq	104(%r14), %r11
	cmpb	$25, 16(%r11)
	je	.L7836
.L7586:
	movl	$1, %ecx
.L7585:
	testb	%r8b, %r8b
	jne	.L7456
	testb	%cl, %cl
	jne	.L7456
	testb	%dil, %dil
	je	.L7727
	testb	%dl, %dl
.L7767:
	jne	.L7456
.L7591:
	xorl	%r15d, %r15d
	jmp	.L7456
.L7727:
	testb	%dl, %dl
	jne	.L7591
	movq	104(%r12), %rdi
	movq	104(%r14), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7591
	movq	112(%r12), %rdi
	movq	112(%r14), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L7767
.L7836:
	cmpb	$25, 16(%rsi)
	jne	.L7586
	jmp	.L7585
.L7835:
	cmpb	$25, 16(%rcx)
	jne	.L7584
	jmp	.L7583
	.p2align 6,,7
.L7768:
	movl	$1, %r15d
	jmp	.L7444
.L7820:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L7453
.L7819:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L7452
.L7817:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L7448
.L7816:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L7447
.L7815:
	testb	$2, 62(%rbp)
	je	.L7446
	movq	24(%rbp), %r14
	testq	%r14, %r14
	cmovne	%r14, %rbp
	jmp	.L7446
.L7814:
	testb	$2, 62(%rbx)
	je	.L7445
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7445
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L7445
	.p2align 6,,7
.L7812:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %edi
	jmp	.L7436
.L7811:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %edi
	jmp	.L7435
.L7740:
	cmpb	$23, %cl
	jne	.L7771
	movq	168(%rsp), %r9
	movq	176(%rsp), %rdi
	movq	168(%rsp), %r10
	movzbl	17(%r9), %r8d
	movzbl	17(%rdi), %ebx
	movzbl	62(%r10), %esi
	movzbl	62(%rdi), %edx
	movl	$.LC74, %edi
	movl	%r8d, %r12d
	movl	%ebx, %r15d
	shrb	$3, %r8b
	shrb	$3, %bl
	shrb	$4, %r12b
	andl	$1, %r8d
	shrb	$5, %sil
	shrb	$4, %r15b
	andl	$1, %ebx
	shrb	$5, %dl
	andl	$1, %r12d
	addl	%r8d, %r8d
	andl	$1, %esi
	andl	$1, %r15d
	addl	%ebx, %ebx
	andl	$1, %edx
	orl	%r8d, %r12d
	sall	$2, %esi
	orl	%ebx, %r15d
	sall	$2, %edx
	orl	%esi, %r12d
	orl	%edx, %r15d
	notl	%r12d
	testl	%r12d, %r15d
	jne	.L7793
	jmp	.L7771
.L7433:
	cmpb	$23, %sil
	jne	.L7771
	jmp	.L7740
.L7810:
	movq	%r13, %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L7431
	cmpb	$115, 16(%r13)
	je	.L7431
	movq	176(%rsp), %rbp
	movq	168(%rsp), %r11
	movzbl	16(%rbp), %esi
	movzbl	16(%r11), %ecx
	jmp	.L7428
.L7431:
	movq	176(%rsp), %r9
	movzbl	16(%r9), %esi
	cmpb	$23, %sil
	je	.L7429
	movq	168(%rsp), %r10
	movzbl	16(%r10), %ecx
	jmp	.L7428
.L7429:
	movl	$.LC77, %edi
	jmp	.L7793
.L7809:
	cmpb	$23, %cl
	jne	.L7430
	jmp	.L7429
.L7808:
	movq	176(%rsp), %rsi
	movq	128(%rsi), %rdi
	call	unsigned_type
	movq	168(%rsp), %rcx
	movq	%rax, %r15
	movq	128(%rcx), %rdi
	call	unsigned_type
	movl	$.LC79, %edi
	cmpq	%rax, %r15
	jne	.L7793
	jmp	.L7737
.L7807:
	movq	288(%rsp), %r15
	movq	8(%r14), %rcx
	movq	8(%r15), %r9
	movq	128(%rcx), %rbp
	movq	128(%r9), %rbx
	cmpq	%rbp, %rbx
	je	.L7766
	testq	%rbx, %rbx
	je	.L7766
	testq	%rbp, %rbp
	je	.L7766
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L7766
	movzbl	16(%rbp), %eax
	testb	%al, %al
	je	.L7766
	cmpb	$6, %dl
	je	.L7837
.L7272:
	cmpb	$6, %al
	je	.L7838
.L7273:
	cmpb	$10, %dl
	je	.L7839
.L7274:
	cmpb	$10, 16(%rbp)
	je	.L7840
.L7275:
	cmpq	%rbp, %rbx
	movl	$1, 16(%rsp)
	je	.L7271
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L7277
	movl	$0, 16(%rsp)
.L7271:
	cmpl	$2, 16(%rsp)
	je	.L7841
.L7427:
	movl	16(%rsp), %eax
	jmp	.L7268
.L7841:
	movl	pedantic(%rip), %r8d
	testl	%r8d, %r8d
	je	.L7427
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L7427
.L7277:
	movzbl	17(%rbx), %r12d
	movzbl	62(%rbx), %r8d
	xorl	%ecx, %ecx
	movl	%r12d, %edx
	shrb	$5, %r8b
	shrb	$3, %r12b
	shrb	$4, %dl
	andl	$1, %r12d
	andl	$1, %r8d
	andl	$1, %edx
	addl	%r12d, %r12d
	sall	$2, %r8d
	orl	%r12d, %edx
	orl	%r8d, %edx
	cmpb	$20, %sil
	je	.L7842
.L7279:
	leal	0(,%rcx,8), %edi
	movzbl	62(%rbp), %r10d
	movzbl	17(%rbp), %ecx
	orl	%edx, %edi
	movl	%ecx, %edx
	shrb	$5, %r10b
	shrb	$3, %cl
	shrb	$4, %dl
	andl	$1, %ecx
	andl	$1, %r10d
	addl	%ecx, %ecx
	andl	$1, %edx
	sall	$2, %r10d
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	orl	%r10d, %edx
	cmpb	$20, %sil
	je	.L7843
.L7280:
	leal	0(,%rcx,8), %esi
	movl	$0, 16(%rsp)
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L7271
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L7766
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 16(%rsp)
	testl	%eax, %eax
	movl	%eax, 164(%rsp)
	je	.L7271
	movl	$0, 16(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L7406
	cmpl	$18, %eax
	ja	.L7423
	cmpl	$13, %eax
	je	.L7284
.L7283:
	cmpl	$2, 164(%rsp)
	jne	.L7271
	cmpl	$1, 16(%rsp)
	movl	164(%rsp), %r12d
	cmovne	16(%rsp), %r12d
	movl	%r12d, 16(%rsp)
	jmp	.L7271
.L7284:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L7285
	call	comptypes
.L7765:
	movl	%eax, 16(%rsp)
	jmp	.L7283
.L7285:
	movl	$1, 16(%rsp)
	jmp	.L7283
.L7423:
	cmpl	$20, %eax
	je	.L7419
	cmpl	$23, %eax
	jne	.L7283
	movl	$1, 28(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L7288
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 28(%rsp)
	je	.L7283
.L7288:
	movq	24(%rbx), %r15
	movq	24(%rbp), %r12
	testq	%r15, %r15
	je	.L7844
	testq	%r12, %r12
	je	.L7845
	movl	$1, 16(%rsp)
	xorl	%ebp, %ebp
.L7403:
	testq	%r15, %r15
	je	.L7846
	testq	%r12, %r12
	je	.L7392
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L7847
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L7378
.L7787:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7392
.L7377:
	cmpl	16(%rsp), %ebp
	movl	16(%rsp), %r11d
	cmovg	%ebp, %r11d
	movl	%r11d, 16(%rsp)
	movq	(%r12), %r12
	movq	(%r15), %r15
	jmp	.L7403
.L7392:
	movl	$0, 16(%rsp)
.L7372:
	cmpl	$1, 16(%rsp)
	movl	16(%rsp), %eax
	cmove	28(%rsp), %eax
	jmp	.L7765
.L7378:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L7377
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L7849
.L7382:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L7392
	cmpq	$0, 96(%rax)
	je	.L7393
	testb	$8, 62(%rax)
	je	.L7392
.L7393:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7392
	movq	32(%r15), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7392
	movq	32(%r12), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L7392
.L7399:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7395
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7399
	jmp	.L7392
.L7395:
	testq	%rbx, %rbx
	jne	.L7377
	jmp	.L7392
.L7849:
	cmpq	$0, 96(%rax)
	je	.L7383
	testb	$8, 62(%rax)
	je	.L7382
.L7383:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7382
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7382
	movq	32(%r15), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L7392
.L7389:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7395
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7389
	jmp	.L7392
.L7847:
	movq	32(%r12), %rdi
	jmp	.L7787
.L7846:
	testq	%r12, %r12
	je	.L7372
	jmp	.L7392
.L7845:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L7283
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L7671
	movq	%rax, %rbp
	movl	$1, %r12d
	movl	$0, 20(%rsp)
.L7367:
	testq	%r15, %r15
	je	.L7850
	testq	%rbp, %rbp
	je	.L7356
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L7851
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L7342
.L7786:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7356
.L7341:
	cmpl	%r12d, 20(%rsp)
	movq	(%r15), %r15
	cmovg	20(%rsp), %r12d
	movq	(%rbp), %rbp
	jmp	.L7367
.L7356:
	xorl	%r12d, %r12d
.L7336:
	decl	%r12d
	movl	$2, 16(%rsp)
	jne	.L7283
	movl	28(%rsp), %r15d
	movl	%r15d, 16(%rsp)
	jmp	.L7283
.L7342:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 20(%rsp)
	jne	.L7341
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L7853
.L7346:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L7356
	cmpq	$0, 96(%rax)
	je	.L7357
	testb	$8, 62(%rax)
	je	.L7356
.L7357:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7356
	movq	32(%r15), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7356
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L7356
.L7363:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7359
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7363
	jmp	.L7356
.L7359:
	testq	%rbx, %rbx
	jne	.L7341
	jmp	.L7356
.L7853:
	cmpq	$0, 96(%rax)
	je	.L7347
	testb	$8, 62(%rax)
	je	.L7346
.L7347:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7346
	movq	32(%rbp), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7346
	movq	32(%r15), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L7356
.L7353:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7359
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7353
	jmp	.L7356
.L7851:
	movq	32(%rbp), %rdi
	jmp	.L7786
.L7850:
	testq	%rbp, %rbp
	je	.L7336
	jmp	.L7356
.L7671:
	movl	28(%rsp), %eax
	movl	%eax, 16(%rsp)
	jmp	.L7283
.L7844:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L7283
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L7669
	movq	%rax, %rbp
	movl	$1, %r15d
	movl	$0, 24(%rsp)
.L7328:
	testq	%r12, %r12
	je	.L7854
	testq	%rbp, %rbp
	je	.L7317
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L7855
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L7303
.L7785:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7317
.L7302:
	cmpl	%r15d, 24(%rsp)
	movq	(%r12), %r12
	cmovg	24(%rsp), %r15d
	movq	(%rbp), %rbp
	jmp	.L7328
.L7317:
	xorl	%r15d, %r15d
.L7297:
	decl	%r15d
	movl	$2, 16(%rsp)
	jne	.L7283
	movl	28(%rsp), %eax
	jmp	.L7765
.L7303:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 24(%rsp)
	jne	.L7302
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L7857
.L7307:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L7317
	cmpq	$0, 96(%rax)
	je	.L7318
	testb	$8, 62(%rax)
	je	.L7317
.L7318:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7317
	movq	32(%r12), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7317
	movq	32(%rbp), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L7317
.L7324:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7320
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7324
	jmp	.L7317
.L7320:
	testq	%rbx, %rbx
	jne	.L7302
	jmp	.L7317
.L7857:
	cmpq	$0, 96(%rax)
	je	.L7308
	testb	$8, 62(%rax)
	je	.L7307
.L7308:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7307
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7307
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L7317
.L7314:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7320
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7314
	jmp	.L7317
.L7855:
	movq	32(%rbp), %rdi
	jmp	.L7785
.L7854:
	testq	%rbp, %rbp
	je	.L7297
	jmp	.L7317
.L7669:
	movl	28(%rsp), %ebp
	movl	%ebp, 16(%rsp)
	jmp	.L7283
.L7419:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	16(%rsp), %eax
	jmp	.L7765
.L7406:
	movq	24(%rbx), %r12
	movq	24(%rbp), %r15
	movl	$1, 16(%rsp)
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L7407
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 16(%rsp)
	je	.L7271
.L7407:
	testq	%r12, %r12
	je	.L7283
	testq	%r15, %r15
	je	.L7283
	cmpq	%r15, %r12
	je	.L7283
	movq	112(%r12), %rcx
	movq	112(%r15), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L7410
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L7858
.L7411:
	movl	$1, %r8d
.L7410:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L7412
	movq	104(%r15), %r10
	cmpb	$25, 16(%r10)
	je	.L7859
.L7413:
	movl	$1, %ecx
.L7412:
	testb	%r8b, %r8b
	jne	.L7283
	testb	%cl, %cl
	jne	.L7283
	testb	%dil, %dil
	je	.L7717
	testb	%dl, %dl
.L7764:
	jne	.L7283
.L7418:
	movl	$0, 16(%rsp)
	jmp	.L7283
.L7717:
	testb	%dl, %dl
	jne	.L7418
	movq	104(%r12), %rdi
	movq	104(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7418
	movq	112(%r12), %rdi
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L7764
.L7859:
	cmpb	$25, 16(%rsi)
	jne	.L7413
	jmp	.L7412
.L7858:
	cmpb	$25, 16(%rcx)
	jne	.L7411
	jmp	.L7410
	.p2align 6,,7
.L7766:
	movl	$1, 16(%rsp)
	jmp	.L7271
.L7843:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L7280
.L7842:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L7279
.L7840:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L7275
.L7839:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L7274
.L7838:
	testb	$2, 62(%rbp)
	je	.L7273
	movq	24(%rbp), %r11
	testq	%r11, %r11
	cmovne	%r11, %rbp
	jmp	.L7273
.L7837:
	testb	$2, 62(%rbx)
	je	.L7272
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7272
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L7272
	.p2align 6,,7
.L7736:
	movq	168(%rsp), %rdx
	movzbl	16(%rdx), %ecx
	jmp	.L7266
.L7799:
	movq	288(%rsp), %rcx
	testb	$8, 62(%rcx)
	je	.L6904
	cmpq	$0, 280(%rsp)
	jne	.L6904
	movq	$0, 40(%rsp)
	movq	24(%rcx), %r10
	testq	%r10, %r10
	movq	%r10, 32(%rsp)
	je	.L7687
.L7248:
	movq	32(%rsp), %r11
	movq	8(%r11), %rbp
	movq	%rbp, 232(%rsp)
	movq	128(%rbp), %rbx
	movq	128(%r14), %rbp
	cmpq	%rbp, %rbx
	je	.L7757
	testq	%rbx, %rbx
	je	.L7757
	testq	%rbp, %rbp
	je	.L7757
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L7757
	movzbl	16(%rbp), %eax
	testb	%al, %al
	je	.L7757
	cmpb	$6, %dl
	je	.L7860
.L6913:
	cmpb	$6, %al
	je	.L7861
.L6914:
	cmpb	$10, %dl
	je	.L7862
.L6915:
	cmpb	$10, 16(%rbp)
	je	.L7863
.L6916:
	cmpq	%rbp, %rbx
	movl	$1, 84(%rsp)
	je	.L6912
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L6918
	movl	$0, 84(%rsp)
.L6912:
	movl	84(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L6906
.L7728:
	movq	232(%rsp), %rbx
	cmpb	$13, 16(%rbx)
	je	.L7864
.L6907:
	movq	32(%rsp), %r8
	movq	(%r8), %r11
	testq	%r11, %r11
	movq	%r11, 32(%rsp)
	jne	.L7248
.L7687:
	cmpq	$0, 40(%rsp)
	je	.L6899
	cmpq	$0, 32(%rsp)
	jne	.L7251
	movq	8(%r14), %rsi
	movq	40(%rsp), %r12
	movzbl	16(%rsi), %r9d
	movq	8(%r12), %rdi
	cmpb	$23, %r9b
	je	.L7865
	movzbl	16(%rdi), %r8d
.L7252:
	movzbl	17(%rsi), %ebx
	movzbl	62(%rsi), %r15d
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	shrb	$5, %r15b
	shrb	$3, %bl
	shrb	$4, %dl
	andl	$1, %ebx
	andl	$1, %r15d
	andl	$1, %edx
	addl	%ebx, %ebx
	sall	$2, %r15d
	orl	%ebx, %edx
	orl	%r15d, %edx
	cmpb	$20, %r9b
	je	.L7866
.L7258:
	movzbl	17(%rdi), %r11d
	movzbl	62(%rdi), %ebp
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r11d, %edx
	shrb	$5, %bpl
	shrb	$3, %r11b
	shrb	$4, %dl
	andl	$1, %r11d
	andl	$1, %ebp
	andl	$1, %edx
	addl	%r11d, %r11d
	sall	$2, %ebp
	orl	%r11d, %edx
	orl	%ebp, %edx
	cmpb	$20, %r8b
	je	.L7867
.L7259:
	leal	0(,%rcx,8), %r8d
	orl	%r8d, %edx
	notl	%edx
	testl	%edx, %esi
	jne	.L7868
.L7251:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L7260
	movq	272(%rsp), %rsi
	testb	$1, 50(%rsi)
	je	.L7869
.L7260:
	movl	$115, %edi
	movq	288(%rsp), %rsi
	movq	%r13, %rdx
.L7772:
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	build1
.L7869:
	movl	$.LC76, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L7260
.L7868:
	movl	$.LC75, %edi
.L7763:
	movq	280(%rsp), %rsi
	movq	264(%rsp), %rdx
	movl	260(%rsp), %ecx
	call	warn_for_assignment
	jmp	.L7251
.L7867:
	cmpq	$0, 8(%rdi)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L7259
.L7866:
	cmpq	$0, 8(%rsi)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L7258
.L7865:
	movzbl	16(%rdi), %r8d
	cmpb	$23, %r8b
	jne	.L7252
	movzbl	17(%rsi), %ecx
	movzbl	17(%rdi), %edx
	movzbl	62(%rdi), %r9d
	movzbl	62(%rsi), %edi
	movl	%ecx, %r14d
	movl	%edx, %r10d
	shrb	$3, %cl
	shrb	$3, %dl
	shrb	$4, %r14b
	andl	$1, %ecx
	shrb	$5, %dil
	shrb	$4, %r10b
	andl	$1, %edx
	shrb	$5, %r9b
	andl	$1, %r14d
	addl	%ecx, %ecx
	andl	$1, %edi
	andl	$1, %r10d
	addl	%edx, %edx
	sall	$2, %edi
	andl	$1, %r9d
	orl	%ecx, %r14d
	orl	%edi, %r14d
	orl	%edx, %r10d
	sall	$2, %r9d
	orl	%r9d, %r10d
	notl	%r14d
	movl	$.LC74, %edi
	testl	%r14d, %r10d
	jne	.L7763
	jmp	.L7251
	.p2align 6,,7
.L7864:
	cmpl	$13, %r12d
	je	.L7870
.L7069:
	movq	%r13, %rdi
	call	integer_zerop
	testl	%eax, %eax
	jne	.L7247
	cmpb	$115, 16(%r13)
	jne	.L6907
	movq	32(%r13), %rdi
	call	integer_zerop
	testl	%eax, %eax
	je	.L6907
.L7247:
	movq	global_trees+112(%rip), %r13
.L6906:
	cmpq	$0, 32(%rsp)
	jne	.L7251
	jmp	.L7687
	.p2align 6,,7
.L7870:
	movq	8(%rbx), %r10
	movq	%r10, 208(%rsp)
	movq	8(%r14), %rdx
	movq	%rdx, 200(%rsp)
	movzbl	16(%r10), %ebp
	cmpb	$5, %bpl
	je	.L7734
	movzbl	16(%rdx), %ebx
	cmpb	$5, %bl
	je	.L7071
	movq	232(%rsp), %rdi
	movq	%r14, %rsi
	movl	$1, %edx
	call	maybe_objc_comptypes
	testl	%eax, %eax
	js	.L7871
.L7073:
	testl	%eax, %eax
	je	.L7069
	movq	208(%rsp), %rcx
	movq	200(%rsp), %rdi
	movzbl	16(%rcx), %ebp
	movzbl	16(%rdi), %ebx
.L7071:
	movq	208(%rsp), %rcx
	movl	$1, %esi
	movzbl	17(%rcx), %r8d
	movzbl	62(%rcx), %r10d
	movl	%r8d, %r9d
	movl	%r8d, %r15d
	movl	%r10d, %edx
	shrb	$3, %r9b
	shrb	$4, %r15b
	shrb	$5, %dl
	andl	$1, %r9d
	andl	%r15d, %esi
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %edx
	orl	%r9d, %esi
	orl	%edx, %esi
	xorl	%edx, %edx
	cmpb	$20, %bpl
	je	.L7872
.L7235:
	leal	0(,%rdx,8), %edi
	movq	200(%rsp), %rax
	movq	200(%rsp), %rdx
	orl	%esi, %edi
	movzbl	17(%rdx), %r9d
	movl	%r9d, %r15d
	movl	%r9d, %r11d
	shrb	$4, %r15b
	shrb	$3, %r11b
	andl	$1, %r11d
	movl	%r15d, %edx
	addl	%r11d, %r11d
	andl	$1, %edx
	orl	%r11d, %edx
	movzbl	62(%rax), %r11d
	movl	%r11d, %ecx
	shrb	$5, %cl
	andl	$1, %ecx
	sall	$2, %ecx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %bl
	je	.L7873
.L7236:
	leal	0(,%rcx,8), %r15d
	orl	%edx, %r15d
	cmpl	%r15d, %edi
	je	.L6906
	cmpb	$23, %bl
	je	.L7874
.L7237:
	movl	%r8d, %ecx
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %cl
	xorl	%edx, %edx
	movl	%r8d, %edi
	andl	%ecx, %esi
	movl	%r10d, %r8d
	andl	$1, %edi
	andl	$1, %r8d
	addl	%edi, %edi
	sall	$2, %r8d
	orl	%edi, %esi
	orl	%r8d, %esi
	cmpb	$20, %bpl
	je	.L7875
.L7242:
	movl	%r9d, %r15d
	leal	0(,%rdx,8), %edi
	shrb	$5, %r11b
	shrb	$3, %r9b
	shrb	$4, %r15b
	orl	%esi, %edi
	movl	%r9d, %edx
	movl	%r15d, %ecx
	movl	%r11d, %r9d
	andl	$1, %edx
	andl	$1, %ecx
	andl	$1, %r9d
	addl	%edx, %edx
	sall	$2, %r9d
	orl	%edx, %ecx
	xorl	%edx, %edx
	orl	%r9d, %ecx
	cmpb	$20, %bl
	je	.L7876
.L7243:
	sall	$3, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	orl	%edi, %edx
	cmpb	$20, %bpl
	je	.L7877
.L7244:
	leal	0(,%rcx,8), %ebp
	orl	%ebp, %esi
	cmpl	%esi, %edx
.L7762:
	je	.L6906
	cmpq	$0, 40(%rsp)
	movq	232(%rsp), %rsi
	cmovne	40(%rsp), %rsi
	movq	%rsi, 40(%rsp)
	jmp	.L7069
.L7877:
	movq	208(%rsp), %rbx
	movl	$1, %eax
	cmpq	$0, 8(%rbx)
	cmovne	%eax, %ecx
	jmp	.L7244
.L7876:
	movq	200(%rsp), %rax
	cmpq	$0, 8(%rax)
	movl	$1, %eax
	cmovne	%eax, %edx
	jmp	.L7243
.L7875:
	movq	208(%rsp), %r10
	movl	$1, %eax
	cmpq	$0, 8(%r10)
	cmovne	%eax, %edx
	jmp	.L7242
.L7874:
	cmpb	$23, %bpl
	jne	.L7237
	orl	%edx, %esi
	cmpl	%edx, %esi
	jmp	.L7762
	.p2align 6,,7
.L7873:
	movq	200(%rsp), %r15
	movl	$1, %eax
	cmpq	$0, 8(%r15)
	cmovne	%eax, %ecx
	jmp	.L7236
.L7872:
	cmpq	$0, 8(%rcx)
	movl	$1, %eax
	cmovne	%eax, %edx
	jmp	.L7235
.L7871:
	movq	232(%rsp), %rbx
	movq	8(%r14), %rsi
	movq	8(%rbx), %rdx
	movq	128(%rsi), %rbp
	movq	128(%rdx), %rbx
	cmpq	%rbp, %rbx
	je	.L7761
	testq	%rbx, %rbx
	je	.L7761
	testq	%rbp, %rbp
	je	.L7761
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L7761
	movzbl	16(%rbp), %eax
	testb	%al, %al
	je	.L7761
	cmpb	$6, %dl
	je	.L7878
.L7077:
	cmpb	$6, %al
	je	.L7879
.L7078:
	cmpb	$10, %dl
	je	.L7880
.L7079:
	cmpb	$10, 16(%rbp)
	je	.L7881
.L7080:
	cmpq	%rbp, %rbx
	movl	$1, 52(%rsp)
	je	.L7076
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L7082
	movl	$0, 52(%rsp)
.L7076:
	cmpl	$2, 52(%rsp)
	je	.L7882
.L7232:
	movl	52(%rsp), %eax
	jmp	.L7073
.L7882:
	movl	pedantic(%rip), %r10d
	testl	%r10d, %r10d
	je	.L7232
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L7232
.L7082:
	movzbl	17(%rbx), %r8d
	movzbl	62(%rbx), %r9d
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %r9b
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %r9d
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %r9d
	orl	%r8d, %edx
	orl	%r9d, %edx
	cmpb	$20, %sil
	je	.L7883
.L7084:
	leal	0(,%rcx,8), %edi
	movzbl	62(%rbp), %r15d
	movzbl	17(%rbp), %ecx
	orl	%edx, %edi
	movl	%ecx, %edx
	shrb	$5, %r15b
	shrb	$3, %cl
	shrb	$4, %dl
	andl	$1, %ecx
	andl	$1, %r15d
	addl	%ecx, %ecx
	andl	$1, %edx
	sall	$2, %r15d
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	orl	%r15d, %edx
	cmpb	$20, %sil
	je	.L7884
.L7085:
	leal	0(,%rcx,8), %r10d
	movl	$0, 52(%rsp)
	orl	%r10d, %edx
	cmpl	%edx, %edi
	jne	.L7076
	movq	128(%rbp), %rdi
	cmpq	%rdi, 128(%rbx)
	je	.L7761
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 52(%rsp)
	testl	%eax, %eax
	movl	%eax, 196(%rsp)
	je	.L7076
	movl	$0, 52(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L7211
	cmpl	$18, %eax
	ja	.L7228
	cmpl	$13, %eax
	je	.L7089
.L7088:
	cmpl	$2, 196(%rsp)
	jne	.L7076
	cmpl	$1, 52(%rsp)
	movl	196(%rsp), %esi
	cmovne	52(%rsp), %esi
	movl	%esi, 52(%rsp)
	jmp	.L7076
.L7089:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L7090
	call	comptypes
.L7760:
	movl	%eax, 52(%rsp)
	jmp	.L7088
.L7090:
	movl	$1, 52(%rsp)
	jmp	.L7088
.L7228:
	cmpl	$20, %eax
	je	.L7224
	cmpl	$23, %eax
	jne	.L7088
	movl	$1, 80(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L7093
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 80(%rsp)
	je	.L7088
.L7093:
	movq	24(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, 56(%rsp)
	movq	24(%rbp), %r15
	je	.L7885
	testq	%r15, %r15
	je	.L7886
	movl	$1, 52(%rsp)
	xorl	%ebp, %ebp
.L7208:
	cmpq	$0, 56(%rsp)
	je	.L7887
	testq	%r15, %r15
	je	.L7197
	movq	56(%rsp), %rcx
	movq	32(%rcx), %rdi
	testq	%rdi, %rdi
	je	.L7888
	movq	32(%r15), %rax
	testq	%rax, %rax
	jne	.L7183
.L7784:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7197
.L7182:
	cmpl	52(%rsp), %ebp
	movl	52(%rsp), %ecx
	movq	56(%rsp), %rdi
	cmovg	%ebp, %ecx
	movl	%ecx, 52(%rsp)
	movq	(%rdi), %rbx
	movq	%rbx, 56(%rsp)
	movq	(%r15), %r15
	jmp	.L7208
.L7197:
	movl	$0, 52(%rsp)
.L7177:
	cmpl	$1, 52(%rsp)
	movl	52(%rsp), %ebx
	cmove	80(%rsp), %ebx
.L7759:
	movl	%ebx, 52(%rsp)
	jmp	.L7088
.L7183:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L7182
	movq	56(%rsp), %rdi
	movq	32(%rdi), %rax
	cmpb	$21, 16(%rax)
	je	.L7890
.L7187:
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	jne	.L7197
	cmpq	$0, 96(%rax)
	je	.L7198
	testb	$8, 62(%rax)
	je	.L7197
.L7198:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7197
	movq	56(%rsp), %r9
	movq	32(%r9), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7197
	movq	32(%r15), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L7197
.L7204:
	movq	56(%rsp), %r10
	movq	8(%rbx), %rdi
	movq	32(%r10), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7200
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7204
	jmp	.L7197
.L7200:
	testq	%rbx, %rbx
	jne	.L7182
	jmp	.L7197
.L7890:
	cmpq	$0, 96(%rax)
	je	.L7188
	testb	$8, 62(%rax)
	je	.L7187
.L7188:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7187
	movq	32(%r15), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7187
	movq	56(%rsp), %rax
	movq	32(%rax), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L7197
.L7194:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7200
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7194
	jmp	.L7197
.L7888:
	movq	32(%r15), %rdi
	jmp	.L7784
.L7887:
	testq	%r15, %r15
	je	.L7177
	jmp	.L7197
.L7886:
	movq	56(%rsp), %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L7088
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L7667
	movq	%rax, %rbp
	movl	$1, %r15d
	movl	$0, 68(%rsp)
.L7172:
	cmpq	$0, 56(%rsp)
	je	.L7891
	testq	%rbp, %rbp
	je	.L7161
	movq	56(%rsp), %r10
	movq	32(%r10), %rdi
	testq	%rdi, %rdi
	je	.L7892
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L7147
.L7783:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7161
.L7146:
	movq	56(%rsp), %r10
	cmpl	%r15d, 68(%rsp)
	cmovg	68(%rsp), %r15d
	movq	(%r10), %r8
	movq	%r8, 56(%rsp)
	movq	(%rbp), %rbp
	jmp	.L7172
.L7161:
	xorl	%r15d, %r15d
.L7141:
	decl	%r15d
	movl	$2, 52(%rsp)
	jne	.L7088
	movl	80(%rsp), %ebx
	jmp	.L7759
.L7147:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 68(%rsp)
	jne	.L7146
	movq	56(%rsp), %rcx
	movq	32(%rcx), %rax
	cmpb	$21, 16(%rax)
	je	.L7894
.L7151:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L7161
	cmpq	$0, 96(%rax)
	je	.L7162
	testb	$8, 62(%rax)
	je	.L7161
.L7162:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7161
	movq	56(%rsp), %rsi
	movq	32(%rsi), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7161
	movq	32(%rbp), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L7161
.L7168:
	movq	56(%rsp), %r9
	movq	8(%rbx), %rdi
	movq	32(%r9), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7164
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7168
	jmp	.L7161
.L7164:
	testq	%rbx, %rbx
	jne	.L7146
	jmp	.L7161
.L7894:
	cmpq	$0, 96(%rax)
	je	.L7152
	testb	$8, 62(%rax)
	je	.L7151
.L7152:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7151
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7151
	movq	56(%rsp), %rax
	movq	32(%rax), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L7161
.L7158:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7164
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7158
	jmp	.L7161
.L7892:
	movq	32(%rbp), %rdi
	jmp	.L7783
.L7891:
	testq	%rbp, %rbp
	je	.L7141
	jmp	.L7161
.L7667:
	movl	80(%rsp), %r15d
	movl	%r15d, 52(%rsp)
	jmp	.L7088
.L7885:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L7088
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L7665
	movq	%rax, %rbp
	movl	$1, 72(%rsp)
	movl	$0, 76(%rsp)
.L7133:
	testq	%r15, %r15
	je	.L7895
	testq	%rbp, %rbp
	je	.L7122
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L7896
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L7108
.L7782:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7122
.L7107:
	movl	72(%rsp), %r8d
	movl	76(%rsp), %r9d
	cmpl	%r8d, 76(%rsp)
	cmovle	%r8d, %r9d
	movl	%r9d, 72(%rsp)
	movq	(%rbp), %rbp
	movq	(%r15), %r15
	jmp	.L7133
.L7122:
	movl	$0, 72(%rsp)
.L7102:
	cmpl	$1, 72(%rsp)
	movl	$2, 52(%rsp)
	jne	.L7088
	movl	80(%rsp), %ebp
	movl	%ebp, 52(%rsp)
	jmp	.L7088
.L7108:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 76(%rsp)
	jne	.L7107
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L7898
.L7112:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L7122
	cmpq	$0, 96(%rax)
	je	.L7123
	testb	$8, 62(%rax)
	je	.L7122
.L7123:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7122
	movq	32(%r15), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7122
	movq	32(%rbp), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L7122
.L7129:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7125
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7129
	jmp	.L7122
.L7125:
	testq	%rbx, %rbx
	jne	.L7107
	jmp	.L7122
.L7898:
	cmpq	$0, 96(%rax)
	je	.L7113
	testb	$8, 62(%rax)
	je	.L7112
.L7113:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7112
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7112
	movq	32(%r15), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L7122
.L7119:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7125
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7119
	jmp	.L7122
.L7896:
	movq	32(%rbp), %rdi
	jmp	.L7782
.L7895:
	testq	%rbp, %rbp
	je	.L7102
	jmp	.L7122
.L7665:
	movl	80(%rsp), %eax
	jmp	.L7760
.L7224:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	52(%rsp), %eax
	jmp	.L7760
.L7211:
	movq	24(%rbp), %rdx
	movq	24(%rbx), %r15
	movl	$1, 52(%rsp)
	movq	%rdx, 184(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L7212
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 52(%rsp)
	je	.L7076
.L7212:
	testq	%r15, %r15
	je	.L7088
	cmpq	$0, 184(%rsp)
	je	.L7088
	cmpq	184(%rsp), %r15
	je	.L7088
	movq	112(%r15), %rcx
	movq	184(%rsp), %rbp
	testq	%rcx, %rcx
	movq	112(%rbp), %rsi
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L7215
	movq	104(%r15), %r11
	cmpb	$25, 16(%r11)
	je	.L7899
.L7216:
	movl	$1, %r8d
.L7215:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L7217
	movq	184(%rsp), %rax
	movq	104(%rax), %r9
	cmpb	$25, 16(%r9)
	je	.L7900
.L7218:
	movl	$1, %ecx
.L7217:
	testb	%r8b, %r8b
	jne	.L7088
	testb	%cl, %cl
	jne	.L7088
	testb	%dil, %dil
	je	.L7707
	testb	%dl, %dl
.L7758:
	jne	.L7088
.L7223:
	movl	$0, 52(%rsp)
	jmp	.L7088
.L7707:
	testb	%dl, %dl
	jne	.L7223
	movq	184(%rsp), %r8
	movq	104(%r15), %rdi
	movq	104(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7223
	movq	112(%r15), %rdi
	movq	184(%rsp), %r15
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L7758
.L7900:
	cmpb	$25, 16(%rsi)
	jne	.L7218
	jmp	.L7217
.L7899:
	cmpb	$25, 16(%rcx)
	jne	.L7216
	jmp	.L7215
.L7761:
	movl	$1, 52(%rsp)
	jmp	.L7076
.L7884:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L7085
.L7883:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L7084
.L7881:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L7080
.L7880:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L7079
.L7879:
	testb	$2, 62(%rbp)
	je	.L7078
	movq	24(%rbp), %r11
	testq	%r11, %r11
	cmovne	%r11, %rbp
	jmp	.L7078
.L7878:
	testb	$2, 62(%rbx)
	je	.L7077
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7077
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L7077
	.p2align 6,,7
.L7734:
	movq	200(%rsp), %r11
	movzbl	16(%r11), %ebx
	jmp	.L7071
.L6918:
	movzbl	17(%rbx), %r15d
	movzbl	62(%rbx), %r8d
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	shrb	$5, %r8b
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	$1, %r15d
	andl	$1, %r8d
	andl	$1, %edx
	addl	%r15d, %r15d
	sall	$2, %r8d
	orl	%r15d, %edx
	orl	%r8d, %edx
	cmpb	$20, %sil
	je	.L7901
.L6920:
	movzbl	17(%rbp), %r10d
	leal	0(,%rcx,8), %edi
	movzbl	62(%rbp), %ecx
	orl	%edx, %edi
	movl	%r10d, %edx
	shrb	$5, %cl
	shrb	$3, %r10b
	shrb	$4, %dl
	andl	$1, %r10d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r10d, %r10d
	sall	$2, %ecx
	orl	%r10d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L7902
.L6921:
	leal	0(,%rcx,8), %esi
	movl	$0, 84(%rsp)
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L6912
	movq	128(%rbp), %rax
	cmpq	%rax, 128(%rbx)
	je	.L7757
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 84(%rsp)
	testl	%eax, %eax
	movl	%eax, 228(%rsp)
	je	.L6912
	movl	$0, 84(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L7047
	cmpl	$18, %eax
	ja	.L7064
	cmpl	$13, %eax
	je	.L6925
.L6924:
	cmpl	$2, 228(%rsp)
	jne	.L6912
	cmpl	$1, 84(%rsp)
	movl	228(%rsp), %edi
	cmovne	84(%rsp), %edi
	movl	%edi, 84(%rsp)
	jmp	.L6912
.L6925:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L6926
	call	comptypes
.L7756:
	movl	%eax, 84(%rsp)
	jmp	.L6924
.L6926:
	movl	$1, 84(%rsp)
	jmp	.L6924
.L7064:
	cmpl	$20, %eax
	je	.L7060
	cmpl	$23, %eax
	jne	.L6924
	movl	$1, 112(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L6929
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 112(%rsp)
	je	.L6924
.L6929:
	movq	24(%rbx), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 88(%rsp)
	movq	24(%rbp), %r15
	je	.L7903
	testq	%r15, %r15
	je	.L7904
	movl	$1, 84(%rsp)
	xorl	%ebp, %ebp
.L7044:
	cmpq	$0, 88(%rsp)
	je	.L7905
	testq	%r15, %r15
	je	.L7033
	movq	88(%rsp), %r10
	movq	32(%r10), %rdi
	testq	%rdi, %rdi
	je	.L7906
	movq	32(%r15), %rax
	testq	%rax, %rax
	jne	.L7019
.L7781:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L7033
.L7018:
	cmpl	84(%rsp), %ebp
	movl	84(%rsp), %esi
	movq	88(%rsp), %r10
	cmovg	%ebp, %esi
	movl	%esi, 84(%rsp)
	movq	(%r10), %rbx
	movq	%rbx, 88(%rsp)
	movq	(%r15), %r15
	jmp	.L7044
.L7033:
	movl	$0, 84(%rsp)
.L7013:
	cmpl	$1, 84(%rsp)
	movl	84(%rsp), %ebx
	cmove	112(%rsp), %ebx
.L7755:
	movl	%ebx, 84(%rsp)
	jmp	.L6924
.L7019:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L7018
	movq	88(%rsp), %rsi
	movq	32(%rsi), %rax
	cmpb	$21, 16(%rax)
	je	.L7908
.L7023:
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	jne	.L7033
	cmpq	$0, 96(%rax)
	je	.L7034
	testb	$8, 62(%rax)
	je	.L7033
.L7034:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7033
	movq	88(%rsp), %r8
	movq	32(%r8), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7033
	movq	32(%r15), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L7033
.L7040:
	movq	88(%rsp), %rcx
	movq	8(%rbx), %rdi
	movq	32(%rcx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7036
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7040
	jmp	.L7033
.L7036:
	testq	%rbx, %rbx
	jne	.L7018
	jmp	.L7033
.L7908:
	cmpq	$0, 96(%rax)
	je	.L7024
	testb	$8, 62(%rax)
	je	.L7023
.L7024:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L7023
	movq	32(%r15), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7023
	movq	88(%rsp), %rax
	movq	32(%rax), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L7033
.L7030:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7036
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7030
	jmp	.L7033
.L7906:
	movq	32(%r15), %rdi
	jmp	.L7781
.L7905:
	testq	%r15, %r15
	je	.L7013
	jmp	.L7033
.L7904:
	movq	88(%rsp), %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L6924
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L7663
	movq	%rax, %rbp
	movl	$1, %r15d
	movl	$0, 100(%rsp)
.L7008:
	cmpq	$0, 88(%rsp)
	je	.L7909
	testq	%rbp, %rbp
	je	.L6997
	movq	88(%rsp), %rcx
	movq	32(%rcx), %rdi
	testq	%rdi, %rdi
	je	.L7910
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L6983
.L7780:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L6997
.L6982:
	movq	88(%rsp), %rcx
	cmpl	%r15d, 100(%rsp)
	cmovg	100(%rsp), %r15d
	movq	(%rcx), %rbx
	movq	%rbx, 88(%rsp)
	movq	(%rbp), %rbp
	jmp	.L7008
.L6997:
	xorl	%r15d, %r15d
.L6977:
	decl	%r15d
	movl	$2, 84(%rsp)
	jne	.L6924
	movl	112(%rsp), %ebx
	jmp	.L7755
.L6983:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 100(%rsp)
	jne	.L6982
	movq	88(%rsp), %r10
	movq	32(%r10), %rax
	cmpb	$21, 16(%rax)
	je	.L7912
.L6987:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L6997
	cmpq	$0, 96(%rax)
	je	.L6998
	testb	$8, 62(%rax)
	je	.L6997
.L6998:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6997
	movq	88(%rsp), %r9
	movq	32(%r9), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6997
	movq	32(%rbp), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L6997
.L7004:
	movq	88(%rsp), %r8
	movq	8(%rbx), %rdi
	movq	32(%r8), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7000
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7004
	jmp	.L6997
.L7000:
	testq	%rbx, %rbx
	jne	.L6982
	jmp	.L6997
.L7912:
	cmpq	$0, 96(%rax)
	je	.L6988
	testb	$8, 62(%rax)
	je	.L6987
.L6988:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6987
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6987
	movq	88(%rsp), %rax
	movq	32(%rax), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L6997
.L6994:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L7000
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L6994
	jmp	.L6997
.L7910:
	movq	32(%rbp), %rdi
	jmp	.L7780
.L7909:
	testq	%rbp, %rbp
	je	.L6977
	jmp	.L6997
.L7663:
	movl	112(%rsp), %r15d
	movl	%r15d, 84(%rsp)
	jmp	.L6924
.L7903:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L6924
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L7661
	movq	%rax, %rbp
	movl	$1, 104(%rsp)
	movl	$0, 108(%rsp)
.L6969:
	testq	%r15, %r15
	je	.L7913
	testq	%rbp, %rbp
	je	.L6958
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L7914
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L6944
.L7779:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L6958
.L6943:
	movl	104(%rsp), %r8d
	movl	108(%rsp), %eax
	cmpl	%r8d, 108(%rsp)
	cmovle	%r8d, %eax
	movl	%eax, 104(%rsp)
	movq	(%rbp), %rbp
	movq	(%r15), %r15
	jmp	.L6969
.L6958:
	movl	$0, 104(%rsp)
.L6938:
	cmpl	$1, 104(%rsp)
	movl	$2, 84(%rsp)
	jne	.L6924
	jmp	.L7663
.L6944:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 108(%rsp)
	jne	.L6943
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L7916
.L6948:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L6958
	cmpq	$0, 96(%rax)
	je	.L6959
	testb	$8, 62(%rax)
	je	.L6958
.L6959:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6958
	movq	32(%r15), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6958
	movq	32(%rbp), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L6958
.L6965:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L6961
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L6965
	jmp	.L6958
.L6961:
	testq	%rbx, %rbx
	jne	.L6943
	jmp	.L6958
.L7916:
	cmpq	$0, 96(%rax)
	je	.L6949
	testb	$8, 62(%rax)
	je	.L6948
.L6949:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6948
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6948
	movq	32(%r15), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L6958
.L6955:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L6961
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L6955
	jmp	.L6958
.L7914:
	movq	32(%rbp), %rdi
	jmp	.L7779
.L7913:
	testq	%rbp, %rbp
	je	.L6938
	jmp	.L6958
.L7661:
	movl	112(%rsp), %ebp
	movl	%ebp, 84(%rsp)
	jmp	.L6924
.L7060:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	84(%rsp), %eax
	jmp	.L7756
.L7047:
	movq	24(%rbp), %rdx
	movq	24(%rbx), %r15
	movl	$1, 84(%rsp)
	movq	%rdx, 216(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L7048
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 84(%rsp)
	je	.L7728
.L7048:
	testq	%r15, %r15
	je	.L6924
	cmpq	$0, 216(%rsp)
	je	.L6924
	cmpq	216(%rsp), %r15
	je	.L6924
	movq	112(%r15), %rcx
	movq	216(%rsp), %rbp
	testq	%rcx, %rcx
	movq	112(%rbp), %rsi
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L7051
	movq	104(%r15), %r11
	cmpb	$25, 16(%r11)
	je	.L7917
.L7052:
	movl	$1, %r8d
.L7051:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L7053
	movq	216(%rsp), %rax
	movq	104(%rax), %r9
	cmpb	$25, 16(%r9)
	je	.L7918
.L7054:
	movl	$1, %ecx
.L7053:
	testb	%r8b, %r8b
	jne	.L6924
	testb	%cl, %cl
	jne	.L6924
	testb	%dil, %dil
	je	.L7697
	testb	%dl, %dl
.L7754:
	jne	.L6924
.L7059:
	movl	$0, 84(%rsp)
	jmp	.L6924
.L7697:
	testb	%dl, %dl
	jne	.L7059
	movq	216(%rsp), %r8
	movq	104(%r15), %rdi
	movq	104(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L7059
	movq	112(%r15), %rdi
	movq	216(%rsp), %r15
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L7754
.L7918:
	cmpb	$25, 16(%rsi)
	jne	.L7054
	jmp	.L7053
.L7917:
	cmpb	$25, 16(%rcx)
	jne	.L7052
	jmp	.L7051
	.p2align 6,,7
.L7757:
	movl	$1, 84(%rsp)
	jmp	.L6912
.L7902:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6921
.L7901:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6920
.L7863:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L6916
.L7862:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L6915
.L7861:
	testb	$2, 62(%rbp)
	je	.L6914
	movq	24(%rbp), %r9
	testq	%r9, %r9
	cmovne	%r9, %rbp
	jmp	.L6914
.L7860:
	testb	$2, 62(%rbx)
	je	.L6913
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6913
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L6913
	.p2align 6,,7
.L6901:
	leal	-6(%r12), %ecx
	cmpl	$1, %ecx
	jbe	.L6902
	cmpl	$10, %r12d
	je	.L6902
	cmpl	$8, %r12d
	je	.L6902
	cmpl	$11, %r12d
	jne	.L6900
.L6902:
	movq	288(%rsp), %rdi
	movq	%r13, %rsi
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	convert_and_check
.L7798:
	movq	288(%rsp), %r9
	movq	%r14, %rbp
	movq	8(%r9), %rbx
	cmpq	%r14, %rbx
	je	.L7753
	testq	%rbx, %rbx
	je	.L7753
	testq	%r14, %r14
	je	.L7753
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L7753
	testb	%al, %al
	je	.L7753
	cmpb	$6, %dl
	je	.L7919
.L6742:
	cmpb	$6, %al
	je	.L7920
.L6743:
	cmpb	$10, %dl
	je	.L7921
.L6744:
	cmpb	$10, 16(%rbp)
	je	.L7922
.L6745:
	cmpq	%rbp, %rbx
	movl	$1, 116(%rsp)
	je	.L6741
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L6747
	movl	$0, 116(%rsp)
.L6741:
	cmpl	$1, 116(%rsp)
	jne	.L6738
	movq	%r13, %rdi
	call	mark_addressable
	testl	%eax, %eax
	je	.L7623
	movq	8(%r13), %rdi
	call	build_pointer_type
	movq	%r13, %rdx
	movl	$121, %edi
	movq	%rax, %rsi
	call	build1
	movq	288(%rsp), %r13
	movq	8(%rax), %r15
	movq	%rax, %rbx
	movq	8(%r13), %rdi
	cmpq	%rdi, 8(%r15)
	je	.L6898
	call	build_pointer_type
	movq	%rbx, %rdx
	movl	$115, %edi
	movq	%rax, %rsi
	call	build1
	movq	%rax, %rbx
.L6898:
	movq	288(%rsp), %rsi
	movl	$115, %edi
	movq	%rbx, %rdx
	jmp	.L7772
.L6747:
	movzbl	17(%rbx), %edi
	movzbl	62(%rbx), %ecx
	movl	%edi, %edx
	shrb	$5, %cl
	shrb	$3, %dil
	shrb	$4, %dl
	andl	$1, %edi
	andl	$1, %ecx
	andl	$1, %edx
	addl	%edi, %edi
	sall	$2, %ecx
	orl	%edi, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L7923
.L6749:
	movzbl	17(%rbp), %r11d
	movzbl	62(%rbp), %r8d
	leal	0(,%rcx,8), %edi
	orl	%edx, %edi
	xorl	%ecx, %ecx
	movl	%r11d, %edx
	shrb	$5, %r8b
	shrb	$3, %r11b
	shrb	$4, %dl
	andl	$1, %r11d
	andl	$1, %r8d
	andl	$1, %edx
	addl	%r11d, %r11d
	sall	$2, %r8d
	orl	%r11d, %edx
	orl	%r8d, %edx
	cmpb	$20, %sil
	je	.L7924
.L6750:
	leal	0(,%rcx,8), %esi
	movl	$0, 116(%rsp)
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L6741
	movq	128(%rbp), %rax
	cmpq	%rax, 128(%rbx)
	je	.L7753
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 116(%rsp)
	testl	%eax, %eax
	movl	%eax, 256(%rsp)
	je	.L6741
	movl	$0, 116(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L6876
	cmpl	$18, %eax
	ja	.L6893
	cmpl	$13, %eax
	je	.L6754
.L6753:
	cmpl	$2, 256(%rsp)
	jne	.L6741
	cmpl	$1, 116(%rsp)
	jne	.L6738
	movl	$2, 116(%rsp)
	jmp	.L6741
.L6754:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L6755
	call	comptypes
.L7752:
	movl	%eax, 116(%rsp)
	jmp	.L6753
.L6755:
	movl	$1, 116(%rsp)
	jmp	.L6753
.L6893:
	cmpl	$20, %eax
	je	.L6889
	cmpl	$23, %eax
	jne	.L6753
	movl	$1, 156(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L6758
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 156(%rsp)
	je	.L6753
.L6758:
	movq	24(%rbx), %r9
	movq	%r9, 120(%rsp)
	testq	%r9, %r9
	movq	24(%rbp), %rdx
	movq	%rdx, 128(%rsp)
	je	.L7925
	cmpq	$0, 128(%rsp)
	je	.L7926
	movl	$1, 116(%rsp)
	xorl	%ebp, %ebp
.L6873:
	cmpq	$0, 120(%rsp)
	je	.L7927
	cmpq	$0, 128(%rsp)
	je	.L6862
	movq	120(%rsp), %rsi
	movq	32(%rsi), %rdi
	testq	%rdi, %rdi
	je	.L7928
	movq	128(%rsp), %r10
	movq	32(%r10), %rax
	testq	%rax, %rax
	jne	.L6848
.L7778:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L6862
.L6847:
	cmpl	116(%rsp), %ebp
	movl	116(%rsp), %ecx
	movq	120(%rsp), %rsi
	movq	128(%rsp), %r8
	cmovg	%ebp, %ecx
	movl	%ecx, 116(%rsp)
	movq	(%rsi), %r11
	movq	%r11, 120(%rsp)
	movq	(%r8), %rax
	movq	%rax, 128(%rsp)
	jmp	.L6873
.L6862:
	movl	$0, 116(%rsp)
.L6842:
	cmpl	$1, 116(%rsp)
	movl	116(%rsp), %eax
	cmove	156(%rsp), %eax
	jmp	.L7752
.L6848:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L6847
	movq	120(%rsp), %rdi
	movq	32(%rdi), %rax
	cmpb	$21, 16(%rax)
	je	.L7930
.L6852:
	movq	128(%rsp), %rsi
	movq	32(%rsi), %rax
	cmpb	$21, 16(%rax)
	jne	.L6862
	cmpq	$0, 96(%rax)
	je	.L6863
	testb	$8, 62(%rax)
	je	.L6862
.L6863:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6862
	movq	120(%rsp), %r9
	movq	32(%r9), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6862
	movq	128(%rsp), %rdi
	movq	32(%rdi), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L6862
.L6869:
	movq	120(%rsp), %rdx
	movq	8(%rbx), %rdi
	movq	32(%rdx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L6865
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L6869
	jmp	.L6862
.L6865:
	testq	%rbx, %rbx
	jne	.L6847
	jmp	.L6862
.L7930:
	cmpq	$0, 96(%rax)
	je	.L6853
	testb	$8, 62(%rax)
	je	.L6852
.L6853:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6852
	movq	128(%rsp), %rax
	movq	32(%rax), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6852
	movq	120(%rsp), %rcx
	movq	32(%rcx), %r8
	movq	24(%r8), %rbx
	testq	%rbx, %rbx
	je	.L6862
.L6859:
	movq	128(%rsp), %r11
	movq	8(%rbx), %rdi
	movq	32(%r11), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L6865
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L6859
	jmp	.L6862
.L7928:
	movq	128(%rsp), %r9
	movq	32(%r9), %rdi
	jmp	.L7778
.L7927:
	cmpq	$0, 128(%rsp)
	je	.L6842
	jmp	.L6862
.L7926:
	movq	120(%rsp), %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L6753
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L7659
	movq	%rax, %rbp
	movl	$1, 140(%rsp)
	movl	$0, 144(%rsp)
.L6837:
	cmpq	$0, 120(%rsp)
	je	.L7931
	testq	%rbp, %rbp
	je	.L6826
	movq	120(%rsp), %r8
	movq	32(%r8), %rdi
	testq	%rdi, %rdi
	je	.L7932
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L6812
.L7776:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L6826
.L6811:
	movl	140(%rsp), %r11d
	movl	144(%rsp), %ebx
	cmpl	%r11d, 144(%rsp)
	movq	120(%rsp), %rcx
	cmovle	%r11d, %ebx
	movl	%ebx, 140(%rsp)
	movq	(%rcx), %r8
	movq	%r8, 120(%rsp)
	movq	(%rbp), %rbp
	jmp	.L6837
.L6826:
	movl	$0, 140(%rsp)
.L6806:
	movl	$2, 116(%rsp)
	cmpl	$1, 140(%rsp)
.L7777:
	jne	.L6753
	movl	156(%rsp), %ebp
	movl	%ebp, 116(%rsp)
	jmp	.L6753
.L6812:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 144(%rsp)
	jne	.L6811
	movq	120(%rsp), %rcx
	movq	32(%rcx), %rax
	cmpb	$21, 16(%rax)
	je	.L7934
.L6816:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L6826
	cmpq	$0, 96(%rax)
	je	.L6827
	testb	$8, 62(%rax)
	je	.L6826
.L6827:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6826
	movq	120(%rsp), %rax
	movq	32(%rax), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6826
	movq	32(%rbp), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L6826
.L6833:
	movq	120(%rsp), %r10
	movq	8(%rbx), %rdi
	movq	32(%r10), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L6829
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L6833
	jmp	.L6826
.L6829:
	testq	%rbx, %rbx
	jne	.L6811
	jmp	.L6826
.L7934:
	cmpq	$0, 96(%rax)
	je	.L6817
	testb	$8, 62(%rax)
	je	.L6816
.L6817:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6816
	movq	32(%rbp), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6816
	movq	120(%rsp), %rsi
	movq	32(%rsi), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L6826
.L6823:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L6829
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L6823
	jmp	.L6826
.L7932:
	movq	32(%rbp), %rdi
	jmp	.L7776
.L7931:
	testq	%rbp, %rbp
	je	.L6806
	jmp	.L6826
.L7659:
	movl	156(%rsp), %eax
	jmp	.L7752
.L7925:
	movq	%rdx, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L6753
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L7659
	movq	%rax, %rbp
	movl	$1, 148(%rsp)
	movl	$0, 152(%rsp)
.L6798:
	cmpq	$0, 128(%rsp)
	je	.L7935
	testq	%rbp, %rbp
	je	.L6787
	movq	128(%rsp), %rbx
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7936
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L6773
.L7775:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L6787
.L6772:
	movl	148(%rsp), %r10d
	movl	152(%rsp), %ebx
	cmpl	%r10d, 152(%rsp)
	movq	128(%rsp), %rdx
	cmovle	%r10d, %ebx
	movl	%ebx, 148(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 128(%rsp)
	movq	(%rbp), %rbp
	jmp	.L6798
.L6787:
	movl	$0, 148(%rsp)
.L6767:
	cmpl	$1, 148(%rsp)
	movl	$2, 116(%rsp)
	jmp	.L7777
.L6773:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 152(%rsp)
	jne	.L6772
	movq	128(%rsp), %rdx
	movq	32(%rdx), %rax
	cmpb	$21, 16(%rax)
	je	.L7938
.L6777:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L6787
	cmpq	$0, 96(%rax)
	je	.L6788
	testb	$8, 62(%rax)
	je	.L6787
.L6788:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6787
	movq	128(%rsp), %r11
	movq	32(%r11), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6787
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L6787
.L6794:
	movq	128(%rsp), %r9
	movq	8(%rbx), %rdi
	movq	32(%r9), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L6790
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L6794
	jmp	.L6787
.L6790:
	testq	%rbx, %rbx
	jne	.L6772
	jmp	.L6787
.L7938:
	cmpq	$0, 96(%rax)
	je	.L6778
	testb	$8, 62(%rax)
	je	.L6777
.L6778:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L6777
	movq	32(%rbp), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6777
	movq	128(%rsp), %rdi
	movq	32(%rdi), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L6787
.L6784:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L6790
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L6784
	jmp	.L6787
.L7936:
	movq	32(%rbp), %rdi
	jmp	.L7775
.L7935:
	testq	%rbp, %rbp
	je	.L6767
	jmp	.L6787
.L6889:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	116(%rsp), %eax
	jmp	.L7752
.L6876:
	movq	24(%rbx), %r10
	movq	%r10, 248(%rsp)
	movq	24(%rbp), %r9
	movl	$1, 116(%rsp)
	movq	%r9, 240(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L6877
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 116(%rsp)
	je	.L6741
.L6877:
	cmpq	$0, 248(%rsp)
	je	.L6753
	cmpq	$0, 240(%rsp)
	je	.L6753
	movq	240(%rsp), %rbx
	cmpq	%rbx, 248(%rsp)
	je	.L6753
	movq	248(%rsp), %rax
	movq	112(%rbx), %rsi
	movq	112(%rax), %rcx
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L6880
	movq	104(%rax), %rbp
	cmpb	$25, 16(%rbp)
	je	.L7939
.L6881:
	movl	$1, %r8d
.L6880:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L6882
	movq	240(%rsp), %rax
	movq	104(%rax), %r9
	cmpb	$25, 16(%r9)
	je	.L7940
.L6883:
	movl	$1, %ecx
.L6882:
	testb	%r8b, %r8b
	jne	.L6753
	testb	%cl, %cl
	jne	.L6753
	testb	%dil, %dil
	je	.L7686
	testb	%dl, %dl
.L7751:
	jne	.L6753
.L6888:
	movl	$0, 116(%rsp)
	jmp	.L6753
.L7686:
	testb	%dl, %dl
	jne	.L6888
	movq	248(%rsp), %rdx
	movq	240(%rsp), %rbx
	movq	104(%rdx), %rdi
	movq	104(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L6888
	movq	248(%rsp), %rsi
	movq	240(%rsp), %r8
	movq	112(%rsi), %rdi
	movq	112(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L7751
.L7940:
	cmpb	$25, 16(%rsi)
	jne	.L6883
	jmp	.L6882
.L7939:
	cmpb	$25, 16(%rcx)
	jne	.L6881
	jmp	.L6880
	.p2align 6,,7
.L7753:
	movl	$1, 116(%rsp)
	jmp	.L6741
.L7924:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6750
.L7923:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6749
.L7922:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L6745
.L7921:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L6744
.L7920:
	testb	$2, 62(%r14)
	je	.L6743
	movq	24(%r14), %r10
	testq	%r10, %r10
	cmovne	%r10, %rbp
	jmp	.L6743
.L7919:
	testb	$2, 62(%rbx)
	je	.L6742
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6742
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L6742
	.p2align 6,,7
.L7797:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L7623
.L7796:
	movq	%r13, %rdi
	call	overflow_warning
	movq	288(%rsp), %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	call	maybe_objc_comptypes
	jmp	.L6663
.L7795:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L6727
	cmpb	$51, 48(%r13)
	je	.L6727
	cmpq	$0, current_function_decl(%rip)
	je	.L6733
	movzbl	17(%r13), %ebx
	andb	$24, %bl
	cmpb	$16, %bl
	je	.L7941
.L6733:
	movq	%r13, %rsi
.L6734:
	movq	%rsi, %r13
.L7741:
	movq	8(%r13), %r14
	jmp	.L6727
.L7941:
	movq	104(%r13), %rax
	testq	%rax, %rax
	je	.L6733
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L6733
	testb	$2, 17(%rax)
	je	.L6733
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L6734
	jmp	.L6733
	.p2align 6,,7
.L6666:
	movzbl	%al, %r12d
	movq	%r13, %rbx
	movq	%r14, %rbp
	cmpl	$23, %r12d
	je	.L6668
	cmpl	$18, %r12d
	je	.L6668
	movzbl	16(%r13), %eax
	cmpb	$32, %al
	je	.L7942
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L6695
	cmpb	$34, %al
	je	.L7943
.L6695:
	movzbl	16(%rbx), %ecx
	movq	%rbx, %rdx
	cmpb	$116, %cl
	je	.L7733
	cmpb	$115, %cl
	je	.L7944
.L6704:
	movzbl	%cl, %r14d 
	movzbl	tree_code_type(%r14), %eax
	cmpb	$60, %al
	je	.L6709
	cmpb	$49, %al
	je	.L6709
	cmpb	$50, %al
	je	.L6709
	cmpb	$101, %al
	je	.L6709
.L6708:
	cmpl	$10, %r12d
	je	.L7945
	cmpb	$39, %cl
	je	.L7946
.L6717:
	movq	%rbp, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L6722
	testb	$32, 17(%rbp)
	je	.L6723
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L6724
	movzwl	60(%rbp), %r11d
	movq	integer_types+40(%rip), %rbp
	movzwl	60(%rbp), %r8d
	andl	$511, %r11d
	andl	$511, %r8d
	cmpl	%r8d, %r11d
	je	.L6724
.L6723:
	movq	integer_types+40(%rip), %rdi
.L7773:
	movq	%rbx, %rsi
.L7774:
	call	convert
.L7750:
	movq	%rax, %r13
	jmp	.L7741
.L6724:
	movq	integer_types+48(%rip), %rdi
	jmp	.L7773
.L6722:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L6725
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L6725
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%rbp)
	je	.L7947
.L6725:
	cmpl	$5, %r12d
	je	.L7948
.L6726:
	movq	%rbx, %r13
	jmp	.L7741
.L7948:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L7745:
	movq	global_trees(%rip), %r13
	jmp	.L7741
.L7947:
	movq	global_trees+200(%rip), %rdi
	jmp	.L7773
	.p2align 6,,7
.L7946:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L6717
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%rdi), %esi
	movq	40(%rdx), %rdi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L6717
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L6723
	testb	$32, 17(%rbp)
	jne	.L6724
	jmp	.L6723
	.p2align 6,,7
.L7945:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%rbp), %edx
	movl	flag_traditional(%rip), %r12d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r12d, %r12d
	jne	.L6716
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L6715
.L6716:
	testb	$32, 17(%rbp)
	movl	$1, %eax
	cmovne	%eax, %esi
.L6715:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L7773
.L6709:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L6708
.L7944:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%rsi)
	jne	.L6704
	.p2align 4,,7
.L6707:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %rbx
	cmpb	$116, %cl
	jne	.L7949
.L7733:
	movq	32(%rbx), %rsi
	jmp	.L6707
.L7949:
	cmpb	$115, %cl
	jne	.L6704
	movq	32(%rsi), %r10
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%r10)
	movq	%r10, %rsi
	je	.L6707
	jmp	.L6704
.L7943:
	movl	pedantic(%rip), %edx
	testl	%edx, %edx
	jne	.L6698
	cmpb	$51, 48(%r13)
	je	.L6698
	cmpq	$0, current_function_decl(%rip)
	je	.L6701
	movzbl	17(%r13), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L7950
.L6701:
	movq	%r13, %rsi
.L6702:
	movq	%rsi, %rbx
.L6699:
	movq	8(%rbx), %rbp
	jmp	.L6695
.L7950:
	movq	104(%r13), %rax
	testq	%rax, %rax
	je	.L6701
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L6701
	testb	$2, 17(%rax)
	je	.L6701
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L6702
	jmp	.L6701
	.p2align 6,,7
.L6698:
	movq	%r13, %rbx
	jmp	.L6699
.L7942:
	movq	104(%r13), %rbx
	jmp	.L6695
.L6668:
	movzbl	16(%r13), %edx
	xorl	%ebp, %ebp
	movq	%r13, %rbx
	cmpb	$116, %dl
	je	.L7624
	cmpb	$115, %dl
	je	.L7951
	movzbl	16(%r13), %ecx
.L6670:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L6676
	cmpb	$49, %al
	je	.L6676
	cmpb	$50, %al
	je	.L6676
	cmpb	$101, %al
	je	.L6676
.L6675:
	cmpl	$23, %r12d
	je	.L7952
	cmpl	$18, %r12d
	jne	.L6726
	movzbl	%cl, %r8d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r8), %eax
	movq	8(%rdi), %r13
	cmpb	$114, %al
	je	.L6681
	cmpb	$100, %al
	je	.L6681
.L6680:
	movzbl	17(%rdi), %r8d
	movzbl	62(%rdi), %r9d
	movl	$1, %esi
	movzbl	16(%rdi), %edi
	movl	%r8d, %r12d
	movl	%r8d, %r14d
	movl	%r9d, %r10d
	shrb	$3, %r12b
	shrb	$4, %r14b
	shrb	$5, %r10b
	andl	$1, %r12d
	andl	%r14d, %esi
	andl	$1, %r10d
	addl	%r12d, %r12d
	sall	$2, %r10d
	orl	%r12d, %esi
	orl	%r10d, %esi
	xorl	%r10d, %r10d
	cmpb	$20, %dil
	je	.L7953
.L6684:
	leal	0(,%r10,8), %r12d
	orl	%r12d, %esi
	jne	.L6683
	testl	%edx, %edx
	jne	.L6683
	testl	%r11d, %r11d
	je	.L6682
.L6683:
	movl	%r8d, %r14d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r14b
	movl	%r9d, %ecx
	movl	%r8d, %r10d
	andl	%r14d, %esi
	andl	$1, %ecx
	andl	$1, %r10d
	sall	$2, %ecx
	addl	%r10d, %r10d
	orl	%r10d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L7954
.L6686:
	leal	0(,%rcx,8), %r8d
	leal	(%r11,%r11), %edi
	orl	%r8d, %esi
	orl	%edx, %esi
	orl	%edi, %esi
	movq	%r13, %rdi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r13
.L6682:
	cmpb	$41, %cl
	je	.L7955
	cmpb	$47, %cl
	je	.L7956
	xorl	%r12d, %r12d
	testl	%ebp, %ebp
	je	.L7957
.L6689:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L6690
	testl	%r12d, %r12d
	je	.L6726
.L6690:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L7958
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L7774
.L7958:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	mark_addressable
	testl	%eax, %eax
	je	.L7745
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%r13), %ebx
	movl	%eax, %ebp
	andb	$1, %bpl
	addb	%bpl, %bpl
	andb	$-4, %bl
	orb	%bpl, %bl
	movb	%bl, 17(%r13)
	jmp	.L7741
.L7957:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L6689
.L7956:
	movq	40(%rbx), %rdi
	call	default_conversion
	movq	32(%rbx), %rdx
	movl	$47, %edi
	movq	8(%rax), %rsi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	build
	jmp	.L7750
.L7955:
	movq	72(%r13), %rdi
	movq	32(%rbx), %rsi
	jmp	.L7774
.L7954:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L6686
.L7953:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L6684
.L6681:
	movzbl	17(%rbx), %r9d
	movl	$1, %r11d
	movl	%r9d, %edx
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	%r9d, %r11d
	andl	$1, %edx
	jmp	.L6680
.L7952:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L7750
.L6676:
	movl	24(%r13), %eax
	movl	%eax, 24(%rbx)
	jmp	.L6675
.L7951:
	movq	32(%r13), %rcx
	cmpq	%r14, 8(%rcx)
	je	.L7624
	movl	$115, %ecx
	jmp	.L6670
.L7624:
	movq	32(%r13), %rsi
	movl	%edx, %ecx
	.p2align 4,,7
.L6674:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbx
	movzbl	16(%rsi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L7959
	movq	32(%rbx), %rsi
	jmp	.L6674
.L7959:
	cmpb	$115, %cl
	jne	.L6670
	movq	32(%rsi), %rsi
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rsi)
	je	.L6674
	jmp	.L6670
.L7794:
	movq	32(%rsi), %r13
	jmp	.L6664
.LFE12:
.Lfe12:
	.size	convert_for_assignment,.Lfe12-convert_for_assignment
	.section	.rodata.str1.1
.LC85:
	.string	"passing arg %d of `%s'"
	.section	.rodata.str1.32
	.align 32
.LC86:
	.string	"passing arg %d of pointer to function"
	.text
	.align 2
	.p2align 4,,15
	.type	warn_for_assignment,@function
warn_for_assignment:
.LFB13:
	pushq	%rbp
.LCFI52:
	movq	%rsp, %rbp
.LCFI53:
	subq	$32, %rsp
.LCFI54:
	testq	%rsi, %rsi
	movq	%rbx, -24(%rbp)
.LCFI55:
	movq	%r12, -16(%rbp)
.LCFI56:
	movq	%r13, -8(%rbp)
.LCFI57:
	movq	%rdx, %r12
	movl	%ecx, %ebx
	movq	%rdi, %r13
	je	.L7967
.L7961:
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	pedwarn
	movq	-24(%rbp), %rbx
	movq	-16(%rbp), %r12
	movq	-8(%rbp), %r13
	leave
	ret
	.p2align 6,,7
.L7967:
	call	maybe_building_objc_message_expr
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L7966
	cmpl	$2, %ebx
	jle	.L7966
	subl	$2, %ebx
.L7962:
	testq	%rcx, %rcx
	je	.L7963
	mov	24(%rcx), %edx
	movl	$.LC85, %esi
	xorl	%eax, %eax
	movq	32(%rcx), %rcx
	addq	$64, %rdx
	shrq	$4, %rdx
	salq	$4, %rdx
	subq	%rdx, %rsp
	movl	%ebx, %edx
	movq	%rsp, %rdi
	movq	%rsp, %r12
	call	sprintf
.L7964:
	movq	%r12, %rsi
	jmp	.L7961
.L7963:
	subq	$64, %rsp
	movl	$.LC86, %esi
	movl	%ebx, %edx
	movq	%rsp, %rdi
	xorl	%eax, %eax
	movq	%rsp, %r12
	call	sprintf
	jmp	.L7964
	.p2align 6,,7
.L7966:
	movq	%r12, %rcx
	jmp	.L7962
.LFE13:
.Lfe13:
	.size	warn_for_assignment,.Lfe13-warn_for_assignment
.globl constructor_no_implicit
	.data
	.align 4
	.type	constructor_no_implicit,@object
	.size	constructor_no_implicit,4
constructor_no_implicit:
	.long	0
	.text
	.align 2
	.p2align 4,,15
.globl require_complete_type
	.type	require_complete_type,@function
require_complete_type:
.LFB14:
	subq	$8, %rsp
.LCFI58:
	movq	global_trees(%rip), %rax
	movq	8(%rdi), %rdx
	cmpq	%rax, %rdi
	je	.L7983
	cmpq	%rax, %rdx
	je	.L7983
	cmpq	$0, 32(%rdx)
	jne	.L7978
	movzbl	16(%rdx), %ecx
	testb	%cl, %cl
	je	.L7983
	testq	%rdi, %rdi
	je	.L7986
	movzbl	16(%rdi), %esi
	subb	$34, %sil
	cmpb	$1, %sil
	jbe	.L8003
.L7986:
	movzbl	%cl, %eax
	subl	$5, %eax
	cmpl	$16, %eax
	ja	.L7995
	mov	%eax, %ecx
	jmp	*.L7996(,%rcx,8)
	.section	.rodata
	.align 8
	.align 4
.L7996:
	.quad	.L7991
	.quad	.L7995
	.quad	.L7995
	.quad	.L7995
	.quad	.L7995
	.quad	.L7990
	.quad	.L7995
	.quad	.L7995
	.quad	.L7995
	.quad	.L7995
	.quad	.L7995
	.quad	.L7995
	.quad	.L7995
	.quad	.L7992
	.quad	.L7995
	.quad	.L7988
	.quad	.L7989
	.text
.L7988:
	movl	$.LC62, %esi
.L7987:
	movq	96(%rdx), %rax
	cmpb	$1, 16(%rax)
	je	.L8004
	movq	72(%rax), %rax
	movl	$.LC71, %edi
.L8000:
	movq	32(%rax), %rsi
	xorl	%eax, %eax
	call	error
.L7999:
	movq	global_trees(%rip), %rax
.L7983:
	movq	%rax, %rdi
.L7978:
	movq	%rdi, %rax
	addq	$8, %rsp
	ret
.L8004:
	movq	32(%rax), %rdx
	movl	$.LC70, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L7999
.L7991:
	movl	$.LC65, %edi
.L8002:
	xorl	%eax, %eax
	call	error
	jmp	.L7999
.L7990:
	movl	$.LC64, %esi
	jmp	.L7987
.L7992:
	movq	24(%rdx), %rax
	testq	%rax, %rax
	je	.L7993
	cmpq	$0, 112(%rax)
	je	.L8005
	movq	8(%rdx), %rdx
	movzbl	16(%rdx), %ecx
	jmp	.L7986
.L8005:
	movl	$.LC66, %edi
	jmp	.L8002
.L7993:
	movl	$.LC67, %edi
	jmp	.L8002
	.p2align 6,,7
.L7989:
	movl	$.LC63, %esi
	jmp	.L7987
.L8003:
	movq	72(%rdi), %rax
	movl	$.LC61, %edi
	jmp	.L8000
.L7995:
	movl	$.LC68, %edi
	movl	$163, %esi
	movl	$.LC69, %edx
	call	fancy_abort
.LFE14:
.Lfe14:
	.size	require_complete_type,.Lfe14-require_complete_type
	.align 2
	.p2align 4,,15
.globl incomplete_type_error
	.type	incomplete_type_error,@function
incomplete_type_error:
.LFB15:
	subq	$8, %rsp
.LCFI59:
	movzbl	16(%rsi), %edx
	testb	%dl, %dl
	je	.L8006
	testq	%rdi, %rdi
	je	.L8010
	movzbl	16(%rdi), %ecx
	subb	$34, %cl
	cmpb	$1, %cl
	jbe	.L8025
.L8010:
	movzbl	%dl, %eax
	subl	$5, %eax
	cmpl	$16, %eax
	ja	.L8019
	mov	%eax, %edx
	jmp	*.L8020(,%rdx,8)
	.section	.rodata
	.align 8
	.align 4
.L8020:
	.quad	.L8015
	.quad	.L8019
	.quad	.L8019
	.quad	.L8019
	.quad	.L8019
	.quad	.L8014
	.quad	.L8019
	.quad	.L8019
	.quad	.L8019
	.quad	.L8019
	.quad	.L8019
	.quad	.L8019
	.quad	.L8019
	.quad	.L8016
	.quad	.L8019
	.quad	.L8012
	.quad	.L8013
	.text
.L8012:
	movl	$.LC62, %edx
.L8011:
	movq	96(%rsi), %rax
	cmpb	$1, 16(%rax)
	je	.L8026
	movq	72(%rax), %rax
	movl	$.LC71, %edi
.L8024:
	movq	32(%rax), %rsi
	addq	$8, %rsp
	xorl	%eax, %eax
	jmp	error
.L8026:
	movq	%rdx, %rsi
	movl	$.LC70, %edi
	movq	32(%rax), %rdx
	xorl	%eax, %eax
	addq	$8, %rsp
	jmp	error
.L8015:
	movl	$.LC65, %edi
.L8023:
	xorl	%eax, %eax
	addq	$8, %rsp
	jmp	error
.L8014:
	movl	$.LC64, %edx
	jmp	.L8011
.L8016:
	movq	24(%rsi), %rax
	testq	%rax, %rax
	je	.L8017
	cmpq	$0, 112(%rax)
	je	.L8027
	movq	8(%rsi), %rsi
	movzbl	16(%rsi), %edx
	jmp	.L8010
.L8027:
	movl	$.LC66, %edi
	jmp	.L8023
.L8017:
	movl	$.LC67, %edi
	jmp	.L8023
	.p2align 6,,7
.L8013:
	movl	$.LC63, %edx
	jmp	.L8011
	.p2align 6,,7
.L8025:
	movq	72(%rdi), %rax
	movl	$.LC61, %edi
	jmp	.L8024
	.p2align 6,,7
.L8006:
	addq	$8, %rsp
	ret
.L8019:
	movl	$.LC68, %edi
	movl	$163, %esi
	movl	$.LC69, %edx
	call	fancy_abort
.LFE15:
.Lfe15:
	.size	incomplete_type_error,.Lfe15-incomplete_type_error
	.align 2
	.p2align 4,,15
.globl common_type
	.type	common_type,@function
common_type:
.LFB16:
	subq	$184, %rsp
.LCFI60:
	cmpq	%rsi, %rdi
	movq	%rbx, 136(%rsp)
.LCFI61:
	movq	%rbp, 144(%rsp)
.LCFI62:
	movq	%r12, 152(%rsp)
.LCFI63:
	movq	%r13, 160(%rsp)
.LCFI64:
	movq	%r14, 168(%rsp)
.LCFI65:
	movq	%r15, 176(%rsp)
.LCFI66:
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	je	.L8033
	movq	global_trees(%rip), %rax
	cmpq	%rax, %rdi
	je	.L8513
	cmpq	%rax, %rsi
	je	.L8033
	call	*targetm+248(%rip)
	cmpb	$10, 16(%rbx)
	movq	%rax, %r14
	je	.L8514
.L8037:
	movzbl	16(%rbp), %eax
	cmpb	$10, %al
	je	.L8515
.L8038:
	movzbl	16(%rbx), %r12d
	movzbl	%al, %r13d
	cmpl	$8, %r12d
	je	.L8459
	cmpl	$8, %r13d
	je	.L8481
	leal	-6(%r12), %eax
	cmpl	$17, %eax
	ja	.L8431
	mov	%eax, %edx
	jmp	*.L8432(,%rdx,8)
	.section	.rodata
	.align 8
	.align 4
.L8432:
	.quad	.L8052
	.quad	.L8052
	.quad	.L8431
	.quad	.L8431
	.quad	.L8431
	.quad	.L8431
	.quad	.L8431
	.quad	.L8069
	.quad	.L8431
	.quad	.L8431
	.quad	.L8431
	.quad	.L8431
	.quad	.L8074
	.quad	.L8431
	.quad	.L8431
	.quad	.L8431
	.quad	.L8431
	.quad	.L8081
	.text
.L8052:
	cmpl	$7, %r12d
	je	.L8517
	cmpl	$7, %r13d
	je	.L8460
.L8054:
	movzwl	60(%rbx), %edx
	movzwl	60(%rbp), %eax
	andl	$511, %edx
	andl	$511, %eax
	cmpl	%eax, %edx
	jg	.L8431
	cmpl	%edx, %eax
	jg	.L8509
	movq	128(%rbx), %rax
	movq	integer_types+64(%rip), %rdi
	cmpq	%rdi, %rax
	je	.L8493
	movq	128(%rbp), %rdx
	cmpq	%rdi, %rdx
	je	.L8493
	movq	integer_types+56(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L8061
	cmpq	%rcx, %rdx
	je	.L8061
	movq	global_trees+208(%rip), %rdi
	cmpq	%rdi, %rax
	je	.L8493
	cmpq	%rdi, %rdx
	je	.L8493
	testb	$32, 17(%rbx)
	jne	.L8431
.L8509:
	movq	%rbp, %rdi
	.p2align 4,,7
.L8493:
	movq	%r14, %rsi
	movq	136(%rsp), %rbx
	movq	144(%rsp), %rbp
	movq	152(%rsp), %r12
	movq	160(%rsp), %r13
	movq	168(%rsp), %r14
	movq	176(%rsp), %r15
	addq	$184, %rsp
	jmp	build_type_attribute_variant
.L8431:
	movq	%rbx, %rdi
	jmp	.L8493
.L8061:
	testb	$32, 17(%rbx)
	jne	.L8493
	testb	$32, 17(%rbp)
	jne	.L8493
	movq	%rcx, %rdi
	jmp	.L8493
	.p2align 6,,7
.L8460:
	cmpl	$7, %r12d
	je	.L8054
	jmp	.L8509
.L8517:
	cmpl	$7, %r13d
	je	.L8460
	jmp	.L8431
.L8069:
	movq	8(%rbx), %rbx
	movq	8(%rbp), %rbp
	movq	128(%rbx), %rdi
	movq	128(%rbp), %rsi
	call	common_type
	movzbl	62(%rbx), %ecx
	movzbl	17(%rbx), %esi
	movq	%rax, %rdi
	movl	%esi, %edx
	shrb	$5, %cl
	shrb	$3, %sil
	shrb	$4, %dl
	andl	$1, %esi
	andl	$1, %ecx
	andl	$1, %edx
	addl	%esi, %esi
	sall	$2, %ecx
	orl	%esi, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, 16(%rbx)
	je	.L8518
.L8072:
	movzbl	17(%rbp), %r8d
	movzbl	62(%rbp), %ebx
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r8d, %edx
	shrb	$5, %bl
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %ebx
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %ebx
	orl	%r8d, %edx
	orl	%ebx, %edx
	cmpb	$20, 16(%rbp)
	je	.L8519
.L8073:
	leal	0(,%rcx,8), %ebp
	orl	%ebp, %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movq	%rax, %rdi
	call	build_pointer_type
	.p2align 4,,7
.L8511:
	movq	%rax, %rdi
	jmp	.L8493
.L8519:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L8073
.L8518:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L8072
.L8074:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	call	common_type
	cmpq	8(%rbx), %rax
	je	.L8520
.L8075:
	cmpq	8(%rbp), %rax
	je	.L8521
.L8076:
	cmpq	$0, 24(%rbx)
	movq	%rax, %rdi
	cmove	%rbp, %rbx
	movq	24(%rbx), %rsi
	call	build_array_type
	jmp	.L8511
.L8521:
	cmpq	$0, 24(%rbp)
	je	.L8076
	jmp	.L8509
.L8520:
	cmpq	$0, 24(%rbx)
	je	.L8075
	jmp	.L8431
	.p2align 6,,7
.L8081:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	call	common_type
	movq	%rax, 128(%rsp)
	cmpq	8(%rbx), %rax
	movq	24(%rbp), %r13
	movq	24(%rbx), %r12
	je	.L8522
.L8082:
	movq	128(%rsp), %rdx
	cmpq	8(%rbp), %rdx
	je	.L8523
	testq	%r12, %r12
	je	.L8524
.L8084:
	testq	%r13, %r13
	je	.L8525
	xorl	%edi, %edi
	call	pushlevel
	movl	$1, %edi
	call	declare_parm_level
	movq	%r12, %rdi
	call	list_length
	movq	$0, 88(%rsp)
	testl	%eax, %eax
	jle	.L8434
	movl	%eax, %ebx
.L8090:
	movq	88(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	call	tree_cons
	decl	%ebx
	movq	%rax, 88(%rsp)
	jne	.L8090
.L8434:
	movq	88(%rsp), %rax
	testq	%r12, %r12
	movq	%rax, 80(%rsp)
	je	.L8436
.L8430:
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L8095
	movq	32(%r13), %r9
	movq	80(%rsp), %rdi
	movq	%r9, 32(%rdi)
.L8096:
.L8093:
	movq	80(%rsp), %rax
	movq	(%r12), %r12
	movq	(%r13), %r13
	movq	(%rax), %r9
	testq	%r12, %r12
	movq	%r9, 80(%rsp)
	jne	.L8430
.L8436:
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	call	poplevel
	movq	88(%rsp), %rsi
	movq	128(%rsp), %rdi
	call	build_function_type
	movq	%rax, %rbx
	jmp	.L8431
.L8095:
	movq	32(%r13), %rdx
	testq	%rdx, %rdx
	je	.L8492
	cmpb	$21, 16(%rax)
	je	.L8526
.L8098:
	cmpb	$21, 16(%rdx)
	je	.L8527
.L8264:
	movq	32(%r12), %rdi
	movq	32(%r13), %rsi
	call	common_type
.L8492:
	movq	80(%rsp), %r11
	movq	%rax, 32(%r11)
	jmp	.L8093
.L8527:
	movq	32(%r12), %rax
	cmpq	%rax, %rdx
	je	.L8264
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	movq	%rbx, 32(%rsp)
	je	.L8264
.L8429:
	movq	32(%rsp), %r11
	movq	%rax, %rbp
	movq	8(%r11), %rbx
	cmpq	%rax, %rbx
	je	.L8490
	testq	%rbx, %rbx
	je	.L8490
	testq	%rax, %rax
	je	.L8490
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L8490
	movzbl	16(%rax), %ecx
	testb	%cl, %cl
	je	.L8490
	cmpb	$6, %dl
	je	.L8528
.L8273:
	cmpb	$6, %cl
	je	.L8529
.L8274:
	cmpb	$10, %dl
	je	.L8530
.L8275:
	cmpb	$10, 16(%rbp)
	je	.L8531
.L8276:
	cmpq	%rbp, %rbx
	movl	$1, 4(%rsp)
	je	.L8272
	movzbl	16(%rbx), %esi
	cmpb	16(%rbp), %sil
	je	.L8278
	movl	$0, 4(%rsp)
.L8272:
	movl	4(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L8532
.L8267:
	movq	32(%rsp), %rbp
	movq	(%rbp), %rsi
	testq	%rsi, %rsi
	movq	%rsi, 32(%rsp)
	je	.L8264
	movq	32(%r12), %rax
	jmp	.L8429
.L8532:
	movq	32(%r12), %r8
	movq	80(%rsp), %r10
	movq	%r8, 32(%r10)
.L8503:
	movl	pedantic(%rip), %ebx
	testl	%ebx, %ebx
	je	.L8093
	movl	$.LC10, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L8093
.L8278:
	movzbl	17(%rbx), %r15d
	movzbl	62(%rbx), %r10d
	xorl	%ecx, %ecx
	movl	%r15d, %edx
	shrb	$5, %r10b
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	$1, %r15d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r15d, %r15d
	sall	$2, %r10d
	orl	%r15d, %edx
	orl	%r10d, %edx
	cmpb	$20, %sil
	je	.L8533
.L8280:
	movzbl	17(%rbp), %r8d
	leal	0(,%rcx,8), %edi
	movzbl	62(%rbp), %ecx
	orl	%edx, %edi
	movl	%r8d, %edx
	shrb	$5, %cl
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	$1, %r8d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r8d, %r8d
	sall	$2, %ecx
	orl	%r8d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L8534
.L8281:
	leal	0(,%rcx,8), %esi
	movl	$0, 4(%rsp)
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L8272
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L8490
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	$0, 4(%rsp)
	testl	%eax, %eax
	movl	%eax, 108(%rsp)
	je	.L8272
	movl	$0, 4(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L8407
	cmpl	$18, %eax
	ja	.L8424
	cmpl	$13, %eax
	je	.L8285
.L8284:
	cmpl	$2, 108(%rsp)
	jne	.L8272
	cmpl	$1, 4(%rsp)
	movl	108(%rsp), %edi
	cmovne	4(%rsp), %edi
	movl	%edi, 4(%rsp)
	jmp	.L8272
.L8285:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L8286
	call	comptypes
.L8489:
	movl	%eax, 4(%rsp)
	jmp	.L8284
.L8286:
	movl	$1, 4(%rsp)
	jmp	.L8284
.L8424:
	cmpl	$20, %eax
	je	.L8420
	cmpl	$23, %eax
	jne	.L8284
	movl	$1, 28(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L8289
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 28(%rsp)
	je	.L8284
.L8289:
	movq	24(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, 8(%rsp)
	movq	24(%rbp), %r15
	je	.L8535
	testq	%r15, %r15
	je	.L8536
	movl	$1, 4(%rsp)
	xorl	%ebp, %ebp
.L8404:
	cmpq	$0, 8(%rsp)
	je	.L8537
	testq	%r15, %r15
	je	.L8393
	movq	8(%rsp), %r8
	movq	32(%r8), %rdi
	testq	%rdi, %rdi
	je	.L8538
	movq	32(%r15), %rax
	testq	%rax, %rax
	jne	.L8379
.L8502:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L8393
.L8378:
	cmpl	4(%rsp), %ebp
	movl	4(%rsp), %ebx
	movq	8(%rsp), %r8
	cmovg	%ebp, %ebx
	movl	%ebx, 4(%rsp)
	movq	(%r8), %rcx
	movq	%rcx, 8(%rsp)
	movq	(%r15), %r15
	jmp	.L8404
.L8393:
	movl	$0, 4(%rsp)
.L8373:
	cmpl	$1, 4(%rsp)
	movl	4(%rsp), %eax
	cmove	28(%rsp), %eax
	jmp	.L8489
.L8379:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L8378
	movq	8(%rsp), %rdx
	movq	32(%rdx), %rax
	cmpb	$21, 16(%rax)
	je	.L8540
.L8383:
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	jne	.L8393
	cmpq	$0, 96(%rax)
	je	.L8394
	testb	$8, 62(%rax)
	je	.L8393
.L8394:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8393
	movq	8(%rsp), %r9
	movq	32(%r9), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8393
	movq	32(%r15), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L8393
.L8400:
	movq	8(%rsp), %r10
	movq	8(%rbx), %rdi
	movq	32(%r10), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8396
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8400
	jmp	.L8393
.L8396:
	testq	%rbx, %rbx
	jne	.L8378
	jmp	.L8393
.L8540:
	cmpq	$0, 96(%rax)
	je	.L8384
	testb	$8, 62(%rax)
	je	.L8383
.L8384:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8383
	movq	32(%r15), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8383
	movq	8(%rsp), %rax
	movq	32(%rax), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L8393
.L8390:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8396
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8390
	jmp	.L8393
.L8538:
	movq	32(%r15), %rdi
	jmp	.L8502
.L8537:
	testq	%r15, %r15
	je	.L8373
	jmp	.L8393
.L8536:
	movq	8(%rsp), %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L8284
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L8457
	movq	%rax, %rbp
	movl	$1, %r15d
	movl	$0, 16(%rsp)
.L8368:
	cmpq	$0, 8(%rsp)
	je	.L8541
	testq	%rbp, %rbp
	je	.L8357
	movq	8(%rsp), %rcx
	movq	32(%rcx), %rdi
	testq	%rdi, %rdi
	je	.L8542
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L8343
.L8501:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L8357
.L8342:
	movq	8(%rsp), %rcx
	cmpl	%r15d, 16(%rsp)
	cmovg	16(%rsp), %r15d
	movq	(%rcx), %r10
	movq	%r10, 8(%rsp)
	movq	(%rbp), %rbp
	jmp	.L8368
.L8357:
	xorl	%r15d, %r15d
.L8337:
	decl	%r15d
	movl	$2, 4(%rsp)
	jne	.L8284
	movl	28(%rsp), %eax
	jmp	.L8489
.L8343:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 16(%rsp)
	jne	.L8342
	movq	8(%rsp), %r8
	movq	32(%r8), %rax
	cmpb	$21, 16(%rax)
	je	.L8544
.L8347:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L8357
	cmpq	$0, 96(%rax)
	je	.L8358
	testb	$8, 62(%rax)
	je	.L8357
.L8358:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8357
	movq	8(%rsp), %r11
	movq	32(%r11), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8357
	movq	32(%rbp), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L8357
.L8364:
	movq	8(%rsp), %r9
	movq	8(%rbx), %rdi
	movq	32(%r9), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8360
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8364
	jmp	.L8357
.L8360:
	testq	%rbx, %rbx
	jne	.L8342
	jmp	.L8357
.L8544:
	cmpq	$0, 96(%rax)
	je	.L8348
	testb	$8, 62(%rax)
	je	.L8347
.L8348:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8347
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8347
	movq	8(%rsp), %rax
	movq	32(%rax), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L8357
.L8354:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8360
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8354
	jmp	.L8357
.L8542:
	movq	32(%rbp), %rdi
	jmp	.L8501
.L8541:
	testq	%rbp, %rbp
	je	.L8337
	jmp	.L8357
.L8457:
	movl	28(%rsp), %r15d
	movl	%r15d, 4(%rsp)
	jmp	.L8284
.L8535:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L8284
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L8455
	movq	%rax, %rbp
	movl	$1, 20(%rsp)
	movl	$0, 24(%rsp)
.L8329:
	testq	%r15, %r15
	je	.L8545
	testq	%rbp, %rbp
	je	.L8318
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L8546
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L8304
.L8500:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L8318
.L8303:
	movl	20(%rsp), %r10d
	movl	24(%rsp), %eax
	cmpl	%r10d, 24(%rsp)
	cmovle	%r10d, %eax
	movl	%eax, 20(%rsp)
	movq	(%rbp), %rbp
	movq	(%r15), %r15
	jmp	.L8329
.L8318:
	movl	$0, 20(%rsp)
.L8298:
	cmpl	$1, 20(%rsp)
	movl	$2, 4(%rsp)
	jne	.L8284
	jmp	.L8457
.L8304:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 24(%rsp)
	jne	.L8303
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L8548
.L8308:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L8318
	cmpq	$0, 96(%rax)
	je	.L8319
	testb	$8, 62(%rax)
	je	.L8318
.L8319:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8318
	movq	32(%r15), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8318
	movq	32(%rbp), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L8318
.L8325:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8321
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8325
	jmp	.L8318
.L8321:
	testq	%rbx, %rbx
	jne	.L8303
	jmp	.L8318
.L8548:
	cmpq	$0, 96(%rax)
	je	.L8309
	testb	$8, 62(%rax)
	je	.L8308
.L8309:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8308
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8308
	movq	32(%r15), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L8318
.L8315:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8321
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8315
	jmp	.L8318
.L8546:
	movq	32(%rbp), %rdi
	jmp	.L8500
.L8545:
	testq	%rbp, %rbp
	je	.L8298
	jmp	.L8318
.L8455:
	movl	28(%rsp), %ebp
	movl	%ebp, 4(%rsp)
	jmp	.L8284
.L8420:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	4(%rsp), %eax
	jmp	.L8489
.L8407:
	movq	24(%rbp), %rsi
	movq	24(%rbx), %r15
	movl	$1, 4(%rsp)
	movq	%rsi, 96(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L8408
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 4(%rsp)
	je	.L8267
.L8408:
	testq	%r15, %r15
	je	.L8284
	cmpq	$0, 96(%rsp)
	je	.L8284
	cmpq	96(%rsp), %r15
	je	.L8284
	movq	112(%r15), %rcx
	movq	96(%rsp), %rbp
	testq	%rcx, %rcx
	movq	112(%rbp), %rsi
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L8411
	movq	104(%r15), %r11
	cmpb	$25, 16(%r11)
	je	.L8549
.L8412:
	movl	$1, %r8d
.L8411:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L8413
	movq	96(%rsp), %rax
	movq	104(%rax), %r9
	cmpb	$25, 16(%r9)
	je	.L8550
.L8414:
	movl	$1, %ecx
.L8413:
	testb	%r8b, %r8b
	jne	.L8284
	testb	%cl, %cl
	jne	.L8284
	testb	%dil, %dil
	je	.L8480
	testb	%dl, %dl
.L8488:
	jne	.L8284
.L8419:
	movl	$0, 4(%rsp)
	jmp	.L8284
.L8480:
	testb	%dl, %dl
	jne	.L8419
	movq	96(%rsp), %rdx
	movq	104(%r15), %rdi
	movq	104(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8419
	movq	112(%r15), %rdi
	movq	96(%rsp), %r15
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L8488
.L8550:
	cmpb	$25, 16(%rsi)
	jne	.L8414
	jmp	.L8413
.L8549:
	cmpb	$25, 16(%rcx)
	jne	.L8412
	jmp	.L8411
	.p2align 6,,7
.L8490:
	movl	$1, 4(%rsp)
	jmp	.L8272
.L8534:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L8281
.L8533:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L8280
.L8531:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L8276
.L8530:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L8275
.L8529:
	testb	$2, 62(%rax)
	je	.L8274
	movq	24(%rax), %r9
	testq	%r9, %r9
	cmovne	%r9, %rbp
	jmp	.L8274
.L8528:
	testb	$2, 62(%rbx)
	je	.L8273
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8273
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L8273
	.p2align 6,,7
.L8526:
	cmpq	%rdx, %rax
	je	.L8098
	movq	24(%rax), %r10
	testq	%r10, %r10
	movq	%r10, 72(%rsp)
	je	.L8098
.L8263:
	movq	72(%rsp), %r11
	movq	%rdx, %rbp
	movq	8(%r11), %rbx
	cmpq	%rdx, %rbx
	je	.L8105
	testq	%rbx, %rbx
	je	.L8105
	testq	%rdx, %rdx
	je	.L8105
	movzbl	16(%rbx), %ecx
	testb	%cl, %cl
	je	.L8105
	movzbl	16(%rdx), %eax
	testb	%al, %al
	jne	.L8104
.L8105:
	movl	$1, 44(%rsp)
.L8106:
	movl	44(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L8551
.L8101:
	movq	72(%rsp), %rdi
	movq	(%rdi), %rsi
	testq	%rsi, %rsi
	movq	%rsi, 72(%rsp)
	jne	.L8263
	jmp	.L8098
.L8551:
	movq	80(%rsp), %r8
	movq	%rdx, 32(%r8)
	jmp	.L8503
.L8104:
	cmpb	$6, %cl
	je	.L8552
.L8107:
	cmpb	$6, %al
	je	.L8553
.L8108:
	cmpb	$10, %cl
	je	.L8554
.L8109:
	cmpb	$10, 16(%rbp)
	je	.L8555
.L8110:
	cmpq	%rbp, %rbx
	je	.L8497
	movzbl	16(%rbx), %edi
	cmpb	16(%rbp), %dil
	je	.L8556
.L8499:
	movl	$0, 44(%rsp)
.L8484:
	movq	32(%r13), %rdx
	jmp	.L8106
.L8556:
	movzbl	17(%rbx), %esi
	movzbl	62(%rbx), %ecx
	movl	%esi, %edx
	shrb	$5, %cl
	shrb	$3, %sil
	shrb	$4, %dl
	andl	$1, %esi
	andl	$1, %ecx
	andl	$1, %edx
	addl	%esi, %esi
	sall	$2, %ecx
	orl	%esi, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L8557
.L8114:
	movzbl	17(%rbp), %r9d
	movzbl	62(%rbp), %r8d
	leal	0(,%rcx,8), %esi
	orl	%edx, %esi
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %r8b
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %r8d
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %r8d
	orl	%r9d, %edx
	orl	%r8d, %edx
	cmpb	$20, %dil
	je	.L8558
.L8115:
	leal	0(,%rcx,8), %edi
	orl	%edi, %edx
	cmpl	%edx, %esi
	jne	.L8499
	movq	128(%rbp), %rax
	cmpq	%rax, 128(%rbx)
	je	.L8497
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, 124(%rsp)
	je	.L8499
	movl	$0, 44(%rsp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L8241
	cmpl	$18, %eax
	ja	.L8258
	cmpl	$13, %eax
	je	.L8119
.L8118:
	cmpl	$2, 124(%rsp)
	jne	.L8484
	cmpl	$1, 44(%rsp)
	jne	.L8484
	movl	$2, 44(%rsp)
	jmp	.L8484
.L8119:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L8120
	call	comptypes
.L8487:
	movl	%eax, 44(%rsp)
	jmp	.L8118
.L8120:
	movl	$1, 44(%rsp)
	jmp	.L8118
.L8258:
	cmpl	$20, %eax
	je	.L8254
	cmpl	$23, %eax
	jne	.L8118
	movl	$1, 68(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L8123
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 68(%rsp)
	je	.L8118
.L8123:
	movq	24(%rbx), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 48(%rsp)
	movq	24(%rbp), %r15
	je	.L8559
	testq	%r15, %r15
	je	.L8560
	movl	$1, 44(%rsp)
	xorl	%ebp, %ebp
.L8238:
	cmpq	$0, 48(%rsp)
	je	.L8561
	testq	%r15, %r15
	je	.L8227
	movq	48(%rsp), %r10
	movq	32(%r10), %rdi
	testq	%rdi, %rdi
	je	.L8562
	movq	32(%r15), %rax
	testq	%rax, %rax
	jne	.L8213
.L8496:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L8227
.L8212:
	cmpl	44(%rsp), %ebp
	movl	44(%rsp), %ebx
	movq	48(%rsp), %rdi
	cmovg	%ebp, %ebx
	movl	%ebx, 44(%rsp)
	movq	(%rdi), %r10
	movq	%r10, 48(%rsp)
	movq	(%r15), %r15
	jmp	.L8238
.L8227:
	movl	$0, 44(%rsp)
.L8207:
	cmpl	$1, 44(%rsp)
	movl	44(%rsp), %eax
	cmove	68(%rsp), %eax
	jmp	.L8487
.L8213:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L8212
	movq	48(%rsp), %rdi
	movq	32(%rdi), %rax
	cmpb	$21, 16(%rax)
	je	.L8564
.L8217:
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	jne	.L8227
	cmpq	$0, 96(%rax)
	je	.L8228
	testb	$8, 62(%rax)
	je	.L8227
.L8228:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8227
	movq	48(%rsp), %r8
	movq	32(%r8), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8227
	movq	32(%r15), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L8227
.L8234:
	movq	48(%rsp), %r9
	movq	8(%rbx), %rdi
	movq	32(%r9), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8230
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8234
	jmp	.L8227
.L8230:
	testq	%rbx, %rbx
	jne	.L8212
	jmp	.L8227
.L8564:
	cmpq	$0, 96(%rax)
	je	.L8218
	testb	$8, 62(%rax)
	je	.L8217
.L8218:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8217
	movq	32(%r15), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8217
	movq	48(%rsp), %rax
	movq	32(%rax), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L8227
.L8224:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8230
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8224
	jmp	.L8227
.L8562:
	movq	32(%r15), %rdi
	jmp	.L8496
.L8561:
	testq	%r15, %r15
	je	.L8207
	jmp	.L8227
.L8560:
	movq	48(%rsp), %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L8118
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L8453
	movq	%rax, %rbp
	movl	$1, %r15d
	movl	$0, 56(%rsp)
.L8202:
	cmpq	$0, 48(%rsp)
	je	.L8565
	testq	%rbp, %rbp
	je	.L8191
	movq	48(%rsp), %r9
	movq	32(%r9), %rdi
	testq	%rdi, %rdi
	je	.L8566
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L8177
.L8495:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L8191
.L8176:
	movq	48(%rsp), %r9
	cmpl	%r15d, 56(%rsp)
	cmovg	56(%rsp), %r15d
	movq	(%r9), %rsi
	movq	%rsi, 48(%rsp)
	movq	(%rbp), %rbp
	jmp	.L8202
.L8191:
	xorl	%r15d, %r15d
.L8171:
	decl	%r15d
	movl	$2, 44(%rsp)
	jne	.L8118
.L8454:
	movl	68(%rsp), %eax
	jmp	.L8487
.L8177:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 56(%rsp)
	jne	.L8176
	movq	48(%rsp), %rdi
	movq	32(%rdi), %rax
	cmpb	$21, 16(%rax)
	je	.L8568
.L8181:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L8191
	cmpq	$0, 96(%rax)
	je	.L8192
	testb	$8, 62(%rax)
	je	.L8191
.L8192:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8191
	movq	48(%rsp), %r11
	movq	32(%r11), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8191
	movq	32(%rbp), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L8191
.L8198:
	movq	48(%rsp), %r8
	movq	8(%rbx), %rdi
	movq	32(%r8), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8194
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8198
	jmp	.L8191
.L8194:
	testq	%rbx, %rbx
	jne	.L8176
	jmp	.L8191
.L8568:
	cmpq	$0, 96(%rax)
	je	.L8182
	testb	$8, 62(%rax)
	je	.L8181
.L8182:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8181
	movq	32(%rbp), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8181
	movq	48(%rsp), %rax
	movq	32(%rax), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L8191
.L8188:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8194
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8188
	jmp	.L8191
.L8566:
	movq	32(%rbp), %rdi
	jmp	.L8495
.L8565:
	testq	%rbp, %rbp
	je	.L8171
	jmp	.L8191
.L8453:
	movl	68(%rsp), %r15d
	movl	%r15d, 44(%rsp)
	jmp	.L8118
.L8559:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L8118
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L8454
	movq	%rax, %rbp
	movl	$1, 60(%rsp)
	movl	$0, 64(%rsp)
.L8163:
	testq	%r15, %r15
	je	.L8569
	testq	%rbp, %rbp
	je	.L8152
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L8570
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L8138
.L8494:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L8152
.L8137:
	movl	60(%rsp), %r8d
	movl	64(%rsp), %esi
	cmpl	%r8d, 64(%rsp)
	cmovle	%r8d, %esi
	movl	%esi, 60(%rsp)
	movq	(%rbp), %rbp
	movq	(%r15), %r15
	jmp	.L8163
.L8152:
	movl	$0, 60(%rsp)
.L8132:
	cmpl	$1, 60(%rsp)
	movl	$2, 44(%rsp)
	jne	.L8118
	movl	68(%rsp), %ebp
	movl	%ebp, 44(%rsp)
	jmp	.L8118
.L8138:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 64(%rsp)
	jne	.L8137
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L8572
.L8142:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L8152
	cmpq	$0, 96(%rax)
	je	.L8153
	testb	$8, 62(%rax)
	je	.L8152
.L8153:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8152
	movq	32(%r15), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8152
	movq	32(%rbp), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L8152
.L8159:
	movq	8(%rbx), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8155
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8159
	jmp	.L8152
.L8155:
	testq	%rbx, %rbx
	jne	.L8137
	jmp	.L8152
.L8572:
	cmpq	$0, 96(%rax)
	je	.L8143
	testb	$8, 62(%rax)
	je	.L8142
.L8143:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8142
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8142
	movq	32(%r15), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L8152
.L8149:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8155
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8149
	jmp	.L8152
.L8570:
	movq	32(%rbp), %rdi
	jmp	.L8494
.L8569:
	testq	%rbp, %rbp
	je	.L8132
	jmp	.L8152
.L8254:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	44(%rsp), %eax
	jmp	.L8487
.L8241:
	movq	24(%rbp), %r11
	movq	24(%rbx), %r15
	movl	$1, 44(%rsp)
	movq	%r11, 112(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L8242
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 44(%rsp)
	je	.L8482
.L8242:
	testq	%r15, %r15
	je	.L8118
	cmpq	$0, 112(%rsp)
	je	.L8118
	cmpq	112(%rsp), %r15
	je	.L8118
	movq	112(%r15), %rcx
	movq	112(%rsp), %rbp
	testq	%rcx, %rcx
	movq	112(%rbp), %rsi
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L8245
	movq	104(%r15), %r9
	cmpb	$25, 16(%r9)
	je	.L8573
.L8246:
	movl	$1, %r8d
.L8245:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L8247
	movq	112(%rsp), %rax
	movq	104(%rax), %r10
	cmpb	$25, 16(%r10)
	je	.L8574
.L8248:
	movl	$1, %ecx
.L8247:
	testb	%r8b, %r8b
	jne	.L8118
	testb	%cl, %cl
	jne	.L8118
	testb	%dil, %dil
	je	.L8470
	testb	%dl, %dl
.L8486:
	jne	.L8118
.L8253:
	movl	$0, 44(%rsp)
	jmp	.L8118
.L8470:
	testb	%dl, %dl
	jne	.L8253
	movq	112(%rsp), %rdx
	movq	104(%r15), %rdi
	movq	104(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8253
	movq	112(%r15), %rdi
	movq	112(%rsp), %r15
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L8486
.L8574:
	cmpb	$25, 16(%rsi)
	jne	.L8248
	jmp	.L8247
.L8573:
	cmpb	$25, 16(%rcx)
	jne	.L8246
	jmp	.L8245
.L8482:
	movq	32(%r13), %rdx
	jmp	.L8101
	.p2align 6,,7
.L8497:
	movl	$1, 44(%rsp)
	jmp	.L8484
.L8558:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L8115
.L8557:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L8114
	.p2align 6,,7
.L8555:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L8110
.L8554:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L8109
.L8553:
	testb	$2, 62(%rdx)
	je	.L8108
	movq	24(%rdx), %r15
	testq	%r15, %r15
	cmovne	%r15, %rbp
	jmp	.L8108
.L8552:
	testb	$2, 62(%rbx)
	je	.L8107
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8107
	movq	%rdi, %rbx
	movzbl	16(%rdi), %ecx
	jmp	.L8107
	.p2align 6,,7
.L8525:
	movq	128(%rsp), %rdi
	movq	%r12, %rsi
.L8512:
	call	build_function_type
	jmp	.L8511
.L8524:
	movq	128(%rsp), %rdi
	movq	24(%rbp), %rsi
	jmp	.L8512
.L8523:
	testq	%r12, %r12
	jne	.L8084
	jmp	.L8509
.L8522:
	testq	%r13, %r13
	jne	.L8082
	jmp	.L8431
	.p2align 6,,7
.L8481:
	movq	%rbx, %rdi
.L8042:
	cmpl	$8, %r13d
	movq	%rbp, %rsi
	je	.L8575
.L8044:
	call	common_type
	cmpl	$8, %r12d
	je	.L8576
.L8046:
	cmpl	$8, %r13d
	jne	.L8048
	cmpq	%rax, 8(%rbp)
	je	.L8509
.L8048:
	movq	%rax, %rdi
	call	build_complex_type
	jmp	.L8511
.L8576:
	cmpq	%rax, 8(%rbx)
	jne	.L8046
	jmp	.L8431
	.p2align 6,,7
.L8575:
	movq	8(%rbp), %rsi
	jmp	.L8044
.L8459:
	movq	8(%rbx), %rdi
	jmp	.L8042
.L8515:
	movzwl	60(%rbp), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %rbp
	movzbl	16(%rax), %eax
	jmp	.L8038
.L8514:
	movzwl	60(%rbx), %edi
	movl	$1, %esi
	andl	$511, %edi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L8037
	.p2align 6,,7
.L8033:
	movq	%rbx, %rax
	movq	144(%rsp), %rbp
	movq	152(%rsp), %r12
	movq	136(%rsp), %rbx
	movq	160(%rsp), %r13
	movq	168(%rsp), %r14
	movq	176(%rsp), %r15
	addq	$184, %rsp
	ret
	.p2align 6,,7
.L8513:
	movq	%rsi, %rbx
	jmp	.L8033
.LFE16:
.Lfe16:
	.size	common_type,.Lfe16-common_type
	.align 2
	.p2align 4,,15
.globl comptypes
	.type	comptypes,@function
comptypes:
.LFB17:
	subq	$56, %rsp
.LCFI67:
	cmpq	%rsi, %rdi
	movq	%rbx, 8(%rsp)
.LCFI68:
	movq	%rbp, 16(%rsp)
.LCFI69:
	movq	%r12, 24(%rsp)
.LCFI70:
	movq	%r13, 32(%rsp)
.LCFI71:
	movq	%r14, 40(%rsp)
.LCFI72:
	movq	%r15, 48(%rsp)
.LCFI73:
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	je	.L8757
	testq	%rdi, %rdi
	je	.L8757
	testq	%rsi, %rsi
	je	.L8757
	movzbl	16(%rdi), %edx
	testb	%dl, %dl
	je	.L8757
	movzbl	16(%rsi), %eax
	testb	%al, %al
	je	.L8757
	cmpb	$6, %dl
	je	.L8762
.L8580:
	cmpb	$6, %al
	je	.L8763
.L8581:
	cmpb	$10, %dl
	je	.L8764
.L8582:
	cmpb	$10, 16(%rbp)
	je	.L8765
.L8583:
	cmpq	%rbp, %rbx
	movl	$1, %eax
	je	.L8577
	movzbl	16(%rbx), %ecx
	cmpb	16(%rbp), %cl
	je	.L8585
	xorl	%eax, %eax
	.p2align 4,,7
.L8577:
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	movq	24(%rsp), %r12
	movq	32(%rsp), %r13
	movq	40(%rsp), %r14
	movq	48(%rsp), %r15
	addq	$56, %rsp
	ret
.L8585:
	movzbl	17(%rbx), %edi
	movzbl	62(%rbx), %esi
	movl	%edi, %edx
	shrb	$5, %sil
	shrb	$3, %dil
	shrb	$4, %dl
	andl	$1, %edi
	andl	$1, %esi
	andl	$1, %edx
	addl	%edi, %edi
	sall	$2, %esi
	orl	%edi, %edx
	orl	%esi, %edx
	xorl	%esi, %esi
	cmpb	$20, %cl
	je	.L8766
.L8587:
	movzbl	17(%rbp), %r9d
	movzbl	62(%rbp), %r8d
	leal	0(,%rsi,8), %edi
	orl	%edx, %edi
	xorl	%esi, %esi
	movl	%r9d, %edx
	shrb	$5, %r8b
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %r8d
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %r8d
	orl	%r9d, %edx
	orl	%r8d, %edx
	cmpb	$20, %cl
	je	.L8767
.L8588:
	leal	0(,%rsi,8), %ecx
	xorl	%eax, %eax
	orl	%ecx, %edx
	cmpl	%edx, %edi
	jne	.L8577
	movq	128(%rbp), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L8757
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	*targetm+264(%rip)
	movl	%eax, %r15d
	xorl	%eax, %eax
	testl	%r15d, %r15d
	je	.L8577
	movzbl	16(%rbx), %eax
	xorl	%r14d, %r14d
	cmpl	$18, %eax
	je	.L8715
	cmpl	$18, %eax
	ja	.L8732
	cmpl	$13, %eax
	je	.L8592
.L8591:
	cmpl	$2, %r15d
	je	.L8768
.L8734:
	movl	%r14d, %eax
	jmp	.L8577
.L8768:
	cmpl	$1, %r14d
	cmove	%r15d, %r14d
	jmp	.L8734
.L8592:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	cmpq	%rsi, %rdi
	je	.L8593
	call	comptypes
	movl	%eax, %r14d
	jmp	.L8591
.L8593:
	movl	$1, %r14d
	jmp	.L8591
	.p2align 6,,7
.L8732:
	cmpl	$20, %eax
	je	.L8728
	cmpl	$23, %eax
	jne	.L8591
	movl	$1, 4(%rsp)
	movq	8(%rbp), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L8597
	call	comptypes
	testl	%eax, %eax
	movl	%eax, 4(%rsp)
	je	.L8591
.L8597:
	movq	24(%rbx), %r13
	movq	24(%rbp), %r12
	testq	%r13, %r13
	je	.L8769
	testq	%r12, %r12
	je	.L8770
	movl	$1, %r14d
	xorl	%ebp, %ebp
.L8712:
	testq	%r13, %r13
	je	.L8771
	testq	%r12, %r12
	je	.L8701
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L8772
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L8687
.L8761:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L8701
.L8686:
	movq	(%r13), %r13
	movq	(%r12), %r12
	cmpl	%r14d, %ebp
	cmovg	%ebp, %r14d
	jmp	.L8712
.L8701:
	xorl	%r14d, %r14d
.L8681:
	cmpl	$1, %r14d
	cmove	4(%rsp), %r14d
	jmp	.L8591
	.p2align 6,,7
.L8687:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L8686
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L8774
.L8691:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L8701
	cmpq	$0, 96(%rax)
	je	.L8702
	testb	$8, 62(%rax)
	je	.L8701
.L8702:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8701
	movq	32(%r13), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8701
	movq	32(%r12), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L8701
.L8708:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8704
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8708
	jmp	.L8701
.L8704:
	testq	%rbx, %rbx
	jne	.L8686
	jmp	.L8701
.L8774:
	cmpq	$0, 96(%rax)
	je	.L8692
	testb	$8, 62(%rax)
	je	.L8691
.L8692:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8691
	movq	32(%r12), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8691
	movq	32(%r13), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L8701
.L8698:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8704
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8698
	jmp	.L8701
.L8772:
	movq	32(%r12), %rdi
	jmp	.L8761
.L8771:
	testq	%r12, %r12
	je	.L8681
	jmp	.L8701
.L8770:
	movq	%r13, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L8591
	movq	136(%rbp), %rax
	testq	%rax, %rax
	je	.L8745
	movq	%rax, %rbp
	movl	$1, %r12d
	xorl	%r14d, %r14d
.L8676:
	testq	%r13, %r13
	je	.L8775
	testq	%rbp, %rbp
	je	.L8665
	movq	32(%r13), %rdi
	testq	%rdi, %rdi
	je	.L8776
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L8651
.L8759:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L8665
.L8650:
	movq	(%r13), %r13
	movq	(%rbp), %rbp
	cmpl	%r12d, %r14d
	cmovg	%r14d, %r12d
	jmp	.L8676
.L8665:
	xorl	%r12d, %r12d
.L8645:
	movl	$2, %r14d
	decl	%r12d
.L8760:
	jne	.L8591
.L8745:
	movl	4(%rsp), %r14d
	jmp	.L8591
.L8651:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r14d
	jne	.L8650
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	je	.L8778
.L8655:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L8665
	cmpq	$0, 96(%rax)
	je	.L8666
	testb	$8, 62(%rax)
	je	.L8665
.L8666:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8665
	movq	32(%r13), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8665
	movq	32(%rbp), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L8665
.L8672:
	movq	8(%rbx), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8668
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8672
	jmp	.L8665
.L8668:
	testq	%rbx, %rbx
	jne	.L8650
	jmp	.L8665
.L8778:
	cmpq	$0, 96(%rax)
	je	.L8656
	testb	$8, 62(%rax)
	je	.L8655
.L8656:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8655
	movq	32(%rbp), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8655
	movq	32(%r13), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L8665
.L8662:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8668
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8662
	jmp	.L8665
.L8776:
	movq	32(%rbp), %rdi
	jmp	.L8759
.L8775:
	testq	%rbp, %rbp
	je	.L8645
	jmp	.L8665
.L8769:
	movq	%r12, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L8591
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L8745
	movq	%rax, %rbp
	movl	$1, %r13d
	xorl	%r14d, %r14d
.L8637:
	testq	%r12, %r12
	je	.L8779
	testq	%rbp, %rbp
	je	.L8626
	movq	32(%r12), %rdi
	testq	%rdi, %rdi
	je	.L8780
	movq	32(%rbp), %rax
	testq	%rax, %rax
	jne	.L8612
.L8758:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L8626
.L8611:
	movq	(%r12), %r12
	movq	(%rbp), %rbp
	cmpl	%r13d, %r14d
	cmovg	%r14d, %r13d
	jmp	.L8637
.L8626:
	xorl	%r13d, %r13d
.L8606:
	movl	$2, %r14d
	decl	%r13d
	jmp	.L8760
.L8612:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r14d
	jne	.L8611
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	je	.L8782
.L8616:
	movq	32(%rbp), %rax
	cmpb	$21, 16(%rax)
	jne	.L8626
	cmpq	$0, 96(%rax)
	je	.L8627
	testb	$8, 62(%rax)
	je	.L8626
.L8627:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8626
	movq	32(%r12), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8626
	movq	32(%rbp), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L8626
.L8633:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8629
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8633
	jmp	.L8626
.L8629:
	testq	%rbx, %rbx
	jne	.L8611
	jmp	.L8626
.L8782:
	cmpq	$0, 96(%rax)
	je	.L8617
	testb	$8, 62(%rax)
	je	.L8616
.L8617:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L8616
	movq	32(%rbp), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8616
	movq	32(%r12), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L8626
.L8623:
	movq	8(%rbx), %rdi
	movq	32(%rbp), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L8629
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L8623
	jmp	.L8626
.L8780:
	movq	32(%rbp), %rdi
	jmp	.L8758
.L8779:
	testq	%rbp, %rbp
	je	.L8606
	jmp	.L8626
.L8728:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r14d
	jmp	.L8591
	.p2align 6,,7
.L8715:
	movq	8(%rbx), %rdi
	movq	8(%rbp), %rsi
	movl	$1, %r14d
	movq	24(%rbx), %r12
	movq	24(%rbp), %r13
	cmpq	%rsi, %rdi
	je	.L8716
	call	comptypes
	movl	%eax, %r14d
	xorl	%eax, %eax
	testl	%r14d, %r14d
	je	.L8577
.L8716:
	testq	%r12, %r12
	je	.L8591
	testq	%r13, %r13
	je	.L8591
	cmpq	%r13, %r12
	je	.L8591
	movq	112(%r12), %rcx
	movq	112(%r13), %rsi
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L8719
	movq	104(%r12), %rbp
	cmpb	$25, 16(%rbp)
	je	.L8783
.L8720:
	movl	$1, %r8d
.L8719:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L8721
	movq	104(%r13), %r9
	cmpb	$25, 16(%r9)
	je	.L8784
.L8722:
	movl	$1, %ecx
.L8721:
	testb	%r8b, %r8b
	jne	.L8591
	testb	%cl, %cl
	jne	.L8591
	testb	%dil, %dil
	je	.L8755
	testb	%dl, %dl
.L8756:
	jne	.L8591
.L8727:
	xorl	%r14d, %r14d
	jmp	.L8591
.L8755:
	testb	%dl, %dl
	jne	.L8727
	movq	104(%r12), %rdi
	movq	104(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L8727
	movq	112(%r12), %rdi
	movq	112(%r13), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L8756
.L8784:
	cmpb	$25, 16(%rsi)
	jne	.L8722
	jmp	.L8721
.L8783:
	cmpb	$25, 16(%rcx)
	jne	.L8720
	jmp	.L8719
	.p2align 6,,7
.L8757:
	movl	$1, %eax
	jmp	.L8577
.L8767:
	cmpq	$0, 8(%rbp)
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L8588
.L8766:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L8587
.L8765:
	movzbl	17(%rbp), %esi
	movzwl	60(%rbp), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbp
	jmp	.L8583
.L8764:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L8582
.L8763:
	testb	$2, 62(%rbp)
	je	.L8581
	movq	24(%rbp), %rcx
	testq	%rcx, %rcx
	cmovne	%rcx, %rbp
	jmp	.L8581
.L8762:
	testb	$2, 62(%rdi)
	je	.L8580
	movq	24(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L8580
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L8580
.LFE17:
.Lfe17:
	.size	comptypes,.Lfe17-comptypes
	.section	.rodata.str1.32
	.align 32
.LC89:
	.string	"sizeof applied to an incomplete type"
	.section	.rodata.str1.1
.LC88:
	.string	"sizeof applied to a void type"
	.section	.rodata.str1.32
	.align 32
.LC87:
	.string	"sizeof applied to a function type"
	.text
	.align 2
	.p2align 4,,15
.globl c_sizeof
	.type	c_sizeof,@function
c_sizeof:
.LFB18:
	pushq	%rbx
.LCFI74:
	movzbl	16(%rdi), %eax
	movq	%rdi, %rbx
	cmpl	$23, %eax
	je	.L9117
	cmpl	$5, %eax
	je	.L9118
	testl	%eax, %eax
	jne	.L9109
.L9115:
	movq	global_trees+128(%rip), %rdx
.L9104:
	movq	c_global_trees+32(%rip), %rsi
	movl	$115, %edi
	call	build1
	popq	%rbx
	movq	%rax, %rdi
	jmp	fold
	.p2align 6,,7
.L9109:
	cmpq	$0, 32(%rdi)
	jne	.L9111
	movl	$.LC89, %edi
	xorl	%eax, %eax
	call	error
	movq	global_trees+120(%rip), %rdx
	jmp	.L9104
	.p2align 6,,7
.L9111:
	movq	integer_types(%rip), %rdx
	xorl	%esi, %esi
	movzwl	60(%rdx), %edi
	shrq	$3, %rdi
	andl	$63, %edi
	call	size_int_wide
	movq	40(%rbx), %rsi
	movl	$63, %edi
	movq	%rax, %rdx
	call	size_binop
	movq	%rax, %rdx
	jmp	.L9104
	.p2align 6,,7
.L9118:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L9107
	movl	warn_pointer_arith(%rip), %eax
	testl	%eax, %eax
	je	.L9115
.L9107:
	movl	$.LC88, %edi
.L9116:
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L9115
	.p2align 6,,7
.L9117:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L9103
	movl	warn_pointer_arith(%rip), %eax
	testl	%eax, %eax
	je	.L9115
.L9103:
	movl	$.LC87, %edi
	jmp	.L9116
.LFE18:
.Lfe18:
	.size	c_sizeof,.Lfe18-c_sizeof
	.align 2
	.p2align 4,,15
.globl c_sizeof_nowarn
	.type	c_sizeof_nowarn,@function
c_sizeof_nowarn:
.LFB19:
	pushq	%rbx
.LCFI75:
	movzbl	16(%rdi), %eax
	movq	%rdi, %rbx
	cmpl	$23, %eax
	je	.L9121
	cmpl	$5, %eax
	je	.L9121
	testl	%eax, %eax
	jne	.L9120
.L9121:
	movq	global_trees+128(%rip), %rdx
.L9122:
	movq	c_global_trees+32(%rip), %rsi
	movl	$115, %edi
	call	build1
	popq	%rbx
	movq	%rax, %rdi
	jmp	fold
	.p2align 6,,7
.L9120:
	cmpq	$0, 32(%rdi)
	jne	.L9123
	movq	global_trees+120(%rip), %rdx
	jmp	.L9122
.L9123:
	movq	integer_types(%rip), %rdx
	xorl	%esi, %esi
	movzwl	60(%rdx), %edi
	shrq	$3, %rdi
	andl	$63, %edi
	call	size_int_wide
	movq	40(%rbx), %rsi
	movl	$63, %edi
	movq	%rax, %rdx
	call	size_binop
	movq	%rax, %rdx
	jmp	.L9122
.LFE19:
.Lfe19:
	.size	c_sizeof_nowarn,.Lfe19-c_sizeof_nowarn
	.align 2
	.p2align 4,,15
.globl c_size_in_bytes
	.type	c_size_in_bytes,@function
c_size_in_bytes:
.LFB20:
	pushq	%rbx
.LCFI76:
	movzbl	16(%rdi), %edx
	movq	%rdi, %rbx
	movzbl	%dl, %eax
	cmpl	$23, %eax
	je	.L9133
	cmpl	$5, %eax
	je	.L9133
	testl	%eax, %eax
	je	.L9133
	cmpq	$0, 32(%rdi)
	jne	.L9130
	cmpb	$5, %dl
	je	.L9130
	movl	$.LC23, %edi
	xorl	%eax, %eax
	call	error
	.p2align 4,,7
.L9133:
	popq	%rbx
	movq	global_trees+128(%rip), %rax
	ret
	.p2align 6,,7
.L9130:
	movq	integer_types(%rip), %rdx
	xorl	%esi, %esi
	movzwl	60(%rdx), %edi
	shrq	$3, %rdi
	andl	$63, %edi
	call	size_int_wide
	movq	40(%rbx), %rsi
	movl	$63, %edi
	popq	%rbx
	movq	%rax, %rdx
	jmp	size_binop
.LFE20:
.Lfe20:
	.size	c_size_in_bytes,.Lfe20-c_size_in_bytes
	.align 2
	.p2align 4,,15
.globl decl_constant_value
	.type	decl_constant_value,@function
decl_constant_value:
.LFB21:
	cmpq	$0, current_function_decl(%rip)
	je	.L9135
	movzbl	17(%rdi), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L9136
.L9135:
	movq	%rdi, %rax
.L9134:
	ret
	.p2align 6,,7
.L9136:
	movq	104(%rdi), %rax
	testq	%rax, %rax
	je	.L9135
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9135
	testb	$2, 17(%rax)
	je	.L9135
	cmpb	$46, %dl
	jne	.L9134
	jmp	.L9135
.LFE21:
.Lfe21:
	.size	decl_constant_value,.Lfe21-decl_constant_value
	.align 2
	.p2align 4,,15
.globl default_conversion
	.type	default_conversion,@function
default_conversion:
.LFB22:
	pushq	%r12
.LCFI77:
	pushq	%rbp
.LCFI78:
	pushq	%rbx
.LCFI79:
	movq	8(%rdi), %rbp
	movq	%rdi, %rbx
	movzbl	16(%rbp), %r12d
	movq	%rbp, %rax
	cmpl	$23, %r12d
	je	.L9206
	cmpl	$18, %r12d
	je	.L9206
	movzbl	16(%rdi), %edx
	cmpb	$32, %dl
	je	.L9244
	movl	optimize(%rip), %ecx
	testl	%ecx, %ecx
	je	.L9208
	cmpb	$34, %dl
	je	.L9245
.L9208:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L9242
	cmpb	$115, %dl
	je	.L9246
.L9217:
	movzbl	%dl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L9222
	cmpb	$49, %al
	je	.L9222
	cmpb	$50, %al
	je	.L9222
	cmpb	$101, %al
	je	.L9222
.L9221:
	cmpl	$10, %r12d
	je	.L9247
	cmpb	$39, %dl
	je	.L9248
.L9230:
	movq	%rbp, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9235
	testb	$32, 17(%rbp)
	je	.L9236
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L9237
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%rbp), %r12d
	movzwl	60(%rdx), %ebp
	andl	$511, %r12d
	andl	$511, %ebp
	cmpl	%ebp, %r12d
	je	.L9237
.L9236:
	movq	integer_types+40(%rip), %rdi
.L9243:
	movq	%rbx, %rsi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	convert
.L9237:
	movq	integer_types+48(%rip), %rdi
	jmp	.L9243
.L9235:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9238
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L9238
	movq	global_trees+192(%rip), %rsi
	cmpq	%rsi, 128(%rbp)
	je	.L9249
.L9238:
	cmpl	$5, %r12d
	je	.L9250
	movq	%rbx, %rax
.L9204:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
.L9250:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L9204
.L9249:
	movq	global_trees+200(%rip), %rdi
	jmp	.L9243
	.p2align 6,,7
.L9248:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L9230
	movq	integer_types+40(%rip), %rcx
	movq	40(%rdx), %rdi
	movzwl	60(%rcx), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9230
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9236
	testb	$32, 17(%rbp)
	jne	.L9237
	jmp	.L9236
	.p2align 6,,7
.L9247:
	movq	integer_types+40(%rip), %r11
	movzwl	60(%rbp), %edx
	movl	flag_traditional(%rip), %r10d
	movzwl	60(%r11), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r10d, %r10d
	jne	.L9229
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9228
.L9229:
	testb	$32, 17(%rbp)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9228:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L9243
.L9222:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L9221
.L9246:
	movq	32(%rbx), %rdi
	movq	8(%rbx), %rsi
	cmpq	%rsi, 8(%rdi)
	jne	.L9217
	.p2align 4,,7
.L9220:
	movzbl	16(%rdi), %edx
	movq	%rdi, %rbx
	cmpb	$116, %dl
	jne	.L9251
.L9242:
	movq	32(%rbx), %rdi
	jmp	.L9220
.L9251:
	cmpb	$115, %dl
	jne	.L9217
	movq	32(%rdi), %r9
	movq	8(%rbx), %r8
	cmpq	%r8, 8(%r9)
	movq	%r9, %rdi
	je	.L9220
	jmp	.L9217
.L9245:
	movl	pedantic(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L9212
	cmpb	$51, 48(%rdi)
	je	.L9212
	cmpq	$0, current_function_decl(%rip)
	je	.L9214
	movzbl	17(%rdi), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L9252
.L9214:
	movq	%rbx, %rdi
.L9215:
	movq	%rdi, %rbx
	movq	8(%rdi), %rax
	movzbl	16(%rdi), %edx
.L9212:
	movq	%rax, %rbp
	jmp	.L9208
.L9252:
	movq	104(%rdi), %rax
	testq	%rax, %rax
	je	.L9214
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9214
	testb	$2, 17(%rax)
	je	.L9214
	cmpb	$46, %dl
	movq	%rax, %rdi
	jne	.L9215
	jmp	.L9214
	.p2align 6,,7
.L9244:
	movq	104(%rdi), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L9208
.L9206:
	movq	%rbx, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	jmp	default_function_array_conversion
.LFE22:
.Lfe22:
	.size	default_conversion,.Lfe22-default_conversion
	.section	.rodata.str1.1
.LC91:
	.string	"structure"
.LC90:
	.string	"%s has no member named `%s'"
	.section	.rodata.str1.32
	.align 32
.LC92:
	.string	"request for member `%s' in something not a structure or union"
	.text
	.align 2
	.p2align 4,,15
.globl build_component_ref
	.type	build_component_ref,@function
build_component_ref:
.LFB23:
	pushq	%r15
.LCFI80:
	pushq	%r14
.LCFI81:
	movq	%rsi, %r14
	pushq	%r13
.LCFI82:
	pushq	%r12
.LCFI83:
	movq	%rdi, %r12
	pushq	%rbp
.LCFI84:
	pushq	%rbx
.LCFI85:
	subq	$24, %rsp
.LCFI86:
	movq	8(%rdi), %rcx
	movzbl	16(%rcx), %edx
	movzbl	%dl, %ebx
	movl	%ebx, 20(%rsp)
	cmpb	$47, 16(%rdi)
	je	.L9372
	movl	20(%rsp), %eax
	subl	$20, %eax
	cmpl	$1, %eax
	ja	.L9290
	cmpq	$0, 32(%rcx)
	jne	.L9291
	testb	%dl, %dl
	je	.L9355
.L9296:
	movzbl	%dl, %eax
	subl	$5, %eax
	cmpl	$16, %eax
	ja	.L9305
	mov	%eax, %edx
	jmp	*.L9306(,%rdx,8)
	.section	.rodata
	.align 8
	.align 4
.L9306:
	.quad	.L9301
	.quad	.L9305
	.quad	.L9305
	.quad	.L9305
	.quad	.L9305
	.quad	.L9300
	.quad	.L9305
	.quad	.L9305
	.quad	.L9305
	.quad	.L9305
	.quad	.L9305
	.quad	.L9305
	.quad	.L9305
	.quad	.L9302
	.quad	.L9305
	.quad	.L9298
	.quad	.L9299
	.text
.L9298:
	movl	$.LC62, %esi
.L9297:
	movq	96(%rcx), %rax
	cmpb	$1, 16(%rax)
	je	.L9373
	movq	72(%rax), %rcx
	movl	$.LC71, %edi
	movq	32(%rcx), %rsi
.L9371:
	xorl	%eax, %eax
	call	error
.L9355:
	movq	global_trees(%rip), %rbx
.L9284:
	addq	$24, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L9373:
	movq	32(%rax), %rdx
	movl	$.LC70, %edi
.L9370:
	xorl	%eax, %eax
	call	error
	jmp	.L9355
.L9301:
	movl	$.LC65, %edi
.L9368:
	xorl	%eax, %eax
	call	error
	jmp	.L9355
.L9300:
	movl	$.LC64, %esi
	jmp	.L9297
.L9302:
	movq	24(%rcx), %rax
	testq	%rax, %rax
	je	.L9303
	cmpq	$0, 112(%rax)
	je	.L9374
	movq	8(%rcx), %rcx
	movzbl	16(%rcx), %edx
	jmp	.L9296
.L9374:
	movl	$.LC66, %edi
	jmp	.L9368
.L9303:
	movl	$.LC67, %edi
	jmp	.L9368
	.p2align 6,,7
.L9299:
	movl	$.LC63, %esi
	jmp	.L9297
	.p2align 6,,7
.L9291:
	movq	160(%rcx), %rax
	testq	%rax, %rax
	je	.L9309
	movl	(%rax), %r15d
	xorl	%ebp, %ebp
	leaq	8(%rax), %r13
	movq	24(%rcx), %rbx
	cmpl	$1, %r15d
	jle	.L9311
	.p2align 4,,7
.L9325:
	movl	%r15d, %ebx
	subl	%ebp, %ebx
	incl	%ebx
	sarl	$1, %ebx
	leal	(%rbx,%rbp), %edx
	movslq	%edx,%rsi
	movq	(%r13,%rsi,8), %rbx
	movq	72(%rbx), %rax
	testq	%rax, %rax
	jne	.L9313
	movslq	%ebp,%r8
	leaq	(%r13,%r8,8), %rdx
	movq	(%rdx), %rdi
	cmpq	$0, 72(%rdi)
	jne	.L9359
	.p2align 4,,7
.L9320:
	movq	(%rdx), %rbx
	incl	%ebp
	movq	8(%rbx), %r10
	movzbl	16(%r10), %r9d
	subb	$20, %r9b
	cmpb	$1, %r9b
	jbe	.L9375
.L9314:
	movslq	%ebp,%rcx
	leaq	(%r13,%rcx,8), %rdx
	movq	(%rdx), %r11
	cmpq	$0, 72(%r11)
	je	.L9320
.L9359:
	xorl	%r8d, %r8d
	cmpl	%r15d, %ebp
	jg	.L9319
.L9310:
	movl	%r15d, %edx
	subl	%ebp, %edx
	decl	%edx
	jg	.L9325
.L9311:
	movslq	%ebp,%r15
	movq	(%r13,%r15,8), %rsi
	cmpq	%r14, 72(%rsi)
	je	.L9376
	cmpq	%r14, 72(%rbx)
	je	.L9329
.L9363:
	xorl	%r8d, %r8d
.L9319:
	testq	%r8, %r8
	je	.L9377
	.p2align 4,,7
.L9354:
	movq	32(%r8), %rbp
	movq	8(%rbp), %rsi
	cmpq	global_trees(%rip), %rsi
	je	.L9367
	xorl	%eax, %eax
	movl	$39, %edi
	movq	%r12, %rdx
	movq	%rbp, %rcx
	movq	%r8, 8(%rsp)
	call	build
	movq	8(%rsp), %r8
	movq	%rax, %rbx
	movzbl	17(%r12), %eax
	testb	$16, %al
	jne	.L9350
	testb	$16, 17(%rbp)
	je	.L9349
.L9350:
	orb	$16, 17(%rbx)
	movzbl	17(%r12), %eax
.L9349:
	testb	$8, %al
	jne	.L9352
	testb	$8, 17(%rbp)
	je	.L9351
.L9352:
	orb	$8, 17(%rbx)
.L9351:
	testb	$-128, 18(%rbp)
	jne	.L9378
.L9353:
	movq	(%r8), %r8
	movq	%rbx, %r12
	testq	%r8, %r8
	jne	.L9354
	jmp	.L9284
	.p2align 6,,7
.L9378:
	movq	%rbp, %rdi
	movq	%r8, 8(%rsp)
	call	warn_deprecated_use
	movq	8(%rsp), %r8
	jmp	.L9353
.L9367:
	movq	%rsi, %rbx
	jmp	.L9284
.L9377:
	cmpl	$20, 20(%rsp)
	movl	$.LC91, %esi
	movl	$.LC63, %r12d
	movl	$.LC90, %edi
	movq	32(%r14), %rdx
	cmovne	%r12, %rsi
	jmp	.L9370
.L9329:
	xorl	%edi, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
.L9369:
	call	tree_cons
	movq	%rax, %r8
	jmp	.L9319
.L9376:
	movq	%rsi, %rbx
	jmp	.L9329
	.p2align 6,,7
.L9375:
	movq	%rbx, %rdi
	movq	%r14, %rsi
	call	lookup_field
	testq	%rax, %rax
	je	.L9314
.L9366:
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	jmp	.L9369
	.p2align 6,,7
.L9313:
	cmpq	%r14, %rax
	je	.L9311
	cmpq	%r14, %rax
	jae	.L9323
	movl	%edx, %ebp
	jmp	.L9310
.L9323:
	movl	%edx, %r15d
	jmp	.L9310
.L9309:
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L9363
	.p2align 4,,7
.L9337:
	movq	72(%rbx), %rdx
	testq	%rdx, %rdx
	jne	.L9334
	movq	8(%rbx), %rbp
	movzbl	16(%rbp), %r13d
	subb	$20, %r13b
	cmpb	$1, %r13b
	jbe	.L9379
.L9334:
	cmpq	%r14, %rdx
	je	.L9331
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L9337
	jmp	.L9363
.L9331:
	testq	%rbx, %rbx
	jne	.L9329
	jmp	.L9363
.L9379:
	movq	%rbx, %rdi
	movq	%r14, %rsi
	call	lookup_field
	testq	%rax, %rax
	jne	.L9366
	movq	72(%rbx), %rdx
	jmp	.L9334
	.p2align 6,,7
.L9290:
	movl	20(%rsp), %eax
	testl	%eax, %eax
	je	.L9355
	movl	$.LC92, %edi
	movq	32(%rsi), %rsi
	jmp	.L9371
	.p2align 6,,7
.L9372:
	movq	40(%rdi), %rdi
	call	build_component_ref
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	pedantic_non_lvalue
	movq	32(%r12), %rdx
	movq	8(%rbp), %rsi
	addq	$24, %rsp
	movq	%rax, %rcx
	movl	$47, %edi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	xorl	%eax, %eax
	jmp	build
.L9305:
	movl	$.LC68, %edi
	movl	$163, %esi
	movl	$.LC69, %edx
	call	fancy_abort
.LFE23:
.Lfe23:
	.size	build_component_ref,.Lfe23-build_component_ref
	.section	.rodata.str1.1
.LC95:
	.string	"invalid type argument of `%s'"
	.section	.rodata.str1.32
	.align 32
.LC93:
	.string	"dereferencing pointer to incomplete type"
	.align 32
.LC94:
	.string	"dereferencing `void *' pointer"
	.text
	.align 2
	.p2align 4,,15
.globl build_indirect_ref
	.type	build_indirect_ref,@function
build_indirect_ref:
.LFB24:
	pushq	%r14
.LCFI87:
	movq	%rsi, %r14
	pushq	%r13
.LCFI88:
	pushq	%r12
.LCFI89:
	pushq	%rbp
.LCFI90:
	pushq	%rbx
.LCFI91:
	movq	8(%rdi), %r12
	movq	%rdi, %rbx
	movzbl	16(%r12), %ebp
	movq	%r12, %rax
	cmpl	$23, %ebp
	je	.L9382
	cmpl	$18, %ebp
	je	.L9382
	movzbl	16(%rdi), %ecx
	cmpb	$32, %cl
	je	.L9504
	movl	optimize(%rip), %r9d
	testl	%r9d, %r9d
	je	.L9445
	cmpb	$34, %cl
	je	.L9505
.L9445:
	cmpb	$116, %cl
	movq	%rbx, %rdx
	je	.L9494
	cmpb	$115, %cl
	je	.L9506
.L9454:
	movzbl	%cl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L9459
	cmpb	$49, %al
	je	.L9459
	cmpb	$50, %al
	je	.L9459
	cmpb	$101, %al
	je	.L9459
.L9458:
	cmpl	$10, %ebp
	je	.L9507
	cmpb	$39, %cl
	je	.L9508
.L9467:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9472
	testb	$32, 17(%r12)
	je	.L9473
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L9474
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r12), %r9d
	movzwl	60(%rdx), %r12d
	andl	$511, %r9d
	andl	$511, %r12d
	cmpl	%r12d, %r9d
	je	.L9474
.L9473:
	movq	integer_types+40(%rip), %rdi
.L9500:
	movq	%rbx, %rsi
.L9501:
	call	convert
.L9503:
	movq	%rax, %rbp
.L9443:
	movq	8(%rbp), %rdx
	cmpb	$13, 16(%rdx)
	je	.L9509
	cmpb	$0, 16(%rbp)
	jne	.L9510
.L9484:
	movq	global_trees(%rip), %rbx
.L9380:
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L9510:
	movl	$.LC95, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L9484
.L9509:
	cmpb	$121, 16(%rbp)
	je	.L9511
.L9496:
	movq	8(%rdx), %r12
.L9478:
	movq	128(%r12), %rsi
	movl	$41, %edi
	movq	%rbp, %rdx
	call	build1
	cmpq	$0, 32(%r12)
	movq	%rax, %rbx
	jne	.L9497
	movzbl	16(%r12), %eax
	cmpb	$5, %al
	je	.L9498
	cmpb	$18, %al
	je	.L9480
	movl	$.LC93, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L9484
.L9480:
	cmpb	$5, %al
	je	.L9498
.L9481:
	movzbl	17(%r12), %r10d
	movzbl	17(%rbx), %r8d
	xorl	%edx, %edx
	andb	$16, %r10b
	andb	$-17, %r8b
	orb	%r10b, %r8b
	movb	%r8b, 17(%rbx)
	testb	$8, 17(%r12)
	jne	.L9483
	testb	$1, 17(%rbp)
	jne	.L9483
	movl	flag_volatile(%rip), %edi
	testl	%edi, %edi
	je	.L9482
.L9483:
	movl	$1, %edx
.L9482:
	movzbl	17(%rbx), %r11d
	andb	$-2, %r11b
	orb	%dl, %r11b
	movb	%r11b, 17(%rbx)
	andb	$-9, %r11b
	movzbl	17(%r12), %ebp
	andb	$8, %bpl
	orb	%bpl, %r11b
	movb	%r11b, 17(%rbx)
	jmp	.L9380
.L9498:
	movl	skip_evaluation(%rip), %esi
	testl	%esi, %esi
	jne	.L9481
	movl	$.LC94, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L9481
.L9497:
	movzbl	16(%r12), %eax
	jmp	.L9480
.L9511:
	movl	flag_volatile(%rip), %r14d
	testl	%r14d, %r14d
	jne	.L9496
	movq	32(%rbp), %rax
	movq	8(%rdx), %r12
	cmpq	%r12, 8(%rax)
	jne	.L9478
	movq	%rax, %rbx
	jmp	.L9380
.L9474:
	movq	integer_types+48(%rip), %rdi
	jmp	.L9500
.L9472:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9475
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L9475
	movq	global_trees+192(%rip), %rcx
	cmpq	%rcx, 128(%r12)
	je	.L9512
.L9475:
	cmpl	$5, %ebp
	je	.L9513
.L9476:
	movq	%rbx, %rbp
	jmp	.L9443
.L9513:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L9502:
	movq	global_trees(%rip), %rbp
	jmp	.L9443
.L9512:
	movq	global_trees+200(%rip), %rdi
	jmp	.L9500
	.p2align 6,,7
.L9508:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L9467
	movq	integer_types+40(%rip), %r13
	movq	40(%rdx), %rdi
	movzwl	60(%r13), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9467
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9473
	testb	$32, 17(%r12)
	jne	.L9474
	jmp	.L9473
	.p2align 6,,7
.L9507:
	movq	integer_types+40(%rip), %rbp
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %r11d
	movzwl	60(%rbp), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r11d, %r11d
	jne	.L9466
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9465
.L9466:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9465:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L9500
.L9459:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L9458
.L9506:
	movq	32(%rbx), %rdi
	movq	8(%rbx), %rsi
	cmpq	%rsi, 8(%rdi)
	jne	.L9454
	.p2align 4,,7
.L9457:
	movzbl	16(%rdi), %ecx
	movq	%rdi, %rbx
	cmpb	$116, %cl
	jne	.L9514
.L9494:
	movq	32(%rbx), %rdi
	jmp	.L9457
.L9514:
	cmpb	$115, %cl
	jne	.L9454
	movq	32(%rdi), %r10
	movq	8(%rbx), %r8
	cmpq	%r8, 8(%r10)
	movq	%r10, %rdi
	je	.L9457
	jmp	.L9454
.L9505:
	movl	pedantic(%rip), %edx
	testl	%edx, %edx
	jne	.L9449
	cmpb	$51, 48(%rdi)
	je	.L9449
	cmpq	$0, current_function_decl(%rip)
	je	.L9451
	movzbl	17(%rdi), %ecx
	andb	$24, %cl
	cmpb	$16, %cl
	je	.L9515
.L9451:
	movq	%rbx, %rdi
.L9452:
	movq	%rdi, %rbx
	movq	8(%rdi), %rax
	movzbl	16(%rdi), %ecx
.L9449:
	movq	%rax, %r12
	jmp	.L9445
.L9515:
	movq	104(%rdi), %rax
	testq	%rax, %rax
	je	.L9451
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9451
	testb	$2, 17(%rax)
	je	.L9451
	cmpb	$46, %dl
	movq	%rax, %rdi
	jne	.L9452
	jmp	.L9451
	.p2align 6,,7
.L9504:
	movq	104(%rdi), %rbx
	movzbl	16(%rbx), %ecx
	jmp	.L9445
.L9382:
	movzbl	16(%rbx), %ecx
	movl	%ebp, %edx
	movq	%rbx, %rsi
	xorl	%ebp, %ebp
	cmpb	$116, %cl
	je	.L9490
	cmpb	$115, %cl
	je	.L9516
.L9384:
	movzbl	%cl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L9390
	cmpb	$49, %al
	je	.L9390
	cmpb	$50, %al
	je	.L9390
	cmpb	$101, %al
	je	.L9390
.L9389:
	cmpl	$23, %edx
	je	.L9517
	cmpl	$18, %edx
	jne	.L9476
	movzbl	%cl, %esi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rsi), %eax
	movq	8(%r12), %r13
	cmpb	$114, %al
	je	.L9395
	cmpb	$100, %al
	je	.L9395
.L9394:
	movzbl	17(%r12), %r8d
	movl	$1, %esi
	movl	%r8d, %r9d
	movl	%r8d, %edi
	shrb	$3, %r9b
	shrb	$4, %dil
	andl	$1, %r9d
	andl	%edi, %esi
	movzbl	16(%r12), %edi
	addl	%r9d, %r9d
	orl	%r9d, %esi
	movzbl	62(%r12), %r9d
	movl	%r9d, %r10d
	shrb	$5, %r10b
	andl	$1, %r10d
	sall	$2, %r10d
	orl	%r10d, %esi
	xorl	%r10d, %r10d
	cmpb	$20, %dil
	je	.L9518
.L9398:
	leal	0(,%r10,8), %r12d
	orl	%r12d, %esi
	jne	.L9397
	testl	%edx, %edx
	jne	.L9397
	testl	%r11d, %r11d
	je	.L9396
.L9397:
	movl	%r8d, %r12d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r12b
	movl	%r9d, %ecx
	movl	%r8d, %r10d
	andl	%r12d, %esi
	andl	$1, %ecx
	andl	$1, %r10d
	sall	$2, %ecx
	addl	%r10d, %r10d
	orl	%r10d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L9519
.L9400:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r13
.L9396:
	cmpb	$41, %cl
	je	.L9520
	cmpb	$47, %cl
	je	.L9521
	xorl	%r12d, %r12d
	testl	%ebp, %ebp
	je	.L9522
.L9439:
	movl	flag_isoc99(%rip), %ebp
	testl	%ebp, %ebp
	jne	.L9440
	testl	%r12d, %r12d
	movq	%rbx, %rbp
	je	.L9443
.L9440:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L9523
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L9501
.L9523:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	mark_addressable
	testl	%eax, %eax
	je	.L9502
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%rbp), %ebx
	movl	%eax, %r13d
	andb	$1, %r13b
	addb	%r13b, %r13b
	andb	$-4, %bl
	orb	%r13b, %bl
	movb	%bl, 17(%rbp)
	jmp	.L9443
.L9522:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L9439
.L9521:
	movq	40(%rbx), %rbp
	movq	8(%rbp), %r12
	movzbl	16(%r12), %r13d
	movq	%r12, %rax
	cmpl	$23, %r13d
	je	.L9404
	cmpl	$18, %r13d
	je	.L9404
	movzbl	16(%rbp), %edx
	cmpb	$32, %dl
	je	.L9524
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L9407
	cmpb	$34, %dl
	je	.L9525
.L9407:
	cmpb	$116, %dl
	movq	%rbp, %rcx
	je	.L9492
	cmpb	$115, %dl
	je	.L9526
.L9416:
	movzbl	%dl, %r11d 
	movzbl	tree_code_type(%r11), %eax
	cmpb	$60, %al
	je	.L9421
	cmpb	$49, %al
	je	.L9421
	cmpb	$50, %al
	je	.L9421
	cmpb	$101, %al
	je	.L9421
.L9420:
	cmpl	$10, %r13d
	je	.L9527
	cmpb	$39, %dl
	je	.L9528
.L9429:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9434
	testb	$32, 17(%r12)
	je	.L9435
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L9436
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%r12), %esi
	movzwl	60(%rdi), %r12d
	andl	$511, %esi
	andl	$511, %r12d
	cmpl	%r12d, %esi
	je	.L9436
.L9435:
	movq	integer_types+40(%rip), %rdi
.L9499:
	movq	%rbp, %rsi
	call	convert
.L9405:
	movq	8(%rax), %rsi
	movq	32(%rbx), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L9503
.L9436:
	movq	integer_types+48(%rip), %rdi
	jmp	.L9499
.L9434:
	movl	flag_traditional(%rip), %r8d
	testl	%r8d, %r8d
	je	.L9437
	movl	flag_allow_single_precision(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L9437
	movq	global_trees+192(%rip), %r11
	cmpq	%r11, 128(%r12)
	je	.L9529
.L9437:
	cmpl	$5, %r13d
	je	.L9530
	movq	%rbp, %rax
	jmp	.L9405
.L9530:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L9405
.L9529:
	movq	global_trees+200(%rip), %rdi
	jmp	.L9499
	.p2align 6,,7
.L9528:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L9429
	movq	integer_types+40(%rip), %r9
	movq	40(%rdx), %rdi
	movzwl	60(%r9), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9429
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9435
	testb	$32, 17(%r12)
	jne	.L9436
	jmp	.L9435
	.p2align 6,,7
.L9527:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L9428
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9427
.L9428:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9427:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L9499
.L9421:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L9420
.L9526:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%rsi)
	jne	.L9416
.L9419:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbp
	cmpb	$116, %dl
	jne	.L9531
.L9492:
	movq	32(%rbp), %rsi
	jmp	.L9419
.L9531:
	cmpb	$115, %dl
	jne	.L9416
	movq	32(%rsi), %r8
	movq	8(%rbp), %r10
	cmpq	%r10, 8(%r8)
	movq	%r8, %rsi
	je	.L9419
	jmp	.L9416
.L9525:
	movl	pedantic(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L9411
	cmpb	$51, 48(%rbp)
	je	.L9411
	cmpq	$0, current_function_decl(%rip)
	je	.L9413
	movzbl	17(%rbp), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L9532
.L9413:
	movq	%rbp, %rsi
.L9414:
	movq	%rsi, %rbp
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L9411:
	movq	%rax, %r12
	jmp	.L9407
.L9532:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L9413
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9413
	testb	$2, 17(%rax)
	je	.L9413
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L9414
	jmp	.L9413
	.p2align 6,,7
.L9524:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %edx
	jmp	.L9407
.L9404:
	movq	%rbp, %rdi
	call	default_function_array_conversion
	jmp	.L9405
.L9520:
	movq	72(%r13), %rdi
	movq	32(%rbx), %rsi
	jmp	.L9501
.L9519:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L9400
.L9518:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L9398
.L9395:
	movzbl	17(%rbx), %r8d
	movl	$1, %r11d
	movl	%r8d, %edx
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	%r8d, %r11d
	andl	$1, %edx
	jmp	.L9394
.L9517:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L9503
.L9390:
	movl	24(%rsi), %eax
	movl	%eax, 24(%rbx)
	jmp	.L9389
.L9516:
	movq	32(%rbx), %rdi
	cmpq	%r12, 8(%rdi)
	jne	.L9384
	.p2align 4,,7
.L9388:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rdi, %rbx
	movzbl	16(%rdi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L9533
.L9490:
	movq	32(%rbx), %rdi
	jmp	.L9388
.L9533:
	cmpb	$115, %cl
	jne	.L9384
	movq	32(%rdi), %rdi
	movq	8(%rbx), %r8
	cmpq	%r8, 8(%rdi)
	je	.L9388
	jmp	.L9384
.LFE24:
.Lfe24:
	.size	build_indirect_ref,.Lfe24-build_indirect_ref
	.section	.rodata.str1.32
	.align 32
.LC102:
	.string	"subscripted value is neither array nor pointer"
	.align 32
.LC98:
	.string	"array subscript is not an integer"
	.section	.rodata.str1.1
.LC103:
	.string	"array indexing"
.LC101:
	.string	"subscript has type `char'"
	.section	.rodata.str1.32
	.align 32
.LC100:
	.string	"ISO C89 forbids subscripting non-lvalue array"
	.align 32
.LC99:
	.string	"ISO C forbids subscripting `register' array"
	.align 32
.LC97:
	.string	"array subscript has type `char'"
	.align 32
.LC96:
	.string	"subscript missing in array reference"
	.text
	.align 2
	.p2align 4,,15
.globl build_array_ref
	.type	build_array_ref,@function
build_array_ref:
.LFB25:
	pushq	%r15
.LCFI92:
	pushq	%r14
.LCFI93:
	pushq	%r13
.LCFI94:
	pushq	%r12
.LCFI95:
	movq	%rsi, %r12
	pushq	%rbp
.LCFI96:
	pushq	%rbx
.LCFI97:
	movq	%rdi, %rbx
	subq	$8, %rsp
.LCFI98:
	testq	%rsi, %rsi
	je	.L10122
	movq	8(%rdi), %rbp
	movq	global_trees(%rip), %rax
	cmpq	%rax, %rbp
	movq	%rbp, %rsi
	je	.L9655
	movq	8(%r12), %r13
	cmpq	%rax, %r13
	je	.L9655
	cmpb	$18, 16(%rbp)
	je	.L10123
	movzbl	16(%rdi), %ecx
.L9538:
	movzbl	16(%rsi), %r13d
	movq	%rsi, %rax
	cmpl	$23, %r13d
	je	.L9672
	cmpl	$18, %r13d
	je	.L9672
	cmpb	$32, %cl
	je	.L10124
	movl	optimize(%rip), %r10d
	testl	%r10d, %r10d
	je	.L9735
	cmpb	$34, %cl
	je	.L10125
.L9735:
	cmpb	$116, %cl
	movq	%rbx, %rdx
	je	.L10066
	cmpb	$115, %cl
	je	.L10126
.L9744:
	movzbl	%cl, %r9d 
	movzbl	tree_code_type(%r9), %eax
	cmpb	$60, %al
	je	.L9749
	cmpb	$49, %al
	je	.L9749
	cmpb	$50, %al
	je	.L9749
	cmpb	$101, %al
	je	.L9749
.L9748:
	cmpl	$10, %r13d
	je	.L10127
	cmpb	$39, %cl
	je	.L10128
.L9757:
	movq	%rbp, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9762
	testb	$32, 17(%rbp)
	je	.L9763
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L9764
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%rbp), %r10d
	movzwl	60(%rdi), %ebp
	andl	$511, %r10d
	andl	$511, %ebp
	cmpl	%ebp, %r10d
	je	.L9764
.L9763:
	movq	integer_types+40(%rip), %rdi
.L10101:
	movq	%rbx, %rsi
.L10102:
	call	convert
.L10104:
	movq	%rax, %r15
.L9733:
	movq	8(%r12), %r13
	movq	%r12, %rbx
	movzbl	16(%r13), %r14d
	cmpl	$23, %r14d
	je	.L9768
	cmpl	$18, %r14d
	je	.L9768
	movzbl	16(%r12), %eax
	cmpb	$32, %al
	je	.L10129
	movl	optimize(%rip), %ecx
	testl	%ecx, %ecx
	je	.L9831
	cmpb	$34, %al
	je	.L10130
.L9831:
	movzbl	16(%rbx), %ecx
	movq	%rbx, %rdx
	cmpb	$116, %cl
	je	.L10073
	cmpb	$115, %cl
	je	.L10131
.L9840:
	movzbl	%cl, %r10d 
	movzbl	tree_code_type(%r10), %eax
	cmpb	$60, %al
	je	.L9845
	cmpb	$49, %al
	je	.L9845
	cmpb	$50, %al
	je	.L9845
	cmpb	$101, %al
	je	.L9845
.L9844:
	cmpl	$10, %r14d
	je	.L10132
	cmpb	$39, %cl
	je	.L10133
.L9853:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9858
	testb	$32, 17(%r13)
	je	.L9859
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L9860
	movq	integer_types+40(%rip), %r11
	movzwl	60(%r13), %r14d
	movzwl	60(%r11), %r13d
	andl	$511, %r14d
	andl	$511, %r13d
	cmpl	%r13d, %r14d
	je	.L9860
.L9859:
	movq	integer_types+40(%rip), %rdi
.L10106:
	movq	%rbx, %rsi
.L10107:
	call	convert
.L10109:
	movq	%rax, %rbp
.L9829:
	movl	warn_char_subscripts(%rip), %eax
	testl	%eax, %eax
	je	.L9863
	movq	8(%r12), %rax
	cmpb	$6, 16(%rax)
	je	.L10134
.L9863:
	movq	8(%r15), %rbx
	cmpb	$6, 16(%rbx)
	je	.L10135
	movq	%rbp, %rdx
	movq	%r15, %rbp
.L9864:
	cmpq	global_trees(%rip), %rbp
	je	.L9534
	movq	8(%rbp), %rax
	cmpb	$13, 16(%rax)
	je	.L10136
.L9867:
	movl	$.LC102, %edi
.L10119:
	xorl	%eax, %eax
	call	error
.L10120:
	movq	global_trees(%rip), %rbp
.L9534:
	addq	$8, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L10136:
	movq	8(%rax), %r15
	cmpb	$23, 16(%r15)
	je	.L9867
	movq	8(%rdx), %r9
	cmpb	$6, 16(%r9)
	je	.L9868
.L10121:
	movl	$.LC98, %edi
	jmp	.L10119
.L9868:
	movq	%rbp, %rsi
	xorl	%ecx, %ecx
	movl	$59, %edi
	call	build_binary_op
	movq	8(%rax), %r12
	movq	%rax, %rbx
	movzbl	16(%r12), %ebp
	movq	%r12, %rax
	cmpl	$23, %ebp
	je	.L9870
	cmpl	$18, %ebp
	je	.L9870
	movzbl	16(%rbx), %ecx
	cmpb	$32, %cl
	je	.L10137
	movl	optimize(%rip), %esi
	testl	%esi, %esi
	je	.L9993
	cmpb	$34, %cl
	je	.L10138
.L9993:
	cmpb	$116, %cl
	movq	%rbx, %rdx
	je	.L10083
	cmpb	$115, %cl
	je	.L10139
.L10002:
	movzbl	%cl, %r15d 
	movzbl	tree_code_type(%r15), %eax
	cmpb	$60, %al
	je	.L10007
	cmpb	$49, %al
	je	.L10007
	cmpb	$50, %al
	je	.L10007
	cmpb	$101, %al
	je	.L10007
.L10006:
	cmpl	$10, %ebp
	je	.L10140
	cmpb	$39, %cl
	je	.L10141
.L10015:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10020
	testb	$32, 17(%r12)
	je	.L10021
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L10022
	movzwl	60(%r12), %esi
	movq	integer_types+40(%rip), %r12
	movzwl	60(%r12), %edi
	andl	$511, %esi
	andl	$511, %edi
	cmpl	%edi, %esi
	je	.L10022
.L10021:
	movq	integer_types+40(%rip), %rdi
.L10115:
	movq	%rbx, %rsi
.L10116:
	call	convert
.L10118:
	movq	%rax, %rbp
.L9991:
	movq	8(%rbp), %rdx
	cmpb	$13, 16(%rdx)
	je	.L10142
	cmpb	$0, 16(%rbp)
	jne	.L10143
.L10033:
	movq	global_trees(%rip), %rbx
.L10027:
	movq	%rbx, %rbp
	jmp	.L9534
.L10143:
	movl	$.LC95, %edi
	movl	$.LC103, %esi
	xorl	%eax, %eax
	call	error
	jmp	.L10033
.L10142:
	cmpb	$121, 16(%rbp)
	je	.L10144
.L10085:
	movq	8(%rdx), %r12
.L10026:
	movq	128(%r12), %rsi
	movl	$41, %edi
	movq	%rbp, %rdx
	call	build1
	cmpq	$0, 32(%r12)
	movq	%rax, %rbx
	jne	.L10086
	movzbl	16(%r12), %eax
	cmpb	$5, %al
	je	.L10087
	cmpb	$18, %al
	je	.L10029
	movl	$.LC93, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L10033
.L10029:
	cmpb	$5, %al
	je	.L10087
.L10030:
	movzbl	17(%r12), %r15d
	movzbl	17(%rbx), %r11d
	xorl	%edx, %edx
	andb	$16, %r15b
	andb	$-17, %r11b
	orb	%r15b, %r11b
	movb	%r11b, 17(%rbx)
	testb	$8, 17(%r12)
	jne	.L10032
	testb	$1, 17(%rbp)
	jne	.L10032
	movl	flag_volatile(%rip), %ebp
	testl	%ebp, %ebp
	je	.L10031
.L10032:
	movl	$1, %edx
.L10031:
	movzbl	17(%rbx), %ecx
	andb	$-2, %cl
	orb	%dl, %cl
	movb	%cl, 17(%rbx)
	andb	$-9, %cl
	movzbl	17(%r12), %r10d
	andb	$8, %r10b
	orb	%r10b, %cl
	movb	%cl, 17(%rbx)
	jmp	.L10027
.L10087:
	movl	skip_evaluation(%rip), %r14d
	testl	%r14d, %r14d
	jne	.L10030
	movl	$.LC94, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L10030
.L10086:
	movzbl	16(%r12), %eax
	jmp	.L10029
.L10144:
	movl	flag_volatile(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L10085
	movq	32(%rbp), %rax
	movq	8(%rdx), %r12
	cmpq	%r12, 8(%rax)
	jne	.L10026
	movq	%rax, %rbx
	jmp	.L10027
	.p2align 6,,7
.L10022:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10115
.L10020:
	movl	flag_traditional(%rip), %r9d
	testl	%r9d, %r9d
	je	.L10023
	movl	flag_allow_single_precision(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L10023
	movq	global_trees+192(%rip), %r8
	cmpq	%r8, 128(%r12)
	je	.L10145
.L10023:
	cmpl	$5, %ebp
	je	.L10146
.L10024:
	movq	%rbx, %rbp
	jmp	.L9991
.L10146:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L10117:
	movq	global_trees(%rip), %rbp
	jmp	.L9991
.L10145:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10115
	.p2align 6,,7
.L10141:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L10015
	movq	integer_types+40(%rip), %r10
	movq	40(%rdx), %rdi
	movzwl	60(%r10), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10015
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10021
	testb	$32, 17(%r12)
	jne	.L10022
	jmp	.L10021
	.p2align 6,,7
.L10140:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %ebp
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ebp, %ebp
	jne	.L10014
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10013
.L10014:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10013:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10115
.L10007:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L10006
.L10139:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r8
	cmpq	%r8, 8(%rsi)
	jne	.L10002
.L10005:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %rbx
	cmpb	$116, %cl
	jne	.L10147
.L10083:
	movq	32(%rbx), %rsi
	jmp	.L10005
.L10147:
	cmpb	$115, %cl
	jne	.L10002
	movq	32(%rsi), %r11
	movq	8(%rbx), %r14
	cmpq	%r14, 8(%r11)
	movq	%r11, %rsi
	je	.L10005
	jmp	.L10002
.L10138:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L9997
	cmpb	$51, 48(%rbx)
	je	.L9997
	cmpq	$0, current_function_decl(%rip)
	je	.L9999
	movzbl	17(%rbx), %r9d
	andb	$24, %r9b
	cmpb	$16, %r9b
	je	.L10148
.L9999:
	movq	%rbx, %rsi
.L10000:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %ecx
.L9997:
	movq	%rax, %r12
	jmp	.L9993
.L10148:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L9999
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9999
	testb	$2, 17(%rax)
	je	.L9999
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L10000
	jmp	.L9999
	.p2align 6,,7
.L10137:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %ecx
	jmp	.L9993
.L9870:
	movzbl	16(%rbx), %ecx
	movl	%ebp, %edi
	movq	%rbx, %rdx
	xorl	%ebp, %ebp
	cmpb	$116, %cl
	je	.L10075
	cmpb	$115, %cl
	je	.L10149
.L9872:
	movzbl	%cl, %r10d 
	movzbl	tree_code_type(%r10), %eax
	cmpb	$60, %al
	je	.L9878
	cmpb	$49, %al
	je	.L9878
	cmpb	$50, %al
	je	.L9878
	cmpb	$101, %al
	je	.L9878
.L9877:
	cmpl	$23, %edi
	je	.L10150
	cmpl	$18, %edi
	jne	.L10024
	movzbl	%cl, %edi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%r12), %r13
	cmpb	$114, %al
	je	.L9883
	cmpb	$100, %al
	je	.L9883
.L9882:
	movzbl	17(%r12), %r8d
	movl	$1, %r9d
	movzbl	16(%r12), %edi
	xorl	%esi, %esi
	movl	%r8d, %r10d
	movl	%r8d, %r15d
	shrb	$4, %r10b
	shrb	$3, %r15b
	andl	%r10d, %r9d
	andl	$1, %r15d
	movzbl	62(%r12), %r10d
	addl	%r15d, %r15d
	orl	%r15d, %r9d
	movl	%r10d, %r14d
	shrb	$5, %r14b
	andl	$1, %r14d
	sall	$2, %r14d
	orl	%r14d, %r9d
	cmpb	$20, %dil
	je	.L10151
.L9886:
	leal	0(,%rsi,8), %r12d
	orl	%r12d, %r9d
	jne	.L9885
	testl	%edx, %edx
	jne	.L9885
	testl	%r11d, %r11d
	je	.L9884
.L9885:
	movl	%r8d, %r14d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r14b
	movl	%r10d, %ecx
	movl	%r8d, %r9d
	andl	%r14d, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L10152
.L9888:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r13
.L9884:
	cmpb	$41, %cl
	je	.L10153
	cmpb	$47, %cl
	je	.L10154
	xorl	%r12d, %r12d
	testl	%ebp, %ebp
	je	.L10155
.L9987:
	movl	flag_isoc99(%rip), %edi
	testl	%edi, %edi
	jne	.L9988
	testl	%r12d, %r12d
	movq	%rbx, %rbp
	je	.L9991
.L9988:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L10156
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L10116
.L10156:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	mark_addressable
	testl	%eax, %eax
	je	.L10117
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%rbp), %ebx
	movl	%eax, %r12d
	andb	$1, %r12b
	addb	%r12b, %r12b
	andb	$-4, %bl
	orb	%r12b, %bl
	movb	%bl, 17(%rbp)
	jmp	.L9991
	.p2align 6,,7
.L10155:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L9987
.L10154:
	movq	40(%rbx), %r12
	movq	8(%r12), %rbp
	movzbl	16(%rbp), %r13d
	movq	%rbp, %rax
	cmpl	$23, %r13d
	je	.L9892
	cmpl	$18, %r13d
	je	.L9892
	movzbl	16(%r12), %ecx
	cmpb	$32, %cl
	je	.L10157
	movl	optimize(%rip), %r14d
	testl	%r14d, %r14d
	je	.L9955
	cmpb	$34, %cl
	je	.L10158
.L9955:
	cmpb	$116, %cl
	movq	%r12, %rdx
	je	.L10081
	cmpb	$115, %cl
	je	.L10159
.L9964:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L9969
	cmpb	$49, %al
	je	.L9969
	cmpb	$50, %al
	je	.L9969
	cmpb	$101, %al
	je	.L9969
.L9968:
	cmpl	$10, %r13d
	je	.L10160
	cmpb	$39, %cl
	je	.L10161
.L9977:
	movq	%rbp, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9982
	testb	$32, 17(%rbp)
	je	.L9983
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L9984
	movq	integer_types+40(%rip), %r11
	movzwl	60(%rbp), %r14d
	movzwl	60(%r11), %ebp
	andl	$511, %r14d
	andl	$511, %ebp
	cmpl	%ebp, %r14d
	je	.L9984
.L9983:
	movq	integer_types+40(%rip), %rdi
.L10111:
	movq	%r12, %rsi
.L10112:
	call	convert
.L10114:
	movq	%rax, %rbp
.L9953:
	movq	8(%rbp), %rsi
	movq	32(%rbx), %rdx
	movl	$47, %edi
	movq	%rbp, %rcx
	xorl	%eax, %eax
	call	build
	jmp	.L10118
.L9984:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10111
.L9982:
	movl	flag_traditional(%rip), %ecx
	testl	%ecx, %ecx
	je	.L9985
	movl	flag_allow_single_precision(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L9985
	movq	global_trees+192(%rip), %r10
	cmpq	%r10, 128(%rbp)
	je	.L10162
.L9985:
	cmpl	$5, %r13d
	je	.L10163
.L9986:
	movq	%r12, %rbp
	jmp	.L9953
.L10163:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L10113:
	movq	global_trees(%rip), %rbp
	jmp	.L9953
.L10162:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10111
.L10161:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L9977
	movq	integer_types+40(%rip), %r8
	movq	40(%rdx), %rdi
	movzwl	60(%r8), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9977
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9983
	testb	$32, 17(%rbp)
	jne	.L9984
	jmp	.L9983
.L10160:
	movq	integer_types+40(%rip), %r9
	movzwl	60(%rbp), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%r9), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L9976
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9975
.L9976:
	testb	$32, 17(%rbp)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9975:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10111
.L9969:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L9968
.L10159:
	movq	32(%r12), %rsi
	movq	8(%r12), %r15
	cmpq	%r15, 8(%rsi)
	jne	.L9964
.L9967:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r12
	cmpb	$116, %cl
	jne	.L10164
.L10081:
	movq	32(%r12), %rsi
	jmp	.L9967
.L10164:
	cmpb	$115, %cl
	jne	.L9964
	movq	32(%rsi), %rdi
	movq	8(%r12), %r10
	cmpq	%r10, 8(%rdi)
	movq	%rdi, %rsi
	je	.L9967
	jmp	.L9964
.L10158:
	movl	pedantic(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L9959
	cmpb	$51, 48(%r12)
	je	.L9959
	cmpq	$0, current_function_decl(%rip)
	je	.L9961
	movzbl	17(%r12), %ecx
	andb	$24, %cl
	cmpb	$16, %cl
	je	.L10165
.L9961:
	movq	%r12, %rsi
.L9962:
	movq	%rsi, %r12
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %ecx
.L9959:
	movq	%rax, %rbp
	jmp	.L9955
.L10165:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L9961
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9961
	testb	$2, 17(%rax)
	je	.L9961
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L9962
	jmp	.L9961
.L10157:
	movq	104(%r12), %r12
	movzbl	16(%r12), %ecx
	jmp	.L9955
	.p2align 6,,7
.L9892:
	movzbl	16(%r12), %ecx
	xorl	%r15d, %r15d
	movl	%r13d, %edi
	movq	%r12, %rdx
	cmpb	$116, %cl
	je	.L10077
	cmpb	$115, %cl
	je	.L10166
.L9894:
	movzbl	%cl, %r11d 
	movzbl	tree_code_type(%r11), %eax
	cmpb	$60, %al
	je	.L9900
	cmpb	$49, %al
	je	.L9900
	cmpb	$50, %al
	je	.L9900
	cmpb	$101, %al
	je	.L9900
.L9899:
	cmpl	$23, %edi
	je	.L10167
	cmpl	$18, %edi
	jne	.L9986
	movzbl	%cl, %edi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%rbp), %r14
	cmpb	$114, %al
	je	.L9905
	cmpb	$100, %al
	je	.L9905
.L9904:
	movzbl	17(%rbp), %r8d
	movl	$1, %r9d
	xorl	%esi, %esi
	movl	%r8d, %r10d
	movl	%r8d, %edi
	shrb	$3, %r10b
	shrb	$4, %dil
	andl	$1, %r10d
	andl	%edi, %r9d
	movzbl	16(%rbp), %edi
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rbp), %r10d
	movl	%r10d, %r13d
	shrb	$5, %r13b
	andl	$1, %r13d
	sall	$2, %r13d
	orl	%r13d, %r9d
	cmpb	$20, %dil
	je	.L10168
.L9908:
	leal	0(,%rsi,8), %ebp
	orl	%ebp, %r9d
	jne	.L9907
	testl	%edx, %edx
	jne	.L9907
	testl	%r11d, %r11d
	je	.L9906
.L9907:
	movl	%r8d, %r13d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r13b
	movl	%r10d, %ecx
	movl	%r8d, %r9d
	andl	%r13d, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L10169
.L9910:
	leal	0(,%rcx,8), %r8d
	movq	%r14, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%r12), %ecx
	movq	%rax, %r14
.L9906:
	cmpb	$41, %cl
	je	.L10170
	cmpb	$47, %cl
	je	.L10171
	xorl	%r13d, %r13d
	testl	%r15d, %r15d
	je	.L10172
.L9949:
	movl	flag_isoc99(%rip), %ebp
	testl	%ebp, %ebp
	jne	.L9950
	testl	%r13d, %r13d
	movq	%r12, %rbp
	je	.L9953
.L9950:
	movq	%r14, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r12)
	movq	%rax, %rbp
	je	.L10173
	movl	$121, %edi
	movq	%r12, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L10112
.L10173:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r12, %rdx
	call	build1
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	mark_addressable
	testl	%eax, %eax
	je	.L10113
	movq	%r12, %rdi
	call	staticp
	movzbl	17(%rbp), %r12d
	movl	%eax, %r8d
	andb	$1, %r8b
	addb	%r8b, %r8b
	andb	$-4, %r12b
	orb	%r8b, %r12b
	movb	%r12b, 17(%rbp)
	jmp	.L9953
.L10172:
	movq	%r12, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r13d
	jmp	.L9949
.L10171:
	movq	40(%r12), %rbp
	movq	8(%rbp), %r13
	movzbl	16(%r13), %r14d
	movq	%r13, %rax
	cmpl	$23, %r14d
	je	.L9914
	cmpl	$18, %r14d
	je	.L9914
	movzbl	16(%rbp), %edx
	cmpb	$32, %dl
	je	.L10174
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L9917
	cmpb	$34, %dl
	je	.L10175
.L9917:
	cmpb	$116, %dl
	movq	%rbp, %rcx
	je	.L10079
	cmpb	$115, %dl
	je	.L10176
.L9926:
	movzbl	%dl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L9931
	cmpb	$49, %al
	je	.L9931
	cmpb	$50, %al
	je	.L9931
	cmpb	$101, %al
	je	.L9931
.L9930:
	cmpl	$10, %r14d
	je	.L10177
	cmpb	$39, %dl
	je	.L10178
.L9939:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9944
	testb	$32, 17(%r13)
	je	.L9945
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L9946
	movq	integer_types+40(%rip), %rsi
	movzwl	60(%r13), %r15d
	movzwl	60(%rsi), %r13d
	andl	$511, %r15d
	andl	$511, %r13d
	cmpl	%r13d, %r15d
	je	.L9946
.L9945:
	movq	integer_types+40(%rip), %rdi
.L10110:
	movq	%rbp, %rsi
	call	convert
.L9915:
	movq	8(%rax), %rsi
	movq	32(%r12), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L10114
.L9946:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10110
.L9944:
	movl	flag_traditional(%rip), %r10d
	testl	%r10d, %r10d
	je	.L9947
	movl	flag_allow_single_precision(%rip), %edi
	testl	%edi, %edi
	jne	.L9947
	movq	global_trees+192(%rip), %r9
	cmpq	%r9, 128(%r13)
	je	.L10179
.L9947:
	cmpl	$5, %r14d
	je	.L10180
	movq	%rbp, %rax
	jmp	.L9915
.L10180:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L9915
.L10179:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10110
.L10178:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L9939
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9939
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9945
	testb	$32, 17(%r13)
	jne	.L9946
	jmp	.L9945
.L10177:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r14d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r14d, %r14d
	jne	.L9938
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9937
.L9938:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9937:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10110
.L9931:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L9930
.L10176:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L9926
.L9929:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbp
	cmpb	$116, %dl
	jne	.L10181
.L10079:
	movq	32(%rbp), %rsi
	jmp	.L9929
.L10181:
	cmpb	$115, %dl
	jne	.L9926
	movq	32(%rsi), %r9
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%r9)
	movq	%r9, %rsi
	je	.L9929
	jmp	.L9926
.L10175:
	movl	pedantic(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L9921
	cmpb	$51, 48(%rbp)
	je	.L9921
	cmpq	$0, current_function_decl(%rip)
	je	.L9923
	movzbl	17(%rbp), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L10182
.L9923:
	movq	%rbp, %rsi
.L9924:
	movq	%rsi, %rbp
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L9921:
	movq	%rax, %r13
	jmp	.L9917
.L10182:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L9923
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9923
	testb	$2, 17(%rax)
	je	.L9923
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L9924
	jmp	.L9923
.L10174:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %edx
	jmp	.L9917
.L9914:
	movq	%rbp, %rdi
	call	default_function_array_conversion
	jmp	.L9915
.L10170:
	movq	72(%r14), %rdi
	movq	32(%r12), %rsi
	jmp	.L10112
.L10169:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L9910
.L10168:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L9908
.L9905:
	movzbl	17(%r12), %esi
	movl	$1, %r11d
	movl	%esi, %edx
	shrb	$3, %sil
	shrb	$4, %dl
	andl	%esi, %r11d
	andl	$1, %edx
	jmp	.L9904
.L10167:
	movl	$121, %edi
	movq	%r12, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10114
.L9900:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L9899
.L10166:
	movq	32(%r12), %rsi
	cmpq	%rbp, 8(%rsi)
	jne	.L9894
.L9898:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r12
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r15d
	cmpb	$116, %cl
	jne	.L10183
.L10077:
	movq	32(%r12), %rsi
	jmp	.L9898
.L10183:
	cmpb	$115, %cl
	jne	.L9894
	movq	32(%rsi), %rsi
	movq	8(%r12), %r13
	cmpq	%r13, 8(%rsi)
	je	.L9898
	jmp	.L9894
	.p2align 6,,7
.L10153:
	movq	72(%r13), %rdi
	movq	32(%rbx), %rsi
	jmp	.L10116
.L10152:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L9888
.L10151:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L9886
.L9883:
	movzbl	17(%rbx), %esi
	movl	$1, %r11d
	movl	%esi, %edx
	shrb	$3, %sil
	shrb	$4, %dl
	andl	%esi, %r11d
	andl	$1, %edx
	jmp	.L9882
.L10150:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10118
.L9878:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L9877
.L10149:
	movq	32(%rbx), %rsi
	cmpq	%r12, 8(%rsi)
	jne	.L9872
.L9876:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbx
	movzbl	16(%rsi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L10184
.L10075:
	movq	32(%rbx), %rsi
	jmp	.L9876
.L10184:
	cmpb	$115, %cl
	jne	.L9872
	movq	32(%rsi), %rsi
	movq	8(%rbx), %r8
	cmpq	%r8, 8(%rsi)
	je	.L9876
	jmp	.L9872
	.p2align 6,,7
.L10135:
	movq	%r15, %rdx
	jmp	.L9864
.L10134:
	movq	integer_types(%rip), %r12
	cmpq	%r12, 128(%rax)
	jne	.L9863
	movl	$.LC101, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L9863
.L9860:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10106
.L9858:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9861
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L9861
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%r13)
	je	.L10185
.L9861:
	cmpl	$5, %r14d
	je	.L10186
.L9862:
	movq	%rbx, %rbp
	jmp	.L9829
.L10186:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L10108:
	movq	global_trees(%rip), %rbp
	jmp	.L9829
.L10185:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10106
	.p2align 6,,7
.L10133:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L9853
	movq	integer_types+40(%rip), %rcx
	movq	40(%rdx), %rdi
	movzwl	60(%rcx), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9853
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9859
	testb	$32, 17(%r13)
	jne	.L9860
	jmp	.L9859
	.p2align 6,,7
.L10132:
	movq	integer_types+40(%rip), %rsi
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %ebp
	movzwl	60(%rsi), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ebp, %ebp
	jne	.L9852
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9851
.L9852:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9851:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10106
.L9845:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L9844
.L10131:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rsi)
	jne	.L9840
	.p2align 4,,7
.L9843:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %rbx
	cmpb	$116, %cl
	jne	.L10187
.L10073:
	movq	32(%rbx), %rsi
	jmp	.L9843
.L10187:
	cmpb	$115, %cl
	jne	.L9840
	movq	32(%rsi), %r8
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%r8)
	movq	%r8, %rsi
	je	.L9843
	jmp	.L9840
.L10130:
	movl	pedantic(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L9834
	cmpb	$51, 48(%r12)
	je	.L9834
	cmpq	$0, current_function_decl(%rip)
	je	.L9837
	movzbl	17(%r12), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L10188
.L9837:
	movq	%r12, %rsi
.L9838:
	movq	%rsi, %rbx
.L9835:
	movq	8(%rbx), %r13
	jmp	.L9831
.L10188:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L9837
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9837
	testb	$2, 17(%rax)
	je	.L9837
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L9838
	jmp	.L9837
	.p2align 6,,7
.L9834:
	movq	%r12, %rbx
	jmp	.L9835
.L10129:
	movq	104(%r12), %rbx
	jmp	.L9831
.L9768:
	movzbl	16(%r12), %edx
	xorl	%ebp, %ebp
	movq	%r12, %rbx
	cmpb	$116, %dl
	je	.L10043
	cmpb	$115, %dl
	je	.L10189
	movzbl	16(%r12), %ecx
.L9770:
	movzbl	%cl, %r11d 
	movzbl	tree_code_type(%r11), %eax
	cmpb	$60, %al
	je	.L9776
	cmpb	$49, %al
	je	.L9776
	cmpb	$50, %al
	je	.L9776
	cmpb	$101, %al
	je	.L9776
.L9775:
	cmpl	$23, %r14d
	je	.L10190
	cmpl	$18, %r14d
	jne	.L9862
	movzbl	%cl, %r10d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r10), %eax
	movq	8(%r13), %r14
	cmpb	$114, %al
	je	.L9781
	cmpb	$100, %al
	je	.L9781
.L9780:
	movzbl	17(%r13), %r8d
	movl	$1, %esi
	movl	%r8d, %r9d
	movl	%r8d, %edi
	shrb	$3, %r9b
	shrb	$4, %dil
	andl	$1, %r9d
	andl	%edi, %esi
	movzbl	16(%r13), %edi
	addl	%r9d, %r9d
	orl	%r9d, %esi
	movzbl	62(%r13), %r9d
	movl	%r9d, %r10d
	shrb	$5, %r10b
	andl	$1, %r10d
	sall	$2, %r10d
	orl	%r10d, %esi
	xorl	%r10d, %r10d
	cmpb	$20, %dil
	je	.L10191
.L9784:
	leal	0(,%r10,8), %r13d
	orl	%r13d, %esi
	jne	.L9783
	testl	%edx, %edx
	jne	.L9783
	testl	%r11d, %r11d
	je	.L9782
.L9783:
	movl	%r8d, %r13d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r13b
	movl	%r9d, %ecx
	movl	%r8d, %r10d
	andl	%r13d, %esi
	andl	$1, %ecx
	andl	$1, %r10d
	sall	$2, %ecx
	addl	%r10d, %r10d
	orl	%r10d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L10192
.L9786:
	leal	0(,%rcx,8), %r8d
	movq	%r14, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r14
.L9782:
	cmpb	$41, %cl
	je	.L10193
	cmpb	$47, %cl
	je	.L10194
	xorl	%r13d, %r13d
	testl	%ebp, %ebp
	je	.L10195
.L9825:
	movl	flag_isoc99(%rip), %ebp
	testl	%ebp, %ebp
	jne	.L9826
	testl	%r13d, %r13d
	movq	%rbx, %rbp
	je	.L9829
.L9826:
	movq	%r14, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L10196
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L10107
.L10196:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	mark_addressable
	testl	%eax, %eax
	je	.L10108
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%rbp), %ebx
	movl	%eax, %r14d
	andb	$1, %r14b
	addb	%r14b, %r14b
	andb	$-4, %bl
	orb	%r14b, %bl
	movb	%bl, 17(%rbp)
	jmp	.L9829
.L10195:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r13d
	jmp	.L9825
.L10194:
	movq	40(%rbx), %rbp
	movq	8(%rbp), %r13
	movzbl	16(%r13), %r14d
	movq	%r13, %rax
	cmpl	$23, %r14d
	je	.L9790
	cmpl	$18, %r14d
	je	.L9790
	movzbl	16(%rbp), %edx
	cmpb	$32, %dl
	je	.L10197
	movl	optimize(%rip), %esi
	testl	%esi, %esi
	je	.L9793
	cmpb	$34, %dl
	je	.L10198
.L9793:
	cmpb	$116, %dl
	movq	%rbp, %rcx
	je	.L10071
	cmpb	$115, %dl
	je	.L10199
.L9802:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L9807
	cmpb	$49, %al
	je	.L9807
	cmpb	$50, %al
	je	.L9807
	cmpb	$101, %al
	je	.L9807
.L9806:
	cmpl	$10, %r14d
	je	.L10200
	cmpb	$39, %dl
	je	.L10201
.L9815:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9820
	testb	$32, 17(%r13)
	je	.L9821
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L9822
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%r13), %r9d
	movzwl	60(%rdi), %r13d
	andl	$511, %r9d
	andl	$511, %r13d
	cmpl	%r13d, %r9d
	je	.L9822
.L9821:
	movq	integer_types+40(%rip), %rdi
.L10105:
	movq	%rbp, %rsi
	call	convert
.L9791:
	movq	8(%rax), %rsi
	movq	32(%rbx), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L10109
.L9822:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10105
.L9820:
	movl	flag_traditional(%rip), %r8d
	testl	%r8d, %r8d
	je	.L9823
	movl	flag_allow_single_precision(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L9823
	movq	global_trees+192(%rip), %rsi
	cmpq	%rsi, 128(%r13)
	je	.L10202
.L9823:
	cmpl	$5, %r14d
	je	.L10203
	movq	%rbp, %rax
	jmp	.L9791
.L10203:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L9791
.L10202:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10105
	.p2align 6,,7
.L10201:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L9815
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9815
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9821
	testb	$32, 17(%r13)
	jne	.L9822
	jmp	.L9821
	.p2align 6,,7
.L10200:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r14d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r14d, %r14d
	jne	.L9814
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9813
.L9814:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9813:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10105
.L9807:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L9806
.L10199:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%rsi)
	jne	.L9802
.L9805:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbp
	cmpb	$116, %dl
	jne	.L10204
.L10071:
	movq	32(%rbp), %rsi
	jmp	.L9805
.L10204:
	cmpb	$115, %dl
	jne	.L9802
	movq	32(%rsi), %r8
	movq	8(%rbp), %r10
	cmpq	%r10, 8(%r8)
	movq	%r8, %rsi
	je	.L9805
	jmp	.L9802
.L10198:
	movl	pedantic(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L9797
	cmpb	$51, 48(%rbp)
	je	.L9797
	cmpq	$0, current_function_decl(%rip)
	je	.L9799
	movzbl	17(%rbp), %r9d
	andb	$24, %r9b
	cmpb	$16, %r9b
	je	.L10205
.L9799:
	movq	%rbp, %rsi
.L9800:
	movq	%rsi, %rbp
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L9797:
	movq	%rax, %r13
	jmp	.L9793
.L10205:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L9799
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9799
	testb	$2, 17(%rax)
	je	.L9799
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L9800
	jmp	.L9799
	.p2align 6,,7
.L10197:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %edx
	jmp	.L9793
.L9790:
	movq	%rbp, %rdi
	call	default_function_array_conversion
	jmp	.L9791
.L10193:
	movq	72(%r14), %rdi
	movq	32(%rbx), %rsi
	jmp	.L10107
.L10192:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L9786
.L10191:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L9784
.L9781:
	movzbl	17(%rbx), %edi
	movl	$1, %r11d
	movl	%edi, %edx
	shrb	$3, %dil
	shrb	$4, %dl
	andl	%edi, %r11d
	andl	$1, %edx
	jmp	.L9780
.L10190:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10109
.L9776:
	movl	24(%r12), %eax
	movl	%eax, 24(%rbx)
	jmp	.L9775
.L10189:
	movq	32(%r12), %r8
	cmpq	%r13, 8(%r8)
	je	.L10043
	movl	$115, %ecx
	jmp	.L9770
.L10043:
	movq	32(%r12), %rsi
	movl	%edx, %ecx
	.p2align 4,,7
.L9774:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbx
	movzbl	16(%rsi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L10206
	movq	32(%rbx), %rsi
	jmp	.L9774
.L10206:
	cmpb	$115, %cl
	jne	.L9770
	movq	32(%rsi), %rsi
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rsi)
	je	.L9774
	jmp	.L9770
.L9764:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10101
.L9762:
	movl	flag_traditional(%rip), %r15d
	testl	%r15d, %r15d
	je	.L9765
	movl	flag_allow_single_precision(%rip), %esi
	testl	%esi, %esi
	jne	.L9765
	movq	global_trees+192(%rip), %r14
	cmpq	%r14, 128(%rbp)
	je	.L10207
.L9765:
	cmpl	$5, %r13d
	je	.L10208
.L9766:
	movq	%rbx, %r15
	jmp	.L9733
.L10208:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L10103:
	movq	global_trees(%rip), %r15
	jmp	.L9733
.L10207:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10101
	.p2align 6,,7
.L10128:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L9757
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9757
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	je	.L9763
	testb	$32, 17(%rbp)
	jne	.L9764
	jmp	.L9763
	.p2align 6,,7
.L10127:
	movq	integer_types+40(%rip), %r13
	movzwl	60(%rbp), %edx
	movl	flag_traditional(%rip), %ecx
	movzwl	60(%r13), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ecx, %ecx
	jne	.L9756
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9755
.L9756:
	testb	$32, 17(%rbp)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9755:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10101
.L9749:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L9748
.L10126:
	movq	32(%rbx), %rdi
	movq	8(%rbx), %rsi
	cmpq	%rsi, 8(%rdi)
	jne	.L9744
	.p2align 4,,7
.L9747:
	movzbl	16(%rdi), %ecx
	movq	%rdi, %rbx
	cmpb	$116, %cl
	jne	.L10209
.L10066:
	movq	32(%rbx), %rdi
	jmp	.L9747
.L10209:
	cmpb	$115, %cl
	jne	.L9744
	movq	32(%rdi), %r8
	movq	8(%rbx), %r14
	cmpq	%r14, 8(%r8)
	movq	%r8, %rdi
	je	.L9747
	jmp	.L9744
.L10125:
	movl	pedantic(%rip), %edi
	testl	%edi, %edi
	jne	.L9735
	cmpb	$51, 48(%rbx)
	je	.L9735
	cmpq	$0, current_function_decl(%rip)
	je	.L9741
	movzbl	17(%rbx), %r15d
	andb	$24, %r15b
	cmpb	$16, %r15b
	je	.L10210
.L9741:
	movq	%rbx, %rdi
.L9742:
	movq	%rdi, %rbx
	movq	8(%rdi), %rbp
.L10100:
	movzbl	16(%rbx), %ecx
	jmp	.L9735
.L10210:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L9741
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9741
	testb	$2, 17(%rax)
	je	.L9741
	cmpb	$46, %dl
	movq	%rax, %rdi
	jne	.L9742
	jmp	.L9741
	.p2align 6,,7
.L10124:
	movq	104(%rbx), %rbx
	jmp	.L10100
.L9672:
	xorl	%ebp, %ebp
	movl	%r13d, %edx
	movq	%rbx, %r8
	cmpb	$116, %cl
	je	.L10062
	cmpb	$115, %cl
	je	.L10211
.L9674:
	movzbl	%cl, %r11d 
	movzbl	tree_code_type(%r11), %eax
	cmpb	$60, %al
	je	.L9680
	cmpb	$49, %al
	je	.L9680
	cmpb	$50, %al
	je	.L9680
	cmpb	$101, %al
	je	.L9680
.L9679:
	cmpl	$23, %edx
	je	.L10212
	cmpl	$18, %edx
	jne	.L9766
	movzbl	%cl, %r10d 
	xorl	%edx, %edx
	xorl	%r13d, %r13d
	movzbl	tree_code_type(%r10), %eax
	movq	8(%rsi), %r14
	cmpb	$114, %al
	je	.L9685
	cmpb	$100, %al
	je	.L9685
.L9684:
	movzbl	17(%rsi), %r8d
	movzbl	62(%rsi), %r9d
	movl	$1, %edi
	movl	%r8d, %r11d
	movl	%r8d, %r10d
	movl	%r9d, %r15d
	shrb	$3, %r11b
	shrb	$4, %r10b
	shrb	$5, %r15b
	andl	$1, %r11d
	andl	%r10d, %edi
	andl	$1, %r15d
	addl	%r11d, %r11d
	sall	$2, %r15d
	xorl	%r10d, %r10d
	orl	%r11d, %edi
	movzbl	16(%rsi), %r11d
	orl	%r15d, %edi
	cmpb	$20, %r11b
	je	.L10213
.L9688:
	leal	0(,%r10,8), %esi
	orl	%esi, %edi
	jne	.L9687
	testl	%edx, %edx
	jne	.L9687
	testl	%r13d, %r13d
	je	.L9686
.L9687:
	movl	%r8d, %r15d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r15b
	movl	%r9d, %ecx
	movl	%r8d, %edi
	andl	%r15d, %esi
	andl	$1, %ecx
	andl	$1, %edi
	sall	$2, %ecx
	addl	%edi, %edi
	orl	%edi, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %r11b
	je	.L10214
.L9690:
	leal	0(,%rcx,8), %r8d
	movq	%r14, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r13,%r13), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r14
.L9686:
	cmpb	$41, %cl
	je	.L10215
	cmpb	$47, %cl
	je	.L10216
	xorl	%r13d, %r13d
	testl	%ebp, %ebp
	je	.L10217
.L9729:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L9730
	testl	%r13d, %r13d
	movq	%rbx, %r15
	je	.L9733
.L9730:
	movq	%r14, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L10218
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L10102
.L10218:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	mark_addressable
	testl	%eax, %eax
	je	.L10103
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%r15), %ebx
	movl	%eax, %ebp
	andb	$1, %bpl
	addb	%bpl, %bpl
	andb	$-4, %bl
	orb	%bpl, %bl
	movb	%bl, 17(%r15)
	jmp	.L9733
.L10217:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r13d
	jmp	.L9729
.L10216:
	movq	40(%rbx), %rbp
	movq	8(%rbp), %r13
	movzbl	16(%r13), %r14d
	movq	%r13, %rax
	cmpl	$23, %r14d
	je	.L9694
	cmpl	$18, %r14d
	je	.L9694
	movzbl	16(%rbp), %edx
	cmpb	$32, %dl
	je	.L10219
	movl	optimize(%rip), %r9d
	testl	%r9d, %r9d
	je	.L9697
	cmpb	$34, %dl
	je	.L10220
.L9697:
	cmpb	$116, %dl
	movq	%rbp, %rcx
	je	.L10064
	cmpb	$115, %dl
	je	.L10221
.L9706:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L9711
	cmpb	$49, %al
	je	.L9711
	cmpb	$50, %al
	je	.L9711
	cmpb	$101, %al
	je	.L9711
.L9710:
	cmpl	$10, %r14d
	je	.L10222
	cmpb	$39, %dl
	je	.L10223
.L9719:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9724
	testb	$32, 17(%r13)
	je	.L9725
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L9726
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r13), %r11d
	movzwl	60(%rdx), %r9d
	andl	$511, %r11d
	andl	$511, %r9d
	cmpl	%r9d, %r11d
	je	.L9726
.L9725:
	movq	integer_types+40(%rip), %rdi
.L10099:
	movq	%rbp, %rsi
	call	convert
.L9695:
	movq	8(%rax), %rsi
	movq	32(%rbx), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L10104
.L9726:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10099
.L9724:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9727
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L9727
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%r13)
	je	.L10224
.L9727:
	cmpl	$5, %r14d
	je	.L10225
	movq	%rbp, %rax
	jmp	.L9695
.L10225:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L9695
.L10224:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10099
	.p2align 6,,7
.L10223:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L9719
	movq	integer_types+40(%rip), %r8
	movq	40(%rdx), %rdi
	movzwl	60(%r8), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9719
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9725
	testb	$32, 17(%r13)
	jne	.L9726
	jmp	.L9725
	.p2align 6,,7
.L10222:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r14d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r14d, %r14d
	jne	.L9718
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9717
.L9718:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9717:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10099
.L9711:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L9710
.L10221:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L9706
.L9709:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbp
	cmpb	$116, %dl
	jne	.L10226
.L10064:
	movq	32(%rbp), %rsi
	jmp	.L9709
.L10226:
	cmpb	$115, %dl
	jne	.L9706
	movq	32(%rsi), %r15
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%r15)
	movq	%r15, %rsi
	je	.L9709
	jmp	.L9706
.L10220:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L9701
	cmpb	$51, 48(%rbp)
	je	.L9701
	cmpq	$0, current_function_decl(%rip)
	je	.L9703
	movzbl	17(%rbp), %r11d
	andb	$24, %r11b
	cmpb	$16, %r11b
	je	.L10227
.L9703:
	movq	%rbp, %rsi
.L9704:
	movq	%rsi, %rbp
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L9701:
	movq	%rax, %r13
	jmp	.L9697
.L10227:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L9703
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9703
	testb	$2, 17(%rax)
	je	.L9703
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L9704
	jmp	.L9703
	.p2align 6,,7
.L10219:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %edx
	jmp	.L9697
.L9694:
	movq	%rbp, %rdi
	call	default_function_array_conversion
	jmp	.L9695
.L10215:
	movq	72(%r14), %rdi
	movq	32(%rbx), %rsi
	jmp	.L10102
.L10214:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L9690
.L10213:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L9688
.L9685:
	movzbl	17(%rbx), %r9d
	movl	$1, %r13d
	movl	%r9d, %edx
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	%r9d, %r13d
	andl	$1, %edx
	jmp	.L9684
.L10212:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10104
.L9680:
	movl	24(%r8), %eax
	movl	%eax, 24(%rbx)
	jmp	.L9679
.L10211:
	movq	32(%rbx), %rdi
	cmpq	%rax, 8(%rdi)
	jne	.L9674
	.p2align 4,,7
.L9678:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rdi, %rbx
	movzbl	16(%rdi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L10228
.L10062:
	movq	32(%rbx), %rdi
	jmp	.L9678
.L10228:
	cmpb	$115, %cl
	jne	.L9674
	movq	32(%rdi), %rdi
	movq	8(%rbx), %r14
	cmpq	%r14, 8(%rdi)
	je	.L9678
	jmp	.L9674
.L10123:
	movzbl	16(%rdi), %ecx
	cmpb	$41, %cl
	je	.L9538
	movl	warn_char_subscripts(%rip), %eax
	testl	%eax, %eax
	je	.L9539
	movq	integer_types(%rip), %rdx
	cmpq	%rdx, 128(%r13)
	je	.L10229
.L9539:
	movzbl	16(%r13), %ebp
	cmpl	$23, %ebp
	je	.L9541
	cmpl	$18, %ebp
	je	.L9541
	movzbl	16(%r12), %ecx
	cmpb	$32, %cl
	je	.L10230
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L9604
	cmpb	$34, %cl
	je	.L10231
.L9604:
	cmpb	$116, %cl
	movq	%r12, %rdx
	je	.L10058
	cmpb	$115, %cl
	je	.L10232
.L9613:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L9618
	cmpb	$49, %al
	je	.L9618
	cmpb	$50, %al
	je	.L9618
	cmpb	$101, %al
	je	.L9618
.L9617:
	cmpl	$10, %ebp
	je	.L10233
	cmpb	$39, %cl
	je	.L10234
.L9626:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9631
	testb	$32, 17(%r13)
	je	.L9632
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L9633
	movq	integer_types+40(%rip), %r9
	movzwl	60(%r13), %r10d
	movzwl	60(%r9), %r13d
	andl	$511, %r10d
	andl	$511, %r13d
	cmpl	%r13d, %r10d
	je	.L9633
.L9632:
	movq	integer_types+40(%rip), %rdi
.L10090:
	movq	%r12, %rsi
.L10091:
	call	convert
.L10093:
	movq	%rax, %rbp
.L9602:
	movq	8(%rbp), %r12
	cmpb	$6, 16(%r12)
	jne	.L10121
	movzbl	16(%rbp), %edx
	cmpb	$25, %dl
	je	.L10235
.L9638:
	movq	%rbx, %rdi
	call	mark_addressable
	testl	%eax, %eax
	je	.L10120
	movzbl	16(%rbp), %edx
.L9637:
	cmpb	$25, %dl
	je	.L10236
.L9640:
	movl	pedantic(%rip), %edi
	testl	%edi, %edi
	je	.L9642
	cmpb	$39, 16(%rbx)
	movq	%rbx, %rdi
	je	.L9646
	movzbl	16(%rbx), %eax
.L10039:
	cmpb	$34, %al
	je	.L10237
.L9647:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	je	.L10238
.L9642:
	movq	8(%rbx), %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	xorl	%eax, %eax
	movq	8(%r8), %rdi
	movq	128(%rdi), %rsi
	movl	$43, %edi
	call	build
	movzbl	17(%rbx), %ecx
	movq	8(%rbx), %rdx
	movzbl	17(%rax), %ebp
	movq	%rax, %rdi
	movq	8(%rdx), %r9
	shrb	$4, %cl
	movl	%ebp, %r15d
	andb	$-17, %bpl
	movzbl	17(%r9), %r10d
	shrb	$4, %r15b
	movl	%r15d, %r13d
	shrb	$4, %r10b
	orl	%r10d, %ecx
	orl	%r13d, %ecx
	andb	$1, %cl
	salb	$4, %cl
	orb	%cl, %bpl
	movb	%bpl, 17(%rax)
	movzbl	17(%rbx), %r14d
	movq	8(%rbx), %rsi
	movq	8(%rsi), %r11
	movzbl	17(%r11), %r12d
	shrb	$3, %r12b
	orl	%r12d, %r14d
	orl	%ebp, %r14d
	andb	$-2, %bpl
	andb	$1, %r14b
	orb	%r14b, %bpl
	movb	%bpl, 17(%rax)
	movl	%ebp, %r8d
	movzbl	17(%rbx), %r13d
	movq	8(%rbx), %r15
	shrb	$3, %r8b
	andb	$-9, %bpl
	movl	%r8d, %r10d
	movq	8(%r15), %rdx
	shrb	$3, %r13b
	movzbl	17(%rdx), %r9d
	shrb	$3, %r9b
	orl	%r9d, %r13d
	orl	%r10d, %r13d
	andb	$1, %r13b
	salb	$3, %r13b
	orb	%r13b, %bpl
	movb	%bpl, 17(%rax)
	call	fold
	movq	%rax, %rbp
	movq	8(%rax), %rdx
	movq	global_trees(%rip), %rax
	cmpq	%rax, %rbp
	je	.L9655
	cmpq	%rax, %rdx
	je	.L9655
	cmpq	$0, 32(%rdx)
	jne	.L9534
	movzbl	16(%rdx), %ecx
	testb	%cl, %cl
	je	.L9655
	testq	%rbp, %rbp
	je	.L9658
	movzbl	16(%rbp), %ebx
	subb	$34, %bl
	cmpb	$1, %bl
	jbe	.L10239
.L9658:
	movzbl	%cl, %eax
	subl	$5, %eax
	cmpl	$16, %eax
	ja	.L9667
	mov	%eax, %ebp
	jmp	*.L9668(,%rbp,8)
	.section	.rodata
	.align 8
	.align 4
.L9668:
	.quad	.L9663
	.quad	.L9667
	.quad	.L9667
	.quad	.L9667
	.quad	.L9667
	.quad	.L9662
	.quad	.L9667
	.quad	.L9667
	.quad	.L9667
	.quad	.L9667
	.quad	.L9667
	.quad	.L9667
	.quad	.L9667
	.quad	.L9664
	.quad	.L9667
	.quad	.L9660
	.quad	.L9661
	.text
.L9660:
	movl	$.LC62, %esi
.L9659:
	movq	96(%rdx), %rax
	cmpb	$1, 16(%rax)
	je	.L10240
	movq	72(%rax), %rax
	movl	$.LC71, %edi
.L10096:
	movq	32(%rax), %rsi
	xorl	%eax, %eax
	call	error
.L10095:
	movq	global_trees(%rip), %rax
.L9655:
	movq	%rax, %rbp
	jmp	.L9534
.L10240:
	movq	32(%rax), %rdx
	movl	$.LC70, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L10095
.L9663:
	movl	$.LC65, %edi
.L10098:
	xorl	%eax, %eax
	call	error
	jmp	.L10095
.L9662:
	movl	$.LC64, %esi
	jmp	.L9659
.L9664:
	movq	24(%rdx), %rax
	testq	%rax, %rax
	je	.L9665
	cmpq	$0, 112(%rax)
	je	.L10241
	movq	8(%rdx), %rdx
	movzbl	16(%rdx), %ecx
	jmp	.L9658
.L10241:
	movl	$.LC66, %edi
	jmp	.L10098
.L9665:
	movl	$.LC67, %edi
	jmp	.L10098
	.p2align 6,,7
.L9661:
	movl	$.LC63, %esi
	jmp	.L9659
.L10239:
	movq	72(%rbp), %rax
	movl	$.LC61, %edi
	jmp	.L10096
.L10238:
	call	lvalue_p
	testl	%eax, %eax
	jne	.L9642
	movl	$.LC100, %edi
.L10094:
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L9642
.L10237:
	testb	$4, 49(%rdi)
	je	.L9647
	movl	$.LC99, %edi
	jmp	.L10094
	.p2align 6,,7
.L9646:
	movq	32(%rdi), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$39, %al
	je	.L9646
	jmp	.L10039
.L10236:
	movq	8(%rbx), %rcx
	movq	24(%rcx), %rsi
	testq	%rsi, %rsi
	je	.L9640
	movq	%rbp, %rdi
	call	int_fits_type_p
	testl	%eax, %eax
	jne	.L9640
	movq	%rbx, %rdi
	call	mark_addressable
	testl	%eax, %eax
	je	.L10120
	jmp	.L9640
	.p2align 6,,7
.L10235:
	movq	8(%rbx), %rsi
	movq	8(%rsi), %r11
	movq	32(%r11), %rax
	testq	%rax, %rax
	je	.L9637
	cmpb	$25, 16(%rax)
	jne	.L9638
	jmp	.L9637
.L9633:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10090
.L9631:
	movl	flag_traditional(%rip), %r15d
	testl	%r15d, %r15d
	je	.L9634
	movl	flag_allow_single_precision(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L9634
	movq	global_trees+192(%rip), %r14
	cmpq	%r14, 128(%r13)
	je	.L10242
.L9634:
	cmpl	$5, %ebp
	je	.L10243
.L9635:
	movq	%r12, %rbp
	jmp	.L9602
.L10243:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L10092:
	movq	global_trees(%rip), %rbp
	jmp	.L9602
.L10242:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10090
	.p2align 6,,7
.L10234:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L9626
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%rdi), %esi
	movq	40(%rdx), %rdi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9626
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9632
	testb	$32, 17(%r13)
	jne	.L9633
	jmp	.L9632
	.p2align 6,,7
.L10233:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %ebp
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ebp, %ebp
	jne	.L9625
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9624
.L9625:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9624:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10090
.L9618:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L9617
.L10232:
	movq	32(%r12), %rsi
	movq	8(%r12), %r8
	cmpq	%r8, 8(%rsi)
	jne	.L9613
	.p2align 4,,7
.L9616:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r12
	cmpb	$116, %cl
	jne	.L10244
.L10058:
	movq	32(%r12), %rsi
	jmp	.L9616
.L10244:
	cmpb	$115, %cl
	jne	.L9613
	movq	32(%rsi), %r11
	movq	8(%r12), %r14
	cmpq	%r14, 8(%r11)
	movq	%r11, %rsi
	je	.L9616
	jmp	.L9613
.L10231:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L9604
	cmpb	$51, 48(%r12)
	je	.L9604
	cmpq	$0, current_function_decl(%rip)
	je	.L9610
	movzbl	17(%r12), %r15d
	andb	$24, %r15b
	cmpb	$16, %r15b
	je	.L10245
.L9610:
	movq	%r12, %rsi
.L9611:
	movq	%rsi, %r12
	movq	8(%rsi), %r13
.L10089:
	movzbl	16(%r12), %ecx
	jmp	.L9604
.L10245:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L9610
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9610
	testb	$2, 17(%rax)
	je	.L9610
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L9611
	jmp	.L9610
	.p2align 6,,7
.L10230:
	movq	104(%r12), %r12
	jmp	.L10089
.L9541:
	movzbl	16(%r12), %ecx
	movl	%ebp, %edx
	movq	%r12, %rdi
	xorl	%ebp, %ebp
	cmpb	$116, %cl
	je	.L10054
	cmpb	$115, %cl
	je	.L10246
.L9543:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L9549
	cmpb	$49, %al
	je	.L9549
	cmpb	$50, %al
	je	.L9549
	cmpb	$101, %al
	je	.L9549
.L9548:
	cmpl	$23, %edx
	je	.L10247
	cmpl	$18, %edx
	jne	.L9635
	movzbl	%cl, %edi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%r13), %r14
	cmpb	$114, %al
	je	.L9554
	cmpb	$100, %al
	je	.L9554
.L9553:
	movzbl	17(%r13), %r8d
	movl	$1, %r9d
	movzbl	16(%r13), %edi
	movl	%r8d, %r10d
	movl	%r8d, %esi
	shrb	$3, %r10b
	shrb	$4, %sil
	andl	$1, %r10d
	andl	%esi, %r9d
	xorl	%esi, %esi
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%r13), %r10d
	movl	%r10d, %r15d
	shrb	$5, %r15b
	andl	$1, %r15d
	sall	$2, %r15d
	orl	%r15d, %r9d
	cmpb	$20, %dil
	je	.L10248
.L9557:
	leal	0(,%rsi,8), %r13d
	orl	%r13d, %r9d
	jne	.L9556
	testl	%edx, %edx
	jne	.L9556
	testl	%r11d, %r11d
	je	.L9555
.L9556:
	movl	%r8d, %r15d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r15b
	movl	%r10d, %ecx
	movl	%r8d, %r9d
	andl	%r15d, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L10249
.L9559:
	leal	0(,%rcx,8), %r8d
	movq	%r14, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%r12), %ecx
	movq	%rax, %r14
.L9555:
	cmpb	$41, %cl
	je	.L10250
	cmpb	$47, %cl
	je	.L10251
	xorl	%r13d, %r13d
	testl	%ebp, %ebp
	je	.L10252
.L9598:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L9599
	testl	%r13d, %r13d
	movq	%r12, %rbp
	je	.L9602
.L9599:
	movq	%r14, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r12)
	movq	%rax, %rbp
	je	.L10253
	movl	$121, %edi
	movq	%r12, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L10091
.L10253:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r12, %rdx
	call	build1
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	mark_addressable
	testl	%eax, %eax
	je	.L10092
	movq	%r12, %rdi
	call	staticp
	movzbl	17(%rbp), %r12d
	movl	%eax, %r9d
	andb	$1, %r9b
	addb	%r9b, %r9b
	andb	$-4, %r12b
	orb	%r9b, %r12b
	movb	%r12b, 17(%rbp)
	jmp	.L9602
.L10252:
	movq	%r12, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r13d
	jmp	.L9598
.L10251:
	movq	40(%r12), %rbp
	movq	8(%rbp), %r13
	movzbl	16(%r13), %r14d
	movq	%r13, %rax
	cmpl	$23, %r14d
	je	.L9563
	cmpl	$18, %r14d
	je	.L9563
	movzbl	16(%rbp), %edx
	cmpb	$32, %dl
	je	.L10254
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L9566
	cmpb	$34, %dl
	je	.L10255
.L9566:
	cmpb	$116, %dl
	movq	%rbp, %rcx
	je	.L10056
	cmpb	$115, %dl
	je	.L10256
.L9575:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L9580
	cmpb	$49, %al
	je	.L9580
	cmpb	$50, %al
	je	.L9580
	cmpb	$101, %al
	je	.L9580
.L9579:
	cmpl	$10, %r14d
	je	.L10257
	cmpb	$39, %dl
	je	.L10258
.L9588:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L9593
	testb	$32, 17(%r13)
	je	.L9594
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L9595
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r13), %edi
	movzwl	60(%rdx), %r13d
	andl	$511, %edi
	andl	$511, %r13d
	cmpl	%r13d, %edi
	je	.L9595
.L9594:
	movq	integer_types+40(%rip), %rdi
.L10088:
	movq	%rbp, %rsi
	call	convert
.L9564:
	movq	8(%rax), %rsi
	movq	32(%r12), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L10093
.L9595:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10088
	.p2align 6,,7
.L9593:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9596
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L9596
	movq	global_trees+192(%rip), %r10
	cmpq	%r10, 128(%r13)
	je	.L10259
.L9596:
	cmpl	$5, %r14d
	je	.L10260
	movq	%rbp, %rax
	jmp	.L9564
.L10260:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L9564
.L10259:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10088
	.p2align 6,,7
.L10258:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L9588
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L9588
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L9594
	testb	$32, 17(%r13)
	jne	.L9595
	jmp	.L9594
	.p2align 6,,7
.L10257:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r14d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r14d, %r14d
	jne	.L9587
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L9586
.L9587:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L9586:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10088
.L9580:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L9579
.L10256:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r9
	cmpq	%r9, 8(%rsi)
	jne	.L9575
.L9578:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbp
	cmpb	$116, %dl
	jne	.L10261
.L10056:
	movq	32(%rbp), %rsi
	jmp	.L9578
.L10261:
	cmpb	$115, %dl
	jne	.L9575
	movq	32(%rsi), %r8
	movq	8(%rbp), %r15
	cmpq	%r15, 8(%r8)
	movq	%r8, %rsi
	je	.L9578
	jmp	.L9575
.L10255:
	movl	pedantic(%rip), %edi
	testl	%edi, %edi
	jne	.L9570
	cmpb	$51, 48(%rbp)
	je	.L9570
	cmpq	$0, current_function_decl(%rip)
	je	.L9572
	movzbl	17(%rbp), %r10d
	andb	$24, %r10b
	cmpb	$16, %r10b
	je	.L10262
.L9572:
	movq	%rbp, %rsi
.L9573:
	movq	%rsi, %rbp
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L9570:
	movq	%rax, %r13
	jmp	.L9566
.L10262:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L9572
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L9572
	testb	$2, 17(%rax)
	je	.L9572
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L9573
	jmp	.L9572
	.p2align 6,,7
.L10254:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %edx
	jmp	.L9566
.L9563:
	movq	%rbp, %rdi
	call	default_function_array_conversion
	jmp	.L9564
.L10250:
	movq	72(%r14), %rdi
	movq	32(%r12), %rsi
	jmp	.L10091
.L10249:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L9559
.L10248:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L9557
.L9554:
	movzbl	17(%r12), %r9d
	movl	$1, %r11d
	movl	%r9d, %edx
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	%r9d, %r11d
	andl	$1, %edx
	jmp	.L9553
.L10247:
	movl	$121, %edi
	movq	%r12, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10093
.L9549:
	movl	24(%rdi), %eax
	movl	%eax, 24(%r12)
	jmp	.L9548
.L10246:
	movq	32(%r12), %rsi
	cmpq	%r13, 8(%rsi)
	jne	.L9543
	.p2align 4,,7
.L9547:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r12
	movzbl	16(%rsi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L10263
.L10054:
	movq	32(%r12), %rsi
	jmp	.L9547
.L10263:
	cmpb	$115, %cl
	jne	.L9543
	movq	32(%rsi), %rsi
	movq	8(%r12), %r8
	cmpq	%r8, 8(%rsi)
	je	.L9547
	jmp	.L9543
.L10229:
	movl	$.LC97, %edi
	xorl	%eax, %eax
	call	warning
	movq	8(%r12), %r13
	jmp	.L9539
	.p2align 6,,7
.L10122:
	movl	$.LC96, %edi
	jmp	.L10119
.L9667:
	movl	$.LC68, %edi
	movl	$163, %esi
	movl	$.LC69, %edx
	call	fancy_abort
.LFE25:
.Lfe25:
	.size	build_array_ref,.Lfe25-build_array_ref
	.section	.rodata.str1.32
	.align 32
.LC105:
	.string	"`%s' undeclared (first use in this function)"
	.align 32
.LC106:
	.string	"(Each undeclared identifier is reported only once"
	.align 32
.LC107:
	.string	"for each function it appears in.)"
	.align 32
.LC104:
	.string	"`%s' undeclared here (not in a function)"
	.align 32
.LC108:
	.string	"local declaration of `%s' hides instance variable"
	.text
	.align 2
	.p2align 4,,15
.globl build_external_ref
	.type	build_external_ref,@function
build_external_ref:
.LFB26:
	subq	$40, %rsp
.LCFI99:
	movq	%rbx, 8(%rsp)
.LCFI100:
	movq	%rbp, 16(%rsp)
.LCFI101:
	movq	%r12, 24(%rsp)
.LCFI102:
	movq	%r13, 32(%rsp)
.LCFI103:
	movq	%rdi, %r12
	movl	%esi, %r13d
	call	lookup_name
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	lookup_objc_ivar
	testq	%rbx, %rbx
	movq	%rax, %rbp
	je	.L10267
	testb	$-128, 18(%rbx)
	jne	.L10289
.L10265:
	movq	global_trees(%rip), %rdx
	cmpq	%rdx, %rbx
	je	.L10267
	testb	$1, 53(%rbx)
	je	.L10266
.L10267:
	testq	%rbp, %rbp
	je	.L10268
	movq	%rbp, %rbx
.L10288:
	movq	global_trees(%rip), %rdx
.L10280:
	movq	8(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10264
	movq	%rbx, %rdi
	call	assemble_external
	orb	$1, 18(%rbx)
	cmpb	$32, 16(%rbx)
	je	.L10290
.L10286:
	movq	%rbx, %rax
.L10264:
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	movq	24(%rsp), %r12
	movq	32(%rsp), %r13
	addq	$40, %rsp
	ret
	.p2align 6,,7
.L10290:
	movq	104(%rbx), %rbx
	orb	$2, 17(%rbx)
	jmp	.L10286
	.p2align 6,,7
.L10268:
	testl	%r13d, %r13d
	je	.L10270
	testq	%rbx, %rbx
	je	.L10272
	cmpq	global_trees(%rip), %rbx
	je	.L10272
	movq	%r12, %rdi
	call	implicit_decl_warning
	andb	$-2, 53(%rbx)
	jmp	.L10288
.L10272:
	movq	%r12, %rdi
	call	implicitly_declare
	movq	%rax, %rbx
	jmp	.L10288
.L10270:
	movq	current_function_decl(%rip), %rax
	testq	%rax, %rax
	je	.L10291
	movq	global_trees(%rip), %rdx
	cmpq	%rdx, 56(%r12)
	je	.L10292
.L10278:
	movq	32(%r12), %rsi
	xorl	%eax, %eax
	movl	$.LC105, %edi
	call	error
	movl	undeclared_variable_notice(%rip), %eax
	testl	%eax, %eax
	je	.L10293
.L10287:
	movq	global_trees(%rip), %rdx
.L10277:
	movq	%rdx, 56(%r12)
	movq	current_function_decl(%rip), %rdx
	movq	%rdx, 88(%r12)
.L10276:
	movq	global_trees(%rip), %rax
	jmp	.L10264
.L10293:
	movl	$.LC106, %edi
	xorl	%eax, %eax
	call	error
	movl	$.LC107, %edi
	xorl	%eax, %eax
	call	error
	movl	$1, undeclared_variable_notice(%rip)
	jmp	.L10287
.L10292:
	cmpq	%rax, 88(%r12)
	jne	.L10278
	jmp	.L10277
.L10291:
	movq	32(%r12), %rsi
	movl	$.LC104, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L10276
	.p2align 6,,7
.L10266:
	testq	%rbp, %rbp
	je	.L10280
	cmpq	%rbp, %rbx
	je	.L10283
	cmpq	$0, 64(%r12)
	jne	.L10294
.L10283:
	movq	%rbp, %rbx
	jmp	.L10280
.L10294:
	movq	32(%r12), %rsi
	movl	$.LC108, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L10288
	.p2align 6,,7
.L10289:
	movq	%rbx, %rdi
	call	warn_deprecated_use
	jmp	.L10265
.LFE26:
.Lfe26:
	.size	build_external_ref,.Lfe26-build_external_ref
	.section	.rodata.str1.32
	.align 32
.LC109:
	.string	"called object is not a function"
	.align 32
.LC123:
	.string	"too few arguments to function `%s'"
	.section	.rodata.str1.1
.LC124:
	.string	"too few arguments to function"
	.section	.rodata.str1.32
	.align 32
.LC120:
	.string	"%s with different width due to prototype"
	.align 32
.LC121:
	.string	"%s as unsigned due to prototype"
	.section	.rodata.str1.1
.LC122:
	.string	"%s as signed due to prototype"
	.section	.rodata.str1.32
	.align 32
.LC119:
	.string	"%s as `float' rather than `double' due to prototype"
	.align 32
.LC118:
	.string	"%s as floating rather than complex due to prototype"
	.align 32
.LC117:
	.string	"%s as complex rather than integer due to prototype"
	.align 32
.LC116:
	.string	"%s as floating rather than integer due to prototype"
	.align 32
.LC115:
	.string	"%s as complex rather than floating due to prototype"
	.align 32
.LC114:
	.string	"%s as integer rather than complex due to prototype"
	.align 32
.LC113:
	.string	"%s as integer rather than floating due to prototype"
	.align 32
.LC112:
	.string	"type of formal parameter %d is incomplete"
	.align 32
.LC111:
	.string	"too many arguments to function"
	.align 32
.LC110:
	.string	"too many arguments to function `%s'"
	.text
	.align 2
	.p2align 4,,15
.globl build_function_call
	.type	build_function_call,@function
build_function_call:
.LFB27:
	pushq	%r15
.LCFI104:
	pushq	%r14
.LCFI105:
	pushq	%r13
.LCFI106:
	pushq	%r12
.LCFI107:
	pushq	%rbp
.LCFI108:
	pushq	%rbx
.LCFI109:
	movq	%rdi, %rbx
	subq	$88, %rsp
.LCFI110:
	movq	%rsi, 80(%rsp)
	movq	$0, 56(%rsp)
	movq	$0, 64(%rsp)
	movzbl	16(%rdi), %ecx
	leal	-114(%rcx), %edx
	cmpb	$2, %dl
	ja	.L10297
	movq	32(%rdi), %rdi
	movq	global_trees(%rip), %rbp
	cmpq	%rbp, %rdi
	movq	%rdi, %rax
	movq	%rbp, %rdx
	je	.L10297
	movq	8(%rdi), %r8
	cmpq	%r8, 8(%rbx)
	je	.L10300
.L10297:
	cmpb	$30, %cl
	je	.L10936
	movq	8(%rbx), %r12
	movzbl	16(%r12), %ebp
	movq	%r12, %rax
	cmpl	$23, %ebp
	je	.L10307
	cmpl	$18, %ebp
	je	.L10307
	cmpb	$32, %cl
	je	.L10937
	movl	optimize(%rip), %r9d
	testl	%r9d, %r9d
	je	.L10370
	cmpb	$34, %cl
	je	.L10938
.L10370:
	cmpb	$116, %cl
	movq	%rbx, %rdx
	je	.L10873
	cmpb	$115, %cl
	je	.L10939
.L10379:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L10384
	cmpb	$49, %al
	je	.L10384
	cmpb	$50, %al
	je	.L10384
	cmpb	$101, %al
	je	.L10384
.L10383:
	cmpl	$10, %ebp
	je	.L10940
	cmpb	$39, %cl
	je	.L10941
.L10392:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10397
	testb	$32, 17(%r12)
	je	.L10398
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L10399
	movq	integer_types+40(%rip), %r9
	movzwl	60(%r12), %ebp
	movzwl	60(%r9), %r12d
	andl	$511, %ebp
	andl	$511, %r12d
	cmpl	%r12d, %ebp
	je	.L10399
.L10398:
	movq	integer_types+40(%rip), %rdi
.L10899:
	movq	%rbx, %rsi
.L10900:
	call	convert
.L10902:
	movq	%rax, %rbp
.L10368:
	movq	%rbp, 48(%rsp)
.L10305:
	movq	48(%rsp), %rbx
	movq	8(%rbx), %rdx
	movzbl	16(%rdx), %eax
	testb	%al, %al
	je	.L10934
	cmpb	$13, %al
	je	.L10942
.L10404:
	movl	$.LC109, %edi
	xorl	%eax, %eax
	call	error
.L10934:
	movq	global_trees(%rip), %rdx
.L10295:
	addq	$88, %rsp
	movq	%rdx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L10942:
	movq	8(%rdx), %r13
	movq	%r13, 8(%rsp)
	cmpb	$23, 16(%r13)
	jne	.L10404
	cmpq	$0, 56(%rsp)
	je	.L10405
	movq	56(%rsp), %rsi
	testb	$8, 17(%rsi)
	je	.L10405
	movl	$1, current_function_returns_abnormally(%rip)
.L10405:
	movq	8(%rsp), %rdi
	movq	80(%rsp), %rcx
	movq	24(%rdi), %r11
	testq	%rcx, %rcx
	movl	$0, 44(%rsp)
	movq	$0, 24(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%r11, 16(%rsp)
	je	.L10407
.L10822:
	xorl	%r15d, %r15d
	cmpq	$0, 16(%rsp)
	je	.L10411
	movq	16(%rsp), %rax
	movq	32(%rax), %r15
.L10411:
	cmpq	global_trees+216(%rip), %r15
	movq	32(%rsp), %rdx
	movq	32(%rdx), %rbx
	je	.L10943
	movzbl	16(%rbx), %ecx
	cmpb	$116, %cl
	je	.L10944
.L10415:
	movq	8(%rbx), %rdi
	xorl	%ebp, %ebp
	movq	%rbx, %r8
	cmpb	$116, %cl
	movzbl	16(%rdi), %edx
	je	.L10875
	cmpb	$115, %cl
	je	.L10945
.L10417:
	movzbl	%cl, %r10d 
	movzbl	tree_code_type(%r10), %eax
	cmpb	$60, %al
	je	.L10423
	cmpb	$49, %al
	je	.L10423
	cmpb	$50, %al
	je	.L10423
	cmpb	$101, %al
	je	.L10423
.L10422:
	cmpl	$23, %edx
	je	.L10946
	cmpl	$18, %edx
	je	.L10947
.L10426:
	movq	%rbx, %rbp
.L10904:
	movq	global_trees(%rip), %rsi
.L10425:
	cmpq	%rsi, %rbp
	movq	8(%rbp), %rdx
	je	.L10481
	cmpq	%rsi, %rdx
	je	.L10481
	cmpq	$0, 32(%rdx)
	jne	.L10478
	movzbl	16(%rdx), %ecx
	testb	%cl, %cl
	je	.L10481
	testq	%rbp, %rbp
	je	.L10484
	movzbl	16(%rbp), %r13d
	subb	$34, %r13b
	cmpb	$1, %r13b
	jbe	.L10948
.L10484:
	movzbl	%cl, %eax
	subl	$5, %eax
	cmpl	$16, %eax
	ja	.L10848
	mov	%eax, %ecx
	jmp	*.L10494(,%rcx,8)
	.section	.rodata
	.align 8
	.align 4
.L10494:
	.quad	.L10489
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10488
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10490
	.quad	.L10848
	.quad	.L10486
	.quad	.L10487
	.text
.L10486:
	movl	$.LC62, %esi
.L10485:
	movq	96(%rdx), %rax
	cmpb	$1, 16(%rax)
	je	.L10949
	movq	72(%rax), %rax
	movl	$.LC71, %edi
.L10909:
	movq	32(%rax), %rsi
	xorl	%eax, %eax
	call	error
.L10908:
	movq	global_trees(%rip), %rsi
.L10481:
	movq	%rsi, %rbp
.L10478:
	testq	%r15, %r15
	je	.L10497
	cmpq	$0, 32(%r15)
	je	.L10950
	movl	warn_conversion(%rip), %eax
	testl	%eax, %eax
	jne	.L10501
	movl	warn_traditional(%rip), %r8d
	testl	%r8d, %r8d
	je	.L10500
.L10501:
	movzwl	60(%r15), %r12d
	andl	$511, %r12d
	movl	%r12d, 76(%rsp)
	movzbl	16(%r15), %edx
	cmpb	$6, %dl
	je	.L10503
	cmpb	$10, %dl
	je	.L10503
	cmpb	$11, %dl
	je	.L10503
	cmpb	$12, %dl
	je	.L10503
.L10502:
	cmpb	$6, %dl
	je	.L10505
	cmpb	$10, %dl
	je	.L10505
	cmpb	$11, %dl
	je	.L10505
	cmpb	$12, %dl
	je	.L10505
.L10504:
	cmpb	$8, %dl
	je	.L10951
.L10507:
	cmpb	$7, %dl
	je	.L10952
.L10509:
	cmpb	$8, %dl
	je	.L10953
.L10512:
	cmpb	$7, %dl
	je	.L10954
.L10517:
	movl	warn_conversion(%rip), %ecx
	testl	%ecx, %ecx
	je	.L10500
	cmpb	$6, %dl
	je	.L10521
	cmpb	$10, %dl
	je	.L10521
	cmpb	$11, %dl
	je	.L10521
	cmpb	$12, %dl
	je	.L10521
.L10500:
	movl	44(%rsp), %r9d
	movq	56(%rsp), %rcx
	movq	%rbp, %rsi
	movq	64(%rsp), %r8
	xorl	%edx, %edx
	movq	%r15, %rdi
	incl	%r9d
	call	convert_for_assignment
	testb	$2, target_flags+3(%rip)
	movq	%rax, %rbp
	jne	.L10499
	movzbl	16(%r15), %eax
	cmpb	$6, %al
	je	.L10636
	cmpb	$10, %al
	je	.L10636
	cmpb	$11, %al
	je	.L10636
	cmpb	$12, %al
	je	.L10636
.L10499:
	xorl	%edi, %edi
	movq	%rbp, %rsi
.L10929:
	movq	24(%rsp), %rdx
	call	tree_cons
	cmpq	$0, 16(%rsp)
	movq	%rax, 24(%rsp)
	je	.L10408
	movq	16(%rsp), %rdi
	movq	(%rdi), %rbp
	movq	%rbp, 16(%rsp)
.L10408:
	movq	32(%rsp), %rsi
	movq	(%rsi), %r11
	incl	44(%rsp)
	testq	%r11, %r11
	movq	%r11, 32(%rsp)
	jne	.L10822
.L10407:
	cmpq	$0, 16(%rsp)
	je	.L10823
	movq	16(%rsp), %r15
	movq	global_trees+216(%rip), %r12
	cmpq	%r12, 32(%r15)
	je	.L10823
	cmpq	$0, 64(%rsp)
	je	.L10824
	movq	64(%rsp), %r10
	movl	$.LC123, %edi
	xorl	%eax, %eax
	movq	32(%r10), %rsi
	call	error
.L10823:
	movq	24(%rsp), %rdi
	call	nreverse
	movq	%rax, %rbx
	movl	warn_format(%rip), %eax
	testl	%eax, %eax
	jne	.L10955
.L10827:
	movq	48(%rsp), %rsi
	cmpb	$121, 16(%rsi)
	je	.L10956
.L10828:
	movq	8(%rsp), %rdx
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	movl	$53, %edi
	xorl	%eax, %eax
	movq	8(%rdx), %rsi
	movq	48(%rsp), %rdx
	call	build
	orb	$1, 17(%rax)
	movq	%rax, %rdi
	call	fold
	movq	8(%rax), %rcx
	movq	%rax, %rdx
	movzbl	16(%rcx), %eax
	cmpb	$5, %al
	je	.L10295
	movq	global_trees(%rip), %rsi
	cmpq	%rsi, %rdx
	je	.L10836
	cmpq	%rsi, %rcx
	je	.L10836
	cmpq	$0, 32(%rcx)
	jne	.L10295
	testb	%al, %al
	movl	%eax, %edi
	je	.L10836
	testq	%rdx, %rdx
	je	.L10839
	movzbl	16(%rdx), %ebx
	subb	$34, %bl
	cmpb	$1, %bl
	jbe	.L10957
.L10839:
	movzbl	%dil, %eax
	subl	$5, %eax
	cmpl	$16, %eax
	ja	.L10848
	mov	%eax, %r9d
	jmp	*.L10849(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L10849:
	.quad	.L10844
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10843
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10848
	.quad	.L10845
	.quad	.L10848
	.quad	.L10841
	.quad	.L10842
	.text
.L10841:
	movl	$.LC62, %esi
.L10840:
	movq	96(%rcx), %rax
	cmpb	$1, 16(%rax)
	je	.L10958
	movq	72(%rax), %rax
	movl	$.LC71, %edi
.L10931:
	movq	32(%rax), %rsi
	xorl	%eax, %eax
	call	error
.L10930:
	movq	global_trees(%rip), %rsi
.L10836:
	movq	%rsi, %rdx
	jmp	.L10295
.L10958:
	movq	32(%rax), %rdx
	movl	$.LC70, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L10930
.L10844:
	movl	$.LC65, %edi
.L10933:
	xorl	%eax, %eax
	call	error
	jmp	.L10930
.L10843:
	movl	$.LC64, %esi
	jmp	.L10840
.L10845:
	movq	24(%rcx), %rax
	testq	%rax, %rax
	je	.L10846
	cmpq	$0, 112(%rax)
	je	.L10959
	movq	8(%rcx), %rcx
	movzbl	16(%rcx), %edi
	jmp	.L10839
.L10959:
	movl	$.LC66, %edi
	jmp	.L10933
.L10846:
	movl	$.LC67, %edi
	jmp	.L10933
	.p2align 6,,7
.L10842:
	movl	$.LC63, %esi
	jmp	.L10840
.L10957:
	movq	72(%rdx), %rax
	movl	$.LC61, %edi
	jmp	.L10931
	.p2align 6,,7
.L10956:
	movq	32(%rsi), %rdi
	cmpb	$30, 16(%rdi)
	jne	.L10828
	testb	$96, 51(%rdi)
	je	.L10828
	movq	80(%rsp), %rsi
	movq	%rbx, %rdx
	call	expand_tree_builtin
	testq	%rax, %rax
	movq	%rax, %rdx
	jne	.L10295
	jmp	.L10828
	.p2align 6,,7
.L10955:
	movq	8(%rsp), %r14
	xorl	%edi, %edi
	movq	%rbx, %rdx
	movq	48(%r14), %rsi
	call	check_function_format
	jmp	.L10827
.L10824:
	movl	$.LC124, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L10823
.L10636:
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r15), %ecx
	movzwl	60(%rdx), %r15d
	andl	$511, %ecx
	andl	$511, %r15d
	cmpl	%r15d, %ecx
	jge	.L10499
	movq	8(%rbp), %rbx
	movzbl	16(%rbx), %r12d
	movq	%rbx, %r13
	cmpl	$23, %r12d
	je	.L10638
	cmpl	$18, %r12d
	je	.L10638
	movzbl	16(%rbp), %ecx
	cmpb	$32, %cl
	je	.L10960
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L10701
	cmpb	$34, %cl
	je	.L10961
.L10701:
	cmpb	$116, %cl
	movq	%rbp, %rdx
	je	.L10890
	cmpb	$115, %cl
	je	.L10962
.L10710:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L10715
	cmpb	$49, %al
	je	.L10715
	cmpb	$50, %al
	je	.L10715
	cmpb	$101, %al
	je	.L10715
.L10714:
	cmpl	$10, %r12d
	je	.L10963
	cmpb	$39, %cl
	je	.L10964
.L10723:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10728
	testb	$32, 17(%r13)
	je	.L10729
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L10730
	movq	integer_types+40(%rip), %r12
	movzwl	60(%r13), %ebx
	movzwl	60(%r12), %r13d
	andl	$511, %ebx
	andl	$511, %r13d
	cmpl	%r13d, %ebx
	je	.L10730
.L10729:
	movq	integer_types+40(%rip), %rdi
.L10919:
	movq	%rbp, %rsi
.L10920:
	call	convert
.L10922:
	movq	%rax, %rbx
.L10699:
	movq	%rbx, %rbp
	jmp	.L10499
.L10730:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10919
.L10728:
	movl	flag_traditional(%rip), %r11d
	testl	%r11d, %r11d
	je	.L10731
	movl	flag_allow_single_precision(%rip), %edi
	testl	%edi, %edi
	jne	.L10731
	movq	global_trees+192(%rip), %r15
	cmpq	%r15, 128(%r13)
	je	.L10965
.L10731:
	cmpl	$5, %r12d
	je	.L10966
.L10732:
	movq	%rbp, %rbx
	jmp	.L10699
.L10966:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L10921:
	movq	global_trees(%rip), %rbx
	jmp	.L10699
.L10965:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10919
	.p2align 6,,7
.L10964:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L10723
	movq	integer_types+40(%rip), %r14
	movq	40(%rdx), %rdi
	movzwl	60(%r14), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10723
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	je	.L10729
	testb	$32, 17(%r13)
	jne	.L10730
	jmp	.L10729
	.p2align 6,,7
.L10963:
	movq	integer_types+40(%rip), %r10
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %ecx
	movzwl	60(%r10), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ecx, %ecx
	jne	.L10722
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10721
.L10722:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10721:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10919
.L10715:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L10714
.L10962:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r8
	cmpq	%r8, 8(%rsi)
	jne	.L10710
.L10713:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %rbp
	cmpb	$116, %cl
	jne	.L10967
.L10890:
	movq	32(%rbp), %rsi
	jmp	.L10713
.L10967:
	cmpb	$115, %cl
	jne	.L10710
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r9
	cmpq	%r9, 8(%rsi)
	je	.L10713
	jmp	.L10710
.L10961:
	movl	pedantic(%rip), %edi
	testl	%edi, %edi
	jne	.L10705
	cmpb	$51, 48(%rbp)
	je	.L10705
	cmpq	$0, current_function_decl(%rip)
	je	.L10707
	movzbl	17(%rbp), %r15d
	andb	$24, %r15b
	cmpb	$16, %r15b
	je	.L10968
.L10707:
	movq	%rbp, %rsi
.L10708:
	movq	%rsi, %rbp
	movq	8(%rsi), %rbx
	movzbl	16(%rsi), %ecx
.L10705:
	movq	%rbx, %r13
	jmp	.L10701
.L10968:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L10707
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L10707
	testb	$2, 17(%rax)
	je	.L10707
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L10708
	jmp	.L10707
	.p2align 6,,7
.L10960:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %ecx
	jmp	.L10701
.L10638:
	movzbl	16(%rbp), %ecx
	movl	%r12d, %edi
	movq	%rbp, %rdx
	xorl	%r12d, %r12d
	cmpb	$116, %cl
	je	.L10886
	cmpb	$115, %cl
	je	.L10969
.L10640:
	movzbl	%cl, %r10d 
	movzbl	tree_code_type(%r10), %eax
	cmpb	$60, %al
	je	.L10646
	cmpb	$49, %al
	je	.L10646
	cmpb	$50, %al
	je	.L10646
	cmpb	$101, %al
	je	.L10646
.L10645:
	cmpl	$23, %edi
	je	.L10970
	cmpl	$18, %edi
	jne	.L10732
	movzbl	%cl, %r9d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r9), %eax
	movq	8(%r13), %r14
	cmpb	$114, %al
	je	.L10651
	cmpb	$100, %al
	je	.L10651
.L10650:
	movzbl	17(%r13), %r8d
	movzbl	62(%r13), %r10d
	movl	$1, %r9d
	movzbl	16(%r13), %edi
	movl	%r8d, %esi
	movl	%r8d, %r15d
	movl	%r10d, %ebx
	shrb	$3, %sil
	shrb	$4, %r15b
	shrb	$5, %bl
	andl	$1, %esi
	andl	%r15d, %r9d
	andl	$1, %ebx
	addl	%esi, %esi
	sall	$2, %ebx
	orl	%esi, %r9d
	xorl	%esi, %esi
	orl	%ebx, %r9d
	cmpb	$20, %dil
	je	.L10971
.L10654:
	leal	0(,%rsi,8), %r13d
	orl	%r13d, %r9d
	jne	.L10653
	testl	%edx, %edx
	jne	.L10653
	testl	%r11d, %r11d
	je	.L10652
.L10653:
	movl	%r8d, %r9d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r9b
	movl	%r8d, %ecx
	andl	%r9d, %esi
	movl	%r10d, %r8d
	andl	$1, %ecx
	andl	$1, %r8d
	addl	%ecx, %ecx
	sall	$2, %r8d
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	orl	%r8d, %esi
	cmpb	$20, %dil
	je	.L10972
.L10656:
	leal	0(,%rcx,8), %r10d
	movq	%r14, %rdi
	orl	%r10d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbp), %ecx
	movq	%rax, %r14
.L10652:
	cmpb	$41, %cl
	je	.L10973
	cmpb	$47, %cl
	je	.L10974
	xorl	%r13d, %r13d
	testl	%r12d, %r12d
	je	.L10975
.L10695:
	movl	flag_isoc99(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L10696
	testl	%r13d, %r13d
	movq	%rbp, %rbx
	je	.L10699
.L10696:
	movq	%r14, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbp)
	movq	%rax, %rbx
	je	.L10976
	movl	$121, %edi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L10920
.L10976:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbp, %rdx
	call	build1
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L10921
	movq	%rbp, %rdi
	call	staticp
	movzbl	17(%rbx), %ebp
	movl	%eax, %r12d
	andb	$1, %r12b
	addb	%r12b, %r12b
	andb	$-4, %bpl
	orb	%r12b, %bpl
	movb	%bpl, 17(%rbx)
	jmp	.L10699
.L10975:
	movq	%rbp, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r13d
	jmp	.L10695
	.p2align 6,,7
.L10974:
	movq	40(%rbp), %rbx
	movq	8(%rbx), %r12
	movzbl	16(%r12), %r13d
	movq	%r12, %rax
	cmpl	$23, %r13d
	je	.L10660
	cmpl	$18, %r13d
	je	.L10660
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L10977
	movl	optimize(%rip), %r14d
	testl	%r14d, %r14d
	je	.L10663
	cmpb	$34, %dl
	je	.L10978
.L10663:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L10888
	cmpb	$115, %dl
	je	.L10979
.L10672:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L10677
	cmpb	$49, %al
	je	.L10677
	cmpb	$50, %al
	je	.L10677
	cmpb	$101, %al
	je	.L10677
.L10676:
	cmpl	$10, %r13d
	je	.L10980
	cmpb	$39, %dl
	je	.L10981
.L10685:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10690
	testb	$32, 17(%r12)
	je	.L10691
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L10692
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r12), %r14d
	movzwl	60(%rdx), %r10d
	andl	$511, %r14d
	andl	$511, %r10d
	cmpl	%r10d, %r14d
	je	.L10692
.L10691:
	movq	integer_types+40(%rip), %rdi
.L10918:
	movq	%rbx, %rsi
	call	convert
.L10661:
	movq	8(%rax), %rsi
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L10922
.L10692:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10918
.L10690:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10693
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L10693
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%r12)
	je	.L10982
.L10693:
	cmpl	$5, %r13d
	je	.L10983
	movq	%rbx, %rax
	jmp	.L10661
.L10983:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L10661
.L10982:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10918
.L10981:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L10685
	movq	integer_types+40(%rip), %r9
	movq	40(%rdx), %rdi
	movzwl	60(%r9), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10685
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10691
	testb	$32, 17(%r12)
	jne	.L10692
	jmp	.L10691
.L10980:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L10684
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10683
.L10684:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10683:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10918
.L10677:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L10676
.L10979:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%rsi)
	jne	.L10672
.L10675:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L10984
.L10888:
	movq	32(%rbx), %rsi
	jmp	.L10675
.L10984:
	cmpb	$115, %dl
	jne	.L10672
	movq	32(%rsi), %r8
	movq	8(%rbx), %r15
	cmpq	%r15, 8(%r8)
	movq	%r8, %rsi
	je	.L10675
	jmp	.L10672
.L10978:
	movl	pedantic(%rip), %r12d
	testl	%r12d, %r12d
	jne	.L10667
	cmpb	$51, 48(%rbx)
	je	.L10667
	cmpq	$0, current_function_decl(%rip)
	je	.L10669
	movzbl	17(%rbx), %r11d
	andb	$24, %r11b
	cmpb	$16, %r11b
	je	.L10985
.L10669:
	movq	%rbx, %rsi
.L10670:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L10667:
	movq	%rax, %r12
	jmp	.L10663
.L10985:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L10669
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L10669
	testb	$2, 17(%rax)
	je	.L10669
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L10670
	jmp	.L10669
.L10977:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L10663
.L10660:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L10661
.L10973:
	movq	72(%r14), %rdi
	movq	32(%rbp), %rsi
	jmp	.L10920
	.p2align 6,,7
.L10972:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L10656
.L10971:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L10654
.L10651:
	movzbl	17(%rbp), %edi
	movl	$1, %r11d
	movl	%edi, %edx
	shrb	$3, %dil
	shrb	$4, %dl
	andl	%edi, %r11d
	andl	$1, %edx
	jmp	.L10650
.L10970:
	movl	$121, %edi
	movq	%rbp, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10922
.L10646:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L10645
.L10969:
	movq	32(%rbp), %rsi
	cmpq	%rbx, 8(%rsi)
	jne	.L10640
.L10644:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbp
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r12d
	cmpb	$116, %cl
	jne	.L10986
.L10886:
	movq	32(%rbp), %rsi
	jmp	.L10644
.L10986:
	cmpb	$115, %cl
	jne	.L10640
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r11
	cmpq	%r11, 8(%rsi)
	je	.L10644
	jmp	.L10640
.L10521:
	movq	8(%rbp), %rax
	movq	%rax, %rdi
	movzbl	16(%rax), %eax
	cmpb	$6, %al
	je	.L10522
	cmpb	$10, %al
	je	.L10522
	cmpb	$11, %al
	je	.L10522
	cmpb	$12, %al
	jne	.L10500
.L10522:
	movzbl	16(%rdi), %r14d
	movq	%rbp, %r12
	movq	%rdi, %rbx
	cmpl	$23, %r14d
	je	.L10524
	cmpl	$18, %r14d
	je	.L10524
	movzbl	16(%rbp), %eax
	cmpb	$32, %al
	je	.L10987
	movl	optimize(%rip), %r8d
	testl	%r8d, %r8d
	je	.L10587
	cmpb	$34, %al
	je	.L10988
.L10587:
	movzbl	16(%r12), %ecx
	movq	%r12, %rdx
	cmpb	$116, %cl
	je	.L10884
	cmpb	$115, %cl
	je	.L10989
.L10596:
	movzbl	%cl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L10601
	cmpb	$49, %al
	je	.L10601
	cmpb	$50, %al
	je	.L10601
	cmpb	$101, %al
	je	.L10601
.L10600:
	cmpl	$10, %r14d
	je	.L10990
	cmpb	$39, %cl
	je	.L10991
.L10609:
	movq	%rbx, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10614
	testb	$32, 17(%rbx)
	je	.L10615
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L10616
	movq	integer_types+40(%rip), %r11
	movzwl	60(%rbx), %r8d
	movzwl	60(%r11), %ebx
	andl	$511, %r8d
	andl	$511, %ebx
	cmpl	%ebx, %r8d
	je	.L10616
.L10615:
	movq	integer_types+40(%rip), %rdi
.L10913:
	movq	%r12, %rsi
.L10914:
	call	convert
.L10916:
	movq	%rax, %rbx
.L10585:
	movzbl	16(%r15), %esi
	movq	8(%rbx), %rcx
	cmpb	$10, %sil
	je	.L10992
.L10619:
	movzwl	60(%rcx), %r14d
	andl	$511, %r14d
	cmpl	%r14d, 76(%rsp)
	je	.L10621
	movl	44(%rsp), %ecx
	movl	$.LC120, %edi
	incl	%ecx
.L10917:
	movq	64(%rsp), %rdx
	xorl	%esi, %esi
	call	warn_for_assignment
	jmp	.L10500
.L10621:
	movzbl	17(%r15), %eax
	movzbl	17(%rcx), %ebx
	shrb	$5, %al
	shrb	$5, %bl
	andl	$1, %eax
	andl	$1, %ebx
	cmpl	%ebx, %eax
	je	.L10500
	cmpb	$10, %sil
	je	.L10500
	movzbl	16(%rbp), %ecx
	cmpb	$25, %cl
	je	.L10993
.L10627:
	cmpb	$115, %cl
	je	.L10994
.L10629:
	movq	8(%rbp), %rcx
	movzwl	60(%r15), %esi
	movzwl	60(%rcx), %r8d
	andl	$511, %esi
	andl	$511, %r8d
	cmpl	%esi, %r8d
	jge	.L10631
	testb	$32, 17(%rcx)
	jne	.L10500
.L10631:
	testb	$32, 17(%r15)
	je	.L10633
	movl	44(%rsp), %ecx
	movl	$.LC121, %edi
	incl	%ecx
	jmp	.L10917
.L10633:
	movl	44(%rsp), %ecx
	movl	$.LC122, %edi
	incl	%ecx
	jmp	.L10917
.L10994:
	movq	32(%rbp), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L10629
	movq	%r15, %rsi
	call	int_fits_type_p
	testl	%eax, %eax
	jne	.L10500
	jmp	.L10629
.L10993:
	movq	%rbp, %rdi
	movq	%r15, %rsi
	call	int_fits_type_p
	testl	%eax, %eax
	jne	.L10500
	movzbl	16(%rbp), %ecx
	jmp	.L10627
	.p2align 6,,7
.L10992:
	movq	8(%rbp), %rdi
	movq	128(%rdi), %r12
	cmpq	%r12, 128(%r15)
	jne	.L10619
	jmp	.L10500
.L10616:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10913
.L10614:
	movl	flag_traditional(%rip), %r13d
	testl	%r13d, %r13d
	je	.L10617
	movl	flag_allow_single_precision(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L10617
	movq	global_trees+192(%rip), %r9
	cmpq	%r9, 128(%rbx)
	je	.L10995
.L10617:
	cmpl	$5, %r14d
	je	.L10996
.L10618:
	movq	%r12, %rbx
	jmp	.L10585
.L10996:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L10915:
	movq	global_trees(%rip), %rbx
	jmp	.L10585
.L10995:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10913
	.p2align 6,,7
.L10991:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L10609
	movq	integer_types+40(%rip), %rcx
	movq	40(%rdx), %rdi
	movzwl	60(%rcx), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10609
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10615
	testb	$32, 17(%rbx)
	jne	.L10616
	jmp	.L10615
	.p2align 6,,7
.L10990:
	movq	integer_types+40(%rip), %rsi
	movzwl	60(%rbx), %edx
	movl	flag_traditional(%rip), %r14d
	movzwl	60(%rsi), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r14d, %r14d
	jne	.L10608
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10607
.L10608:
	testb	$32, 17(%rbx)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10607:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10913
.L10601:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L10600
.L10989:
	movq	32(%r12), %rsi
	movq	8(%r12), %r13
	cmpq	%r13, 8(%rsi)
	jne	.L10596
.L10599:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r12
	cmpb	$116, %cl
	jne	.L10997
.L10884:
	movq	32(%r12), %rsi
	jmp	.L10599
.L10997:
	cmpb	$115, %cl
	jne	.L10596
	movq	32(%rsi), %r9
	movq	8(%r12), %r10
	cmpq	%r10, 8(%r9)
	movq	%r9, %rsi
	je	.L10599
	jmp	.L10596
.L10988:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L10590
	cmpb	$51, 48(%rbp)
	je	.L10590
	cmpq	$0, current_function_decl(%rip)
	je	.L10593
	movzbl	17(%rbp), %r11d
	andb	$24, %r11b
	cmpb	$16, %r11b
	je	.L10998
.L10593:
	movq	%rbp, %rsi
.L10594:
	movq	%rsi, %r12
.L10591:
	movq	8(%r12), %rbx
	jmp	.L10587
.L10998:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L10593
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L10593
	testb	$2, 17(%rax)
	je	.L10593
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L10594
	jmp	.L10593
.L10590:
	movq	%rbp, %r12
	jmp	.L10591
	.p2align 6,,7
.L10987:
	movq	104(%rbp), %r12
	jmp	.L10587
.L10524:
	movzbl	16(%rbp), %edx
	xorl	%r13d, %r13d
	movq	%rbp, %r12
	cmpb	$116, %dl
	je	.L10859
	cmpb	$115, %dl
	je	.L10999
	movzbl	16(%rbp), %ecx
.L10526:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L10532
	cmpb	$49, %al
	je	.L10532
	cmpb	$50, %al
	je	.L10532
	cmpb	$101, %al
	je	.L10532
.L10531:
	cmpl	$23, %r14d
	je	.L11000
	cmpl	$18, %r14d
	jne	.L10618
	movzbl	%cl, %r10d 
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	movzbl	tree_code_type(%r10), %eax
	movq	8(%rdi), %r11
	cmpb	$114, %al
	je	.L10537
	cmpb	$100, %al
	je	.L10537
.L10536:
	movzbl	17(%rdi), %r8d
	movl	$1, %r9d
	movl	%r8d, %r10d
	movl	%r8d, %r14d
	shrb	$3, %r10b
	shrb	$4, %r14b
	andl	$1, %r10d
	andl	%r14d, %r9d
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rdi), %r10d
	movzbl	16(%rdi), %edi
	movl	%r10d, %esi
	shrb	$5, %sil
	andl	$1, %esi
	sall	$2, %esi
	orl	%esi, %r9d
	xorl	%esi, %esi
	cmpb	$20, %dil
	je	.L11001
.L10540:
	leal	0(,%rsi,8), %r14d
	orl	%r14d, %r9d
	jne	.L10539
	testl	%edx, %edx
	jne	.L10539
	testl	%ebx, %ebx
	je	.L10538
.L10539:
	movl	%r8d, %r14d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r14b
	movl	%r10d, %r9d
	movl	%r8d, %ecx
	andl	%r14d, %esi
	andl	$1, %r9d
	andl	$1, %ecx
	sall	$2, %r9d
	addl	%ecx, %ecx
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	orl	%r9d, %esi
	cmpb	$20, %dil
	je	.L11002
.L10542:
	leal	0(,%rcx,8), %r8d
	leal	(%rbx,%rbx), %edi
	orl	%r8d, %esi
	orl	%edx, %esi
	orl	%edi, %esi
	movq	%r11, %rdi
	call	c_build_qualified_type
	movzbl	16(%r12), %ecx
	movq	%rax, %r11
.L10538:
	cmpb	$41, %cl
	je	.L11003
	cmpb	$47, %cl
	je	.L11004
	xorl	%r14d, %r14d
	testl	%r13d, %r13d
	je	.L11005
.L10581:
	movl	flag_isoc99(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L10582
	testl	%r14d, %r14d
	movq	%r12, %rbx
	je	.L10585
.L10582:
	movq	%r11, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r12)
	movq	%rax, %rbx
	je	.L11006
	movl	$121, %edi
	movq	%r12, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L10914
.L11006:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r12, %rdx
	call	build1
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L10915
	movq	%r12, %rdi
	call	staticp
	movzbl	17(%rbx), %r12d
	movl	%eax, %ecx
	andb	$1, %cl
	addb	%cl, %cl
	andb	$-4, %r12b
	orb	%cl, %r12b
	movb	%r12b, 17(%rbx)
	jmp	.L10585
.L11005:
	movq	%r12, %rdi
	movq	%r11, (%rsp)
	call	lvalue_p
	movq	(%rsp), %r11
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r14d
	jmp	.L10581
.L11004:
	movq	40(%r12), %rbx
	movq	8(%rbx), %r13
	movzbl	16(%r13), %r14d
	movq	%r13, %rax
	cmpl	$23, %r14d
	je	.L10546
	cmpl	$18, %r14d
	je	.L10546
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L11007
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L10549
	cmpb	$34, %dl
	je	.L11008
.L10549:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L10882
	cmpb	$115, %dl
	je	.L11009
.L10558:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L10563
	cmpb	$49, %al
	je	.L10563
	cmpb	$50, %al
	je	.L10563
	cmpb	$101, %al
	je	.L10563
.L10562:
	cmpl	$10, %r14d
	je	.L11010
	cmpb	$39, %dl
	je	.L11011
.L10571:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10576
	testb	$32, 17(%r13)
	je	.L10577
	movl	flag_traditional(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L10578
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r13), %r10d
	movzwl	60(%rdx), %r13d
	andl	$511, %r10d
	andl	$511, %r13d
	cmpl	%r13d, %r10d
	je	.L10578
.L10577:
	movq	integer_types+40(%rip), %rdi
.L10912:
	movq	%rbx, %rsi
	call	convert
.L10547:
	movq	8(%rax), %rsi
	movq	32(%r12), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L10916
.L10578:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10912
.L10576:
	movl	flag_traditional(%rip), %r9d
	testl	%r9d, %r9d
	je	.L10579
	movl	flag_allow_single_precision(%rip), %edi
	testl	%edi, %edi
	jne	.L10579
	movq	global_trees+192(%rip), %rsi
	cmpq	%rsi, 128(%r13)
	je	.L11012
.L10579:
	cmpl	$5, %r14d
	je	.L11013
	movq	%rbx, %rax
	jmp	.L10547
.L11013:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L10547
.L11012:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10912
.L11011:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L10571
	movq	integer_types+40(%rip), %r8
	movq	40(%rdx), %rdi
	movzwl	60(%r8), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10571
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10577
	testb	$32, 17(%r13)
	jne	.L10578
	jmp	.L10577
.L11010:
	movq	integer_types+40(%rip), %r14
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %ecx
	movzwl	60(%r14), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ecx, %ecx
	jne	.L10570
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10569
.L10570:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10569:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10912
.L10563:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L10562
.L11009:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L10558
.L10561:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L11014
.L10882:
	movq	32(%rbx), %rsi
	jmp	.L10561
.L11014:
	cmpb	$115, %dl
	jne	.L10558
	movq	32(%rsi), %rdi
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rdi)
	movq	%rdi, %rsi
	je	.L10561
	jmp	.L10558
.L11008:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L10553
	cmpb	$51, 48(%rbx)
	je	.L10553
	cmpq	$0, current_function_decl(%rip)
	je	.L10555
	movzbl	17(%rbx), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L11015
.L10555:
	movq	%rbx, %rsi
.L10556:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L10553:
	movq	%rax, %r13
	jmp	.L10549
.L11015:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L10555
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L10555
	testb	$2, 17(%rax)
	je	.L10555
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L10556
	jmp	.L10555
.L11007:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L10549
.L10546:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L10547
.L11003:
	movq	72(%r11), %rdi
	movq	32(%r12), %rsi
	jmp	.L10914
.L11002:
	testq	%r11, %r11
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L10542
.L11001:
	testq	%r11, %r11
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L10540
	.p2align 6,,7
.L10537:
	movzbl	17(%r12), %r14d
	movl	%r14d, %edx
	shrb	$3, %r14b
	shrb	$4, %dl
	movl	%r14d, %ebx
	andl	$1, %edx
	andl	$1, %ebx
	jmp	.L10536
.L11000:
	movl	$121, %edi
	movq	%r12, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10916
.L10532:
	movl	24(%rbp), %eax
	movl	%eax, 24(%r12)
	jmp	.L10531
.L10999:
	movq	32(%rbp), %r8
	cmpq	%rbx, 8(%r8)
	je	.L10859
	movl	$115, %ecx
	jmp	.L10526
.L10859:
	movq	32(%rbp), %rsi
	movl	%edx, %ecx
.L10530:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r12
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r13d
	cmpb	$116, %cl
	jne	.L11016
	movq	32(%r12), %rsi
	jmp	.L10530
.L11016:
	cmpb	$115, %cl
	jne	.L10526
	movq	32(%rsi), %rsi
	movq	8(%r12), %r11
	cmpq	%r11, 8(%rsi)
	je	.L10530
	jmp	.L10526
.L10954:
	movq	8(%rbp), %rbx
	cmpb	$8, 16(%rbx)
	je	.L11017
	cmpb	$7, %dl
	jne	.L10517
	movq	8(%rbp), %rdi
	cmpb	$7, 16(%rdi)
	jne	.L10517
	movq	global_trees+192(%rip), %r13
	movzwl	60(%r13), %edx
	andl	$511, %edx
	cmpl	%edx, 76(%rsp)
	jne	.L10500
	movl	44(%rsp), %ecx
	movl	$.LC119, %edi
	incl	%ecx
	jmp	.L10917
	.p2align 6,,7
.L11017:
	movl	44(%rsp), %ecx
	movl	$.LC118, %edi
	incl	%ecx
	jmp	.L10917
.L10953:
	movq	8(%rbp), %r9
	movzbl	16(%r9), %eax
	cmpb	$6, %al
	je	.L10513
	cmpb	$10, %al
	je	.L10513
	cmpb	$11, %al
	je	.L10513
	cmpb	$12, %al
	jne	.L10512
.L10513:
	movl	44(%rsp), %ecx
	movl	$.LC117, %edi
	incl	%ecx
	jmp	.L10917
.L10952:
	movq	8(%rbp), %r14
	movzbl	16(%r14), %eax
	cmpb	$6, %al
	je	.L10510
	cmpb	$10, %al
	je	.L10510
	cmpb	$11, %al
	je	.L10510
	cmpb	$12, %al
	jne	.L10509
.L10510:
	movl	44(%rsp), %ecx
	movl	$.LC116, %edi
	incl	%ecx
	jmp	.L10917
.L10951:
	movq	8(%rbp), %r10
	cmpb	$7, 16(%r10)
	jne	.L10507
	movl	44(%rsp), %ecx
	movl	$.LC115, %edi
	incl	%ecx
	jmp	.L10917
	.p2align 6,,7
.L10505:
	movq	8(%rbp), %r11
	cmpb	$8, 16(%r11)
	jne	.L10504
	movl	44(%rsp), %ecx
	movl	$.LC114, %edi
	incl	%ecx
	jmp	.L10917
.L10503:
	movq	8(%rbp), %rsi
	cmpb	$7, 16(%rsi)
	jne	.L10502
	movl	44(%rsp), %ecx
	movq	64(%rsp), %rdx
	movl	$.LC113, %edi
	xorl	%esi, %esi
	incl	%ecx
	call	warn_for_assignment
	movzbl	16(%r15), %edx
	jmp	.L10502
.L10950:
	movl	44(%rsp), %esi
	movl	$.LC112, %edi
	xorl	%eax, %eax
	incl	%esi
	call	error
	jmp	.L10499
.L10497:
	movq	8(%rbp), %rbx
	cmpb	$7, 16(%rbx)
	movq	%rbx, %r8
	je	.L11018
.L10734:
	movzbl	16(%r8), %r12d
	movq	%r8, %rax
	cmpl	$23, %r12d
	je	.L10737
	cmpl	$18, %r12d
	je	.L10737
	movzbl	16(%rbp), %ecx
	cmpb	$32, %cl
	je	.L11019
	movl	optimize(%rip), %r9d
	testl	%r9d, %r9d
	je	.L10794
	cmpb	$34, %cl
	je	.L11020
.L10794:
	cmpb	$116, %cl
	movq	%rbp, %rdx
	je	.L10896
	cmpb	$115, %cl
	je	.L11021
.L10803:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L10808
	cmpb	$49, %al
	je	.L10808
	cmpb	$50, %al
	je	.L10808
	cmpb	$101, %al
	je	.L10808
.L10807:
	cmpl	$10, %r12d
	je	.L11022
	cmpb	$39, %cl
	je	.L11023
.L10813:
	movq	%rbx, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10816
	testb	$32, 17(%rbx)
	je	.L10817
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L10818
	movq	integer_types+40(%rip), %r9
	movzwl	60(%rbx), %r14d
	movzwl	60(%r9), %ebx
	andl	$511, %r14d
	andl	$511, %ebx
	cmpl	%ebx, %r14d
	je	.L10818
.L10817:
	movq	integer_types+40(%rip), %rdi
.L10925:
	movq	%rbp, %rsi
.L10926:
	call	convert
.L10928:
	movq	%rax, %rbx
.L10792:
	xorl	%edi, %edi
	movq	%rbx, %rsi
	jmp	.L10929
.L10818:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10925
.L10816:
	movl	flag_traditional(%rip), %ecx
	testl	%ecx, %ecx
	je	.L10819
	movl	flag_allow_single_precision(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L10819
	movq	global_trees+192(%rip), %r8
	cmpq	%r8, 128(%rbx)
	je	.L11024
.L10819:
	cmpl	$5, %r12d
	je	.L11025
.L10820:
	movq	%rbp, %rbx
	jmp	.L10792
.L11025:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L10927:
	movq	global_trees(%rip), %rbx
	jmp	.L10792
.L11024:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10925
	.p2align 6,,7
.L11023:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L10813
	movq	integer_types+40(%rip), %r10
	movq	40(%rdx), %rdi
	movzwl	60(%r10), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10813
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10817
	testb	$32, 17(%rbx)
	jne	.L10818
	jmp	.L10817
	.p2align 6,,7
.L11022:
	movq	integer_types+40(%rip), %r15
	movzwl	60(%rbx), %edx
	movl	flag_traditional(%rip), %r12d
	movzwl	60(%r15), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r12d, %r12d
	jne	.L10812
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10811
.L10812:
	testb	$32, 17(%rbx)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10811:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10925
.L10808:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L10807
.L11021:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r8
	cmpq	%r8, 8(%rsi)
	jne	.L10803
	.p2align 4,,7
.L10806:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %rbp
	cmpb	$116, %cl
	jne	.L11026
.L10896:
	movq	32(%rbp), %rsi
	jmp	.L10806
.L11026:
	cmpb	$115, %cl
	jne	.L10803
	movq	32(%rsi), %r11
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%r11)
	movq	%r11, %rsi
	je	.L10806
	jmp	.L10803
.L11020:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L10794
	cmpb	$51, 48(%rbp)
	je	.L10794
	cmpq	$0, current_function_decl(%rip)
	je	.L10800
	movzbl	17(%rbp), %ecx
	andb	$24, %cl
	cmpb	$16, %cl
	je	.L11027
.L10800:
	movq	%rbp, %rsi
.L10801:
	movq	%rsi, %rbp
	movq	8(%rsi), %rbx
.L10924:
	movzbl	16(%rbp), %ecx
	jmp	.L10794
.L11027:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L10800
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L10800
	testb	$2, 17(%rax)
	je	.L10800
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L10801
	jmp	.L10800
	.p2align 6,,7
.L11019:
	movq	104(%rbp), %rbp
	jmp	.L10924
.L10737:
	movzbl	16(%rbp), %ecx
	xorl	%ebx, %ebx
	movl	%r12d, %edx
	movq	%rbp, %rdi
	cmpb	$116, %cl
	je	.L10892
	cmpb	$115, %cl
	je	.L11028
.L10739:
	movzbl	%cl, %r14d 
	movzbl	tree_code_type(%r14), %eax
	cmpb	$60, %al
	je	.L10745
	cmpb	$49, %al
	je	.L10745
	cmpb	$50, %al
	je	.L10745
	cmpb	$101, %al
	je	.L10745
.L10744:
	cmpl	$23, %edx
	je	.L11029
	cmpl	$18, %edx
	jne	.L10820
	movzbl	%cl, %r12d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r12), %eax
	movq	8(%r8), %r13
	cmpb	$114, %al
	je	.L10750
	cmpb	$100, %al
	je	.L10750
.L10749:
	movzbl	17(%r8), %edi
	movl	$1, %r9d
	movl	%edi, %r10d
	movl	%edi, %esi
	shrb	$4, %r10b
	shrb	$3, %sil
	andl	%r10d, %r9d
	andl	$1, %esi
	movzbl	62(%r8), %r10d
	movzbl	16(%r8), %r8d
	addl	%esi, %esi
	orl	%esi, %r9d
	xorl	%esi, %esi
	movl	%r10d, %r15d
	shrb	$5, %r15b
	andl	$1, %r15d
	sall	$2, %r15d
	orl	%r15d, %r9d
	cmpb	$20, %r8b
	je	.L11030
.L10753:
	leal	0(,%rsi,8), %r14d
	orl	%r14d, %r9d
	jne	.L10752
	testl	%edx, %edx
	jne	.L10752
	testl	%r11d, %r11d
	je	.L10751
.L10752:
	movl	%edi, %r12d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %dil
	shrb	$4, %r12b
	movl	%r10d, %ecx
	movl	%edi, %r9d
	andl	%r12d, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %r8b
	je	.L11031
.L10754:
	leal	0(,%rcx,8), %edi
	leal	(%r11,%r11), %r8d
	orl	%edi, %esi
	movq	%r13, %rdi
	orl	%edx, %esi
	orl	%r8d, %esi
	call	c_build_qualified_type
	movzbl	16(%rbp), %ecx
	movq	%rax, %r13
.L10751:
	cmpb	$41, %cl
	je	.L11032
	cmpb	$47, %cl
	je	.L11033
	xorl	%r12d, %r12d
	testl	%ebx, %ebx
	je	.L11034
.L10788:
	movl	flag_isoc99(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L10789
	testl	%r12d, %r12d
	movq	%rbp, %rbx
	je	.L10792
.L10789:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbp)
	movq	%rax, %rbx
	je	.L11035
	movl	$121, %edi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L10926
.L11035:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbp, %rdx
	call	build1
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L10927
	movq	%rbp, %rdi
	call	staticp
	movzbl	17(%rbx), %ebp
	movl	%eax, %r14d
	andb	$1, %r14b
	addb	%r14b, %r14b
	andb	$-4, %bpl
	orb	%r14b, %bpl
	movb	%bpl, 17(%rbx)
	jmp	.L10792
.L11034:
	movq	%rbp, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L10788
.L11033:
	movq	40(%rbp), %rbx
	movq	8(%rbx), %r12
	movzbl	16(%r12), %r13d
	movq	%r12, %rax
	cmpl	$23, %r13d
	je	.L10758
	cmpl	$18, %r13d
	je	.L10758
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L11036
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L10761
	cmpb	$34, %dl
	je	.L11037
.L10761:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L10894
	cmpb	$115, %dl
	je	.L11038
.L10770:
	movzbl	%dl, %r9d 
	movzbl	tree_code_type(%r9), %eax
	cmpb	$60, %al
	je	.L10775
	cmpb	$49, %al
	je	.L10775
	cmpb	$50, %al
	je	.L10775
	cmpb	$101, %al
	je	.L10775
.L10774:
	cmpl	$10, %r13d
	je	.L11039
	cmpb	$39, %dl
	je	.L11040
.L10780:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10783
	testb	$32, 17(%r12)
	je	.L10784
	movl	flag_traditional(%rip), %edi
	testl	%edi, %edi
	jne	.L10785
	movq	integer_types+40(%rip), %rsi
	movzwl	60(%r12), %r11d
	movzwl	60(%rsi), %r12d
	andl	$511, %r11d
	andl	$511, %r12d
	cmpl	%r12d, %r11d
	je	.L10785
.L10784:
	movq	integer_types+40(%rip), %rdi
.L10923:
	movq	%rbx, %rsi
	call	convert
.L10759:
	movq	8(%rax), %rsi
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L10928
.L10785:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10923
	.p2align 6,,7
.L10783:
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	je	.L10786
	movl	flag_allow_single_precision(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L10786
	movq	global_trees+192(%rip), %r10
	cmpq	%r10, 128(%r12)
	je	.L11041
.L10786:
	cmpl	$5, %r13d
	je	.L11042
	movq	%rbx, %rax
	jmp	.L10759
.L11042:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L10759
.L11041:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10923
	.p2align 6,,7
.L11040:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L10780
	movq	integer_types+40(%rip), %r8
	movq	40(%rdx), %rdi
	movzwl	60(%r8), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10780
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10784
	testb	$32, 17(%r12)
	jne	.L10785
	jmp	.L10784
	.p2align 6,,7
.L11039:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L10779
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10778
.L10779:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10778:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10923
.L10775:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L10774
.L11038:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r15
	cmpq	%r15, 8(%rsi)
	jne	.L10770
.L10773:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L11043
.L10894:
	movq	32(%rbx), %rsi
	jmp	.L10773
.L11043:
	cmpb	$115, %dl
	jne	.L10770
	movq	32(%rsi), %r14
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%r14)
	movq	%r14, %rsi
	je	.L10773
	jmp	.L10770
.L11037:
	movl	pedantic(%rip), %esi
	testl	%esi, %esi
	jne	.L10765
	cmpb	$51, 48(%rbx)
	je	.L10765
	cmpq	$0, current_function_decl(%rip)
	je	.L10767
	movzbl	17(%rbx), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L11044
.L10767:
	movq	%rbx, %rsi
.L10768:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L10765:
	movq	%rax, %r12
	jmp	.L10761
.L11044:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L10767
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L10767
	testb	$2, 17(%rax)
	je	.L10767
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L10768
	jmp	.L10767
	.p2align 6,,7
.L11036:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L10761
.L10758:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L10759
.L11032:
	movq	72(%r13), %rdi
	movq	32(%rbp), %rsi
	jmp	.L10926
.L11031:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L10754
.L11030:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L10753
.L10750:
	movzbl	17(%rbp), %edi
	movl	$1, %r11d
	movl	%edi, %edx
	shrb	$3, %dil
	shrb	$4, %dl
	andl	%edi, %r11d
	andl	$1, %edx
	jmp	.L10749
.L11029:
	movl	$121, %edi
	movq	%rbp, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10928
.L10745:
	movl	24(%rdi), %eax
	movl	%eax, 24(%rbp)
	jmp	.L10744
.L11028:
	movq	32(%rbp), %rsi
	cmpq	%rax, 8(%rsi)
	jne	.L10739
	.p2align 4,,7
.L10743:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbp
	movzbl	16(%rsi), %ecx
	cmove	%eax, %ebx
	cmpb	$116, %cl
	jne	.L11045
.L10892:
	movq	32(%rbp), %rsi
	jmp	.L10743
.L11045:
	cmpb	$115, %cl
	jne	.L10739
	movq	32(%rsi), %rsi
	movq	8(%rbp), %r10
	cmpq	%r10, 8(%rsi)
	je	.L10743
	jmp	.L10739
.L11018:
	movq	global_trees+200(%rip), %rdi
	movzwl	60(%rbx), %esi
	movzwl	60(%rdi), %r9d
	andl	$511, %esi
	andl	$511, %r9d
	cmpl	%r9d, %esi
	jge	.L10734
	movq	%rbp, %rsi
	call	convert
	xorl	%edi, %edi
	movq	%rax, %rsi
	jmp	.L10929
.L10949:
	movq	32(%rax), %rdx
	movl	$.LC70, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L10908
.L10489:
	movl	$.LC65, %edi
.L10911:
	xorl	%eax, %eax
	call	error
	jmp	.L10908
.L10488:
	movl	$.LC64, %esi
	jmp	.L10485
.L10490:
	movq	24(%rdx), %rax
	testq	%rax, %rax
	je	.L10491
	cmpq	$0, 112(%rax)
	je	.L11046
	movq	8(%rdx), %rdx
	movzbl	16(%rdx), %ecx
	jmp	.L10484
.L11046:
	movl	$.LC66, %edi
	jmp	.L10911
.L10491:
	movl	$.LC67, %edi
	jmp	.L10911
	.p2align 6,,7
.L10487:
	movl	$.LC63, %esi
	jmp	.L10485
.L10948:
	movq	72(%rbp), %rax
	movl	$.LC61, %edi
	jmp	.L10909
	.p2align 6,,7
.L10947:
	movzbl	%cl, %r14d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r14), %eax
	movq	8(%rdi), %r13
	cmpb	$114, %al
	je	.L10428
	cmpb	$100, %al
	je	.L10428
.L10427:
	movzbl	17(%rdi), %r8d
	movl	$1, %esi
	movl	%r8d, %r10d
	movl	%r8d, %r9d
	shrb	$4, %r10b
	shrb	$3, %r9b
	andl	%r10d, %esi
	andl	$1, %r9d
	movzbl	62(%rdi), %r10d
	movzbl	16(%rdi), %edi
	addl	%r9d, %r9d
	orl	%r9d, %esi
	xorl	%r9d, %r9d
	movl	%r10d, %r12d
	shrb	$5, %r12b
	andl	$1, %r12d
	sall	$2, %r12d
	orl	%r12d, %esi
	cmpb	$20, %dil
	je	.L11047
.L10431:
	leal	0(,%r9,8), %r14d
	orl	%r14d, %esi
	jne	.L10430
	testl	%edx, %edx
	jne	.L10430
	testl	%r11d, %r11d
	je	.L10429
.L10430:
	movl	%r8d, %r9d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r9b
	movl	%r10d, %ecx
	movl	%r8d, %r12d
	andl	%r9d, %esi
	andl	$1, %ecx
	andl	$1, %r12d
	sall	$2, %ecx
	addl	%r12d, %r12d
	orl	%r12d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L11048
.L10433:
	leal	0(,%rcx,8), %r8d
	leal	(%r11,%r11), %edi
	orl	%r8d, %esi
	orl	%edx, %esi
	orl	%edi, %esi
	movq	%r13, %rdi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r13
.L10429:
	cmpb	$41, %cl
	je	.L11049
	cmpb	$47, %cl
	je	.L11050
	xorl	%r12d, %r12d
	testl	%ebp, %ebp
	je	.L11051
.L10472:
	movl	flag_isoc99(%rip), %ebp
	testl	%ebp, %ebp
	jne	.L10473
	testl	%r12d, %r12d
	je	.L10426
.L10473:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L11052
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
.L10935:
	call	convert
.L10907:
	movq	%rax, %rbp
	jmp	.L10904
.L11052:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	mark_addressable
	testl	%eax, %eax
	jne	.L10475
	movq	global_trees(%rip), %rsi
	movq	%rsi, %rbp
	jmp	.L10425
.L10475:
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%rbp), %ebx
	movl	%eax, %edi
	andb	$1, %dil
	addb	%dil, %dil
	andb	$-4, %bl
	orb	%dil, %bl
	movb	%bl, 17(%rbp)
	jmp	.L10904
.L11051:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L10472
.L11050:
	movq	40(%rbx), %rbp
	movq	8(%rbp), %r12
	movzbl	16(%r12), %r13d
	movq	%r12, %rax
	cmpl	$23, %r13d
	je	.L10437
	cmpl	$18, %r13d
	je	.L10437
	movzbl	16(%rbp), %edx
	cmpb	$32, %dl
	je	.L11053
	movl	optimize(%rip), %esi
	testl	%esi, %esi
	je	.L10440
	cmpb	$34, %dl
	je	.L11054
.L10440:
	cmpb	$116, %dl
	movq	%rbp, %rcx
	je	.L10877
	cmpb	$115, %dl
	je	.L11055
.L10449:
	movzbl	%dl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L10454
	cmpb	$49, %al
	je	.L10454
	cmpb	$50, %al
	je	.L10454
	cmpb	$101, %al
	je	.L10454
.L10453:
	cmpl	$10, %r13d
	je	.L11056
	cmpb	$39, %dl
	je	.L11057
.L10462:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10467
	testb	$32, 17(%r12)
	je	.L10468
	movl	flag_traditional(%rip), %esi
	testl	%esi, %esi
	jne	.L10469
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r12), %r11d
	movzwl	60(%rdx), %r12d
	andl	$511, %r11d
	andl	$511, %r12d
	cmpl	%r12d, %r11d
	je	.L10469
.L10468:
	movq	integer_types+40(%rip), %rdi
.L10903:
	movq	%rbp, %rsi
	call	convert
.L10438:
	movq	8(%rax), %rsi
	movq	32(%rbx), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L10907
.L10469:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10903
.L10467:
	movl	flag_traditional(%rip), %r10d
	testl	%r10d, %r10d
	je	.L10470
	movl	flag_allow_single_precision(%rip), %r14d
	testl	%r14d, %r14d
	jne	.L10470
	movq	global_trees+192(%rip), %r9
	cmpq	%r9, 128(%r12)
	je	.L11058
.L10470:
	cmpl	$5, %r13d
	je	.L11059
	movq	%rbp, %rax
	jmp	.L10438
.L11059:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L10438
.L11058:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10903
	.p2align 6,,7
.L11057:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L10462
	movq	integer_types+40(%rip), %r8
	movq	40(%rdx), %rdi
	movzwl	60(%r8), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10462
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10468
	testb	$32, 17(%r12)
	jne	.L10469
	jmp	.L10468
	.p2align 6,,7
.L11056:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L10461
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10460
.L10461:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10460:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10903
.L10454:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L10453
.L11055:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L10449
.L10452:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbp
	cmpb	$116, %dl
	jne	.L11060
.L10877:
	movq	32(%rbp), %rsi
	jmp	.L10452
.L11060:
	cmpb	$115, %dl
	jne	.L10449
	movq	32(%rsi), %r9
	movq	8(%rbp), %r14
	cmpq	%r14, 8(%r9)
	movq	%r9, %rsi
	je	.L10452
	jmp	.L10449
.L11054:
	movl	pedantic(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L10444
	cmpb	$51, 48(%rbp)
	je	.L10444
	cmpq	$0, current_function_decl(%rip)
	je	.L10446
	movzbl	17(%rbp), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L11061
.L10446:
	movq	%rbp, %rsi
.L10447:
	movq	%rsi, %rbp
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L10444:
	movq	%rax, %r12
	jmp	.L10440
.L11061:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L10446
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L10446
	testb	$2, 17(%rax)
	je	.L10446
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L10447
	jmp	.L10446
	.p2align 6,,7
.L11053:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %edx
	jmp	.L10440
.L10437:
	movq	%rbp, %rdi
	call	default_function_array_conversion
	jmp	.L10438
.L11049:
	movq	72(%r13), %rdi
	movq	32(%rbx), %rsi
	jmp	.L10935
.L11048:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L10433
.L11047:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %r9d
	jmp	.L10431
.L10428:
	movzbl	17(%rbx), %r8d
	movl	$1, %r11d
	movl	%r8d, %edx
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	%r8d, %r11d
	andl	$1, %edx
	jmp	.L10427
.L10946:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10907
.L10423:
	movl	24(%r8), %eax
	movl	%eax, 24(%rbx)
	jmp	.L10422
.L10945:
	movq	32(%rbx), %rsi
	cmpq	%rdi, 8(%rsi)
	jne	.L10417
	.p2align 4,,7
.L10421:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbx
	movzbl	16(%rsi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L11062
.L10875:
	movq	32(%rbx), %rsi
	jmp	.L10421
.L11062:
	cmpb	$115, %cl
	jne	.L10417
	movq	32(%rsi), %r9
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%r9)
	movq	%r9, %rsi
	je	.L10421
	jmp	.L10417
.L10944:
	movq	32(%rbx), %rbx
	movzbl	16(%rbx), %ecx
	jmp	.L10415
.L10943:
	cmpq	$0, 64(%rsp)
	jne	.L10897
	movl	$.LC111, %edi
	xorl	%eax, %eax
	call	error
	jmp	.L10407
.L10897:
	movq	64(%rsp), %r15
	movl	$.LC110, %edi
	xorl	%eax, %eax
	movq	32(%r15), %rsi
	call	error
	jmp	.L10407
.L10399:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10899
.L10397:
	movl	flag_traditional(%rip), %r10d
	testl	%r10d, %r10d
	je	.L10400
	movl	flag_allow_single_precision(%rip), %r14d
	testl	%r14d, %r14d
	jne	.L10400
	movq	global_trees+192(%rip), %r8
	cmpq	%r8, 128(%r12)
	je	.L11063
.L10400:
	cmpl	$5, %ebp
	je	.L11064
.L10401:
	movq	%rbx, %rbp
	jmp	.L10368
.L11064:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L10901:
	movq	global_trees(%rip), %rbp
	jmp	.L10368
.L11063:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10899
	.p2align 6,,7
.L10941:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L10392
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%rdi), %esi
	movq	40(%rdx), %rdi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10392
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	je	.L10398
	testb	$32, 17(%r12)
	jne	.L10399
	jmp	.L10398
	.p2align 6,,7
.L10940:
	movq	integer_types+40(%rip), %r11
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %ecx
	movzwl	60(%r11), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ecx, %ecx
	jne	.L10391
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10390
.L10391:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10390:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10899
.L10384:
	movl	24(%rdx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L10383
.L10939:
	movq	32(%rbx), %rdi
	movq	8(%rbx), %r14
	cmpq	%r14, 8(%rdi)
	jne	.L10379
	.p2align 4,,7
.L10382:
	movzbl	16(%rdi), %ecx
	movq	%rdi, %rbx
	cmpb	$116, %cl
	jne	.L11065
.L10873:
	movq	32(%rbx), %rdi
	jmp	.L10382
.L11065:
	cmpb	$115, %cl
	jne	.L10379
	movq	32(%rdi), %r15
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%r15)
	movq	%r15, %rdi
	je	.L10382
	jmp	.L10379
.L10938:
	movl	pedantic(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L10374
	cmpb	$51, 48(%rbx)
	je	.L10374
	cmpq	$0, current_function_decl(%rip)
	je	.L10376
	movzbl	17(%rbx), %r8d
	andb	$24, %r8b
	cmpb	$16, %r8b
	je	.L11066
.L10376:
	movq	%rbx, %rdi
.L10377:
	movq	%rdi, %rbx
	movzbl	16(%rdi), %ecx
	movq	8(%rdi), %rax
.L10374:
	movq	%rax, %r12
	jmp	.L10370
.L11066:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L10376
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L10376
	testb	$2, 17(%rax)
	je	.L10376
	cmpb	$46, %dl
	movq	%rax, %rdi
	jne	.L10377
	jmp	.L10376
	.p2align 6,,7
.L10937:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %ecx
	jmp	.L10370
.L10307:
	movl	%ebp, %edx
	movq	%rbx, %rsi
	xorl	%ebp, %ebp
	cmpb	$116, %cl
	je	.L10869
	cmpb	$115, %cl
	je	.L11067
.L10309:
	movzbl	%cl, %r11d 
	movzbl	tree_code_type(%r11), %eax
	cmpb	$60, %al
	je	.L10315
	cmpb	$49, %al
	je	.L10315
	cmpb	$50, %al
	je	.L10315
	cmpb	$101, %al
	je	.L10315
.L10314:
	cmpl	$23, %edx
	je	.L11068
	cmpl	$18, %edx
	jne	.L10401
	movzbl	%cl, %r14d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r14), %eax
	movq	8(%r12), %r13
	cmpb	$114, %al
	je	.L10320
	cmpb	$100, %al
	je	.L10320
.L10319:
	movzbl	17(%r12), %r8d
	movl	$1, %esi
	movl	%r8d, %r9d
	movl	%r8d, %r10d
	shrb	$3, %r9b
	shrb	$4, %r10b
	andl	$1, %r9d
	andl	%r10d, %esi
	xorl	%r10d, %r10d
	addl	%r9d, %r9d
	orl	%r9d, %esi
	movzbl	62(%r12), %r9d
	movl	%r9d, %edi
	shrb	$5, %dil
	andl	$1, %edi
	sall	$2, %edi
	orl	%edi, %esi
	movzbl	16(%r12), %edi
	cmpb	$20, %dil
	je	.L11069
.L10323:
	leal	0(,%r10,8), %r12d
	orl	%r12d, %esi
	jne	.L10322
	testl	%edx, %edx
	jne	.L10322
	testl	%r11d, %r11d
	je	.L10321
.L10322:
	movl	%r8d, %r14d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r14b
	movl	%r8d, %ecx
	andl	%r14d, %esi
	movl	%r9d, %r8d
	andl	$1, %ecx
	andl	$1, %r8d
	addl	%ecx, %ecx
	sall	$2, %r8d
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	orl	%r8d, %esi
	cmpb	$20, %dil
	je	.L11070
.L10325:
	leal	0(,%rcx,8), %r15d
	movq	%r13, %rdi
	orl	%r15d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r13
.L10321:
	cmpb	$41, %cl
	je	.L11071
	cmpb	$47, %cl
	je	.L11072
	xorl	%r12d, %r12d
	testl	%ebp, %ebp
	je	.L11073
.L10364:
	movl	flag_isoc99(%rip), %ebp
	testl	%ebp, %ebp
	jne	.L10365
	testl	%r12d, %r12d
	movq	%rbx, %rbp
	je	.L10368
.L10365:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %rbp
	je	.L11074
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbp, %rdi
	movq	%rax, %rsi
	jmp	.L10900
.L11074:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	mark_addressable
	testl	%eax, %eax
	je	.L10901
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%rbp), %ebx
	movl	%eax, %edi
	andb	$1, %dil
	addb	%dil, %dil
	andb	$-4, %bl
	orb	%dil, %bl
	movb	%bl, 17(%rbp)
	jmp	.L10368
.L11073:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L10364
.L11072:
	movq	40(%rbx), %rbp
	movq	8(%rbp), %r12
	movzbl	16(%r12), %r13d
	movq	%r12, %rax
	cmpl	$23, %r13d
	je	.L10329
	cmpl	$18, %r13d
	je	.L10329
	movzbl	16(%rbp), %edx
	cmpb	$32, %dl
	je	.L11075
	movl	optimize(%rip), %esi
	testl	%esi, %esi
	je	.L10332
	cmpb	$34, %dl
	je	.L11076
.L10332:
	cmpb	$116, %dl
	movq	%rbp, %rcx
	je	.L10871
	cmpb	$115, %dl
	je	.L11077
.L10341:
	movzbl	%dl, %r14d 
	movzbl	tree_code_type(%r14), %eax
	cmpb	$60, %al
	je	.L10346
	cmpb	$49, %al
	je	.L10346
	cmpb	$50, %al
	je	.L10346
	cmpb	$101, %al
	je	.L10346
.L10345:
	cmpl	$10, %r13d
	je	.L11078
	cmpb	$39, %dl
	je	.L11079
.L10354:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L10359
	testb	$32, 17(%r12)
	je	.L10360
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L10361
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r12), %esi
	movzwl	60(%rdx), %r12d
	andl	$511, %esi
	andl	$511, %r12d
	cmpl	%r12d, %esi
	je	.L10361
.L10360:
	movq	integer_types+40(%rip), %rdi
.L10898:
	movq	%rbp, %rsi
	call	convert
.L10330:
	movq	8(%rax), %rsi
	movq	32(%rbx), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L10902
.L10361:
	movq	integer_types+48(%rip), %rdi
	jmp	.L10898
.L10359:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10362
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L10362
	movq	global_trees+192(%rip), %r11
	cmpq	%r11, 128(%r12)
	je	.L11080
.L10362:
	cmpl	$5, %r13d
	je	.L11081
	movq	%rbp, %rax
	jmp	.L10330
.L11081:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L10330
.L11080:
	movq	global_trees+200(%rip), %rdi
	jmp	.L10898
	.p2align 6,,7
.L11079:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L10354
	movq	integer_types+40(%rip), %r15
	movq	40(%rdx), %rdi
	movzwl	60(%r15), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L10354
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L10360
	testb	$32, 17(%r12)
	jne	.L10361
	jmp	.L10360
	.p2align 6,,7
.L11078:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L10353
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L10352
.L10353:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L10352:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L10898
.L10346:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbp)
	jmp	.L10345
.L11077:
	movq	32(%rbp), %rsi
	movq	8(%rbp), %r9
	cmpq	%r9, 8(%rsi)
	jne	.L10341
.L10344:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbp
	cmpb	$116, %dl
	jne	.L11082
.L10871:
	movq	32(%rbp), %rsi
	jmp	.L10344
.L11082:
	cmpb	$115, %dl
	jne	.L10341
	movq	32(%rsi), %r8
	movq	8(%rbp), %r10
	cmpq	%r10, 8(%r8)
	movq	%r8, %rsi
	je	.L10344
	jmp	.L10341
.L11076:
	movl	pedantic(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L10336
	cmpb	$51, 48(%rbp)
	je	.L10336
	cmpq	$0, current_function_decl(%rip)
	je	.L10338
	movzbl	17(%rbp), %edi
	andb	$24, %dil
	cmpb	$16, %dil
	je	.L11083
.L10338:
	movq	%rbp, %rsi
.L10339:
	movq	%rsi, %rbp
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L10336:
	movq	%rax, %r12
	jmp	.L10332
.L11083:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L10338
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L10338
	testb	$2, 17(%rax)
	je	.L10338
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L10339
	jmp	.L10338
	.p2align 6,,7
.L11075:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %edx
	jmp	.L10332
.L10329:
	movq	%rbp, %rdi
	call	default_function_array_conversion
	jmp	.L10330
.L11071:
	movq	72(%r13), %rdi
	movq	32(%rbx), %rsi
	jmp	.L10900
.L11070:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L10325
.L11069:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L10323
.L10320:
	movzbl	17(%rbx), %r15d
	movl	$1, %r11d
	movl	%r15d, %edx
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	%r15d, %r11d
	andl	$1, %edx
	jmp	.L10319
.L11068:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L10902
.L10315:
	movl	24(%rsi), %eax
	movl	%eax, 24(%rbx)
	jmp	.L10314
.L11067:
	movq	32(%rbx), %rdi
	cmpq	%r12, 8(%rdi)
	jne	.L10309
	.p2align 4,,7
.L10313:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rdi, %rbx
	movzbl	16(%rdi), %ecx
	cmove	%eax, %ebp
	cmpb	$116, %cl
	jne	.L11084
.L10869:
	movq	32(%rbx), %rdi
	jmp	.L10313
.L11084:
	cmpb	$115, %cl
	jne	.L10309
	movq	32(%rdi), %rdi
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rdi)
	je	.L10313
	jmp	.L10309
.L10936:
	movq	72(%rbx), %rdx
	movq	%rdx, 64(%rsp)
	cmpq	$0, 120(%rbx)
	je	.L11085
.L10303:
	movzbl	17(%rbx), %eax
	movq	8(%rbx), %rdi
	testb	$16, %al
	setne	%r9b
	movzbl	%r9b, %esi
	movl	%esi, %ecx
	orl	$2, %ecx
	andb	$8, %al
	cmovne	%ecx, %esi
	call	build_qualified_type
	movq	%rbx, 56(%rsp)
	movq	%rax, %rdi
	call	build_pointer_type
	movq	56(%rsp), %rdx
	movl	$121, %edi
	movq	%rax, %rsi
	call	build1
	movq	%rax, 48(%rsp)
	jmp	.L10305
.L11085:
	movq	%rbx, %rdi
	call	*lang_set_decl_assembler_name(%rip)
	jmp	.L10303
	.p2align 6,,7
.L10300:
	movzbl	16(%rax), %ecx
	movq	%rax, %rbx
	leal	-114(%rcx), %esi
	cmpb	$2, %sil
	ja	.L10297
	movq	32(%rax), %rax
	cmpq	%rdx, %rax
	je	.L10297
	movq	8(%rax), %rdi
	cmpq	%rdi, 8(%rbx)
	je	.L10300
	jmp	.L10297
.L10848:
	movl	$.LC68, %edi
	movl	$163, %esi
	movl	$.LC69, %edx
	call	fancy_abort
.LFE27:
.Lfe27:
	.size	build_function_call,.Lfe27-build_function_call
	.section	.rodata.str1.32
	.align 32
.LC133:
	.string	"comparisons like X<=Y<=Z do not have their mathematical meaning"
	.align 32
.LC132:
	.string	"suggest parentheses around comparison in operand of &"
	.align 32
.LC131:
	.string	"suggest parentheses around + or - in operand of &"
	.align 32
.LC130:
	.string	"suggest parentheses around comparison in operand of ^"
	.align 32
.LC129:
	.string	"suggest parentheses around arithmetic in operand of ^"
	.align 32
.LC128:
	.string	"suggest parentheses around comparison in operand of |"
	.align 32
.LC127:
	.string	"suggest parentheses around arithmetic in operand of |"
	.align 32
.LC126:
	.string	"suggest parentheses around && within ||"
	.align 32
.LC125:
	.string	"suggest parentheses around + or - inside shift"
	.text
	.align 2
	.p2align 4,,15
.globl parser_build_binary_op
	.type	parser_build_binary_op,@function
parser_build_binary_op:
.LFB28:
	pushq	%r15
.LCFI111:
	movl	$1, %ecx
	xorl	%r15d, %r15d
	pushq	%r14
.LCFI112:
	xorl	%r14d, %r14d
	pushq	%r13
.LCFI113:
	movq	%rdx, %r13
	pushq	%r12
.LCFI114:
	movl	%edi, %r12d
	pushq	%rbp
.LCFI115:
	pushq	%rbx
.LCFI116:
	movq	%rsi, %rbx
	subq	$8, %rsp
.LCFI117:
	call	build_binary_op
	movzbq	16(%rbx), %rcx
	movq	%rax, %rbp
	cmpb	$0, 16(%rbp)
	movzbl	tree_code_type(%rcx), %edx
	movzbq	16(%r13), %rcx
	movzbl	tree_code_type(%rcx), %eax
	jne	.L11508
	movq	global_trees(%rip), %rax
.L11507:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 6,,7
.L11508:
	cmpb	$60, %dl
	je	.L11510
	cmpb	$49, %dl
	je	.L11510
	cmpb	$50, %dl
	je	.L11510
	cmpb	$101, %dl
	je	.L11510
.L11509:
	cmpb	$60, %al
	je	.L11512
	cmpb	$49, %al
	je	.L11512
	cmpb	$50, %al
	je	.L11512
	cmpb	$101, %al
	je	.L11512
.L11511:
	movl	warn_parentheses(%rip), %eax
	testl	%eax, %eax
	je	.L11513
	leal	-82(%r12), %edx
	cmpl	$1, %edx
	ja	.L11514
	leal	-59(%r15), %esi
	cmpl	$1, %esi
	jbe	.L11516
	cmpl	$59, %r14d
	je	.L11516
	cmpl	$60, %r14d
	je	.L11516
.L11514:
	cmpl	$92, %r12d
	je	.L11540
.L11517:
	cmpl	$86, %r12d
	je	.L11541
.L11520:
	cmpl	$87, %r12d
	je	.L11542
.L11525:
	cmpl	$88, %r12d
	je	.L11543
.L11513:
	movslq	%r12d,%rdi
	cmpb	$60, tree_code_type(%rdi)
	je	.L11544
.L11535:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	unsigned_conversion_warning
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	unsigned_conversion_warning
	movq	%rbp, %rdi
	call	overflow_warning
	movzbq	16(%rbp), %rbx
	movzbl	tree_code_type(%rbx), %eax
	cmpb	$60, %al
	je	.L11538
	cmpb	$49, %al
	je	.L11538
	cmpb	$50, %al
	je	.L11538
	cmpb	$101, %al
	je	.L11538
	movq	8(%rbp), %rsi
	movzbl	17(%rbp), %r14d
	movq	%rbp, %rdx
	movl	$116, %edi
	call	build1
	movl	%r12d, 24(%rax)
	shrb	$1, %r14b
	movq	%rax, %rbp
	movzbl	17(%rax), %r12d
	andl	$1, %r14d
	leal	(%r14,%r14), %r13d
	andb	$-3, %r12b
	orb	%r13b, %r12b
	movb	%r12b, 17(%rax)
.L11539:
	movq	%rbp, %rax
	jmp	.L11507
	.p2align 6,,7
.L11538:
	movl	%r12d, 24(%rbp)
	jmp	.L11539
	.p2align 6,,7
.L11544:
	movl	extra_warnings(%rip), %eax
	testl	%eax, %eax
	je	.L11535
	movslq	%r15d,%r8
	cmpb	$60, tree_code_type(%r8)
	je	.L11536
	movslq	%r14d,%r15
	cmpb	$60, tree_code_type(%r15)
	jne	.L11535
.L11536:
	movl	$.LC133, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L11535
.L11543:
	leal	-59(%r15), %ecx
	cmpl	$1, %ecx
	jbe	.L11532
	cmpl	$59, %r14d
	je	.L11532
	cmpl	$60, %r14d
	je	.L11532
.L11531:
	movslq	%r15d,%rdx
	cmpb	$60, tree_code_type(%rdx)
	je	.L11534
	movslq	%r14d,%rsi
	cmpb	$60, tree_code_type(%rsi)
	jne	.L11513
.L11534:
	movl	$.LC132, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L11513
.L11532:
	movl	$.LC131, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L11531
.L11542:
	cmpl	$88, %r15d
	je	.L11527
	cmpl	$59, %r15d
	je	.L11527
	cmpl	$60, %r15d
	je	.L11527
	cmpl	$88, %r14d
	je	.L11527
	cmpl	$59, %r14d
	je	.L11527
	cmpl	$60, %r14d
	je	.L11527
.L11526:
	movslq	%r15d,%r10
	cmpb	$60, tree_code_type(%r10)
	je	.L11529
	movslq	%r14d,%r11
	cmpb	$60, tree_code_type(%r11)
	jne	.L11525
.L11529:
	movl	$.LC130, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L11525
.L11527:
	movl	$.LC129, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L11526
.L11541:
	leal	-87(%r15), %edi
	cmpl	$1, %edi
	jbe	.L11522
	cmpl	$59, %r15d
	je	.L11522
	cmpl	$60, %r15d
	je	.L11522
	cmpl	$88, %r14d
	je	.L11522
	cmpl	$87, %r14d
	je	.L11522
	cmpl	$59, %r14d
	je	.L11522
	cmpl	$60, %r14d
	je	.L11522
.L11521:
	movslq	%r15d,%r8
	cmpb	$60, tree_code_type(%r8)
	je	.L11524
	movslq	%r14d,%r9
	cmpb	$60, tree_code_type(%r9)
	jne	.L11520
.L11524:
	movl	$.LC128, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L11520
.L11522:
	movl	$.LC127, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L11521
.L11540:
	cmpl	$91, %r15d
	je	.L11519
	cmpl	$91, %r14d
	jne	.L11517
.L11519:
	movl	$.LC126, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L11517
.L11516:
	movl	$.LC125, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L11514
	.p2align 6,,7
.L11512:
	movl	24(%r13), %r14d
	jmp	.L11511
	.p2align 6,,7
.L11510:
	movl	24(%rbx), %r15d
	jmp	.L11509
.LFE28:
.Lfe28:
	.size	parser_build_binary_op,.Lfe28-parser_build_binary_op
	.section	.rodata.str1.32
	.align 32
.LC134:
	.string	"left-hand operand of comma expression has no effect"
	.text
	.align 2
	.p2align 4,,15
.globl build_compound_expr
	.type	build_compound_expr,@function
build_compound_expr:
.LFB29:
	subq	$24, %rsp
.LCFI118:
	movq	%rbx, 8(%rsp)
.LCFI119:
	movq	%rbp, 16(%rsp)
.LCFI120:
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11546
	movq	32(%rbx), %rbp
.L11609:
	movq	%rbp, %rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	addq	$24, %rsp
	ret
	.p2align 6,,7
.L11546:
	xorl	%esi, %esi
	call	internal_build_compound_expr
	movq	32(%rbx), %rdi
	movq	%rax, %rbp
	testb	$1, 17(%rdi)
	jne	.L11610
	movl	extra_warnings(%rip), %eax
	testl	%eax, %eax
	jne	.L11612
	movl	warn_unused_value(%rip), %eax
	testl	%eax, %eax
	je	.L11611
.L11612:
	cmpb	$114, 16(%rdi)
	je	.L11619
.L11613:
	movl	$.LC134, %edi
	xorl	%eax, %eax
	call	warning
.L11611:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L11609
.L11615:
	movq	8(%rbp), %rsi
	movq	32(%rbx), %rdx
	movq	%rbp, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	movq	%rax, %rbp
	jmp	.L11609
.L11619:
	movq	8(%rdi), %rdx
	cmpb	$5, 16(%rdx)
	jne	.L11613
	jmp	.L11611
	.p2align 6,,7
.L11610:
	movl	warn_unused_value(%rip), %edx
	testl	%edx, %edx
	je	.L11615
	call	warn_if_unused_value
	jmp	.L11615
.LFE29:
.Lfe29:
	.size	build_compound_expr,.Lfe29-build_compound_expr
	.section	.rodata.str1.1
.LC135:
	.string	"cast specifies array type"
.LC136:
	.string	"cast specifies function type"
	.section	.rodata.str1.32
	.align 32
.LC157:
	.string	"cast to pointer from integer of different size"
	.align 32
.LC156:
	.string	"cast does not match function type"
	.align 32
.LC155:
	.string	"cast from pointer to integer of different size"
	.align 32
.LC153:
	.string	"cast discards qualifiers from pointer target type"
	.align 32
.LC152:
	.string	"cast adds new qualifiers to function type"
	.align 32
.LC151:
	.string	"cast to union type from type not present in union"
	.align 32
.LC149:
	.string	"variable-sized object may not be initialized"
	.align 32
.LC142:
	.string	"(near initialization for `%s')"
	.section	.rodata.str1.1
.LC141:
	.string	"[%d]"
.LC150:
	.string	"invalid initializer"
.LC147:
	.string	"initialization"
	.section	.rodata.str1.32
	.align 32
.LC146:
	.string	"initializer element is not constant"
	.align 32
.LC148:
	.string	"initializer element is not computable at load time"
	.align 32
.LC145:
	.string	"array initialized from non-constant array expression"
	.align 32
.LC144:
	.string	"initializer-string for array of chars is too long"
	.align 32
.LC143:
	.string	"int-array initialized from non-wide string"
	.align 32
.LC140:
	.string	"char-array initialized from wide string"
	.align 32
.LC138:
	.string	"ISO C forbids casts to union type"
	.align 32
.LC137:
	.string	"ISO C forbids casting nonscalar to the same type"
	.text
	.align 2
	.p2align 4,,15
.globl build_c_cast
	.type	build_c_cast,@function
build_c_cast:
.LFB30:
	pushq	%rbp
.LCFI121:
	movq	%rsp, %rbp
.LCFI122:
	pushq	%r15
.LCFI123:
	pushq	%r14
.LCFI124:
	pushq	%r13
.LCFI125:
	movq	%rsi, %r13
	pushq	%r12
.LCFI126:
	pushq	%rbx
.LCFI127:
	movq	%rsi, %rbx
	subq	$152, %rsp
.LCFI128:
	movq	global_trees(%rip), %rax
	cmpq	%rax, %rdi
	je	.L12720
	cmpq	%rax, %rsi
	je	.L12720
	movq	128(%rdi), %r14
	movl	$.LC135, %edi
	movzbl	16(%r14), %ecx
	cmpb	$18, %cl
	je	.L12721
	cmpb	$23, %cl
	movl	$.LC136, %edi
	je	.L12721
	movq	8(%rsi), %rdi
	cmpq	128(%rdi), %r14
	je	.L12733
	cmpb	$21, %cl
	je	.L12734
	cmpq	global_trees+216(%rip), %r14
	je	.L12735
	movzbl	16(%rsi), %ecx
	xorl	%r12d, %r12d
	movzbl	16(%rdi), %edx
	movq	%rsi, %r8
	cmpb	$116, %cl
	je	.L12701
	cmpb	$115, %cl
	je	.L12736
.L12502:
	movzbl	%cl, %r10d 
	movzbl	tree_code_type(%r10), %eax
	cmpb	$60, %al
	je	.L12508
	cmpb	$49, %al
	je	.L12508
	cmpb	$50, %al
	je	.L12508
	cmpb	$101, %al
	je	.L12508
.L12507:
	cmpl	$23, %edx
	je	.L12737
	cmpl	$18, %edx
	je	.L12738
	movq	%rbx, %r12
.L12510:
	movl	warn_cast_qual(%rip), %eax
	movq	8(%r12), %rbx
	testl	%eax, %eax
	je	.L12706
	movzbl	16(%r14), %ecx
	cmpb	$13, %cl
	je	.L12739
.L12575:
	cmpb	$6, %cl
	je	.L12740
.L12576:
	movl	warn_bad_function_cast(%rip), %eax
	testl	%eax, %eax
	je	.L12577
	cmpb	$53, 16(%r12)
	je	.L12741
.L12577:
	cmpb	$13, %cl
	je	.L12742
.L12578:
	movq	%r14, %rdi
	movq	%r12, %rsi
	call	convert
	cmpb	$25, 16(%rax)
	movq	%rax, %rbx
	je	.L12743
.L12707:
	movl	pedantic(%rip), %edx
.L11700:
	testl	%edx, %edx
	je	.L12580
	cmpb	$25, 16(%rbx)
	je	.L12744
.L12580:
	cmpq	%r13, %rbx
	je	.L12745
.L11692:
	leaq	-40(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
.L12745:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L11692
	movq	%rbx, %rdi
	call	non_lvalue
.L12720:
	movq	%rax, %rbx
	jmp	.L11692
.L12744:
	cmpb	$25, 16(%r13)
	jne	.L12580
	movq	8(%r13), %r12
	cmpb	$6, 16(%r12)
	je	.L12580
	movq	%rbx, %rdi
	call	non_lvalue
	movq	%rax, %rbx
	jmp	.L12580
	.p2align 6,,7
.L12743:
	movzbl	18(%r12), %edi
	movzbl	18(%rax), %r14d
	andb	$8, %dil
	andb	$-9, %r14b
	orb	%dil, %r14b
	movb	%r14b, 18(%rax)
	andb	$-5, %r14b
	movzbl	18(%r12), %esi
	andb	$4, %sil
	orb	%sil, %r14b
	movb	%r14b, 18(%rax)
	jmp	.L12707
.L12742:
	cmpb	$6, 16(%rbx)
	jne	.L12578
	movzwl	60(%r14), %r9d
	movzwl	60(%rbx), %r10d
	andl	$511, %r9d
	andl	$511, %r10d
	cmpl	%r10d, %r9d
	je	.L12578
	testb	$2, 17(%r12)
	jne	.L12578
	movl	$.LC157, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L12578
.L12741:
	cmpb	16(%rbx), %cl
	je	.L12577
	movl	$.LC156, %edi
	xorl	%eax, %eax
	call	warning
	movzbl	16(%r14), %ecx
	jmp	.L12577
.L12740:
	cmpb	$13, 16(%rbx)
	jne	.L12576
	movzwl	60(%r14), %r15d
	movzwl	60(%rbx), %r8d
	andl	$511, %r15d
	andl	$511, %r8d
	cmpl	%r8d, %r15d
	je	.L12576
	testb	$2, 17(%r12)
	jne	.L12576
	movl	$.LC155, %edi
	xorl	%eax, %eax
	call	warning
	movzbl	16(%r14), %ecx
	jmp	.L12576
.L12739:
	cmpb	$13, 16(%rbx)
	jne	.L12575
	movq	%r14, %rdi
	movq	%rbx, %rsi
	xorl	%r10d, %r10d
	xorl	%r15d, %r15d
.L12562:
	movq	8(%rsi), %rsi
	movq	8(%rdi), %rdi
	movzbl	16(%rsi), %r8d
	cmpb	$23, %r8b
	je	.L12746
	movzbl	16(%rdi), %r9d
.L12565:
	movzbl	17(%rsi), %ecx
	movzbl	62(%rsi), %r11d
	xorl	%eax, %eax
	movl	%ecx, %edx
	shrb	$5, %r11b
	shrb	$3, %cl
	shrb	$4, %dl
	andl	$1, %ecx
	andl	$1, %r11d
	andl	$1, %edx
	addl	%ecx, %ecx
	sall	$2, %r11d
	orl	%ecx, %edx
	orl	%r11d, %edx
	cmpb	$20, %r8b
	je	.L12747
.L12569:
	movzbl	17(%rdi), %r11d
	leal	0(,%rax,8), %ecx
	xorl	%eax, %eax
	orl	%edx, %ecx
	movl	%r11d, %edx
	shrb	$3, %r11b
	shrb	$4, %dl
	andl	$1, %r11d
	addl	%r11d, %r11d
	andl	$1, %edx
	orl	%r11d, %edx
	movzbl	62(%rdi), %r11d
	shrb	$5, %r11b
	andl	$1, %r11d
	sall	$2, %r11d
	orl	%r11d, %edx
	cmpb	$20, %r9b
	je	.L12748
.L12570:
	sall	$3, %eax
	orl	%eax, %edx
	notl	%edx
	andl	%edx, %ecx
	orl	%ecx, %r15d
.L12564:
	cmpb	$13, %r9b
	jne	.L12563
	cmpb	$13, %r8b
	je	.L12562
.L12563:
	testl	%r10d, %r10d
	jne	.L12749
.L12573:
	testl	%r15d, %r15d
	jne	.L12750
.L12706:
	movzbl	16(%r14), %ecx
	jmp	.L12575
.L12750:
	movl	$.LC153, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L12706
.L12749:
	movl	$.LC152, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L12573
.L12748:
	cmpq	$0, 8(%rdi)
	movl	$1, %r11d
	cmovne	%r11d, %eax
	jmp	.L12570
.L12747:
	cmpq	$0, 8(%rsi)
	movl	$1, %r11d
	cmovne	%r11d, %eax
	jmp	.L12569
.L12746:
	movzbl	16(%rdi), %r9d
	cmpb	$23, %r9b
	jne	.L12565
	movzbl	17(%rdi), %edx
	movzbl	62(%rdi), %ecx
	movl	%edx, %r11d
	shrb	$5, %cl
	shrb	$3, %dl
	shrb	$4, %r11b
	andl	$1, %edx
	andl	$1, %ecx
	addl	%edx, %edx
	andl	$1, %r11d
	sall	$2, %ecx
	orl	%edx, %r11d
	movzbl	17(%rsi), %edx
	orl	%ecx, %r11d
	movl	%edx, %ecx
	shrb	$3, %dl
	shrb	$4, %cl
	andl	$1, %edx
	addl	%edx, %edx
	andl	$1, %ecx
	orl	%edx, %ecx
	movzbl	62(%rsi), %edx
	shrb	$5, %dl
	andl	$1, %edx
	sall	$2, %edx
	orl	%edx, %ecx
	notl	%ecx
	andl	%ecx, %r11d
	orl	%r11d, %r10d
	jmp	.L12564
	.p2align 6,,7
.L12738:
	movzbl	%cl, %r8d 
	xorl	%edx, %edx
	xorl	%r15d, %r15d
	movzbl	tree_code_type(%r8), %eax
	movq	8(%rdi), %r11
	cmpb	$114, %al
	je	.L12513
	cmpb	$100, %al
	je	.L12513
.L12512:
	movzbl	17(%rdi), %r8d
	movl	$1, %esi
	movl	%r8d, %r10d
	movl	%r8d, %r9d
	shrb	$3, %r10b
	shrb	$4, %r9b
	andl	$1, %r10d
	andl	%r9d, %esi
	addl	%r10d, %r10d
	orl	%r10d, %esi
	movzbl	62(%rdi), %r10d
	movzbl	16(%rdi), %edi
	movl	%r10d, %r9d
	shrb	$5, %r9b
	andl	$1, %r9d
	sall	$2, %r9d
	orl	%r9d, %esi
	xorl	%r9d, %r9d
	cmpb	$20, %dil
	je	.L12751
.L12516:
	leal	0(,%r9,8), %eax
	orl	%eax, %esi
	jne	.L12515
	testl	%edx, %edx
	jne	.L12515
	testl	%r15d, %r15d
	je	.L12514
.L12515:
	movl	%r8d, %ecx
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %cl
	movl	%r8d, %r9d
	andl	%ecx, %esi
	movl	%r10d, %ecx
	andl	$1, %r9d
	andl	$1, %ecx
	addl	%r9d, %r9d
	sall	$2, %ecx
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L12752
.L12518:
	leal	0(,%rcx,8), %r8d
	leal	(%r15,%r15), %edi
	orl	%r8d, %esi
	orl	%edx, %esi
	orl	%edi, %esi
	movq	%r11, %rdi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r11
.L12514:
	cmpb	$41, %cl
	je	.L12753
	cmpb	$47, %cl
	je	.L12754
	xorl	%r15d, %r15d
	testl	%r12d, %r12d
	je	.L12755
.L12557:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L12558
	testl	%r15d, %r15d
	movq	%rbx, %r12
	je	.L12510
.L12558:
	movq	%r11, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %r12
	je	.L12756
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%r12, %rdi
	movq	%rax, %rsi
.L12732:
	call	convert
.L12719:
	movq	%rax, %r12
	jmp	.L12510
.L12756:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	mark_addressable
	testl	%eax, %eax
	jne	.L12560
	movq	global_trees(%rip), %r12
	jmp	.L12510
.L12560:
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%r12), %ebx
	movl	%eax, %edi
	andb	$1, %dil
	addb	%dil, %dil
	andb	$-4, %bl
	orb	%dil, %bl
	movb	%bl, 17(%r12)
	jmp	.L12510
.L12755:
	movq	%rbx, %rdi
	movq	%r11, -192(%rbp)
	call	lvalue_p
	movq	-192(%rbp), %r11
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r15d
	jmp	.L12557
.L12754:
	movq	40(%rbx), %r12
	movq	8(%r12), %r15
	movzbl	16(%r15), %edx
	movq	%r15, %rax
	cmpl	$23, %edx
	movl	%edx, -100(%rbp)
	je	.L12522
	cmpl	$18, %edx
	je	.L12522
	movzbl	16(%r12), %edx
	cmpb	$32, %dl
	je	.L12757
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L12525
	cmpb	$34, %dl
	je	.L12758
.L12525:
	cmpb	$116, %dl
	movq	%r12, %rcx
	je	.L12703
	cmpb	$115, %dl
	je	.L12759
.L12534:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L12539
	cmpb	$49, %al
	je	.L12539
	cmpb	$50, %al
	je	.L12539
	cmpb	$101, %al
	je	.L12539
.L12538:
	cmpl	$10, -100(%rbp)
	je	.L12760
	cmpb	$39, %dl
	je	.L12761
.L12547:
	movq	%r15, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L12552
	testb	$32, 17(%r15)
	je	.L12553
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L12554
	movq	integer_types+40(%rip), %r9
	movzwl	60(%r15), %r10d
	movzwl	60(%r9), %r15d
	andl	$511, %r10d
	andl	$511, %r15d
	cmpl	%r15d, %r10d
	je	.L12554
.L12553:
	movq	integer_types+40(%rip), %rdi
.L12718:
	movq	%r12, %rsi
	call	convert
.L12523:
	movq	8(%rax), %rsi
	movq	32(%rbx), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L12719
.L12554:
	movq	integer_types+48(%rip), %rdi
	jmp	.L12718
.L12552:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L12555
	movl	flag_allow_single_precision(%rip), %esi
	testl	%esi, %esi
	jne	.L12555
	movq	global_trees+192(%rip), %rcx
	cmpq	%rcx, 128(%r15)
	je	.L12762
.L12555:
	cmpl	$5, -100(%rbp)
	je	.L12763
	movq	%r12, %rax
	jmp	.L12523
.L12763:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L12523
.L12762:
	movq	global_trees+200(%rip), %rdi
	jmp	.L12718
	.p2align 6,,7
.L12761:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L12547
	movq	integer_types+40(%rip), %r8
	movq	40(%rdx), %rdi
	movzwl	60(%r8), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L12547
	movl	flag_traditional(%rip), %r11d
	testl	%r11d, %r11d
	je	.L12553
	testb	$32, 17(%r15)
	jne	.L12554
	jmp	.L12553
	.p2align 6,,7
.L12760:
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%r15), %edx
	movl	flag_traditional(%rip), %ecx
	movzwl	60(%rdi), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ecx, %ecx
	jne	.L12546
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L12545
.L12546:
	testb	$32, 17(%r15)
	movl	$1, %eax
	cmovne	%eax, %esi
.L12545:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L12718
.L12539:
	movl	24(%rcx), %eax
	movl	%eax, 24(%r12)
	jmp	.L12538
.L12759:
	movq	32(%r12), %rsi
	movq	8(%r12), %rax
	cmpq	%rax, 8(%rsi)
	jne	.L12534
.L12537:
	movzbl	16(%rsi), %edx
	movq	%rsi, %r12
	cmpb	$116, %dl
	jne	.L12764
.L12703:
	movq	32(%r12), %rsi
	jmp	.L12537
.L12764:
	cmpb	$115, %dl
	jne	.L12534
	movq	32(%rsi), %r9
	movq	8(%r12), %r10
	cmpq	%r10, 8(%r9)
	movq	%r9, %rsi
	je	.L12537
	jmp	.L12534
.L12758:
	movl	pedantic(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L12529
	cmpb	$51, 48(%r12)
	je	.L12529
	cmpq	$0, current_function_decl(%rip)
	je	.L12531
	movzbl	17(%r12), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L12765
.L12531:
	movq	%r12, %rsi
.L12532:
	movq	%rsi, %r12
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L12529:
	movq	%rax, %r15
	jmp	.L12525
.L12765:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L12531
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L12531
	testb	$2, 17(%rax)
	je	.L12531
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L12532
	jmp	.L12531
	.p2align 6,,7
.L12757:
	movq	104(%r12), %r12
	movzbl	16(%r12), %edx
	jmp	.L12525
.L12522:
	movq	%r12, %rdi
	call	default_function_array_conversion
	jmp	.L12523
.L12753:
	movq	72(%r11), %rdi
	movq	32(%rbx), %rsi
	jmp	.L12732
.L12752:
	testq	%r11, %r11
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L12518
.L12751:
	testq	%r11, %r11
	movl	$1, %eax
	cmovne	%eax, %r9d
	jmp	.L12516
.L12513:
	movzbl	17(%rbx), %esi
	movl	$1, %r15d
	movl	%esi, %edx
	shrb	$3, %sil
	shrb	$4, %dl
	andl	%esi, %r15d
	andl	$1, %edx
	jmp	.L12512
.L12737:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L12719
.L12508:
	movl	24(%r8), %eax
	movl	%eax, 24(%rbx)
	jmp	.L12507
.L12736:
	movq	32(%rsi), %rsi
	cmpq	%rdi, 8(%rsi)
	jne	.L12502
	.p2align 4,,7
.L12506:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbx
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r12d
	cmpb	$116, %cl
	jne	.L12766
.L12701:
	movq	32(%rbx), %rsi
	jmp	.L12506
.L12766:
	cmpb	$115, %cl
	jne	.L12502
	movq	32(%rsi), %r15
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%r15)
	movq	%r15, %rsi
	je	.L12506
	jmp	.L12502
.L12735:
	movl	$114, %edi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	call	build1
	jmp	.L12720
.L12734:
	movzbl	16(%rsi), %ecx
	xorl	%r12d, %r12d
	movzbl	16(%rdi), %edx
	movq	%rsi, %r8
	cmpb	$116, %cl
	je	.L12693
	cmpb	$115, %cl
	je	.L12767
.L11703:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L11709
	cmpb	$49, %al
	je	.L11709
	cmpb	$50, %al
	je	.L11709
	cmpb	$101, %al
	je	.L11709
.L11708:
	cmpl	$23, %edx
	je	.L12768
	cmpl	$18, %edx
	je	.L12769
	movq	%rbx, -112(%rbp)
.L11711:
	movq	24(%r14), %r13
	testq	%r13, %r13
	je	.L11926
.L11925:
	movq	-112(%rbp), %rax
	movq	8(%r13), %r11
	movq	8(%rax), %rcx
	movq	128(%r11), %rbx
	movq	128(%rcx), %r12
	cmpq	%r12, %rbx
	je	.L12711
	testq	%rbx, %rbx
	je	.L12711
	testq	%r12, %r12
	je	.L12711
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L12711
	movzbl	16(%r12), %eax
	testb	%al, %al
	je	.L12711
	cmpb	$6, %dl
	je	.L12770
.L11770:
	cmpb	$6, %al
	je	.L12771
.L11771:
	cmpb	$10, %dl
	je	.L12772
.L11772:
	cmpb	$10, 16(%r12)
	je	.L12773
.L11773:
	cmpq	%r12, %rbx
	movl	$1, %r15d
	je	.L11769
	movzbl	16(%rbx), %esi
	cmpb	16(%r12), %sil
	je	.L11775
	xorl	%r15d, %r15d
.L11769:
	testl	%r15d, %r15d
	jne	.L11763
.L12691:
	movq	(%r13), %r13
	testq	%r13, %r13
	jne	.L11925
.L11926:
	movl	$.LC151, %edi
.L12721:
	xorl	%eax, %eax
	call	error
	movq	global_trees(%rip), %rbx
	jmp	.L11692
.L11763:
	testq	%r13, %r13
	je	.L11926
	movl	pedantic(%rip), %edi
	testl	%edi, %edi
	jne	.L12774
.L11931:
	movq	-112(%rbp), %rsi
	movq	%r13, %rdi
	movq	%r14, %r15
	call	build_tree_list
	xorl	%edx, %edx
	movq	%r14, %rsi
	movq	%rax, %rcx
	movl	$46, %edi
	xorl	%eax, %eax
	call	build
	movq	global_trees(%rip), %rdx
	movq	%rax, %r13
	movzbl	16(%r14), %eax
	movq	%r13, %rdi
	cmpq	%rdx, %r14
	movl	%eax, -68(%rbp)
	movq	%rdx, %rax
	je	.L11933
	cmpq	%rdx, %r13
	je	.L11933
	cmpq	%rdx, 8(%r13)
	je	.L11933
	cmpb	$116, 16(%r13)
	je	.L12775
.L11935:
	call	fold
	cmpl	$18, -68(%rbp)
	movq	%rax, %rbx
	je	.L12776
.L11936:
	testq	%rbx, %rbx
	je	.L12176
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L12777
.L12176:
	movl	-68(%rbp), %eax
	subl	$6, %eax
	cmpl	$1, %eax
	jbe	.L12361
	cmpl	$13, -68(%rbp)
	je	.L12361
	cmpl	$10, -68(%rbp)
	je	.L12361
	cmpl	$11, -68(%rbp)
	je	.L12361
	cmpl	$8, -68(%rbp)
	je	.L12361
	movq	32(%r14), %rax
	testq	%rax, %rax
	je	.L12413
	cmpb	$25, 16(%rax)
	je	.L12413
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC149, %esi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %r10
	xorl	%r12d, %r12d
	cmpq	%r10, %r13
	movq	%r13, %rbx
	movq	%r10, %r14
	jae	.L12645
.L12420:
	cmpl	$3, (%rbx)
	je	.L12778
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L12416:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L12420
.L12645:
	movslq	%r12d,%rbx
	movq	%r13, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L12659
.L12434:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L12779
	cmpl	$2, %eax
	je	.L12780
.L12428:
	movq	8(%r12), %rsi
	movzbl	(%rsi), %r11d
	leaq	1(%rsi), %rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	je	.L12424
.L12433:
	movzbl	(%rcx), %edx
	incq	%rbx
	incq	%rcx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	jne	.L12433
.L12424:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L12434
.L12659:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	jne	.L12781
.L12498:
	movq	global_trees(%rip), %rbx
.L11934:
	movq	-112(%rbp), %rcx
	movzbl	17(%rbx), %r12d
	movzbl	17(%rcx), %eax
	andb	$-3, %r12b
	andb	$2, %al
	orb	%al, %r12b
	movb	%r12b, 17(%rbx)
	jmp	.L11692
.L12781:
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L12498
.L12780:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L12428
.L12779:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L12424
.L12778:
	addl	$25, %r12d
	jmp	.L12416
	.p2align 6,,7
.L12413:
	movl	flag_traditional(%rip), %r12d
	testl	%r12d, %r12d
	je	.L12438
	movq	$0, -184(%rbp)
	xorl	%ebx, %ebx
	movzbl	16(%r14), %eax
	cmpb	$20, %al
	je	.L12472
	cmpb	$18, %al
	je	.L12472
	cmpb	$22, %al
	je	.L12472
	cmpb	$21, %al
	je	.L12472
.L12650:
	cmpq	%r15, %r14
	je	.L12498
	movq	%r15, %rdi
	movq	%r13, %rsi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	call	digest_init
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	build_tree_list
	movq	-184(%rbp), %r14
	movq	%rax, 40(%r14)
	jmp	.L11934
	.p2align 6,,7
.L12472:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movl	$46, %edi
	movq	%r15, %rsi
	call	build
	cmpq	$0, -184(%rbp)
	movq	%rax, %r12
	jne	.L12442
	movq	%rax, %rbx
.L12443:
	movq	%r12, -184(%rbp)
	cmpb	$18, 16(%r15)
	je	.L12782
	movq	24(%r15), %rax
	testq	%rax, %rax
	je	.L12446
	movq	8(%rax), %r15
.L12439:
	movzbl	16(%r15), %eax
	cmpb	$20, %al
	je	.L12472
	cmpb	$18, %al
	je	.L12472
	cmpb	$22, %al
	je	.L12472
	cmpb	$21, %al
	je	.L12472
	jmp	.L12650
	.p2align 6,,7
.L12446:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC150, %esi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %r9
	xorl	%r12d, %r12d
	cmpq	%r9, %r13
	movq	%r13, %rbx
	movq	%r9, %r14
	jae	.L12652
.L12454:
	cmpl	$3, (%rbx)
	je	.L12783
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L12450:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L12454
.L12652:
	movslq	%r12d,%r15
	movq	%r13, %r12
	addq	$16, %r15
	andq	$-16, %r15
	subq	%r15, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L12659
.L12468:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L12784
	cmpl	$2, %eax
	je	.L12785
.L12462:
	movq	8(%r12), %r13
	movzbl	(%r13), %edi
	leaq	1(%r13), %rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	je	.L12458
.L12467:
	movzbl	(%rcx), %r8d
	incq	%rbx
	incq	%rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	jne	.L12467
.L12458:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L12468
	jmp	.L12659
.L12785:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L12462
.L12784:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L12458
	.p2align 6,,7
.L12783:
	addl	$25, %r12d
	jmp	.L12450
.L12782:
	movq	8(%r15), %r15
	jmp	.L12439
.L12442:
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	build_tree_list
	movq	-184(%rbp), %rcx
	movq	%rax, 40(%rcx)
	jmp	.L12443
.L12438:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC150, %esi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %r14
	xorl	%r12d, %r12d
	cmpq	%r14, %r13
	movq	%r13, %rbx
	jae	.L12657
.L12481:
	cmpl	$3, (%rbx)
	je	.L12786
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L12477:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L12481
.L12657:
	movslq	%r12d,%r10
	movq	%r13, %r12
	addq	$16, %r10
	andq	$-16, %r10
	subq	%r10, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L12659
.L12495:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L12787
	cmpl	$2, %eax
	je	.L12788
.L12489:
	movq	8(%r12), %rsi
	movzbl	(%rsi), %r11d
	leaq	1(%rsi), %rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	je	.L12485
.L12494:
	movzbl	(%rcx), %edx
	incq	%rbx
	incq	%rcx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	jne	.L12494
.L12485:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L12495
	jmp	.L12659
.L12788:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L12489
.L12787:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L12485
.L12786:
	addl	$25, %r12d
	jmp	.L12477
	.p2align 6,,7
.L12361:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	movq	%r14, %rdi
	movq	%r13, %rsi
	movl	$.LC147, %edx
	call	convert_for_assignment
	movq	%rax, %rbx
	xorl	%eax, %eax
	testl	%eax, %eax
	je	.L11934
	testb	$2, 17(%rbx)
	jne	.L12362
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %r11
	xorl	%r12d, %r12d
	cmpq	%r11, %r13
	movq	%r13, %rbx
	movq	%r11, %r14
	jae	.L12635
.L12369:
	cmpl	$3, (%rbx)
	je	.L12789
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L12365:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L12369
.L12635:
	movslq	%r12d,%rcx
	movq	%r13, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L12659
.L12383:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L12790
	cmpl	$2, %eax
	je	.L12791
.L12377:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %esi
	leaq	1(%rdx), %rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	je	.L12373
.L12382:
	movzbl	(%rcx), %r9d
	incq	%rbx
	incq	%rcx
	testb	%r9b, %r9b
	movb	%r9b, (%rbx)
	jne	.L12382
.L12373:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L12383
	jmp	.L12659
.L12791:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L12377
.L12790:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L12373
.L12789:
	addl	$25, %r12d
	jmp	.L12365
.L12362:
	movq	8(%rbx), %rsi
	movq	%rbx, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L11934
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC148, %esi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %r15
	xorl	%r12d, %r12d
	cmpq	%r15, %r13
	movq	%r13, %rbx
	movq	%r15, %r14
	jae	.L12640
.L12395:
	cmpl	$3, (%rbx)
	je	.L12792
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L12391:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L12395
.L12640:
	movslq	%r12d,%rdi
	movq	%r13, %r12
	addq	$16, %rdi
	andq	$-16, %rdi
	subq	%rdi, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L12659
.L12409:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L12793
	cmpl	$2, %eax
	je	.L12794
.L12403:
	movq	8(%r12), %r8
	movzbl	(%r8), %r13d
	leaq	1(%r8), %rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	je	.L12399
.L12408:
	movzbl	(%rcx), %r14d
	incq	%rbx
	incq	%rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	jne	.L12408
.L12399:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L12409
	jmp	.L12659
	.p2align 6,,7
.L12794:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L12403
.L12793:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L12399
	.p2align 6,,7
.L12792:
	addl	$25, %r12d
	jmp	.L12391
.L12777:
	movq	128(%rax), %rdi
	movq	128(%r14), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L12177
	cmpl	$18, -68(%rbp)
	je	.L12795
.L12178:
	cmpl	$9, -68(%rbp)
	je	.L12796
.L12179:
	cmpl	$13, -68(%rbp)
	jne	.L12176
	movq	8(%rbx), %rdx
	movzbl	16(%rdx), %eax
	cmpb	$18, %al
	je	.L12180
	cmpb	$23, %al
	jne	.L12176
.L12180:
	movq	8(%rdx), %rdi
	movq	8(%r14), %rsi
	call	comptypes
	testl	%eax, %eax
	je	.L12176
.L12177:
	cmpl	$13, -68(%rbp)
	je	.L12797
.L12181:
	xorl	%r12d, %r12d
	testl	%r12d, %r12d
	je	.L12242
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L12242
	cmpb	$-86, 16(%rbx)
	je	.L12798
.L12242:
	cmpl	$18, -68(%rbp)
	je	.L12799
.L12243:
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L12268
	cmpb	$34, 16(%rbx)
	je	.L12800
.L12268:
	xorl	%esi, %esi
	testl	%esi, %esi
	je	.L11934
	movl	pedantic(%rip), %r12d
	testl	%r12d, %r12d
	je	.L12275
	cmpb	$47, 16(%rbx)
	je	.L12801
.L12275:
	xorl	%r15d, %r15d
	testl	%r15d, %r15d
	je	.L11934
	testb	$2, 17(%rbx)
	je	.L12335
	movq	8(%rbx), %rsi
	movq	%rbx, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L11934
.L12335:
	movl	$.LC42, %edi
	xorl	%eax, %eax
	movl	$.LC146, %esi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %rdi
	xorl	%r12d, %r12d
	cmpq	%rdi, %r13
	movq	%r13, %rbx
	movq	%rdi, %r14
	jae	.L12630
.L12342:
	cmpl	$3, (%rbx)
	je	.L12802
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L12338:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L12342
.L12630:
	movslq	%r12d,%rbx
	movq	%r13, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L12659
.L12356:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L12803
	cmpl	$2, %eax
	je	.L12804
.L12350:
	movq	8(%r12), %r14
	movzbl	(%r14), %r8d
	leaq	1(%r14), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L12346
.L12355:
	movzbl	(%rcx), %r10d
	incq	%rbx
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	jne	.L12355
.L12346:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L12356
	jmp	.L12659
.L12804:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L12350
.L12803:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L12346
.L12802:
	addl	$25, %r12d
	jmp	.L12338
.L12801:
	movq	8(%rbx), %r12
	movq	32(%rbx), %rdi
	movq	%r12, %rsi
	call	valid_compound_expr_initializer
	movq	global_trees(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L12805
	movq	40(%rbx), %rdi
	movq	%r12, %rsi
	call	valid_compound_expr_initializer
	movq	global_trees(%rip), %rdx
	movq	%rax, %rbx
.L12278:
	cmpq	%rdx, %rbx
	je	.L12806
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	pedwarn
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %r11
	xorl	%r15d, %r15d
	cmpq	%r11, %r13
	movq	%r13, %r12
	movq	%r11, %r14
	jae	.L12625
.L12314:
	cmpl	$3, (%r12)
	je	.L12807
	movq	8(%r12), %rdi
	call	strlen
	leal	1(%rax,%r15), %r15d
.L12310:
	addq	$16, %r12
	cmpq	%r14, %r12
	jb	.L12314
.L12625:
	movslq	%r15d,%rcx
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %r12
	jae	.L12627
.L12328:
	movl	(%r13), %eax
	cmpl	$3, %eax
	je	.L12808
	cmpl	$2, %eax
	je	.L12809
.L12322:
	movq	8(%r13), %rdx
	movzbl	(%rdx), %esi
	leaq	1(%rdx), %rcx
	testb	%sil, %sil
	movb	%sil, (%r12)
	je	.L12318
.L12327:
	movzbl	(%rcx), %r9d
	incq	%r12
	incq	%rcx
	testb	%r9b, %r9b
	movb	%r9b, (%r12)
	jne	.L12327
.L12318:
	addq	$16, %r13
	cmpq	spelling(%rip), %r13
	jb	.L12328
.L12627:
	movb	$0, (%r12)
	cmpb	$0, (%r15)
	jne	.L12810
.L12307:
	movl	flag_pedantic_errors(%rip), %r13d
	testl	%r13d, %r13d
	je	.L11934
	jmp	.L12498
.L12810:
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L12307
.L12809:
	movb	$46, (%r12)
	incq	%r12
	jmp	.L12322
.L12808:
	movl	8(%r13), %edx
	movq	%r12, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%r12, %rdi
	call	strlen
	addq	%rax, %r12
	jmp	.L12318
.L12807:
	addl	$25, %r15d
	jmp	.L12310
.L12806:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %r9
	xorl	%r15d, %r15d
	cmpq	%r9, %r13
	movq	%r13, %r12
	movq	%r9, %r14
	jae	.L12620
.L12289:
	cmpl	$3, (%r12)
	je	.L12811
	movq	8(%r12), %rdi
	call	strlen
	leal	1(%rax,%r15), %r15d
.L12285:
	addq	$16, %r12
	cmpq	%r14, %r12
	jb	.L12289
.L12620:
	movslq	%r15d,%rdi
	addq	$16, %rdi
	andq	$-16, %rdi
	subq	%rdi, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %r12
	jae	.L12622
.L12303:
	movl	(%r13), %eax
	cmpl	$3, %eax
	je	.L12812
	cmpl	$2, %eax
	je	.L12813
.L12297:
	movq	8(%r13), %r14
	movzbl	(%r14), %r8d
	leaq	1(%r14), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%r12)
	je	.L12293
.L12302:
	movzbl	(%rcx), %r10d
	incq	%r12
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%r12)
	jne	.L12302
.L12293:
	addq	$16, %r13
	cmpq	spelling(%rip), %r13
	jb	.L12303
.L12622:
	movb	$0, (%r12)
	cmpb	$0, (%r15)
	je	.L12307
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L12307
.L12813:
	movb	$46, (%r12)
	incq	%r12
	jmp	.L12297
.L12812:
	movl	8(%r13), %edx
	movq	%r12, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%r12, %rdi
	call	strlen
	addq	%rax, %r12
	jmp	.L12293
.L12811:
	addl	$25, %r15d
	jmp	.L12285
.L12805:
	movq	%rdx, %rbx
	jmp	.L12278
.L12800:
	movl	pedantic(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L12268
	cmpb	$51, 48(%rbx)
	je	.L12268
	cmpq	$0, current_function_decl(%rip)
	je	.L12273
	movzbl	17(%rbx), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L12814
.L12273:
	movq	%rbx, %rax
.L12274:
	movq	%rax, %rbx
	jmp	.L12268
.L12814:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L12273
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L12273
	testb	$2, 17(%rax)
	je	.L12273
	cmpb	$46, %dl
	jne	.L12274
	jmp	.L12273
.L12799:
	movzbl	16(%rbx), %eax
	cmpb	$29, %al
	je	.L12243
	cmpb	$46, %al
	je	.L12243
	movl	$.LC42, %edi
	xorl	%eax, %eax
	movl	$.LC145, %esi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %rdi
	xorl	%r12d, %r12d
	cmpq	%rdi, %r13
	movq	%r13, %rbx
	movq	%rdi, %r14
	jae	.L12615
.L12250:
	cmpl	$3, (%rbx)
	je	.L12815
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L12246:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L12250
.L12615:
	movslq	%r12d,%r8
	movq	%r13, %r12
	addq	$16, %r8
	andq	$-16, %r8
	subq	%r8, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L12659
.L12264:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L12816
	cmpl	$2, %eax
	je	.L12817
.L12258:
	movq	8(%r12), %r10
	movzbl	(%r10), %r14d
	leaq	1(%r10), %rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	je	.L12254
.L12263:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L12263
.L12254:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L12264
	jmp	.L12659
.L12817:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L12258
.L12816:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L12254
.L12815:
	addl	$25, %r12d
	jmp	.L12246
.L12798:
	movq	32(%rbx), %r15
	movq	32(%r15), %r9
	movq	104(%r9), %rbx
	jmp	.L12242
.L12797:
	movzbl	16(%rbx), %esi
	movq	8(%rbx), %r10
	xorl	%r12d, %r12d
	movq	%rbx, %rcx
	movzbl	16(%r10), %edi
	cmpb	$116, %sil
	je	.L12697
	cmpb	$115, %sil
	je	.L12818
.L12183:
	movl	%esi, %eax
	movzbl	%al, %r9d 
	movzbl	tree_code_type(%r9), %eax
	cmpb	$60, %al
	je	.L12189
	cmpb	$49, %al
	je	.L12189
	cmpb	$50, %al
	je	.L12189
	cmpb	$101, %al
	je	.L12189
.L12188:
	cmpl	$23, %edi
	je	.L12819
	cmpl	$18, %edi
	je	.L12820
	movq	%rbx, %r12
.L12191:
	movq	%r12, %rbx
	jmp	.L12181
.L12820:
	movl	%esi, %eax
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	%al, %r8d 
	movq	8(%r10), %r14
	movzbl	tree_code_type(%r8), %eax
	cmpb	$114, %al
	je	.L12194
	cmpb	$100, %al
	je	.L12194
.L12193:
	movzbl	17(%r10), %edi
	movl	$1, %r8d
	movl	%edi, %r9d
	movl	%edi, %r13d
	shrb	$4, %r9b
	shrb	$3, %r13b
	andl	%r9d, %r8d
	andl	$1, %r13d
	movzbl	62(%r10), %r9d
	movzbl	16(%r10), %r10d
	addl	%r13d, %r13d
	orl	%r13d, %r8d
	movl	%r9d, %ecx
	shrb	$5, %cl
	andl	$1, %ecx
	sall	$2, %ecx
	orl	%ecx, %r8d
	xorl	%ecx, %ecx
	cmpb	$20, %r10b
	je	.L12821
.L12197:
	leal	0(,%rcx,8), %r15d
	orl	%r15d, %r8d
	jne	.L12196
	testl	%edx, %edx
	jne	.L12196
	testl	%r11d, %r11d
	je	.L12195
.L12196:
	movl	%edi, %ecx
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %dil
	shrb	$4, %cl
	movl	%edi, %r8d
	andl	%ecx, %esi
	movl	%r9d, %edi
	andl	$1, %r8d
	andl	$1, %edi
	xorl	%ecx, %ecx
	addl	%r8d, %r8d
	sall	$2, %edi
	orl	%r8d, %esi
	orl	%edi, %esi
	cmpb	$20, %r10b
	je	.L12822
.L12199:
	leal	0(,%rcx,8), %r10d
	movq	%r14, %rdi
	orl	%r10d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %esi
	movq	%rax, %r14
.L12195:
	cmpb	$41, %sil
	je	.L12823
	cmpb	$47, %sil
	je	.L12824
	xorl	%r13d, %r13d
	testl	%r12d, %r12d
	je	.L12825
.L12238:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L12239
	testl	%r13d, %r13d
	movq	%rbx, %r12
	je	.L12191
.L12239:
	movq	%r14, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %r12
	je	.L12826
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%r12, %rdi
	movq	%rax, %rsi
.L12730:
	call	convert
.L12717:
	movq	%rax, %r12
	jmp	.L12191
.L12826:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	mark_addressable
	testl	%eax, %eax
	jne	.L12241
	movq	global_trees(%rip), %r12
	jmp	.L12191
.L12241:
	movq	%rbx, %rdi
	call	staticp
	movzbl	17(%r12), %ebx
	movl	%eax, %r13d
	andb	$1, %r13b
	addb	%r13b, %r13b
	andb	$-4, %bl
	orb	%r13b, %bl
	movb	%bl, 17(%r12)
	jmp	.L12191
.L12825:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r13d
	jmp	.L12238
.L12824:
	movq	40(%rbx), %r12
	movq	8(%r12), %r13
	movzbl	16(%r13), %r14d
	movq	%r13, %rax
	cmpl	$23, %r14d
	je	.L12203
	cmpl	$18, %r14d
	je	.L12203
	movzbl	16(%r12), %edx
	cmpb	$32, %dl
	je	.L12827
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L12206
	cmpb	$34, %dl
	je	.L12828
.L12206:
	cmpb	$116, %dl
	movq	%r12, %rcx
	je	.L12699
	cmpb	$115, %dl
	je	.L12829
.L12215:
	movzbl	%dl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L12220
	cmpb	$49, %al
	je	.L12220
	cmpb	$50, %al
	je	.L12220
	cmpb	$101, %al
	je	.L12220
.L12219:
	cmpl	$10, %r14d
	je	.L12830
	cmpb	$39, %dl
	je	.L12831
.L12228:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L12233
	testb	$32, 17(%r13)
	je	.L12234
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L12235
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r13), %r11d
	movzwl	60(%rdx), %r10d
	andl	$511, %r11d
	andl	$511, %r10d
	cmpl	%r10d, %r11d
	je	.L12235
.L12234:
	movq	integer_types+40(%rip), %rdi
.L12716:
	movq	%r12, %rsi
	call	convert
.L12204:
	movq	8(%rax), %rsi
	movq	32(%rbx), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L12717
.L12235:
	movq	integer_types+48(%rip), %rdi
	jmp	.L12716
.L12233:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L12236
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L12236
	movq	global_trees+192(%rip), %rsi
	cmpq	%rsi, 128(%r13)
	je	.L12832
.L12236:
	cmpl	$5, %r14d
	je	.L12833
	movq	%r12, %rax
	jmp	.L12204
.L12833:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L12204
.L12832:
	movq	global_trees+200(%rip), %rdi
	jmp	.L12716
.L12831:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L12228
	movq	integer_types+40(%rip), %rcx
	movq	40(%rdx), %rdi
	movzwl	60(%rcx), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L12228
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L12234
	testb	$32, 17(%r13)
	jne	.L12235
	jmp	.L12234
.L12830:
	movq	integer_types+40(%rip), %r8
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r14d
	movzwl	60(%r8), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r14d, %r14d
	jne	.L12227
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L12226
.L12227:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L12226:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L12716
.L12220:
	movl	24(%rcx), %eax
	movl	%eax, 24(%r12)
	jmp	.L12219
.L12829:
	movq	32(%r12), %rsi
	movq	8(%r12), %rax
	cmpq	%rax, 8(%rsi)
	jne	.L12215
.L12218:
	movzbl	16(%rsi), %edx
	movq	%rsi, %r12
	cmpb	$116, %dl
	jne	.L12834
.L12699:
	movq	32(%r12), %rsi
	jmp	.L12218
.L12834:
	cmpb	$115, %dl
	jne	.L12215
	movq	32(%rsi), %r15
	movq	8(%r12), %r9
	cmpq	%r9, 8(%r15)
	movq	%r15, %rsi
	je	.L12218
	jmp	.L12215
.L12828:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L12210
	cmpb	$51, 48(%r12)
	je	.L12210
	cmpq	$0, current_function_decl(%rip)
	je	.L12212
	movzbl	17(%r12), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L12835
.L12212:
	movq	%r12, %rsi
.L12213:
	movq	%rsi, %r12
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L12210:
	movq	%rax, %r13
	jmp	.L12206
.L12835:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L12212
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L12212
	testb	$2, 17(%rax)
	je	.L12212
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L12213
	jmp	.L12212
.L12827:
	movq	104(%r12), %r12
	movzbl	16(%r12), %edx
	jmp	.L12206
.L12203:
	movq	%r12, %rdi
	call	default_function_array_conversion
	jmp	.L12204
.L12823:
	movq	72(%r14), %rdi
	movq	32(%rbx), %rsi
	jmp	.L12730
.L12822:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L12199
.L12821:
	testq	%r14, %r14
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L12197
.L12194:
	movzbl	17(%rbx), %r15d
	movl	$1, %r11d
	movl	%r15d, %edx
	shrb	$3, %r15b
	shrb	$4, %dl
	andl	%r15d, %r11d
	andl	$1, %edx
	jmp	.L12193
.L12819:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L12717
.L12189:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L12188
.L12818:
	movq	32(%rbx), %rdx
	cmpq	%r10, 8(%rdx)
	jne	.L12183
.L12187:
	cmpb	$116, %sil
	movl	$1, %eax
	movq	%rdx, %rbx
	movzbl	16(%rdx), %esi
	cmove	%eax, %r12d
	cmpb	$116, %sil
	jne	.L12836
.L12697:
	movq	32(%rbx), %rdx
	jmp	.L12187
.L12836:
	cmpb	$115, %sil
	jne	.L12183
	movq	32(%rdx), %r13
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%r13)
	movq	%r13, %rdx
	je	.L12187
	jmp	.L12183
.L12796:
	movq	8(%rbx), %rdi
	movq	%r14, %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L12177
	jmp	.L12179
.L12795:
	movq	8(%rbx), %rdi
	movq	%r14, %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L12177
	jmp	.L12178
	.p2align 6,,7
.L12776:
	movq	8(%r14), %r8
	movq	128(%r8), %rax
	cmpq	integer_types(%rip), %rax
	movq	%rax, -80(%rbp)
	je	.L11938
	cmpq	integer_types+8(%rip), %rax
	je	.L11938
	cmpq	integer_types+16(%rip), %rax
	je	.L11938
	cmpq	c_global_trees+16(%rip), %rax
	je	.L11938
	cmpq	c_global_trees+8(%rip), %rax
	jne	.L11936
.L11938:
	testq	%rbx, %rbx
	je	.L12176
	cmpb	$29, 16(%rbx)
	jne	.L11936
	movq	8(%rbx), %r13
	movq	128(%r13), %r12
	movq	128(%r14), %r13
	cmpq	%r13, %r12
	je	.L12715
	testq	%r12, %r12
	je	.L12715
	testq	%r13, %r13
	je	.L12715
	movzbl	16(%r12), %edx
	testb	%dl, %dl
	je	.L12715
	movzbl	16(%r13), %eax
	testb	%al, %al
	je	.L12715
	cmpb	$6, %dl
	je	.L12837
.L11943:
	cmpb	$6, %al
	je	.L12838
.L11944:
	cmpb	$10, %dl
	je	.L12839
.L11945:
	cmpb	$10, 16(%r13)
	je	.L12840
.L11946:
	cmpq	%r13, %r12
	movl	$1, -172(%rbp)
	je	.L11942
	movzbl	16(%r12), %esi
	cmpb	16(%r13), %sil
	je	.L11948
	movl	$0, -172(%rbp)
.L11942:
	movl	-172(%rbp), %ecx
	testl	%ecx, %ecx
	jne	.L11934
.L11939:
	movq	8(%rbx), %rsi
	movq	integer_types(%rip), %rcx
	movq	8(%rsi), %r11
	cmpq	%rcx, 128(%r11)
	je	.L12098
	movq	-80(%rbp), %rdx
	movzwl	60(%rcx), %edi
	movzwl	60(%rdx), %r13d
	andl	$511, %edi
	andl	$511, %r13d
	cmpl	%edi, %r13d
	je	.L12841
.L12098:
	movq	8(%rsi), %r12
	movq	128(%r12), %rax
	cmpq	%rcx, %rax
	je	.L12842
.L12123:
	movq	%r14, 8(%rbx)
	cmpq	$0, 24(%r14)
	je	.L11934
	movq	32(%r14), %rax
	testq	%rax, %rax
	je	.L11934
	cmpb	$25, 16(%rax)
	jne	.L11934
	movq	-80(%rbp), %r8
	movq	integer_types(%rip), %r12
	movl	32(%rbx), %ecx
	movzwl	60(%r8), %r9d
	movzwl	60(%r12), %r10d
	andl	$511, %r9d
	andl	$511, %r10d
	cmpl	%r10d, %r9d
	je	.L12149
	movq	c_global_trees(%rip), %r11
	movzwl	60(%r11), %r15d
	andl	$511, %r15d
	sarl	$3, %r15d
	subl	%r15d, %ecx
	movslq	%ecx,%rsi
.L12150:
	movq	40(%r14), %rdi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L11934
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC144, %esi
	call	pedwarn
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %rcx
	xorl	%r15d, %r15d
	cmpq	%rcx, %r13
	movq	%r13, %r12
	movq	%rcx, %r14
	jae	.L12608
.L12158:
	cmpl	$3, (%r12)
	je	.L12843
	movq	8(%r12), %rdi
	call	strlen
	leal	1(%rax,%r15), %r15d
.L12154:
	addq	$16, %r12
	cmpq	%r14, %r12
	jb	.L12158
.L12608:
	movslq	%r15d,%rdx
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %r12
	jae	.L12610
.L12172:
	movl	(%r13), %eax
	cmpl	$3, %eax
	je	.L12844
	cmpl	$2, %eax
	je	.L12845
.L12166:
	movq	8(%r13), %rsi
	movzbl	(%rsi), %r14d
	leaq	1(%rsi), %rcx
	testb	%r14b, %r14b
	movb	%r14b, (%r12)
	je	.L12162
.L12171:
	movzbl	(%rcx), %r10d
	incq	%r12
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%r12)
	jne	.L12171
.L12162:
	addq	$16, %r13
	cmpq	spelling(%rip), %r13
	jb	.L12172
.L12610:
	movb	$0, (%r12)
	cmpb	$0, (%r15)
	je	.L11934
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L11934
.L12845:
	movb	$46, (%r12)
	incq	%r12
	jmp	.L12166
.L12844:
	movl	8(%r13), %edx
	movq	%r12, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%r12, %rdi
	call	strlen
	addq	%rax, %r12
	jmp	.L12162
.L12843:
	addl	$25, %r15d
	jmp	.L12154
.L12149:
	leal	-1(%rcx), %edi
	movslq	%edi,%rsi
	jmp	.L12150
.L12842:
	movq	-80(%rbp), %rcx
	movzwl	60(%rax), %r8d
	movzwl	60(%rcx), %r15d
	andl	$511, %r8d
	andl	$511, %r15d
	cmpl	%r8d, %r15d
	je	.L12123
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC143, %esi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %r11
	xorl	%r12d, %r12d
	cmpq	%r11, %r13
	movq	%r13, %rbx
	movq	%r11, %r14
	jae	.L12603
.L12130:
	cmpl	$3, (%rbx)
	je	.L12846
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L12126:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L12130
.L12603:
	movslq	%r12d,%rdi
	movq	%r13, %r12
	addq	$16, %rdi
	andq	$-16, %rdi
	subq	%rdi, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L12659
.L12144:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L12847
	cmpl	$2, %eax
	je	.L12848
.L12138:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %r13d
	leaq	1(%rdx), %rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	je	.L12134
.L12143:
	movzbl	(%rcx), %esi
	incq	%rbx
	incq	%rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	jne	.L12143
.L12134:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L12144
	jmp	.L12659
.L12848:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L12138
.L12847:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L12134
.L12846:
	addl	$25, %r12d
	jmp	.L12126
.L12841:
	movl	$.LC140, %esi
	xorl	%eax, %eax
	movl	$.LC42, %edi
	call	error
	movq	spelling_base(%rip), %r13
	movq	spelling(%rip), %rsi
	xorl	%r12d, %r12d
	cmpq	%rsi, %r13
	movq	%r13, %rbx
	movq	%rsi, %r14
	jae	.L12598
.L12105:
	cmpl	$3, (%rbx)
	je	.L12849
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L12101:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L12105
.L12598:
	movslq	%r12d,%rbx
	movq	%r13, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r14, %r13
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L12659
.L12119:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L12850
	cmpl	$2, %eax
	je	.L12851
.L12113:
	movq	8(%r12), %r10
	movzbl	(%r10), %r14d
	leaq	1(%r10), %rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	je	.L12109
.L12118:
	movzbl	(%rcx), %r9d
	incq	%rbx
	incq	%rcx
	testb	%r9b, %r9b
	movb	%r9b, (%rbx)
	jne	.L12118
.L12109:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L12119
	jmp	.L12659
.L12851:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L12113
.L12850:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L12109
.L12849:
	addl	$25, %r12d
	jmp	.L12101
.L11948:
	movzbl	17(%r12), %r9d
	movzbl	62(%r12), %r10d
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %r10b
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %r10d
	orl	%r9d, %edx
	orl	%r10d, %edx
	cmpb	$20, %sil
	je	.L12852
.L11950:
	movzbl	17(%r13), %r11d
	leal	0(,%rcx,8), %edi
	movzbl	62(%r13), %ecx
	orl	%edx, %edi
	movl	%r11d, %edx
	shrb	$5, %cl
	shrb	$3, %r11b
	shrb	$4, %dl
	andl	$1, %r11d
	andl	$1, %ecx
	andl	$1, %edx
	addl	%r11d, %r11d
	sall	$2, %ecx
	orl	%r11d, %edx
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	cmpb	$20, %sil
	je	.L12853
.L11951:
	leal	0(,%rcx,8), %esi
	movl	$0, -172(%rbp)
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L11942
	movq	128(%r13), %rdx
	cmpq	%rdx, 128(%r12)
	je	.L12715
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	*targetm+264(%rip)
	movl	$0, -172(%rbp)
	testl	%eax, %eax
	movl	%eax, -84(%rbp)
	je	.L11942
	movl	$0, -172(%rbp)
	movzbl	16(%r12), %eax
	cmpl	$18, %eax
	je	.L12077
	cmpl	$18, %eax
	ja	.L12094
	cmpl	$13, %eax
	je	.L11955
.L11954:
	cmpl	$2, -84(%rbp)
	jne	.L11942
	cmpl	$1, -172(%rbp)
	movl	-84(%rbp), %eax
	cmovne	-172(%rbp), %eax
	movl	%eax, -172(%rbp)
	jmp	.L11942
.L11955:
	movq	8(%r12), %rdi
	movq	8(%r13), %rsi
	cmpq	%rsi, %rdi
	je	.L11956
	call	comptypes
.L12714:
	movl	%eax, -172(%rbp)
	jmp	.L11954
.L11956:
	movl	$1, -172(%rbp)
	jmp	.L11954
.L12094:
	cmpl	$20, %eax
	je	.L12090
	cmpl	$23, %eax
	jne	.L11954
	movl	$1, -148(%rbp)
	movq	8(%r13), %rsi
	movq	8(%r12), %rdi
	cmpq	%rsi, %rdi
	je	.L11959
	call	comptypes
	testl	%eax, %eax
	movl	%eax, -148(%rbp)
	je	.L11954
.L11959:
	movq	24(%r12), %rdi
	testq	%rdi, %rdi
	movq	%rdi, -168(%rbp)
	movq	24(%r13), %r15
	je	.L12854
	testq	%r15, %r15
	je	.L12855
	movl	$1, -172(%rbp)
	xorl	%r13d, %r13d
.L12074:
	cmpq	$0, -168(%rbp)
	je	.L12856
	testq	%r15, %r15
	je	.L12063
	movq	-168(%rbp), %rsi
	movq	32(%rsi), %rdi
	testq	%rdi, %rdi
	je	.L12857
	movq	32(%r15), %rax
	testq	%rax, %rax
	jne	.L12049
.L12729:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L12063
.L12048:
	cmpl	-172(%rbp), %r13d
	movl	-172(%rbp), %edx
	movq	-168(%rbp), %rsi
	cmovg	%r13d, %edx
	movl	%edx, -172(%rbp)
	movq	(%rsi), %r11
	movq	%r11, -168(%rbp)
	movq	(%r15), %r15
	jmp	.L12074
.L12063:
	movl	$0, -172(%rbp)
.L12043:
	cmpl	$1, -172(%rbp)
	movl	-172(%rbp), %edx
	cmove	-148(%rbp), %edx
.L12713:
	movl	%edx, -172(%rbp)
	jmp	.L11954
.L12049:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r13d
	jne	.L12048
	movq	-168(%rbp), %rdx
	movq	32(%rdx), %rax
	cmpb	$21, 16(%rax)
	je	.L12859
.L12053:
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	jne	.L12063
	cmpq	$0, 96(%rax)
	je	.L12064
	testb	$8, 62(%rax)
	je	.L12063
.L12064:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L12063
	movq	-168(%rbp), %r9
	movq	32(%r9), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L12063
	movq	32(%r15), %rcx
	movq	24(%rcx), %r12
	testq	%r12, %r12
	je	.L12063
.L12070:
	movq	-168(%rbp), %rax
	movq	8(%r12), %rdi
	movq	32(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L12066
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L12070
	jmp	.L12063
.L12066:
	testq	%r12, %r12
	jne	.L12048
	jmp	.L12063
.L12859:
	cmpq	$0, 96(%rax)
	je	.L12054
	testb	$8, 62(%rax)
	je	.L12053
.L12054:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L12053
	movq	32(%r15), %r12
	movq	32(%r12), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L12053
	movq	-168(%rbp), %r8
	movq	32(%r8), %rdi
	movq	24(%rdi), %r12
	testq	%r12, %r12
	je	.L12063
.L12060:
	movq	8(%r12), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L12066
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L12060
	jmp	.L12063
.L12857:
	movq	32(%r15), %rdi
	jmp	.L12729
.L12856:
	testq	%r15, %r15
	je	.L12043
	jmp	.L12063
.L12855:
	movq	-168(%rbp), %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L11954
	movq	136(%r13), %rax
	testq	%rax, %rax
	je	.L12669
	movq	%rax, %r13
	movl	$1, %r15d
	movl	$0, -160(%rbp)
.L12038:
	cmpq	$0, -168(%rbp)
	je	.L12860
	testq	%r13, %r13
	je	.L12027
	movq	-168(%rbp), %r11
	movq	32(%r11), %rdi
	testq	%rdi, %rdi
	je	.L12861
	movq	32(%r13), %rax
	testq	%rax, %rax
	jne	.L12013
.L12728:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L12027
.L12012:
	movq	-168(%rbp), %r11
	cmpl	%r15d, -160(%rbp)
	cmovg	-160(%rbp), %r15d
	movq	(%r11), %rcx
	movq	%rcx, -168(%rbp)
	movq	(%r13), %r13
	jmp	.L12038
.L12027:
	xorl	%r15d, %r15d
.L12007:
	decl	%r15d
	movl	$2, -172(%rbp)
	jne	.L11954
	movl	-148(%rbp), %r13d
	movl	%r13d, -172(%rbp)
	jmp	.L11954
.L12013:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, -160(%rbp)
	jne	.L12012
	movq	-168(%rbp), %rsi
	movq	32(%rsi), %rax
	cmpb	$21, 16(%rax)
	je	.L12863
.L12017:
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	jne	.L12027
	cmpq	$0, 96(%rax)
	je	.L12028
	testb	$8, 62(%rax)
	je	.L12027
.L12028:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L12027
	movq	-168(%rbp), %r10
	movq	32(%r10), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L12027
	movq	32(%r13), %r9
	movq	24(%r9), %r12
	testq	%r12, %r12
	je	.L12027
.L12034:
	movq	-168(%rbp), %rax
	movq	8(%r12), %rdi
	movq	32(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L12030
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L12034
	jmp	.L12027
.L12030:
	testq	%r12, %r12
	jne	.L12012
	jmp	.L12027
.L12863:
	cmpq	$0, 96(%rax)
	je	.L12018
	testb	$8, 62(%rax)
	je	.L12017
.L12018:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L12017
	movq	32(%r13), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L12017
	movq	-168(%rbp), %r12
	movq	32(%r12), %rdi
	movq	24(%rdi), %r12
	testq	%r12, %r12
	je	.L12027
.L12024:
	movq	8(%r12), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L12030
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L12024
	jmp	.L12027
.L12861:
	movq	32(%r13), %rdi
	jmp	.L12728
.L12860:
	testq	%r13, %r13
	je	.L12007
	jmp	.L12027
.L12669:
	movl	-148(%rbp), %edx
	jmp	.L12713
.L12854:
	movq	%r15, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L11954
	movq	136(%r12), %rax
	testq	%rax, %rax
	je	.L12667
	movq	%rax, %r13
	movl	$1, -156(%rbp)
	movl	$0, -152(%rbp)
.L11999:
	testq	%r15, %r15
	je	.L12864
	testq	%r13, %r13
	je	.L11988
	movq	32(%r15), %rdi
	testq	%rdi, %rdi
	je	.L12865
	movq	32(%r13), %rax
	testq	%rax, %rax
	jne	.L11974
.L12727:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L11988
.L11973:
	movl	-156(%rbp), %ecx
	movl	-152(%rbp), %eax
	cmpl	%ecx, -152(%rbp)
	cmovle	%ecx, %eax
	movl	%eax, -156(%rbp)
	movq	(%r13), %r13
	movq	(%r15), %r15
	jmp	.L11999
.L11988:
	movl	$0, -156(%rbp)
.L11968:
	cmpl	$1, -156(%rbp)
	movl	$2, -172(%rbp)
	jne	.L11954
	movl	-148(%rbp), %r15d
	movl	%r15d, -172(%rbp)
	jmp	.L11954
.L11974:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, -152(%rbp)
	jne	.L11973
	movq	32(%r15), %rax
	cmpb	$21, 16(%rax)
	je	.L12867
.L11978:
	movq	32(%r13), %rax
	cmpb	$21, 16(%rax)
	jne	.L11988
	cmpq	$0, 96(%rax)
	je	.L11989
	testb	$8, 62(%rax)
	je	.L11988
.L11989:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L11988
	movq	32(%r15), %r10
	movq	32(%r10), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L11988
	movq	32(%r13), %r9
	movq	24(%r9), %r12
	testq	%r12, %r12
	je	.L11988
.L11995:
	movq	8(%r12), %rdi
	movq	32(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L11991
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L11995
	jmp	.L11988
.L11991:
	testq	%r12, %r12
	jne	.L11973
	jmp	.L11988
.L12867:
	cmpq	$0, 96(%rax)
	je	.L11979
	testb	$8, 62(%rax)
	je	.L11978
.L11979:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L11978
	movq	32(%r13), %r12
	movq	32(%r12), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L11978
	movq	32(%r15), %r8
	movq	24(%r8), %r12
	testq	%r12, %r12
	je	.L11988
.L11985:
	movq	8(%r12), %rdi
	movq	32(%r13), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L11991
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L11985
	jmp	.L11988
.L12865:
	movq	32(%r13), %rdi
	jmp	.L12727
.L12864:
	testq	%r13, %r13
	je	.L11968
	jmp	.L11988
.L12667:
	movl	-148(%rbp), %r13d
	movl	%r13d, -172(%rbp)
	jmp	.L11954
.L12090:
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	-172(%rbp), %eax
	jmp	.L12714
.L12077:
	movq	24(%r13), %rdi
	movq	24(%r12), %r15
	movl	$1, -172(%rbp)
	movq	%rdi, -96(%rbp)
	movq	8(%r13), %rsi
	movq	8(%r12), %rdi
	cmpq	%rsi, %rdi
	je	.L12078
	call	comptypes
	testl	%eax, %eax
	movl	%eax, -172(%rbp)
	je	.L11939
.L12078:
	testq	%r15, %r15
	je	.L11954
	cmpq	$0, -96(%rbp)
	je	.L11954
	cmpq	-96(%rbp), %r15
	je	.L11954
	movq	112(%r15), %rcx
	movq	-96(%rbp), %r13
	testq	%rcx, %rcx
	movq	112(%r13), %rsi
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L12081
	movq	104(%r15), %r12
	cmpb	$25, 16(%r12)
	je	.L12868
.L12082:
	movl	$1, %r8d
.L12081:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L12083
	movq	-96(%rbp), %r9
	movq	104(%r9), %r10
	cmpb	$25, 16(%r10)
	je	.L12869
.L12084:
	movl	$1, %ecx
.L12083:
	testb	%r8b, %r8b
	jne	.L11954
	testb	%cl, %cl
	jne	.L11954
	testb	%dil, %dil
	je	.L12690
	testb	%dl, %dl
.L12712:
	jne	.L11954
.L12089:
	movl	$0, -172(%rbp)
	jmp	.L11954
.L12690:
	testb	%dl, %dl
	jne	.L12089
	movq	-96(%rbp), %r8
	movq	104(%r15), %rdi
	movq	104(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L12089
	movq	112(%r15), %rdi
	movq	-96(%rbp), %r15
	movq	112(%r15), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L12712
.L12869:
	cmpb	$25, 16(%rsi)
	jne	.L12084
	jmp	.L12083
.L12868:
	cmpb	$25, 16(%rcx)
	jne	.L12082
	jmp	.L12081
.L12715:
	movl	$1, -172(%rbp)
	jmp	.L11942
.L12853:
	cmpq	$0, 8(%r13)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L11951
.L12852:
	cmpq	$0, 8(%r12)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L11950
.L12840:
	movzbl	17(%r13), %esi
	movzwl	60(%r13), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %r13
	jmp	.L11946
.L12839:
	movzbl	17(%r12), %esi
	movzwl	60(%r12), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %r12
	jmp	.L11945
.L12838:
	testb	$2, 62(%r13)
	je	.L11944
	movq	24(%r13), %r15
	testq	%r15, %r15
	cmovne	%r15, %r13
	jmp	.L11944
.L12837:
	testb	$2, 62(%r12)
	je	.L11943
	movq	24(%r12), %rdi
	testq	%rdi, %rdi
	je	.L11943
	movq	%rdi, %r12
	movzbl	16(%rdi), %edx
	jmp	.L11943
	.p2align 6,,7
.L12775:
	movq	32(%r13), %rdi
	jmp	.L11935
.L11933:
	movq	%rax, %rbx
	jmp	.L11934
.L12774:
	movl	$.LC138, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L11931
.L11775:
	movzbl	17(%rbx), %r9d
	movzbl	62(%rbx), %r10d
	xorl	%ecx, %ecx
	movl	%r9d, %edx
	shrb	$5, %r10b
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	$1, %r9d
	andl	$1, %r10d
	andl	$1, %edx
	addl	%r9d, %r9d
	sall	$2, %r10d
	orl	%r9d, %edx
	orl	%r10d, %edx
	cmpb	$20, %sil
	je	.L12870
.L11777:
	leal	0(,%rcx,8), %edi
	movzbl	62(%r12), %r15d
	movzbl	17(%r12), %ecx
	orl	%edx, %edi
	movl	%ecx, %edx
	shrb	$5, %r15b
	shrb	$3, %cl
	shrb	$4, %dl
	andl	$1, %ecx
	andl	$1, %r15d
	addl	%ecx, %ecx
	andl	$1, %edx
	sall	$2, %r15d
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	orl	%r15d, %edx
	cmpb	$20, %sil
	je	.L12871
.L11778:
	leal	0(,%rcx,8), %esi
	xorl	%r15d, %r15d
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L11769
	movq	128(%r12), %rdx
	cmpq	%rdx, 128(%rbx)
	je	.L12711
	movq	%rbx, %rdi
	movq	%r12, %rsi
	xorl	%r15d, %r15d
	call	*targetm+264(%rip)
	testl	%eax, %eax
	movl	%eax, -44(%rbp)
	je	.L11769
	movzbl	16(%rbx), %eax
	xorl	%r15d, %r15d
	cmpl	$18, %eax
	je	.L11904
	cmpl	$18, %eax
	ja	.L11921
	cmpl	$13, %eax
	je	.L11782
.L11781:
	cmpl	$2, -44(%rbp)
	jne	.L11769
	cmpl	$1, %r15d
	cmove	-44(%rbp), %r15d
	jmp	.L11769
.L11782:
	movq	8(%rbx), %rdi
	movq	8(%r12), %rsi
	cmpq	%rsi, %rdi
	je	.L11783
	call	comptypes
	movl	%eax, %r15d
	jmp	.L11781
.L11783:
	movl	$1, %r15d
	jmp	.L11781
.L11921:
	cmpl	$20, %eax
	je	.L11917
	cmpl	$23, %eax
	jne	.L11781
	movl	$1, -116(%rbp)
	movq	8(%r12), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L11786
	call	comptypes
	testl	%eax, %eax
	movl	%eax, -116(%rbp)
	je	.L11781
.L11786:
	movq	24(%rbx), %rdi
	movq	%rdi, -144(%rbp)
	testq	%rdi, %rdi
	movq	24(%r12), %rdx
	movq	%rdx, -136(%rbp)
	je	.L12872
	cmpq	$0, -136(%rbp)
	je	.L12873
	movl	$1, %r15d
	xorl	%r12d, %r12d
.L11901:
	cmpq	$0, -144(%rbp)
	je	.L12874
	cmpq	$0, -136(%rbp)
	je	.L11890
	movq	-144(%rbp), %r9
	movq	32(%r9), %rdi
	testq	%rdi, %rdi
	je	.L12875
	movq	-136(%rbp), %rbx
	movq	32(%rbx), %rax
	testq	%rax, %rax
	jne	.L11876
.L12726:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L11890
.L11875:
	movq	-144(%rbp), %r8
	movq	-136(%rbp), %rdi
	cmpl	%r15d, %r12d
	cmovg	%r12d, %r15d
	movq	(%r8), %rax
	movq	%rax, -144(%rbp)
	movq	(%rdi), %r11
	movq	%r11, -136(%rbp)
	jmp	.L11901
.L11890:
	xorl	%r15d, %r15d
.L11870:
	cmpl	$1, %r15d
	cmove	-116(%rbp), %r15d
	jmp	.L11781
.L11876:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r12d
	jne	.L11875
	movq	-144(%rbp), %rsi
	movq	32(%rsi), %rax
	cmpb	$21, 16(%rax)
	je	.L12877
.L11880:
	movq	-136(%rbp), %r10
	movq	32(%r10), %rax
	cmpb	$21, 16(%rax)
	jne	.L11890
	cmpq	$0, 96(%rax)
	je	.L11891
	testb	$8, 62(%rax)
	je	.L11890
.L11891:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L11890
	movq	-144(%rbp), %rbx
	movq	32(%rbx), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L11890
	movq	-136(%rbp), %rsi
	movq	32(%rsi), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L11890
.L11897:
	movq	-144(%rbp), %rdx
	movq	8(%rbx), %rdi
	movq	32(%rdx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L11893
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L11897
	jmp	.L11890
.L11893:
	testq	%rbx, %rbx
	jne	.L11875
	jmp	.L11890
.L12877:
	cmpq	$0, 96(%rax)
	je	.L11881
	testb	$8, 62(%rax)
	je	.L11880
.L11881:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L11880
	movq	-136(%rbp), %rax
	movq	32(%rax), %rdx
	movq	32(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L11880
	movq	-144(%rbp), %rdi
	movq	32(%rdi), %r11
	movq	24(%r11), %rbx
	testq	%rbx, %rbx
	je	.L11890
.L11887:
	movq	-136(%rbp), %r8
	movq	8(%rbx), %rdi
	movq	32(%r8), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L11893
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L11887
	jmp	.L11890
.L12875:
	movq	-136(%rbp), %rcx
	movq	32(%rcx), %rdi
	jmp	.L12726
.L12874:
	cmpq	$0, -136(%rbp)
	je	.L11870
	jmp	.L11890
.L12873:
	movq	-144(%rbp), %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L11781
	movq	136(%r12), %rax
	testq	%rax, %rax
	je	.L12666
	movq	%rax, %r12
	movl	$1, -124(%rbp)
	xorl	%r15d, %r15d
.L11865:
	cmpq	$0, -144(%rbp)
	je	.L12878
	testq	%r12, %r12
	je	.L11854
	movq	-144(%rbp), %r8
	movq	32(%r8), %rdi
	testq	%rdi, %rdi
	je	.L12879
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L11840
.L12724:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L11854
.L11839:
	cmpl	-124(%rbp), %r15d
	movl	-124(%rbp), %r10d
	movq	-144(%rbp), %r8
	cmovg	%r15d, %r10d
	movl	%r10d, -124(%rbp)
	movq	(%r8), %rdi
	movq	%rdi, -144(%rbp)
	movq	(%r12), %r12
	jmp	.L11865
.L11854:
	movl	$0, -124(%rbp)
.L11834:
	movl	$2, %r15d
	cmpl	$1, -124(%rbp)
.L12725:
	jne	.L11781
.L12666:
	movl	-116(%rbp), %r15d
	jmp	.L11781
.L11840:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L11839
	movq	-144(%rbp), %r10
	movq	32(%r10), %rax
	cmpb	$21, 16(%rax)
	je	.L12881
.L11844:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L11854
	cmpq	$0, 96(%rax)
	je	.L11855
	testb	$8, 62(%rax)
	je	.L11854
.L11855:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L11854
	movq	-144(%rbp), %rsi
	movq	32(%rsi), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L11854
	movq	32(%r12), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L11854
.L11861:
	movq	-144(%rbp), %r11
	movq	8(%rbx), %rdi
	movq	32(%r11), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L11857
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L11861
	jmp	.L11854
.L11857:
	testq	%rbx, %rbx
	jne	.L11839
	jmp	.L11854
.L12881:
	cmpq	$0, 96(%rax)
	je	.L11845
	testb	$8, 62(%rax)
	je	.L11844
.L11845:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L11844
	movq	32(%r12), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L11844
	movq	-144(%rbp), %rax
	movq	32(%rax), %rcx
	movq	24(%rcx), %rbx
	testq	%rbx, %rbx
	je	.L11854
.L11851:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L11857
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L11851
	jmp	.L11854
.L12879:
	movq	32(%r12), %rdi
	jmp	.L12724
.L12878:
	testq	%r12, %r12
	je	.L11834
	jmp	.L11854
.L12872:
	movq	%rdx, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L11781
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L12666
	movq	%rax, %r12
	movl	$1, -120(%rbp)
	xorl	%r15d, %r15d
.L11826:
	cmpq	$0, -136(%rbp)
	je	.L12882
	testq	%r12, %r12
	je	.L11815
	movq	-136(%rbp), %rbx
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L12883
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L11801
.L12723:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L11815
.L11800:
	cmpl	-120(%rbp), %r15d
	movl	-120(%rbp), %r11d
	movq	-136(%rbp), %rbx
	cmovg	%r15d, %r11d
	movl	%r11d, -120(%rbp)
	movq	(%rbx), %rdi
	movq	%rdi, -136(%rbp)
	movq	(%r12), %r12
	jmp	.L11826
.L11815:
	movl	$0, -120(%rbp)
.L11795:
	cmpl	$1, -120(%rbp)
	movl	$2, %r15d
	jmp	.L12725
.L11801:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	jne	.L11800
	movq	-136(%rbp), %r11
	movq	32(%r11), %rax
	cmpb	$21, 16(%rax)
	je	.L12885
.L11805:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L11815
	cmpq	$0, 96(%rax)
	je	.L11816
	testb	$8, 62(%rax)
	je	.L11815
.L11816:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L11815
	movq	-136(%rbp), %rcx
	movq	32(%rcx), %r9
	movq	32(%r9), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L11815
	movq	32(%r12), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L11815
.L11822:
	movq	-136(%rbp), %rdx
	movq	8(%rbx), %rdi
	movq	32(%rdx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L11818
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L11822
	jmp	.L11815
.L11818:
	testq	%rbx, %rbx
	jne	.L11800
	jmp	.L11815
.L12885:
	cmpq	$0, 96(%rax)
	je	.L11806
	testb	$8, 62(%rax)
	je	.L11805
.L11806:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L11805
	movq	32(%r12), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L11805
	movq	-136(%rbp), %rax
	movq	32(%rax), %r10
	movq	24(%r10), %rbx
	testq	%rbx, %rbx
	je	.L11815
.L11812:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L11818
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L11812
	jmp	.L11815
.L12883:
	movq	32(%r12), %rdi
	jmp	.L12723
.L12882:
	testq	%r12, %r12
	je	.L11795
	jmp	.L11815
.L11917:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmove	%eax, %r15d
	jmp	.L11781
.L11904:
	movq	24(%rbx), %r10
	movq	%r10, -56(%rbp)
	movq	24(%r12), %r15
	movq	%r15, -64(%rbp)
	movq	8(%r12), %rsi
	movq	8(%rbx), %rdi
	movl	$1, %r15d
	cmpq	%rsi, %rdi
	je	.L11905
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L12691
.L11905:
	cmpq	$0, -56(%rbp)
	je	.L11781
	cmpq	$0, -64(%rbp)
	je	.L11781
	movq	-64(%rbp), %rbx
	cmpq	%rbx, -56(%rbp)
	je	.L11781
	movq	-56(%rbp), %r9
	movq	112(%rbx), %rsi
	movq	112(%r9), %rcx
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L11908
	movq	104(%r9), %r12
	cmpb	$25, 16(%r12)
	je	.L12886
.L11909:
	movl	$1, %r8d
.L11908:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L11910
	movq	-64(%rbp), %rbx
	movq	104(%rbx), %r9
	cmpb	$25, 16(%r9)
	je	.L12887
.L11911:
	movl	$1, %ecx
.L11910:
	testb	%r8b, %r8b
	jne	.L11781
	testb	%cl, %cl
	jne	.L11781
	testb	%dil, %dil
	je	.L12680
	testb	%dl, %dl
.L12710:
	jne	.L11781
.L11916:
	xorl	%r15d, %r15d
	jmp	.L11781
.L12680:
	testb	%dl, %dl
	jne	.L11916
	movq	-56(%rbp), %rsi
	movq	-64(%rbp), %rcx
	movq	104(%rsi), %rdi
	movq	104(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L11916
	movq	-56(%rbp), %r11
	movq	-64(%rbp), %rdx
	movq	112(%r11), %rdi
	movq	112(%rdx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L12710
.L12887:
	cmpb	$25, 16(%rsi)
	jne	.L11911
	jmp	.L11910
.L12886:
	cmpb	$25, 16(%rcx)
	jne	.L11909
	jmp	.L11908
	.p2align 6,,7
.L12711:
	movl	$1, %r15d
	jmp	.L11769
.L12871:
	cmpq	$0, 8(%r12)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L11778
.L12870:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L11777
.L12773:
	movzbl	17(%r12), %esi
	movzwl	60(%r12), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %r12
	jmp	.L11773
.L12772:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L11772
.L12771:
	testb	$2, 62(%r12)
	je	.L11771
	movq	24(%r12), %r8
	testq	%r8, %r8
	cmovne	%r8, %r12
	jmp	.L11771
.L12770:
	testb	$2, 62(%rbx)
	je	.L11770
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L11770
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L11770
	.p2align 6,,7
.L12769:
	movzbl	%cl, %r8d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r8), %eax
	movq	8(%rdi), %r15
	cmpb	$114, %al
	je	.L11714
	cmpb	$100, %al
	je	.L11714
.L11713:
	movzbl	17(%rdi), %r8d
	movl	$1, %esi
	movl	%r8d, %r10d
	movl	%r8d, %r9d
	shrb	$4, %r10b
	shrb	$3, %r9b
	andl	%r10d, %esi
	andl	$1, %r9d
	movzbl	62(%rdi), %r10d
	movzbl	16(%rdi), %edi
	addl	%r9d, %r9d
	orl	%r9d, %esi
	xorl	%r9d, %r9d
	movl	%r10d, %r13d
	shrb	$5, %r13b
	andl	$1, %r13d
	sall	$2, %r13d
	orl	%r13d, %esi
	cmpb	$20, %dil
	je	.L12888
.L11717:
	leal	0(,%r9,8), %r13d
	orl	%r13d, %esi
	jne	.L11716
	testl	%edx, %edx
	jne	.L11716
	testl	%r11d, %r11d
	je	.L11715
.L11716:
	movl	%r8d, %r13d
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r13b
	movl	%r10d, %ecx
	movl	%r8d, %r9d
	andl	%r13d, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L12889
.L11719:
	leal	0(,%rcx,8), %edi
	orl	%edi, %esi
	movq	%r15, %rdi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbx), %ecx
	movq	%rax, %r15
.L11715:
	cmpb	$41, %cl
	je	.L12890
	cmpb	$47, %cl
	je	.L12891
	xorl	%r13d, %r13d
	testl	%r12d, %r12d
	je	.L12892
.L11758:
	movl	flag_isoc99(%rip), %r12d
	testl	%r12d, %r12d
	jne	.L11759
	testl	%r13d, %r13d
	movq	%rbx, -112(%rbp)
	je	.L11711
.L11759:
	movq	%r15, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbx)
	movq	%rax, %r12
	je	.L12893
	movl	$121, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%r12, %rdi
	movq	%rax, %rsi
.L12722:
	call	convert
.L12709:
	movq	%rax, -112(%rbp)
	jmp	.L11711
.L12893:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbx, %rdx
	call	build1
	movq	%rbx, %rdi
	movq	%rax, -112(%rbp)
	call	mark_addressable
	testl	%eax, %eax
	jne	.L11761
	movq	global_trees(%rip), %rbx
	movq	%rbx, -112(%rbp)
	jmp	.L11711
.L11761:
	movq	%rbx, %rdi
	call	staticp
	movq	-112(%rbp), %r9
	movl	%eax, %r15d
	andb	$1, %r15b
	movzbl	17(%r9), %edi
	addb	%r15b, %r15b
	andb	$-4, %dil
	orb	%r15b, %dil
	movb	%dil, 17(%r9)
	jmp	.L11711
.L12892:
	movq	%rbx, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r13d
	jmp	.L11758
.L12891:
	movq	40(%rbx), %r12
	movq	8(%r12), %r13
	movzbl	16(%r13), %r15d
	movq	%r13, %rax
	cmpl	$23, %r15d
	je	.L11723
	cmpl	$18, %r15d
	je	.L11723
	movzbl	16(%r12), %edx
	cmpb	$32, %dl
	je	.L12894
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L11726
	cmpb	$34, %dl
	je	.L12895
.L11726:
	cmpb	$116, %dl
	movq	%r12, %rcx
	je	.L12695
	cmpb	$115, %dl
	je	.L12896
.L11735:
	movzbl	%dl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L11740
	cmpb	$49, %al
	je	.L11740
	cmpb	$50, %al
	je	.L11740
	cmpb	$101, %al
	je	.L11740
.L11739:
	cmpl	$10, %r15d
	je	.L12897
	cmpb	$39, %dl
	je	.L12898
.L11748:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L11753
	testb	$32, 17(%r13)
	je	.L11754
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L11755
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r13), %r8d
	movzwl	60(%rdx), %r13d
	andl	$511, %r8d
	andl	$511, %r13d
	cmpl	%r13d, %r8d
	je	.L11755
.L11754:
	movq	integer_types+40(%rip), %rdi
.L12708:
	movq	%r12, %rsi
	call	convert
.L11724:
	movq	8(%rax), %rsi
	movq	32(%rbx), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L12709
.L11755:
	movq	integer_types+48(%rip), %rdi
	jmp	.L12708
.L11753:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L11756
	movl	flag_allow_single_precision(%rip), %esi
	testl	%esi, %esi
	jne	.L11756
	movq	global_trees+192(%rip), %r10
	cmpq	%r10, 128(%r13)
	je	.L12899
.L11756:
	cmpl	$5, %r15d
	je	.L12900
	movq	%r12, %rax
	jmp	.L11724
.L12900:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L11724
.L12899:
	movq	global_trees+200(%rip), %rdi
	jmp	.L12708
	.p2align 6,,7
.L12898:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L11748
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L11748
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L11754
	testb	$32, 17(%r13)
	jne	.L11755
	jmp	.L11754
	.p2align 6,,7
.L12897:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r15d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r15d, %r15d
	jne	.L11747
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L11746
.L11747:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L11746:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L12708
.L11740:
	movl	24(%rcx), %eax
	movl	%eax, 24(%r12)
	jmp	.L11739
.L12896:
	movq	32(%r12), %rsi
	movq	8(%r12), %rax
	cmpq	%rax, 8(%rsi)
	jne	.L11735
.L11738:
	movzbl	16(%rsi), %edx
	movq	%rsi, %r12
	cmpb	$116, %dl
	jne	.L12901
.L12695:
	movq	32(%r12), %rsi
	jmp	.L11738
.L12901:
	cmpb	$115, %dl
	jne	.L11735
	movq	32(%rsi), %r9
	movq	8(%r12), %r10
	cmpq	%r10, 8(%r9)
	movq	%r9, %rsi
	je	.L11738
	jmp	.L11735
.L12895:
	movl	pedantic(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L11730
	cmpb	$51, 48(%r12)
	je	.L11730
	cmpq	$0, current_function_decl(%rip)
	je	.L11732
	movzbl	17(%r12), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L12902
.L11732:
	movq	%r12, %rsi
.L11733:
	movq	%rsi, %r12
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L11730:
	movq	%rax, %r13
	jmp	.L11726
.L12902:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L11732
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L11732
	testb	$2, 17(%rax)
	je	.L11732
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L11733
	jmp	.L11732
	.p2align 6,,7
.L12894:
	movq	104(%r12), %r12
	movzbl	16(%r12), %edx
	jmp	.L11726
.L11723:
	movq	%r12, %rdi
	call	default_function_array_conversion
	jmp	.L11724
.L12890:
	movq	72(%r15), %rdi
	movq	32(%rbx), %rsi
	jmp	.L12722
.L12889:
	testq	%r15, %r15
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L11719
.L12888:
	testq	%r15, %r15
	movl	$1, %eax
	cmovne	%eax, %r9d
	jmp	.L11717
.L11714:
	movzbl	17(%rbx), %r10d
	movl	$1, %r11d
	movl	%r10d, %edx
	shrb	$3, %r10b
	shrb	$4, %dl
	andl	%r10d, %r11d
	andl	$1, %edx
	jmp	.L11713
.L12768:
	movl	$121, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L12709
.L11709:
	movl	24(%r8), %eax
	movl	%eax, 24(%rbx)
	jmp	.L11708
.L12767:
	movq	32(%rsi), %rsi
	cmpq	%rdi, 8(%rsi)
	jne	.L11703
	.p2align 4,,7
.L11707:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %rbx
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r12d
	cmpb	$116, %cl
	jne	.L12903
.L12693:
	movq	32(%rbx), %rsi
	jmp	.L11707
.L12903:
	cmpb	$115, %cl
	jne	.L11703
	movq	32(%rsi), %rsi
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rsi)
	je	.L11707
	jmp	.L11703
.L12733:
	movl	pedantic(%rip), %edx
	testl	%edx, %edx
	je	.L12580
	leal	-20(%rcx), %esi
	cmpb	$1, %sil
	ja	.L11700
	movl	$.LC137, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L12707
.LFE30:
.Lfe30:
	.size	build_c_cast,.Lfe30-build_c_cast
	.align 2
	.p2align 4,,15
.globl c_cast_expr
	.type	c_cast_expr,@function
c_cast_expr:
.LFB31:
	subq	$24, %rsp
.LCFI129:
	movq	%rbx, 8(%rsp)
.LCFI130:
	movq	%rbp, 16(%rsp)
.LCFI131:
	movq	%rsi, %rbx
	cmpb	$25, 16(%rsi)
	movl	warn_strict_prototypes(%rip), %ebp
	je	.L12906
.L12905:
	call	groktypename
	movq	%rbx, %rsi
	movl	%ebp, warn_strict_prototypes(%rip)
	movq	8(%rsp), %rbx
	movq	%rax, %rdi
	movq	16(%rsp), %rbp
	addq	$24, %rsp
	jmp	build_c_cast
	.p2align 6,,7
.L12906:
	movl	$0, warn_strict_prototypes(%rip)
	jmp	.L12905
.LFE31:
.Lfe31:
	.size	c_cast_expr,.Lfe31-c_cast_expr
	.align 2
	.p2align 4,,15
.globl c_convert_parm_for_inlining
	.type	c_convert_parm_for_inlining,@function
c_convert_parm_for_inlining:
.LFB32:
	subq	$40, %rsp
.LCFI132:
	movq	%rdx, %r8
	testq	%rsi, %rsi
	movq	%rbx, 8(%rsp)
.LCFI133:
	movq	%rbp, 16(%rsp)
.LCFI134:
	movq	%r12, 24(%rsp)
.LCFI135:
	movq	%r13, 32(%rsp)
.LCFI136:
	je	.L12907
	movq	8(%rdx), %rdx
	cmpq	$0, 24(%rdx)
	je	.L13022
.L12907:
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	movq	%rsi, %rax
	movq	24(%rsp), %r12
	movq	32(%rsp), %r13
	addq	$40, %rsp
	ret
	.p2align 6,,7
.L13022:
	movq	8(%rdi), %rbx
	movq	%r8, %rcx
	xorl	%edx, %edx
	movq	72(%r8), %r8
	xorl	%r9d, %r9d
	movq	%rbx, %rdi
	call	convert_for_assignment
	testb	$2, target_flags+3(%rip)
	movq	%rax, %rbp
	jne	.L12910
	movzbl	16(%rbx), %eax
	cmpb	$6, %al
	je	.L12911
	cmpb	$10, %al
	je	.L12911
	cmpb	$11, %al
	je	.L12911
	cmpb	$12, %al
	je	.L12911
	.p2align 4,,7
.L12910:
	movq	%rbp, %rsi
	jmp	.L12907
.L12911:
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%rbx), %esi
	movzwl	60(%rdx), %ecx
	andl	$511, %esi
	andl	$511, %ecx
	cmpl	%ecx, %esi
	jge	.L12910
	movq	8(%rbp), %r12
	movzbl	16(%r12), %ebx
	movq	%r12, %rax
	cmpl	$23, %ebx
	je	.L12913
	cmpl	$18, %ebx
	je	.L12913
	movzbl	16(%rbp), %ecx
	cmpb	$32, %cl
	je	.L13023
	movl	optimize(%rip), %r8d
	testl	%r8d, %r8d
	je	.L12976
	cmpb	$34, %cl
	je	.L13024
.L12976:
	cmpb	$116, %cl
	movq	%rbp, %rsi
	je	.L13016
	cmpb	$115, %cl
	je	.L13025
.L12985:
	movzbl	%cl, %edx 
	movzbl	tree_code_type(%rdx), %eax
	cmpb	$60, %al
	je	.L12990
	cmpb	$49, %al
	je	.L12990
	cmpb	$50, %al
	je	.L12990
	cmpb	$101, %al
	je	.L12990
.L12989:
	cmpl	$10, %ebx
	je	.L13026
	cmpb	$39, %cl
	je	.L13027
.L12998:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L13003
	testb	$32, 17(%r12)
	je	.L13004
	movl	flag_traditional(%rip), %esi
	testl	%esi, %esi
	jne	.L13005
	movq	integer_types+40(%rip), %r13
	movzwl	60(%r12), %r11d
	movzwl	60(%r13), %r12d
	andl	$511, %r11d
	andl	$511, %r12d
	cmpl	%r12d, %r11d
	je	.L13005
.L13004:
	movq	integer_types+40(%rip), %rdi
.L13018:
	movq	%rbp, %rsi
.L13019:
	call	convert
.L13021:
	movq	%rax, %rbx
.L12974:
	movq	%rbx, %rbp
	jmp	.L12910
.L13005:
	movq	integer_types+48(%rip), %rdi
	jmp	.L13018
.L13003:
	movl	flag_traditional(%rip), %edi
	testl	%edi, %edi
	je	.L13006
	movl	flag_allow_single_precision(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L13006
	movq	global_trees+192(%rip), %r10
	cmpq	%r10, 128(%r12)
	je	.L13028
.L13006:
	cmpl	$5, %ebx
	je	.L13029
.L13007:
	movq	%rbp, %rbx
	jmp	.L12974
.L13029:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L13020:
	movq	global_trees(%rip), %rbx
	jmp	.L12974
.L13028:
	movq	global_trees+200(%rip), %rdi
	jmp	.L13018
	.p2align 6,,7
.L13027:
	movq	40(%rbp), %rdx
	testb	$2, 53(%rdx)
	je	.L12998
	movq	integer_types+40(%rip), %r8
	movq	40(%rdx), %rdi
	movzwl	60(%r8), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L12998
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L13004
	testb	$32, 17(%r12)
	jne	.L13005
	jmp	.L13004
	.p2align 6,,7
.L13026:
	movq	integer_types+40(%rip), %rbx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %ecx
	movzwl	60(%rbx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ecx, %ecx
	jne	.L12997
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L12996
.L12997:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L12996:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L13018
.L12990:
	movl	24(%rsi), %eax
	movl	%eax, 24(%rbp)
	jmp	.L12989
.L13025:
	movq	32(%rbp), %rdx
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%rdx)
	jne	.L12985
	.p2align 4,,7
.L12988:
	movzbl	16(%rdx), %ecx
	movq	%rdx, %rbp
	cmpb	$116, %cl
	jne	.L13030
.L13016:
	movq	32(%rbp), %rdx
	jmp	.L12988
.L13030:
	cmpb	$115, %cl
	jne	.L12985
	movq	32(%rdx), %r10
	movq	8(%rbp), %r9
	cmpq	%r9, 8(%r10)
	movq	%r10, %rdx
	je	.L12988
	jmp	.L12985
.L13024:
	movl	pedantic(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L12980
	cmpb	$51, 48(%rbp)
	je	.L12980
	cmpq	$0, current_function_decl(%rip)
	je	.L12982
	movzbl	17(%rbp), %r13d
	andb	$24, %r13b
	cmpb	$16, %r13b
	je	.L13031
.L12982:
	movq	%rbp, %rax
.L12983:
	movq	%rax, %rbp
	movq	8(%rax), %rax
	movzbl	16(%rbp), %ecx
.L12980:
	movq	%rax, %r12
	jmp	.L12976
.L13031:
	movq	104(%rbp), %rax
	testq	%rax, %rax
	je	.L12982
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L12982
	testb	$2, 17(%rax)
	je	.L12982
	cmpb	$46, %dl
	jne	.L12983
	jmp	.L12982
	.p2align 6,,7
.L13023:
	movq	104(%rbp), %rbp
	movzbl	16(%rbp), %ecx
	jmp	.L12976
.L12913:
	movzbl	16(%rbp), %ecx
	movl	%ebx, %esi
	movq	%rbp, %rdi
	xorl	%ebx, %ebx
	cmpb	$116, %cl
	je	.L13012
	cmpb	$115, %cl
	je	.L13032
.L12915:
	movzbl	%cl, %r9d 
	movzbl	tree_code_type(%r9), %eax
	cmpb	$60, %al
	je	.L12921
	cmpb	$49, %al
	je	.L12921
	cmpb	$50, %al
	je	.L12921
	cmpb	$101, %al
	je	.L12921
.L12920:
	cmpl	$23, %esi
	je	.L13033
	cmpl	$18, %esi
	jne	.L13007
	movzbl	%cl, %edi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%r12), %r13
	cmpb	$114, %al
	je	.L12926
	cmpb	$100, %al
	je	.L12926
.L12925:
	movzbl	17(%r12), %r8d
	movl	$1, %esi
	movl	%r8d, %r9d
	movl	%r8d, %r10d
	shrb	$3, %r9b
	shrb	$4, %r10b
	andl	$1, %r9d
	andl	%r10d, %esi
	xorl	%r10d, %r10d
	addl	%r9d, %r9d
	orl	%r9d, %esi
	movzbl	62(%r12), %r9d
	movl	%r9d, %edi
	shrb	$5, %dil
	andl	$1, %edi
	sall	$2, %edi
	orl	%edi, %esi
	movzbl	16(%r12), %edi
	cmpb	$20, %dil
	je	.L13034
.L12929:
	leal	0(,%r10,8), %r12d
	orl	%r12d, %esi
	jne	.L12928
	testl	%edx, %edx
	jne	.L12928
	testl	%r11d, %r11d
	je	.L12927
.L12928:
	movl	%r8d, %r12d
	shrb	$5, %r9b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %r12b
	movl	%r9d, %ecx
	movl	%r8d, %r10d
	andl	%r12d, %esi
	andl	$1, %ecx
	andl	$1, %r10d
	sall	$2, %ecx
	addl	%r10d, %r10d
	orl	%r10d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L13035
.L12931:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%rbp), %ecx
	movq	%rax, %r13
.L12927:
	cmpb	$41, %cl
	je	.L13036
	cmpb	$47, %cl
	je	.L13037
	xorl	%r12d, %r12d
	testl	%ebx, %ebx
	je	.L13038
.L12970:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L12971
	testl	%r12d, %r12d
	movq	%rbp, %rbx
	je	.L12974
.L12971:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%rbp)
	movq	%rax, %rbx
	je	.L13039
	movl	$121, %edi
	movq	%rbp, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L13019
.L13039:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%rbp, %rdx
	call	build1
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L13020
	movq	%rbp, %rdi
	call	staticp
	movzbl	17(%rbx), %ebp
	movl	%eax, %r10d
	andb	$1, %r10b
	addb	%r10b, %r10b
	andb	$-4, %bpl
	orb	%r10b, %bpl
	movb	%bpl, 17(%rbx)
	jmp	.L12974
.L13038:
	movq	%rbp, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r12d
	jmp	.L12970
.L13037:
	movq	40(%rbp), %rbx
	movq	8(%rbx), %r12
	movzbl	16(%r12), %r13d
	movq	%r12, %rax
	cmpl	$23, %r13d
	je	.L12935
	cmpl	$18, %r13d
	je	.L12935
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L13040
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L12938
	cmpb	$34, %dl
	je	.L13041
.L12938:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L13014
	cmpb	$115, %dl
	je	.L13042
.L12947:
	movzbl	%dl, %r11d 
	movzbl	tree_code_type(%r11), %eax
	cmpb	$60, %al
	je	.L12952
	cmpb	$49, %al
	je	.L12952
	cmpb	$50, %al
	je	.L12952
	cmpb	$101, %al
	je	.L12952
.L12951:
	cmpl	$10, %r13d
	je	.L13043
	cmpb	$39, %dl
	je	.L13044
.L12960:
	movq	%r12, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L12965
	testb	$32, 17(%r12)
	je	.L12966
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L12967
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r12), %esi
	movzwl	60(%rdx), %r12d
	andl	$511, %esi
	andl	$511, %r12d
	cmpl	%r12d, %esi
	je	.L12967
.L12966:
	movq	integer_types+40(%rip), %rdi
.L13017:
	movq	%rbx, %rsi
	call	convert
.L12936:
	movq	8(%rax), %rsi
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L13021
.L12967:
	movq	integer_types+48(%rip), %rdi
	jmp	.L13017
.L12965:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L12968
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L12968
	movq	global_trees+192(%rip), %r9
	cmpq	%r9, 128(%r12)
	je	.L13045
.L12968:
	cmpl	$5, %r13d
	je	.L13046
	movq	%rbx, %rax
	jmp	.L12936
.L13046:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L12936
.L13045:
	movq	global_trees+200(%rip), %rdi
	jmp	.L13017
	.p2align 6,,7
.L13044:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L12960
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%rdi), %esi
	movq	40(%rdx), %rdi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L12960
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L12966
	testb	$32, 17(%r12)
	jne	.L12967
	jmp	.L12966
	.p2align 6,,7
.L13043:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r12), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L12959
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L12958
.L12959:
	testb	$32, 17(%r12)
	movl	$1, %eax
	cmovne	%eax, %esi
.L12958:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L13017
.L12952:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L12951
.L13042:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rsi)
	jne	.L12947
.L12950:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L13047
.L13014:
	movq	32(%rbx), %rsi
	jmp	.L12950
.L13047:
	cmpb	$115, %dl
	jne	.L12947
	movq	32(%rsi), %r8
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%r8)
	movq	%r8, %rsi
	je	.L12950
	jmp	.L12947
.L13041:
	movl	pedantic(%rip), %edi
	testl	%edi, %edi
	jne	.L12942
	cmpb	$51, 48(%rbx)
	je	.L12942
	cmpq	$0, current_function_decl(%rip)
	je	.L12944
	movzbl	17(%rbx), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L13048
.L12944:
	movq	%rbx, %rsi
.L12945:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L12942:
	movq	%rax, %r12
	jmp	.L12938
.L13048:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L12944
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L12944
	testb	$2, 17(%rax)
	je	.L12944
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L12945
	jmp	.L12944
	.p2align 6,,7
.L13040:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L12938
.L12935:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L12936
.L13036:
	movq	72(%r13), %rdi
	movq	32(%rbp), %rsi
	jmp	.L13019
.L13035:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L12931
.L13034:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %r10d
	jmp	.L12929
.L12926:
	movzbl	17(%rbp), %r10d
	movl	$1, %r11d
	movl	%r10d, %edx
	shrb	$3, %r10b
	shrb	$4, %dl
	andl	%r10d, %r11d
	andl	$1, %edx
	jmp	.L12925
.L13033:
	movl	$121, %edi
	movq	%rbp, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L13021
.L12921:
	movl	24(%rdi), %eax
	movl	%eax, 24(%rbp)
	jmp	.L12920
.L13032:
	movq	32(%rbp), %rdx
	cmpq	%r12, 8(%rdx)
	jne	.L12915
	.p2align 4,,7
.L12919:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rdx, %rbp
	movzbl	16(%rdx), %ecx
	cmove	%eax, %ebx
	cmpb	$116, %cl
	jne	.L13049
.L13012:
	movq	32(%rbp), %rdx
	jmp	.L12919
.L13049:
	cmpb	$115, %cl
	jne	.L12915
	movq	32(%rdx), %rdx
	movq	8(%rbp), %r8
	cmpq	%r8, 8(%rdx)
	je	.L12919
	jmp	.L12915
.LFE32:
.Lfe32:
	.size	c_convert_parm_for_inlining,.Lfe32-c_convert_parm_for_inlining
	.section	.rodata.str1.32
	.align 32
.LC158:
	.string	"traditional C rejects automatic aggregate initialization"
	.text
	.align 2
	.p2align 4,,15
.globl store_init_value
	.type	store_init_value,@function
store_init_value:
.LFB33:
	pushq	%rbp
.LCFI137:
	movq	%rsp, %rbp
.LCFI138:
	pushq	%r15
.LCFI139:
	pushq	%r14
.LCFI140:
	pushq	%r13
.LCFI141:
	pushq	%r12
.LCFI142:
	pushq	%rbx
.LCFI143:
	subq	$232, %rsp
.LCFI144:
	movq	%rsi, -56(%rbp)
	movq	%rdi, -48(%rbp)
	movq	8(%rdi), %r15
	movzbl	16(%r15), %edx
	testb	%dl, %dl
	je	.L13057
	movzbl	18(%rdi), %ecx
	movq	%r15, %r12
	movl	$0, -212(%rbp)
	shrb	$2, %cl
	movl	%ecx, %ebx
	andl	$1, %ebx
	movl	%ebx, -60(%rbp)
	jne	.L13060
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L13059
	movl	flag_isoc99(%rip), %esi
	testl	%esi, %esi
	jne	.L13059
.L13060:
	movl	$1, -212(%rbp)
.L13059:
	movzbl	%dl, %ebx
	movq	-56(%rbp), %rdi
	movq	global_trees(%rip), %rdx
	cmpq	%rdx, %r15
	movq	%rdx, %rax
	je	.L13062
	cmpq	%rdx, %rdi
	je	.L13062
	cmpq	%rdx, 8(%rdi)
	je	.L13062
	movq	-56(%rbp), %rax
	cmpb	$116, 16(%rax)
	je	.L13742
.L13064:
	call	fold
	cmpl	$18, %ebx
	movq	%rax, %r13
	je	.L13743
.L13065:
	testq	%r13, %r13
	je	.L13305
	movq	8(%r13), %rax
	testq	%rax, %rax
	jne	.L13744
.L13305:
	leal	-6(%rbx), %edx
	cmpl	$1, %edx
	jbe	.L13490
	cmpl	$13, %ebx
	je	.L13490
	cmpl	$10, %ebx
	je	.L13490
	cmpl	$11, %ebx
	je	.L13490
	cmpl	$8, %ebx
	je	.L13490
	movq	32(%r15), %rax
	testq	%rax, %rax
	je	.L13542
	cmpb	$25, 16(%rax)
	je	.L13542
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC149, %esi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %r10
	xorl	%r12d, %r12d
	cmpq	%r10, %r14
	movq	%r14, %rbx
	movq	%r10, %r13
	jae	.L13693
.L13549:
	cmpl	$3, (%rbx)
	je	.L13745
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13545:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13549
.L13693:
	movslq	%r12d,%r9
	movq	%r14, %r12
	addq	$16, %r9
	andq	$-16, %r9
	subq	%r9, %rsp
	cmpq	%r13, %r14
	movq	%rsp, -168(%rbp)
	movq	%rsp, %rbx
	jae	.L13695
.L13563:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13746
	cmpl	$2, %eax
	je	.L13747
.L13557:
	movq	8(%r12), %rdi
	movzbl	(%rdi), %r14d
	leaq	1(%rdi), %rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	je	.L13553
	.p2align 4,,7
.L13562:
	movzbl	(%rcx), %esi
	incq	%rbx
	incq	%rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	jne	.L13562
.L13553:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13563
.L13695:
	movb	$0, (%rbx)
	movq	-168(%rbp), %rax
	cmpb	$0, (%rax)
	jne	.L13748
.L13627:
	movq	global_trees(%rip), %r13
.L13063:
	movl	warn_traditional(%rip), %r12d
	testl	%r12d, %r12d
	je	.L13628
	movl	in_system_header(%rip), %edi
	testl	%edi, %edi
	jne	.L13628
	movq	-48(%rbp), %rax
	movq	8(%rax), %rsi
	movzbl	16(%rsi), %eax
	cmpb	$18, %al
	je	.L13629
	cmpb	$20, %al
	je	.L13629
	cmpb	$21, %al
	je	.L13629
	cmpb	$22, %al
	je	.L13629
	cmpb	$19, %al
	je	.L13629
	.p2align 4,,7
.L13628:
	movq	-48(%rbp), %r8
	movq	%r13, 104(%r8)
	movzbl	16(%r13), %ebx
	subb	$114, %bl
	cmpb	$2, %bl
	ja	.L13631
	movq	32(%r13), %rax
	movq	global_trees(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L13631
	movq	8(%rax), %r11
	cmpq	%r11, 8(%r13)
	je	.L13634
.L13631:
	movq	%r13, %rdi
	call	constant_expression_warning
	cmpb	$18, 16(%r15)
	je	.L13749
.L13057:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
	.p2align 6,,7
.L13749:
	cmpq	$0, 24(%r15)
	jne	.L13057
	cmpq	global_trees(%rip), %r13
	je	.L13057
	movq	-56(%rbp), %rdi
	cmpb	$116, 16(%rdi)
	je	.L13750
.L13636:
	call	fold
	cmpb	$-86, 16(%rax)
	jne	.L13057
	movq	32(%rax), %rdx
	movq	32(%rdx), %rbx
	movq	8(%rbx), %r13
	movq	24(%r13), %rax
	testq	%rax, %rax
	je	.L13057
	movq	%r15, %rdi
	movq	%rax, 24(%r15)
	call	layout_type
	movq	%rbx, %rdi
	xorl	%esi, %esi
	call	layout_decl
	jmp	.L13057
.L13750:
	movq	32(%rdi), %rdi
	jmp	.L13636
	.p2align 6,,7
.L13634:
	movzbl	16(%rax), %r10d
	movq	%rax, %r13
	subb	$114, %r10b
	cmpb	$2, %r10b
	ja	.L13631
	movq	32(%rax), %rax
	cmpq	%rdx, %rax
	je	.L13631
	movq	8(%rax), %r9
	cmpq	%r9, 8(%r13)
	je	.L13634
	jmp	.L13631
.L13629:
	movq	-48(%rbp), %rcx
	testb	$4, 18(%rcx)
	jne	.L13628
	movl	$.LC158, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L13628
.L13748:
	movl	$.LC142, %edi
	movq	%rax, %rsi
.L13737:
	xorl	%eax, %eax
	call	error
	jmp	.L13627
.L13747:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13557
.L13746:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13553
.L13745:
	addl	$25, %r12d
	jmp	.L13545
.L13542:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L13567
	movzbl	16(%r15), %eax
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	cmpb	$20, %al
	je	.L13601
	cmpb	$18, %al
	je	.L13601
	cmpb	$22, %al
	je	.L13601
	cmpb	$21, %al
	je	.L13601
.L13698:
	cmpq	%r12, %r15
	je	.L13627
	movq	-56(%rbp), %rsi
	movl	-60(%rbp), %edx
	movq	%r12, %rdi
	movl	-212(%rbp), %ecx
	call	digest_init
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	build_tree_list
	movq	%rax, 40(%r14)
	jmp	.L13063
	.p2align 6,,7
.L13601:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movl	$46, %edi
	movq	%r12, %rsi
	call	build
	testq	%r14, %r14
	movq	%rax, %rbx
	jne	.L13571
	movq	%rax, %r13
.L13572:
	cmpb	$18, 16(%r12)
	movq	%rbx, %r14
	je	.L13751
	movq	24(%r12), %rax
	testq	%rax, %rax
	je	.L13575
	movq	8(%rax), %r12
.L13568:
	movzbl	16(%r12), %eax
	cmpb	$20, %al
	je	.L13601
	cmpb	$18, %al
	je	.L13601
	cmpb	$22, %al
	je	.L13601
	cmpb	$21, %al
	je	.L13601
	jmp	.L13698
	.p2align 6,,7
.L13575:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC150, %esi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %rcx
	xorl	%r12d, %r12d
	cmpq	%rcx, %r14
	movq	%r14, %rbx
	movq	%rcx, %r13
	jae	.L13700
.L13583:
	cmpl	$3, (%rbx)
	je	.L13752
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13579:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13583
.L13700:
	movslq	%r12d,%rbx
	movq	%r14, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r13, %r14
	movq	%rsp, -176(%rbp)
	movq	%rsp, %rbx
	jae	.L13702
.L13597:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13753
	cmpl	$2, %eax
	je	.L13754
.L13591:
	movq	8(%r12), %r13
	movzbl	(%r13), %r8d
	leaq	1(%r13), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L13587
	.p2align 4,,7
.L13596:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L13596
.L13587:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13597
.L13702:
	movb	$0, (%rbx)
	movq	-176(%rbp), %rdx
.L13740:
	cmpb	$0, (%rdx)
	je	.L13627
	movl	$.LC142, %edi
	movq	%rdx, %rsi
	jmp	.L13737
.L13754:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13591
.L13753:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13587
.L13752:
	addl	$25, %r12d
	jmp	.L13579
	.p2align 6,,7
.L13751:
	movq	8(%r12), %r12
	jmp	.L13568
	.p2align 6,,7
.L13571:
	xorl	%edi, %edi
	movq	%rax, %rsi
	call	build_tree_list
	movq	%rax, 40(%r14)
	jmp	.L13572
.L13567:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC150, %esi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %r13
	xorl	%r12d, %r12d
	cmpq	%r13, %r14
	movq	%r14, %rbx
	jae	.L13705
.L13610:
	cmpl	$3, (%rbx)
	je	.L13755
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13606:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13610
.L13705:
	movslq	%r12d,%rdx
	movq	%r14, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r14
	movq	%rsp, -184(%rbp)
	movq	%rsp, %rbx
	jae	.L13707
.L13624:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13756
	cmpl	$2, %eax
	je	.L13757
.L13618:
	movq	8(%r12), %r9
	movzbl	(%r9), %r10d
	leaq	1(%r9), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L13614
	.p2align 4,,7
.L13623:
	movzbl	(%rcx), %r14d
	incq	%rbx
	incq	%rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	jne	.L13623
.L13614:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13624
.L13707:
	movb	$0, (%rbx)
	movq	-184(%rbp), %rcx
.L13741:
	cmpb	$0, (%rcx)
	je	.L13627
	movl	$.LC142, %edi
	movq	%rcx, %rsi
	jmp	.L13737
.L13757:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13618
.L13756:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13614
.L13755:
	addl	$25, %r12d
	jmp	.L13606
	.p2align 6,,7
.L13490:
	movq	-56(%rbp), %rsi
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	movq	%r15, %rdi
	movl	$.LC147, %edx
	call	convert_for_assignment
	movl	-60(%rbp), %r10d
	movq	%rax, %r13
	testl	%r10d, %r10d
	je	.L13063
	testb	$2, 17(%rax)
	jne	.L13491
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %r9
	xorl	%r12d, %r12d
	cmpq	%r9, %r14
	movq	%r14, %rbx
	movq	%r9, %r13
	jae	.L13683
	.p2align 4,,7
.L13498:
	cmpl	$3, (%rbx)
	je	.L13758
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13494:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13498
.L13683:
	movslq	%r12d,%rbx
	movq	%r14, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r13, %r14
	movq	%rsp, -152(%rbp)
	movq	%rsp, %rbx
	jae	.L13685
	.p2align 4,,7
.L13512:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13759
	cmpl	$2, %eax
	je	.L13760
.L13506:
	movq	8(%r12), %rdi
	movzbl	(%rdi), %r14d
	leaq	1(%rdi), %rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	je	.L13502
	.p2align 4,,7
.L13511:
	movzbl	(%rcx), %esi
	incq	%rbx
	incq	%rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	jne	.L13511
.L13502:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13512
.L13685:
	movb	$0, (%rbx)
	movq	-152(%rbp), %rcx
	jmp	.L13741
.L13760:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13506
.L13759:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13502
.L13758:
	addl	$25, %r12d
	jmp	.L13494
.L13491:
	movq	8(%rax), %rsi
	movq	%rax, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L13063
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC148, %esi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %rcx
	xorl	%r12d, %r12d
	cmpq	%rcx, %r14
	movq	%r14, %rbx
	movq	%rcx, %r13
	jae	.L13688
.L13524:
	cmpl	$3, (%rbx)
	je	.L13761
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13520:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13524
.L13688:
	movslq	%r12d,%r8
	movq	%r14, %r12
	addq	$16, %r8
	andq	$-16, %r8
	subq	%r8, %rsp
	cmpq	%r13, %r14
	movq	%rsp, -160(%rbp)
	movq	%rsp, %rbx
	jae	.L13690
.L13538:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13762
	cmpl	$2, %eax
	je	.L13763
.L13532:
	movq	8(%r12), %r11
	movzbl	(%r11), %r13d
	leaq	1(%r11), %rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	je	.L13528
	.p2align 4,,7
.L13537:
	movzbl	(%rcx), %edx
	incq	%rbx
	incq	%rcx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	jne	.L13537
.L13528:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13538
.L13690:
	movb	$0, (%rbx)
	movq	-160(%rbp), %rbx
	cmpb	$0, (%rbx)
	je	.L13627
	movl	$.LC142, %edi
	movq	%rbx, %rsi
	jmp	.L13737
.L13763:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13532
.L13762:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13528
.L13761:
	addl	$25, %r12d
	jmp	.L13520
.L13744:
	movq	128(%rax), %rdi
	movq	128(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L13306
	cmpl	$18, %ebx
	je	.L13764
.L13307:
	cmpl	$9, %ebx
	je	.L13765
.L13308:
	cmpl	$13, %ebx
	jne	.L13305
	movq	8(%r13), %rdx
	movzbl	16(%rdx), %eax
	cmpb	$18, %al
	je	.L13309
	cmpb	$23, %al
	jne	.L13305
.L13309:
	movq	8(%rdx), %rdi
	movq	8(%r15), %rsi
	call	comptypes
	testl	%eax, %eax
	je	.L13305
.L13306:
	cmpl	$13, %ebx
	je	.L13766
.L13310:
	movl	-60(%rbp), %eax
	testl	%eax, %eax
	je	.L13371
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L13371
	cmpb	$-86, 16(%r13)
	je	.L13767
.L13371:
	cmpl	$18, %ebx
	je	.L13768
.L13372:
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L13397
	cmpb	$34, 16(%r13)
	je	.L13769
.L13397:
	movl	-60(%rbp), %eax
	testl	%eax, %eax
	je	.L13063
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L13404
	cmpb	$47, 16(%r13)
	je	.L13770
.L13404:
	movl	-60(%rbp), %r12d
	testl	%r12d, %r12d
	je	.L13063
	testb	$2, 17(%r13)
	je	.L13464
	movq	8(%r13), %rsi
	movq	%r13, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L13063
.L13464:
	movl	$.LC146, %esi
	xorl	%eax, %eax
	movl	$.LC42, %edi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %rsi
	xorl	%r12d, %r12d
	cmpq	%rsi, %r14
	movq	%r14, %rbx
	movq	%rsi, %r13
	jae	.L13678
.L13471:
	cmpl	$3, (%rbx)
	je	.L13771
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13467:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13471
.L13678:
	movslq	%r12d,%rcx
	movq	%r14, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r13, %r14
	movq	%rsp, -144(%rbp)
	movq	%rsp, %rbx
	jae	.L13680
.L13485:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13772
	cmpl	$2, %eax
	je	.L13773
.L13479:
	movq	8(%r12), %r8
	movzbl	(%r8), %r13d
	leaq	1(%r8), %rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	je	.L13475
.L13484:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L13484
.L13475:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13485
.L13680:
	movb	$0, (%rbx)
	movq	-144(%rbp), %rdx
	jmp	.L13740
.L13773:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13479
.L13772:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13475
.L13771:
	addl	$25, %r12d
	jmp	.L13467
.L13770:
	movq	8(%r13), %rbx
	movq	32(%r13), %rdi
	movq	%rbx, %rsi
	call	valid_compound_expr_initializer
	movq	global_trees(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L13774
	movq	40(%r13), %rdi
	movq	%rbx, %rsi
	call	valid_compound_expr_initializer
	movq	global_trees(%rip), %rdx
	movq	%rax, %r13
.L13407:
	cmpq	%rdx, %r13
	je	.L13775
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	pedwarn
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %r10
	xorl	%r12d, %r12d
	cmpq	%r10, %r14
	movq	%r14, %rbx
	movq	%r10, -208(%rbp)
	jae	.L13673
.L13443:
	cmpl	$3, (%rbx)
	je	.L13776
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13439:
	addq	$16, %rbx
	cmpq	-208(%rbp), %rbx
	jb	.L13443
.L13673:
	movslq	%r12d,%rbx
	movq	%r14, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	-208(%rbp), %r14
	movq	%rsp, -136(%rbp)
	movq	%rsp, %rbx
	jae	.L13675
.L13457:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13777
	cmpl	$2, %eax
	je	.L13778
.L13451:
	movq	8(%r12), %r9
	movzbl	(%r9), %r14d
	leaq	1(%r9), %rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	je	.L13447
.L13456:
	movzbl	(%rcx), %edi
	incq	%rbx
	incq	%rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	jne	.L13456
.L13447:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13457
.L13675:
	movb	$0, (%rbx)
	movq	-136(%rbp), %rax
	cmpb	$0, (%rax)
	jne	.L13779
.L13436:
	movl	flag_pedantic_errors(%rip), %eax
	testl	%eax, %eax
	je	.L13063
	jmp	.L13627
.L13779:
	movq	%rax, %rsi
	movl	$.LC142, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L13436
.L13778:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13451
.L13777:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13447
.L13776:
	addl	$25, %r12d
	jmp	.L13439
.L13775:
	movl	$.LC146, %esi
	xorl	%eax, %eax
	movl	$.LC42, %edi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %rsi
	xorl	%r12d, %r12d
	cmpq	%rsi, %r14
	movq	%r14, %rbx
	movq	%rsi, -200(%rbp)
	jae	.L13668
.L13418:
	cmpl	$3, (%rbx)
	je	.L13780
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13414:
	addq	$16, %rbx
	cmpq	-200(%rbp), %rbx
	jb	.L13418
.L13668:
	movslq	%r12d,%rcx
	movq	%r14, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	-200(%rbp), %r14
	movq	%rsp, -128(%rbp)
	movq	%rsp, %rbx
	jae	.L13670
.L13432:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13781
	cmpl	$2, %eax
	je	.L13782
.L13426:
	movq	8(%r12), %r11
	movzbl	(%r11), %r8d
	leaq	1(%r11), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L13422
.L13431:
	movzbl	(%rcx), %edx
	incq	%rbx
	incq	%rcx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	jne	.L13431
.L13422:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13432
.L13670:
	movb	$0, (%rbx)
	movq	-128(%rbp), %rbx
	cmpb	$0, (%rbx)
	je	.L13436
	movl	$.LC142, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L13436
	.p2align 6,,7
.L13782:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13426
.L13781:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13422
.L13780:
	addl	$25, %r12d
	jmp	.L13414
.L13774:
	movq	%rdx, %r13
	jmp	.L13407
.L13769:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L13397
	cmpb	$51, 48(%r13)
	je	.L13397
	cmpq	$0, current_function_decl(%rip)
	je	.L13402
	movzbl	17(%r13), %edi
	andb	$24, %dil
	cmpb	$16, %dil
	je	.L13783
.L13402:
	movq	%r13, %rax
.L13403:
	movq	%rax, %r13
	jmp	.L13397
.L13783:
	movq	104(%r13), %rax
	testq	%rax, %rax
	je	.L13402
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L13402
	testb	$2, 17(%rax)
	je	.L13402
	cmpb	$46, %dl
	jne	.L13403
	jmp	.L13402
	.p2align 6,,7
.L13768:
	movzbl	16(%r13), %eax
	cmpb	$29, %al
	je	.L13372
	cmpb	$46, %al
	je	.L13372
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC145, %esi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %rdx
	xorl	%r12d, %r12d
	cmpq	%rdx, %r14
	movq	%r14, %rbx
	movq	%rdx, %r13
	jae	.L13663
.L13379:
	cmpl	$3, (%rbx)
	je	.L13784
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13375:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13379
.L13663:
	movslq	%r12d,%rbx
	movq	%r14, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r13, %r14
	movq	%rsp, -120(%rbp)
	movq	%rsp, %rbx
	jae	.L13665
.L13393:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13785
	cmpl	$2, %eax
	je	.L13786
.L13387:
	movq	8(%r12), %r10
	movzbl	(%r10), %r14d
	leaq	1(%r10), %rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	je	.L13383
.L13392:
	movzbl	(%rcx), %r9d
	incq	%rbx
	incq	%rcx
	testb	%r9b, %r9b
	movb	%r9b, (%rbx)
	jne	.L13392
.L13383:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13393
.L13665:
	movb	$0, (%rbx)
	movq	-120(%rbp), %rcx
	jmp	.L13741
.L13786:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13387
.L13785:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13383
.L13784:
	addl	$25, %r12d
	jmp	.L13375
.L13767:
	movq	32(%r13), %r11
	movq	32(%r11), %r12
	movq	104(%r12), %r13
	jmp	.L13371
.L13766:
	movzbl	16(%r13), %ecx
	movq	8(%r13), %rdi
	xorl	%r12d, %r12d
	movq	%r13, %r8
	movzbl	16(%rdi), %esi
	cmpb	$116, %cl
	je	.L13725
	cmpb	$115, %cl
	je	.L13787
.L13312:
	movzbl	%cl, %edx 
	movzbl	tree_code_type(%rdx), %eax
	cmpb	$60, %al
	je	.L13318
	cmpb	$49, %al
	je	.L13318
	cmpb	$50, %al
	je	.L13318
	cmpb	$101, %al
	je	.L13318
.L13317:
	cmpl	$23, %esi
	je	.L13788
	cmpl	$18, %esi
	je	.L13789
	movq	%r13, %r12
.L13320:
	movq	%r12, %r13
	jmp	.L13310
.L13789:
	movzbl	%cl, %esi 
	xorl	%edx, %edx
	xorl	%r14d, %r14d
	movzbl	tree_code_type(%rsi), %eax
	movq	8(%rdi), %r11
	cmpb	$114, %al
	je	.L13323
	cmpb	$100, %al
	je	.L13323
.L13322:
	movzbl	17(%rdi), %r8d
	movl	$1, %r9d
	movl	%r8d, %r10d
	movl	%r8d, %esi
	shrb	$3, %r10b
	shrb	$4, %sil
	andl	$1, %r10d
	andl	%esi, %r9d
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rdi), %r10d
	movzbl	16(%rdi), %edi
	movl	%r10d, %esi
	shrb	$5, %sil
	andl	$1, %esi
	sall	$2, %esi
	orl	%esi, %r9d
	xorl	%esi, %esi
	cmpb	$20, %dil
	je	.L13790
.L13326:
	leal	0(,%rsi,8), %eax
	orl	%eax, %r9d
	jne	.L13325
	testl	%edx, %edx
	jne	.L13325
	testl	%r14d, %r14d
	je	.L13324
.L13325:
	movl	%r8d, %ecx
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %cl
	movl	%r8d, %r9d
	andl	%ecx, %esi
	movl	%r10d, %ecx
	andl	$1, %r9d
	andl	$1, %ecx
	addl	%r9d, %r9d
	sall	$2, %ecx
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L13791
.L13328:
	leal	0(,%rcx,8), %r8d
	leal	(%r14,%r14), %edi
	orl	%r8d, %esi
	orl	%edx, %esi
	orl	%edi, %esi
	movq	%r11, %rdi
	call	c_build_qualified_type
	movzbl	16(%r13), %ecx
	movq	%rax, %r11
.L13324:
	cmpb	$41, %cl
	je	.L13792
	cmpb	$47, %cl
	je	.L13793
	xorl	%r14d, %r14d
	testl	%r12d, %r12d
	je	.L13794
.L13367:
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L13368
	testl	%r14d, %r14d
	movq	%r13, %r12
	je	.L13320
.L13368:
	movq	%r11, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r13)
	movq	%rax, %r12
	je	.L13795
	movl	$121, %edi
	movq	%r13, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%r12, %rdi
	movq	%rax, %rsi
.L13736:
	call	convert
.L13732:
	movq	%rax, %r12
	jmp	.L13320
.L13795:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r13, %rdx
	call	build1
	movq	%r13, %rdi
	movq	%rax, %r12
	call	mark_addressable
	testl	%eax, %eax
	jne	.L13370
	movq	global_trees(%rip), %r12
	jmp	.L13320
.L13370:
	movq	%r13, %rdi
	call	staticp
	movzbl	17(%r12), %r13d
	movl	%eax, %r8d
	andb	$1, %r8b
	addb	%r8b, %r8b
	andb	$-4, %r13b
	orb	%r8b, %r13b
	movb	%r13b, 17(%r12)
	jmp	.L13320
	.p2align 6,,7
.L13794:
	movq	%r13, %rdi
	movq	%r11, -264(%rbp)
	call	lvalue_p
	movq	-264(%rbp), %r11
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %r14d
	jmp	.L13367
.L13793:
	movq	40(%r13), %r12
	movq	8(%r12), %r14
	movzbl	16(%r14), %edx
	movq	%r14, %rax
	cmpl	$23, %edx
	movl	%edx, -108(%rbp)
	je	.L13332
	cmpl	$18, %edx
	je	.L13332
	movzbl	16(%r12), %edx
	cmpb	$32, %dl
	je	.L13796
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L13335
	cmpb	$34, %dl
	je	.L13797
.L13335:
	cmpb	$116, %dl
	movq	%r12, %rcx
	je	.L13727
	cmpb	$115, %dl
	je	.L13798
.L13344:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L13349
	cmpb	$49, %al
	je	.L13349
	cmpb	$50, %al
	je	.L13349
	cmpb	$101, %al
	je	.L13349
.L13348:
	cmpl	$10, -108(%rbp)
	je	.L13799
	cmpb	$39, %dl
	je	.L13800
.L13357:
	movq	%r14, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L13362
	testb	$32, 17(%r14)
	je	.L13363
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L13364
	movq	integer_types+40(%rip), %r9
	movzwl	60(%r14), %r10d
	movzwl	60(%r9), %r14d
	andl	$511, %r10d
	andl	$511, %r14d
	cmpl	%r14d, %r10d
	je	.L13364
.L13363:
	movq	integer_types+40(%rip), %rdi
.L13731:
	movq	%r12, %rsi
	call	convert
.L13333:
	movq	8(%rax), %rsi
	movq	32(%r13), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L13732
.L13364:
	movq	integer_types+48(%rip), %rdi
	jmp	.L13731
	.p2align 6,,7
.L13362:
	movl	flag_traditional(%rip), %edi
	testl	%edi, %edi
	je	.L13365
	movl	flag_allow_single_precision(%rip), %esi
	testl	%esi, %esi
	jne	.L13365
	movq	global_trees+192(%rip), %rcx
	cmpq	%rcx, 128(%r14)
	je	.L13801
.L13365:
	cmpl	$5, -108(%rbp)
	je	.L13802
	movq	%r12, %rax
	jmp	.L13333
.L13802:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L13333
.L13801:
	movq	global_trees+200(%rip), %rdi
	jmp	.L13731
	.p2align 6,,7
.L13800:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L13357
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L13357
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L13363
	testb	$32, 17(%r14)
	jne	.L13364
	jmp	.L13363
.L13799:
	movq	integer_types+40(%rip), %r8
	movzwl	60(%r14), %edx
	movl	flag_traditional(%rip), %ecx
	movzwl	60(%r8), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ecx, %ecx
	jne	.L13356
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L13355
.L13356:
	testb	$32, 17(%r14)
	movl	$1, %eax
	cmovne	%eax, %esi
.L13355:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L13731
	.p2align 6,,7
.L13349:
	movl	24(%rcx), %eax
	movl	%eax, 24(%r12)
	jmp	.L13348
.L13798:
	movq	32(%r12), %rsi
	movq	8(%r12), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L13344
.L13347:
	movzbl	16(%rsi), %edx
	movq	%rsi, %r12
	cmpb	$116, %dl
	jne	.L13803
.L13727:
	movq	32(%r12), %rsi
	jmp	.L13347
.L13803:
	cmpb	$115, %dl
	jne	.L13344
	movq	32(%rsi), %rdi
	movq	8(%r12), %r9
	cmpq	%r9, 8(%rdi)
	movq	%rdi, %rsi
	je	.L13347
	jmp	.L13344
.L13797:
	movl	pedantic(%rip), %r14d
	testl	%r14d, %r14d
	jne	.L13339
	cmpb	$51, 48(%r12)
	je	.L13339
	cmpq	$0, current_function_decl(%rip)
	je	.L13341
	movzbl	17(%r12), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L13804
.L13341:
	movq	%r12, %rsi
.L13342:
	movq	%rsi, %r12
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L13339:
	movq	%rax, %r14
	jmp	.L13335
.L13804:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L13341
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L13341
	testb	$2, 17(%rax)
	je	.L13341
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L13342
	jmp	.L13341
.L13796:
	movq	104(%r12), %r12
	movzbl	16(%r12), %edx
	jmp	.L13335
	.p2align 6,,7
.L13332:
	movq	%r12, %rdi
	call	default_function_array_conversion
	jmp	.L13333
.L13792:
	movq	72(%r11), %rdi
	movq	32(%r13), %rsi
	jmp	.L13736
.L13791:
	testq	%r11, %r11
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L13328
.L13790:
	testq	%r11, %r11
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L13326
.L13323:
	movzbl	17(%r13), %r8d
	movl	$1, %r14d
	movl	%r8d, %edx
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	%r8d, %r14d
	andl	$1, %edx
	jmp	.L13322
.L13788:
	movl	$121, %edi
	movq	%r13, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L13732
.L13318:
	movl	24(%r8), %eax
	movl	%eax, 24(%r13)
	jmp	.L13317
.L13787:
	movq	32(%r13), %rdx
	cmpq	%rdi, 8(%rdx)
	jne	.L13312
	.p2align 4,,7
.L13316:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rdx, %r13
	movzbl	16(%rdx), %ecx
	cmove	%eax, %r12d
	cmpb	$116, %cl
	jne	.L13805
.L13725:
	movq	32(%r13), %rdx
	jmp	.L13316
.L13805:
	cmpb	$115, %cl
	jne	.L13312
	movq	32(%rdx), %r14
	movq	8(%r13), %r11
	cmpq	%r11, 8(%r14)
	movq	%r14, %rdx
	je	.L13316
	jmp	.L13312
.L13765:
	movq	8(%r13), %rdi
	movq	%r15, %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L13306
	jmp	.L13308
.L13764:
	movq	8(%r13), %rdi
	movq	%r15, %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L13306
	jmp	.L13307
	.p2align 6,,7
.L13743:
	movq	8(%r15), %rdx
	movq	128(%rdx), %r14
	cmpq	integer_types(%rip), %r14
	je	.L13067
	cmpq	integer_types+8(%rip), %r14
	je	.L13067
	cmpq	integer_types+16(%rip), %r14
	je	.L13067
	cmpq	c_global_trees+16(%rip), %r14
	je	.L13067
	cmpq	c_global_trees+8(%rip), %r14
	jne	.L13065
.L13067:
	testq	%r13, %r13
	je	.L13305
	cmpb	$29, 16(%r13)
	jne	.L13065
	movq	8(%r13), %rdi
	movq	128(%r15), %r12
	movq	128(%rdi), %rbx
	cmpq	%r12, %rbx
	je	.L13730
	testq	%rbx, %rbx
	je	.L13730
	testq	%r12, %r12
	je	.L13730
	movzbl	16(%rbx), %edx
	testb	%dl, %dl
	je	.L13730
	movzbl	16(%r12), %eax
	testb	%al, %al
	je	.L13730
	cmpb	$6, %dl
	je	.L13806
.L13072:
	cmpb	$6, %al
	je	.L13807
.L13073:
	cmpb	$10, %dl
	je	.L13808
.L13074:
	cmpb	$10, 16(%r12)
	je	.L13809
.L13075:
	cmpq	%r12, %rbx
	movl	$1, -252(%rbp)
	je	.L13071
	movzbl	16(%rbx), %esi
	cmpb	16(%r12), %sil
	je	.L13077
	movl	$0, -252(%rbp)
.L13071:
	movl	-252(%rbp), %edi
	testl	%edi, %edi
	jne	.L13063
.L13068:
	movq	8(%r13), %rsi
	movq	integer_types(%rip), %rcx
	movq	8(%rsi), %r8
	cmpq	%rcx, 128(%r8)
	je	.L13227
	movzwl	60(%r14), %eax
	movzwl	60(%rcx), %r12d
	andl	$511, %eax
	andl	$511, %r12d
	cmpl	%r12d, %eax
	je	.L13810
.L13227:
	movq	8(%rsi), %rbx
	movq	128(%rbx), %rax
	cmpq	%rcx, %rax
	je	.L13811
.L13252:
	movq	%r15, 8(%r13)
	cmpq	$0, 24(%r15)
	je	.L13063
	movq	32(%r15), %rax
	testq	%rax, %rax
	je	.L13063
	cmpb	$25, 16(%rax)
	jne	.L13063
	movzwl	60(%r14), %r11d
	movl	32(%r13), %ecx
	movq	integer_types(%rip), %r14
	movzwl	60(%r14), %r12d
	andl	$511, %r11d
	andl	$511, %r12d
	cmpl	%r12d, %r11d
	je	.L13278
	movq	c_global_trees(%rip), %rsi
	movzwl	60(%rsi), %ebx
	andl	$511, %ebx
	sarl	$3, %ebx
	subl	%ebx, %ecx
	movslq	%ecx,%rsi
.L13279:
	movq	40(%r15), %rdi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L13063
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC144, %esi
	call	pedwarn
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %rcx
	xorl	%r12d, %r12d
	cmpq	%rcx, %r14
	movq	%r14, %rbx
	movq	%rcx, -192(%rbp)
	jae	.L13656
.L13287:
	cmpl	$3, (%rbx)
	je	.L13812
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13283:
	addq	$16, %rbx
	cmpq	-192(%rbp), %rbx
	jb	.L13287
.L13656:
	movslq	%r12d,%rdi
	movq	%r14, %r12
	addq	$16, %rdi
	andq	$-16, %rdi
	subq	%rdi, %rsp
	cmpq	-192(%rbp), %r14
	movq	%rsp, -104(%rbp)
	movq	%rsp, %rbx
	jae	.L13658
.L13301:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13813
	cmpl	$2, %eax
	je	.L13814
.L13295:
	movq	8(%r12), %r9
	movzbl	(%r9), %r8d
	leaq	1(%r9), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L13291
.L13300:
	movzbl	(%rcx), %r10d
	incq	%rbx
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	jne	.L13300
.L13291:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13301
.L13658:
	movb	$0, (%rbx)
	movq	-104(%rbp), %rbx
	cmpb	$0, (%rbx)
	je	.L13063
	movl	$.LC142, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L13063
.L13814:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13295
.L13813:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13291
.L13812:
	addl	$25, %r12d
	jmp	.L13283
.L13278:
	leal	-1(%rcx), %edx
	movslq	%edx,%rsi
	jmp	.L13279
	.p2align 6,,7
.L13811:
	movzwl	60(%r14), %esi
	movzwl	60(%rax), %ecx
	andl	$511, %esi
	andl	$511, %ecx
	cmpl	%ecx, %esi
	je	.L13252
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC143, %esi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %rdx
	xorl	%r12d, %r12d
	cmpq	%rdx, %r14
	movq	%r14, %rbx
	movq	%rdx, %r13
	jae	.L13651
.L13259:
	cmpl	$3, (%rbx)
	je	.L13815
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13255:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13259
.L13651:
	movslq	%r12d,%rdi
	movq	%r14, %r12
	addq	$16, %rdi
	andq	$-16, %rdi
	subq	%rdi, %rsp
	cmpq	%r13, %r14
	movq	%rsp, -96(%rbp)
	movq	%rsp, %rbx
	jae	.L13653
.L13273:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13816
	cmpl	$2, %eax
	je	.L13817
.L13267:
	movq	8(%r12), %r9
	movzbl	(%r9), %r8d
	leaq	1(%r9), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L13263
.L13272:
	movzbl	(%rcx), %r10d
	incq	%rbx
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	jne	.L13272
.L13263:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13273
.L13653:
	movb	$0, (%rbx)
	movq	-96(%rbp), %rcx
	jmp	.L13741
.L13817:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13267
.L13816:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13263
.L13815:
	addl	$25, %r12d
	jmp	.L13255
.L13810:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC140, %esi
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %r9
	xorl	%r12d, %r12d
	cmpq	%r9, %r14
	movq	%r14, %rbx
	movq	%r9, %r13
	jae	.L13646
.L13234:
	cmpl	$3, (%rbx)
	je	.L13818
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13230:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13234
.L13646:
	movslq	%r12d,%r10
	movq	%r14, %r12
	addq	$16, %r10
	andq	$-16, %r10
	subq	%r10, %rsp
	cmpq	%r13, %r14
	movq	%rsp, -88(%rbp)
	movq	%rsp, %rbx
	jae	.L13648
.L13248:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13819
	cmpl	$2, %eax
	je	.L13820
.L13242:
	movq	8(%r12), %r14
	movzbl	(%r14), %r13d
	leaq	1(%r14), %rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	je	.L13238
.L13247:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L13247
.L13238:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13248
.L13648:
	movb	$0, (%rbx)
	movq	-88(%rbp), %rdx
	jmp	.L13740
.L13820:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13242
.L13819:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13238
.L13818:
	addl	$25, %r12d
	jmp	.L13230
.L13077:
	movzbl	17(%rbx), %r10d
	movzbl	62(%rbx), %r9d
	xorl	%ecx, %ecx
	movl	%r10d, %edx
	shrb	$5, %r9b
	shrb	$3, %r10b
	shrb	$4, %dl
	andl	$1, %r10d
	andl	$1, %r9d
	andl	$1, %edx
	addl	%r10d, %r10d
	sall	$2, %r9d
	orl	%r10d, %edx
	orl	%r9d, %edx
	cmpb	$20, %sil
	je	.L13821
.L13079:
	leal	0(,%rcx,8), %edi
	movzbl	62(%r12), %r11d
	movzbl	17(%r12), %ecx
	orl	%edx, %edi
	movl	%ecx, %edx
	shrb	$5, %r11b
	shrb	$3, %cl
	shrb	$4, %dl
	andl	$1, %ecx
	andl	$1, %r11d
	addl	%ecx, %ecx
	andl	$1, %edx
	sall	$2, %r11d
	orl	%ecx, %edx
	xorl	%ecx, %ecx
	orl	%r11d, %edx
	cmpb	$20, %sil
	je	.L13822
.L13080:
	leal	0(,%rcx,8), %esi
	movl	$0, -252(%rbp)
	orl	%esi, %edx
	cmpl	%edx, %edi
	jne	.L13071
	movq	128(%r12), %rax
	cmpq	%rax, 128(%rbx)
	je	.L13730
	movq	%rbx, %rdi
	movq	%r12, %rsi
	call	*targetm+264(%rip)
	movl	$0, -252(%rbp)
	testl	%eax, %eax
	movl	%eax, -64(%rbp)
	je	.L13071
	movl	$0, -252(%rbp)
	movzbl	16(%rbx), %eax
	cmpl	$18, %eax
	je	.L13206
	cmpl	$18, %eax
	ja	.L13223
	cmpl	$13, %eax
	je	.L13084
.L13083:
	cmpl	$2, -64(%rbp)
	jne	.L13071
	cmpl	$1, -252(%rbp)
	movl	-64(%rbp), %eax
	cmovne	-252(%rbp), %eax
	movl	%eax, -252(%rbp)
	jmp	.L13071
.L13084:
	movq	8(%rbx), %rdi
	movq	8(%r12), %rsi
	cmpq	%rsi, %rdi
	je	.L13085
	call	comptypes
.L13729:
	movl	%eax, -252(%rbp)
	jmp	.L13083
.L13085:
	movl	$1, -252(%rbp)
	jmp	.L13083
.L13223:
	cmpl	$20, %eax
	je	.L13219
	cmpl	$23, %eax
	jne	.L13083
	movl	$1, -216(%rbp)
	movq	8(%r12), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L13088
	call	comptypes
	testl	%eax, %eax
	movl	%eax, -216(%rbp)
	je	.L13083
.L13088:
	movq	24(%rbx), %rdx
	movq	%rdx, -248(%rbp)
	testq	%rdx, %rdx
	movq	24(%r12), %rax
	movq	%rax, -240(%rbp)
	je	.L13823
	cmpq	$0, -240(%rbp)
	je	.L13824
	movl	$1, -252(%rbp)
	xorl	%r12d, %r12d
.L13203:
	cmpq	$0, -248(%rbp)
	je	.L13825
	cmpq	$0, -240(%rbp)
	je	.L13192
	movq	-248(%rbp), %rsi
	movq	32(%rsi), %rdi
	testq	%rdi, %rdi
	je	.L13826
	movq	-240(%rbp), %rcx
	movq	32(%rcx), %rax
	testq	%rax, %rax
	jne	.L13178
.L13735:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L13192
.L13177:
	cmpl	-252(%rbp), %r12d
	movl	-252(%rbp), %esi
	movq	-248(%rbp), %r11
	movq	-240(%rbp), %rdi
	cmovg	%r12d, %esi
	movl	%esi, -252(%rbp)
	movq	(%r11), %r10
	movq	%r10, -248(%rbp)
	movq	(%rdi), %r9
	movq	%r9, -240(%rbp)
	jmp	.L13203
.L13192:
	movl	$0, -252(%rbp)
.L13172:
	cmpl	$1, -252(%rbp)
	movl	-252(%rbp), %eax
	cmove	-216(%rbp), %eax
	jmp	.L13729
.L13178:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, %r12d
	jne	.L13177
	movq	-248(%rbp), %rdx
	movq	32(%rdx), %rax
	cmpb	$21, 16(%rax)
	je	.L13828
.L13182:
	movq	-240(%rbp), %rsi
	movq	32(%rsi), %rax
	cmpb	$21, 16(%rax)
	jne	.L13192
	cmpq	$0, 96(%rax)
	je	.L13193
	testb	$8, 62(%rax)
	je	.L13192
.L13193:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L13192
	movq	-248(%rbp), %rax
	movq	32(%rax), %rbx
	movq	32(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L13192
	movq	-240(%rbp), %r8
	movq	32(%r8), %rdx
	movq	24(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L13192
.L13199:
	movq	-248(%rbp), %rcx
	movq	8(%rbx), %rdi
	movq	32(%rcx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L13195
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L13199
	jmp	.L13192
.L13195:
	testq	%rbx, %rbx
	jne	.L13177
	jmp	.L13192
.L13828:
	cmpq	$0, 96(%rax)
	je	.L13183
	testb	$8, 62(%rax)
	je	.L13182
.L13183:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L13182
	movq	-240(%rbp), %r9
	movq	32(%r9), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L13182
	movq	-248(%rbp), %r10
	movq	32(%r10), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L13192
.L13189:
	movq	-240(%rbp), %r11
	movq	8(%rbx), %rdi
	movq	32(%r11), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L13195
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L13189
	jmp	.L13192
.L13826:
	movq	-240(%rbp), %rax
	movq	32(%rax), %rdi
	jmp	.L13735
.L13825:
	cmpq	$0, -240(%rbp)
	je	.L13172
	jmp	.L13192
.L13824:
	movq	-248(%rbp), %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L13083
	movq	136(%r12), %rax
	testq	%rax, %rax
	je	.L13712
	movq	%rax, %r12
	movl	$1, -232(%rbp)
	movl	$0, -228(%rbp)
.L13167:
	cmpq	$0, -248(%rbp)
	je	.L13829
	testq	%r12, %r12
	je	.L13156
	movq	-248(%rbp), %r9
	movq	32(%r9), %rdi
	testq	%rdi, %rdi
	je	.L13830
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L13142
.L13734:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L13156
.L13141:
	movl	-232(%rbp), %r11d
	movl	-228(%rbp), %ebx
	cmpl	%r11d, -228(%rbp)
	movq	-248(%rbp), %r10
	cmovle	%r11d, %ebx
	movl	%ebx, -232(%rbp)
	movq	(%r10), %r9
	movq	%r9, -248(%rbp)
	movq	(%r12), %r12
	jmp	.L13167
.L13156:
	movl	$0, -232(%rbp)
.L13136:
	cmpl	$1, -232(%rbp)
	movl	$2, -252(%rbp)
	jne	.L13083
	movl	-216(%rbp), %r12d
	movl	%r12d, -252(%rbp)
	jmp	.L13083
.L13142:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, -228(%rbp)
	jne	.L13141
	movq	-248(%rbp), %r10
	movq	32(%r10), %rax
	cmpb	$21, 16(%rax)
	je	.L13832
.L13146:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L13156
	cmpq	$0, 96(%rax)
	je	.L13157
	testb	$8, 62(%rax)
	je	.L13156
.L13157:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L13156
	movq	-248(%rbp), %rdx
	movq	32(%rdx), %rcx
	movq	32(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L13156
	movq	32(%r12), %rdi
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L13156
.L13163:
	movq	-248(%rbp), %r8
	movq	8(%rbx), %rdi
	movq	32(%r8), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L13159
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L13163
	jmp	.L13156
.L13159:
	testq	%rbx, %rbx
	jne	.L13141
	jmp	.L13156
.L13832:
	cmpq	$0, 96(%rax)
	je	.L13147
	testb	$8, 62(%rax)
	je	.L13146
.L13147:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L13146
	movq	32(%r12), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L13146
	movq	-248(%rbp), %rax
	movq	32(%rax), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L13156
.L13153:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L13159
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L13153
	jmp	.L13156
.L13830:
	movq	32(%r12), %rdi
	jmp	.L13734
.L13829:
	testq	%r12, %r12
	je	.L13136
	jmp	.L13156
.L13712:
	movl	-216(%rbp), %eax
	jmp	.L13729
.L13823:
	movq	%rax, %rdi
	call	self_promoting_args_p
	testl	%eax, %eax
	je	.L13083
	movq	136(%rbx), %rax
	testq	%rax, %rax
	je	.L13710
	movq	%rax, %r12
	movl	$1, -224(%rbp)
	movl	$0, -220(%rbp)
.L13128:
	cmpq	$0, -240(%rbp)
	je	.L13833
	testq	%r12, %r12
	je	.L13117
	movq	-240(%rbp), %rbx
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L13834
	movq	32(%r12), %rax
	testq	%rax, %rax
	jne	.L13103
.L13733:
	call	simple_type_promotes_to
	testq	%rax, %rax
	jne	.L13117
.L13102:
	movl	-224(%rbp), %edx
	movl	-220(%rbp), %eax
	cmpl	%edx, -220(%rbp)
	movq	-240(%rbp), %rdi
	cmovle	%edx, %eax
	movl	%eax, -224(%rbp)
	movq	(%rdi), %rbx
	movq	%rbx, -240(%rbp)
	movq	(%r12), %r12
	jmp	.L13128
.L13117:
	movl	$0, -224(%rbp)
.L13097:
	cmpl	$1, -224(%rbp)
	movl	$2, -252(%rbp)
	jne	.L13083
	movl	-216(%rbp), %r8d
	movl	%r8d, -252(%rbp)
	jmp	.L13083
.L13103:
	movq	128(%rdi), %rdi
	movq	128(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	movl	%eax, -220(%rbp)
	jne	.L13102
	movq	-240(%rbp), %rdi
	movq	32(%rdi), %rax
	cmpb	$21, 16(%rax)
	je	.L13836
.L13107:
	movq	32(%r12), %rax
	cmpb	$21, 16(%rax)
	jne	.L13117
	cmpq	$0, 96(%rax)
	je	.L13118
	testb	$8, 62(%rax)
	je	.L13117
.L13118:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L13117
	movq	-240(%rbp), %rcx
	movq	32(%rcx), %r11
	movq	32(%r11), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L13117
	movq	32(%r12), %rsi
	movq	24(%rsi), %rbx
	testq	%rbx, %rbx
	je	.L13117
.L13124:
	movq	-240(%rbp), %rax
	movq	8(%rbx), %rdi
	movq	32(%rax), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L13120
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L13124
	jmp	.L13117
.L13120:
	testq	%rbx, %rbx
	jne	.L13102
	jmp	.L13117
.L13836:
	cmpq	$0, 96(%rax)
	je	.L13108
	testb	$8, 62(%rax)
	je	.L13107
.L13108:
	movq	32(%rax), %rdi
	cmpb	$25, 16(%rdi)
	jne	.L13107
	movq	32(%r12), %r8
	movq	32(%r8), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L13107
	movq	-240(%rbp), %r10
	movq	32(%r10), %r9
	movq	24(%r9), %rbx
	testq	%rbx, %rbx
	je	.L13117
.L13114:
	movq	8(%rbx), %rdi
	movq	32(%r12), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L13120
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L13114
	jmp	.L13117
.L13834:
	movq	32(%r12), %rdi
	jmp	.L13733
.L13833:
	testq	%r12, %r12
	je	.L13097
	jmp	.L13117
.L13710:
	movl	-216(%rbp), %r12d
	movl	%r12d, -252(%rbp)
	jmp	.L13083
.L13219:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	call	maybe_objc_comptypes
	decl	%eax
	movl	$1, %eax
	cmovne	-252(%rbp), %eax
	jmp	.L13729
.L13206:
	movq	24(%rbx), %r8
	movq	%r8, -72(%rbp)
	movq	24(%r12), %rax
	movl	$1, -252(%rbp)
	movq	%rax, -80(%rbp)
	movq	8(%r12), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rsi, %rdi
	je	.L13207
	call	comptypes
	testl	%eax, %eax
	movl	%eax, -252(%rbp)
	je	.L13068
.L13207:
	cmpq	$0, -72(%rbp)
	je	.L13083
	cmpq	$0, -80(%rbp)
	je	.L13083
	movq	-80(%rbp), %rbx
	cmpq	%rbx, -72(%rbp)
	je	.L13083
	movq	-72(%rbp), %rax
	movq	112(%rbx), %rsi
	movq	112(%rax), %rcx
	testq	%rcx, %rcx
	sete	%dil
	testq	%rsi, %rsi
	sete	%dl
	xorl	%r8d, %r8d
	testb	%dil, %dil
	jne	.L13210
	movq	104(%rax), %r12
	cmpb	$25, 16(%r12)
	je	.L13837
.L13211:
	movl	$1, %r8d
.L13210:
	xorl	%ecx, %ecx
	testb	%dl, %dl
	jne	.L13212
	movq	-80(%rbp), %r11
	movq	104(%r11), %r10
	cmpb	$25, 16(%r10)
	je	.L13838
.L13213:
	movl	$1, %ecx
.L13212:
	testb	%r8b, %r8b
	jne	.L13083
	testb	%cl, %cl
	jne	.L13083
	testb	%dil, %dil
	je	.L13723
	testb	%dl, %dl
.L13728:
	jne	.L13083
.L13218:
	movl	$0, -252(%rbp)
	jmp	.L13083
.L13723:
	testb	%dl, %dl
	jne	.L13218
	movq	-72(%rbp), %rdx
	movq	-80(%rbp), %rbx
	movq	104(%rdx), %rdi
	movq	104(%rbx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L13218
	movq	-72(%rbp), %rsi
	movq	-80(%rbp), %rcx
	movq	112(%rsi), %rdi
	movq	112(%rcx), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jmp	.L13728
.L13838:
	cmpb	$25, 16(%rsi)
	jne	.L13213
	jmp	.L13212
.L13837:
	cmpb	$25, 16(%rcx)
	jne	.L13211
	jmp	.L13210
	.p2align 6,,7
.L13730:
	movl	$1, -252(%rbp)
	jmp	.L13071
.L13822:
	cmpq	$0, 8(%r12)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L13080
.L13821:
	cmpq	$0, 8(%rbx)
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L13079
.L13809:
	movzbl	17(%r12), %esi
	movzwl	60(%r12), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %r12
	jmp	.L13075
.L13808:
	movzbl	17(%rbx), %esi
	movzwl	60(%rbx), %edi
	shrb	$5, %sil
	andl	$511, %edi
	andl	$1, %esi
	call	type_for_size
	movq	%rax, %rbx
	jmp	.L13074
	.p2align 6,,7
.L13807:
	testb	$2, 62(%r12)
	je	.L13073
	movq	24(%r12), %r8
	testq	%r8, %r8
	cmovne	%r8, %r12
	jmp	.L13073
	.p2align 6,,7
.L13806:
	testb	$2, 62(%rbx)
	je	.L13072
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L13072
	movq	%rdi, %rbx
	movzbl	16(%rdi), %edx
	jmp	.L13072
	.p2align 6,,7
.L13742:
	movq	32(%rax), %rdi
	jmp	.L13064
	.p2align 6,,7
.L13062:
	movq	%rax, %r13
	jmp	.L13063
.LFE33:
.Lfe33:
	.size	store_init_value,.Lfe33-store_init_value
	.align 2
	.p2align 4,,15
.globl error_init
	.type	error_init,@function
error_init:
.LFB34:
	pushq	%rbp
.LCFI145:
	movq	%rdi, %rdx
	xorl	%eax, %eax
	movq	%rsp, %rbp
.LCFI146:
	movl	$.LC42, %edi
	movq	%rdx, %rsi
	pushq	%r15
.LCFI147:
	pushq	%r14
.LCFI148:
	pushq	%r13
.LCFI149:
	pushq	%r12
.LCFI150:
	xorl	%r12d, %r12d
	pushq	%rbx
.LCFI151:
	subq	$8, %rsp
.LCFI152:
	call	error
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %r13
	cmpq	%r13, %r14
	movq	%r14, %rbx
	jae	.L13900
	.p2align 4,,7
.L13882:
	cmpl	$3, (%rbx)
	je	.L13904
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13878:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13882
.L13900:
	movslq	%r12d,%rdx
	movq	%r14, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r14
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L13902
	.p2align 4,,7
.L13896:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13905
	cmpl	$2, %eax
	je	.L13906
.L13890:
	movq	8(%r12), %rdi
	movzbl	(%rdi), %esi
	leaq	1(%rdi), %rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	je	.L13886
	.p2align 4,,7
.L13895:
	movzbl	(%rcx), %r8d
	incq	%rbx
	incq	%rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	jne	.L13895
.L13886:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13896
.L13902:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	jne	.L13907
.L13875:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
.L13907:
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L13875
.L13906:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13890
.L13905:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13886
.L13904:
	addl	$25, %r12d
	jmp	.L13878
.LFE34:
.Lfe34:
	.size	error_init,.Lfe34-error_init
	.align 2
	.p2align 4,,15
.globl pedwarn_init
	.type	pedwarn_init,@function
pedwarn_init:
.LFB35:
	pushq	%rbp
.LCFI153:
	movq	%rdi, %rdx
	xorl	%eax, %eax
	movq	%rsp, %rbp
.LCFI154:
	movl	$.LC42, %edi
	movq	%rdx, %rsi
	pushq	%r15
.LCFI155:
	pushq	%r14
.LCFI156:
	pushq	%r13
.LCFI157:
	pushq	%r12
.LCFI158:
	xorl	%r12d, %r12d
	pushq	%rbx
.LCFI159:
	subq	$8, %rsp
.LCFI160:
	call	pedwarn
	movq	spelling_base(%rip), %r14
	movq	spelling(%rip), %r13
	cmpq	%r13, %r14
	movq	%r14, %rbx
	jae	.L13933
	.p2align 4,,7
.L13915:
	cmpl	$3, (%rbx)
	je	.L13937
	movq	8(%rbx), %rdi
	call	strlen
	leal	1(%rax,%r12), %r12d
.L13911:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L13915
.L13933:
	movslq	%r12d,%rdx
	movq	%r14, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r14
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L13935
	.p2align 4,,7
.L13929:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L13938
	cmpl	$2, %eax
	je	.L13939
.L13923:
	movq	8(%r12), %rdi
	movzbl	(%rdi), %esi
	leaq	1(%rdi), %rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	je	.L13919
	.p2align 4,,7
.L13928:
	movzbl	(%rcx), %r8d
	incq	%rbx
	incq	%rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	jne	.L13928
.L13919:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L13929
.L13935:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	jne	.L13940
.L13908:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
.L13940:
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L13908
.L13939:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L13923
.L13938:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L13919
.L13937:
	addl	$25, %r12d
	jmp	.L13911
.LFE35:
.Lfe35:
	.size	pedwarn_init,.Lfe35-pedwarn_init
	.section	.rodata.str1.1
.LC160:
	.string	"(anonymous)"
	.text
	.align 2
	.p2align 4,,15
.globl start_init
	.type	start_init,@function
start_init:
.LFB36:
	pushq	%r12
.LCFI161:
	movl	%edx, %r12d
	pushq	%rbp
.LCFI162:
	movq	%rdi, %rbp
	movl	$72, %edi
	pushq	%rbx
.LCFI163:
	movq	%rsi, %rbx
	call	xmalloc
	xorl	%ecx, %ecx
	testq	%rbx, %rbx
	movq	%rax, %rdx
	je	.L15165
	movq	40(%rbx), %rcx
.L15165:
	movzbl	require_constant_value(%rip), %esi
	movq	constructor_decl(%rip), %r8
	testq	%rbp, %rbp
	movq	constructor_asmspec(%rip), %rdi
	movq	%r8, 8(%rdx)
	movb	%sil, 69(%rdx)
	movq	%rdi, 16(%rdx)
	movzbl	require_constant_elements(%rip), %ebx
	movb	%bl, 70(%rdx)
	movzbl	constructor_subconstants_deferred(%rip), %esi
	movl	spelling_size(%rip), %eax
	movq	spelling(%rip), %r8
	movq	constructor_stack(%rip), %r11
	movq	constructor_range_stack(%rip), %r10
	movq	constructor_elements(%rip), %r9
	movq	spelling_base(%rip), %rdi
	movl	%eax, 64(%rdx)
	movb	%sil, 71(%rdx)
	movq	%r11, 24(%rdx)
	movq	%r8, 48(%rdx)
	movzbl	constructor_top_level(%rip), %ebx
	movq	%r9, 40(%rdx)
	movq	%r10, 32(%rdx)
	movq	%rdi, 56(%rdx)
	movb	%bl, 68(%rdx)
	movl	%r12d, constructor_top_level(%rip)
	movl	$0, constructor_designated(%rip)
	movq	initializer_stack(%rip), %rbx
	movq	%rbp, constructor_decl(%rip)
	movq	%rcx, constructor_asmspec(%rip)
	movl	$0, constructor_subconstants_deferred(%rip)
	movq	%rbx, (%rdx)
	movq	%rdx, initializer_stack(%rip)
	je	.L15166
	movzbl	18(%rbp), %ecx
	xorl	%edx, %edx
	shrb	$2, %cl
	andl	$1, %ecx
	testl	%ecx, %ecx
	movl	%ecx, require_constant_value(%rip)
	jne	.L15168
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	je	.L15167
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L15167
.L15168:
	movq	8(%rbp), %r12
	movzbl	16(%r12), %eax
	cmpb	$18, %al
	je	.L15169
	cmpb	$20, %al
	je	.L15169
	cmpb	$21, %al
	je	.L15169
	cmpb	$22, %al
	je	.L15169
	.p2align 4,,7
.L15167:
	movl	%edx, require_constant_elements(%rip)
	movq	72(%rbp), %rdx
	movq	32(%rdx), %rbx
.L15170:
	testq	%rbx, %rbx
	movq	$0, constructor_stack(%rip)
	movq	$0, constructor_range_stack(%rip)
	movl	$0, missing_braces_mentioned(%rip)
	movq	$0, spelling_base(%rip)
	movl	$0, spelling_size(%rip)
	movq	$0, spelling(%rip)
	jne	.L15176
.L15164:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 6,,7
.L15176:
	movl	$160, %edi
	movl	$10, spelling_size(%rip)
	call	xmalloc
	movq	%rax, spelling_base(%rip)
	movl	$1, (%rax)
	movq	%rbx, 8(%rax)
	addq	$16, %rax
	movq	%rax, spelling(%rip)
	jmp	.L15164
	.p2align 6,,7
.L15169:
	movl	$1, %edx
	jmp	.L15167
	.p2align 6,,7
.L15166:
	movl	$0, require_constant_value(%rip)
	movl	$0, require_constant_elements(%rip)
	movl	$.LC160, %ebx
	jmp	.L15170
.LFE36:
.Lfe36:
	.size	start_init,.Lfe36-start_init
	.section	.rodata.str1.1
.LC161:
	.string	"finish_init"
	.text
	.align 2
	.p2align 4,,15
.globl finish_init
	.type	finish_init,@function
finish_init:
.LFB37:
	movl	constructor_subconstants_deferred(%rip), %eax
	pushq	%rbx
.LCFI164:
	movq	initializer_stack(%rip), %rbx
	testl	%eax, %eax
	jne	.L15186
.L15178:
	movq	constructor_stack(%rip), %rax
	testq	%rax, %rax
	jne	.L15182
.L15185:
	cmpq	$0, constructor_range_stack(%rip)
	jne	.L15187
	movq	8(%rbx), %rdi
	movsbl	69(%rbx),%ecx
	movsbl	70(%rbx),%edx
	movq	16(%rbx), %rsi
	movl	64(%rbx), %eax
	movq	48(%rbx), %r8
	movq	%rdi, constructor_decl(%rip)
	movq	24(%rbx), %r11
	movq	32(%rbx), %r10
	movq	56(%rbx), %rdi
	movq	40(%rbx), %r9
	movq	%rsi, constructor_asmspec(%rip)
	movl	%ecx, require_constant_value(%rip)
	movl	%edx, require_constant_elements(%rip)
	movsbl	71(%rbx),%esi
	movsbl	68(%rbx),%ecx
	movq	(%rbx), %rdx
	movq	%r11, constructor_stack(%rip)
	movq	%rdi, spelling_base(%rip)
	movq	%r10, constructor_range_stack(%rip)
	movq	%r9, constructor_elements(%rip)
	movq	%rbx, %rdi
	movq	%r8, spelling(%rip)
	movl	%eax, spelling_size(%rip)
	popq	%rbx
	movl	%esi, constructor_subconstants_deferred(%rip)
	movl	%ecx, constructor_top_level(%rip)
	movq	%rdx, initializer_stack(%rip)
	jmp	free
	.p2align 6,,7
.L15182:
	movq	(%rax), %rdx
	movq	%rax, %rdi
	movq	%rdx, constructor_stack(%rip)
	call	free
	movq	constructor_stack(%rip), %rax
	testq	%rax, %rax
	jne	.L15182
	jmp	.L15185
.L15186:
	call	output_deferred_addressed_constants
	jmp	.L15178
.L15187:
	movl	$.LC68, %edi
	movl	$5151, %esi
	movl	$.LC161, %edx
	call	fancy_abort
.LFE37:
.Lfe37:
	.size	finish_init,.Lfe37-finish_init
	.align 2
	.p2align 4,,15
.globl really_start_incremental_init
	.type	really_start_incremental_init,@function
really_start_incremental_init:
.LFB38:
	pushq	%rbx
.LCFI165:
	movq	%rdi, %rbx
	movl	$112, %edi
	call	xmalloc
	testq	%rbx, %rbx
	movq	%rax, %rdx
	jne	.L15189
	movq	constructor_decl(%rip), %rcx
	movq	8(%rcx), %rbx
.L15189:
	movq	constructor_fields(%rip), %r11
	movq	constructor_type(%rip), %rcx
	movq	$0, 96(%rdx)
	movq	constructor_index(%rip), %r10
	movq	constructor_max_index(%rip), %r9
	movq	constructor_unfilled_index(%rip), %r8
	movq	constructor_unfilled_fields(%rip), %rdi
	movq	%r11, 16(%rdx)
	movq	constructor_bit_index(%rip), %rsi
	movq	%rcx, 8(%rdx)
	movzbl	constructor_constant(%rip), %r11d
	movq	%r10, 24(%rdx)
	movq	constructor_elements(%rip), %rcx
	movq	%r9, 32(%rdx)
	movq	%r8, 40(%rdx)
	movq	%rdi, 48(%rdx)
	movq	%rsi, 56(%rdx)
	movq	$0, 88(%rdx)
	movq	%rcx, 64(%rdx)
	movb	%r11b, 104(%rdx)
	movzbl	constructor_simple(%rip), %r10d
	movb	%r10b, 105(%rdx)
	movzbl	constructor_erroneous(%rip), %r9d
	movb	%r9b, 107(%rdx)
	movl	constructor_depth(%rip), %eax
	movq	constructor_pending_elts(%rip), %r8
	movb	$0, 106(%rdx)
	movb	$0, 108(%rdx)
	movzbl	constructor_incremental(%rip), %edi
	movq	%r8, 72(%rdx)
	movl	%eax, 84(%rdx)
	movb	%dil, 109(%rdx)
	movzbl	constructor_designated(%rip), %esi
	movb	%sil, 110(%rdx)
	movl	$0, designator_errorneous(%rip)
	movl	$0, designator_depth(%rip)
	movq	$0, (%rdx)
	movl	$1, constructor_constant(%rip)
	movl	$1, constructor_simple(%rip)
	movq	%rdx, constructor_stack(%rip)
	movq	$0, constructor_elements(%rip)
	movq	$0, constructor_pending_elts(%rip)
	movq	spelling(%rip), %rdx
	movq	%rbx, constructor_type(%rip)
	movl	$1, constructor_incremental(%rip)
	subq	spelling_base(%rip), %rdx
	movl	$0, constructor_designated(%rip)
	sarq	$4, %rdx
	movl	%edx, constructor_depth(%rip)
	movzbl	16(%rbx), %edx
	leal	-20(%rdx), %ecx
	cmpb	$1, %cl
	ja	.L15190
	movq	24(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_fields(%rip)
	je	.L15192
	testb	$2, 53(%rax)
	jne	.L15213
.L15192:
	movq	constructor_fields(%rip), %rdx
	movq	global_trees+136(%rip), %rbx
	movq	%rdx, constructor_unfilled_fields(%rip)
	movq	%rbx, constructor_bit_index(%rip)
.L15188:
	popq	%rbx
	ret
	.p2align 6,,7
.L15213:
	cmpq	$0, 72(%rax)
	jne	.L15192
.L15195:
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L15210
	testb	$2, 53(%rax)
	je	.L15210
	cmpq	$0, 72(%rax)
	je	.L15195
.L15210:
	movq	%rax, constructor_fields(%rip)
	jmp	.L15192
	.p2align 6,,7
.L15190:
	cmpb	$18, %dl
	je	.L15214
	cmpb	$9, %dl
	je	.L15215
	movq	%rbx, constructor_fields(%rip)
	movq	%rbx, constructor_unfilled_fields(%rip)
	jmp	.L15188
	.p2align 6,,7
.L15215:
	movzbl	61(%rbx), %eax
	shrb	$1, %al
	andl	$127, %eax
	movzbl	mode_unit_size(%rax), %edx
	testb	%dl, %dl
	je	.L15206
	movzbw	mode_size(%rax), %ax
	divb	%dl
	movzbl	%al, %r9d
	decl	%r9d
	movslq	%r9d,%rdi
.L15207:
	xorl	%esi, %esi
	call	build_int_2_wide
	movq	global_trees+88(%rip), %rsi
	movq	sizetype_tab+24(%rip), %rdi
	movq	%rax, constructor_max_index(%rip)
	call	convert
	movq	%rax, constructor_index(%rip)
.L15212:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L15188
.L15206:
	movq	$-1, %rdi
	jmp	.L15207
	.p2align 6,,7
.L15214:
	movq	24(%rbx), %rax
	testq	%rax, %rax
	je	.L15198
	movq	112(%rax), %rsi
	testq	%rsi, %rsi
	movq	%rsi, constructor_max_index(%rip)
	jne	.L15199
	cmpq	$0, 32(%rbx)
	jne	.L15216
.L15199:
	movq	constructor_max_index(%rip), %rax
	testq	%rax, %rax
	je	.L15200
	cmpb	$25, 16(%rax)
	je	.L15200
	movq	$-1, %rdi
	movq	%rdi, %rsi
	call	build_int_2_wide
	movq	%rax, constructor_max_index(%rip)
.L15200:
	movq	constructor_type(%rip), %rdi
	movq	24(%rdi), %r8
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%r8), %rsi
	call	convert
.L15211:
	movq	%rax, constructor_index(%rip)
	movq	constructor_index(%rip), %rax
	jmp	.L15212
.L15216:
	movq	$-1, %rdi
	movq	%rdi, %rsi
	call	build_int_2_wide
	movq	%rax, constructor_max_index(%rip)
	jmp	.L15199
.L15198:
	movq	global_trees+136(%rip), %rax
	jmp	.L15211
.LFE38:
.Lfe38:
	.size	really_start_incremental_init,.Lfe38-really_start_incremental_init
	.section	.rodata.str1.1
.LC176:
	.string	"empty scalar initializer"
	.section	.rodata.str1.32
	.align 32
.LC177:
	.string	"extra elements in scalar initializer"
	.align 32
.LC165:
	.string	"initialized field with side-effects overwritten"
	.section	.rodata.str1.1
.LC159:
	.string	"<anonymous>"
.LC175:
	.string	"missing initializer"
	.section	.rodata.str1.32
	.align 32
.LC174:
	.string	"initialization of a flexible array member"
	.align 32
.LC173:
	.string	"initialization of flexible array member in a nested context"
	.section	.rodata.str1.1
.LC172:
	.string	"pop_init_level"
.LC171:
	.string	"process_init_element"
	.section	.rodata.str1.32
	.align 32
.LC181:
	.string	"braces around scalar initializer"
	.align 32
.LC180:
	.string	"set_nonincremental_init_from_string"
	.align 32
.LC179:
	.string	"missing braces around initializer"
	.align 32
.LC178:
	.string	"extra brace group at end of initializer"
	.align 32
.LC168:
	.string	"excess elements in array initializer"
	.align 32
.LC170:
	.string	"excess elements in scalar initializer"
	.align 32
.LC169:
	.string	"excess elements in vector initializer"
	.align 32
.LC167:
	.string	"traditional C rejects initialization of unions"
	.align 32
.LC166:
	.string	"excess elements in union initializer"
	.align 32
.LC164:
	.string	"non-static initialization of a flexible array member"
	.align 32
.LC163:
	.string	"excess elements in struct initializer"
	.align 32
.LC162:
	.string	"excess elements in char array initializer"
	.text
	.align 2
	.p2align 4,,15
.globl push_init_level
	.type	push_init_level,@function
push_init_level:
.LFB39:
	pushq	%rbp
.LCFI166:
	movq	%rsp, %rbp
.LCFI167:
	pushq	%r15
.LCFI168:
	pushq	%r14
.LCFI169:
	pushq	%r13
.LCFI170:
	pushq	%r12
.LCFI171:
	pushq	%rbx
.LCFI172:
	subq	$1272, %rsp
.LCFI173:
	movq	constructor_stack(%rip), %rdx
	movq	$0, -1264(%rbp)
	movl	%edi, -68(%rbp)
	movq	%rdx, -1296(%rbp)
	cmpb	$0, 106(%rdx)
	je	.L15219
.L28702:
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %ecx
	movq	%rdi, %rdx
	subb	$20, %cl
	cmpb	$1, %cl
	ja	.L15221
	cmpq	$0, constructor_fields(%rip)
	jne	.L15221
.L15596:
.L15929:
.L16247:
.L16556:
.L16865:
	movq	$0, -648(%rbp)
	movq	-1296(%rbp), %rbx
	movq	%rbx, -80(%rbp)
	movl	extra_warnings(%rip), %eax
	testl	%eax, %eax
	je	.L16989
	testq	%rdi, %rdi
	je	.L16989
	cmpb	$20, 16(%rdi)
	je	.L32175
.L16989:
	movl	$1, constructor_incremental(%rip)
	movq	constructor_pending_elts(%rip), %r14
.L17026:
	testq	%r14, %r14
	movq	$0, -640(%rbp)
	je	.L17028
	.p2align 4,,7
.L17536:
	movq	constructor_type(%rip), %r15
	movzbl	16(%r15), %eax
	cmpb	$18, %al
	je	.L32176
	subb	$20, %al
	cmpb	$1, %al
	ja	.L17027
	movq	constructor_unfilled_fields(%rip), %rdi
	testq	%rdi, %rdi
	je	.L17028
	call	bit_position
	movq	32(%r14), %rdi
	movq	%rax, %r12
	call	bit_position
	movq	%r12, %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L17285
	movq	32(%r14), %r11
	movq	40(%r14), %rbx
	movq	8(%r11), %rsi
	movq	%r11, %r15
	movq	%r11, constructor_unfilled_fields(%rip)
	movq	%r11, -632(%rbp)
	movq	%rsi, -120(%rbp)
	movq	8(%rbx), %r13
	movzbl	16(%r13), %eax
	movq	%r13, %rdx
	cmpb	$23, %al
	je	.L17287
	cmpb	$18, %al
	je	.L32177
.L31008:
	movq	global_trees(%rip), %r8
.L31393:
	movzbl	16(%rbx), %ecx
.L17286:
	cmpb	$-86, %cl
	je	.L32178
.L17385:
	cmpq	%r8, %rbx
	je	.L32179
	testb	$2, 17(%rbx)
	jne	.L17388
	movl	$0, constructor_constant(%rip)
.L17387:
	movl	require_constant_value(%rip), %eax
	testl	%eax, %eax
	je	.L17392
	testb	$2, 17(%rbx)
	je	.L32180
.L17392:
	movl	require_constant_elements(%rip), %eax
	testl	%eax, %eax
	jne	.L32181
.L17417:
	testq	%r15, %r15
	je	.L17419
	movq	8(%r15), %rax
	cmpq	global_trees(%rip), %rax
	je	.L17027
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32182
.L17419:
	movq	-120(%rbp), %rdi
	movl	require_constant_value(%rip), %edx
	movq	%rbx, %rsi
	movl	require_constant_elements(%rip), %ecx
	call	digest_init
	cmpq	global_trees(%rip), %rax
	movq	%rax, %r13
	je	.L31400
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L32183
.L17423:
	cmpb	$20, 16(%rdi)
	je	.L32184
.L17444:
	cmpb	$21, 16(%rdi)
	je	.L32185
.L17443:
	testq	%r15, %r15
	je	.L17511
	cmpb	$25, 16(%r15)
	je	.L32186
.L17511:
	movq	constructor_elements(%rip), %rdx
	movq	-632(%rbp), %rdi
	movq	%r13, %rsi
	call	tree_cons
	movq	constructor_type(%rip), %r15
	movq	%rax, constructor_elements(%rip)
	movzbl	16(%r15), %eax
	movq	%r15, %rdx
	cmpb	$18, %al
	je	.L32049
	cmpb	$20, %al
	je	.L32187
.L17514:
	cmpb	$21, 16(%rdx)
	je	.L32188
.L17513:
	xorl	%edi, %edi
	testl	%edi, %edi
	jne	.L32189
	.p2align 4,,7
.L17027:
	testq	%r14, %r14
	jne	.L17536
.L17028:
	movl	$1, %r12d
	testl	%r12d, %r12d
	je	.L17539
	cmpq	$0, -640(%rbp)
	je	.L17539
	movq	constructor_type(%rip), %rcx
	movzbl	16(%rcx), %edx
	leal	-20(%rdx), %r11d
	cmpb	$1, %r11b
	jbe	.L32190
	cmpb	$18, %dl
	jne	.L17026
	movq	-640(%rbp), %rax
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L17026
.L32190:
	movq	-640(%rbp), %rdx
	movq	%rdx, constructor_unfilled_fields(%rip)
	jmp	.L17026
.L17539:
	movq	-1296(%rbp), %r14
	movq	88(%r14), %rax
	testq	%rax, %rax
	jne	.L31402
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	je	.L17544
	movzbl	16(%rax), %edx
	leal	-20(%rdx), %r10d
	cmpb	$1, %r10b
	jbe	.L17547
	cmpb	$18, %dl
	je	.L17547
	cmpb	$9, %dl
	je	.L17547
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	jne	.L17548
	movl	constructor_erroneous(%rip), %r8d
	testl	%r8d, %r8d
	je	.L32191
.L17549:
	movq	global_trees(%rip), %rbx
	movq	%rbx, -648(%rbp)
.L17544:
	movq	-1296(%rbp), %rbx
	movsbl	104(%rbx),%edx
	movq	8(%rbx), %rsi
	movq	%rbx, %rdi
	movq	16(%rbx), %rax
	movq	24(%rbx), %r13
	movsbl	105(%rbx),%r10d
	movq	32(%rbx), %r15
	movsbl	107(%rbx),%ecx
	movq	40(%rbx), %r9
	movq	%rsi, constructor_type(%rip)
	movsbl	109(%rbx),%r11d
	movq	48(%rbx), %r14
	movl	%edx, constructor_constant(%rip)
	movq	56(%rbx), %r12
	movq	64(%rbx), %r8
	movq	%rax, constructor_fields(%rip)
	movsbl	110(%rbx),%ebx
	cmpb	$0, 106(%rdi)
	movq	%r13, constructor_index(%rip)
	movq	72(%rdi), %rsi
	movl	84(%rdi), %edx
	movq	%r15, constructor_max_index(%rip)
	movq	%r9, constructor_unfilled_index(%rip)
	movq	%r14, constructor_unfilled_fields(%rip)
	movq	%r12, constructor_bit_index(%rip)
	movq	%r8, constructor_elements(%rip)
	movl	%r10d, constructor_simple(%rip)
	movl	%ecx, constructor_erroneous(%rip)
	movl	%r11d, constructor_incremental(%rip)
	movl	%ebx, constructor_designated(%rip)
	movq	%rsi, constructor_pending_elts(%rip)
	movl	%edx, constructor_depth(%rip)
	jne	.L17606
	movq	96(%rdi), %rdi
	movq	%rdi, constructor_range_stack(%rip)
.L17606:
	movq	-1296(%rbp), %r10
	movslq	%edx,%r8
	movq	-80(%rbp), %rdi
	salq	$4, %r8
	addq	spelling_base(%rip), %r8
	movq	(%r10), %rcx
	movq	%r8, spelling(%rip)
	movq	%rcx, constructor_stack(%rip)
	call	free
	movq	-648(%rbp), %r11
	testq	%r11, %r11
	movq	%r11, -760(%rbp)
	jne	.L17609
	cmpq	$0, constructor_stack(%rip)
	jne	.L17608
	movq	global_trees(%rip), %rdx
	movq	%rdx, -760(%rbp)
.L17609:
	movq	-760(%rbp), %rdx
	movl	$0, -652(%rbp)
	testq	%rdx, %rdx
	movq	%rdx, -152(%rbp)
	je	.L17610
	cmpb	$29, 16(%rdx)
	movl	$1, %eax
	cmovne	-652(%rbp), %eax
	movl	%eax, -652(%rbp)
.L17610:
	movl	-652(%rbp), %r12d
	movl	$0, designator_depth(%rip)
	movl	$0, designator_errorneous(%rip)
	testl	%r12d, %r12d
	je	.L17611
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	je	.L17611
	cmpb	$18, 16(%rax)
	je	.L32192
.L17611:
	movq	constructor_stack(%rip), %r10
	cmpq	$0, 88(%r10)
	movq	%r10, -1296(%rbp)
	jne	.L32193
	movq	constructor_type(%rip), %rdi
	testq	%rdi, %rdi
	je	.L15218
	movq	-1296(%rbp), %r12
	cmpb	$0, 106(%r12)
	je	.L17665
.L18996:
	movzbl	16(%rdi), %r14d
	subb	$20, %r14b
	cmpb	$1, %r14b
	ja	.L17667
	cmpq	$0, constructor_fields(%rip)
	jne	.L17667
	movq	$0, -704(%rbp)
	movq	-1296(%rbp), %r13
	movq	%r13, -160(%rbp)
	movl	extra_warnings(%rip), %ebx
	testl	%ebx, %ebx
	je	.L17731
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	je	.L17731
	cmpb	$20, 16(%rax)
	je	.L32194
.L17731:
	movq	constructor_pending_elts(%rip), %r14
	movl	$1, constructor_incremental(%rip)
	movq	%r14, -664(%rbp)
.L17768:
	cmpq	$0, -664(%rbp)
	movq	$0, -696(%rbp)
	je	.L17770
.L18256:
	movq	constructor_type(%rip), %rbx
	movzbl	16(%rbx), %eax
	cmpb	$18, %al
	je	.L32195
	subb	$20, %al
	cmpb	$1, %al
	ja	.L17769
	movq	constructor_unfilled_fields(%rip), %rdi
	testq	%rdi, %rdi
	je	.L17770
	call	bit_position
	movq	-664(%rbp), %r10
	movq	%rax, %r12
	movq	32(%r10), %rdi
	call	bit_position
	movq	%r12, %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L18016
	movq	-664(%rbp), %r9
	movq	32(%r9), %r15
	movq	40(%r9), %r12
	movq	8(%r15), %r13
	movq	%r15, %r14
	movq	%r15, constructor_unfilled_fields(%rip)
	movq	%r15, -688(%rbp)
	movq	%r13, -176(%rbp)
	movq	8(%r12), %rbx
	movzbl	16(%rbx), %eax
	movq	%rbx, %rdx
	cmpb	$23, %al
	je	.L18018
	cmpb	$18, %al
	je	.L32196
.L31031:
	movq	global_trees(%rip), %r8
.L31432:
	movzbl	16(%r12), %ecx
.L18017:
	cmpb	$-86, %cl
	je	.L32197
.L18105:
	cmpq	%r8, %r12
	je	.L32198
	testb	$2, 17(%r12)
	jne	.L18108
	movl	$0, constructor_constant(%rip)
.L18107:
	movl	require_constant_value(%rip), %eax
	testl	%eax, %eax
	je	.L18112
	testb	$2, 17(%r12)
	je	.L32199
.L18112:
	movl	require_constant_elements(%rip), %eax
	testl	%eax, %eax
	jne	.L32200
.L18137:
	testq	%r14, %r14
	je	.L18139
	movq	8(%r14), %rax
	cmpq	global_trees(%rip), %rax
	je	.L17769
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32201
.L18139:
	movq	-176(%rbp), %rdi
	movl	require_constant_value(%rip), %edx
	movq	%r12, %rsi
	movl	require_constant_elements(%rip), %ecx
	call	digest_init
	cmpq	global_trees(%rip), %rax
	movq	%rax, -680(%rbp)
	je	.L31439
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L32202
.L18143:
	cmpb	$20, 16(%rdi)
	je	.L32203
.L18164:
	cmpb	$21, 16(%rdi)
	je	.L32204
.L18163:
	testq	%r14, %r14
	je	.L18231
	cmpb	$25, 16(%r14)
	je	.L32205
.L18231:
	movq	constructor_elements(%rip), %rdx
	movq	-688(%rbp), %rdi
	movq	-680(%rbp), %rsi
	call	tree_cons
	movq	constructor_type(%rip), %r14
	movq	%rax, constructor_elements(%rip)
	movzbl	16(%r14), %eax
	movq	%r14, %rdx
	cmpb	$18, %al
	je	.L32053
	cmpb	$20, %al
	je	.L32206
.L18234:
	cmpb	$21, 16(%rdx)
	je	.L32207
.L18233:
	xorl	%eax, %eax
	testl	%eax, %eax
	jne	.L32208
.L17769:
	cmpq	$0, -664(%rbp)
	jne	.L18256
.L17770:
	movl	$1, %edx
	testl	%edx, %edx
	je	.L18259
	cmpq	$0, -696(%rbp)
	je	.L18259
	movq	constructor_type(%rip), %r8
	movzbl	16(%r8), %edx
	leal	-20(%rdx), %r9d
	cmpb	$1, %r9b
	jbe	.L32209
	cmpb	$18, %dl
	jne	.L17768
	movq	-696(%rbp), %rdi
	movq	%rdi, constructor_unfilled_index(%rip)
	jmp	.L17768
.L32209:
	movq	-696(%rbp), %r11
	movq	%r11, constructor_unfilled_fields(%rip)
	jmp	.L17768
.L18259:
	movq	-1296(%rbp), %r14
	movq	88(%r14), %rax
	testq	%rax, %rax
	jne	.L31440
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	je	.L18264
	movzbl	16(%rax), %edx
	leal	-20(%rdx), %ebx
	cmpb	$1, %bl
	jbe	.L18267
	cmpb	$18, %dl
	je	.L18267
	cmpb	$9, %dl
	je	.L18267
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	jne	.L18268
	movl	constructor_erroneous(%rip), %r12d
	testl	%r12d, %r12d
	je	.L32210
.L18269:
	movq	global_trees(%rip), %rcx
	movq	%rcx, -704(%rbp)
.L18264:
	movq	-1296(%rbp), %r13
	movsbl	109(%r13),%edx
	movq	8(%r13), %r10
	movsbl	104(%r13),%r11d
	movsbl	105(%r13),%r8d
	movsbl	107(%r13),%r9d
	movsbl	110(%r13),%ecx
	cmpb	$0, 106(%r13)
	movq	16(%r13), %rax
	movq	%r10, constructor_type(%rip)
	movq	24(%r13), %rsi
	movq	32(%r13), %r12
	movl	%edx, constructor_incremental(%rip)
	movq	40(%r13), %r15
	movq	48(%r13), %rbx
	movl	%r11d, constructor_constant(%rip)
	movq	56(%r13), %r14
	movq	64(%r13), %rdi
	movq	%rax, constructor_fields(%rip)
	movq	72(%r13), %r10
	movl	84(%r13), %edx
	movq	%rsi, constructor_index(%rip)
	movq	%r12, constructor_max_index(%rip)
	movq	%r15, constructor_unfilled_index(%rip)
	movq	%rbx, constructor_unfilled_fields(%rip)
	movq	%r14, constructor_bit_index(%rip)
	movq	%rdi, constructor_elements(%rip)
	movl	%r8d, constructor_simple(%rip)
	movl	%r9d, constructor_erroneous(%rip)
	movl	%ecx, constructor_designated(%rip)
	movq	%r10, constructor_pending_elts(%rip)
	movl	%edx, constructor_depth(%rip)
	jne	.L18326
	movq	96(%r13), %r13
	movq	%r13, constructor_range_stack(%rip)
.L18326:
	movslq	%edx,%r9
	movq	-160(%rbp), %rdi
	movq	-1296(%rbp), %rdx
	salq	$4, %r9
	addq	spelling_base(%rip), %r9
	movq	(%rdx), %rcx
	movq	%r9, spelling(%rip)
	movq	%rcx, constructor_stack(%rip)
	call	free
	movq	-704(%rbp), %rdi
.L32114:
	testq	%rdi, %rdi
	jne	.L18994
	cmpq	$0, constructor_stack(%rip)
	jne	.L18993
	movq	global_trees(%rip), %rdi
.L18994:
	call	process_init_element
	movq	constructor_stack(%rip), %r11
	movq	%r11, -1296(%rbp)
	cmpb	$0, 106(%r11)
	je	.L17665
	movq	constructor_type(%rip), %rdi
	jmp	.L18996
	.p2align 6,,7
.L17665:
	cmpq	$0, constructor_range_stack(%rip)
	je	.L21960
	movq	-760(%rbp), %rsi
	cmpb	$-86, 16(%rsi)
	je	.L32211
.L18999:
	movq	-760(%rbp), %rdi
	call	save_expr
	movq	%rax, -760(%rbp)
.L21960:
	movq	constructor_type(%rip), %rbx
	cmpb	$20, 16(%rbx)
	movq	%rbx, %r14
	je	.L32212
	movzbl	16(%rbx), %edx
	cmpb	$21, %dl
	je	.L32213
	cmpb	$18, %dl
	jne	.L19681
	movq	8(%rbx), %r15
	cmpq	$0, -760(%rbp)
	movq	128(%r15), %r14
	movzbl	16(%r14), %edx
	je	.L19683
	cmpl	$18, %edx
	je	.L32214
.L19682:
	cmpq	$0, -760(%rbp)
	je	.L19683
	movl	constructor_no_implicit(%rip), %r12d
	testl	%r12d, %r12d
	jne	.L19683
	movq	-760(%rbp), %rax
	cmpq	global_trees(%rip), %rax
	je	.L19683
	movq	8(%rax), %rdi
	cmpq	%r14, 128(%rdi)
	je	.L19683
	cmpl	$20, %edx
	je	.L19685
	cmpl	$18, %edx
	je	.L19685
	cmpl	$21, %edx
	jne	.L19683
.L19685:
	movl	$1, %edi
	call	push_init_level
	jmp	.L21960
.L19683:
	movq	constructor_max_index(%rip), %rdi
	testq	%rdi, %rdi
	jne	.L32215
.L19686:
	cmpq	$0, -760(%rbp)
	jne	.L32216
.L20025:
	movq	constructor_index(%rip), %rsi
	movq	global_trees+144(%rip), %rdx
	movl	$59, %edi
	call	size_binop
	cmpq	$0, -760(%rbp)
	movq	%rax, constructor_index(%rip)
	jne	.L19358
	movq	%rax, constructor_unfilled_index(%rip)
.L19358:
	movq	constructor_range_stack(%rip), %rsi
	testq	%rsi, %rsi
	movq	%rsi, -216(%rbp)
	je	.L25741
	movq	constructor_stack(%rip), %rdx
	movl	$0, -916(%rbp)
	movq	$0, constructor_range_stack(%rip)
	cmpq	16(%rsi), %rdx
	movq	%rdx, -1296(%rbp)
	je	.L30024
.L21282:
	movq	-1296(%rbp), %rax
	cmpb	$0, 106(%rax)
	je	.L32092
	movq	$0, -864(%rbp)
	movq	-1296(%rbp), %r11
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	movq	%r11, -224(%rbp)
	je	.L20626
	cmpq	$0, constructor_fields(%rip)
	je	.L20626
	cmpb	$18, 16(%rax)
	je	.L32217
.L20626:
	movl	extra_warnings(%rip), %eax
	testl	%eax, %eax
	je	.L20683
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	je	.L20683
	cmpb	$20, 16(%rax)
	je	.L32218
.L20683:
	movq	constructor_pending_elts(%rip), %rbx
	movl	$1, constructor_incremental(%rip)
	movq	%rbx, -824(%rbp)
.L20720:
	cmpq	$0, -824(%rbp)
	movq	$0, -856(%rbp)
	je	.L20722
.L21208:
	movq	constructor_type(%rip), %rdx
	movzbl	16(%rdx), %eax
	cmpb	$18, %al
	je	.L32219
	subb	$20, %al
	cmpb	$1, %al
	ja	.L20721
	movq	constructor_unfilled_fields(%rip), %rdi
	testq	%rdi, %rdi
	je	.L20722
	call	bit_position
	movq	-824(%rbp), %r13
	movq	%rax, %r12
	movq	32(%r13), %rdi
	call	bit_position
	movq	%r12, %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L20968
	movq	-824(%rbp), %rsi
	movq	32(%rsi), %r15
	movq	40(%rsi), %r12
	movq	8(%r15), %rdi
	movq	%r15, %r14
	movq	%r15, constructor_unfilled_fields(%rip)
	movq	%r15, -848(%rbp)
	movq	%rdi, -240(%rbp)
	movq	8(%r12), %rbx
	movzbl	16(%rbx), %eax
	movq	%rbx, %rdx
	cmpb	$23, %al
	je	.L20970
	cmpb	$18, %al
	je	.L32220
.L31129:
	movq	global_trees(%rip), %r8
.L31594:
	movzbl	16(%r12), %ecx
.L20969:
	cmpb	$-86, %cl
	je	.L32221
.L21057:
	cmpq	%r8, %r12
	je	.L32222
	testb	$2, 17(%r12)
	jne	.L21060
	movl	$0, constructor_constant(%rip)
.L21059:
	movl	require_constant_value(%rip), %eax
	testl	%eax, %eax
	je	.L21064
	testb	$2, 17(%r12)
	je	.L32223
.L21064:
	movl	require_constant_elements(%rip), %eax
	testl	%eax, %eax
	jne	.L32224
.L21089:
	testq	%r14, %r14
	je	.L21091
	movq	8(%r14), %rax
	cmpq	global_trees(%rip), %rax
	je	.L20721
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32225
.L21091:
	movq	-240(%rbp), %rdi
	movl	require_constant_value(%rip), %edx
	movq	%r12, %rsi
	movl	require_constant_elements(%rip), %ecx
	call	digest_init
	cmpq	global_trees(%rip), %rax
	movq	%rax, -840(%rbp)
	je	.L31601
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L32226
.L21095:
	cmpb	$20, 16(%rdi)
	je	.L32227
.L21116:
	cmpb	$21, 16(%rdi)
	je	.L32228
.L21115:
	testq	%r14, %r14
	je	.L21183
	cmpb	$25, 16(%r14)
	je	.L32229
.L21183:
	movq	constructor_elements(%rip), %rdx
	movq	-848(%rbp), %rdi
	movq	-840(%rbp), %rsi
	call	tree_cons
	movq	constructor_type(%rip), %r14
	movq	%rax, constructor_elements(%rip)
	movzbl	16(%r14), %eax
	movq	%r14, %rdx
	cmpb	$18, %al
	je	.L32067
	cmpb	$20, %al
	je	.L32230
.L21186:
	cmpb	$21, 16(%rdx)
	je	.L32231
.L21185:
	xorl	%eax, %eax
	testl	%eax, %eax
	jne	.L32232
.L20721:
	cmpq	$0, -824(%rbp)
	jne	.L21208
.L20722:
	movl	$1, %edx
	testl	%edx, %edx
	je	.L21211
	cmpq	$0, -856(%rbp)
	je	.L21211
	movq	constructor_type(%rip), %r8
	movzbl	16(%r8), %edx
	leal	-20(%rdx), %r9d
	cmpb	$1, %r9b
	jbe	.L32233
	cmpb	$18, %dl
	jne	.L20720
	movq	-856(%rbp), %r10
	movq	%r10, constructor_unfilled_index(%rip)
	jmp	.L20720
.L32233:
	movq	-856(%rbp), %r11
	movq	%r11, constructor_unfilled_fields(%rip)
	jmp	.L20720
.L21211:
	movq	-1296(%rbp), %r14
	movq	88(%r14), %rax
	testq	%rax, %rax
	jne	.L31603
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	je	.L21216
	movzbl	16(%rax), %edx
	leal	-20(%rdx), %ebx
	cmpb	$1, %bl
	jbe	.L21219
	cmpb	$18, %dl
	je	.L21219
	cmpb	$9, %dl
	je	.L21219
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	jne	.L21220
	movl	constructor_erroneous(%rip), %r12d
	testl	%r12d, %r12d
	je	.L32234
.L21221:
	movq	global_trees(%rip), %rcx
	movq	%rcx, -864(%rbp)
.L21216:
	movq	-1296(%rbp), %r13
	movq	8(%r13), %rcx
	movsbl	109(%r13),%edx
	movsbl	104(%r13),%r11d
	movsbl	105(%r13),%r8d
	movsbl	107(%r13),%r9d
	cmpb	$0, 106(%r13)
	movq	%rcx, constructor_type(%rip)
	movq	16(%r13), %rax
	movq	24(%r13), %rsi
	movsbl	110(%r13),%ecx
	movq	32(%r13), %r12
	movl	%edx, constructor_incremental(%rip)
	movq	40(%r13), %r15
	movq	48(%r13), %rbx
	movl	%r11d, constructor_constant(%rip)
	movq	56(%r13), %r14
	movq	64(%r13), %r10
	movq	%rax, constructor_fields(%rip)
	movq	72(%r13), %rdi
	movl	84(%r13), %edx
	movq	%rsi, constructor_index(%rip)
	movq	%r12, constructor_max_index(%rip)
	movq	%r15, constructor_unfilled_index(%rip)
	movq	%rbx, constructor_unfilled_fields(%rip)
	movq	%r14, constructor_bit_index(%rip)
	movq	%r10, constructor_elements(%rip)
	movl	%r8d, constructor_simple(%rip)
	movl	%r9d, constructor_erroneous(%rip)
	movl	%ecx, constructor_designated(%rip)
	movq	%rdi, constructor_pending_elts(%rip)
	movl	%edx, constructor_depth(%rip)
	jne	.L21278
	movq	96(%r13), %r13
	movq	%r13, constructor_range_stack(%rip)
.L21278:
	movslq	%edx,%r9
	movq	-1296(%rbp), %rdx
	salq	$4, %r9
	addq	spelling_base(%rip), %r9
	movq	(%rdx), %rdi
	movq	%r9, spelling(%rip)
	movq	%rdi, constructor_stack(%rip)
	movq	-224(%rbp), %rdi
	call	free
	movq	-864(%rbp), %rdi
	testq	%rdi, %rdi
	jne	.L21281
	cmpq	$0, constructor_stack(%rip)
	jne	.L21280
	movq	global_trees(%rip), %rdi
.L21281:
	call	process_init_element
	movq	-216(%rbp), %r8
	movq	constructor_stack(%rip), %r11
	cmpq	16(%r8), %r11
	movq	%r11, -1296(%rbp)
	jne	.L21282
.L30024:
	movq	-216(%rbp), %r10
	movq	%r10, -928(%rbp)
.L21283:
	movq	-928(%rbp), %rax
	movq	40(%rax), %rsi
	testq	%rsi, %rsi
	je	.L21950
	movq	32(%rax), %rdi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L32235
.L21950:
	movq	constructor_stack(%rip), %r14
	movq	%r14, -248(%rbp)
	cmpb	$0, 106(%r14)
	je	.L32091
	movq	$0, -912(%rbp)
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	je	.L21294
	cmpq	$0, constructor_fields(%rip)
	je	.L21294
	cmpb	$18, 16(%rax)
	je	.L32236
.L21294:
	movl	extra_warnings(%rip), %r14d
	testl	%r14d, %r14d
	je	.L21351
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	je	.L21351
	cmpb	$20, 16(%rax)
	je	.L32237
.L21351:
	movq	constructor_pending_elts(%rip), %rax
	movl	$1, constructor_incremental(%rip)
	movq	%rax, -872(%rbp)
.L21388:
	cmpq	$0, -872(%rbp)
	movq	$0, -904(%rbp)
	je	.L21390
.L21876:
	movq	constructor_type(%rip), %rcx
	movzbl	16(%rcx), %eax
	cmpb	$18, %al
	je	.L32238
	subb	$20, %al
	cmpb	$1, %al
	ja	.L21389
	movq	constructor_unfilled_fields(%rip), %rdi
	testq	%rdi, %rdi
	je	.L21390
	call	bit_position
	movq	-872(%rbp), %r13
	movq	%rax, %r12
	movq	32(%r13), %rdi
	call	bit_position
	movq	%r12, %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L21636
	movq	-872(%rbp), %rsi
	movq	32(%rsi), %r15
	movq	40(%rsi), %r12
	movq	8(%r15), %rdi
	movq	%r15, %r14
	movq	%r15, constructor_unfilled_fields(%rip)
	movq	%r15, -896(%rbp)
	movq	%rdi, -264(%rbp)
	movq	8(%r12), %rbx
	movzbl	16(%rbx), %eax
	movq	%rbx, %rdx
	cmpb	$23, %al
	je	.L21638
	cmpb	$18, %al
	je	.L32239
.L31150:
	movq	global_trees(%rip), %r8
.L31634:
	movzbl	16(%r12), %ecx
.L21637:
	cmpb	$-86, %cl
	je	.L32240
.L21725:
	cmpq	%r8, %r12
	je	.L32241
	testb	$2, 17(%r12)
	jne	.L21728
	movl	$0, constructor_constant(%rip)
.L21727:
	movl	require_constant_value(%rip), %r15d
	testl	%r15d, %r15d
	je	.L21732
	testb	$2, 17(%r12)
	je	.L32242
.L21732:
	movl	require_constant_elements(%rip), %eax
	testl	%eax, %eax
	jne	.L32243
.L21757:
	testq	%r14, %r14
	je	.L21759
	movq	8(%r14), %rax
	cmpq	global_trees(%rip), %rax
	je	.L21389
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32244
.L21759:
	movq	-264(%rbp), %rdi
	movl	require_constant_value(%rip), %edx
	movq	%r12, %rsi
	movl	require_constant_elements(%rip), %ecx
	call	digest_init
	cmpq	global_trees(%rip), %rax
	movq	%rax, -888(%rbp)
	je	.L31641
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L32245
.L21763:
	cmpb	$20, 16(%rdi)
	je	.L32246
.L21784:
	cmpb	$21, 16(%rdi)
	je	.L32247
.L21783:
	testq	%r14, %r14
	je	.L21851
	cmpb	$25, 16(%r14)
	je	.L32248
.L21851:
	movq	constructor_elements(%rip), %rdx
	movq	-896(%rbp), %rdi
	movq	-888(%rbp), %rsi
	call	tree_cons
	movq	constructor_type(%rip), %r14
	movq	%rax, constructor_elements(%rip)
	movzbl	16(%r14), %eax
	movq	%r14, %rdx
	cmpb	$18, %al
	je	.L32071
	cmpb	$20, %al
	je	.L32249
.L21854:
	cmpb	$21, 16(%rdx)
	je	.L32250
.L21853:
	xorl	%eax, %eax
	testl	%eax, %eax
	jne	.L32251
.L21389:
	cmpq	$0, -872(%rbp)
	jne	.L21876
.L21390:
	movl	$1, %r10d
	testl	%r10d, %r10d
	je	.L21879
	cmpq	$0, -904(%rbp)
	je	.L21879
	movq	constructor_type(%rip), %rsi
	movzbl	16(%rsi), %edx
	leal	-20(%rdx), %edi
	cmpb	$1, %dil
	jbe	.L32252
	cmpb	$18, %dl
	jne	.L21388
	movq	-904(%rbp), %r13
	movq	%r13, constructor_unfilled_index(%rip)
	jmp	.L21388
.L32252:
	movq	-904(%rbp), %rdx
	movq	%rdx, constructor_unfilled_fields(%rip)
	jmp	.L21388
.L21879:
	movq	-248(%rbp), %r14
	movq	88(%r14), %rax
	testq	%rax, %rax
	jne	.L31643
	movq	constructor_type(%rip), %rax
	testq	%rax, %rax
	je	.L21884
	movzbl	16(%rax), %edx
	leal	-20(%rdx), %ebx
	cmpb	$1, %bl
	jbe	.L21887
	cmpb	$18, %dl
	je	.L21887
	cmpb	$9, %dl
	je	.L21887
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	jne	.L21888
	movl	constructor_erroneous(%rip), %r12d
	testl	%r12d, %r12d
	je	.L32253
.L21889:
	movq	global_trees(%rip), %rcx
	movq	%rcx, -912(%rbp)
.L21884:
	movq	-248(%rbp), %r15
	movsbl	104(%r15),%edx
	movq	8(%r15), %r11
	movsbl	105(%r15),%esi
	movsbl	107(%r15),%edi
	movsbl	109(%r15),%r10d
	movsbl	110(%r15),%ecx
	cmpb	$0, 106(%r15)
	movq	16(%r15), %rax
	movq	%r11, constructor_type(%rip)
	movq	24(%r15), %r8
	movq	32(%r15), %r9
	movl	%edx, constructor_constant(%rip)
	movq	40(%r15), %r12
	movq	48(%r15), %rbx
	movl	%esi, constructor_simple(%rip)
	movq	56(%r15), %r14
	movq	64(%r15), %r13
	movq	%rax, constructor_fields(%rip)
	movq	72(%r15), %r11
	movl	84(%r15), %edx
	movq	%r8, constructor_index(%rip)
	movq	%r9, constructor_max_index(%rip)
	movq	%r12, constructor_unfilled_index(%rip)
	movq	%rbx, constructor_unfilled_fields(%rip)
	movq	%r14, constructor_bit_index(%rip)
	movq	%r13, constructor_elements(%rip)
	movl	%edi, constructor_erroneous(%rip)
	movl	%r10d, constructor_incremental(%rip)
	movl	%ecx, constructor_designated(%rip)
	movq	%r11, constructor_pending_elts(%rip)
	movl	%edx, constructor_depth(%rip)
	jne	.L21946
	movq	96(%r15), %r15
	movq	%r15, constructor_range_stack(%rip)
.L21946:
	movslq	%edx,%rdi
	movq	-248(%rbp), %r10
	salq	$4, %rdi
	addq	spelling_base(%rip), %rdi
	movq	(%r10), %rcx
	movq	%rdi, spelling(%rip)
	movq	-248(%rbp), %rdi
	movq	%rcx, constructor_stack(%rip)
	call	free
	movq	-912(%rbp), %rdi
	testq	%rdi, %rdi
	jne	.L21949
	cmpq	$0, constructor_stack(%rip)
	jne	.L21948
	movq	global_trees(%rip), %rdi
.L21949:
	call	process_init_element
	movq	-928(%rbp), %r13
	movq	8(%r13), %rdx
	movq	%rdx, -928(%rbp)
	jmp	.L21283
.L21948:
	xorl	%edi, %edi
	jmp	.L21949
.L32253:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC176, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r13
	jae	.L30168
.L21896:
	cmpl	$3, (%rbx)
	je	.L32254
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21892:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21896
.L30168:
	movslq	%r12d,%r9
	movq	%r8, %r12
	addq	$16, %r9
	andq	$-16, %r9
	subq	%r9, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30170
.L21910:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32255
	cmpl	$2, %eax
	je	.L32256
.L21904:
	movq	8(%r12), %r15
	movzbl	(%r15), %r8d
	leaq	1(%r15), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L21900
.L21909:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L21909
.L21900:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21910
.L30170:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L21889
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L21889
.L32256:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21904
.L32255:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21900
.L32254:
	addl	$25, %r12d
	jmp	.L21892
.L21888:
	cmpq	$0, (%rax)
	jne	.L32257
.L21915:
	movq	32(%rax), %rax
.L31643:
	movq	%rax, -912(%rbp)
	jmp	.L21884
.L32257:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC177, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r10
	xorl	%r12d, %r12d
	cmpq	%r10, %r8
	movq	%r8, %rbx
	movq	%r10, %r13
	jae	.L30173
.L21922:
	cmpl	$3, (%rbx)
	je	.L32258
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21918:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21922
.L30173:
	movslq	%r12d,%rdi
	movq	%r8, %r12
	addq	$16, %rdi
	andq	$-16, %rdi
	subq	%rdi, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30175
.L21936:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32259
	cmpl	$2, %eax
	je	.L32260
.L21930:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %esi
	leaq	1(%rdx), %rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	je	.L21926
.L21935:
	movzbl	(%rcx), %r13d
	incq	%rbx
	incq	%rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	jne	.L21935
.L21926:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21936
.L30175:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	jne	.L32261
.L21939:
	movq	constructor_elements(%rip), %rax
	jmp	.L21915
.L32261:
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L21939
.L32260:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21930
.L32259:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21926
.L32258:
	addl	$25, %r12d
	jmp	.L21918
.L21887:
	movl	constructor_erroneous(%rip), %r14d
	testl	%r14d, %r14d
	je	.L21942
	movq	global_trees(%rip), %rbx
	movq	%rbx, -912(%rbp)
	jmp	.L21884
.L21942:
	movq	constructor_elements(%rip), %rdi
	call	nreverse
	xorl	%edx, %edx
	movq	constructor_type(%rip), %rsi
	movq	%rax, %rcx
	movl	$46, %edi
	xorl	%eax, %eax
	call	build
	movl	constructor_constant(%rip), %r12d
	movq	%rax, -912(%rbp)
	testl	%r12d, %r12d
	je	.L21884
	orb	$2, 17(%rax)
	movl	constructor_constant(%rip), %eax
	testl	%eax, %eax
	je	.L21884
	movl	constructor_simple(%rip), %r9d
	testl	%r9d, %r9d
	je	.L21884
	movq	-912(%rbp), %r8
	orb	$4, 18(%r8)
	jmp	.L21884
.L32251:
	xorl	%edi, %edi
	call	output_pending_init_elements
	jmp	.L21389
.L32250:
	movq	$0, constructor_unfilled_fields(%rip)
	jmp	.L21853
.L32249:
	movq	constructor_unfilled_fields(%rip), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21853
	testb	$2, 53(%rax)
	je	.L21853
	cmpq	$0, 72(%rax)
	jne	.L21853
.L21859:
	movq	constructor_unfilled_fields(%rip), %r12
	movq	(%r12), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21853
	testb	$2, 53(%rax)
	je	.L21853
	cmpq	$0, 72(%rax)
	jne	.L21853
	jmp	.L21859
.L32071:
	movq	constructor_unfilled_index(%rip), %rsi
	movq	global_trees+144(%rip), %rdx
	movl	$59, %edi
	call	size_binop
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L21853
.L32248:
	movq	%r14, %rdi
	call	copy_node
	movq	%rax, -896(%rbp)
	jmp	.L21851
.L32247:
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	je	.L21783
	movq	32(%rax), %rcx
	testb	$1, 17(%rcx)
	jne	.L32262
.L21826:
	movq	$0, constructor_elements(%rip)
	jmp	.L21783
.L32262:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r10
	xorl	%r12d, %r12d
	cmpq	%r10, %r8
	movq	%r8, %rbx
	movq	%r10, %r13
	jae	.L30161
.L21833:
	cmpl	$3, (%rbx)
	je	.L32263
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21829:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21833
.L30161:
	movslq	%r12d,%rdx
	movq	%r8, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L30163
.L21847:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32264
	cmpl	$2, %eax
	je	.L32265
.L21841:
	movq	8(%r12), %rsi
	movzbl	(%rsi), %edi
	leaq	1(%rsi), %rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	je	.L21837
.L21846:
	movzbl	(%rcx), %r13d
	incq	%rbx
	incq	%rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	jne	.L21846
.L21837:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21847
.L30163:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	je	.L21826
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L21826
.L32265:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21841
.L32264:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21837
.L32263:
	addl	$25, %r12d
	jmp	.L21829
.L32246:
	movl	constructor_incremental(%rip), %r9d
	testl	%r9d, %r9d
	je	.L21786
	movq	constructor_unfilled_fields(%rip), %rax
	cmpq	%rax, %r14
	je	.L21784
	testq	%rax, %rax
	jne	.L21787
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L21794
.L30155:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	je	.L32266
.L21814:
	cmpb	$18, 16(%rdi)
	je	.L32267
.L21820:
	movl	$0, constructor_incremental(%rip)
.L21786:
	movq	%r14, %rdi
	movq	-888(%rbp), %rsi
.L31640:
	call	add_pending_init
	jmp	.L21389
.L32267:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32268
	movq	global_trees+136(%rip), %rax
.L31637:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L21820
.L32268:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31637
.L32266:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21820
	testb	$2, 53(%rax)
	je	.L21820
	cmpq	$0, 72(%rax)
	jne	.L21820
.L21800:
	movq	constructor_unfilled_fields(%rip), %r8
	movq	(%r8), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21820
	testb	$2, 53(%rax)
	je	.L21820
	cmpq	$0, 72(%rax)
	jne	.L21820
	jmp	.L21800
.L21794:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21794
	movq	constructor_type(%rip), %rdi
	jmp	.L30155
.L21787:
	movq	%r14, %rdi
	call	bit_position
	movq	constructor_unfilled_fields(%rip), %rdi
	movq	%rax, %r15
	call	bit_position
	movq	%r15, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21786
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L21807
	cmpb	$18, %al
	jne	.L21786
.L21807:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L21813
.L30158:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L21814
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21820
	testb	$2, 53(%rax)
	je	.L21820
	cmpq	$0, 72(%rax)
	jne	.L21820
.L21819:
	movq	constructor_unfilled_fields(%rip), %r11
	movq	(%r11), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21820
	testb	$2, 53(%rax)
	je	.L21820
	cmpq	$0, 72(%rax)
	jne	.L21820
	jmp	.L21819
.L21813:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21813
	movq	constructor_type(%rip), %rdi
	jmp	.L30158
.L32245:
	movl	constructor_incremental(%rip), %r12d
	testl	%r12d, %r12d
	je	.L21786
	movq	constructor_unfilled_index(%rip), %rsi
	movq	%r14, %rdi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jne	.L31157
	movl	constructor_incremental(%rip), %esi
	testl	%esi, %esi
	je	.L21786
	movq	constructor_unfilled_index(%rip), %rsi
	movq	%r14, %rdi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21786
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L21766
	cmpb	$18, %al
	jne	.L21786
.L21766:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L21772
.L30152:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L21814
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21820
	testb	$2, 53(%rax)
	je	.L21820
	cmpq	$0, 72(%rax)
	jne	.L21820
.L21778:
	movq	constructor_unfilled_fields(%rip), %r13
	movq	(%r13), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21820
	testb	$2, 53(%rax)
	je	.L21820
	cmpq	$0, 72(%rax)
	jne	.L21820
	jmp	.L21778
.L21772:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21772
	movq	constructor_type(%rip), %rdi
	jmp	.L30152
.L31157:
	movq	constructor_type(%rip), %rdi
	jmp	.L21763
.L31641:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L21389
.L32244:
	call	integer_zerop
	testl	%eax, %eax
	je	.L21759
	movq	constructor_type(%rip), %rbx
	cmpb	$18, 16(%rbx)
	je	.L21389
	cmpq	$0, (%r14)
	jne	.L21389
	jmp	.L21759
.L32243:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L21757
	movl	$.LC148, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L21757
.L32242:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r11
	xorl	%r12d, %r12d
	cmpq	%r11, %r8
	movq	%r8, %rbx
	movq	%r11, %r13
	jae	.L30147
.L21739:
	cmpl	$3, (%rbx)
	je	.L32269
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21735:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21739
.L30147:
	movslq	%r12d,%rcx
	movq	%r8, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L30149
.L21753:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32270
	cmpl	$2, %eax
	je	.L32271
.L21747:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %r10d
	leaq	1(%rdx), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L21743
.L21752:
	movzbl	(%rcx), %edi
	incq	%rbx
	incq	%rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	jne	.L21752
.L21743:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21753
.L30149:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	jne	.L32272
.L21756:
	movq	global_trees(%rip), %r12
	jmp	.L21757
.L32272:
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L21756
.L32271:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21747
.L32270:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21743
.L32269:
	addl	$25, %r12d
	jmp	.L21735
.L21728:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	je	.L21731
	movq	constructor_type(%rip), %r9
	movzbl	16(%r9), %r8d
	subb	$20, %r8b
	cmpb	$1, %r8b
	ja	.L21727
	testb	$2, 53(%r14)
	je	.L21727
	cmpb	$25, 16(%r12)
	je	.L21727
.L21731:
	movl	$0, constructor_simple(%rip)
	jmp	.L21727
.L32241:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L21727
.L32240:
	movl	require_constant_value(%rip), %ebx
	testl	%ebx, %ebx
	je	.L21725
	movl	flag_isoc99(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L21725
	xorl	%edi, %edi
	testl	%edi, %edi
	je	.L21725
	movq	32(%r12), %r13
	movq	32(%r13), %rsi
	movq	104(%rsi), %r12
	jmp	.L21725
.L32239:
	movzbl	16(%r12), %ecx
	cmpb	$29, %cl
	je	.L32273
.L21639:
	movq	-264(%rbp), %rbx
	movq	128(%rdx), %rdi
	movq	128(%rbx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L31150
	movq	8(%r12), %rbx
.L21638:
	movzbl	16(%rbx), %r13d
	cmpl	$23, %r13d
	je	.L21641
	cmpl	$18, %r13d
	je	.L21641
	movzbl	16(%r12), %ecx
	cmpb	$32, %cl
	je	.L32274
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L21698
	cmpb	$34, %cl
	je	.L32275
.L21698:
	cmpb	$116, %cl
	movq	%r12, %rdx
	je	.L31156
	cmpb	$115, %cl
	je	.L32276
.L21707:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L21712
	cmpb	$49, %al
	je	.L21712
	cmpb	$50, %al
	je	.L21712
	cmpb	$101, %al
	je	.L21712
.L21711:
	cmpl	$10, %r13d
	je	.L32277
	cmpb	$39, %cl
	je	.L32278
.L21717:
	movq	%rbx, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L21720
	testb	$32, 17(%rbx)
	je	.L21721
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L21722
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%rbx), %r11d
	movzwl	60(%rdx), %ecx
	andl	$511, %r11d
	andl	$511, %ecx
	cmpl	%ecx, %r11d
	je	.L21722
.L21721:
	movq	integer_types+40(%rip), %rdi
.L31987:
	movq	%r12, %rsi
.L31988:
	call	convert
.L31633:
	movq	%rax, %rbx
.L31624:
	movq	global_trees(%rip), %r8
.L21696:
	movq	%rbx, %r12
	jmp	.L31634
.L21722:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31987
.L21720:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L21723
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L21723
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%rbx)
	je	.L32279
.L21723:
	cmpl	$5, %r13d
	je	.L32280
.L21724:
	movq	%r12, %rbx
	jmp	.L31624
.L32280:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L31625:
	movq	global_trees(%rip), %r8
	movq	%r8, %rbx
	jmp	.L21696
.L32279:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31987
.L32278:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L21717
	movq	integer_types+40(%rip), %r15
	movq	40(%rdx), %rdi
	movzwl	60(%r15), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L21717
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L21721
	testb	$32, 17(%rbx)
	jne	.L21722
	jmp	.L21721
.L32277:
	movq	integer_types+40(%rip), %r9
	movzwl	60(%rbx), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%r9), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L21716
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L21715
.L21716:
	testb	$32, 17(%rbx)
	movl	$1, %eax
	cmovne	%eax, %esi
.L21715:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31987
.L21712:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L21711
.L32276:
	movq	32(%r12), %rsi
	movq	8(%r12), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L21707
.L21710:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r12
	cmpb	$116, %cl
	jne	.L32281
.L31156:
	movq	32(%r12), %rsi
	jmp	.L21710
.L32281:
	cmpb	$115, %cl
	jne	.L21707
	movq	32(%rsi), %r8
	movq	8(%r12), %rdi
	cmpq	%rdi, 8(%r8)
	movq	%r8, %rsi
	je	.L21710
	jmp	.L21707
.L32275:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L21698
	cmpb	$51, 48(%r12)
	je	.L21698
	cmpq	$0, current_function_decl(%rip)
	je	.L21704
	movzbl	17(%r12), %ebx
	andb	$24, %bl
	cmpb	$16, %bl
	je	.L32282
.L21704:
	movq	%r12, %rsi
.L21705:
	movq	%rsi, %r12
	movq	8(%rsi), %rbx
.L31623:
	movzbl	16(%r12), %ecx
	jmp	.L21698
.L32282:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L21704
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L21704
	testb	$2, 17(%rax)
	je	.L21704
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L21705
	jmp	.L21704
.L32274:
	movq	104(%r12), %r12
	jmp	.L31623
.L21641:
	movzbl	16(%r12), %ecx
	xorl	%r15d, %r15d
	movl	%r13d, %edi
	movq	%r12, %rdx
	cmpb	$116, %cl
	je	.L31152
	cmpb	$115, %cl
	je	.L32283
.L21643:
	movzbl	%cl, %r11d 
	movzbl	tree_code_type(%r11), %eax
	cmpb	$60, %al
	je	.L21649
	cmpb	$49, %al
	je	.L21649
	cmpb	$50, %al
	je	.L21649
	cmpb	$101, %al
	je	.L21649
.L21648:
	cmpl	$23, %edi
	je	.L32284
	cmpl	$18, %edi
	jne	.L21724
	movzbl	%cl, %r10d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r10), %eax
	movq	8(%rbx), %r13
	cmpb	$114, %al
	je	.L21654
	cmpb	$100, %al
	je	.L21654
.L21653:
	movzbl	17(%rbx), %r8d
	movl	$1, %r9d
	movl	%r8d, %r10d
	movl	%r8d, %edi
	shrb	$3, %r10b
	shrb	$4, %dil
	andl	$1, %r10d
	andl	%edi, %r9d
	movzbl	16(%rbx), %edi
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rbx), %r10d
	movl	%r10d, %esi
	shrb	$5, %sil
	andl	$1, %esi
	sall	$2, %esi
	orl	%esi, %r9d
	xorl	%esi, %esi
	cmpb	$20, %dil
	je	.L32285
.L21657:
	leal	0(,%rsi,8), %ebx
	orl	%ebx, %r9d
	jne	.L21656
	testl	%edx, %edx
	jne	.L21656
	testl	%r11d, %r11d
	je	.L21655
.L21656:
	movl	%r8d, %ebx
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %bl
	movl	%r10d, %ecx
	movl	%r8d, %r9d
	andl	%ebx, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L32286
.L21658:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%r12), %ecx
	movq	%rax, %r13
.L21655:
	cmpb	$41, %cl
	je	.L32287
	cmpb	$47, %cl
	je	.L32288
	xorl	%ebx, %ebx
	testl	%r15d, %r15d
	je	.L32289
.L21692:
	movl	flag_isoc99(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L21693
	testl	%ebx, %ebx
	je	.L21724
.L21693:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r12)
	movq	%rax, %rbx
	je	.L32290
	movl	$121, %edi
	movq	%r12, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L31988
.L32290:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r12, %rdx
	call	build1
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L31625
	movq	%r12, %rdi
	call	staticp
	movzbl	17(%rbx), %r12d
	movl	%eax, %ecx
	andb	$1, %cl
	addb	%cl, %cl
	andb	$-4, %r12b
	orb	%cl, %r12b
	movb	%r12b, 17(%rbx)
	jmp	.L31624
.L32289:
	movq	%r12, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebx
	jmp	.L21692
.L32288:
	movq	40(%r12), %rbx
	movq	8(%rbx), %r13
	movzbl	16(%r13), %r15d
	movq	%r13, %rax
	cmpl	$23, %r15d
	je	.L21662
	cmpl	$18, %r15d
	je	.L21662
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L32291
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L21665
	cmpb	$34, %dl
	je	.L32292
.L21665:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L31154
	cmpb	$115, %dl
	je	.L32293
.L21674:
	movzbl	%dl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L21679
	cmpb	$49, %al
	je	.L21679
	cmpb	$50, %al
	je	.L21679
	cmpb	$101, %al
	je	.L21679
.L21678:
	cmpl	$10, %r15d
	je	.L32294
	cmpb	$39, %dl
	je	.L32295
.L21684:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L21687
	testb	$32, 17(%r13)
	je	.L21688
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L21689
	movq	integer_types+40(%rip), %r10
	movzwl	60(%r13), %esi
	movzwl	60(%r10), %r13d
	andl	$511, %esi
	andl	$511, %r13d
	cmpl	%r13d, %esi
	je	.L21689
.L21688:
	movq	integer_types+40(%rip), %rdi
.L31622:
	movq	%rbx, %rsi
	call	convert
.L21663:
	movq	8(%rax), %rsi
	movq	32(%r12), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L31633
.L21689:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31622
.L21687:
	movl	flag_traditional(%rip), %edi
	testl	%edi, %edi
	je	.L21690
	movl	flag_allow_single_precision(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L21690
	movq	global_trees+192(%rip), %r9
	cmpq	%r9, 128(%r13)
	je	.L32296
.L21690:
	cmpl	$5, %r15d
	je	.L32297
	movq	%rbx, %rax
	jmp	.L21663
.L32297:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L21663
.L32296:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31622
.L32295:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L21684
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L21684
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L21688
	testb	$32, 17(%r13)
	jne	.L21689
	jmp	.L21688
.L32294:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r15d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r15d, %r15d
	jne	.L21683
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L21682
.L21683:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L21682:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31622
.L21679:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L21678
.L32293:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L21674
.L21677:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L32298
.L31154:
	movq	32(%rbx), %rsi
	jmp	.L21677
.L32298:
	cmpb	$115, %dl
	jne	.L21674
	movq	32(%rsi), %r9
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%r9)
	movq	%r9, %rsi
	je	.L21677
	jmp	.L21674
.L32292:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L21669
	cmpb	$51, 48(%rbx)
	je	.L21669
	cmpq	$0, current_function_decl(%rip)
	je	.L21671
	movzbl	17(%rbx), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L32299
.L21671:
	movq	%rbx, %rsi
.L21672:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L21669:
	movq	%rax, %r13
	jmp	.L21665
.L32299:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L21671
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L21671
	testb	$2, 17(%rax)
	je	.L21671
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L21672
	jmp	.L21671
.L32291:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L21665
.L21662:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L21663
.L32287:
	movq	72(%r13), %rdi
	movq	32(%r12), %rsi
	jmp	.L31988
.L32286:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L21658
.L32285:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L21657
.L21654:
	movzbl	17(%r12), %edi
	movl	$1, %r11d
	movl	%edi, %edx
	shrb	$3, %dil
	shrb	$4, %dl
	andl	%edi, %r11d
	andl	$1, %edx
	jmp	.L21653
.L32284:
	movl	$121, %edi
	movq	%r12, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L31633
.L21649:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L21648
.L32283:
	movq	32(%r12), %rsi
	cmpq	%rbx, 8(%rsi)
	jne	.L21643
.L21647:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r12
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r15d
	cmpb	$116, %cl
	jne	.L32300
.L31152:
	movq	32(%r12), %rsi
	jmp	.L21647
.L32300:
	cmpb	$115, %cl
	jne	.L21643
	movq	32(%rsi), %rsi
	movq	8(%r12), %r8
	cmpq	%r8, 8(%rsi)
	je	.L21647
	jmp	.L21643
.L32273:
	movq	-264(%rbp), %rbx
	cmpb	$18, 16(%rbx)
	jne	.L21639
	movq	8(%rbx), %r9
	cmpb	$6, 16(%r9)
	jne	.L21639
	movq	global_trees(%rip), %r8
	jmp	.L21637
	.p2align 6,,7
.L21636:
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21864
	movq	-872(%rbp), %r9
	movq	(%r9), %rax
	testq	%rax, %rax
	je	.L32301
.L31638:
	movq	%rax, -872(%rbp)
	jmp	.L21389
.L32301:
	movq	-872(%rbp), %r15
	movq	32(%r15), %r8
	movq	%r8, -904(%rbp)
	jmp	.L21390
.L21864:
	movq	-872(%rbp), %r11
	movq	8(%r11), %rax
	testq	%rax, %rax
	jne	.L31638
	movq	-872(%rbp), %rcx
	movq	16(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L21871
	cmpq	%rcx, 8(%rax)
	je	.L21874
.L21871:
	testq	%rax, %rax
	movq	%rax, -872(%rbp)
	je	.L21390
	movq	32(%rax), %rdi
	call	bit_position
	movq	%r12, %rdi
	movq	%rax, %rsi
.L31989:
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21389
	movq	-872(%rbp), %rdx
	movq	32(%rdx), %rcx
	movq	%rcx, -904(%rbp)
	jmp	.L21390
.L21874:
	movq	16(%rdx), %rax
	movq	%rdx, -872(%rbp)
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L21871
	movq	-872(%rbp), %rcx
	cmpq	%rcx, 8(%rax)
	je	.L21874
	jmp	.L21871
	.p2align 6,,7
.L32238:
	movq	-872(%rbp), %r11
	movq	constructor_unfilled_index(%rip), %rsi
	movq	32(%r11), %rdi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L21393
	movq	-872(%rbp), %rbx
	movq	constructor_type(%rip), %r14
	movq	constructor_unfilled_index(%rip), %r15
	movq	40(%rbx), %r12
	movq	8(%r14), %r10
	movq	%r10, -256(%rbp)
	movq	8(%r12), %rbx
	movzbl	16(%rbx), %eax
	movq	%rbx, %rdx
	cmpb	$23, %al
	je	.L21395
	cmpb	$18, %al
	je	.L32302
.L31140:
	movq	global_trees(%rip), %r8
.L31618:
	movzbl	16(%r12), %ecx
.L21394:
	cmpb	$-86, %cl
	je	.L32303
.L21482:
	cmpq	%r8, %r12
	je	.L32304
	testb	$2, 17(%r12)
	jne	.L21485
	movl	$0, constructor_constant(%rip)
.L21484:
	movl	require_constant_value(%rip), %r14d
	testl	%r14d, %r14d
	je	.L21489
	testb	$2, 17(%r12)
	je	.L32305
.L21489:
	movl	require_constant_elements(%rip), %eax
	testl	%eax, %eax
	jne	.L32306
.L21514:
	testq	%r15, %r15
	je	.L21516
	movq	8(%r15), %rax
	cmpq	global_trees(%rip), %rax
	je	.L21389
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32307
.L21516:
	movq	-256(%rbp), %rdi
	movl	require_constant_value(%rip), %edx
	movq	%r12, %rsi
	movl	require_constant_elements(%rip), %ecx
	call	digest_init
	cmpq	global_trees(%rip), %rax
	movq	%rax, -880(%rbp)
	je	.L31641
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L32308
.L21520:
	cmpb	$20, 16(%rdi)
	je	.L32309
.L21541:
	cmpb	$21, 16(%rdi)
	je	.L32310
.L21540:
	testq	%r15, %r15
	je	.L21608
	cmpb	$25, 16(%r15)
	je	.L32311
.L21608:
	movq	constructor_elements(%rip), %rdx
	movq	-880(%rbp), %rsi
	movq	%r15, %rdi
	call	tree_cons
	movq	constructor_type(%rip), %r15
	movq	%rax, constructor_elements(%rip)
	movzbl	16(%r15), %eax
	movq	%r15, %rdx
	cmpb	$18, %al
	je	.L32071
	cmpb	$20, %al
	jne	.L21854
	movq	constructor_unfilled_fields(%rip), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21853
	testb	$2, 53(%rax)
	je	.L21853
	cmpq	$0, 72(%rax)
	jne	.L21853
.L21616:
	movq	constructor_unfilled_fields(%rip), %r12
	movq	(%r12), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21853
	testb	$2, 53(%rax)
	je	.L21853
	cmpq	$0, 72(%rax)
	jne	.L21853
	jmp	.L21616
.L32311:
	movq	%r15, %rdi
	call	copy_node
	movq	%rax, %r15
	jmp	.L21608
.L32310:
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	je	.L21540
	movq	32(%rax), %rcx
	testb	$1, 17(%rcx)
	jne	.L32312
.L21583:
	movq	$0, constructor_elements(%rip)
	jmp	.L21540
.L32312:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r10
	xorl	%r12d, %r12d
	cmpq	%r10, %r8
	movq	%r8, %rbx
	movq	%r10, %r13
	jae	.L30137
.L21590:
	cmpl	$3, (%rbx)
	je	.L32313
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21586:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21590
.L30137:
	movslq	%r12d,%rdx
	movq	%r8, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30139
.L21604:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32314
	cmpl	$2, %eax
	je	.L32315
.L21598:
	movq	8(%r12), %rsi
	movzbl	(%rsi), %edi
	leaq	1(%rsi), %rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	je	.L21594
.L21603:
	movzbl	(%rcx), %r13d
	incq	%rbx
	incq	%rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	jne	.L21603
.L21594:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21604
.L30139:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L21583
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L21583
.L32315:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21598
.L32314:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21594
.L32313:
	addl	$25, %r12d
	jmp	.L21586
.L32309:
	movl	constructor_incremental(%rip), %r9d
	testl	%r9d, %r9d
	je	.L21543
	movq	constructor_unfilled_fields(%rip), %rax
	cmpq	%rax, %r15
	je	.L21541
	testq	%rax, %rax
	jne	.L21544
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L21551
.L30131:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	je	.L32316
.L21571:
	cmpb	$18, 16(%rdi)
	je	.L32317
.L21577:
	movl	$0, constructor_incremental(%rip)
.L21543:
	movq	-880(%rbp), %rsi
	movq	%r15, %rdi
	jmp	.L31640
.L32317:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32318
	movq	global_trees+136(%rip), %rax
.L31621:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L21577
.L32318:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31621
.L32316:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21577
	testb	$2, 53(%rax)
	je	.L21577
	cmpq	$0, 72(%rax)
	jne	.L21577
.L21557:
	movq	constructor_unfilled_fields(%rip), %r8
	movq	(%r8), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21577
	testb	$2, 53(%rax)
	je	.L21577
	cmpq	$0, 72(%rax)
	jne	.L21577
	jmp	.L21557
.L21551:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21551
	movq	constructor_type(%rip), %rdi
	jmp	.L30131
.L21544:
	movq	%r15, %rdi
	call	bit_position
	movq	constructor_unfilled_fields(%rip), %rdi
	movq	%rax, %r14
	call	bit_position
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21543
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L21564
	cmpb	$18, %al
	jne	.L21543
.L21564:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L21570
.L30134:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L21571
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21577
	testb	$2, 53(%rax)
	je	.L21577
	cmpq	$0, 72(%rax)
	jne	.L21577
.L21576:
	movq	constructor_unfilled_fields(%rip), %r11
	movq	(%r11), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21577
	testb	$2, 53(%rax)
	je	.L21577
	cmpq	$0, 72(%rax)
	jne	.L21577
	jmp	.L21576
.L21570:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21570
	movq	constructor_type(%rip), %rdi
	jmp	.L30134
.L32308:
	movl	constructor_incremental(%rip), %r12d
	testl	%r12d, %r12d
	je	.L21543
	movq	constructor_unfilled_index(%rip), %rsi
	movq	%r15, %rdi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jne	.L31147
	movl	constructor_incremental(%rip), %esi
	testl	%esi, %esi
	je	.L21543
	movq	constructor_unfilled_index(%rip), %rsi
	movq	%r15, %rdi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21543
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L21523
	cmpb	$18, %al
	jne	.L21543
.L21523:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L21529
.L30128:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L21571
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21577
	testb	$2, 53(%rax)
	je	.L21577
	cmpq	$0, 72(%rax)
	jne	.L21577
.L21535:
	movq	constructor_unfilled_fields(%rip), %r13
	movq	(%r13), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21577
	testb	$2, 53(%rax)
	je	.L21577
	cmpq	$0, 72(%rax)
	jne	.L21577
	jmp	.L21535
.L21529:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21529
	movq	constructor_type(%rip), %rdi
	jmp	.L30128
.L31147:
	movq	constructor_type(%rip), %rdi
	jmp	.L21520
.L32307:
	call	integer_zerop
	testl	%eax, %eax
	je	.L21516
	movq	constructor_type(%rip), %rbx
	cmpb	$18, 16(%rbx)
	je	.L21389
	cmpq	$0, (%r15)
	jne	.L21389
	jmp	.L21516
.L32306:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L21514
	movl	$.LC148, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L21514
.L32305:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r11
	xorl	%r12d, %r12d
	cmpq	%r11, %r8
	movq	%r8, %rbx
	movq	%r11, %r13
	jae	.L30123
.L21496:
	cmpl	$3, (%rbx)
	je	.L32319
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21492:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21496
.L30123:
	movslq	%r12d,%rcx
	movq	%r8, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30125
.L21510:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32320
	cmpl	$2, %eax
	je	.L32321
.L21504:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %r10d
	leaq	1(%rdx), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L21500
.L21509:
	movzbl	(%rcx), %edi
	incq	%rbx
	incq	%rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	jne	.L21509
.L21500:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21510
.L30125:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	jne	.L32322
.L21513:
	movq	global_trees(%rip), %r12
	jmp	.L21514
.L32322:
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L21513
.L32321:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21504
.L32320:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21500
.L32319:
	addl	$25, %r12d
	jmp	.L21492
.L21485:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	je	.L21488
	movq	constructor_type(%rip), %r9
	movzbl	16(%r9), %r8d
	subb	$20, %r8b
	cmpb	$1, %r8b
	ja	.L21484
	testb	$2, 53(%r15)
	je	.L21484
	cmpb	$25, 16(%r12)
	je	.L21484
.L21488:
	movl	$0, constructor_simple(%rip)
	jmp	.L21484
.L32304:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L21484
.L32303:
	movl	require_constant_value(%rip), %ebx
	testl	%ebx, %ebx
	je	.L21482
	movl	flag_isoc99(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L21482
	xorl	%edi, %edi
	testl	%edi, %edi
	je	.L21482
	movq	32(%r12), %r13
	movq	32(%r13), %rsi
	movq	104(%rsi), %r12
	jmp	.L21482
.L32302:
	movzbl	16(%r12), %ecx
	cmpb	$29, %cl
	je	.L32323
.L21396:
	movq	128(%rdx), %rdi
	movq	-256(%rbp), %rdx
	movq	128(%rdx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L31140
	movq	8(%r12), %rbx
.L21395:
	movzbl	16(%rbx), %r13d
	cmpl	$23, %r13d
	je	.L21398
	cmpl	$18, %r13d
	je	.L21398
	movzbl	16(%r12), %ecx
	cmpb	$32, %cl
	je	.L32324
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L21455
	cmpb	$34, %cl
	je	.L32325
.L21455:
	cmpb	$116, %cl
	movq	%r12, %rdx
	je	.L31146
	cmpb	$115, %cl
	je	.L32326
.L21464:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L21469
	cmpb	$49, %al
	je	.L21469
	cmpb	$50, %al
	je	.L21469
	cmpb	$101, %al
	je	.L21469
.L21468:
	cmpl	$10, %r13d
	je	.L32327
	cmpb	$39, %cl
	je	.L32328
.L21474:
	movq	%rbx, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L21477
	testb	$32, 17(%rbx)
	je	.L21478
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L21479
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%rbx), %r11d
	movzwl	60(%rdx), %ecx
	andl	$511, %r11d
	andl	$511, %ecx
	cmpl	%ecx, %r11d
	je	.L21479
.L21478:
	movq	integer_types+40(%rip), %rdi
.L31985:
	movq	%r12, %rsi
.L31986:
	call	convert
.L31617:
	movq	%rax, %rbx
.L31608:
	movq	global_trees(%rip), %r8
.L21453:
	movq	%rbx, %r12
	jmp	.L31618
.L21479:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31985
.L21477:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L21480
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L21480
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%rbx)
	je	.L32329
.L21480:
	cmpl	$5, %r13d
	je	.L32330
.L21481:
	movq	%r12, %rbx
	jmp	.L31608
.L32330:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L31609:
	movq	global_trees(%rip), %r8
	movq	%r8, %rbx
	jmp	.L21453
.L32329:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31985
.L32328:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L21474
	movq	integer_types+40(%rip), %r14
	movq	40(%rdx), %rdi
	movzwl	60(%r14), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L21474
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L21478
	testb	$32, 17(%rbx)
	jne	.L21479
	jmp	.L21478
.L32327:
	movq	integer_types+40(%rip), %r9
	movzwl	60(%rbx), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%r9), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L21473
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L21472
.L21473:
	testb	$32, 17(%rbx)
	movl	$1, %eax
	cmovne	%eax, %esi
.L21472:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31985
.L21469:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L21468
.L32326:
	movq	32(%r12), %rsi
	movq	8(%r12), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L21464
.L21467:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r12
	cmpb	$116, %cl
	jne	.L32331
.L31146:
	movq	32(%r12), %rsi
	jmp	.L21467
.L32331:
	cmpb	$115, %cl
	jne	.L21464
	movq	32(%rsi), %r8
	movq	8(%r12), %rdi
	cmpq	%rdi, 8(%r8)
	movq	%r8, %rsi
	je	.L21467
	jmp	.L21464
.L32325:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L21455
	cmpb	$51, 48(%r12)
	je	.L21455
	cmpq	$0, current_function_decl(%rip)
	je	.L21461
	movzbl	17(%r12), %ebx
	andb	$24, %bl
	cmpb	$16, %bl
	je	.L32332
.L21461:
	movq	%r12, %rsi
.L21462:
	movq	%rsi, %r12
	movq	8(%rsi), %rbx
.L31607:
	movzbl	16(%r12), %ecx
	jmp	.L21455
.L32332:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L21461
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L21461
	testb	$2, 17(%rax)
	je	.L21461
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L21462
	jmp	.L21461
.L32324:
	movq	104(%r12), %r12
	jmp	.L31607
.L21398:
	movzbl	16(%r12), %ecx
	xorl	%r14d, %r14d
	movl	%r13d, %edi
	movq	%r12, %rdx
	cmpb	$116, %cl
	je	.L31142
	cmpb	$115, %cl
	je	.L32333
.L21400:
	movzbl	%cl, %r9d 
	movzbl	tree_code_type(%r9), %eax
	cmpb	$60, %al
	je	.L21406
	cmpb	$49, %al
	je	.L21406
	cmpb	$50, %al
	je	.L21406
	cmpb	$101, %al
	je	.L21406
.L21405:
	cmpl	$23, %edi
	je	.L32334
	cmpl	$18, %edi
	jne	.L21481
	movzbl	%cl, %edi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%rbx), %r13
	cmpb	$114, %al
	je	.L21411
	cmpb	$100, %al
	je	.L21411
.L21410:
	movzbl	17(%rbx), %r8d
	movl	$1, %r9d
	movl	%r8d, %r10d
	movl	%r8d, %edi
	shrb	$3, %r10b
	shrb	$4, %dil
	andl	$1, %r10d
	andl	%edi, %r9d
	movzbl	16(%rbx), %edi
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rbx), %r10d
	movl	%r10d, %esi
	shrb	$5, %sil
	andl	$1, %esi
	sall	$2, %esi
	orl	%esi, %r9d
	xorl	%esi, %esi
	cmpb	$20, %dil
	je	.L32335
.L21414:
	leal	0(,%rsi,8), %ebx
	orl	%ebx, %r9d
	jne	.L21413
	testl	%edx, %edx
	jne	.L21413
	testl	%r11d, %r11d
	je	.L21412
.L21413:
	movl	%r8d, %ebx
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %bl
	movl	%r10d, %ecx
	movl	%r8d, %r9d
	andl	%ebx, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L32336
.L21415:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%r12), %ecx
	movq	%rax, %r13
.L21412:
	cmpb	$41, %cl
	je	.L32337
	cmpb	$47, %cl
	je	.L32338
	xorl	%ebx, %ebx
	testl	%r14d, %r14d
	je	.L32339
.L21449:
	movl	flag_isoc99(%rip), %r14d
	testl	%r14d, %r14d
	jne	.L21450
	testl	%ebx, %ebx
	je	.L21481
.L21450:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r12)
	movq	%rax, %rbx
	je	.L32340
	movl	$121, %edi
	movq	%r12, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L31986
.L32340:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r12, %rdx
	call	build1
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L31609
	movq	%r12, %rdi
	call	staticp
	movzbl	17(%rbx), %r12d
	movl	%eax, %ecx
	andb	$1, %cl
	addb	%cl, %cl
	andb	$-4, %r12b
	orb	%cl, %r12b
	movb	%r12b, 17(%rbx)
	jmp	.L31608
.L32339:
	movq	%r12, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebx
	jmp	.L21449
.L32338:
	movq	40(%r12), %rbx
	movq	8(%rbx), %r13
	movzbl	16(%r13), %r14d
	movq	%r13, %rax
	cmpl	$23, %r14d
	je	.L21419
	cmpl	$18, %r14d
	je	.L21419
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L32341
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L21422
	cmpb	$34, %dl
	je	.L32342
.L21422:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L31144
	cmpb	$115, %dl
	je	.L32343
.L21431:
	movzbl	%dl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L21436
	cmpb	$49, %al
	je	.L21436
	cmpb	$50, %al
	je	.L21436
	cmpb	$101, %al
	je	.L21436
.L21435:
	cmpl	$10, %r14d
	je	.L32344
	cmpb	$39, %dl
	je	.L32345
.L21441:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L21444
	testb	$32, 17(%r13)
	je	.L21445
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L21446
	movq	integer_types+40(%rip), %r10
	movzwl	60(%r13), %esi
	movzwl	60(%r10), %r13d
	andl	$511, %esi
	andl	$511, %r13d
	cmpl	%r13d, %esi
	je	.L21446
.L21445:
	movq	integer_types+40(%rip), %rdi
.L31606:
	movq	%rbx, %rsi
	call	convert
.L21420:
	movq	8(%rax), %rsi
	movq	32(%r12), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L31617
.L21446:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31606
.L21444:
	movl	flag_traditional(%rip), %edi
	testl	%edi, %edi
	je	.L21447
	movl	flag_allow_single_precision(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L21447
	movq	global_trees+192(%rip), %r9
	cmpq	%r9, 128(%r13)
	je	.L32346
.L21447:
	cmpl	$5, %r14d
	je	.L32347
	movq	%rbx, %rax
	jmp	.L21420
.L32347:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L21420
.L32346:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31606
.L32345:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L21441
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L21441
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L21445
	testb	$32, 17(%r13)
	jne	.L21446
	jmp	.L21445
.L32344:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r14d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r14d, %r14d
	jne	.L21440
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L21439
.L21440:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L21439:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31606
.L21436:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L21435
.L32343:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L21431
.L21434:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L32348
.L31144:
	movq	32(%rbx), %rsi
	jmp	.L21434
.L32348:
	cmpb	$115, %dl
	jne	.L21431
	movq	32(%rsi), %r9
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%r9)
	movq	%r9, %rsi
	je	.L21434
	jmp	.L21431
.L32342:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L21426
	cmpb	$51, 48(%rbx)
	je	.L21426
	cmpq	$0, current_function_decl(%rip)
	je	.L21428
	movzbl	17(%rbx), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L32349
.L21428:
	movq	%rbx, %rsi
.L21429:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L21426:
	movq	%rax, %r13
	jmp	.L21422
.L32349:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L21428
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L21428
	testb	$2, 17(%rax)
	je	.L21428
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L21429
	jmp	.L21428
.L32341:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L21422
.L21419:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L21420
.L32337:
	movq	72(%r13), %rdi
	movq	32(%r12), %rsi
	jmp	.L31986
.L32336:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L21415
.L32335:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L21414
.L21411:
	movzbl	17(%r12), %r8d
	movl	$1, %r11d
	movl	%r8d, %edx
	shrb	$3, %r8b
	shrb	$4, %dl
	andl	%r8d, %r11d
	andl	$1, %edx
	jmp	.L21410
.L32334:
	movl	$121, %edi
	movq	%r12, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L31617
.L21406:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L21405
.L32333:
	movq	32(%r12), %rsi
	cmpq	%rbx, 8(%rsi)
	jne	.L21400
.L21404:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r12
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r14d
	cmpb	$116, %cl
	jne	.L32350
.L31142:
	movq	32(%r12), %rsi
	jmp	.L21404
.L32350:
	cmpb	$115, %cl
	jne	.L21400
	movq	32(%rsi), %rsi
	movq	8(%r12), %r13
	cmpq	%r13, 8(%rsi)
	je	.L21404
	jmp	.L21400
.L32323:
	movq	-256(%rbp), %rbx
	cmpb	$18, 16(%rbx)
	jne	.L21396
	movq	8(%rbx), %rsi
	cmpb	$6, 16(%rsi)
	jne	.L21396
	movq	global_trees(%rip), %r8
	jmp	.L21394
.L21393:
	movq	-872(%rbp), %r9
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%r9), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21621
	movq	-872(%rbp), %r8
	movq	(%r8), %rax
	testq	%rax, %rax
	jne	.L31638
	movq	-872(%rbp), %r14
	movq	32(%r14), %rax
	movq	%rax, -904(%rbp)
	jmp	.L21390
.L21621:
	movq	-872(%rbp), %r11
	movq	8(%r11), %rax
	testq	%rax, %rax
	jne	.L31638
	movq	-872(%rbp), %rsi
	movq	16(%rsi), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L21628
	cmpq	%rsi, 8(%rax)
	je	.L21631
.L21628:
	testq	%rax, %rax
	movq	%rax, -872(%rbp)
	je	.L21390
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%rax), %rsi
	jmp	.L31989
.L21631:
	movq	16(%rdx), %rax
	movq	%rdx, -872(%rbp)
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L21628
	movq	-872(%rbp), %r10
	cmpq	%r10, 8(%rax)
	je	.L21631
	jmp	.L21628
.L32237:
	movq	constructor_unfilled_fields(%rip), %rax
	testq	%rax, %rax
	je	.L21351
.L31357:
	movq	40(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32351
.L21356:
	movq	(%rax), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	jne	.L31357
	jmp	.L21351
.L32351:
	call	integer_zerop
	testl	%eax, %eax
	je	.L32352
	movq	constructor_unfilled_fields(%rip), %rax
	jmp	.L21356
.L32352:
	movq	constructor_unfilled_fields(%rip), %rax
	testq	%rax, %rax
	je	.L21351
	movl	constructor_designated(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L21351
	movq	72(%rax), %rax
	movl	$.LC159, %r12d
	testq	%rax, %rax
	je	.L21359
	movq	32(%rax), %r12
.L21359:
	movq	spelling(%rip), %rcx
	movq	spelling_base(%rip), %rdi
	movl	spelling_size(%rip), %eax
	movq	%rcx, %r15
	subq	%rdi, %r15
	movq	%r15, %rbx
	shrq	$4, %rbx
	cmpl	%eax, %ebx
	jl	.L21360
	addl	$10, %eax
	testq	%rdi, %rdi
	movl	%eax, spelling_size(%rip)
	jne	.L21361
	movslq	%eax,%rdi
	salq	$4, %rdi
	call	xmalloc
.L31605:
	movslq	%ebx,%rcx
	movq	%rax, spelling_base(%rip)
	salq	$4, %rcx
	addq	spelling_base(%rip), %rcx
	movq	%rcx, spelling(%rip)
.L21360:
	movq	%r12, 8(%rcx)
	movl	$2, (%rcx)
	movl	$.LC42, %edi
	addq	$16, %rcx
	xorl	%eax, %eax
	movl	$.LC175, %esi
	movq	%rcx, spelling(%rip)
	xorl	%r12d, %r12d
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rdi
	cmpq	%rdi, %r8
	movq	%r8, %rbx
	movq	%rdi, %r13
	jae	.L30114
.L21370:
	cmpl	$3, (%rbx)
	je	.L32353
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21366:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21370
.L30114:
	movslq	%r12d,%rdx
	movq	%r8, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30116
.L21384:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32354
	cmpl	$2, %eax
	je	.L32355
.L21378:
	movq	8(%r12), %r9
	movzbl	(%r9), %r13d
	leaq	1(%r9), %rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	je	.L21374
.L21383:
	movzbl	(%rcx), %r8d
	incq	%rbx
	incq	%rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	jne	.L21383
.L21374:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21384
.L30116:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	jne	.L32356
.L21387:
	movslq	constructor_depth(%rip),%r12
	salq	$4, %r12
	addq	spelling_base(%rip), %r12
	movq	%r12, spelling(%rip)
	jmp	.L21351
.L32356:
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L21387
.L32355:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21378
.L32354:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21374
.L32353:
	addl	$25, %r12d
	jmp	.L21366
.L21361:
	movslq	%eax,%rsi
	salq	$4, %rsi
	call	xrealloc
	jmp	.L31605
.L32236:
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L21294
	cmpq	$0, 112(%rax)
	jne	.L21294
	movq	constructor_unfilled_index(%rip), %rdi
	call	integer_zerop
	testl	%eax, %eax
	jne	.L31604
	movq	constructor_type(%rip), %rbx
	cmpq	$0, 32(%rbx)
	jne	.L28037
	cmpl	$2, constructor_depth(%rip)
	jg	.L32357
	movl	pedantic(%rip), %r12d
	testl	%r12d, %r12d
	jne	.L32358
.L21323:
	movq	constructor_fields(%rip), %r10
	cmpq	$0, (%r10)
	je	.L21294
.L31604:
	movq	$0, constructor_type(%rip)
	jmp	.L21294
.L32358:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC174, %esi
	call	pedwarn
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r13
	jae	.L30109
.L21331:
	cmpl	$3, (%rbx)
	je	.L32359
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21327:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21331
.L30109:
	movslq	%r12d,%rcx
	movq	%r8, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30111
.L21345:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32360
	cmpl	$2, %eax
	je	.L32361
.L21339:
	movq	8(%r12), %r8
	movzbl	(%r8), %r9d
	leaq	1(%r8), %rcx
	testb	%r9b, %r9b
	movb	%r9b, (%rbx)
	je	.L21335
.L21344:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L21344
.L21335:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21345
.L30111:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L21323
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L21323
.L32361:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21339
.L32360:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21335
.L32359:
	addl	$25, %r12d
	jmp	.L21327
.L32357:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC173, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r15
	xorl	%r12d, %r12d
	cmpq	%r15, %r8
	movq	%r8, %rbx
	movq	%r15, %r13
	jae	.L30104
.L21305:
	cmpl	$3, (%rbx)
	je	.L32362
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21301:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21305
.L30104:
	movslq	%r12d,%rsi
	movq	%r8, %r12
	addq	$16, %rsi
	andq	$-16, %rsi
	subq	%rsi, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30106
.L21319:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32363
	cmpl	$2, %eax
	je	.L32364
.L21313:
	movq	8(%r12), %rdi
	movzbl	(%rdi), %r13d
	leaq	1(%rdi), %rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	je	.L21309
.L21318:
	movzbl	(%rcx), %edx
	incq	%rbx
	incq	%rcx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	jne	.L21318
.L21309:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21319
.L30106:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L21323
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L21323
.L32364:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21313
.L32363:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21309
.L32362:
	addl	$25, %r12d
	jmp	.L21301
.L28037:
	movl	$.LC68, %edi
	movl	$5520, %esi
	movl	$.LC172, %edx
	jmp	.L31944
.L32091:
	movl	$.LC68, %edi
	movl	$6838, %esi
.L32044:
	movl	$.LC171, %edx
	jmp	.L31944
.L32235:
	movq	-928(%rbp), %rbx
	movq	global_trees+144(%rip), %rdx
	movl	$59, %edi
	movq	32(%rbx), %rsi
	call	size_binop
	movq	-928(%rbp), %r14
	movq	%rax, %rdi
	movq	40(%r14), %rsi
	movq	%rax, 32(%r14)
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L21958
	movq	-928(%rbp), %rsi
	movl	$1, %eax
	cmpq	$0, 8(%rsi)
	cmovne	-916(%rbp), %eax
	movl	%eax, -916(%rbp)
.L21958:
	movq	-928(%rbp), %r8
	movl	-916(%rbp), %r12d
	movq	32(%r8), %rax
	movq	48(%r8), %r9
	testl	%r12d, %r12d
	movq	%rax, constructor_index(%rip)
	movq	%r9, constructor_fields(%rip)
	je	.L21955
	cmpq	$0, 40(%r8)
	je	.L21955
	cmpq	24(%r8), %rax
	je	.L32365
.L21955:
	movq	-928(%rbp), %r11
	movq	(%r11), %rax
	testq	%rax, %rax
	movq	%rax, -928(%rbp)
	je	.L21953
	movl	$2, %edi
	call	push_init_level
	movq	-928(%rbp), %rbx
	movq	constructor_stack(%rip), %r15
	movq	40(%rbx), %rsi
	movq	%r15, 16(%rbx)
	testq	%rsi, %rsi
	je	.L21958
	movq	32(%rbx), %rdi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L21958
	movq	24(%rbx), %rcx
	movq	%rcx, 32(%rbx)
	jmp	.L21958
.L21953:
	movl	-916(%rbp), %r10d
	testl	%r10d, %r10d
	jne	.L21960
	movq	-216(%rbp), %rdi
	movq	%rdi, constructor_range_stack(%rip)
	jmp	.L21960
.L32365:
	movl	$0, -916(%rbp)
	movq	$0, 8(%r8)
	jmp	.L21955
.L21280:
	xorl	%edi, %edi
	jmp	.L21281
.L32234:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC176, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r13
	jae	.L30092
.L21228:
	cmpl	$3, (%rbx)
	je	.L32366
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21224:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21228
.L30092:
	movslq	%r12d,%r15
	movq	%r8, %r12
	addq	$16, %r15
	andq	$-16, %r15
	subq	%r15, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30094
.L21242:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32367
	cmpl	$2, %eax
	je	.L32368
.L21236:
	movq	8(%r12), %r13
	movzbl	(%r13), %esi
	leaq	1(%r13), %rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	je	.L21232
.L21241:
	movzbl	(%rcx), %edi
	incq	%rbx
	incq	%rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	jne	.L21241
.L21232:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21242
.L30094:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L21221
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L21221
.L32368:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21236
.L32367:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21232
.L32366:
	addl	$25, %r12d
	jmp	.L21224
.L21220:
	cmpq	$0, (%rax)
	jne	.L32369
.L21247:
	movq	32(%rax), %rax
.L31603:
	movq	%rax, -864(%rbp)
	jmp	.L21216
.L32369:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC177, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rdx
	xorl	%r12d, %r12d
	cmpq	%rdx, %r8
	movq	%r8, %rbx
	movq	%rdx, %r13
	jae	.L30097
.L21254:
	cmpl	$3, (%rbx)
	je	.L32370
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21250:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21254
.L30097:
	movslq	%r12d,%r9
	movq	%r8, %r12
	addq	$16, %r9
	andq	$-16, %r9
	subq	%r9, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30099
.L21268:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32371
	cmpl	$2, %eax
	je	.L32372
.L21262:
	movq	8(%r12), %r11
	movzbl	(%r11), %r8d
	leaq	1(%r11), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L21258
.L21267:
	movzbl	(%rcx), %r10d
	incq	%rbx
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	jne	.L21267
.L21258:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21268
.L30099:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	jne	.L32373
.L21271:
	movq	constructor_elements(%rip), %rax
	jmp	.L21247
.L32373:
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L21271
.L32372:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21262
.L32371:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21258
.L32370:
	addl	$25, %r12d
	jmp	.L21250
.L21219:
	movl	constructor_erroneous(%rip), %r14d
	testl	%r14d, %r14d
	je	.L21274
	movq	global_trees(%rip), %rbx
	movq	%rbx, -864(%rbp)
	jmp	.L21216
.L21274:
	movq	constructor_elements(%rip), %rdi
	call	nreverse
	xorl	%edx, %edx
	movq	constructor_type(%rip), %rsi
	movq	%rax, %rcx
	movl	$46, %edi
	xorl	%eax, %eax
	call	build
	movl	constructor_constant(%rip), %r15d
	movq	%rax, -864(%rbp)
	testl	%r15d, %r15d
	je	.L21216
	orb	$2, 17(%rax)
	movl	constructor_constant(%rip), %r12d
	testl	%r12d, %r12d
	je	.L21216
	movl	constructor_simple(%rip), %eax
	testl	%eax, %eax
	je	.L21216
	movq	-864(%rbp), %rsi
	orb	$4, 18(%rsi)
	jmp	.L21216
	.p2align 6,,7
.L32232:
	xorl	%edi, %edi
	call	output_pending_init_elements
	jmp	.L20721
.L32231:
	movq	$0, constructor_unfilled_fields(%rip)
	jmp	.L21185
	.p2align 6,,7
.L32230:
	movq	constructor_unfilled_fields(%rip), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21185
	testb	$2, 53(%rax)
	je	.L21185
	cmpq	$0, 72(%rax)
	jne	.L21185
.L21191:
	movq	constructor_unfilled_fields(%rip), %r12
	movq	(%r12), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21185
	testb	$2, 53(%rax)
	je	.L21185
	cmpq	$0, 72(%rax)
	jne	.L21185
	jmp	.L21191
.L32067:
	movq	constructor_unfilled_index(%rip), %rsi
	movq	global_trees+144(%rip), %rdx
	movl	$59, %edi
	call	size_binop
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L21185
.L32229:
	movq	%r14, %rdi
	call	copy_node
	movq	%rax, -848(%rbp)
	jmp	.L21183
	.p2align 6,,7
.L32228:
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	je	.L21115
	movq	32(%rax), %rdi
	testb	$1, 17(%rdi)
	jne	.L32374
.L21158:
	movq	$0, constructor_elements(%rip)
	jmp	.L21115
.L32374:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rdx
	xorl	%r12d, %r12d
	cmpq	%rdx, %r8
	movq	%r8, %rbx
	movq	%rdx, %r13
	jae	.L30085
.L21165:
	cmpl	$3, (%rbx)
	je	.L32375
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21161:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21165
.L30085:
	movslq	%r12d,%r9
	movq	%r8, %r12
	addq	$16, %r9
	andq	$-16, %r9
	subq	%r9, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L30087
.L21179:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32376
	cmpl	$2, %eax
	je	.L32377
.L21173:
	movq	8(%r12), %r11
	movzbl	(%r11), %r8d
	leaq	1(%r11), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L21169
.L21178:
	movzbl	(%rcx), %r10d
	incq	%rbx
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	jne	.L21178
.L21169:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21179
.L30087:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	je	.L21158
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L21158
.L32377:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21173
.L32376:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21169
.L32375:
	addl	$25, %r12d
	jmp	.L21161
	.p2align 6,,7
.L32227:
	movl	constructor_incremental(%rip), %esi
	testl	%esi, %esi
	je	.L21118
	movq	constructor_unfilled_fields(%rip), %rax
	cmpq	%rax, %r14
	je	.L21116
	testq	%rax, %rax
	jne	.L21119
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L21126
.L30079:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	je	.L32378
.L21146:
	cmpb	$18, 16(%rdi)
	je	.L32379
.L21152:
	movl	$0, constructor_incremental(%rip)
.L21118:
	movq	%r14, %rdi
	movq	-840(%rbp), %rsi
.L31600:
	call	add_pending_init
	jmp	.L20721
.L32379:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32380
	movq	global_trees+136(%rip), %rax
.L31597:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L21152
.L32380:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31597
.L32378:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21152
	testb	$2, 53(%rax)
	je	.L21152
	cmpq	$0, 72(%rax)
	jne	.L21152
.L21132:
	movq	constructor_unfilled_fields(%rip), %r15
	movq	(%r15), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21152
	testb	$2, 53(%rax)
	je	.L21152
	cmpq	$0, 72(%rax)
	jne	.L21152
	jmp	.L21132
	.p2align 6,,7
.L21126:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21126
	movq	constructor_type(%rip), %rdi
	jmp	.L30079
.L21119:
	movq	%r14, %rdi
	call	bit_position
	movq	constructor_unfilled_fields(%rip), %rdi
	movq	%rax, %r13
	call	bit_position
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21118
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L21139
	cmpb	$18, %al
	jne	.L21118
.L21139:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L21145
.L30082:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L21146
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21152
	testb	$2, 53(%rax)
	je	.L21152
	cmpq	$0, 72(%rax)
	jne	.L21152
.L21151:
	movq	constructor_unfilled_fields(%rip), %rcx
	movq	(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21152
	testb	$2, 53(%rax)
	je	.L21152
	cmpq	$0, 72(%rax)
	jne	.L21152
	jmp	.L21151
.L21145:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21145
	movq	constructor_type(%rip), %rdi
	jmp	.L30082
	.p2align 6,,7
.L32226:
	movl	constructor_incremental(%rip), %eax
	testl	%eax, %eax
	je	.L21118
	movq	constructor_unfilled_index(%rip), %rsi
	movq	%r14, %rdi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jne	.L31136
	movl	constructor_incremental(%rip), %eax
	testl	%eax, %eax
	je	.L21118
	movq	constructor_unfilled_index(%rip), %rsi
	movq	%r14, %rdi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21118
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L21098
	cmpb	$18, %al
	jne	.L21118
.L21098:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L21104
.L30076:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L21146
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21152
	testb	$2, 53(%rax)
	je	.L21152
	cmpq	$0, 72(%rax)
	jne	.L21152
.L21110:
	movq	constructor_unfilled_fields(%rip), %r12
	movq	(%r12), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21152
	testb	$2, 53(%rax)
	je	.L21152
	cmpq	$0, 72(%rax)
	jne	.L21152
	jmp	.L21110
.L21104:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L21104
	movq	constructor_type(%rip), %rdi
	jmp	.L30076
.L31136:
	movq	constructor_type(%rip), %rdi
	jmp	.L21095
	.p2align 6,,7
.L31601:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L20721
.L32225:
	call	integer_zerop
	testl	%eax, %eax
	je	.L21091
	movq	constructor_type(%rip), %rbx
	cmpb	$18, 16(%rbx)
	je	.L20721
	cmpq	$0, (%r14)
	jne	.L20721
	jmp	.L21091
	.p2align 6,,7
.L32224:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L21089
	movl	$.LC148, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L21089
.L32223:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r13
	jae	.L30071
.L21071:
	cmpl	$3, (%rbx)
	je	.L32381
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L21067:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L21071
.L30071:
	movslq	%r12d,%r9
	movq	%r8, %r12
	addq	$16, %r9
	andq	$-16, %r9
	subq	%r9, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L30073
.L21085:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32382
	cmpl	$2, %eax
	je	.L32383
.L21079:
	movq	8(%r12), %r11
	movzbl	(%r11), %r8d
	leaq	1(%r11), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L21075
.L21084:
	movzbl	(%rcx), %r10d
	incq	%rbx
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	jne	.L21084
.L21075:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L21085
.L30073:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	jne	.L32384
.L21088:
	movq	global_trees(%rip), %r12
	jmp	.L21089
.L32384:
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L21088
	.p2align 6,,7
.L32383:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L21079
.L32382:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L21075
.L32381:
	addl	$25, %r12d
	jmp	.L21067
.L21060:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	je	.L21063
	movq	constructor_type(%rip), %rdx
	movzbl	16(%rdx), %edi
	subb	$20, %dil
	cmpb	$1, %dil
	ja	.L21059
	testb	$2, 53(%r14)
	je	.L21059
	cmpb	$25, 16(%r12)
	je	.L21059
.L21063:
	movl	$0, constructor_simple(%rip)
	jmp	.L21059
.L32222:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L21059
.L32221:
	movl	require_constant_value(%rip), %eax
	testl	%eax, %eax
	je	.L21057
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L21057
	xorl	%esi, %esi
	testl	%esi, %esi
	je	.L21057
	movq	32(%r12), %r13
	movq	32(%r13), %rcx
	movq	104(%rcx), %r12
	jmp	.L21057
	.p2align 6,,7
.L32220:
	movzbl	16(%r12), %ecx
	cmpb	$29, %cl
	je	.L32385
.L20971:
	movq	-240(%rbp), %rbx
	movq	128(%rdx), %rdi
	movq	128(%rbx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L31129
	movq	8(%r12), %rbx
.L20970:
	movzbl	16(%rbx), %r13d
	cmpl	$23, %r13d
	je	.L20973
	cmpl	$18, %r13d
	je	.L20973
	movzbl	16(%r12), %ecx
	cmpb	$32, %cl
	je	.L32386
	movl	optimize(%rip), %r9d
	testl	%r9d, %r9d
	je	.L21030
	cmpb	$34, %cl
	je	.L32387
.L21030:
	cmpb	$116, %cl
	movq	%r12, %rdx
	je	.L31135
	cmpb	$115, %cl
	je	.L32388
.L21039:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L21044
	cmpb	$49, %al
	je	.L21044
	cmpb	$50, %al
	je	.L21044
	cmpb	$101, %al
	je	.L21044
.L21043:
	cmpl	$10, %r13d
	je	.L32389
	cmpb	$39, %cl
	je	.L32390
.L21049:
	movq	%rbx, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L21052
	testb	$32, 17(%rbx)
	je	.L21053
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L21054
	movzwl	60(%rbx), %r8d
	movq	integer_types+40(%rip), %rbx
	movzwl	60(%rbx), %r9d
	andl	$511, %r8d
	andl	$511, %r9d
	cmpl	%r9d, %r8d
	je	.L21054
.L21053:
	movq	integer_types+40(%rip), %rdi
.L31982:
	movq	%r12, %rsi
.L31983:
	call	convert
.L31593:
	movq	%rax, %rbx
.L31584:
	movq	global_trees(%rip), %r8
.L21028:
	movq	%rbx, %r12
	jmp	.L31594
.L21054:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31982
.L21052:
	movl	flag_traditional(%rip), %r15d
	testl	%r15d, %r15d
	je	.L21055
	movl	flag_allow_single_precision(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L21055
	movq	global_trees+192(%rip), %r10
	cmpq	%r10, 128(%rbx)
	je	.L32391
.L21055:
	cmpl	$5, %r13d
	je	.L32392
.L21056:
	movq	%r12, %rbx
	jmp	.L31584
.L32392:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L31585:
	movq	global_trees(%rip), %r8
	movq	%r8, %rbx
	jmp	.L21028
.L32391:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31982
.L32390:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L21049
	movq	integer_types+40(%rip), %rdi
	movzwl	60(%rdi), %esi
	movq	40(%rdx), %rdi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L21049
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	je	.L21053
	testb	$32, 17(%rbx)
	jne	.L21054
	jmp	.L21053
.L32389:
	movq	integer_types+40(%rip), %r13
	movzwl	60(%rbx), %edx
	movl	flag_traditional(%rip), %ecx
	movzwl	60(%r13), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%ecx, %ecx
	jne	.L21048
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L21047
.L21048:
	testb	$32, 17(%rbx)
	movl	$1, %eax
	cmovne	%eax, %esi
.L21047:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31982
	.p2align 6,,7
.L21044:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L21043
.L32388:
	movq	32(%r12), %rsi
	movq	8(%r12), %r15
	cmpq	%r15, 8(%rsi)
	jne	.L21039
.L21042:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r12
	cmpb	$116, %cl
	jne	.L32393
.L31135:
	movq	32(%r12), %rsi
	jmp	.L21042
.L32393:
	cmpb	$115, %cl
	jne	.L21039
	movq	32(%rsi), %r10
	movq	8(%r12), %r11
	cmpq	%r11, 8(%r10)
	movq	%r10, %rsi
	je	.L21042
	jmp	.L21039
.L32387:
	movl	pedantic(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L21030
	cmpb	$51, 48(%r12)
	je	.L21030
	cmpq	$0, current_function_decl(%rip)
	je	.L21036
	movzbl	17(%r12), %ebx
	andb	$24, %bl
	cmpb	$16, %bl
	je	.L32394
.L21036:
	movq	%r12, %rsi
.L21037:
	movq	%rsi, %r12
	movq	8(%rsi), %rbx
.L31583:
	movzbl	16(%r12), %ecx
	jmp	.L21030
.L32394:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L21036
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L21036
	testb	$2, 17(%rax)
	je	.L21036
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L21037
	jmp	.L21036
.L32386:
	movq	104(%r12), %r12
	jmp	.L31583
	.p2align 6,,7
.L20973:
	movzbl	16(%r12), %ecx
	xorl	%r15d, %r15d
	movl	%r13d, %edi
	movq	%r12, %rdx
	cmpb	$116, %cl
	je	.L31131
	cmpb	$115, %cl
	je	.L32395
.L20975:
	movzbl	%cl, %r11d 
	movzbl	tree_code_type(%r11), %eax
	cmpb	$60, %al
	je	.L20981
	cmpb	$49, %al
	je	.L20981
	cmpb	$50, %al
	je	.L20981
	cmpb	$101, %al
	je	.L20981
.L20980:
	cmpl	$23, %edi
	je	.L32396
	cmpl	$18, %edi
	jne	.L21056
	movzbl	%cl, %r10d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r10), %eax
	movq	8(%rbx), %r13
	cmpb	$114, %al
	je	.L20986
	cmpb	$100, %al
	je	.L20986
.L20985:
	movzbl	17(%rbx), %r8d
	movl	$1, %r9d
	movl	%r8d, %r10d
	movl	%r8d, %edi
	shrb	$3, %r10b
	shrb	$4, %dil
	andl	$1, %r10d
	andl	%edi, %r9d
	movzbl	16(%rbx), %edi
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rbx), %r10d
	movl	%r10d, %esi
	shrb	$5, %sil
	andl	$1, %esi
	sall	$2, %esi
	orl	%esi, %r9d
	xorl	%esi, %esi
	cmpb	$20, %dil
	je	.L32397
.L20989:
	leal	0(,%rsi,8), %ebx
	orl	%ebx, %r9d
	jne	.L20988
	testl	%edx, %edx
	jne	.L20988
	testl	%r11d, %r11d
	je	.L20987
.L20988:
	movl	%r8d, %ebx
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %bl
	movl	%r10d, %ecx
	movl	%r8d, %r9d
	andl	%ebx, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L32398
.L20990:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%r12), %ecx
	movq	%rax, %r13
.L20987:
	cmpb	$41, %cl
	je	.L32399
	cmpb	$47, %cl
	je	.L32400
	xorl	%ebx, %ebx
	testl	%r15d, %r15d
	je	.L32401
.L21024:
	movl	flag_isoc99(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L21025
	testl	%ebx, %ebx
	je	.L21056
.L21025:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r12)
	movq	%rax, %rbx
	je	.L32402
	movl	$121, %edi
	movq	%r12, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L31983
.L32402:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r12, %rdx
	call	build1
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L31585
	movq	%r12, %rdi
	call	staticp
	movzbl	17(%rbx), %r12d
	movl	%eax, %edi
	andb	$1, %dil
	addb	%dil, %dil
	andb	$-4, %r12b
	orb	%dil, %r12b
	movb	%r12b, 17(%rbx)
	jmp	.L31584
.L32401:
	movq	%r12, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebx
	jmp	.L21024
.L32400:
	movq	40(%r12), %rbx
	movq	8(%rbx), %r13
	movzbl	16(%r13), %r15d
	movq	%r13, %rax
	cmpl	$23, %r15d
	je	.L20994
	cmpl	$18, %r15d
	je	.L20994
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L32403
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L20997
	cmpb	$34, %dl
	je	.L32404
.L20997:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L31133
	cmpb	$115, %dl
	je	.L32405
.L21006:
	movzbl	%dl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L21011
	cmpb	$49, %al
	je	.L21011
	cmpb	$50, %al
	je	.L21011
	cmpb	$101, %al
	je	.L21011
.L21010:
	cmpl	$10, %r15d
	je	.L32406
	cmpb	$39, %dl
	je	.L32407
.L21016:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L21019
	testb	$32, 17(%r13)
	je	.L21020
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L21021
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%r13), %esi
	movzwl	60(%rdx), %r13d
	andl	$511, %esi
	andl	$511, %r13d
	cmpl	%r13d, %esi
	je	.L21021
.L21020:
	movq	integer_types+40(%rip), %rdi
.L31582:
	movq	%rbx, %rsi
	call	convert
.L20995:
	movq	8(%rax), %rsi
	movq	32(%r12), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L31593
.L21021:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31582
.L21019:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L21022
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L21022
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%r13)
	je	.L32408
.L21022:
	cmpl	$5, %r15d
	je	.L32409
	movq	%rbx, %rax
	jmp	.L20995
.L32409:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L20995
.L32408:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31582
.L32407:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L21016
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L21016
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L21020
	testb	$32, 17(%r13)
	jne	.L21021
	jmp	.L21020
.L32406:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r15d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r15d, %r15d
	jne	.L21015
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L21014
.L21015:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L21014:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31582
.L21011:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L21010
.L32405:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L21006
.L21009:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L32410
.L31133:
	movq	32(%rbx), %rsi
	jmp	.L21009
.L32410:
	cmpb	$115, %dl
	jne	.L21006
	movq	32(%rsi), %r9
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%r9)
	movq	%r9, %rsi
	je	.L21009
	jmp	.L21006
.L32404:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L21001
	cmpb	$51, 48(%rbx)
	je	.L21001
	cmpq	$0, current_function_decl(%rip)
	je	.L21003
	movzbl	17(%rbx), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L32411
.L21003:
	movq	%rbx, %rsi
.L21004:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L21001:
	movq	%rax, %r13
	jmp	.L20997
.L32411:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L21003
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L21003
	testb	$2, 17(%rax)
	je	.L21003
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L21004
	jmp	.L21003
.L32403:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L20997
.L20994:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L20995
.L32399:
	movq	72(%r13), %rdi
	movq	32(%r12), %rsi
	jmp	.L31983
.L32398:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L20990
.L32397:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L20989
.L20986:
	movzbl	17(%r12), %edi
	movl	$1, %r11d
	movl	%edi, %edx
	shrb	$3, %dil
	shrb	$4, %dl
	andl	%edi, %r11d
	andl	$1, %edx
	jmp	.L20985
.L32396:
	movl	$121, %edi
	movq	%r12, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L31593
	.p2align 6,,7
.L20981:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L20980
.L32395:
	movq	32(%r12), %rsi
	cmpq	%rbx, 8(%rsi)
	jne	.L20975
.L20979:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r12
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r15d
	cmpb	$116, %cl
	jne	.L32412
.L31131:
	movq	32(%r12), %rsi
	jmp	.L20979
.L32412:
	cmpb	$115, %cl
	jne	.L20975
	movq	32(%rsi), %rsi
	movq	8(%r12), %r8
	cmpq	%r8, 8(%rsi)
	je	.L20979
	jmp	.L20975
.L32385:
	movq	-240(%rbp), %rbx
	cmpb	$18, 16(%rbx)
	jne	.L20971
	movq	8(%rbx), %r9
	cmpb	$6, 16(%r9)
	jne	.L20971
	movq	global_trees(%rip), %r8
	jmp	.L20969
	.p2align 6,,7
.L20968:
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L21196
	movq	-824(%rbp), %r15
	movq	(%r15), %rax
	testq	%rax, %rax
	je	.L32413
.L31598:
	movq	%rax, -824(%rbp)
	jmp	.L20721
.L32413:
	movq	-824(%rbp), %r13
	movq	32(%r13), %rsi
	movq	%rsi, -856(%rbp)
	jmp	.L20722
	.p2align 6,,7
.L21196:
	movq	-824(%rbp), %rcx
	movq	8(%rcx), %rax
	testq	%rax, %rax
	jne	.L31598
	movq	-824(%rbp), %rcx
	movq	16(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L21203
	cmpq	%rcx, 8(%rax)
	je	.L21206
.L21203:
	testq	%rax, %rax
	movq	%rax, -824(%rbp)
	je	.L20722
	movq	32(%rax), %rdi
	call	bit_position
	movq	%r12, %rdi
	movq	%rax, %rsi
.L31984:
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20721
	movq	-824(%rbp), %rdx
	movq	32(%rdx), %rcx
	movq	%rcx, -856(%rbp)
	jmp	.L20722
	.p2align 6,,7
.L21206:
	movq	16(%rdx), %rax
	movq	%rdx, -824(%rbp)
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L21203
	movq	-824(%rbp), %rdi
	cmpq	%rdi, 8(%rax)
	je	.L21206
	jmp	.L21203
	.p2align 6,,7
.L32219:
	movq	-824(%rbp), %r11
	movq	constructor_unfilled_index(%rip), %rsi
	movq	32(%r11), %rdi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L20725
	movq	-824(%rbp), %rax
	movq	constructor_type(%rip), %r9
	movq	constructor_unfilled_index(%rip), %r15
	movq	40(%rax), %r12
	movq	8(%r9), %rdi
	movq	%rdi, -232(%rbp)
	movq	8(%r12), %rbx
	movzbl	16(%rbx), %eax
	movq	%rbx, %rdx
	cmpb	$23, %al
	je	.L20727
	cmpb	$18, %al
	je	.L32414
.L31119:
	movq	global_trees(%rip), %r8
.L31578:
	movzbl	16(%r12), %ecx
.L20726:
	cmpb	$-86, %cl
	je	.L32415
.L20814:
	cmpq	%r8, %r12
	je	.L32416
	testb	$2, 17(%r12)
	jne	.L20817
	movl	$0, constructor_constant(%rip)
.L20816:
	movl	require_constant_value(%rip), %r14d
	testl	%r14d, %r14d
	je	.L20821
	testb	$2, 17(%r12)
	je	.L32417
.L20821:
	movl	require_constant_elements(%rip), %eax
	testl	%eax, %eax
	jne	.L32418
.L20846:
	testq	%r15, %r15
	je	.L20848
	movq	8(%r15), %rax
	cmpq	global_trees(%rip), %rax
	je	.L20721
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32419
.L20848:
	movq	-232(%rbp), %rdi
	movl	require_constant_value(%rip), %edx
	movq	%r12, %rsi
	movl	require_constant_elements(%rip), %ecx
	call	digest_init
	cmpq	global_trees(%rip), %rax
	movq	%rax, -832(%rbp)
	je	.L31601
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L32420
.L20852:
	cmpb	$20, 16(%rdi)
	je	.L32421
.L20873:
	cmpb	$21, 16(%rdi)
	je	.L32422
.L20872:
	testq	%r15, %r15
	je	.L20940
	cmpb	$25, 16(%r15)
	je	.L32423
.L20940:
	movq	constructor_elements(%rip), %rdx
	movq	-832(%rbp), %rsi
	movq	%r15, %rdi
	call	tree_cons
	movq	constructor_type(%rip), %r15
	movq	%rax, constructor_elements(%rip)
	movzbl	16(%r15), %eax
	movq	%r15, %rdx
	cmpb	$18, %al
	je	.L32067
	cmpb	$20, %al
	jne	.L21186
	movq	constructor_unfilled_fields(%rip), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21185
	testb	$2, 53(%rax)
	je	.L21185
	cmpq	$0, 72(%rax)
	jne	.L21185
.L20948:
	movq	constructor_unfilled_fields(%rip), %r12
	movq	(%r12), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L21185
	testb	$2, 53(%rax)
	je	.L21185
	cmpq	$0, 72(%rax)
	jne	.L21185
	jmp	.L20948
.L32423:
	movq	%r15, %rdi
	call	copy_node
	movq	%rax, %r15
	jmp	.L20940
.L32422:
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	je	.L20872
	movq	32(%rax), %rcx
	testb	$1, 17(%rcx)
	jne	.L32424
.L20915:
	movq	$0, constructor_elements(%rip)
	jmp	.L20872
.L32424:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r10
	xorl	%r12d, %r12d
	cmpq	%r10, %r8
	movq	%r8, %rbx
	movq	%r10, %r13
	jae	.L30061
.L20922:
	cmpl	$3, (%rbx)
	je	.L32425
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L20918:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L20922
.L30061:
	movslq	%r12d,%rdx
	movq	%r8, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30063
.L20936:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32426
	cmpl	$2, %eax
	je	.L32427
.L20930:
	movq	8(%r12), %rsi
	movzbl	(%rsi), %edi
	leaq	1(%rsi), %rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	je	.L20926
.L20935:
	movzbl	(%rcx), %r13d
	incq	%rbx
	incq	%rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	jne	.L20935
.L20926:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L20936
.L30063:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L20915
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L20915
.L32427:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L20930
.L32426:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L20926
.L32425:
	addl	$25, %r12d
	jmp	.L20918
.L32421:
	movl	constructor_incremental(%rip), %r9d
	testl	%r9d, %r9d
	je	.L20875
	movq	constructor_unfilled_fields(%rip), %rax
	cmpq	%rax, %r15
	je	.L20873
	testq	%rax, %rax
	jne	.L20876
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L20883
.L30055:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	je	.L32428
.L20903:
	cmpb	$18, 16(%rdi)
	je	.L32429
.L20909:
	movl	$0, constructor_incremental(%rip)
.L20875:
	movq	-832(%rbp), %rsi
	movq	%r15, %rdi
	jmp	.L31600
.L32429:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32430
	movq	global_trees+136(%rip), %rax
.L31581:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L20909
.L32430:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31581
.L32428:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20909
	testb	$2, 53(%rax)
	je	.L20909
	cmpq	$0, 72(%rax)
	jne	.L20909
.L20889:
	movq	constructor_unfilled_fields(%rip), %r8
	movq	(%r8), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20909
	testb	$2, 53(%rax)
	je	.L20909
	cmpq	$0, 72(%rax)
	jne	.L20909
	jmp	.L20889
.L20883:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L20883
	movq	constructor_type(%rip), %rdi
	jmp	.L30055
.L20876:
	movq	%r15, %rdi
	call	bit_position
	movq	constructor_unfilled_fields(%rip), %rdi
	movq	%rax, %r14
	call	bit_position
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20875
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L20896
	cmpb	$18, %al
	jne	.L20875
.L20896:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L20902
.L30058:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L20903
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20909
	testb	$2, 53(%rax)
	je	.L20909
	cmpq	$0, 72(%rax)
	jne	.L20909
.L20908:
	movq	constructor_unfilled_fields(%rip), %r11
	movq	(%r11), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20909
	testb	$2, 53(%rax)
	je	.L20909
	cmpq	$0, 72(%rax)
	jne	.L20909
	jmp	.L20908
.L20902:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L20902
	movq	constructor_type(%rip), %rdi
	jmp	.L30058
.L32420:
	movl	constructor_incremental(%rip), %r12d
	testl	%r12d, %r12d
	je	.L20875
	movq	constructor_unfilled_index(%rip), %rsi
	movq	%r15, %rdi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jne	.L31126
	movl	constructor_incremental(%rip), %esi
	testl	%esi, %esi
	je	.L20875
	movq	constructor_unfilled_index(%rip), %rsi
	movq	%r15, %rdi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20875
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L20855
	cmpb	$18, %al
	jne	.L20875
.L20855:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L20861
.L30052:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L20903
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20909
	testb	$2, 53(%rax)
	je	.L20909
	cmpq	$0, 72(%rax)
	jne	.L20909
.L20867:
	movq	constructor_unfilled_fields(%rip), %r13
	movq	(%r13), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20909
	testb	$2, 53(%rax)
	je	.L20909
	cmpq	$0, 72(%rax)
	jne	.L20909
	jmp	.L20867
.L20861:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L20861
	movq	constructor_type(%rip), %rdi
	jmp	.L30052
.L31126:
	movq	constructor_type(%rip), %rdi
	jmp	.L20852
.L32419:
	call	integer_zerop
	testl	%eax, %eax
	je	.L20848
	movq	constructor_type(%rip), %rbx
	cmpb	$18, 16(%rbx)
	je	.L20721
	cmpq	$0, (%r15)
	jne	.L20721
	jmp	.L20848
	.p2align 6,,7
.L32418:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L20846
	movl	$.LC148, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L20846
.L32417:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r11
	xorl	%r12d, %r12d
	cmpq	%r11, %r8
	movq	%r8, %rbx
	movq	%r11, %r13
	jae	.L30047
.L20828:
	cmpl	$3, (%rbx)
	je	.L32431
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L20824:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L20828
.L30047:
	movslq	%r12d,%rcx
	movq	%r8, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30049
.L20842:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32432
	cmpl	$2, %eax
	je	.L32433
.L20836:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %r10d
	leaq	1(%rdx), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L20832
.L20841:
	movzbl	(%rcx), %edi
	incq	%rbx
	incq	%rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	jne	.L20841
.L20832:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L20842
.L30049:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	jne	.L32434
.L20845:
	movq	global_trees(%rip), %r12
	jmp	.L20846
.L32434:
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L20845
	.p2align 6,,7
.L32433:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L20836
.L32432:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L20832
	.p2align 6,,7
.L32431:
	addl	$25, %r12d
	jmp	.L20824
.L20817:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	je	.L20820
	movq	constructor_type(%rip), %r9
	movzbl	16(%r9), %r8d
	subb	$20, %r8b
	cmpb	$1, %r8b
	ja	.L20816
	testb	$2, 53(%r15)
	je	.L20816
	cmpb	$25, 16(%r12)
	je	.L20816
.L20820:
	movl	$0, constructor_simple(%rip)
	jmp	.L20816
	.p2align 6,,7
.L32416:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L20816
.L32415:
	movl	require_constant_value(%rip), %ebx
	testl	%ebx, %ebx
	je	.L20814
	movl	flag_isoc99(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L20814
	xorl	%edi, %edi
	testl	%edi, %edi
	je	.L20814
	movq	32(%r12), %r13
	movq	32(%r13), %rsi
	movq	104(%rsi), %r12
	jmp	.L20814
	.p2align 6,,7
.L32414:
	movzbl	16(%r12), %ecx
	cmpb	$29, %cl
	je	.L32435
.L20728:
	movq	-232(%rbp), %rcx
	movq	128(%rdx), %rdi
	movq	128(%rcx), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L31119
	movq	8(%r12), %rbx
.L20727:
	movzbl	16(%rbx), %r13d
	cmpl	$23, %r13d
	je	.L20730
	cmpl	$18, %r13d
	je	.L20730
	movzbl	16(%r12), %ecx
	cmpb	$32, %cl
	je	.L32436
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L20787
	cmpb	$34, %cl
	je	.L32437
.L20787:
	cmpb	$116, %cl
	movq	%r12, %rdx
	je	.L31125
	cmpb	$115, %cl
	je	.L32438
.L20796:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L20801
	cmpb	$49, %al
	je	.L20801
	cmpb	$50, %al
	je	.L20801
	cmpb	$101, %al
	je	.L20801
.L20800:
	cmpl	$10, %r13d
	je	.L32439
	cmpb	$39, %cl
	je	.L32440
.L20806:
	movq	%rbx, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L20809
	testb	$32, 17(%rbx)
	je	.L20810
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L20811
	movq	integer_types+40(%rip), %rdx
	movzwl	60(%rbx), %r11d
	movzwl	60(%rdx), %ecx
	andl	$511, %r11d
	andl	$511, %ecx
	cmpl	%ecx, %r11d
	je	.L20811
.L20810:
	movq	integer_types+40(%rip), %rdi
.L31980:
	movq	%r12, %rsi
.L31981:
	call	convert
.L31577:
	movq	%rax, %rbx
.L31568:
	movq	global_trees(%rip), %r8
.L20785:
	movq	%rbx, %r12
	jmp	.L31578
.L20811:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31980
.L20809:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L20812
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L20812
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%rbx)
	je	.L32441
.L20812:
	cmpl	$5, %r13d
	je	.L32442
.L20813:
	movq	%r12, %rbx
	jmp	.L31568
.L32442:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L31569:
	movq	global_trees(%rip), %r8
	movq	%r8, %rbx
	jmp	.L20785
.L32441:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31980
.L32440:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L20806
	movq	integer_types+40(%rip), %r14
	movq	40(%rdx), %rdi
	movzwl	60(%r14), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L20806
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L20810
	testb	$32, 17(%rbx)
	jne	.L20811
	jmp	.L20810
.L32439:
	movq	integer_types+40(%rip), %r9
	movzwl	60(%rbx), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%r9), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L20805
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L20804
.L20805:
	testb	$32, 17(%rbx)
	movl	$1, %eax
	cmovne	%eax, %esi
.L20804:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31980
.L20801:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L20800
.L32438:
	movq	32(%r12), %rsi
	movq	8(%r12), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L20796
.L20799:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r12
	cmpb	$116, %cl
	jne	.L32443
.L31125:
	movq	32(%r12), %rsi
	jmp	.L20799
.L32443:
	cmpb	$115, %cl
	jne	.L20796
	movq	32(%rsi), %r8
	movq	8(%r12), %rdi
	cmpq	%rdi, 8(%r8)
	movq	%r8, %rsi
	je	.L20799
	jmp	.L20796
.L32437:
	movl	pedantic(%rip), %eax
	testl	%eax, %eax
	jne	.L20787
	cmpb	$51, 48(%r12)
	je	.L20787
	cmpq	$0, current_function_decl(%rip)
	je	.L20793
	movzbl	17(%r12), %ebx
	andb	$24, %bl
	cmpb	$16, %bl
	je	.L32444
.L20793:
	movq	%r12, %rsi
.L20794:
	movq	%rsi, %r12
	movq	8(%rsi), %rbx
.L31567:
	movzbl	16(%r12), %ecx
	jmp	.L20787
.L32444:
	movq	104(%r12), %rax
	testq	%rax, %rax
	je	.L20793
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L20793
	testb	$2, 17(%rax)
	je	.L20793
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L20794
	jmp	.L20793
.L32436:
	movq	104(%r12), %r12
	jmp	.L31567
.L20730:
	movzbl	16(%r12), %ecx
	xorl	%r14d, %r14d
	movl	%r13d, %edi
	movq	%r12, %rdx
	cmpb	$116, %cl
	je	.L31121
	cmpb	$115, %cl
	je	.L32445
.L20732:
	movzbl	%cl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L20738
	cmpb	$49, %al
	je	.L20738
	cmpb	$50, %al
	je	.L20738
	cmpb	$101, %al
	je	.L20738
.L20737:
	cmpl	$23, %edi
	je	.L32446
	cmpl	$18, %edi
	jne	.L20813
	movzbl	%cl, %r10d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r10), %eax
	movq	8(%rbx), %r13
	cmpb	$114, %al
	je	.L20743
	cmpb	$100, %al
	je	.L20743
.L20742:
	movzbl	17(%rbx), %r8d
	movl	$1, %r9d
	movl	%r8d, %r10d
	movl	%r8d, %edi
	shrb	$3, %r10b
	shrb	$4, %dil
	andl	$1, %r10d
	andl	%edi, %r9d
	movzbl	16(%rbx), %edi
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rbx), %r10d
	movl	%r10d, %esi
	shrb	$5, %sil
	andl	$1, %esi
	sall	$2, %esi
	orl	%esi, %r9d
	xorl	%esi, %esi
	cmpb	$20, %dil
	je	.L32447
.L20746:
	leal	0(,%rsi,8), %ebx
	orl	%ebx, %r9d
	jne	.L20745
	testl	%edx, %edx
	jne	.L20745
	testl	%r11d, %r11d
	je	.L20744
.L20745:
	movl	%r8d, %ebx
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %bl
	movl	%r10d, %r9d
	movl	%r8d, %ecx
	andl	%ebx, %esi
	andl	$1, %r9d
	andl	$1, %ecx
	sall	$2, %r9d
	addl	%ecx, %ecx
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	orl	%r9d, %esi
	cmpb	$20, %dil
	je	.L32448
.L20747:
	leal	0(,%rcx,8), %r8d
	movq	%r13, %rdi
	orl	%r8d, %esi
	orl	%edx, %esi
	leal	(%r11,%r11), %edx
	orl	%edx, %esi
	call	c_build_qualified_type
	movzbl	16(%r12), %ecx
	movq	%rax, %r13
.L20744:
	cmpb	$41, %cl
	je	.L32449
	cmpb	$47, %cl
	je	.L32450
	xorl	%ebx, %ebx
	testl	%r14d, %r14d
	je	.L32451
.L20781:
	movl	flag_isoc99(%rip), %r14d
	testl	%r14d, %r14d
	jne	.L20782
	testl	%ebx, %ebx
	je	.L20813
.L20782:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r12)
	movq	%rax, %rbx
	je	.L32452
	movl	$121, %edi
	movq	%r12, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L31981
.L32452:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r12, %rdx
	call	build1
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L31569
	movq	%r12, %rdi
	call	staticp
	movzbl	17(%rbx), %r12d
	movl	%eax, %ecx
	andb	$1, %cl
	addb	%cl, %cl
	andb	$-4, %r12b
	orb	%cl, %r12b
	movb	%r12b, 17(%rbx)
	jmp	.L31568
.L32451:
	movq	%r12, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebx
	jmp	.L20781
.L32450:
	movq	40(%r12), %rbx
	movq	8(%rbx), %r13
	movzbl	16(%r13), %r14d
	movq	%r13, %rax
	cmpl	$23, %r14d
	je	.L20751
	cmpl	$18, %r14d
	je	.L20751
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L32453
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L20754
	cmpb	$34, %dl
	je	.L32454
.L20754:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L31123
	cmpb	$115, %dl
	je	.L32455
.L20763:
	movzbl	%dl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L20768
	cmpb	$49, %al
	je	.L20768
	cmpb	$50, %al
	je	.L20768
	cmpb	$101, %al
	je	.L20768
.L20767:
	cmpl	$10, %r14d
	je	.L32456
	cmpb	$39, %dl
	je	.L32457
.L20773:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L20776
	testb	$32, 17(%r13)
	je	.L20777
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L20778
	movq	integer_types+40(%rip), %r10
	movzwl	60(%r13), %esi
	movzwl	60(%r10), %r13d
	andl	$511, %esi
	andl	$511, %r13d
	cmpl	%r13d, %esi
	je	.L20778
.L20777:
	movq	integer_types+40(%rip), %rdi
.L31566:
	movq	%rbx, %rsi
	call	convert
.L20752:
	movq	8(%rax), %rsi
	movq	32(%r12), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L31577
.L20778:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31566
.L20776:
	movl	flag_traditional(%rip), %edi
	testl	%edi, %edi
	je	.L20779
	movl	flag_allow_single_precision(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L20779
	movq	global_trees+192(%rip), %r9
	cmpq	%r9, 128(%r13)
	je	.L32458
.L20779:
	cmpl	$5, %r14d
	je	.L32459
	movq	%rbx, %rax
	jmp	.L20752
.L32459:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L20752
.L32458:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31566
.L32457:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L20773
	movq	integer_types+40(%rip), %r11
	movq	40(%rdx), %rdi
	movzwl	60(%r11), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L20773
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L20777
	testb	$32, 17(%r13)
	jne	.L20778
	jmp	.L20777
.L32456:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r14d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r14d, %r14d
	jne	.L20772
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L20771
.L20772:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L20771:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31566
.L20768:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L20767
.L32455:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L20763
.L20766:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L32460
.L31123:
	movq	32(%rbx), %rsi
	jmp	.L20766
.L32460:
	cmpb	$115, %dl
	jne	.L20763
	movq	32(%rsi), %r9
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%r9)
	movq	%r9, %rsi
	je	.L20766
	jmp	.L20763
.L32454:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L20758
	cmpb	$51, 48(%rbx)
	je	.L20758
	cmpq	$0, current_function_decl(%rip)
	je	.L20760
	movzbl	17(%rbx), %esi
	andb	$24, %sil
	cmpb	$16, %sil
	je	.L32461
.L20760:
	movq	%rbx, %rsi
.L20761:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L20758:
	movq	%rax, %r13
	jmp	.L20754
.L32461:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L20760
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L20760
	testb	$2, 17(%rax)
	je	.L20760
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L20761
	jmp	.L20760
.L32453:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L20754
.L20751:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L20752
.L32449:
	movq	72(%r13), %rdi
	movq	32(%r12), %rsi
	jmp	.L31981
.L32448:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L20747
.L32447:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L20746
.L20743:
	movzbl	17(%r12), %edi
	movl	$1, %r11d
	movl	%edi, %edx
	shrb	$3, %dil
	shrb	$4, %dl
	andl	%edi, %r11d
	andl	$1, %edx
	jmp	.L20742
.L32446:
	movl	$121, %edi
	movq	%r12, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L31577
.L20738:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L20737
.L32445:
	movq	32(%r12), %rsi
	cmpq	%rbx, 8(%rsi)
	jne	.L20732
.L20736:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r12
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r14d
	cmpb	$116, %cl
	jne	.L32462
.L31121:
	movq	32(%r12), %rsi
	jmp	.L20736
.L32462:
	cmpb	$115, %cl
	jne	.L20732
	movq	32(%rsi), %rsi
	movq	8(%r12), %r13
	cmpq	%r13, 8(%rsi)
	je	.L20736
	jmp	.L20732
.L32435:
	movq	-232(%rbp), %rbx
	cmpb	$18, 16(%rbx)
	jne	.L20728
	movq	8(%rbx), %rsi
	cmpb	$6, 16(%rsi)
	jne	.L20728
	movq	global_trees(%rip), %r8
	jmp	.L20726
	.p2align 6,,7
.L20725:
	movq	-824(%rbp), %r9
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%r9), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20953
	movq	-824(%rbp), %r8
	movq	(%r8), %rax
	testq	%rax, %rax
	jne	.L31598
	movq	-824(%rbp), %r14
	movq	32(%r14), %rax
	movq	%rax, -856(%rbp)
	jmp	.L20722
	.p2align 6,,7
.L20953:
	movq	-824(%rbp), %r11
	movq	8(%r11), %rax
	testq	%rax, %rax
	jne	.L31598
	movq	-824(%rbp), %rsi
	movq	16(%rsi), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20960
	cmpq	%rsi, 8(%rax)
	je	.L20963
.L20960:
	testq	%rax, %rax
	movq	%rax, -824(%rbp)
	je	.L20722
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%rax), %rsi
	jmp	.L31984
.L20963:
	movq	16(%rdx), %rax
	movq	%rdx, -824(%rbp)
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20960
	movq	-824(%rbp), %r10
	cmpq	%r10, 8(%rax)
	je	.L20963
	jmp	.L20960
.L32218:
	movq	constructor_unfilled_fields(%rip), %rax
	testq	%rax, %rax
	je	.L20683
.L31356:
	movq	40(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32463
.L20688:
	movq	(%rax), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	jne	.L31356
	jmp	.L20683
.L32463:
	call	integer_zerop
	testl	%eax, %eax
	je	.L32464
	movq	constructor_unfilled_fields(%rip), %rax
	jmp	.L20688
.L32464:
	movq	constructor_unfilled_fields(%rip), %rax
	testq	%rax, %rax
	je	.L20683
	movl	constructor_designated(%rip), %edi
	testl	%edi, %edi
	jne	.L20683
	movq	72(%rax), %rax
	movl	$.LC159, %r12d
	testq	%rax, %rax
	je	.L20691
	movq	32(%rax), %r12
.L20691:
	movq	spelling(%rip), %rcx
	movq	spelling_base(%rip), %rdi
	movl	spelling_size(%rip), %eax
	movq	%rcx, %r9
	subq	%rdi, %r9
	movq	%r9, %rbx
	shrq	$4, %rbx
	cmpl	%eax, %ebx
	jl	.L20692
	addl	$10, %eax
	testq	%rdi, %rdi
	movl	%eax, spelling_size(%rip)
	jne	.L20693
	movslq	%eax,%rdi
	salq	$4, %rdi
	call	xmalloc
.L31565:
	movslq	%ebx,%rcx
	movq	%rax, spelling_base(%rip)
	salq	$4, %rcx
	addq	spelling_base(%rip), %rcx
	movq	%rcx, spelling(%rip)
.L20692:
	movq	%r12, 8(%rcx)
	movl	$2, (%rcx)
	movl	$.LC175, %esi
	addq	$16, %rcx
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movq	%rcx, spelling(%rip)
	xorl	%r12d, %r12d
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rsi
	cmpq	%rsi, %r8
	movq	%r8, %rbx
	movq	%rsi, %r13
	jae	.L30038
.L20702:
	cmpl	$3, (%rbx)
	je	.L32465
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L20698:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L20702
.L30038:
	movslq	%r12d,%rcx
	movq	%r8, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30040
.L20716:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32466
	cmpl	$2, %eax
	je	.L32467
.L20710:
	movq	8(%r12), %r8
	movzbl	(%r8), %r13d
	leaq	1(%r8), %rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	je	.L20706
.L20715:
	movzbl	(%rcx), %r10d
	incq	%rbx
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	jne	.L20715
.L20706:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L20716
.L30040:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	jne	.L32468
.L20719:
	movslq	constructor_depth(%rip),%r14
	salq	$4, %r14
	addq	spelling_base(%rip), %r14
	movq	%r14, spelling(%rip)
	jmp	.L20683
.L32468:
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L20719
.L32467:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L20710
.L32466:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L20706
.L32465:
	addl	$25, %r12d
	jmp	.L20698
.L20693:
	movslq	%eax,%rsi
	salq	$4, %rsi
	call	xrealloc
	jmp	.L31565
.L32217:
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L20626
	cmpq	$0, 112(%rax)
	jne	.L20626
	movq	constructor_unfilled_index(%rip), %rdi
	call	integer_zerop
	testl	%eax, %eax
	jne	.L31564
	movq	constructor_type(%rip), %rdi
	cmpq	$0, 32(%rdi)
	jne	.L28037
	cmpl	$2, constructor_depth(%rip)
	jg	.L32469
	movl	pedantic(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L32470
.L20655:
	movq	constructor_fields(%rip), %r12
	cmpq	$0, (%r12)
	je	.L20626
.L31564:
	movq	$0, constructor_type(%rip)
	jmp	.L20626
.L32470:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC174, %esi
	call	pedwarn
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r14
	xorl	%r12d, %r12d
	cmpq	%r14, %r8
	movq	%r8, %rbx
	movq	%r14, %r13
	jae	.L30033
.L20663:
	cmpl	$3, (%rbx)
	je	.L32471
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L20659:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L20663
.L30033:
	movslq	%r12d,%rbx
	movq	%r8, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30035
.L20677:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32472
	cmpl	$2, %eax
	je	.L32473
.L20671:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %r10d
	leaq	1(%rdx), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L20667
.L20676:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L20676
.L20667:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L20677
.L30035:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L20655
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L20655
.L32473:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L20671
.L32472:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L20667
.L32471:
	addl	$25, %r12d
	jmp	.L20659
.L32469:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC173, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r9
	xorl	%r12d, %r12d
	cmpq	%r9, %r8
	movq	%r8, %rbx
	movq	%r9, %r13
	jae	.L30028
.L20637:
	cmpl	$3, (%rbx)
	je	.L32474
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L20633:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L20637
.L30028:
	movslq	%r12d,%r15
	movq	%r8, %r12
	addq	$16, %r15
	andq	$-16, %r15
	subq	%r15, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30030
.L20651:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32475
	cmpl	$2, %eax
	je	.L32476
.L20645:
	movq	8(%r12), %r8
	movzbl	(%r8), %r13d
	leaq	1(%r8), %rcx
	testb	%r13b, %r13b
	movb	%r13b, (%rbx)
	je	.L20641
.L20650:
	movzbl	(%rcx), %esi
	incq	%rbx
	incq	%rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	jne	.L20650
.L20641:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L20651
.L30030:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L20655
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L20655
.L32476:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L20645
.L32475:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L20641
.L32474:
	addl	$25, %r12d
	jmp	.L20633
.L32092:
	movl	$.LC68, %edi
	movl	$6830, %esi
	jmp	.L32044
.L25741:
	movq	constructor_stack(%rip), %r10
	movq	$0, constructor_range_stack(%rip)
	movq	%r10, -1296(%rbp)
.L15218:
	movq	-1296(%rbp), %r8
	cmpb	$0, 106(%r8)
	jne	.L28702
.L15219:
	movl	-68(%rbp), %eax
	testl	%eax, %eax
	je	.L28703
	movq	constructor_type(%rip), %rcx
	movq	%rcx, %rdx
	movzbl	16(%rcx), %ecx
	leal	-20(%rcx), %r14d
	cmpb	$1, %r14b
	ja	.L28704
	movq	constructor_fields(%rip), %r14
	testq	%r14, %r14
	je	.L28704
	cmpb	$18, %cl
	je	.L32477
	cmpb	$20, 16(%rdx)
	je	.L32478
	cmpb	$21, 16(%rdx)
	je	.L32479
.L28846:
	movq	$0, -1264(%rbp)
.L28703:
	movl	$112, %edi
	call	xmalloc
	movzbl	constructor_constant(%rip), %ecx
	movq	constructor_elements(%rip), %r14
	movq	constructor_type(%rip), %rdi
	movq	constructor_fields(%rip), %rsi
	movq	%rax, %rdx
	movq	constructor_index(%rip), %r13
	movq	constructor_max_index(%rip), %r10
	movq	constructor_unfilled_index(%rip), %r9
	movq	constructor_unfilled_fields(%rip), %r8
	movq	constructor_bit_index(%rip), %r11
	movq	%rdi, 8(%rax)
	movq	%rsi, 16(%rax)
	movb	%cl, 104(%rax)
	movq	%r13, 24(%rax)
	movq	%r10, 32(%rax)
	movzbl	constructor_simple(%rip), %ebx
	movq	%r9, 40(%rax)
	movq	%r8, 48(%rax)
	movq	%r11, 56(%rax)
	movq	%r14, 64(%rax)
	movq	$0, 88(%rdx)
	movb	%bl, 105(%rax)
	movzbl	constructor_erroneous(%rip), %r12d
	movb	%r12b, 107(%rax)
	movzbl	-68(%rbp), %r13d
	movq	constructor_pending_elts(%rip), %r15
	movq	%r15, 72(%rax)
	movl	constructor_depth(%rip), %eax
	movb	$0, 108(%rdx)
	movb	%r13b, 106(%rdx)
	movzbl	constructor_incremental(%rip), %r10d
	movl	%eax, 84(%rdx)
	movb	%r10b, 109(%rdx)
	movzbl	constructor_designated(%rip), %r9d
	movb	%r9b, 110(%rdx)
	movl	-68(%rbp), %r14d
	movq	$0, constructor_pending_elts(%rip)
	movq	constructor_stack(%rip), %r8
	movq	spelling(%rip), %rcx
	movq	$0, 96(%rdx)
	movl	$1, constructor_constant(%rip)
	movl	$1, constructor_simple(%rip)
	movq	$0, constructor_elements(%rip)
	movl	$1, constructor_incremental(%rip)
	movl	$0, constructor_designated(%rip)
	movq	%r8, (%rdx)
	movq	%rcx, %r11
	movq	%rcx, %r9
	movq	spelling_base(%rip), %r8
	movq	%rdx, constructor_stack(%rip)
	subq	%r8, %r11
	sarq	$4, %r11
	testl	%r14d, %r14d
	movl	%r11d, constructor_depth(%rip)
	jne	.L29053
	movq	constructor_range_stack(%rip), %r15
	movl	$0, designator_depth(%rip)
	movl	$0, designator_errorneous(%rip)
	movq	%r15, 96(%rdx)
	movq	$0, constructor_range_stack(%rip)
.L29053:
	testq	%rdi, %rdi
	je	.L31363
	movzbl	16(%rdi), %edx
	leal	-20(%rdx), %r12d
	cmpb	$1, %r12b
	ja	.L29056
	testq	%rsi, %rsi
	jne	.L29057
	xorl	%edi, %edi
	movq	$0, constructor_type(%rip)
.L29055:
	testq	%rdi, %rdi
	je	.L31363
	cmpq	$0, -1264(%rbp)
	je	.L29096
	movq	-1264(%rbp), %rbx
	cmpb	$46, 16(%rbx)
	je	.L32480
.L29096:
	cmpl	$1, -68(%rbp)
	je	.L32481
.L29229:
	movq	constructor_type(%rip), %rcx
	movzbl	16(%rcx), %edx
	leal	-20(%rdx), %r13d
	cmpb	$1, %r13b
	ja	.L29254
	movq	24(%rcx), %rsi
	testq	%rsi, %rsi
	movq	%rsi, constructor_fields(%rip)
	je	.L29256
	testb	$2, 53(%rsi)
	jne	.L32482
.L29256:
	movq	constructor_fields(%rip), %r11
	movq	global_trees+136(%rip), %r14
	movq	%r11, constructor_unfilled_fields(%rip)
	movq	%r14, constructor_bit_index(%rip)
.L15217:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
.L32482:
	cmpq	$0, 72(%rsi)
	jne	.L29256
.L29259:
	movq	constructor_fields(%rip), %r12
	movq	(%r12), %rsi
	testq	%rsi, %rsi
	movq	%rsi, constructor_fields(%rip)
	je	.L29256
	testb	$2, 53(%rsi)
	je	.L29256
	cmpq	$0, 72(%rsi)
	je	.L29259
	jmp	.L29256
.L29254:
	cmpb	$9, %dl
	je	.L32483
	cmpb	$18, %dl
	je	.L32484
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC181, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r13
	xorl	%r12d, %r12d
	cmpq	%r13, %r8
	movq	%r8, %rbx
	jae	.L30991
.L29428:
	cmpl	$3, (%rbx)
	je	.L32485
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L29424:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L29428
.L30991:
	movslq	%r12d,%r15
	movq	%r8, %r12
	addq	$16, %r15
	andq	$-16, %r15
	subq	%r15, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30993
.L29442:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32486
	cmpl	$2, %eax
	je	.L32487
.L29436:
	movq	8(%r12), %rsi
	movzbl	(%rsi), %r11d
	leaq	1(%rsi), %rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	je	.L29432
	.p2align 4,,7
.L29441:
	movzbl	(%rcx), %r8d
	incq	%rbx
	incq	%rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	jne	.L29441
.L29432:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L29442
.L30993:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	jne	.L32488
.L29445:
	movq	constructor_type(%rip), %rbx
	movq	%rbx, constructor_fields(%rip)
	movq	%rbx, constructor_unfilled_fields(%rip)
	jmp	.L15217
.L32488:
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L29445
.L32487:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L29436
.L32486:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L29432
.L32485:
	addl	$25, %r12d
	jmp	.L29424
.L32484:
	movq	24(%rcx), %rax
	testq	%rax, %rax
	je	.L29268
	movq	112(%rax), %r8
	testq	%r8, %r8
	movq	%r8, constructor_max_index(%rip)
	jne	.L29269
	cmpq	$0, 32(%rcx)
	jne	.L32489
.L29269:
	movq	constructor_max_index(%rip), %rax
	testq	%rax, %rax
	je	.L29270
	cmpb	$25, 16(%rax)
	je	.L29270
	movq	$-1, %rdi
	movq	%rdi, %rsi
	call	build_int_2_wide
	movq	%rax, constructor_max_index(%rip)
.L29270:
	movq	constructor_type(%rip), %rbx
	movq	sizetype_tab+24(%rip), %rdi
	movq	24(%rbx), %r9
	movq	104(%r9), %rsi
	call	convert
.L31939:
	cmpq	$0, -1264(%rbp)
	movq	%rax, constructor_index(%rip)
	movq	constructor_index(%rip), %r10
	movq	%r10, constructor_unfilled_index(%rip)
	je	.L15217
	movq	-1264(%rbp), %rax
	cmpb	$29, 16(%rax)
	jne	.L15217
	movq	constructor_type(%rip), %rsi
	cmpb	$18, 16(%rsi)
	jne	.L32490
	movq	-1264(%rbp), %r13
	movq	integer_types(%rip), %rcx
	movq	8(%r13), %rdx
	movzwl	60(%rcx), %edi
	movq	8(%rdx), %r15
	movl	$1, -1276(%rbp)
	andl	$511, %edi
	movzwl	60(%r15), %edx
	andl	$511, %edx
	cmpl	%edi, %edx
	je	.L29275
	movq	c_global_trees(%rip), %r14
	movzwl	60(%r14), %r12d
	andl	$511, %r12d
	cmpl	%r12d, %edx
	jne	.L29276
	shrl	$3, %edx
	movl	%edx, -1276(%rbp)
.L29275:
	movzwl	60(%rcx), %ebx
	movq	-1264(%rbp), %r8
	movq	global_trees+136(%rip), %r11
	andl	$511, %ebx
	movl	%ebx, -556(%rbp)
	movq	8(%rsi), %r9
	movq	%r9, -544(%rbp)
	movslq	32(%r8),%rcx
	movq	40(%r8), %r15
	movq	%r11, -1288(%rbp)
	leaq	(%rcx,%r15), %rsi
	movq	%rsi, -552(%rbp)
.L29279:
	cmpq	-552(%rbp), %r15
	jae	.L29280
	movq	constructor_max_index(%rip), %rdi
	movq	-1288(%rbp), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L29280
	cmpl	$1, -1276(%rbp)
	je	.L32491
	cmpl	-1276(%rbp), %eax
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	jge	.L29285
	leaq	-64(%rbp), %r9
	xorl	%edi, %edi
	movl	-1276(%rbp), %r8d
.L29297:
	xorl	%r13d, %r13d
	movzbq	(%r15), %r12
	leal	63(%rdi), %edx
	cmpl	$63, %edi
	movl	%edi, %ecx
	setle	%r13b
	incq	%r15
	cmpl	$-1, %edi
	cmovg	%edi, %edx
	addl	-556(%rbp), %edi
	andl	$-64, %edx
	subl	%edx, %ecx
	movq	%r13, %r14
	salq	%cl, %r12
	orq	(%r9,%r14,8), %r12
	decl	%r8d
	movq	%r12, (%r9,%r13,8)
	jne	.L29297
.L29285:
	movq	-544(%rbp), %rdi
	testb	$32, 17(%rdi)
	jne	.L31324
	movl	-1276(%rbp), %edx
	decl	%edx
	imull	-556(%rbp), %edx
	leal	8(%rdx), %r8d
	cmpl	$63, %r8d
	jg	.L29299
	movq	-56(%rbp), %rdi
	leal	7(%rdx), %ecx
	movq	%rdi, %rax
	sarq	%cl, %rax
	testl	$1, %eax 
	je	.L31326
	movq	$-1, %rsi
	movl	%r8d, %ecx
	movq	%rsi, %r11
	salq	%cl, %r11
	orq	%r11, %rdi
	movq	%rdi, -56(%rbp)
.L31940:
	movq	%rsi, -64(%rbp)
.L29298:
	call	build_int_2_wide
	xorl	%ebx, %ebx
	movl	$constructor_pending_elts, %r12d
	movq	constructor_type(%rip), %rsi
	movq	%rax, -536(%rbp)
	movq	-544(%rbp), %rcx
	cmpb	$18, 16(%rsi)
	movq	%rcx, 8(%rax)
	je	.L32492
	movq	-1288(%rbp), %rdi
	call	bit_position
	movq	%rax, %r14
	movq	constructor_pending_elts(%rip), %rax
	testq	%rax, %rax
	je	.L29341
	movq	%rax, %r13
.L29374:
	movq	32(%r13), %rdi
	movq	%r13, %rbx
	movq	%r13, %r12
	call	bit_position
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L29342
	movq	-1288(%rbp), %rdi
	cmpq	%rdi, 32(%r13)
	je	.L29347
	leaq	8(%r13), %r12
.L29342:
	movq	(%r12), %rdx
	testq	%rdx, %rdx
	movq	%rdx, %r13
	jne	.L29374
.L29341:
	movl	$48, %edi
	call	ggc_alloc
	testq	%rbx, %rbx
	movq	-536(%rbp), %r13
	movq	-1288(%rbp), %r14
	movq	%rax, (%r12)
	movq	%rax, %rdx
	movq	%rbx, 16(%rax)
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	%r13, 40(%rax)
	movl	$0, 24(%rax)
	movq	%r14, 32(%rax)
	je	.L29281
.L29418:
	cmpq	(%rbx), %rdx
	je	.L32493
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L29399
	movl	$1, 24(%rbx)
.L29398:
	movq	%rbx, %rdx
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L29418
.L29281:
	movq	-1288(%rbp), %rsi
	movq	global_trees+144(%rip), %rdx
	movl	$59, %edi
	call	size_binop
	movq	%rax, -1288(%rbp)
	jmp	.L29279
.L29399:
	testl	%eax, %eax
	jle	.L29401
	movl	24(%rdx), %eax
	testl	%eax, %eax
	jle	.L29402
	movq	(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, 8(%rbx)
	je	.L29403
	movq	%rbx, 16(%rax)
.L29403:
	movq	%rbx, (%rdx)
.L32103:
	movq	16(%rbx), %rax
	movl	$0, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movl	$0, 24(%rdx)
	testq	%rax, %rax
	movq	%rax, 16(%rdx)
	je	.L29404
	cmpq	%rbx, (%rax)
	je	.L31351
	movq	%rdx, 8(%rax)
	jmp	.L29281
.L31351:
	movq	%rdx, (%rax)
	jmp	.L29281
.L29404:
	movq	%rdx, constructor_pending_elts(%rip)
	jmp	.L29281
.L29402:
	movq	(%rdx), %rcx
	movq	8(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, (%rdx)
	je	.L29409
	movq	%rdx, 16(%rax)
.L29409:
	movq	(%rcx), %rax
	movq	%rdx, 8(%rcx)
	testq	%rax, %rax
	movq	%rax, 8(%rbx)
	je	.L29410
	movq	%rbx, 16(%rax)
.L29410:
	movl	24(%rcx), %eax
	xorl	%edi, %edi
	movq	%rbx, (%rcx)
	shrl	$31, %eax
	movl	%eax, 24(%rdx)
	cmpl	$0, 24(%rcx)
	setle	%dil
	decl	%edi
	movl	%edi, 24(%rbx)
.L32104:
	movq	16(%rbx), %rax
	movl	$0, 24(%rcx)
	movq	%rcx, 16(%rbx)
	movq	%rcx, 16(%rdx)
	testq	%rax, %rax
	movq	%rax, 16(%rcx)
	je	.L29413
	cmpq	%rbx, (%rax)
	je	.L31352
	movq	%rcx, 8(%rax)
	jmp	.L29281
.L31352:
	movq	%rcx, (%rax)
	jmp	.L29281
	.p2align 6,,7
.L29413:
	movq	%rcx, constructor_pending_elts(%rip)
	jmp	.L29281
.L29401:
	movl	$0, 24(%rbx)
	jmp	.L29281
	.p2align 6,,7
.L32493:
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L29379
	movl	$-1, 24(%rbx)
	jmp	.L29398
.L29379:
	testl	%eax, %eax
	jns	.L29401
	movl	24(%rdx), %eax
	testl	%eax, %eax
	js	.L32494
	movq	8(%rdx), %rcx
	movq	(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, 8(%rdx)
	je	.L29389
	movq	%rdx, 16(%rax)
.L29389:
	movq	8(%rcx), %rax
	movq	%rdx, (%rcx)
	testq	%rax, %rax
	movq	%rax, (%rbx)
	je	.L29390
	movq	%rbx, 16(%rax)
.L29390:
	movl	24(%rcx), %eax
	xorl	%r12d, %r12d
	movq	%rbx, 8(%rcx)
	shrl	$31, %eax
	movl	%eax, 24(%rbx)
	cmpl	$0, 24(%rcx)
	setle	%r12b
	decl	%r12d
	movl	%r12d, 24(%rdx)
	jmp	.L32104
.L32494:
	movq	8(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, (%rbx)
	je	.L29383
	movq	%rbx, 16(%rax)
.L29383:
	movq	%rbx, 8(%rdx)
	jmp	.L32103
	.p2align 6,,7
.L29347:
	movq	40(%r13), %r11
	testb	$1, 17(%r11)
	jne	.L32495
.L29349:
	movq	-536(%rbp), %rax
	movq	%rax, 40(%r13)
	jmp	.L29281
.L32495:
	movl	$.LC165, %esi
	xorl	%eax, %eax
	movl	$.LC42, %edi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rsi
	xorl	%r12d, %r12d
	cmpq	%rsi, %r8
	movq	%r8, %rbx
	movq	%rsi, %r14
	jae	.L30985
.L29356:
	cmpl	$3, (%rbx)
	je	.L32496
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L29352:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L29356
.L30985:
	movslq	%r12d,%rcx
	movq	%r8, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r14, %r8
	movq	%rsp, -576(%rbp)
	movq	%rsp, %rbx
	jae	.L30987
.L29370:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32497
	cmpl	$2, %eax
	je	.L32498
.L29364:
	movq	8(%r12), %r9
	movzbl	(%r9), %r8d
	leaq	1(%r9), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L29360
.L29369:
	movzbl	(%rcx), %r10d
	incq	%rbx
	incq	%rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	jne	.L29369
.L29360:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L29370
.L30987:
	movb	$0, (%rbx)
	movq	-576(%rbp), %rcx
	cmpb	$0, (%rcx)
	je	.L29349
	movl	$.LC142, %edi
	movq	%rcx, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L29349
	.p2align 6,,7
.L32498:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L29364
.L32497:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L29360
.L32496:
	addl	$25, %r12d
	jmp	.L29352
	.p2align 6,,7
.L32492:
	movq	constructor_pending_elts(%rip), %rax
	testq	%rax, %rax
	je	.L29341
	movq	%rax, %r13
.L29340:
	movq	-1288(%rbp), %rdi
	movq	32(%r13), %rsi
	movq	%r13, %rbx
	movq	%r13, %r12
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L32499
.L29307:
	movq	(%r12), %r13
	testq	%r13, %r13
	jne	.L29340
	jmp	.L29341
.L32499:
	movq	32(%r13), %rdi
	movq	-1288(%rbp), %rsi
	leaq	8(%r13), %r12
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L29307
	movq	40(%r13), %r9
	testb	$1, 17(%r9)
	jne	.L32500
.L29314:
	movq	-536(%rbp), %r12
	movq	%r12, 40(%r13)
	jmp	.L29281
.L32500:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r14
	jae	.L30979
.L29321:
	cmpl	$3, (%rbx)
	je	.L32501
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L29317:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L29321
.L30979:
	movslq	%r12d,%rbx
	movq	%r8, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r14, %r8
	movq	%rsp, -568(%rbp)
	movq	%rsp, %rbx
	jae	.L30981
.L29335:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32502
	cmpl	$2, %eax
	je	.L32503
.L29329:
	movq	8(%r12), %r14
	movzbl	(%r14), %r10d
	leaq	1(%r14), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L29325
.L29334:
	movzbl	(%rcx), %edx
	incq	%rbx
	incq	%rcx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	jne	.L29334
.L29325:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L29335
.L30981:
	movb	$0, (%rbx)
	movq	-568(%rbp), %rsi
	cmpb	$0, (%rsi)
	je	.L29314
	movl	$.LC142, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L29314
	.p2align 6,,7
.L32503:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L29329
.L32502:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L29325
.L32501:
	addl	$25, %r12d
	jmp	.L29317
	.p2align 6,,7
.L31326:
	movq	-64(%rbp), %rsi
	jmp	.L29298
.L29299:
	cmpl	$64, %r8d
	je	.L32504
	movq	-64(%rbp), %rsi
	leal	-57(%rdx), %ecx
	movq	%rsi, %rax
	sarq	%cl, %rax
	testl	$1, %eax 
	je	.L31327
	leal	-56(%rdx), %ecx
	movq	$-1, %r8
	salq	%cl, %r8
	orq	%r8, %rsi
	movq	%rsi, -64(%rbp)
.L31327:
	movq	-56(%rbp), %rdi
	jmp	.L29298
.L32504:
	movq	-56(%rbp), %rdi
	testq	%rdi, %rdi
	jns	.L31326
	movq	$-1, %rsi
	jmp	.L31940
	.p2align 6,,7
.L31324:
	movq	-56(%rbp), %rdi
	jmp	.L31326
.L32491:
	movzbq	(%r15), %r10
	movq	$0, -64(%rbp)
	incq	%r15
	movq	%r10, -56(%rbp)
	jmp	.L29285
.L29280:
	movl	$0, constructor_incremental(%rip)
	jmp	.L15217
.L29276:
	movl	$.LC68, %edi
	movl	$6100, %esi
.L31943:
	movl	$.LC180, %edx
.L31944:
	call	fancy_abort
.L32490:
	movl	$.LC68, %edi
	movl	$6091, %esi
	jmp	.L31943
	.p2align 6,,7
.L32489:
	movq	$-1, %rdi
	movq	%rdi, %rsi
	call	build_int_2_wide
	movq	%rax, constructor_max_index(%rip)
	jmp	.L29269
.L29268:
	movq	global_trees+136(%rip), %rax
	jmp	.L31939
.L32483:
	movzbl	61(%rcx), %eax
	shrb	$1, %al
	andl	$127, %eax
	movzbl	mode_unit_size(%rax), %edx
	testb	%dl, %dl
	je	.L29264
	movzbw	mode_size(%rax), %ax
	divb	%dl
	movzbl	%al, %ecx
	decl	%ecx
	movslq	%ecx,%rdi
.L29265:
	xorl	%esi, %esi
	call	build_int_2_wide
	movq	global_trees+88(%rip), %rsi
	movq	sizetype_tab+24(%rip), %rdi
	movq	%rax, constructor_max_index(%rip)
	call	convert
	movq	%rax, constructor_index(%rip)
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L15217
.L29264:
	movq	$-1, %rdi
	jmp	.L29265
.L32481:
	movl	warn_missing_braces(%rip), %ebx
	testl	%ebx, %ebx
	je	.L29229
	movl	missing_braces_mentioned(%rip), %eax
	testl	%eax, %eax
	jne	.L29229
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC179, %esi
	movl	$1, missing_braces_mentioned(%rip)
	xorl	%r12d, %r12d
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r10
	cmpq	%r10, %r8
	movq	%r8, %rbx
	movq	%r10, %r13
	jae	.L30971
.L29236:
	cmpl	$3, (%rbx)
	je	.L32505
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L29232:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L29236
.L30971:
	movslq	%r12d,%rdi
	movq	%r8, %r12
	addq	$16, %rdi
	andq	$-16, %rdi
	subq	%rdi, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30973
.L29250:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32506
	cmpl	$2, %eax
	je	.L32507
.L29244:
	movq	8(%r12), %r15
	movzbl	(%r15), %esi
	leaq	1(%r15), %rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	je	.L29240
.L29249:
	movzbl	(%rcx), %edx
	incq	%rbx
	incq	%rcx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	jne	.L29249
.L29240:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L29250
.L30973:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L29229
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L29229
.L32507:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L29244
.L32506:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L29240
.L32505:
	addl	$25, %r12d
	jmp	.L29232
.L32480:
	movzbl	17(%rbx), %r13d
	movzbl	18(%rbx), %r10d
	movq	40(%rbx), %rax
	shrb	$1, %r13b
	shrb	$2, %r10b
	movq	%rax, constructor_elements(%rip)
	andl	$1, %r13d
	andl	$1, %r10d
	testq	%rax, %rax
	movl	%r13d, constructor_constant(%rip)
	movl	%r10d, constructor_simple(%rip)
	je	.L29096
	movzbl	16(%rdi), %edx
	cmpb	$20, %dl
	je	.L29099
	cmpb	$18, %dl
	jne	.L29096
.L29099:
	movq	%rax, -1272(%rbp)
.L29218:
	movq	-1272(%rbp), %r12
	xorl	%ebx, %ebx
	movq	32(%r12), %r15
	movq	24(%r12), %r14
	movl	$constructor_pending_elts, %r12d
	movq	%r15, -528(%rbp)
	cmpb	$18, 16(%rdi)
	je	.L32508
	movq	%r14, %rdi
	call	bit_position
	movq	%rax, %r15
	movq	constructor_pending_elts(%rip), %rax
	testq	%rax, %rax
	je	.L29140
	movq	%rax, %r13
.L29173:
	movq	32(%r13), %rdi
	movq	%r13, %rbx
	movq	%r13, %r12
	call	bit_position
	movq	%r15, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L29141
	cmpq	%r14, 32(%r13)
	je	.L29146
	leaq	8(%r13), %r12
.L29141:
	movq	(%r12), %rdx
	testq	%rdx, %rdx
	movq	%rdx, %r13
	jne	.L29173
.L29140:
	movl	$48, %edi
	call	ggc_alloc
	testq	%rbx, %rbx
	movq	-528(%rbp), %r13
	movq	%rax, (%r12)
	movq	%rax, %rdx
	movq	%r14, 32(%rax)
	movq	%rbx, 16(%rax)
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	%r13, 40(%rax)
	movl	$0, 24(%rax)
	je	.L29103
.L29217:
	cmpq	(%rbx), %rdx
	je	.L32509
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L29198
	movl	$1, 24(%rbx)
.L29197:
	movq	%rbx, %rdx
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L29217
.L29103:
	movq	-1272(%rbp), %r8
	movq	(%r8), %rcx
	testq	%rcx, %rcx
	movq	%rcx, -1272(%rbp)
	je	.L32510
	movq	constructor_type(%rip), %rdi
	jmp	.L29218
.L32510:
	movq	constructor_type(%rip), %rdi
	movq	$0, constructor_elements(%rip)
	cmpb	$20, 16(%rdi)
	je	.L32511
	cmpb	$18, 16(%rdi)
	je	.L32512
.L29225:
	movl	$0, constructor_incremental(%rip)
	jmp	.L29096
.L32512:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32513
	movq	global_trees+136(%rip), %rax
.L31938:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L29225
.L32513:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31938
.L32511:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L29225
	testb	$2, 53(%rax)
	je	.L29225
	cmpq	$0, 72(%rax)
	jne	.L29225
.L29224:
	movq	constructor_unfilled_fields(%rip), %r9
	movq	(%r9), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L29225
	testb	$2, 53(%rax)
	je	.L29225
	cmpq	$0, 72(%rax)
	jne	.L29225
	jmp	.L29224
.L29198:
	testl	%eax, %eax
	jle	.L29200
	movl	24(%rdx), %eax
	testl	%eax, %eax
	jle	.L29201
	movq	(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, 8(%rbx)
	je	.L29202
	movq	%rbx, 16(%rax)
.L29202:
	movq	%rbx, (%rdx)
.L32101:
	movq	16(%rbx), %rax
	movl	$0, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movl	$0, 24(%rdx)
	testq	%rax, %rax
	movq	%rax, 16(%rdx)
	je	.L29203
	cmpq	%rbx, (%rax)
	je	.L32514
	movq	%rdx, 8(%rax)
	jmp	.L29103
.L32514:
	movq	%rdx, (%rax)
	jmp	.L29103
.L29203:
	movq	%rdx, constructor_pending_elts(%rip)
	jmp	.L29103
.L29201:
	movq	(%rdx), %rcx
	movq	8(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, (%rdx)
	je	.L29208
	movq	%rdx, 16(%rax)
.L29208:
	movq	(%rcx), %rax
	movq	%rdx, 8(%rcx)
	testq	%rax, %rax
	movq	%rax, 8(%rbx)
	je	.L29209
	movq	%rbx, 16(%rax)
.L29209:
	movl	24(%rcx), %eax
	xorl	%r11d, %r11d
	movq	%rbx, (%rcx)
	shrl	$31, %eax
	movl	%eax, 24(%rdx)
	cmpl	$0, 24(%rcx)
	setle	%r11b
	decl	%r11d
	movl	%r11d, 24(%rbx)
.L32102:
	movq	16(%rbx), %rax
	movl	$0, 24(%rcx)
	movq	%rcx, 16(%rbx)
	movq	%rcx, 16(%rdx)
	testq	%rax, %rax
	movq	%rax, 16(%rcx)
	je	.L29212
	cmpq	%rbx, (%rax)
	je	.L32515
	movq	%rcx, 8(%rax)
	jmp	.L29103
.L32515:
	movq	%rcx, (%rax)
	jmp	.L29103
	.p2align 6,,7
.L29212:
	movq	%rcx, constructor_pending_elts(%rip)
	jmp	.L29103
.L29200:
	movl	$0, 24(%rbx)
	jmp	.L29103
	.p2align 6,,7
.L32509:
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L29178
	movl	$-1, 24(%rbx)
	jmp	.L29197
.L29178:
	testl	%eax, %eax
	jns	.L29200
	movl	24(%rdx), %r12d
	testl	%r12d, %r12d
	js	.L32516
	movq	8(%rdx), %rcx
	movq	(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, 8(%rdx)
	je	.L29188
	movq	%rdx, 16(%rax)
.L29188:
	movq	8(%rcx), %rax
	movq	%rdx, (%rcx)
	testq	%rax, %rax
	movq	%rax, (%rbx)
	je	.L29189
	movq	%rbx, 16(%rax)
.L29189:
	movl	24(%rcx), %eax
	xorl	%r14d, %r14d
	movq	%rbx, 8(%rcx)
	shrl	$31, %eax
	movl	%eax, 24(%rbx)
	cmpl	$0, 24(%rcx)
	setle	%r14b
	decl	%r14d
	movl	%r14d, 24(%rdx)
	jmp	.L32102
.L32516:
	movq	8(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, (%rbx)
	je	.L29182
	movq	%rbx, 16(%rax)
.L29182:
	movq	%rbx, 8(%rdx)
	jmp	.L32101
	.p2align 6,,7
.L29146:
	movq	40(%r13), %r8
	testb	$1, 17(%r8)
	jne	.L32517
.L29148:
	movq	-528(%rbp), %r15
	movq	%r15, 40(%r13)
	jmp	.L29103
.L32517:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r9
	xorl	%r12d, %r12d
	cmpq	%r9, %r8
	movq	%r8, %rbx
	movq	%r9, %r14
	jae	.L30964
.L29155:
	cmpl	$3, (%rbx)
	je	.L32518
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L29151:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L29155
.L30964:
	movslq	%r12d,%rbx
	movq	%r8, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r14, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L30966
.L29169:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32519
	cmpl	$2, %eax
	je	.L32520
.L29163:
	movq	8(%r12), %rdi
	movzbl	(%rdi), %r10d
	leaq	1(%rdi), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L29159
.L29168:
	movzbl	(%rcx), %esi
	incq	%rbx
	incq	%rcx
	testb	%sil, %sil
	movb	%sil, (%rbx)
	jne	.L29168
.L29159:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L29169
.L30966:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	je	.L29148
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L29148
.L32520:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L29163
.L32519:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L29159
.L32518:
	addl	$25, %r12d
	jmp	.L29151
	.p2align 6,,7
.L32508:
	movq	constructor_pending_elts(%rip), %rax
	testq	%rax, %rax
	je	.L29140
	movq	%rax, %r13
.L29139:
	movq	32(%r13), %rsi
	movq	%r14, %rdi
	movq	%r13, %rbx
	movq	%r13, %r12
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L32521
.L29106:
	movq	(%r12), %r13
	testq	%r13, %r13
	jne	.L29139
	jmp	.L29140
.L32521:
	movq	32(%r13), %rdi
	movq	%r14, %rsi
	leaq	8(%r13), %r12
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L29106
	movq	40(%r13), %rdi
	testb	$1, 17(%rdi)
	jne	.L32522
.L29113:
	movq	-528(%rbp), %rcx
	movq	%rcx, 40(%r13)
	jmp	.L29103
.L32522:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r14
	jae	.L30958
.L29120:
	cmpl	$3, (%rbx)
	je	.L32523
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L29116:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L29120
.L30958:
	movslq	%r12d,%rsi
	movq	%r8, %r12
	addq	$16, %rsi
	andq	$-16, %rsi
	subq	%rsi, %rsp
	cmpq	%r14, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L30960
.L29134:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32524
	cmpl	$2, %eax
	je	.L32525
.L29128:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %r14d
	leaq	1(%rdx), %rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	je	.L29124
.L29133:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L29133
.L29124:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L29134
.L30960:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	je	.L29113
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L29113
	.p2align 6,,7
.L32525:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L29128
.L32524:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L29124
.L32523:
	addl	$25, %r12d
	jmp	.L29116
	.p2align 6,,7
.L31363:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC178, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r14
	xorl	%r12d, %r12d
	cmpq	%r14, %r8
	movq	%r8, %rbx
	movq	%r14, %r13
	jae	.L30950
.L29078:
	cmpl	$3, (%rbx)
	je	.L32526
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L29074:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L29078
.L30950:
	movslq	%r12d,%rbx
	movq	%r8, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30952
.L29092:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32527
	cmpl	$2, %eax
	je	.L32528
.L29086:
	movq	8(%r12), %r8
	movzbl	(%r8), %r11d
	leaq	1(%r8), %rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	je	.L29082
	.p2align 4,,7
.L29091:
	movzbl	(%rcx), %r9d
	incq	%rbx
	incq	%rcx
	testb	%r9b, %r9b
	movb	%r9b, (%rbx)
	jne	.L29091
.L29082:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L29092
.L30952:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	jne	.L32529
.L29095:
	movq	$0, constructor_fields(%rip)
	movq	$0, constructor_unfilled_fields(%rip)
	jmp	.L15217
.L32529:
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L29095
.L32528:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L29086
.L32527:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L29082
.L32526:
	addl	$25, %r12d
	jmp	.L29074
.L29057:
	movq	8(%rsi), %rax
	movl	$.LC159, %r12d
	movq	%rax, constructor_type(%rip)
	movq	72(%rsi), %rax
	testq	%rax, %rax
	je	.L29060
	movq	32(%rax), %r12
.L29060:
	subq	%r8, %r9
	movl	spelling_size(%rip), %eax
	movq	%r9, %rbx
	shrq	$4, %rbx
	cmpl	%eax, %ebx
	jl	.L29061
	addl	$10, %eax
	testq	%r8, %r8
	movl	%eax, spelling_size(%rip)
	jne	.L29062
	movslq	%eax,%rdi
	salq	$4, %rdi
	call	xmalloc
.L31933:
	movslq	%ebx,%rcx
	movq	%rax, spelling_base(%rip)
	salq	$4, %rcx
	addq	spelling_base(%rip), %rcx
	movq	%rcx, spelling(%rip)
.L29061:
	movl	$2, (%rcx)
	movq	%r12, 8(%rcx)
.L31935:
	addq	$16, %rcx
	incl	constructor_depth(%rip)
	movq	constructor_type(%rip), %rdi
	movq	%rcx, spelling(%rip)
	jmp	.L29055
.L29062:
	movslq	%eax,%rsi
	movq	%r8, %rdi
	salq	$4, %rsi
	call	xrealloc
	jmp	.L31933
.L29056:
	cmpb	$18, %dl
	jne	.L29055
	movq	8(%rdi), %rdx
	xorl	%esi, %esi
	movq	constructor_index(%rip), %rdi
	movq	%rdx, constructor_type(%rip)
	call	tree_low_cst
	movq	spelling_base(%rip), %rdi
	movq	spelling(%rip), %rcx
	movl	%eax, %r12d
	movl	spelling_size(%rip), %eax
	movq	%rcx, %rsi
	subq	%rdi, %rsi
	movq	%rsi, %rbx
	shrq	$4, %rbx
	cmpl	%eax, %ebx
	jl	.L29067
	addl	$10, %eax
	testq	%rdi, %rdi
	movl	%eax, spelling_size(%rip)
	jne	.L29068
	movslq	%eax,%rdi
	salq	$4, %rdi
	call	xmalloc
.L31934:
	movslq	%ebx,%rcx
	movq	%rax, spelling_base(%rip)
	salq	$4, %rcx
	addq	spelling_base(%rip), %rcx
	movq	%rcx, spelling(%rip)
.L29067:
	movl	$3, (%rcx)
	movl	%r12d, 8(%rcx)
	jmp	.L31935
.L29068:
	movslq	%eax,%rsi
	salq	$4, %rsi
	call	xrealloc
	jmp	.L31934
.L32479:
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	je	.L28846
	cmpq	%r14, 24(%rax)
	jne	.L28846
	movq	32(%rax), %rax
.L29019:
	movq	%rax, -1264(%rbp)
	jmp	.L28703
.L32478:
	movq	%r14, %rdi
	call	bit_position
	movl	constructor_incremental(%rip), %esi
	movq	%rax, %r12
	testl	%esi, %esi
	je	.L28848
	movq	constructor_unfilled_fields(%rip), %rdi
	testq	%rdi, %rdi
	jne	.L32530
.L28849:
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L28850
	cmpb	$18, %al
	je	.L28850
.L28848:
	movq	constructor_pending_elts(%rip), %rbx
	testq	%rbx, %rbx
	je	.L28846
.L28874:
	movq	32(%rbx), %rdi
	cmpq	%rdi, %r14
	je	.L31348
	call	bit_position
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L28872
	movq	(%rbx), %rbx
.L28867:
	testq	%rbx, %rbx
	jne	.L28874
	jmp	.L28846
.L28872:
	movq	8(%rbx), %rbx
	jmp	.L28867
.L31348:
	movq	40(%rbx), %rcx
	movq	%rcx, -1264(%rbp)
	jmp	.L28703
.L28850:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L28856
.L30925:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	je	.L32531
	cmpb	$18, 16(%rdi)
	je	.L32532
.L28863:
	movl	$0, constructor_incremental(%rip)
	jmp	.L28848
.L32532:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32533
	movq	global_trees+136(%rip), %rax
.L31929:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L28863
.L32533:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31929
.L32531:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L28863
	testb	$2, 53(%rax)
	je	.L28863
	cmpq	$0, 72(%rax)
	jne	.L28863
.L28862:
	movq	constructor_unfilled_fields(%rip), %rcx
	movq	(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L28863
	testb	$2, 53(%rax)
	je	.L28863
	cmpq	$0, 72(%rax)
	jne	.L28863
	jmp	.L28862
	.p2align 6,,7
.L28856:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L28856
	movq	constructor_type(%rip), %rdi
	jmp	.L30925
	.p2align 6,,7
.L32530:
	call	bit_position
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L28848
	jmp	.L28849
	.p2align 6,,7
.L32477:
	movl	constructor_incremental(%rip), %eax
	testl	%eax, %eax
	jne	.L32534
.L28706:
	movq	constructor_pending_elts(%rip), %rbx
	testq	%rbx, %rbx
	je	.L28846
.L28845:
	movq	32(%rbx), %rsi
	movq	%r14, %rdi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L28840
	movq	(%rbx), %rbx
.L28837:
	testq	%rbx, %rbx
	jne	.L28845
	jmp	.L28846
.L28840:
	movq	32(%rbx), %rdi
	movq	%r14, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L31348
	movq	8(%rbx), %rbx
	jmp	.L28837
.L32534:
	movq	constructor_unfilled_index(%rip), %rsi
	movq	%r14, %rdi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L28706
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L28707
	cmpb	$18, %al
	jne	.L28706
.L28707:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	movq	%rbx, -1248(%rbp)
	je	.L30908
.L28826:
	movq	-1248(%rbp), %rsi
	xorl	%ebx, %ebx
	movl	$constructor_pending_elts, %r12d
	movq	32(%rsi), %r15
	movq	24(%rsi), %r13
	movq	%r15, -480(%rbp)
	cmpb	$18, 16(%rdi)
	je	.L32535
	movq	%r13, %rdi
	call	bit_position
	movq	%rax, -496(%rbp)
	movq	constructor_pending_elts(%rip), %rax
	testq	%rax, %rax
	je	.L28748
	movq	%rax, %r15
.L28781:
	movq	32(%r15), %rdi
	movq	%r15, %rbx
	movq	%r15, %r12
	call	bit_position
	movq	-496(%rbp), %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L28749
	cmpq	%r13, 32(%r15)
	je	.L28754
	leaq	8(%r15), %r12
.L28749:
	movq	(%r12), %r11
	testq	%r11, %r11
	movq	%r11, %r15
	jne	.L28781
.L28748:
	movl	$48, %edi
	call	ggc_alloc
	testq	%rbx, %rbx
	movq	-480(%rbp), %r15
	movq	%rax, (%r12)
	movq	%rax, %rdx
	movq	%r13, 32(%rax)
	movq	%rbx, 16(%rax)
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	%r15, 40(%rax)
	movl	$0, 24(%rax)
	je	.L28711
.L28825:
	cmpq	(%rbx), %rdx
	je	.L32536
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L28806
	movl	$1, 24(%rbx)
.L28805:
	movq	%rbx, %rdx
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L28825
.L28711:
	movq	-1248(%rbp), %r12
	movq	(%r12), %rax
	testq	%rax, %rax
	movq	%rax, -1248(%rbp)
	je	.L32537
	movq	constructor_type(%rip), %rdi
	jmp	.L28826
.L32537:
	movq	constructor_type(%rip), %rdi
.L30908:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	je	.L32538
	cmpb	$18, 16(%rdi)
	je	.L32539
.L28833:
	movl	$0, constructor_incremental(%rip)
	jmp	.L28706
.L32539:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32540
	movq	global_trees+136(%rip), %rax
.L31928:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L28833
.L32540:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31928
.L32538:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L28833
	testb	$2, 53(%rax)
	je	.L28833
	cmpq	$0, 72(%rax)
	jne	.L28833
.L28832:
	movq	constructor_unfilled_fields(%rip), %rdx
	movq	(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L28833
	testb	$2, 53(%rax)
	je	.L28833
	cmpq	$0, 72(%rax)
	jne	.L28833
	jmp	.L28832
	.p2align 6,,7
.L28806:
	testl	%eax, %eax
	jle	.L28808
	movl	24(%rdx), %eax
	testl	%eax, %eax
	jle	.L28809
	movq	(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, 8(%rbx)
	je	.L28810
	movq	%rbx, 16(%rax)
.L28810:
	movq	%rbx, (%rdx)
.L32097:
	movq	16(%rbx), %rax
	movl	$0, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movl	$0, 24(%rdx)
	testq	%rax, %rax
	movq	%rax, 16(%rdx)
	je	.L28811
	cmpq	%rbx, (%rax)
	je	.L32541
	movq	%rdx, 8(%rax)
	jmp	.L28711
.L32541:
	movq	%rdx, (%rax)
	jmp	.L28711
.L28811:
	movq	%rdx, constructor_pending_elts(%rip)
	jmp	.L28711
.L28809:
	movq	(%rdx), %rcx
	movq	8(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, (%rdx)
	je	.L28816
	movq	%rdx, 16(%rax)
.L28816:
	movq	(%rcx), %rax
	movq	%rdx, 8(%rcx)
	testq	%rax, %rax
	movq	%rax, 8(%rbx)
	je	.L28817
	movq	%rbx, 16(%rax)
.L28817:
	movl	24(%rcx), %eax
	xorl	%edi, %edi
	movq	%rbx, (%rcx)
	shrl	$31, %eax
	movl	%eax, 24(%rdx)
	cmpl	$0, 24(%rcx)
	setle	%dil
	decl	%edi
	movl	%edi, 24(%rbx)
.L32098:
	movq	16(%rbx), %rax
	movl	$0, 24(%rcx)
	movq	%rcx, 16(%rbx)
	movq	%rcx, 16(%rdx)
	testq	%rax, %rax
	movq	%rax, 16(%rcx)
	je	.L28820
	cmpq	%rbx, (%rax)
	je	.L32542
	movq	%rcx, 8(%rax)
	jmp	.L28711
.L32542:
	movq	%rcx, (%rax)
	jmp	.L28711
.L28820:
	movq	%rcx, constructor_pending_elts(%rip)
	jmp	.L28711
.L28808:
	movl	$0, 24(%rbx)
	jmp	.L28711
	.p2align 6,,7
.L32536:
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L28786
	movl	$-1, 24(%rbx)
	jmp	.L28805
.L28786:
	testl	%eax, %eax
	jns	.L28808
	movl	24(%rdx), %eax
	testl	%eax, %eax
	js	.L32543
	movq	8(%rdx), %rcx
	movq	(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, 8(%rdx)
	je	.L28796
	movq	%rdx, 16(%rax)
.L28796:
	movq	8(%rcx), %rax
	movq	%rdx, (%rcx)
	testq	%rax, %rax
	movq	%rax, (%rbx)
	je	.L28797
	movq	%rbx, 16(%rax)
.L28797:
	movl	24(%rcx), %eax
	xorl	%r10d, %r10d
	movq	%rbx, 8(%rcx)
	shrl	$31, %eax
	movl	%eax, 24(%rbx)
	cmpl	$0, 24(%rcx)
	setle	%r10b
	decl	%r10d
	movl	%r10d, 24(%rdx)
	jmp	.L32098
.L32543:
	movq	8(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, (%rbx)
	je	.L28790
	movq	%rbx, 16(%rax)
.L28790:
	movq	%rbx, 8(%rdx)
	jmp	.L32097
.L28754:
	movq	40(%r15), %rdx
	testb	$1, 17(%rdx)
	jne	.L32544
.L28756:
	movq	-480(%rbp), %rbx
	movq	%rbx, 40(%r15)
	jmp	.L28711
.L32544:
	movl	$.LC165, %esi
	xorl	%eax, %eax
	movl	$.LC42, %edi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rsi
	xorl	%r12d, %r12d
	cmpq	%rsi, %r8
	movq	%r8, %rbx
	movq	%rsi, %r13
	jae	.L30917
.L28763:
	cmpl	$3, (%rbx)
	je	.L32545
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L28759:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L28763
.L30917:
	movslq	%r12d,%rcx
	movq	%r8, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, -504(%rbp)
	movq	%rsp, %rbx
	jae	.L30919
.L28777:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32546
	cmpl	$2, %eax
	je	.L32547
.L28771:
	movq	8(%r12), %r13
	movzbl	(%r13), %r8d
	leaq	1(%r13), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L28767
.L28776:
	movzbl	(%rcx), %r9d
	incq	%rbx
	incq	%rcx
	testb	%r9b, %r9b
	movb	%r9b, (%rbx)
	jne	.L28776
.L28767:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L28777
.L30919:
	movb	$0, (%rbx)
	movq	-504(%rbp), %rsi
	cmpb	$0, (%rsi)
	je	.L28756
	movl	$.LC142, %edi
	xorl	%eax, %eax
	call	warning
	jmp	.L28756
.L32547:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L28771
.L32546:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L28767
.L32545:
	addl	$25, %r12d
	jmp	.L28759
	.p2align 6,,7
.L32535:
	movq	constructor_pending_elts(%rip), %rax
	testq	%rax, %rax
	je	.L28748
	movq	%rax, %r15
.L28747:
	movq	32(%r15), %rsi
	movq	%r13, %rdi
	movq	%r15, %rbx
	movq	%r15, %r12
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L32548
.L28714:
	movq	(%r12), %r15
	testq	%r15, %r15
	jne	.L28747
	jmp	.L28748
.L32548:
	movq	32(%r15), %rdi
	movq	%r13, %rsi
	leaq	8(%r15), %r12
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L28714
	movq	40(%r15), %r13
	testb	$1, 17(%r13)
	jne	.L32549
.L28721:
	movq	-480(%rbp), %r12
	movq	%r12, 40(%r15)
	jmp	.L28711
.L32549:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r13
	jae	.L30911
.L28728:
	cmpl	$3, (%rbx)
	je	.L32550
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L28724:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L28728
.L30911:
	movslq	%r12d,%r9
	movq	%r8, %r12
	addq	$16, %r9
	andq	$-16, %r9
	subq	%r9, %rsp
	cmpq	%r13, %r8
	movq	%rsp, -488(%rbp)
	movq	%rsp, %rbx
	jae	.L30913
.L28742:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32551
	cmpl	$2, %eax
	je	.L32552
.L28736:
	movq	8(%r12), %r10
	movzbl	(%r10), %r11d
	leaq	1(%r10), %rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	je	.L28732
.L28741:
	movzbl	(%rcx), %edi
	incq	%rbx
	incq	%rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	jne	.L28741
.L28732:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L28742
.L30913:
	movb	$0, (%rbx)
	movq	-488(%rbp), %rcx
	cmpb	$0, (%rcx)
	je	.L28721
	movl	$.LC142, %edi
	movq	%rcx, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L28721
.L32552:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L28736
.L32551:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L28732
.L32550:
	addl	$25, %r12d
	jmp	.L28724
	.p2align 6,,7
.L28704:
	cmpb	$18, 16(%rdx)
	jne	.L28703
	movl	constructor_incremental(%rip), %r14d
	movq	constructor_index(%rip), %rsi
	testl	%r14d, %r14d
	movq	%rsi, -512(%rbp)
	jne	.L32553
.L28881:
	movq	constructor_pending_elts(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L29020
.L29021:
	xorl	%eax, %eax
	jmp	.L29019
.L29020:
	movq	-512(%rbp), %rdi
	movq	32(%rbx), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L29015
	movq	(%rbx), %rbx
.L29012:
	testq	%rbx, %rbx
	jne	.L29020
	jmp	.L29021
.L29015:
	movq	32(%rbx), %rdi
	movq	-512(%rbp), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L29017
	movq	8(%rbx), %rbx
	jmp	.L29012
.L29017:
	movq	40(%rbx), %rax
	jmp	.L29019
.L32553:
	movq	%rsi, %rdi
	movq	constructor_unfilled_index(%rip), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L28881
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L28882
	cmpb	$18, %al
	jne	.L28881
.L28882:
	movq	constructor_elements(%rip), %r8
	testq	%r8, %r8
	movq	%r8, -1256(%rbp)
	je	.L30929
.L29001:
	movq	-1256(%rbp), %r9
	xorl	%ebx, %ebx
	movl	$constructor_pending_elts, %r12d
	movq	32(%r9), %r13
	movq	24(%r9), %r14
	movq	%r13, -520(%rbp)
	cmpb	$18, 16(%rdi)
	je	.L32554
	movq	%r14, %rdi
	call	bit_position
	movq	%rax, %r15
	movq	constructor_pending_elts(%rip), %rax
	testq	%rax, %rax
	je	.L28923
	movq	%rax, %r13
.L28956:
	movq	32(%r13), %rdi
	movq	%r13, %rbx
	movq	%r13, %r12
	call	bit_position
	movq	%r15, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L28924
	cmpq	%r14, 32(%r13)
	je	.L28929
	leaq	8(%r13), %r12
.L28924:
	movq	(%r12), %r10
	testq	%r10, %r10
	movq	%r10, %r13
	jne	.L28956
.L28923:
	movl	$48, %edi
	call	ggc_alloc
	testq	%rbx, %rbx
	movq	-520(%rbp), %r13
	movq	%rax, (%r12)
	movq	%rax, %rdx
	movq	%r14, 32(%rax)
	movq	%rbx, 16(%rax)
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	%r13, 40(%rax)
	movl	$0, 24(%rax)
	je	.L28886
.L29000:
	cmpq	(%rbx), %rdx
	je	.L32555
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L28981
	movl	$1, 24(%rbx)
.L28980:
	movq	%rbx, %rdx
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L29000
.L28886:
	movq	-1256(%rbp), %rsi
	movq	(%rsi), %rbx
	testq	%rbx, %rbx
	movq	%rbx, -1256(%rbp)
	je	.L32556
	movq	constructor_type(%rip), %rdi
	jmp	.L29001
.L32556:
	movq	constructor_type(%rip), %rdi
.L30929:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	je	.L32557
	cmpb	$18, 16(%rdi)
	je	.L32558
.L29008:
	movl	$0, constructor_incremental(%rip)
	jmp	.L28881
.L32558:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32559
	movq	global_trees+136(%rip), %rax
.L31932:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L29008
.L32559:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31932
	.p2align 6,,7
.L32557:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L29008
	testb	$2, 53(%rax)
	je	.L29008
	cmpq	$0, 72(%rax)
	jne	.L29008
.L29007:
	movq	constructor_unfilled_fields(%rip), %rdx
	movq	(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L29008
	testb	$2, 53(%rax)
	je	.L29008
	cmpq	$0, 72(%rax)
	jne	.L29008
	jmp	.L29007
.L28981:
	testl	%eax, %eax
	jle	.L28983
	movl	24(%rdx), %eax
	testl	%eax, %eax
	jle	.L28984
	movq	(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, 8(%rbx)
	je	.L28985
	movq	%rbx, 16(%rax)
.L28985:
	movq	%rbx, (%rdx)
.L32099:
	movq	16(%rbx), %rax
	movl	$0, 24(%rbx)
	movq	%rdx, 16(%rbx)
	movl	$0, 24(%rdx)
	testq	%rax, %rax
	movq	%rax, 16(%rdx)
	je	.L28986
	cmpq	%rbx, (%rax)
	je	.L32560
	movq	%rdx, 8(%rax)
	jmp	.L28886
.L32560:
	movq	%rdx, (%rax)
	jmp	.L28886
	.p2align 6,,7
.L28986:
	movq	%rdx, constructor_pending_elts(%rip)
	jmp	.L28886
.L28984:
	movq	(%rdx), %rcx
	movq	8(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, (%rdx)
	je	.L28991
	movq	%rdx, 16(%rax)
.L28991:
	movq	(%rcx), %rax
	movq	%rdx, 8(%rcx)
	testq	%rax, %rax
	movq	%rax, 8(%rbx)
	je	.L28992
	movq	%rbx, 16(%rax)
.L28992:
	movl	24(%rcx), %eax
	xorl	%r12d, %r12d
	movq	%rbx, (%rcx)
	shrl	$31, %eax
	movl	%eax, 24(%rdx)
	cmpl	$0, 24(%rcx)
	setle	%r12b
	decl	%r12d
	movl	%r12d, 24(%rbx)
.L32100:
	movq	16(%rbx), %rax
	movl	$0, 24(%rcx)
	movq	%rcx, 16(%rbx)
	movq	%rcx, 16(%rdx)
	testq	%rax, %rax
	movq	%rax, 16(%rcx)
	je	.L28995
	cmpq	%rbx, (%rax)
	je	.L32561
	movq	%rcx, 8(%rax)
	jmp	.L28886
.L32561:
	movq	%rcx, (%rax)
	jmp	.L28886
.L28995:
	movq	%rcx, constructor_pending_elts(%rip)
	jmp	.L28886
	.p2align 6,,7
.L28983:
	movl	$0, 24(%rbx)
	jmp	.L28886
	.p2align 6,,7
.L32555:
	movl	24(%rbx), %eax
	testl	%eax, %eax
	jne	.L28961
	movl	$-1, 24(%rbx)
	jmp	.L28980
.L28961:
	testl	%eax, %eax
	jns	.L28983
	movl	24(%rdx), %r15d
	testl	%r15d, %r15d
	js	.L32562
	movq	8(%rdx), %rcx
	movq	(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, 8(%rdx)
	je	.L28971
	movq	%rdx, 16(%rax)
.L28971:
	movq	8(%rcx), %rax
	movq	%rdx, (%rcx)
	testq	%rax, %rax
	movq	%rax, (%rbx)
	je	.L28972
	movq	%rbx, 16(%rax)
.L28972:
	movl	24(%rcx), %eax
	xorl	%edi, %edi
	movq	%rbx, 8(%rcx)
	shrl	$31, %eax
	movl	%eax, 24(%rbx)
	cmpl	$0, 24(%rcx)
	setle	%dil
	decl	%edi
	movl	%edi, 24(%rdx)
	jmp	.L32100
.L32562:
	movq	8(%rdx), %rax
	testq	%rax, %rax
	movq	%rax, (%rbx)
	je	.L28965
	movq	%rbx, 16(%rax)
.L28965:
	movq	%rbx, 8(%rdx)
	jmp	.L32099
	.p2align 6,,7
.L28929:
	movq	40(%r13), %r12
	testb	$1, 17(%r12)
	jne	.L32563
.L28931:
	movq	-520(%rbp), %r11
	movq	%r11, 40(%r13)
	jmp	.L28886
.L32563:
	movl	$.LC165, %esi
	xorl	%eax, %eax
	movl	$.LC42, %edi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rsi
	xorl	%r12d, %r12d
	cmpq	%rsi, %r8
	movq	%r8, %rbx
	movq	%rsi, %r14
	jae	.L30938
.L28938:
	cmpl	$3, (%rbx)
	je	.L32564
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L28934:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L28938
.L30938:
	movslq	%r12d,%rcx
	movq	%r8, %r12
	addq	$16, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
	cmpq	%r14, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L30940
.L28952:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32565
	cmpl	$2, %eax
	je	.L32566
.L28946:
	movq	8(%r12), %r8
	movzbl	(%r8), %r14d
	leaq	1(%r8), %rcx
	testb	%r14b, %r14b
	movb	%r14b, (%rbx)
	je	.L28942
.L28951:
	movzbl	(%rcx), %r9d
	incq	%rbx
	incq	%rcx
	testb	%r9b, %r9b
	movb	%r9b, (%rbx)
	jne	.L28951
.L28942:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L28952
.L30940:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	je	.L28931
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L28931
	.p2align 6,,7
.L32566:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L28946
.L32565:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L28942
	.p2align 6,,7
.L32564:
	addl	$25, %r12d
	jmp	.L28934
.L32554:
	movq	constructor_pending_elts(%rip), %rax
	testq	%rax, %rax
	je	.L28923
	movq	%rax, %r13
.L28922:
	movq	32(%r13), %rsi
	movq	%r14, %rdi
	movq	%r13, %rbx
	movq	%r13, %r12
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L32567
.L28889:
	movq	(%r12), %r13
	testq	%r13, %r13
	jne	.L28922
	jmp	.L28923
.L32567:
	movq	32(%r13), %rdi
	movq	%r14, %rsi
	leaq	8(%r13), %r12
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L28889
	movq	40(%r13), %r11
	testb	$1, 17(%r11)
	jne	.L32568
.L28896:
	movq	-520(%rbp), %rax
	movq	%rax, 40(%r13)
	jmp	.L28886
.L32568:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r15
	xorl	%r12d, %r12d
	cmpq	%r15, %r8
	movq	%r8, %rbx
	movq	%r15, %r14
	jae	.L30932
.L28903:
	cmpl	$3, (%rbx)
	je	.L32569
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L28899:
	addq	$16, %rbx
	cmpq	%r14, %rbx
	jb	.L28903
.L30932:
	movslq	%r12d,%rbx
	movq	%r8, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r14, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L30934
.L28917:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32570
	cmpl	$2, %eax
	je	.L32571
.L28911:
	movq	8(%r12), %rdi
	movzbl	(%rdi), %r10d
	leaq	1(%rdi), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L28907
.L28916:
	movzbl	(%rcx), %edx
	incq	%rbx
	incq	%rcx
	testb	%dl, %dl
	movb	%dl, (%rbx)
	jne	.L28916
.L28907:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L28917
.L30934:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	je	.L28896
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L28896
.L32571:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L28911
.L32570:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L28907
.L32569:
	addl	$25, %r12d
	jmp	.L28899
	.p2align 6,,7
.L32216:
	movq	constructor_index(%rip), %rdi
	xorl	%esi, %esi
	call	tree_low_cst
	movq	spelling_base(%rip), %rdi
	movq	spelling(%rip), %rcx
	movl	%eax, %r12d
	movl	spelling_size(%rip), %eax
	movq	%rcx, %rdx
	subq	%rdi, %rdx
	movq	%rdx, %rbx
	shrq	$4, %rbx
	cmpl	%eax, %ebx
	jl	.L19713
	addl	$10, %eax
	testq	%rdi, %rdi
	movl	%eax, spelling_size(%rip)
	jne	.L19714
	movslq	%eax,%rdi
	salq	$4, %rdi
	call	xmalloc
.L31514:
	movslq	%ebx,%rcx
	movq	%rax, spelling_base(%rip)
	salq	$4, %rcx
	addq	spelling_base(%rip), %rcx
	movq	%rcx, spelling(%rip)
.L19713:
	movl	%r12d, 8(%rcx)
	movl	$3, (%rcx)
	movq	-760(%rbp), %r12
	addq	$16, %rcx
	movq	%rcx, spelling(%rip)
	movq	constructor_index(%rip), %rcx
	movq	%rcx, -800(%rbp)
	movq	8(%r12), %rdi
	movzbl	16(%rdi), %eax
	movq	%rdi, %rdx
	cmpb	$23, %al
	je	.L19718
	cmpb	$18, %al
	je	.L32572
.L31085:
	movq	global_trees(%rip), %r8
.L19717:
	cmpb	$-86, 16(%r12)
	je	.L32573
.L19816:
	cmpq	%r8, %r12
	je	.L32574
	testb	$2, 17(%r12)
	jne	.L19819
	movl	$0, constructor_constant(%rip)
.L19818:
	movl	require_constant_value(%rip), %ecx
	testl	%ecx, %ecx
	je	.L19823
	testb	$2, 17(%r12)
	je	.L32575
.L19823:
	movl	require_constant_elements(%rip), %r10d
	testl	%r10d, %r10d
	jne	.L32576
.L19848:
	cmpq	$0, -800(%rbp)
	je	.L19850
	movq	-800(%rbp), %r9
	movq	8(%r9), %rax
	cmpq	global_trees(%rip), %rax
	je	.L19852
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32577
.L19850:
	movl	require_constant_value(%rip), %edx
	movl	require_constant_elements(%rip), %ecx
	movq	%r14, %rdi
	movq	%r12, %rsi
	call	digest_init
	cmpq	global_trees(%rip), %rax
	movq	%rax, %r15
	je	.L32578
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L32579
.L19854:
	cmpb	$20, 16(%rdi)
	je	.L32580
.L19875:
	cmpb	$21, 16(%rdi)
	je	.L32581
.L19874:
	cmpq	$0, -800(%rbp)
	je	.L19942
	movq	-800(%rbp), %rdx
	cmpb	$25, 16(%rdx)
	je	.L32582
.L19942:
	movq	-800(%rbp), %rdi
	movq	constructor_elements(%rip), %rdx
	movq	%r15, %rsi
	call	tree_cons
	movq	constructor_type(%rip), %r15
	movq	%rax, constructor_elements(%rip)
	movzbl	16(%r15), %eax
	cmpb	$18, %al
	je	.L32583
	cmpb	$20, %al
	je	.L32584
	cmpb	$21, 16(%r15)
	je	.L32585
.L19944:
	movl	$1, %esi
	testl	%esi, %esi
	je	.L19852
	xorl	%r15d, %r15d
	movq	constructor_pending_elts(%rip), %rbx
.L19954:
	xorl	%r14d, %r14d
	testq	%rbx, %rbx
	je	.L19956
.L19990:
	movq	constructor_type(%rip), %rcx
	movzbl	16(%rcx), %eax
	cmpb	$18, %al
	je	.L32586
	subb	$20, %al
	cmpb	$1, %al
	ja	.L19955
	movq	constructor_unfilled_fields(%rip), %rdi
	testq	%rdi, %rdi
	je	.L19956
	call	bit_position
	movq	32(%rbx), %rdi
	movq	%rax, %r13
	call	bit_position
	movq	%r13, %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L19976
	movq	32(%rbx), %r8
	movq	40(%rbx), %rdi
	movq	%r8, constructor_unfilled_fields(%rip)
	movq	8(%r8), %rsi
	movq	%r8, %rdx
.L31530:
	xorl	%ecx, %ecx
	call	output_init_element
.L19955:
	testq	%rbx, %rbx
	jne	.L19990
.L19956:
	testl	%r15d, %r15d
	je	.L19852
	testq	%r14, %r14
	je	.L19852
	movq	constructor_type(%rip), %r10
	movzbl	16(%r10), %edx
	leal	-20(%rdx), %r11d
	cmpb	$1, %r11b
	jbe	.L32587
	cmpb	$18, %dl
	jne	.L19954
	movq	%r14, constructor_unfilled_index(%rip)
	jmp	.L19954
.L32587:
	movq	%r14, constructor_unfilled_fields(%rip)
	jmp	.L19954
	.p2align 6,,7
.L19852:
	movslq	constructor_depth(%rip),%rbx
	salq	$4, %rbx
	addq	spelling_base(%rip), %rbx
	movq	%rbx, spelling(%rip)
	jmp	.L20025
.L19976:
	movq	%r13, %rdi
	movq	%r12, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L19978
.L31970:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L19979
.L31529:
	movq	%rax, %rbx
	jmp	.L19955
.L19979:
	movq	32(%rbx), %r14
	jmp	.L19956
	.p2align 6,,7
.L19978:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L31529
	movq	16(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L19985
	cmpq	%rbx, 8(%rax)
	je	.L19988
.L19985:
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L19956
	movq	32(%rax), %rdi
	call	bit_position
	movq	%r13, %rdi
	movq	%rax, %rsi
.L31971:
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L19955
	jmp	.L19979
	.p2align 6,,7
.L19988:
	movq	16(%rdx), %rax
	movq	%rdx, %rbx
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L19985
	cmpq	%rbx, 8(%rax)
	je	.L19988
	jmp	.L19985
	.p2align 6,,7
.L32586:
	movq	32(%rbx), %rdi
	movq	constructor_unfilled_index(%rip), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L19959
	movq	constructor_type(%rip), %r13
	movq	40(%rbx), %rdi
	movq	constructor_unfilled_index(%rip), %rdx
	movq	8(%r13), %rsi
	jmp	.L31530
.L19959:
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%rbx), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L31970
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L31529
	movq	16(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L19968
	cmpq	%rbx, 8(%rax)
	je	.L19971
.L19968:
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L19956
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%rax), %rsi
	jmp	.L31971
.L19971:
	movq	16(%rdx), %rax
	movq	%rdx, %rbx
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L19968
	cmpq	%rbx, 8(%rax)
	je	.L19971
	jmp	.L19968
.L32585:
	movq	$0, constructor_unfilled_fields(%rip)
	jmp	.L19944
.L32584:
	movq	constructor_unfilled_fields(%rip), %r14
	movq	(%r14), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L19944
	testb	$2, 53(%rax)
	je	.L19944
	cmpq	$0, 72(%rax)
	jne	.L19944
.L19950:
	movq	constructor_unfilled_fields(%rip), %r12
	movq	(%r12), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L19944
	testb	$2, 53(%rax)
	je	.L19944
	cmpq	$0, 72(%rax)
	jne	.L19944
	jmp	.L19950
.L32583:
	movq	constructor_unfilled_index(%rip), %rsi
	movq	global_trees+144(%rip), %rdx
	movl	$59, %edi
	call	size_binop
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L19944
.L32582:
	movq	%rdx, %rdi
	call	copy_node
	movq	%rax, -800(%rbp)
	jmp	.L19942
.L32581:
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	je	.L19874
	movq	32(%rax), %rdx
	testb	$1, 17(%rdx)
	jne	.L32588
.L19917:
	movq	$0, constructor_elements(%rip)
	jmp	.L19874
.L32588:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r13
	jae	.L29953
.L19924:
	cmpl	$3, (%rbx)
	je	.L32589
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L19920:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L19924
.L29953:
	movslq	%r12d,%r11
	movq	%r8, %r12
	addq	$16, %r11
	andq	$-16, %r11
	subq	%r11, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L29955
.L19938:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32590
	cmpl	$2, %eax
	je	.L32591
.L19932:
	movq	8(%r12), %r9
	movzbl	(%r9), %r10d
	leaq	1(%r9), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L19928
.L19937:
	movzbl	(%rcx), %edi
	incq	%rbx
	incq	%rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	jne	.L19937
.L19928:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L19938
.L29955:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L19917
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L19917
.L32591:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L19932
.L32590:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L19928
.L32589:
	addl	$25, %r12d
	jmp	.L19920
.L32580:
	movl	constructor_incremental(%rip), %ecx
	testl	%ecx, %ecx
	je	.L19877
	movq	constructor_unfilled_fields(%rip), %rax
	cmpq	%rax, -800(%rbp)
	je	.L19875
	testq	%rax, %rax
	jne	.L19878
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L19885
.L29947:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	je	.L32592
.L19905:
	cmpb	$18, 16(%rdi)
	je	.L32593
.L19911:
	movl	$0, constructor_incremental(%rip)
.L19877:
	movq	-800(%rbp), %rdi
	movq	%r15, %rsi
	call	add_pending_init
	jmp	.L19852
.L32593:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32594
	movq	global_trees+136(%rip), %rax
.L31528:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L19911
.L32594:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31528
.L32592:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L19911
	testb	$2, 53(%rax)
	je	.L19911
	cmpq	$0, 72(%rax)
	jne	.L19911
.L19891:
	movq	constructor_unfilled_fields(%rip), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L19911
	testb	$2, 53(%rax)
	je	.L19911
	cmpq	$0, 72(%rax)
	jne	.L19911
	jmp	.L19891
.L19885:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L19885
	movq	constructor_type(%rip), %rdi
	jmp	.L29947
.L19878:
	movq	-800(%rbp), %rdi
	call	bit_position
	movq	constructor_unfilled_fields(%rip), %rdi
	movq	%rax, %r13
	call	bit_position
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L19877
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L19898
	cmpb	$18, %al
	jne	.L19877
.L19898:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L19904
.L29950:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L19905
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L19911
	testb	$2, 53(%rax)
	je	.L19911
	cmpq	$0, 72(%rax)
	jne	.L19911
.L19910:
	movq	constructor_unfilled_fields(%rip), %r8
	movq	(%r8), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L19911
	testb	$2, 53(%rax)
	je	.L19911
	cmpq	$0, 72(%rax)
	jne	.L19911
	jmp	.L19910
.L19904:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L19904
	movq	constructor_type(%rip), %rdi
	jmp	.L29950
.L32579:
	movl	constructor_incremental(%rip), %r14d
	testl	%r14d, %r14d
	je	.L19877
	movq	-800(%rbp), %rdi
	movq	constructor_unfilled_index(%rip), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jne	.L31093
	movl	constructor_incremental(%rip), %r12d
	testl	%r12d, %r12d
	je	.L19877
	movq	-800(%rbp), %rdi
	movq	constructor_unfilled_index(%rip), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L19877
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L19857
	cmpb	$18, %al
	jne	.L19877
.L19857:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L19863
.L29944:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L19905
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L19911
	testb	$2, 53(%rax)
	je	.L19911
	cmpq	$0, 72(%rax)
	jne	.L19911
.L19869:
	movq	constructor_unfilled_fields(%rip), %rsi
	movq	(%rsi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L19911
	testb	$2, 53(%rax)
	je	.L19911
	cmpq	$0, 72(%rax)
	jne	.L19911
	jmp	.L19869
.L19863:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L19863
	movq	constructor_type(%rip), %rdi
	jmp	.L29944
.L31093:
	movq	constructor_type(%rip), %rdi
	jmp	.L19854
.L32578:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L19852
.L32577:
	call	integer_zerop
	testl	%eax, %eax
	je	.L19850
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L19852
	movq	-800(%rbp), %r13
	cmpq	$0, (%r13)
	jne	.L19852
	jmp	.L19850
.L32576:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L19848
	movl	$.LC148, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L19848
.L32575:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC146, %esi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r13
	jae	.L29939
.L19830:
	cmpl	$3, (%rbx)
	je	.L32595
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L19826:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L19830
.L29939:
	movslq	%r12d,%rbx
	movq	%r8, %r12
	addq	$16, %rbx
	andq	$-16, %rbx
	subq	%rbx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L29941
.L19844:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32596
	cmpl	$2, %eax
	je	.L32597
.L19838:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %r8d
	leaq	1(%rdx), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L19834
.L19843:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L19843
.L19834:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L19844
.L29941:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	jne	.L32598
.L19847:
	movq	global_trees(%rip), %r12
	jmp	.L19848
.L32598:
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L19847
.L32597:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L19838
.L32596:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L19834
.L32595:
	addl	$25, %r12d
	jmp	.L19826
.L19819:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	je	.L19822
	movq	constructor_type(%rip), %rsi
	movzbl	16(%rsi), %r13d
	subb	$20, %r13b
	cmpb	$1, %r13b
	ja	.L19818
	movq	-800(%rbp), %r15
	testb	$2, 53(%r15)
	je	.L19818
	cmpb	$25, 16(%r12)
	je	.L19818
.L19822:
	movl	$0, constructor_simple(%rip)
	jmp	.L19818
.L32574:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L19818
.L32573:
	movl	require_constant_value(%rip), %edx
	testl	%edx, %edx
	je	.L19816
	movl	flag_isoc99(%rip), %r11d
	testl	%r11d, %r11d
	jne	.L19816
	movl	$1, %r10d
	testl	%r10d, %r10d
	je	.L19816
	movq	32(%r12), %rdi
	movq	32(%rdi), %r9
	movq	104(%r9), %r12
	jmp	.L19816
.L32572:
	cmpb	$29, 16(%r12)
	je	.L32599
.L19719:
	movq	128(%rdx), %rdi
	movq	128(%r14), %rsi
	call	comptypes
	testl	%eax, %eax
	jne	.L31085
	movq	-760(%rbp), %rax
	movq	8(%rax), %rdi
.L19718:
	movzbl	16(%rdi), %r13d
	movq	%rdi, %rbx
	cmpl	$23, %r13d
	je	.L19721
	cmpl	$18, %r13d
	je	.L19721
	movq	-760(%rbp), %rcx
	movzbl	16(%rcx), %eax
	cmpb	$32, %al
	je	.L32600
	movl	optimize(%rip), %r8d
	testl	%r8d, %r8d
	je	.L19784
	cmpb	$34, %al
	je	.L32601
.L19784:
	movzbl	16(%r12), %ecx
	movq	%r12, %rdx
	cmpb	$116, %cl
	je	.L31092
	cmpb	$115, %cl
	je	.L32602
.L19793:
	movzbl	%cl, %edi 
	movzbl	tree_code_type(%rdi), %eax
	cmpb	$60, %al
	je	.L19798
	cmpb	$49, %al
	je	.L19798
	cmpb	$50, %al
	je	.L19798
	cmpb	$101, %al
	je	.L19798
.L19797:
	cmpl	$10, %r13d
	je	.L32603
	cmpb	$39, %cl
	je	.L32604
.L19806:
	movq	%rbx, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L19811
	testb	$32, 17(%rbx)
	je	.L19812
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L19813
	movzwl	60(%rbx), %r8d
	movq	integer_types+40(%rip), %rbx
	movzwl	60(%rbx), %ecx
	andl	$511, %r8d
	andl	$511, %ecx
	cmpl	%ecx, %r8d
	je	.L19813
.L19812:
	movq	integer_types+40(%rip), %rdi
.L31968:
	movq	%r12, %rsi
.L31969:
	call	convert
.L31525:
	movq	%rax, %rbx
.L31516:
	movq	global_trees(%rip), %r8
.L19782:
	movq	%rbx, %r12
	jmp	.L19717
.L19813:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31968
.L19811:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L19814
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L19814
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%rbx)
	je	.L32605
.L19814:
	cmpl	$5, %r13d
	je	.L32606
.L19815:
	movq	%r12, %rbx
	jmp	.L31516
.L32606:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L31517:
	movq	global_trees(%rip), %r8
	movq	%r8, %rbx
	jmp	.L19782
.L32605:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31968
.L32604:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L19806
	movq	integer_types+40(%rip), %r15
	movq	40(%rdx), %rdi
	movzwl	60(%r15), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L19806
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L19812
	testb	$32, 17(%rbx)
	jne	.L19813
	jmp	.L19812
.L32603:
	movq	integer_types+40(%rip), %rsi
	movzwl	60(%rbx), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%rsi), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L19805
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L19804
.L19805:
	testb	$32, 17(%rbx)
	movl	$1, %eax
	cmovne	%eax, %esi
.L19804:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31968
.L19798:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L19797
.L32602:
	movq	32(%r12), %rsi
	movq	8(%r12), %r11
	cmpq	%r11, 8(%rsi)
	jne	.L19793
.L19796:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r12
	cmpb	$116, %cl
	jne	.L32607
.L31092:
	movq	32(%r12), %rsi
	jmp	.L19796
.L32607:
	cmpb	$115, %cl
	jne	.L19793
	movq	32(%rsi), %r9
	movq	8(%r12), %r10
	cmpq	%r10, 8(%r9)
	movq	%r9, %rsi
	je	.L19796
	jmp	.L19793
.L32601:
	movl	pedantic(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L19788
	movq	-760(%rbp), %rbx
	cmpb	$51, 48(%rbx)
	je	.L19788
	cmpq	$0, current_function_decl(%rip)
	je	.L19790
	movzbl	17(%rbx), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L32608
.L19790:
	movq	-760(%rbp), %rsi
.L19791:
	movq	%rsi, %r12
.L19788:
	movq	8(%r12), %rbx
	jmp	.L19784
.L32608:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L19790
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L19790
	testb	$2, 17(%rax)
	je	.L19790
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L19791
	jmp	.L19790
.L32600:
	movq	104(%rcx), %r12
	jmp	.L19784
.L19721:
	movq	-760(%rbp), %rax
	xorl	%r15d, %r15d
	movl	%r13d, %r8d
	movzbl	16(%rax), %edx
	cmpb	$116, %dl
	je	.L29935
	cmpb	$115, %dl
	je	.L32609
	movq	-760(%rbp), %rsi
	movzbl	16(%rsi), %ecx
.L19723:
	movzbl	%cl, %r9d 
	movzbl	tree_code_type(%r9), %eax
	cmpb	$60, %al
	je	.L19729
	cmpb	$49, %al
	je	.L19729
	cmpb	$50, %al
	je	.L19729
	cmpb	$101, %al
	je	.L19729
.L19728:
	cmpl	$23, %r8d
	je	.L32610
	cmpl	$18, %r8d
	jne	.L19815
	movzbl	%cl, %r8d 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%r8), %eax
	movq	8(%rdi), %r13
	cmpb	$114, %al
	je	.L19734
	cmpb	$100, %al
	je	.L19734
.L19733:
	movzbl	17(%rdi), %r8d
	movl	$1, %r9d
	movl	%r8d, %r10d
	movl	%r8d, %ebx
	shrb	$3, %r10b
	shrb	$4, %bl
	andl	$1, %r10d
	andl	%ebx, %r9d
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rdi), %r10d
	movzbl	16(%rdi), %edi
	movl	%r10d, %esi
	shrb	$5, %sil
	andl	$1, %esi
	sall	$2, %esi
	orl	%esi, %r9d
	xorl	%esi, %esi
	cmpb	$20, %dil
	je	.L32611
.L19737:
	leal	0(,%rsi,8), %ebx
	orl	%ebx, %r9d
	jne	.L19736
	testl	%edx, %edx
	jne	.L19736
	testl	%r11d, %r11d
	je	.L19735
.L19736:
	movl	%r8d, %ebx
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %bl
	movl	%r10d, %ecx
	movl	%r8d, %r9d
	andl	%ebx, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L32612
.L19739:
	leal	0(,%rcx,8), %r8d
	leal	(%r11,%r11), %edi
	orl	%r8d, %esi
	orl	%edx, %esi
	orl	%edi, %esi
	movq	%r13, %rdi
	call	c_build_qualified_type
	movzbl	16(%r12), %ecx
	movq	%rax, %r13
.L19735:
	cmpb	$41, %cl
	je	.L32613
	cmpb	$47, %cl
	je	.L32614
	xorl	%ebx, %ebx
	testl	%r15d, %r15d
	je	.L32615
.L19778:
	movl	flag_isoc99(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L19779
	testl	%ebx, %ebx
	je	.L19815
.L19779:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r12)
	movq	%rax, %rbx
	je	.L32616
	movl	$121, %edi
	movq	%r12, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L31969
.L32616:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r12, %rdx
	call	build1
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L31517
	movq	%r12, %rdi
	call	staticp
	movzbl	17(%rbx), %r12d
	movl	%eax, %ecx
	andb	$1, %cl
	addb	%cl, %cl
	andb	$-4, %r12b
	orb	%cl, %r12b
	movb	%r12b, 17(%rbx)
	jmp	.L31516
.L32615:
	movq	%r12, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebx
	jmp	.L19778
.L32614:
	movq	40(%r12), %rbx
	movq	8(%rbx), %r13
	movzbl	16(%r13), %r15d
	movq	%r13, %rax
	cmpl	$23, %r15d
	je	.L19743
	cmpl	$18, %r15d
	je	.L19743
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L32617
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L19746
	cmpb	$34, %dl
	je	.L32618
.L19746:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L31090
	cmpb	$115, %dl
	je	.L32619
.L19755:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L19760
	cmpb	$49, %al
	je	.L19760
	cmpb	$50, %al
	je	.L19760
	cmpb	$101, %al
	je	.L19760
.L19759:
	cmpl	$10, %r15d
	je	.L32620
	cmpb	$39, %dl
	je	.L32621
.L19768:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L19773
	testb	$32, 17(%r13)
	je	.L19774
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L19775
	movzwl	60(%r13), %r10d
	movq	integer_types+40(%rip), %r13
	movzwl	60(%r13), %r11d
	andl	$511, %r10d
	andl	$511, %r11d
	cmpl	%r11d, %r10d
	je	.L19775
.L19774:
	movq	integer_types+40(%rip), %rdi
.L31515:
	movq	%rbx, %rsi
	call	convert
.L19744:
	movq	8(%rax), %rsi
	movq	32(%r12), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L31525
.L19775:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31515
.L19773:
	movl	flag_traditional(%rip), %r9d
	testl	%r9d, %r9d
	je	.L19776
	movl	flag_allow_single_precision(%rip), %edi
	testl	%edi, %edi
	jne	.L19776
	movq	global_trees+192(%rip), %rsi
	cmpq	%rsi, 128(%r13)
	je	.L32622
.L19776:
	cmpl	$5, %r15d
	je	.L32623
	movq	%rbx, %rax
	jmp	.L19744
.L32623:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L19744
.L32622:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31515
.L32621:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L19768
	movq	integer_types+40(%rip), %r8
	movq	40(%rdx), %rdi
	movzwl	60(%r8), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L19768
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L19774
	testb	$32, 17(%r13)
	jne	.L19775
	jmp	.L19774
.L32620:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r15d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r15d, %r15d
	jne	.L19767
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L19766
.L19767:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L19766:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31515
.L19760:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L19759
.L32619:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rsi)
	jne	.L19755
.L19758:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L32624
.L31090:
	movq	32(%rbx), %rsi
	jmp	.L19758
.L32624:
	cmpb	$115, %dl
	jne	.L19755
	movq	32(%rsi), %rdi
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rdi)
	movq	%rdi, %rsi
	je	.L19758
	jmp	.L19755
.L32618:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L19750
	cmpb	$51, 48(%rbx)
	je	.L19750
	cmpq	$0, current_function_decl(%rip)
	je	.L19752
	movzbl	17(%rbx), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L32625
.L19752:
	movq	%rbx, %rsi
.L19753:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L19750:
	movq	%rax, %r13
	jmp	.L19746
.L32625:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L19752
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L19752
	testb	$2, 17(%rax)
	je	.L19752
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L19753
	jmp	.L19752
.L32617:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L19746
.L19743:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L19744
.L32613:
	movq	72(%r13), %rdi
	movq	32(%r12), %rsi
	jmp	.L31969
.L32612:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L19739
.L32611:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L19737
.L19734:
	movzbl	17(%r12), %ebx
	movl	$1, %r11d
	movl	%ebx, %edx
	shrb	$3, %bl
	shrb	$4, %dl
	andl	%ebx, %r11d
	andl	$1, %edx
	jmp	.L19733
.L32610:
	movl	$121, %edi
	movq	%r12, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L31525
.L19729:
	movq	-760(%rbp), %rdx
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L19728
.L32609:
	movq	32(%rax), %r13
	cmpq	%rdi, 8(%r13)
	je	.L29935
	movl	$115, %ecx
	jmp	.L19723
.L29935:
	movq	-760(%rbp), %r12
	movl	%edx, %ecx
	movq	32(%r12), %rsi
.L19727:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r12
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r15d
	cmpb	$116, %cl
	jne	.L32626
	movq	32(%r12), %rsi
	jmp	.L19727
.L32626:
	cmpb	$115, %cl
	jne	.L19723
	movq	32(%rsi), %rsi
	movq	8(%r12), %r10
	cmpq	%r10, 8(%rsi)
	je	.L19727
	jmp	.L19723
.L32599:
	cmpb	$18, 16(%r14)
	jne	.L19719
	movq	8(%r14), %rbx
	cmpb	$6, 16(%rbx)
	jne	.L19719
	jmp	.L31085
.L19714:
	movslq	%eax,%rsi
	salq	$4, %rsi
	call	xrealloc
	jmp	.L31514
	.p2align 6,,7
.L32215:
	movq	constructor_index(%rip), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L19687
	movq	constructor_max_index(%rip), %rdi
	call	integer_all_onesp
	testl	%eax, %eax
	je	.L19686
.L19687:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC168, %esi
	call	pedwarn
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r11
	xorl	%r12d, %r12d
	cmpq	%r11, %r8
	movq	%r8, %rbx
	movq	%r11, %r13
	jae	.L29931
.L19694:
	cmpl	$3, (%rbx)
	je	.L32627
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L19690:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L19694
.L29931:
	movslq	%r12d,%rsi
	movq	%r8, %r12
	addq	$16, %rsi
	andq	$-16, %rsi
	subq	%rsi, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30725
.L19708:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32628
	cmpl	$2, %eax
	je	.L32629
.L19702:
	movq	8(%r12), %r10
	movzbl	(%r10), %r8d
	leaq	1(%r10), %rcx
	testb	%r8b, %r8b
	movb	%r8b, (%rbx)
	je	.L19698
.L19707:
	movzbl	(%rcx), %r9d
	incq	%rbx
	incq	%rcx
	testb	%r9b, %r9b
	movb	%r9b, (%rbx)
	jne	.L19707
.L19698:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L19708
.L30725:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L25741
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L25741
.L32629:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L19702
.L32628:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L19698
.L32627:
	addl	$25, %r12d
	jmp	.L19690
	.p2align 6,,7
.L32214:
	movq	8(%r14), %rcx
	cmpb	$6, 16(%rcx)
	jne	.L19682
	movl	-652(%rbp), %eax
	testl	%eax, %eax
	je	.L19682
	movq	-152(%rbp), %rbx
	movq	%rbx, -760(%rbp)
	jmp	.L19683
.L19681:
	cmpb	$9, %dl
	je	.L32630
	cmpq	$0, constructor_fields(%rip)
	je	.L32631
	cmpq	$0, -760(%rbp)
	je	.L20334
	movq	-760(%rbp), %r12
	movq	$0, -816(%rbp)
	movq	8(%r12), %rbx
	movzbl	16(%rbx), %eax
	cmpb	$23, %al
	je	.L20336
	cmpb	$18, %al
	je	.L32632
.L31107:
	movq	global_trees(%rip), %r8
.L20335:
	cmpb	$-86, 16(%r12)
	je	.L32633
.L20434:
	cmpq	%r8, %r12
	je	.L32634
	testb	$2, 17(%r12)
	jne	.L20437
	movl	$0, constructor_constant(%rip)
.L20436:
	movl	require_constant_value(%rip), %r13d
	testl	%r13d, %r13d
	je	.L20441
	testb	$2, 17(%r12)
	je	.L32635
.L20441:
	movl	require_constant_elements(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L32636
.L20466:
	cmpq	$0, -816(%rbp)
	je	.L20468
	movq	8, %rax
	cmpq	global_trees(%rip), %rax
	je	.L20334
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32637
.L20468:
	movl	require_constant_value(%rip), %edx
	movl	require_constant_elements(%rip), %ecx
	movq	%r14, %rdi
	movq	%r12, %rsi
	call	digest_init
	cmpq	global_trees(%rip), %rax
	movq	%rax, %r15
	je	.L32638
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L32639
.L20472:
	cmpb	$20, 16(%rdi)
	je	.L32640
.L20493:
	cmpb	$21, 16(%rdi)
	je	.L32641
.L20492:
	cmpq	$0, -816(%rbp)
	je	.L20560
	cmpb	$25, 16
	je	.L32642
.L20560:
	movq	-816(%rbp), %rdi
	movq	constructor_elements(%rip), %rdx
	movq	%r15, %rsi
	call	tree_cons
	movq	constructor_type(%rip), %r15
	movq	%rax, constructor_elements(%rip)
	movzbl	16(%r15), %eax
	cmpb	$18, %al
	je	.L32643
	cmpb	$20, %al
	je	.L32644
	cmpb	$21, 16(%r15)
	je	.L32645
.L20562:
	movl	$1, %r14d
	testl	%r14d, %r14d
	je	.L20334
	xorl	%r15d, %r15d
	movq	constructor_pending_elts(%rip), %rbx
.L20572:
	xorl	%r14d, %r14d
	testq	%rbx, %rbx
	je	.L20574
.L20608:
	movq	constructor_type(%rip), %r12
	movzbl	16(%r12), %eax
	cmpb	$18, %al
	je	.L32646
	subb	$20, %al
	cmpb	$1, %al
	ja	.L20573
	movq	constructor_unfilled_fields(%rip), %rdi
	testq	%rdi, %rdi
	je	.L20574
	call	bit_position
	movq	32(%rbx), %rdi
	movq	%rax, %r13
	call	bit_position
	movq	%r13, %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L20594
	movq	32(%rbx), %r8
	movq	40(%rbx), %rdi
	movq	%r8, constructor_unfilled_fields(%rip)
	movq	8(%r8), %rsi
	movq	%r8, %rdx
.L31562:
	xorl	%ecx, %ecx
	call	output_init_element
.L20573:
	testq	%rbx, %rbx
	jne	.L20608
.L20574:
	testl	%r15d, %r15d
	je	.L20334
	testq	%r14, %r14
	je	.L20334
	movq	constructor_type(%rip), %r10
	movzbl	16(%r10), %edx
	leal	-20(%rdx), %esi
	cmpb	$1, %sil
	jbe	.L32647
	cmpb	$18, %dl
	jne	.L20572
	movq	%r14, constructor_unfilled_index(%rip)
	jmp	.L20572
.L32647:
	movq	%r14, constructor_unfilled_fields(%rip)
	jmp	.L20572
.L20334:
	movq	$0, constructor_fields(%rip)
	jmp	.L19358
	.p2align 6,,7
.L20594:
	movq	%r13, %rdi
	movq	%r12, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20596
.L31978:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L20597
.L31561:
	movq	%rax, %rbx
	jmp	.L20573
.L20597:
	movq	32(%rbx), %r14
	jmp	.L20574
.L20596:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L31561
	movq	16(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20603
	cmpq	%rbx, 8(%rax)
	je	.L20606
.L20603:
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L20574
	movq	32(%rax), %rdi
	call	bit_position
	movq	%r13, %rdi
	movq	%rax, %rsi
.L31979:
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20573
	jmp	.L20597
.L20606:
	movq	16(%rdx), %rax
	movq	%rdx, %rbx
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20603
	cmpq	%rbx, 8(%rax)
	je	.L20606
	jmp	.L20603
.L32646:
	movq	32(%rbx), %rdi
	movq	constructor_unfilled_index(%rip), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L20577
	movq	constructor_type(%rip), %r13
	movq	40(%rbx), %rdi
	movq	constructor_unfilled_index(%rip), %rdx
	movq	8(%r13), %rsi
	jmp	.L31562
.L20577:
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%rbx), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L31978
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L31561
	movq	16(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20586
	cmpq	%rbx, 8(%rax)
	je	.L20589
.L20586:
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L20574
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%rax), %rsi
	jmp	.L31979
.L20589:
	movq	16(%rdx), %rax
	movq	%rdx, %rbx
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20586
	cmpq	%rbx, 8(%rax)
	je	.L20589
	jmp	.L20586
.L32645:
	movq	$0, constructor_unfilled_fields(%rip)
	jmp	.L20562
.L32644:
	movq	constructor_unfilled_fields(%rip), %rcx
	movq	(%rcx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20562
	testb	$2, 53(%rax)
	je	.L20562
	cmpq	$0, 72(%rax)
	jne	.L20562
.L20568:
	movq	constructor_unfilled_fields(%rip), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20562
	testb	$2, 53(%rax)
	je	.L20562
	cmpq	$0, 72(%rax)
	jne	.L20562
	jmp	.L20568
.L32643:
	movq	constructor_unfilled_index(%rip), %rsi
	movq	global_trees+144(%rip), %rdx
	movl	$59, %edi
	call	size_binop
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L20562
.L32642:
	xorl	%edi, %edi
	call	copy_node
	movq	%rax, -816(%rbp)
	jmp	.L20560
.L32641:
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	je	.L20492
	movq	32(%rax), %rsi
	testb	$1, 17(%rsi)
	jne	.L32648
.L20535:
	movq	$0, constructor_elements(%rip)
	jmp	.L20492
.L32648:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r10
	xorl	%r12d, %r12d
	cmpq	%r10, %r8
	movq	%r8, %rbx
	movq	%r10, %r13
	jae	.L30015
.L20542:
	cmpl	$3, (%rbx)
	je	.L32649
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L20538:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L20542
.L30015:
	movslq	%r12d,%rdx
	movq	%r8, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30017
.L20556:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32650
	cmpl	$2, %eax
	je	.L32651
.L20550:
	movq	8(%r12), %rdi
	movzbl	(%rdi), %r11d
	leaq	1(%rdi), %rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	je	.L20546
.L20555:
	movzbl	(%rcx), %r9d
	incq	%rbx
	incq	%rcx
	testb	%r9b, %r9b
	movb	%r9b, (%rbx)
	jne	.L20555
.L20546:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L20556
.L30017:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L20535
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L20535
.L32651:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L20550
.L32650:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L20546
.L32649:
	addl	$25, %r12d
	jmp	.L20538
.L32640:
	movl	constructor_incremental(%rip), %eax
	testl	%eax, %eax
	je	.L20495
	movq	constructor_unfilled_fields(%rip), %rax
	cmpq	%rax, -816(%rbp)
	je	.L20493
	testq	%rax, %rax
	jne	.L20496
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L20503
.L30009:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	je	.L32652
.L20523:
	cmpb	$18, 16(%rdi)
	je	.L32653
.L20529:
	movl	$0, constructor_incremental(%rip)
.L20495:
	xorl	%edi, %edi
	movq	%r15, %rsi
	call	add_pending_init
	jmp	.L20334
.L32653:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L32654
	movq	global_trees+136(%rip), %rax
.L31560:
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L20529
.L32654:
	movq	sizetype_tab+24(%rip), %rdi
	movq	104(%rax), %rsi
	call	convert
	jmp	.L31560
.L32652:
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20529
	testb	$2, 53(%rax)
	je	.L20529
	cmpq	$0, 72(%rax)
	jne	.L20529
.L20509:
	movq	constructor_unfilled_fields(%rip), %r9
	movq	(%r9), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20529
	testb	$2, 53(%rax)
	je	.L20529
	cmpq	$0, 72(%rax)
	jne	.L20529
	jmp	.L20509
.L20503:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L20503
	movq	constructor_type(%rip), %rdi
	jmp	.L30009
.L20496:
	xorl	%edi, %edi
	call	bit_position
	movq	constructor_unfilled_fields(%rip), %rdi
	movq	%rax, %r13
	call	bit_position
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20495
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L20516
	cmpb	$18, %al
	jne	.L20495
.L20516:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L20522
.L30012:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L20523
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20529
	testb	$2, 53(%rax)
	je	.L20529
	cmpq	$0, 72(%rax)
	jne	.L20529
.L20528:
	movq	constructor_unfilled_fields(%rip), %r8
	movq	(%r8), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20529
	testb	$2, 53(%rax)
	je	.L20529
	cmpq	$0, 72(%rax)
	jne	.L20529
	jmp	.L20528
.L20522:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L20522
	movq	constructor_type(%rip), %rdi
	jmp	.L30012
.L32639:
	movl	constructor_incremental(%rip), %r14d
	testl	%r14d, %r14d
	je	.L20495
	movq	constructor_unfilled_index(%rip), %rsi
	xorl	%edi, %edi
	call	tree_int_cst_equal
	testl	%eax, %eax
	jne	.L31115
	movl	constructor_incremental(%rip), %r12d
	testl	%r12d, %r12d
	je	.L20495
	movq	constructor_unfilled_index(%rip), %rsi
	xorl	%edi, %edi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20495
	movq	constructor_type(%rip), %rdi
	movzbl	16(%rdi), %eax
	cmpb	$20, %al
	je	.L20475
	cmpb	$18, %al
	jne	.L20495
.L20475:
	movq	constructor_elements(%rip), %rbx
	testq	%rbx, %rbx
	jne	.L20481
.L30006:
	cmpb	$20, 16(%rdi)
	movq	$0, constructor_elements(%rip)
	jne	.L20523
	movq	24(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20529
	testb	$2, 53(%rax)
	je	.L20529
	cmpq	$0, 72(%rax)
	jne	.L20529
.L20487:
	movq	constructor_unfilled_fields(%rip), %rdi
	movq	(%rdi), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20529
	testb	$2, 53(%rax)
	je	.L20529
	cmpq	$0, 72(%rax)
	jne	.L20529
	jmp	.L20487
.L20481:
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	call	add_pending_init
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L20481
	movq	constructor_type(%rip), %rdi
	jmp	.L30006
.L31115:
	movq	constructor_type(%rip), %rdi
	jmp	.L20472
.L32638:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L20334
.L32637:
	call	integer_zerop
	testl	%eax, %eax
	je	.L20468
	movq	constructor_type(%rip), %rbx
	cmpb	$18, 16(%rbx)
	je	.L20334
	cmpq	$0, 0
	jne	.L20334
	jmp	.L20468
.L32636:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	jne	.L20466
	movl	$.LC148, %edi
	xorl	%eax, %eax
	call	pedwarn
	jmp	.L20466
.L32635:
	movl	$.LC146, %esi
	xorl	%eax, %eax
	movl	$.LC42, %edi
	call	error
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rsi
	xorl	%r12d, %r12d
	cmpq	%rsi, %r8
	movq	%r8, %rbx
	movq	%rsi, %r13
	jae	.L30001
.L20448:
	cmpl	$3, (%rbx)
	je	.L32655
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L20444:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L20448
.L30001:
	movslq	%r12d,%r15
	movq	%r8, %r12
	addq	$16, %r15
	andq	$-16, %r15
	subq	%r15, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r15
	movq	%rsp, %rbx
	jae	.L30003
.L20462:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32656
	cmpl	$2, %eax
	je	.L32657
.L20456:
	movq	8(%r12), %rdx
	movzbl	(%rdx), %r10d
	leaq	1(%rdx), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L20452
.L20461:
	movzbl	(%rcx), %r11d
	incq	%rbx
	incq	%rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	jne	.L20461
.L20452:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L20462
.L30003:
	movb	$0, (%rbx)
	cmpb	$0, (%r15)
	jne	.L32658
.L20465:
	movq	global_trees(%rip), %r12
	jmp	.L20466
.L32658:
	movl	$.LC142, %edi
	movq	%r15, %rsi
	xorl	%eax, %eax
	call	error
	jmp	.L20465
.L32657:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L20456
.L32656:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L20452
.L32655:
	addl	$25, %r12d
	jmp	.L20444
.L20437:
	movq	8(%r12), %rsi
	movq	%r12, %rdi
	call	initializer_constant_valid_p
	testq	%rax, %rax
	je	.L20440
	movq	constructor_type(%rip), %r8
	movzbl	16(%r8), %r9d
	subb	$20, %r9b
	cmpb	$1, %r9b
	ja	.L20436
	testb	$2, 53
	je	.L20436
	cmpb	$25, 16(%r12)
	je	.L20436
.L20440:
	movl	$0, constructor_simple(%rip)
	jmp	.L20436
.L32634:
	movl	$1, constructor_erroneous(%rip)
	jmp	.L20436
.L32633:
	movl	require_constant_value(%rip), %eax
	testl	%eax, %eax
	je	.L20434
	movl	flag_isoc99(%rip), %eax
	testl	%eax, %eax
	jne	.L20434
	movl	$1, %edx
	testl	%edx, %edx
	je	.L20434
	movq	32(%r12), %rdi
	movq	32(%rdi), %r11
	movq	104(%r11), %r12
	jmp	.L20434
.L32632:
	cmpb	$29, 16(%r12)
	je	.L32659
.L20337:
	movq	-760(%rbp), %rax
	movq	128(%r14), %rsi
	movq	8(%rax), %r13
	movq	128(%r13), %rdi
	call	comptypes
	testl	%eax, %eax
	jne	.L31107
.L20336:
	movq	-760(%rbp), %rcx
	movq	8(%rcx), %rbx
	movzbl	16(%rbx), %r13d
	cmpl	$23, %r13d
	je	.L20339
	cmpl	$18, %r13d
	je	.L20339
	movq	-760(%rbp), %rcx
	movzbl	16(%rcx), %eax
	cmpb	$32, %al
	je	.L32660
	movl	optimize(%rip), %r10d
	testl	%r10d, %r10d
	je	.L20402
	cmpb	$34, %al
	je	.L32661
.L20402:
	movzbl	16(%r12), %ecx
	movq	%r12, %rdx
	cmpb	$116, %cl
	je	.L31114
	cmpb	$115, %cl
	je	.L32662
.L20411:
	movzbl	%cl, %r8d 
	movzbl	tree_code_type(%r8), %eax
	cmpb	$60, %al
	je	.L20416
	cmpb	$49, %al
	je	.L20416
	cmpb	$50, %al
	je	.L20416
	cmpb	$101, %al
	je	.L20416
.L20415:
	cmpl	$10, %r13d
	je	.L32663
	cmpb	$39, %cl
	je	.L32664
.L20424:
	movq	%rbx, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L20429
	testb	$32, 17(%rbx)
	je	.L20430
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	jne	.L20431
	movzwl	60(%rbx), %r10d
	movq	integer_types+40(%rip), %rbx
	movzwl	60(%rbx), %ecx
	andl	$511, %r10d
	andl	$511, %ecx
	cmpl	%ecx, %r10d
	je	.L20431
.L20430:
	movq	integer_types+40(%rip), %rdi
.L31976:
	movq	%r12, %rsi
.L31977:
	call	convert
.L31557:
	movq	%rax, %rbx
.L31548:
	movq	global_trees(%rip), %r8
.L20400:
	movq	%rbx, %r12
	jmp	.L20335
.L20431:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31976
.L20429:
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L20432
	movl	flag_allow_single_precision(%rip), %eax
	testl	%eax, %eax
	jne	.L20432
	movq	global_trees+192(%rip), %rax
	cmpq	%rax, 128(%rbx)
	je	.L32665
.L20432:
	cmpl	$5, %r13d
	je	.L32666
.L20433:
	movq	%r12, %rbx
	jmp	.L31548
.L32666:
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	error
.L31549:
	movq	global_trees(%rip), %r8
	movq	%r8, %rbx
	jmp	.L20400
.L32665:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31976
.L32664:
	movq	40(%r12), %rdx
	testb	$2, 53(%rdx)
	je	.L20424
	movq	integer_types+40(%rip), %r15
	movq	40(%rdx), %rdi
	movzwl	60(%r15), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L20424
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L20430
	testb	$32, 17(%rbx)
	jne	.L20431
	jmp	.L20430
.L32663:
	movq	integer_types+40(%rip), %rsi
	movzwl	60(%rbx), %edx
	movl	flag_traditional(%rip), %r13d
	movzwl	60(%rsi), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r13d, %r13d
	jne	.L20423
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L20422
.L20423:
	testb	$32, 17(%rbx)
	movl	$1, %eax
	cmovne	%eax, %esi
.L20422:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31976
.L20416:
	movl	24(%rdx), %eax
	movl	%eax, 24(%r12)
	jmp	.L20415
.L32662:
	movq	32(%r12), %rsi
	movq	8(%r12), %r11
	cmpq	%r11, 8(%rsi)
	jne	.L20411
.L20414:
	movzbl	16(%rsi), %ecx
	movq	%rsi, %r12
	cmpb	$116, %cl
	jne	.L32667
.L31114:
	movq	32(%r12), %rsi
	jmp	.L20414
.L32667:
	cmpb	$115, %cl
	jne	.L20411
	movq	32(%rsi), %r9
	movq	8(%r12), %rdi
	cmpq	%rdi, 8(%r9)
	movq	%r9, %rsi
	je	.L20414
	jmp	.L20411
.L32661:
	movl	pedantic(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L20406
	movq	-760(%rbp), %rbx
	cmpb	$51, 48(%rbx)
	je	.L20406
	cmpq	$0, current_function_decl(%rip)
	je	.L20408
	movzbl	17(%rbx), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L32668
.L20408:
	movq	-760(%rbp), %rsi
.L20409:
	movq	%rsi, %r12
.L20406:
	movq	8(%r12), %rbx
	jmp	.L20402
.L32668:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L20408
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L20408
	testb	$2, 17(%rax)
	je	.L20408
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L20409
	jmp	.L20408
.L32660:
	movq	104(%rcx), %r12
	jmp	.L20402
.L20339:
	movq	-760(%rbp), %rcx
	xorl	%r15d, %r15d
	movl	%r13d, %edi
	movzbl	16(%rcx), %edx
	cmpb	$116, %dl
	je	.L29997
	cmpb	$115, %dl
	je	.L32669
	movq	-760(%rbp), %rdx
	movzbl	16(%rdx), %ecx
.L20341:
	movzbl	%cl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L20347
	cmpb	$49, %al
	je	.L20347
	cmpb	$50, %al
	je	.L20347
	cmpb	$101, %al
	je	.L20347
.L20346:
	cmpl	$23, %edi
	je	.L32670
	cmpl	$18, %edi
	jne	.L20433
	movzbl	%cl, %edi 
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	movzbl	tree_code_type(%rdi), %eax
	movq	8(%rbx), %r13
	cmpb	$114, %al
	je	.L20352
	cmpb	$100, %al
	je	.L20352
.L20351:
	movzbl	17(%rbx), %r8d
	movl	$1, %r9d
	movl	%r8d, %r10d
	movl	%r8d, %edi
	shrb	$3, %r10b
	shrb	$4, %dil
	andl	$1, %r10d
	andl	%edi, %r9d
	movzbl	16(%rbx), %edi
	addl	%r10d, %r10d
	orl	%r10d, %r9d
	movzbl	62(%rbx), %r10d
	movl	%r10d, %esi
	shrb	$5, %sil
	andl	$1, %esi
	sall	$2, %esi
	orl	%esi, %r9d
	xorl	%esi, %esi
	cmpb	$20, %dil
	je	.L32671
.L20355:
	leal	0(,%rsi,8), %ebx
	orl	%ebx, %r9d
	jne	.L20354
	testl	%edx, %edx
	jne	.L20354
	testl	%r11d, %r11d
	je	.L20353
.L20354:
	movl	%r8d, %ebx
	shrb	$5, %r10b
	movl	$1, %esi
	shrb	$3, %r8b
	shrb	$4, %bl
	movl	%r10d, %ecx
	movl	%r8d, %r9d
	andl	%ebx, %esi
	andl	$1, %ecx
	andl	$1, %r9d
	sall	$2, %ecx
	addl	%r9d, %r9d
	orl	%r9d, %esi
	orl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$20, %dil
	je	.L32672
.L20357:
	leal	0(,%rcx,8), %r10d
	leal	(%r11,%r11), %r8d
	movq	%r13, %rdi
	orl	%r10d, %esi
	orl	%edx, %esi
	orl	%r8d, %esi
	call	c_build_qualified_type
	movzbl	16(%r12), %ecx
	movq	%rax, %r13
.L20353:
	cmpb	$41, %cl
	je	.L32673
	cmpb	$47, %cl
	je	.L32674
	xorl	%ebx, %ebx
	testl	%r15d, %r15d
	je	.L32675
.L20396:
	movl	flag_isoc99(%rip), %r15d
	testl	%r15d, %r15d
	jne	.L20397
	testl	%ebx, %ebx
	je	.L20433
.L20397:
	movq	%r13, %rdi
	call	build_pointer_type
	cmpb	$34, 16(%r12)
	movq	%rax, %rbx
	je	.L32676
	movl	$121, %edi
	movq	%r12, %rsi
	movl	$1, %edx
	call	build_unary_op
	movq	%rbx, %rdi
	movq	%rax, %rsi
	jmp	.L31977
.L32676:
	movl	$121, %edi
	movq	%rax, %rsi
	movq	%r12, %rdx
	call	build1
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	mark_addressable
	testl	%eax, %eax
	je	.L31549
	movq	%r12, %rdi
	call	staticp
	movzbl	17(%rbx), %r12d
	movl	%eax, %ecx
	andb	$1, %cl
	addb	%cl, %cl
	andb	$-4, %r12b
	orb	%cl, %r12b
	movb	%r12b, 17(%rbx)
	jmp	.L31548
.L32675:
	movq	%r12, %rdi
	call	lvalue_p
	testl	%eax, %eax
	movl	$1, %eax
	cmovne	%eax, %ebx
	jmp	.L20396
.L32674:
	movq	40(%r12), %rbx
	movq	8(%rbx), %r13
	movzbl	16(%r13), %r15d
	movq	%r13, %rax
	cmpl	$23, %r15d
	je	.L20361
	cmpl	$18, %r15d
	je	.L20361
	movzbl	16(%rbx), %edx
	cmpb	$32, %dl
	je	.L32677
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L20364
	cmpb	$34, %dl
	je	.L32678
.L20364:
	cmpb	$116, %dl
	movq	%rbx, %rcx
	je	.L31112
	cmpb	$115, %dl
	je	.L32679
.L20373:
	movzbl	%dl, %esi 
	movzbl	tree_code_type(%rsi), %eax
	cmpb	$60, %al
	je	.L20378
	cmpb	$49, %al
	je	.L20378
	cmpb	$50, %al
	je	.L20378
	cmpb	$101, %al
	je	.L20378
.L20377:
	cmpl	$10, %r15d
	je	.L32680
	cmpb	$39, %dl
	je	.L32681
.L20386:
	movq	%r13, %rdi
	call	c_promoting_integer_type_p
	testb	%al, %al
	je	.L20391
	testb	$32, 17(%r13)
	je	.L20392
	movl	flag_traditional(%rip), %edx
	testl	%edx, %edx
	jne	.L20393
	movzwl	60(%r13), %edi
	movq	integer_types+40(%rip), %r13
	movzwl	60(%r13), %r11d
	andl	$511, %edi
	andl	$511, %r11d
	cmpl	%r11d, %edi
	je	.L20393
.L20392:
	movq	integer_types+40(%rip), %rdi
.L31547:
	movq	%rbx, %rsi
	call	convert
.L20362:
	movq	8(%rax), %rsi
	movq	32(%r12), %rdx
	movq	%rax, %rcx
	movl	$47, %edi
	xorl	%eax, %eax
	call	build
	jmp	.L31557
.L20393:
	movq	integer_types+48(%rip), %rdi
	jmp	.L31547
.L20391:
	movl	flag_traditional(%rip), %r9d
	testl	%r9d, %r9d
	je	.L20394
	movl	flag_allow_single_precision(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L20394
	movq	global_trees+192(%rip), %rsi
	cmpq	%rsi, 128(%r13)
	je	.L32682
.L20394:
	cmpl	$5, %r15d
	je	.L32683
	movq	%rbx, %rax
	jmp	.L20362
.L32683:
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	error
	movq	global_trees(%rip), %rax
	jmp	.L20362
.L32682:
	movq	global_trees+200(%rip), %rdi
	jmp	.L31547
.L32681:
	movq	40(%rbx), %rdx
	testb	$2, 53(%rdx)
	je	.L20386
	movq	integer_types+40(%rip), %r10
	movq	40(%rdx), %rdi
	movzwl	60(%r10), %esi
	andl	$511, %esi
	call	compare_tree_int
	testl	%eax, %eax
	jns	.L20386
	movl	flag_traditional(%rip), %eax
	testl	%eax, %eax
	je	.L20392
	testb	$32, 17(%r13)
	jne	.L20393
	jmp	.L20392
.L32680:
	movq	integer_types+40(%rip), %rcx
	movzwl	60(%r13), %edx
	movl	flag_traditional(%rip), %r15d
	movzwl	60(%rcx), %eax
	andl	$511, %edx
	movl	%eax, %edi
	andl	$511, %edi
	cmpl	%edx, %edi
	cmovl	%edx, %edi
	xorl	%esi, %esi
	testl	%r15d, %r15d
	jne	.L20385
	andl	$511, %eax
	cmpl	%eax, %edx
	jl	.L20384
.L20385:
	testb	$32, 17(%r13)
	movl	$1, %eax
	cmovne	%eax, %esi
.L20384:
	call	type_for_size
	movq	%rax, %rdi
	jmp	.L31547
.L20378:
	movl	24(%rcx), %eax
	movl	%eax, 24(%rbx)
	jmp	.L20377
.L32679:
	movq	32(%rbx), %rsi
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%rsi)
	jne	.L20373
.L20376:
	movzbl	16(%rsi), %edx
	movq	%rsi, %rbx
	cmpb	$116, %dl
	jne	.L32684
.L31112:
	movq	32(%rbx), %rsi
	jmp	.L20376
.L32684:
	cmpb	$115, %dl
	jne	.L20373
	movq	32(%rsi), %r8
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%r8)
	movq	%r8, %rsi
	je	.L20376
	jmp	.L20373
.L32678:
	movl	pedantic(%rip), %r13d
	testl	%r13d, %r13d
	jne	.L20368
	cmpb	$51, 48(%rbx)
	je	.L20368
	cmpq	$0, current_function_decl(%rip)
	je	.L20370
	movzbl	17(%rbx), %edx
	andb	$24, %dl
	cmpb	$16, %dl
	je	.L32685
.L20370:
	movq	%rbx, %rsi
.L20371:
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	movzbl	16(%rsi), %edx
.L20368:
	movq	%rax, %r13
	jmp	.L20364
.L32685:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	je	.L20370
	movzbl	16(%rax), %edx
	testb	%dl, %dl
	je	.L20370
	testb	$2, 17(%rax)
	je	.L20370
	cmpb	$46, %dl
	movq	%rax, %rsi
	jne	.L20371
	jmp	.L20370
.L32677:
	movq	104(%rbx), %rbx
	movzbl	16(%rbx), %edx
	jmp	.L20364
.L20361:
	movq	%rbx, %rdi
	call	default_function_array_conversion
	jmp	.L20362
.L32673:
	movq	72(%r13), %rdi
	movq	32(%r12), %rsi
	jmp	.L31977
.L32672:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %ecx
	jmp	.L20357
.L32671:
	testq	%r13, %r13
	movl	$1, %eax
	cmovne	%eax, %esi
	jmp	.L20355
.L20352:
	movzbl	17(%r12), %r9d
	movl	$1, %r11d
	movl	%r9d, %edx
	shrb	$3, %r9b
	shrb	$4, %dl
	andl	%r9d, %r11d
	andl	$1, %edx
	jmp	.L20351
.L32670:
	movl	$121, %edi
	movq	%r12, %rsi
	xorl	%edx, %edx
	call	build_unary_op
	jmp	.L31557
.L20347:
	movq	-760(%rbp), %r10
	movl	24(%r10), %eax
	movl	%eax, 24(%r12)
	jmp	.L20346
.L32669:
	movq	32(%rcx), %r8
	cmpq	%rbx, 8(%r8)
	je	.L29997
	movl	$115, %ecx
	jmp	.L20341
.L29997:
	movq	-760(%rbp), %r12
	movl	%edx, %ecx
	movq	32(%r12), %rsi
.L20345:
	cmpb	$116, %cl
	movl	$1, %eax
	movq	%rsi, %r12
	movzbl	16(%rsi), %ecx
	cmove	%eax, %r15d
	cmpb	$116, %cl
	jne	.L32686
	movq	32(%r12), %rsi
	jmp	.L20345
.L32686:
	cmpb	$115, %cl
	jne	.L20341
	movq	32(%rsi), %rsi
	movq	8(%r12), %r11
	cmpq	%r11, 8(%rsi)
	je	.L20345
	jmp	.L20341
.L32659:
	cmpb	$18, %dl
	jne	.L20337
	movq	8(%r14), %r9
	cmpb	$6, 16(%r9)
	jne	.L20337
	jmp	.L31107
.L32631:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC170, %esi
	call	pedwarn
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %r14
	xorl	%r12d, %r12d
	cmpq	%r14, %r8
	movq	%r8, %rbx
	movq	%r14, %r13
	jae	.L29993
.L20315:
	cmpl	$3, (%rbx)
	je	.L32687
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L20311:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L20315
.L29993:
	movslq	%r12d,%rdx
	movq	%r8, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L30725
.L20329:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32688
	cmpl	$2, %eax
	je	.L32689
.L20323:
	movq	8(%r12), %rdi
	movzbl	(%rdi), %r10d
	leaq	1(%rdi), %rcx
	testb	%r10b, %r10b
	movb	%r10b, (%rbx)
	je	.L20319
.L20328:
	movzbl	(%rcx), %r15d
	incq	%rbx
	incq	%rcx
	testb	%r15b, %r15b
	movb	%r15b, (%rbx)
	jne	.L20328
.L20319:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L20329
	jmp	.L30725
.L32689:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L20323
.L32688:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L20319
.L32687:
	addl	$25, %r12d
	jmp	.L20311
.L32630:
	movq	8(%rbx), %r9
	movq	constructor_max_index(%rip), %rdi
	movq	constructor_index(%rip), %rsi
	movq	128(%r9), %rdx
	movq	%rdx, -208(%rbp)
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L32690
	cmpq	$0, -760(%rbp)
	je	.L20025
	movq	-760(%rbp), %r12
	movq	constructor_index(%rip), %r15
	movq	8(%r12), %rdi
	movzbl	16(%rdi), %eax
	movq	%rdi, %rdx
	cmpb	$23, %al
	je	.L20027
	cmpb	$18, %al
	je	.L32691
.L31096:
	movq	global_trees(%rip), %r8
.L20026:
	cmpb	$-86, 16(%r12)
	je	.L32692
.L20125:
	cmpq	%r8, %r12
	je	.L32693
	testb	$2, 17(%r12)
	jne	.L20128
	movl	$0, constructor_constant(%rip)
.L20127:
	movl	require_constant_value(%rip), %r14d
	testl	%r14d, %r14d
	je	.L20132
	testb	$2, 17(%r12)
	je	.L32694
.L20132:
	movl	require_constant_elements(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L32695
.L20157:
	testq	%r15, %r15
	je	.L20159
	movq	8(%r15), %rax
	cmpq	global_trees(%rip), %rax
	je	.L20025
	movq	32(%rax), %rdi
	testq	%rdi, %rdi
	jne	.L32696
.L20159:
	movq	-208(%rbp), %rdi
	movl	require_constant_value(%rip), %edx
	movq	%r12, %rsi
	movl	require_constant_elements(%rip), %ecx
	call	digest_init
	cmpq	global_trees(%rip), %rax
	movq	%rax, -808(%rbp)
	je	.L32697
	movq	constructor_type(%rip), %rdi
	cmpb	$18, 16(%rdi)
	je	.L32698
.L20163:
	cmpb	$20, 16(%rdi)
	je	.L32699
.L20184:
	cmpb	$21, 16(%rdi)
	je	.L32700
.L20183:
	testq	%r15, %r15
	je	.L20251
	cmpb	$25, 16(%r15)
	je	.L32701
.L20251:
	movq	-808(%rbp), %rsi
	movq	constructor_elements(%rip), %rdx
	movq	%r15, %rdi
	call	tree_cons
	movq	constructor_type(%rip), %r15
	movq	%rax, constructor_elements(%rip)
	movzbl	16(%r15), %eax
	cmpb	$18, %al
	je	.L32702
	cmpb	$20, %al
	je	.L32703
	cmpb	$21, 16(%r15)
	je	.L32704
.L20253:
	movl	$1, %r9d
	testl	%r9d, %r9d
	je	.L20025
	xorl	%r15d, %r15d
	movq	constructor_pending_elts(%rip), %rbx
.L20263:
	xorl	%r14d, %r14d
	testq	%rbx, %rbx
	je	.L20265
.L20299:
	movq	constructor_type(%rip), %r13
	movzbl	16(%r13), %eax
	cmpb	$18, %al
	je	.L32705
	subb	$20, %al
	cmpb	$1, %al
	ja	.L20264
	movq	constructor_unfilled_fields(%rip), %rdi
	testq	%rdi, %rdi
	je	.L20265
	call	bit_position
	movq	32(%rbx), %rdi
	movq	%rax, %r13
	call	bit_position
	movq	%r13, %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L20285
	movq	32(%rbx), %r8
	movq	40(%rbx), %rdi
	movq	%r8, constructor_unfilled_fields(%rip)
	movq	8(%r8), %rsi
	movq	%r8, %rdx
.L31546:
	xorl	%ecx, %ecx
	call	output_init_element
.L20264:
	testq	%rbx, %rbx
	jne	.L20299
.L20265:
	testl	%r15d, %r15d
	je	.L20025
	testq	%r14, %r14
	je	.L20025
	movq	constructor_type(%rip), %r11
	movzbl	16(%r11), %edx
	leal	-20(%rdx), %esi
	cmpb	$1, %sil
	jbe	.L32706
	cmpb	$18, %dl
	jne	.L20263
	movq	%r14, constructor_unfilled_index(%rip)
	jmp	.L20263
.L32706:
	movq	%r14, constructor_unfilled_fields(%rip)
	jmp	.L20263
.L20285:
	movq	%r13, %rdi
	movq	%r12, %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20287
.L31974:
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L20288
.L31545:
	movq	%rax, %rbx
	jmp	.L20264
.L20288:
	movq	32(%rbx), %r14
	jmp	.L20265
.L20287:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L31545
	movq	16(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20294
	cmpq	%rbx, 8(%rax)
	je	.L20297
.L20294:
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L20265
	movq	32(%rax), %rdi
	call	bit_position
	movq	%r13, %rdi
	movq	%rax, %rsi
.L31975:
	call	tree_int_cst_lt
	testl	%eax, %eax
	je	.L20264
	jmp	.L20288
.L20297:
	movq	16(%rdx), %rax
	movq	%rdx, %rbx
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20294
	cmpq	%rbx, 8(%rax)
	je	.L20297
	jmp	.L20294
.L32705:
	movq	32(%rbx), %rdi
	movq	constructor_unfilled_index(%rip), %rsi
	call	tree_int_cst_equal
	testl	%eax, %eax
	je	.L20268
	movq	constructor_type(%rip), %rcx
	movq	40(%rbx), %rdi
	movq	constructor_unfilled_index(%rip), %rdx
	movq	8(%rcx), %rsi
	jmp	.L31546
.L20268:
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%rbx), %rsi
	call	tree_int_cst_lt
	testl	%eax, %eax
	jne	.L31974
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.L31545
	movq	16(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20277
	cmpq	%rbx, 8(%rax)
	je	.L20280
.L20277:
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L20265
	movq	constructor_unfilled_index(%rip), %rdi
	movq	32(%rax), %rsi
	jmp	.L31975
.L20280:
	movq	16(%rdx), %rax
	movq	%rdx, %rbx
	testq	%rax, %rax
	movq	%rax, %rdx
	je	.L20277
	cmpq	%rbx, 8(%rax)
	je	.L20280
	jmp	.L20277
.L32704:
	movq	$0, constructor_unfilled_fields(%rip)
	jmp	.L20253
.L32703:
	movq	constructor_unfilled_fields(%rip), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20253
	testb	$2, 53(%rax)
	je	.L20253
	cmpq	$0, 72(%rax)
	jne	.L20253
.L20259:
	movq	constructor_unfilled_fields(%rip), %r12
	movq	(%r12), %rax
	testq	%rax, %rax
	movq	%rax, constructor_unfilled_fields(%rip)
	je	.L20253
	testb	$2, 53(%rax)
	je	.L20253
	cmpq	$0, 72(%rax)
	jne	.L20253
	jmp	.L20259
.L32702:
	movq	constructor_unfilled_index(%rip), %rsi
	movq	global_trees+144(%rip), %rdx
	movl	$59, %edi
	call	size_binop
	movq	%rax, constructor_unfilled_index(%rip)
	jmp	.L20253
.L32701:
	movq	%r15, %rdi
	call	copy_node
	movq	%rax, %r15
	jmp	.L20251
.L32700:
	movq	constructor_elements(%rip), %rax
	testq	%rax, %rax
	je	.L20183
	movq	32(%rax), %r8
	testb	$1, 17(%r8)
	jne	.L32707
.L20226:
	movq	$0, constructor_elements(%rip)
	jmp	.L20183
.L32707:
	xorl	%eax, %eax
	movl	$.LC42, %edi
	movl	$.LC165, %esi
	call	warning
	movq	spelling_base(%rip), %r8
	movq	spelling(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %r8
	movq	%r8, %rbx
	movq	%rax, %r13
	jae	.L29984
.L20233:
	cmpl	$3, (%rbx)
	je	.L32708
	movq	8(%rbx), %rdi
	movq	%r8, -1304(%rbp)
	call	strlen
	movq	-1304(%rbp), %r8
	leal	1(%rax,%r12), %r12d
.L20229:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jb	.L20233
.L29984:
	movslq	%r12d,%rdx
	movq	%r8, %r12
	addq	$16, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpq	%r13, %r8
	movq	%rsp, %r14
	movq	%rsp, %rbx
	jae	.L29986
.L20247:
	movl	(%r12), %eax
	cmpl	$3, %eax
	je	.L32709
	cmpl	$2, %eax
	je	.L32710
.L20241:
	movq	8(%r12), %r10
	movzbl	(%r10), %r11d
	leaq	1(%r10), %rcx
	testb	%r11b, %r11b
	movb	%r11b, (%rbx)
	je	.L20237
.L20246:
	movzbl	(%rcx), %edi
	incq	%rbx
	incq	%rcx
	testb	%dil, %dil
	movb	%dil, (%rbx)
	jne	.L20246
.L20237:
	addq	$16, %r12
	cmpq	spelling(%rip), %r12
	jb	.L20247
.L29986:
	movb	$0, (%rbx)
	cmpb	$0, (%r14)
	je	.L20226
	movl	$.LC142, %edi
	movq	%r14, %rsi
	xorl	%eax, %eax
	call	warning
	jmp	.L20226
.L32710:
	movb	$46, (%rbx)
	incq	%rbx
	jmp	.L20241
.L32709:
	movl	8(%r12), %edx
	movq	%rbx, %rdi
	movl	$.LC141, %esi
	xorl	%eax, %eax
	call	sprintf
	movq	%rbx, %rdi
	call	strlen
	addq	%rax, %rbx
	jmp	.L20237
.L32708:
	addl	$25, %r12d
	jmp	.L20229
.L32699:
	movl	constructor_incremental(%rip), %r13d
	testl	%r13d, %r13d
	je	.L20186
	movq	constructor_unfilled_fields(%rip), %rax
	cmpq	%rax, %r15
	je	.L20184
	testq	%rax, %rax
	jne	.L20187
	testq	%rbx, %rbx
.L29978: