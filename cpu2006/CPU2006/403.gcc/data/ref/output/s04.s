	.file	"s04.in"
	.text
	.align 2
	.p2align 4,,15
.globl find_insn_list
	.type	find_insn_list,@function
find_insn_list:
.LFB1:
	testq	%rsi, %rsi
	je	.L13096
	.p2align 4,,7
.L13094:
	cmpq	%rdi, 8(%rsi)
	je	.L13089
	movq	16(%rsi), %rsi
	testq	%rsi, %rsi
	jne	.L13094
.L13096:
	xorl	%esi, %esi
.L13089:
	movq	%rsi, %rax
	ret
.LFE1:
.Lfe1:
	.size	find_insn_list,.Lfe1-find_insn_list
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"sched-deps.c"
.LC2:
	.string	"add_dependence"
	.text
	.align 2
	.p2align 4,,15
.globl add_dependence
	.type	add_dependence,@function
add_dependence:
.LFB2:
	pushq	%r15
.LCFI0:
	pushq	%r14
.LCFI1:
	pushq	%r13
.LCFI2:
	movl	%edx, %r13d
	pushq	%r12
.LCFI3:
	movq	%rdi, %r12
	pushq	%rbp
.LCFI4:
	movq	%rsi, %rbp
	pushq	%rbx
.LCFI5:
	subq	$8, %rsp
.LCFI6:
	cmpq	%rsi, %rdi
	je	.L13110
	movzwl	(%rsi), %eax
	cmpw	$37, %ax
	je	.L13110
	movzwl	(%rdi), %edx
	cmpw	$34, %dx
	je	.L13113
	cmpw	$34, %ax
	je	.L13113
	movq	32(%rdi), %rax
	xorl	%r14d, %r14d
	testq	%rax, %rax
	je	.L13115
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L13192
	xorl	%r14d, %r14d
	cmpw	$33, %dx
	je	.L13193
.L13115:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L13126
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L13194
	cmpw	$33, (%rbp)
	je	.L13195
.L13134:
	xorl	%ebx, %ebx
.L13126:
	testq	%r14, %r14
	je	.L13113
	testq	%rbx, %rbx
	je	.L13113
	movzwl	(%r14), %r15d
	movslq	%r15d,%rdx
	cmpb	$60, rtx_class(%rdx)
	je	.L13196
.L13137:
	xorl	%eax, %eax
.L13138:
	testl	%eax, %eax
	jne	.L13197
	.p2align 4,,7
.L13113:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L13139
	testb	$16, 3(%rax)
	je	.L13139
	cmpw	$36, (%rax)
	je	.L13139
	.p2align 4,,7
.L13140:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L13141
	testb	$16, 3(%rax)
	je	.L13141
	cmpw	$36, (%rax)
	je	.L13141
	movq	%rax, %rbx
	jmp	.L13140
.L13141:
	cmpq	%rbx, %r12
	je	.L13110
	movq	%rbx, %rbp
	.p2align 4,,7
.L13139:
	movq	true_dependency_cache(%rip), %r9
	movl	$1, %r8d
	testq	%r9, %r9
	je	.L13146
	movq	anti_dependency_cache(%rip), %rdi
	xorl	%r11d, %r11d
	testq	%rdi, %rdi
	je	.L13148
	movq	output_dependency_cache(%rip), %r10
	testq	%r10, %r10
	je	.L13148
	movslq	8(%rbp),%rdx
	movslq	8(%r12),%rbx
	movq	h_i_d(%rip), %rcx
	leaq	(%rdx,%rdx,2), %r14
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %r14
	salq	$4, %rsi
	movl	16(%r14,%rcx), %edx
	movslq	16(%rsi,%rcx),%r15
	movl	%edx, %ebx
	andl	$63, %edx
	shrl	$6, %ebx
	leaq	0(,%r15,8), %rsi
	movl	%edx, %ecx
	mov	%ebx, %r15d
	leaq	0(,%r15,8), %rbx
	movq	%rbx, %r14
	addq	(%r9,%rsi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L13150
	movq	%rbx, %r14
	addq	(%rdi,%rsi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L13151
	movl	$14, %r11d
.L13150:
	testl	%r8d, %r8d
	je	.L13156
	cmpl	%r11d, %r13d
	jge	.L13110
.L13146:
	testl	%r8d, %r8d
	je	.L13156
	movq	48(%r12), %rdi
	testq	%rdi, %rdi
	je	.L13156
	.p2align 4,,7
.L13174:
	cmpq	%rbp, 8(%rdi)
	je	.L13198
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L13174
.L13156:
	movq	48(%r12), %rsi
	movq	%rbp, %rdi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	%rax, 48(%r12)
	movb	%r13b, 2(%rax)
	testq	%r8, %r8
	je	.L13110
	testl	%r13d, %r13d
	jne	.L13176
	movslq	8(%rbp),%rdi
	movslq	8(%r12),%r14
	movq	h_i_d(%rip), %r13
	leaq	(%rdi,%rdi,2), %r12
	leaq	(%r14,%r14,2), %rbx
	salq	$4, %r12
	salq	$4, %rbx
	movl	16(%r12,%r13), %ecx
	movslq	16(%rbx,%r13),%r9
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L13188:
	andl	$63, %ecx
	movl	$1, %r10d
	salq	%cl, %r10
	orq	%r10, 16(%rax)
.L13110:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 6,,7
.L13176:
	cmpl	$14, %r13d
	je	.L13185
	cmpl	$15, %r13d
.L13191:
	jne	.L13110
	movslq	8(%r12),%rdi
	movq	h_i_d(%rip), %rcx
	leaq	(%rdi,%rdi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L13187:
	movslq	8(%rbp),%r14
	leaq	(%r14,%r14,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L13188
.L13185:
	movslq	8(%r12),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L13187
.L13198:
	testq	%r9, %r9
	je	.L13162
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L13200
	cmpb	$15, %al
	jne	.L13165
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13165
	movslq	8(%r12),%r15
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %r11
	leaq	(%r15,%r15,2), %rcx
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %rcx
	salq	$4, %r10
	movslq	16(%rcx,%r11),%rbx
	movl	16(%r10,%r11), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L13186:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L13162:
	movzbl	2(%rdi), %esi
	cmpl	%esi, %r13d
	jge	.L13167
	movb	%r13b, 2(%rdi)
.L13167:
	testq	%r9, %r9
	je	.L13110
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L13184
	cmpb	$14, %al
	je	.L13185
	cmpb	$15, %al
	jmp	.L13191
.L13184:
	movslq	8(%r12),%rsi
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %r8
	leaq	(%rsi,%rsi,2), %rcx
	leaq	(%rdx,%rdx,2), %r15
	salq	$4, %rcx
	salq	$4, %r15
	movslq	16(%rcx,%r8),%r10
	movl	16(%r15,%r8), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9,%r10,8), %rax
	jmp	.L13188
.L13165:
	movl	$.LC0, %edi
	movl	$308, %esi
.L13189:
	movl	$.LC2, %edx
	call	fancy_abort
.L13200:
	movslq	8(%r12),%rsi
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%rsi,%rsi,2), %r15
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r15
	salq	$4, %rdx
	movslq	16(%r15,%r11),%r8
	movl	16(%rdx,%r11), %ecx
	movl	%ecx, %r10d
	salq	$3, %r8
	shrl	$6, %r10d
	addq	anti_dependency_cache(%rip), %r8
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r8), %rax
	jmp	.L13186
	.p2align 6,,7
.L13151:
	movq	%rbx, %rdi
	movl	%edx, %ecx
	addq	(%r10,%rsi), %rdi
	movq	16(%rdi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L13153
	movl	$15, %r11d
	jmp	.L13150
.L13153:
	xorl	%r8d, %r8d
	jmp	.L13150
.L13148:
	movl	$.LC0, %edi
	movl	$273, %esi
	jmp	.L13189
.L13197:
	movq	%r14, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L13113
	movq	%rbx, %rdi
	movq	%r12, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L13113
	jmp	.L13110
.L13196:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L13137
	call	reverse_condition
	cmpl	%eax, %r15d
	jne	.L13137
	movq	8(%rbx), %rcx
	cmpq	%rcx, 8(%r14)
	jne	.L13137
	movq	16(%rbx), %rax
	cmpq	%rax, 16(%r14)
	jne	.L13137
	movl	$1, %eax
	jmp	.L13138
	.p2align 6,,7
.L13195:
	cmpw	$47, %dx
	jne	.L13134
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	jne	.L13134
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L13134
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L13201
	movq	24(%rbx), %rax
.L13132:
	cmpw	$67, (%rax)
	jne	.L13134
	cmpq	%rdx, %rcx
	jne	.L13134
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L13126
	.p2align 6,,7
.L13201:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L13126
	jmp	.L13132
	.p2align 6,,7
.L13194:
	movq	8(%rax), %rbx
	jmp	.L13126
.L13193:
	cmpw	$47, %cx
	je	.L13202
.L13123:
	xorl	%r14d, %r14d
	jmp	.L13115
.L13202:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rcx
	jne	.L13123
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L13123
	movq	8(%rax), %r14
	movq	16(%r14), %rsi
	cmpw	$67, (%rsi)
	je	.L13203
	movq	24(%r14), %rax
.L13121:
	cmpw	$67, (%rax)
	jne	.L13123
	cmpq	%rcx, %rsi
	jne	.L13123
	movzwl	(%r14), %edi
	call	reverse_condition
	movq	16(%r14), %rcx
	movq	8(%r14), %rdx
	movzbl	2(%r14), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r14
	jmp	.L13115
	.p2align 6,,7
.L13203:
	movq	24(%r14), %rax
	cmpq	%rdx, %rax
	je	.L13115
	jmp	.L13121
	.p2align 6,,7
.L13192:
	movq	8(%rax), %r14
	jmp	.L13115
.LFE2:
.Lfe2:
	.size	add_dependence,.Lfe2-add_dependence
	.align 2
	.p2align 4,,15
.globl add_insn_mem_dependence
	.type	add_insn_mem_dependence,@function
add_insn_mem_dependence:
.LFB3:
	subq	$40, %rsp
.LCFI7:
	movq	%rbx, 8(%rsp)
.LCFI8:
	movq	%rbp, 16(%rsp)
.LCFI9:
	movq	%r12, 24(%rsp)
.LCFI10:
	movq	%r13, 32(%rsp)
.LCFI11:
	movq	%rsi, %rbx
	movq	%r8, %rbp
	movq	(%rsi), %rsi
	movq	%rdi, %r13
	movq	%rdx, %r12
	movq	%rcx, %rdi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %rdx
	movq	%rax, (%rbx)
	testb	$2, 96(%rdx)
	jne	.L13407
.L13406:
	movq	(%r12), %rdx
	movq	%rbp, %rsi
	xorl	%edi, %edi
	call	alloc_EXPR_LIST
	movq	16(%rsp), %rbp
	movq	8(%rsp), %rbx
	incl	32(%r13)
	movq	%rax, (%r12)
	movq	32(%rsp), %r13
	movq	24(%rsp), %r12
	addq	$40, %rsp
	ret
	.p2align 6,,7
.L13407:
	movq	%rbp, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbp
	call	cselib_subst_to_values
	movq	%rax, 8(%rbp)
	jmp	.L13406
.LFE3:
.Lfe3:
	.size	add_insn_mem_dependence,.Lfe3-add_insn_mem_dependence
	.align 2
	.p2align 4,,15
.globl sched_analyze
	.type	sched_analyze,@function
sched_analyze:
.LFB4:
	pushq	%r15
.LCFI12:
	xorl	%r15d, %r15d
	pushq	%r14
.LCFI13:
	movq	%rdx, %r14
	pushq	%r13
.LCFI14:
	pushq	%r12
.LCFI15:
	movq	%rdi, %r12
	pushq	%rbp
.LCFI16:
	pushq	%rbx
.LCFI17:
	movq	%rsi, %rbx
	subq	$8, %rsp
.LCFI18:
	movq	current_sched_info(%rip), %rdx
	testb	$2, 96(%rdx)
	jne	.L15697
.L15638:
	movq	%rbx, %rbp
	.p2align 4,,7
.L15639:
	movl	(%rbp), %edx
	leal	-32(%rdx), %ecx
	cmpw	$1, %cx
	jbe	.L15698
	cmpw	$34, %dx
	je	.L15699
	cmpw	$37, %dx
	je	.L15700
.L15656:
	movq	current_sched_info(%rip), %rsi
	testb	$2, 96(%rsi)
	jne	.L15701
.L15691:
	cmpq	%r14, %rbp
	je	.L15702
	movq	24(%rbp), %rbp
	jmp	.L15639
.L15702:
	movq	current_sched_info(%rip), %rbp
	testb	$2, 96(%rbp)
	jne	.L15703
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L15703:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	cselib_finish
	.p2align 6,,7
.L15701:
	movq	%rbp, %rdi
	call	cselib_process_insn
	jmp	.L15691
.L15700:
	movl	40(%rbp), %eax
	addl	$83, %eax
	cmpl	$1, %eax
	jbe	.L15704
	cmpw	$37, %dx
	jne	.L15656
	movl	40(%rbp), %edx
	leal	96(%rdx), %r10d
	cmpl	$1, %r10d
	jbe	.L15688
	cmpl	$-86, %edx
	je	.L15688
	cmpl	$-85, %edx
	jne	.L15656
.L15688:
	leal	86(%rdx), %r11d
	cmpl	$1, %r11d
	ja	.L15689
	movslq	32(%rbp),%rsi
	xorl	%edi, %edi
.L15696:
	call	gen_rtx_CONST_INT
	movq	%r15, %rdx
	movl	$24, %edi
	movq	%rax, %rsi
	call	alloc_EXPR_LIST
	xorl	%edi, %edi
	movslq	40(%rbp),%rsi
	movq	%rax, %r15
	call	gen_rtx_CONST_INT
	movq	%r15, %rdx
	movl	$24, %edi
	movq	%rax, %rsi
	call	alloc_EXPR_LIST
	movzbl	3(%rbp), %ebx
	movzbl	3(%rax), %ecx
	movq	%rax, %r15
	andb	$4, %bl
	andb	$-5, %cl
	orb	%bl, %cl
	movb	%cl, 3(%rax)
	jmp	.L15656
.L15689:
	xorl	%edi, %edi
	xorl	%esi, %esi
	jmp	.L15696
.L15704:
	movq	32(%rbp), %rsi
	movq	%r15, %rdx
	movl	$24, %edi
	call	alloc_EXPR_LIST
	xorl	%edi, %edi
	movslq	40(%rbp),%rsi
	movq	%rax, %r13
	call	gen_rtx_CONST_INT
	movq	%r13, %rdx
	movl	$24, %edi
	movq	%rax, %rsi
	call	alloc_EXPR_LIST
	movq	%rax, %r15
	jmp	.L15656
.L15699:
	movslq	8(%rbp),%rdi
	andb	$-17, 3(%rbp)
	xorl	%ebx, %ebx
	movl	$1, %r13d
	leaq	(%rdi,%rdi,2), %rdx
	leaq	48(%rbp), %rdi
	salq	$4, %rdx
	addq	h_i_d(%rip), %rdx
	orb	$1, 46(%rdx)
	call	free_INSN_LIST_list
	xorl	%edx, %edx
	movq	%rbp, %rdi
	movl	$28, %esi
	call	find_reg_note
	testq	%rax, %rax
	je	.L15672
	movb	$1, reg_pending_barrier(%rip)
.L15659:
	movq	%rbp, %rdi
	leaq	56(%r12), %rsi
	movl	$14, %edx
	call	add_dependence_list_and_free
	movq	32(%rbp), %rsi
	movq	%r15, %rcx
	movq	%r12, %rdi
	movq	%rbp, %rdx
	xorl	%r15d, %r15d
	call	sched_analyze_insn
	testb	$4, 3(%rbp)
	je	.L15705
.L15673:
	leaq	16(%r12), %rsi
	movl	$14, %edx
	movq	%rbp, %rdi
	call	add_dependence_list_and_free
	leaq	24(%r12), %rdi
	call	free_EXPR_LIST_list
	movl	$14, %edx
	movq	%rbp, %rdi
	leaq	40(%r12), %rsi
	movl	$0, 32(%r12)
	call	add_dependence_list_and_free
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	alloc_INSN_LIST
	leaq	48(%r12), %rdi
	movl	$1, 36(%r12)
	movq	%rax, 40(%r12)
	call	free_INSN_LIST_list
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	alloc_INSN_LIST
	movq	%rax, 48(%r12)
	movl	reload_completed(%rip), %eax
	testl	%eax, %eax
	jne	.L15656
	movb	$1, 64(%r12)
	jmp	.L15656
.L15705:
	movq	%rbp, %rdi
	movq	%r12, %rsi
	movl	$14, %edx
	call	add_dependence_list_and_free
	leaq	8(%r12), %rdi
	call	free_EXPR_LIST_list
	jmp	.L15673
	.p2align 6,,7
.L15672:
	movslq	%ebx,%rdx
	cmpb	$0, global_regs(%rdx)
	jne	.L15706
	movq	%r13, %r8
	movl	%ebx, %ecx
	salq	%cl, %r8
	testq	%r8, regs_invalidated_by_call(%rip)
	jne	.L15707
	cmpb	$0, fixed_regs(%rdx)
	jne	.L15671
	cmpl	$20, %ebx
	je	.L15671
	cmpl	$6, %ebx
	je	.L15708
.L15662:
	incl	%ebx
	cmpl	$52, %ebx
	jle	.L15672
	jmp	.L15659
.L15708:
	movl	reload_completed(%rip), %eax
	testl	%eax, %eax
	je	.L15671
	movl	frame_pointer_needed(%rip), %r9d
	testl	%r9d, %r9d
	je	.L15662
	.p2align 4,,7
.L15671:
	movq	reg_pending_uses(%rip), %rdi
.L15695:
	movl	%ebx, %esi
	call	bitmap_set_bit
	jmp	.L15662
	.p2align 6,,7
.L15707:
	movq	reg_pending_clobbers(%rip), %rdi
	jmp	.L15695
	.p2align 6,,7
.L15706:
	movq	reg_pending_sets(%rip), %rdi
	movl	%ebx, %esi
	call	bitmap_set_bit
	jmp	.L15671
	.p2align 6,,7
.L15698:
	leaq	48(%rbp), %rdi
	call	free_INSN_LIST_list
	andb	$-17, 3(%rbp)
	cmpw	$33, (%rbp)
	je	.L15709
.L15643:
	movq	32(%rbp), %rsi
	movq	%r15, %rcx
	movq	%r12, %rdi
	movq	%rbp, %rdx
	xorl	%r15d, %r15d
	call	sched_analyze_insn
	jmp	.L15656
.L15709:
	movl	36(%r12), %eax
	movq	compiler_params(%rip), %rbx
	leal	1(%rax), %esi
	movl	%esi, 36(%r12)
	cmpl	80(%rbx), %eax
	jle	.L15644
	movq	%r12, %rsi
	movl	$14, %edx
	movq	%rbp, %rdi
	call	add_dependence_list_and_free
	leaq	8(%r12), %rdi
	call	free_EXPR_LIST_list
	leaq	16(%r12), %rsi
	movl	$14, %edx
	movq	%rbp, %rdi
	call	add_dependence_list_and_free
	leaq	24(%r12), %rdi
	call	free_EXPR_LIST_list
	movq	%rbp, %rdi
	leaq	40(%r12), %rsi
	movl	$14, %edx
	movl	$0, 32(%r12)
	call	add_dependence_list_and_free
	movq	%rbp, %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movl	$1, 36(%r12)
	movq	%rax, 40(%r12)
	jmp	.L15643
.L15644:
	movq	40(%r12), %rsi
	movq	%rbp, %rdi
	call	alloc_INSN_LIST
	movq	%rax, 40(%r12)
	jmp	.L15643
.L15697:
	call	cselib_init
	jmp	.L15638
.LFE4:
.Lfe4:
	.size	sched_analyze,.Lfe4-sched_analyze
	.align 2
	.p2align 4,,15
.globl compute_forward_dependences
	.type	compute_forward_dependences,@function
compute_forward_dependences:
.LFB5:
	pushq	%r13
.LCFI19:
	pushq	%r12
.LCFI20:
	movq	%rdi, %r12
	pushq	%rbp
.LCFI21:
	pushq	%rbx
.LCFI22:
	subq	$8, %rsp
.LCFI23:
	movq	24(%rsi), %r13
	cmpq	%r13, %rdi
	je	.L15736
.L15734:
	movzwq	(%r12), %rdx
	cmpb	$105, rtx_class(%rdx)
	je	.L15738
.L15713:
	movq	24(%r12), %r12
	cmpq	%r13, %r12
	jne	.L15734
.L15736:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L15738:
	movq	%r12, %rdi
.L15716:
	movq	%rdi, %r12
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L15717
	testb	$16, 3(%rax)
	je	.L15717
	cmpw	$36, (%rax)
	jne	.L15716
.L15717:
	movq	48(%r12), %rbp
	testq	%rbp, %rbp
	je	.L15713
	.p2align 4,,7
.L15733:
	movq	8(%rbp), %rax
.L15726:
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L15727
	testb	$16, 3(%rax)
	je	.L15727
	cmpw	$36, (%rax)
	jne	.L15726
.L15727:
	cmpq	8(%rbp), %rbx
	je	.L15739
.L15724:
	movq	16(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L15733
	jmp	.L15713
.L15739:
	movslq	8(%rbx),%r10
	movq	%r12, %rdi
	leaq	(%r10,%r10,2), %r9
	salq	$4, %r9
	addq	h_i_d(%rip), %r9
	movq	(%r9), %rsi
	call	alloc_INSN_LIST
	movzbl	2(%rbp), %r8d
	movb	%r8b, 2(%rax)
	movslq	8(%rbx),%rdi
	movq	h_i_d(%rip), %rbx
	leaq	(%rdi,%rdi,2), %rsi
	salq	$4, %rsi
	movq	%rax, (%rbx,%rsi)
	movslq	8(%r12),%rcx
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	incl	24(%rdx,%rbx)
	jmp	.L15724
.LFE5:
.Lfe5:
	.size	compute_forward_dependences,.Lfe5-compute_forward_dependences
	.align 2
	.p2align 4,,15
.globl init_deps
	.type	init_deps,@function
init_deps:
.LFB6:
	movl	reload_completed(%rip), %eax
	pushq	%rbx
.LCFI24:
	movq	%rdi, %rbx
	testl	%eax, %eax
	je	.L15743
	movl	$53, %eax
.L15742:
	movl	%eax, 68(%rbx)
	movslq	%eax,%rdi
	movl	$32, %esi
	call	xcalloc
	leaq	80(%rbx), %rdi
	movq	%rax, 72(%rbx)
	call	bitmap_initialize
	movb	$0, 64(%rbx)
	movq	$0, 56(%rbx)
	movq	$0, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, 24(%rbx)
	movl	$0, 32(%rbx)
	movl	$0, 36(%rbx)
	movq	$0, 40(%rbx)
	movq	$0, 48(%rbx)
	popq	%rbx
	ret
	.p2align 6,,7
.L15743:
	call	max_reg_num
	jmp	.L15742
.LFE6:
.Lfe6:
	.size	init_deps,.Lfe6-init_deps
	.align 2
	.p2align 4,,15
.globl free_deps
	.type	free_deps,@function
free_deps:
.LFB7:
	pushq	%r15
.LCFI25:
	pushq	%r14
.LCFI26:
	xorl	%r14d, %r14d
	pushq	%r13
.LCFI27:
	pushq	%r12
.LCFI28:
	xorl	%r12d, %r12d
	pushq	%rbp
.LCFI29:
	pushq	%rbx
.LCFI30:
	subq	$24, %rsp
.LCFI31:
	movq	%rdi, 16(%rsp)
	call	free_INSN_LIST_list
	movq	16(%rsp), %rdi
	addq	$8, %rdi
	call	free_EXPR_LIST_list
	movq	16(%rsp), %rdi
	addq	$16, %rdi
	call	free_INSN_LIST_list
	movq	16(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	16(%rsp), %rdi
	addq	$40, %rdi
	call	free_INSN_LIST_list
	movq	16(%rsp), %rdx
	movq	80(%rdx), %r13
	testq	%r13, %r13
	je	.L15772
.L15769:
	cmpl	$1, %r14d
	ja	.L15774
	leaq	8(%r13), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,7
.L15768:
	movq	8(%rsp), %rdx
	mov	%r14d, %ecx
	movq	16(%rdx,%rcx,8), %rbp
	testq	%rbp, %rbp
	je	.L15760
	cmpl	$63, %r12d
	ja	.L15760
	movl	$1, %r15d
	.p2align 4,,7
.L15767:
	movq	%r15, %rax
	movl	%r12d, %ecx
	salq	%cl, %rax
	testq	%rax, %rbp
	jne	.L15776
.L15763:
	incl	%r12d
	cmpl	$63, %r12d
	jbe	.L15767
.L15760:
	incl	%r14d
	xorl	%r12d, %r12d
	cmpl	$1, %r14d
	jbe	.L15768
.L15774:
	movq	(%r13), %r13
	xorl	%r14d, %r14d
	testq	%r13, %r13
	jne	.L15769
.L15772:
	movq	16(%rsp), %rdi
	addq	$80, %rdi
	call	bitmap_clear
	movq	16(%rsp), %rbx
	movq	72(%rbx), %rdi
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	free
	.p2align 6,,7
.L15776:
	notq	%rax
	movq	16(%rsp), %rsi
	andq	%rax, %rbp
	movl	16(%r13), %eax
	leal	(%r14,%rax,2), %edi
	sall	$6, %edi
	addl	%r12d, %edi
	movslq	%edi,%rbx
	salq	$5, %rbx
	addq	72(%rsi), %rbx
	movq	%rbx, %rdi
	call	free_INSN_LIST_list
	leaq	8(%rbx), %rdi
	call	free_INSN_LIST_list
	leaq	16(%rbx), %rdi
	call	free_INSN_LIST_list
	testq	%rbp, %rbp
	jne	.L15763
	jmp	.L15760
.LFE7:
.Lfe7:
	.size	free_deps,.Lfe7-free_deps
	.align 2
	.p2align 4,,15
.globl init_dependency_caches
	.type	init_dependency_caches,@function
init_dependency_caches:
.LFB8:
	movl	%edi, %eax
	pushq	%rbx
.LCFI32:
	movl	%edi, %ebx
	cltd
	idivl	n_basic_blocks(%rip)
	cmpl	$500, %eax
	jg	.L15779
	popq	%rbx
	ret
	.p2align 6,,7
.L15779:
	movl	%edi, %esi
	call	sbitmap_vector_alloc
	movl	%ebx, %esi
	movq	%rax, %rdi
	movq	%rax, true_dependency_cache(%rip)
	call	sbitmap_vector_zero
	movl	%ebx, %edi
	movl	%ebx, %esi
	call	sbitmap_vector_alloc
	movl	%ebx, %esi
	movq	%rax, %rdi
	movq	%rax, anti_dependency_cache(%rip)
	call	sbitmap_vector_zero
	movl	%ebx, %edi
	movl	%ebx, %esi
	call	sbitmap_vector_alloc
	movl	%ebx, %esi
	popq	%rbx
	movq	%rax, %rdi
	movq	%rax, output_dependency_cache(%rip)
	jmp	sbitmap_vector_zero
.LFE8:
.Lfe8:
	.size	init_dependency_caches,.Lfe8-init_dependency_caches
	.align 2
	.p2align 4,,15
.globl free_dependency_caches
	.type	free_dependency_caches,@function
free_dependency_caches:
.LFB9:
	subq	$8, %rsp
.LCFI33:
	movq	true_dependency_cache(%rip), %rdi
	testq	%rdi, %rdi
	jne	.L15782
.L15780:
	addq	$8, %rsp
	ret
	.p2align 6,,7
.L15782:
	call	free
	movq	anti_dependency_cache(%rip), %rdi
	movq	$0, true_dependency_cache(%rip)
	call	free
	movq	output_dependency_cache(%rip), %rdi
	movq	$0, anti_dependency_cache(%rip)
	call	free
	movq	$0, output_dependency_cache(%rip)
	jmp	.L15780
.LFE9:
.Lfe9:
	.size	free_dependency_caches,.Lfe9-free_dependency_caches
	.align 2
	.p2align 4,,15
.globl init_deps_global
	.type	init_deps_global,@function
init_deps_global:
.LFB10:
	subq	$8, %rsp
.LCFI34:
	movl	$reg_pending_sets_head, %edi
	call	bitmap_initialize
	movl	$reg_pending_clobbers_head, %edi
	movq	%rax, reg_pending_sets(%rip)
	call	bitmap_initialize
	movl	$reg_pending_uses_head, %edi
	movq	%rax, reg_pending_clobbers(%rip)
	call	bitmap_initialize
	movb	$0, reg_pending_barrier(%rip)
	movq	%rax, reg_pending_uses(%rip)
	addq	$8, %rsp
	ret
.LFE10:
.Lfe10:
	.size	init_deps_global,.Lfe10-init_deps_global
	.align 2
	.p2align 4,,15
.globl finish_deps_global
	.type	finish_deps_global,@function
finish_deps_global:
.LFB11:
	subq	$8, %rsp
.LCFI35:
	movq	reg_pending_sets(%rip), %rdi
	testq	%rdi, %rdi
	jne	.L15791
.L15785:
	movq	reg_pending_clobbers(%rip), %rdi
	testq	%rdi, %rdi
	jne	.L15792
.L15787:
	movq	reg_pending_uses(%rip), %rdi
	testq	%rdi, %rdi
	jne	.L15793
.L15784:
	addq	$8, %rsp
	ret
	.p2align 6,,7
.L15793:
	call	bitmap_clear
	movq	$0, reg_pending_uses(%rip)
	jmp	.L15784
	.p2align 6,,7
.L15792:
	call	bitmap_clear
	movq	$0, reg_pending_clobbers(%rip)
	jmp	.L15787
	.p2align 6,,7
.L15791:
	call	bitmap_clear
	movq	$0, reg_pending_sets(%rip)
	jmp	.L15785
.LFE11:
.Lfe11:
	.size	finish_deps_global,.Lfe11-finish_deps_global
	.local	reg_pending_sets_head
	.comm	reg_pending_sets_head,24,16
	.local	reg_pending_clobbers_head
	.comm	reg_pending_clobbers_head,24,16
	.local	reg_pending_uses_head
	.comm	reg_pending_uses_head,24,16
	.local	reg_pending_sets
	.comm	reg_pending_sets,8,8
	.local	reg_pending_clobbers
	.comm	reg_pending_clobbers,8,8
	.local	reg_pending_uses
	.comm	reg_pending_uses,8,8
	.local	reg_pending_barrier
	.comm	reg_pending_barrier,1,1
	.local	true_dependency_cache
	.comm	true_dependency_cache,8,8
	.local	anti_dependency_cache
	.comm	anti_dependency_cache,8,8
	.local	output_dependency_cache
	.comm	output_dependency_cache,8,8
	.section	.rodata.str1.1
.LC4:
	.string	"remove_dependence"
.LC1:
	.string	"sched_analyze_2"
.LC3:
	.string	"sched_analyze_1"
	.text
	.align 2
	.p2align 4,,15
	.type	sched_analyze_insn,@function
sched_analyze_insn:
.LFB12:
	pushq	%r15
.LCFI36:
	pushq	%r14
.LCFI37:
	pushq	%r13
.LCFI38:
	pushq	%r12
.LCFI39:
	pushq	%rbp
.LCFI40:
	pushq	%rbx
.LCFI41:
	subq	$1752, %rsp
.LCFI42:
	movq	%rdx, 1696(%rsp)
	movq	%rdi, 1704(%rsp)
	movq	%rsi, 1616(%rsp)
	movq	%rcx, 1688(%rsp)
	movzwl	(%rsi), %eax
	movzwl	%ax, %edx
	cmpl	$38, %edx
	je	.L17732
.L2:
	cmpl	$47, %edx
	je	.L1091
	cmpl	$49, %edx
	je	.L1091
	cmpl	$39, %edx
	je	.L17733
	movzwl	%ax, %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L7920
	mov	%eax, %r14d
	jmp	*.L8991(,%r14,8)
	.section	.rodata
	.align 8
	.align 4
.L8991:
	.quad	.L8211
	.quad	.L8211
	.quad	.L7920
	.quad	.L8211
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L8198
	.quad	.L7920
	.quad	.L3412
	.quad	.L3412
	.quad	.L3412
	.quad	.L7920
	.quad	.L3412
	.quad	.L7920
	.quad	.L7920
	.quad	.L7927
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7958
	.quad	.L3412
	.quad	.L3412
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L7920
	.quad	.L8223
	.quad	.L8223
	.quad	.L8223
	.quad	.L8223
	.quad	.L8607
	.quad	.L8607
	.text
.L7927:
	movq	1616(%rsp), %rdi
	movl	8(%rdi), %ebp
	cmpl	$52, %ebp
	jg	.L7928
	leal	-8(%rbp), %ebx
	cmpl	$7, %ebx
	jbe	.L7931
	leal	-21(%rbp), %r15d
	cmpl	$7, %r15d
	jbe	.L7931
	leal	-45(%rbp), %r10d
	cmpl	$7, %r10d
	jbe	.L7931
	leal	-29(%rbp), %r12d
	cmpl	$7, %r12d
	ja	.L7929
.L7931:
	movq	1616(%rsp), %rax
	movzbq	2(%rax), %r13
	movl	mode_class(,%r13,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17219:
	addl	$2, %eax
.L7930:
	movl	%eax, %ebx
	decl	%ebx
	js	.L3412
.L7951:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L7951
.L3412:
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %eax
	cmpw	$34, %ax
	je	.L17734
.L9005:
	cmpw	$33, %ax
	je	.L17735
.L12421:
	cmpq	$0, 1688(%rsp)
	je	.L12652
	movq	1688(%rsp), %rcx
	cmpq	$0, 16(%rcx)
	je	.L16326
.L12658:
	movq	8(%rcx), %r14
	movq	8(%r14), %rdx
	leaq	96(%rdx), %r15
	cmpq	$1, %r15
	jbe	.L12657
	cmpq	$-86, %rdx
	je	.L12657
	cmpq	$-85, %rdx
	je	.L12657
.L12656:
	movq	16(%rcx), %rcx
	cmpq	$0, 16(%rcx)
	jne	.L12658
.L16326:
	movq	1696(%rsp), %r10
	movq	56(%r10), %r11
	movq	%r11, 16(%rcx)
	movq	1688(%rsp), %rdx
	movq	%rdx, 56(%r10)
.L12652:
	movq	1696(%rsp), %rdi
	call	can_throw_internal
	testb	%al, %al
	je	.L12659
	movb	$1, reg_pending_barrier(%rip)
.L12659:
	cmpb	$0, reg_pending_barrier(%rip)
	je	.L12660
	movq	1696(%rsp), %rax
	movq	32(%rax), %rcx
	cmpw	$38, (%rcx)
	je	.L17736
	movq	1704(%rsp), %rdx
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
	movq	80(%rdx), %r13
	testq	%r13, %r13
	je	.L12918
.L12943:
	cmpl	$1, %r14d
	ja	.L16344
	leaq	8(%r13), %r11
	movq	%r11, (%rsp)
.L12942:
	movq	(%rsp), %rbx
	mov	%r14d, %r8d
	movq	16(%rbx,%r8,8), %rbp
	testq	%rbp, %rbp
	je	.L12934
	cmpl	$63, %r12d
	ja	.L12934
	movl	$1, %r15d
	.p2align 4,,7
.L12941:
	movq	%r15, %rax
	movl	%r12d, %ecx
	salq	%cl, %rax
	testq	%rax, %rbp
	jne	.L17737
.L12937:
	incl	%r12d
	cmpl	$63, %r12d
	jbe	.L12941
.L12934:
	incl	%r14d
	xorl	%r12d, %r12d
	cmpl	$1, %r14d
	jbe	.L12942
.L16344:
	movq	(%r13), %r13
	xorl	%r14d, %r14d
	testq	%r13, %r13
	jne	.L12943
.L12918:
	movq	1704(%rsp), %rdx
	xorl	%ebp, %ebp
	cmpl	68(%rdx), %ebp
	jge	.L16347
	leaq	80(%rdx), %r12
.L12948:
	movq	1704(%rsp), %r10
	movslq	%ebp,%r13
	movq	1696(%rsp), %rdi
	salq	$5, %r13
	addq	72(%r10), %r13
	movq	8(%r13), %rsi
	call	alloc_INSN_LIST
	movl	%ebp, %esi
	movq	%r12, %rdi
	movq	%rax, 8(%r13)
	incl	%ebp
	call	bitmap_set_bit
	movq	1704(%rsp), %r14
	cmpl	68(%r14), %ebp
	jl	.L12948
.L16347:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$8, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rbp
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%rbp, %rsi
	movl	$0, 32(%rbp)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movb	$0, reg_pending_barrier(%rip)
	movq	1704(%rsp), %r12
	movq	%rax, 40(%r12)
	movl	$1, 36(%r12)
.L12959:
	movq	reg_pending_uses(%rip), %rdi
	call	bitmap_clear
	movq	reg_pending_clobbers(%rip), %rdi
	call	bitmap_clear
	movq	reg_pending_sets(%rip), %rdi
	call	bitmap_clear
	movq	1704(%rsp), %rdi
	cmpb	$0, 64(%rdi)
	je	.L1
	movq	1696(%rsp), %rdx
	movzwq	(%rdx), %r9
	cmpb	$105, rtx_class(%r9)
	je	.L17738
	xorl	%esi, %esi
.L12962:
	testq	%rsi, %rsi
	je	.L12966
	movq	8(%rsi), %rdx
	movzwl	(%rdx), %eax
	cmpw	$63, %ax
	je	.L17739
.L12967:
	cmpw	$61, %ax
	je	.L17740
.L12966:
	movq	1704(%rsp), %rdi
	movb	$0, 64(%rdi)
.L1:
	addq	$1752, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L17740:
	movq	16(%rsi), %rax
	movl	8(%rdx), %ecx
	movzwl	(%rax), %edx
	cmpw	$63, %dx
	je	.L17741
.L12970:
	cmpw	$61, %dx
	jne	.L12966
	cmpl	$52, 8(%rax)
	jle	.L12974
	cmpl	$52, %ecx
	jg	.L12966
.L12974:
	movq	1696(%rsp), %r11
	orb	$16, 3(%r11)
	movq	%r11, %rdi
	call	prev_nonnote_insn
	movq	1696(%rsp), %rdx
	movq	%rax, %rbx
	movq	48(%rdx), %rdi
	testq	%rdi, %rdi
	movq	%rdi, %rax
	je	.L16349
.L12981:
	cmpq	%rbx, 8(%rax)
	je	.L12980
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L12981
.L16349:
	xorl	%eax, %eax
.L12980:
	testq	%rax, %rax
	je	.L12975
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	testq	%rdi, %rdi
	je	.L16351
.L12996:
	cmpq	%rbx, 8(%rdi)
	movq	16(%rdi), %rbp
	je	.L17742
	movq	%rdi, %r12
.L12984:
	testq	%rbp, %rbp
	movq	%rbp, %rdi
	jne	.L12996
.L16351:
	testl	%eax, %eax
	je	.L17743
.L12975:
	movq	48(%rbx), %r15
	testq	%r15, %r15
	je	.L16353
.L13074:
	movq	8(%r15), %r13
	movzbl	2(%r15), %r14d
	cmpq	%r13, 1696(%rsp)
	je	.L13001
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L13001
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L13006
	cmpw	$34, %ax
	je	.L13006
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L13008
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17744
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L17745
.L13008:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L13019
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17746
	cmpw	$33, (%r13)
	je	.L17747
.L13027:
	xorl	%ebx, %ebx
.L13019:
	testq	%rbp, %rbp
	je	.L13006
	testq	%rbx, %rbx
	je	.L13006
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L17748
.L13030:
	xorl	%eax, %eax
.L13031:
	testl	%eax, %eax
	jne	.L17749
.L13006:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L13032
	testb	$16, 3(%rax)
	je	.L13032
	cmpw	$36, (%rax)
	je	.L13032
.L13033:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L13034
	testb	$16, 3(%rax)
	je	.L13034
	cmpw	$36, (%rax)
	je	.L13034
	movq	%rax, %rbx
	jmp	.L13033
.L13034:
	cmpq	%rbx, 1696(%rsp)
	je	.L13001
	movq	%rbx, %r13
.L13032:
	movq	true_dependency_cache(%rip), %r9
	movl	$1, %r11d
	testq	%r9, %r9
	je	.L13039
	movq	anti_dependency_cache(%rip), %rdi
	xorl	%r10d, %r10d
	testq	%rdi, %rdi
	je	.L13041
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rbx
	leaq	(%rdx,%rdx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%r12), %edx
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%r12),%rcx
	movl	%edx, %ebx
	andl	$63, %edx
	shrl	$6, %ebx
	leaq	0(,%rcx,8), %rsi
	mov	%ebx, %ecx
	leaq	0(,%rcx,8), %rbx
	movl	%edx, %ecx
	movq	%rbx, %rbp
	addq	(%r9,%rsi), %rbp
	movq	16(%rbp), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L13043
	movq	%rbx, %r12
	addq	(%rdi,%rsi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L13044
	movl	$14, %r10d
.L13043:
	testl	%r11d, %r11d
	je	.L13049
	cmpl	%r10d, %r14d
	jge	.L13001
.L13039:
	testl	%r11d, %r11d
	je	.L13049
	movq	1696(%rsp), %r10
	movq	48(%r10), %rdi
	testq	%rdi, %rdi
	je	.L13049
.L13067:
	cmpq	%r13, 8(%rdi)
	je	.L17750
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L13067
.L13049:
	movq	1696(%rsp), %r9
	movq	%r13, %rdi
	movq	48(%r9), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	%r14b, 2(%rax)
	je	.L13001
	testl	%r14d, %r14d
	jne	.L13069
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r10
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r10), %ecx
	movslq	16(%rbp,%r10),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17401:
	andl	$63, %ecx
	movl	$1, %r12d
	salq	%cl, %r12
	orq	%r12, 16(%rax)
.L13001:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L13074
.L16353:
	movq	1696(%rsp), %r14
	movslq	8(%r14),%rdx
	leaq	(%rdx,%rdx,2), %r15
	salq	$4, %r15
	addq	h_i_d(%rip), %r15
	orb	$1, 46(%r15)
	jmp	.L1
.L13069:
	cmpl	$14, %r14d
	je	.L16942
	cmpl	$15, %r14d
.L17712:
	jne	.L13001
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rbx
	movq	h_i_d(%rip), %rcx
	leaq	(%rbx,%rbx,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17400:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17401
.L16942:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r10
	leaq	(%r10,%r10,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17400
.L17750:
	testq	%r9, %r9
	je	.L13055
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17752
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rbx
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rbx),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r12
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r8,%r12,8), %rax
.L17399:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L13055:
	movzbl	2(%rdi), %r12d
	cmpl	%r12d, %r14d
	jge	.L13060
	movb	%r14b, 2(%rdi)
.L13060:
	testq	%r9, %r9
	je	.L13001
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16941
	cmpb	$14, %al
	je	.L16942
	cmpb	$15, %al
	jmp	.L17712
.L16941:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%r12
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r12,%r12,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbx
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r9,%rbx,8), %rax
	jmp	.L17401
.L13058:
	movl	$.LC0, %edi
	movl	$308, %esi
.L17402:
	movl	$.LC2, %edx
.L17403:
	call	fancy_abort
.L17752:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%rbx
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%rbp), %ecx
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%rbp),%r11
	movl	%ecx, %r8d
	shrl	$6, %r8d
	mov	%r8d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17399
.L13044:
	movq	%rbx, %rdi
	movl	%edx, %ecx
	addq	(%r8,%rsi), %rdi
	movq	16(%rdi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L13046
	movl	$15, %r10d
	jmp	.L13043
.L13046:
	xorl	%r11d, %r11d
	jmp	.L13043
	.p2align 6,,7
.L13041:
	movl	$.LC0, %edi
	movl	$273, %esi
	jmp	.L17402
.L17749:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L13006
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L13001
	jmp	.L13006
.L17748:
	movzwl	(%rbx), %edi
	movslq	%edi,%rcx
	cmpb	$60, rtx_class(%rcx)
	jne	.L13030
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L13030
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L13030
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%rbp)
	jne	.L13030
	movl	$1, %eax
	jmp	.L13031
.L17747:
	cmpw	$47, %dx
	jne	.L13027
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	jne	.L13027
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L13027
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17753
	movq	24(%rbx), %rax
.L13025:
	cmpw	$67, (%rax)
	jne	.L13027
	cmpq	%rdx, %rcx
	jne	.L13027
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L13019
.L17753:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L13019
	jmp	.L13025
.L17746:
	movq	8(%rax), %rbx
	jmp	.L13019
.L17745:
	cmpw	$47, %dx
	je	.L17754
.L13016:
	xorl	%ebp, %ebp
	jmp	.L13008
.L17754:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L13016
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L13016
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L17755
	movq	24(%rbp), %rax
.L13014:
	cmpw	$67, (%rax)
	jne	.L13016
	cmpq	%rsi, %rcx
	jne	.L13016
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L13008
.L17755:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L13008
	jmp	.L13014
.L17744:
	movq	8(%rax), %rbp
	jmp	.L13008
.L17743:
	movl	$.LC0, %edi
	movl	$433, %esi
	movl	$.LC4, %edx
	jmp	.L17403
	.p2align 6,,7
.L17742:
	testq	%r12, %r12
	je	.L12987
	movq	%rbp, 16(%r12)
.L12988:
	movq	true_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L12989
	movzbl	2(%rdi), %eax
	testb	%al, %al
	jne	.L12990
	movq	1696(%rsp), %rax
	movslq	8(%rbx),%rcx
	movq	h_i_d(%rip), %r10
	movslq	8(%rax),%r9
	leaq	(%rcx,%rcx,2), %r13
	salq	$4, %r13
	movl	16(%r13,%r10), %ecx
	leaq	(%r9,%r9,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r10),%r14
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17398:
	andl	$63, %ecx
	movq	$-2, %r11
	rolq	%cl, %r11
	andq	%r11, 16(%rax)
.L12989:
	call	free_INSN_LIST_node
	movl	$1, %eax
	jmp	.L12984
.L12990:
	cmpb	$14, %al
	je	.L17756
	cmpb	$15, %al
	jne	.L12989
	movq	1696(%rsp), %r13
	movq	h_i_d(%rip), %rcx
	movslq	8(%r13),%rdx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17397:
	movslq	8(%rbx),%r9
	leaq	(%r9,%r9,2), %r15
	salq	$4, %r15
	movl	16(%r15,%rcx), %ecx
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17398
.L17756:
	movq	1696(%rsp), %r14
	movq	h_i_d(%rip), %rcx
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17397
.L12987:
	movq	1696(%rsp), %r8
	movq	%rbp, 48(%r8)
	jmp	.L12988
	.p2align 6,,7
.L17741:
	movq	8(%rax), %rax
	movzwl	(%rax), %edx
	jmp	.L12970
.L17739:
	movq	8(%rdx), %rdx
	movzwl	(%rdx), %eax
	jmp	.L12967
.L17738:
	movq	32(%rdx), %rsi
	cmpw	$47, (%rsi)
	je	.L12962
	movq	1696(%rsp), %rdi
	call	single_set_2
	movq	%rax, %rsi
	jmp	.L12962
	.p2align 6,,7
.L17737:
	movl	16(%r13), %ecx
	notq	%rax
	movq	1704(%rsp), %rsi
	andq	%rax, %rbp
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	leal	(%r14,%rcx,2), %eax
	sall	$6, %eax
	addl	%r12d, %eax
	movslq	%eax,%rbx
	salq	$5, %rbx
	addq	72(%rsi), %rbx
	movq	%rbx, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%edx, %edx
	leaq	8(%rbx), %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%edx, %edx
	leaq	16(%rbx), %rsi
	call	add_dependence_list_and_free
	testq	%rbp, %rbp
	movl	$0, 24(%rbx)
	movl	$0, 28(%rbx)
	jne	.L12937
	jmp	.L12934
.L17736:
	movq	1704(%rsp), %rbp
	movl	$0, 68(%rsp)
	movl	$0, 52(%rsp)
	movq	80(%rbp), %r12
	testq	%r12, %r12
	movq	%r12, 56(%rsp)
	je	.L12918
.L12917:
	cmpl	$1, 52(%rsp)
	ja	.L16330
	movq	56(%rsp), %r8
	addq	$8, %r8
	movq	%r8, 8(%rsp)
.L12916:
	mov	52(%rsp), %r13d
	movq	8(%rsp), %rdi
	movq	16(%rdi,%r13,8), %rsi
	testq	%rsi, %rsi
	movq	%rsi, 40(%rsp)
	je	.L12677
	cmpl	$63, 68(%rsp)
	ja	.L12677
.L12915:
	movzbl	68(%rsp), %ecx
	movl	$1, %eax
	salq	%cl, %rax
	testq	%rax, 40(%rsp)
	je	.L12680
	movq	56(%rsp), %r14
	notq	%rax
	movl	52(%rsp), %r15d
	andq	%rax, 40(%rsp)
	movq	1704(%rsp), %rbx
	movl	16(%r14), %eax
	leal	(%r15,%rax,2), %r9d
	sall	$6, %r9d
	addl	68(%rsp), %r9d
	movslq	%r9d,%r15
	salq	$5, %r15
	addq	72(%rbx), %r15
	movq	(%r15), %r13
	testq	%r13, %r13
	je	.L16333
.L12758:
	movq	8(%r13), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L12685
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L12685
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L12690
	cmpw	$34, %ax
	je	.L12690
	movq	32(%rcx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L12692
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L17757
	xorl	%r12d, %r12d
	cmpw	$33, %dx
	je	.L17758
.L12692:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12703
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17759
	cmpw	$33, (%rbp)
	je	.L17760
.L12711:
	xorl	%ebx, %ebx
.L12703:
	testq	%r12, %r12
	je	.L12690
	testq	%rbx, %rbx
	je	.L12690
	movzwl	(%r12), %r14d
	movslq	%r14d,%r10
	cmpb	$60, rtx_class(%r10)
	je	.L17761
.L12714:
	xorl	%eax, %eax
.L12715:
	testl	%eax, %eax
	jne	.L17762
.L12690:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12716
	testb	$16, 3(%rax)
	je	.L12716
	cmpw	$36, (%rax)
	je	.L12716
.L12717:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12718
	testb	$16, 3(%rax)
	je	.L12718
	cmpw	$36, (%rax)
	je	.L12718
	movq	%rax, %rbx
	jmp	.L12717
.L12718:
	cmpq	%rbx, 1696(%rsp)
	je	.L12685
	movq	%rbx, %rbp
.L12716:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r9d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L12723
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r10
	testq	%r10, %r10
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rdx
	leaq	(%rdx,%rdx,2), %rdi
	movslq	8(%rbp),%rdx
	salq	$4, %rdi
	movslq	16(%rdi,%r14),%r12
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rcx
	movl	16(%rcx,%r14), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12727
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12728
	movl	$14, %ebx
.L12727:
	testl	%r9d, %r9d
	je	.L12733
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L12685
.L12723:
	testl	%r9d, %r9d
	je	.L12733
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L12733
.L12751:
	cmpq	%rbp, 8(%rdi)
	je	.L17763
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12751
.L12733:
	movq	1696(%rsp), %r11
	movq	%rbp, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L12685
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L12753
	movslq	8(%rbp),%r12
	movslq	8(%rdx),%rsi
	movq	h_i_d(%rip), %r14
	leaq	(%rsi,%rsi,2), %rcx
	leaq	(%r12,%r12,2), %r10
	salq	$4, %rcx
	salq	$4, %r10
	movslq	16(%rcx,%r14),%r9
	movl	16(%r10,%r14), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17390:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L12685:
	movq	16(%r13), %r13
	testq	%r13, %r13
	jne	.L12758
.L16333:
	movq	8(%r15), %r13
	testq	%r13, %r13
	je	.L16336
.L12835:
	movq	8(%r13), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L12762
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L12762
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L12767
	cmpw	$34, %ax
	je	.L12767
	movq	32(%rcx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L12769
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L17764
	xorl	%r12d, %r12d
	cmpw	$33, %dx
	je	.L17765
.L12769:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12780
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17766
	cmpw	$33, (%rbp)
	je	.L17767
.L12788:
	xorl	%ebx, %ebx
.L12780:
	testq	%r12, %r12
	je	.L12767
	testq	%rbx, %rbx
	je	.L12767
	movzwl	(%r12), %r14d
	movslq	%r14d,%rdx
	cmpb	$60, rtx_class(%rdx)
	je	.L17768
.L12791:
	xorl	%eax, %eax
.L12792:
	testl	%eax, %eax
	jne	.L17769
.L12767:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12793
	testb	$16, 3(%rax)
	je	.L12793
	cmpw	$36, (%rax)
	je	.L12793
.L12794:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12795
	testb	$16, 3(%rax)
	je	.L12795
	cmpw	$36, (%rax)
	je	.L12795
	movq	%rax, %rbx
	jmp	.L12794
.L12795:
	cmpq	%rbx, 1696(%rsp)
	je	.L12762
	movq	%rbx, %rbp
.L12793:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r9d
	testq	%rsi, %rsi
	movq	%rsi, %rbx
	je	.L12800
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r10
	testq	%r10, %r10
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rdx
	leaq	(%rdx,%rdx,2), %rdi
	movslq	8(%rbp),%rdx
	salq	$4, %rdi
	movslq	16(%rdi,%r14),%r12
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rcx
	movl	16(%rcx,%r14), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12804
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12805
	movl	$14, %r11d
.L12804:
	testl	%r9d, %r9d
	je	.L12810
	xorl	%r10d, %r10d
	cmpl	%r11d, %r10d
	jge	.L12762
.L12800:
	testl	%r9d, %r9d
	je	.L12810
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L12810
.L12828:
	cmpq	%rbp, 8(%rdi)
	je	.L17770
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12828
.L12810:
	movq	1696(%rsp), %rbx
	movq	%rbp, %rdi
	movq	48(%rbx), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L12762
	xorl	%edi, %edi
	testl	%edi, %edi
	jne	.L12830
	movslq	8(%rbp),%r12
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r14
	leaq	(%r12,%r12,2), %r11
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r11
	salq	$4, %rdx
	movl	16(%r11,%r14), %ecx
	movslq	16(%rdx,%r14),%r9
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17393:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L12762:
	movq	16(%r13), %r13
	testq	%r13, %r13
	jne	.L12835
.L16336:
	movq	16(%r15), %r13
	testq	%r13, %r13
	je	.L16339
	xorl	%r15d, %r15d
.L12912:
	movq	8(%r13), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L12839
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L12839
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L12844
	cmpw	$34, %ax
	je	.L12844
	movq	32(%rcx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L12846
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L17771
	xorl	%r12d, %r12d
	cmpw	$33, %dx
	je	.L17772
.L12846:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12857
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17773
	cmpw	$33, (%rbp)
	je	.L17774
.L12865:
	xorl	%ebx, %ebx
.L12857:
	testq	%r12, %r12
	je	.L12844
	testq	%rbx, %rbx
	je	.L12844
	movzwl	(%r12), %r14d
	movslq	%r14d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L17775
.L12868:
	xorl	%eax, %eax
.L12869:
	testl	%eax, %eax
	jne	.L17776
.L12844:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12870
	testb	$16, 3(%rax)
	je	.L12870
	cmpw	$36, (%rax)
	je	.L12870
.L12871:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12872
	testb	$16, 3(%rax)
	je	.L12872
	cmpw	$36, (%rax)
	je	.L12872
	movq	%rax, %rbx
	jmp	.L12871
.L12872:
	cmpq	%rbx, 1696(%rsp)
	je	.L12839
	movq	%rbx, %rbp
.L12870:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r9d
	testq	%rsi, %rsi
	movq	%rsi, %rbx
	je	.L12877
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r10
	testq	%r10, %r10
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rdx
	leaq	(%rdx,%rdx,2), %rdi
	movslq	8(%rbp),%rdx
	salq	$4, %rdi
	movslq	16(%rdi,%r14),%r12
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rcx
	movl	16(%rcx,%r14), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12881
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12882
	movl	$14, %r11d
.L12881:
	testl	%r9d, %r9d
	je	.L12887
	cmpl	%r11d, %r15d
	jge	.L12839
.L12877:
	testl	%r9d, %r9d
	je	.L12887
	movq	1696(%rsp), %r10
	movq	48(%r10), %rdi
	testq	%rdi, %rdi
	je	.L12887
.L12905:
	cmpq	%rbp, 8(%rdi)
	je	.L17777
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12905
.L12887:
	movq	1696(%rsp), %rbx
	movq	%rbp, %rdi
	movq	48(%rbx), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L12839
	testl	%r15d, %r15d
	jne	.L12907
	movslq	8(%rbp),%r14
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r14,%r14,2), %r9
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r9
	salq	$4, %r12
	movl	16(%r9,%r11), %ecx
	movslq	16(%r12,%r11),%rdi
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17396:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L12839:
	movq	16(%r13), %r13
	testq	%r13, %r13
	jne	.L12912
.L16339:
	cmpq	$0, 40(%rsp)
	je	.L12677
.L12680:
	incl	68(%rsp)
	cmpl	$63, 68(%rsp)
	jbe	.L12915
.L12677:
	incl	52(%rsp)
	movl	$0, 68(%rsp)
	cmpl	$1, 52(%rsp)
	jbe	.L12916
.L16330:
	movq	56(%rsp), %r15
	movl	$0, 52(%rsp)
	movq	(%r15), %r13
	testq	%r13, %r13
	movq	%r13, 56(%rsp)
	jne	.L12917
	jmp	.L12918
	.p2align 6,,7
.L12907:
	cmpl	$14, %r15d
	je	.L16940
	cmpl	$15, %r15d
.L17711:
	jne	.L12839
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17395:
	movslq	8(%rbp),%rdi
	leaq	(%rdi,%rdi,2), %r10
	salq	$4, %r10
	movl	16(%r10,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17396
.L16940:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r14
	leaq	(%r14,%r14,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17395
.L17777:
	testq	%rbx, %rbx
	je	.L12893
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17779
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%rbp),%r12
	movq	h_i_d(%rip), %r14
	movslq	8(%rsi),%rdx
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r14),%r10
	movl	16(%r11,%r14), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%r10,8), %rax
.L17394:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12893:
	movzbl	2(%rdi), %r10d
	cmpl	%r10d, %r15d
	jge	.L12898
	movb	$0, 2(%rdi)
.L12898:
	testq	%rbx, %rbx
	je	.L12839
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16939
	cmpb	$14, %al
	je	.L16940
	cmpb	$15, %al
	jmp	.L17711
.L16939:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rdi
	movq	h_i_d(%rip), %r10
	movslq	8(%rax),%r11
	leaq	(%rdi,%rdi,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r10), %ecx
	leaq	(%r11,%r11,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%r10),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%rbx,%r8,8), %rax
	jmp	.L17396
.L17779:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%r14), %ecx
	leaq	(%rsi,%rsi,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%r14),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17394
.L12882:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r10,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12884
	movl	$15, %r11d
	jmp	.L12881
.L12884:
	xorl	%r9d, %r9d
	jmp	.L12881
.L17776:
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12844
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12839
	jmp	.L12844
.L17775:
	movzwl	(%rbx), %edi
	movslq	%edi,%rcx
	cmpb	$60, rtx_class(%rcx)
	jne	.L12868
	call	reverse_condition
	cmpl	%eax, %r14d
	jne	.L12868
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%r12)
	jne	.L12868
	movq	16(%rbx), %rax
	cmpq	%rax, 16(%r12)
	jne	.L12868
	movl	$1, %eax
	jmp	.L12869
	.p2align 6,,7
.L17774:
	cmpw	$47, %dx
	jne	.L12865
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12865
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12865
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17780
	movq	24(%rbx), %rax
.L12863:
	cmpw	$67, (%rax)
	jne	.L12865
	cmpq	%rsi, %rcx
	jne	.L12865
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12857
.L17780:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12857
	jmp	.L12863
	.p2align 6,,7
.L17773:
	movq	8(%rax), %rbx
	jmp	.L12857
.L17772:
	cmpw	$47, %cx
	je	.L17781
.L12854:
	xorl	%r12d, %r12d
	jmp	.L12846
.L17781:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12854
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12854
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L17782
	movq	24(%r12), %rax
.L12852:
	cmpw	$67, (%rax)
	jne	.L12854
	cmpq	%rsi, %rcx
	jne	.L12854
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L12846
.L17782:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L12846
	jmp	.L12852
	.p2align 6,,7
.L17771:
	movq	8(%rax), %r12
	jmp	.L12846
.L12830:
	xorl	%esi, %esi
	cmpl	$14, %esi
	je	.L16938
	xorl	%edx, %edx
	cmpl	$15, %edx
.L17710:
	jne	.L12762
	movq	1696(%rsp), %rdi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdi),%r10
	leaq	(%r10,%r10,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17392:
	movslq	8(%rbp),%r11
	leaq	(%r11,%r11,2), %r9
	salq	$4, %r9
	movl	16(%r9,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17393
.L16938:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17392
.L17770:
	testq	%rbx, %rbx
	je	.L12816
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17784
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%rbp),%r12
	movq	h_i_d(%rip), %r14
	movslq	8(%rsi),%rcx
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%r11,%r14), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r14),%r10
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%r10,8), %rax
.L17391:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12816:
	movzbl	2(%rdi), %r10d
	xorl	%eax, %eax
	cmpl	%r10d, %eax
	jge	.L12821
	movb	$0, 2(%rdi)
.L12821:
	testq	%rbx, %rbx
	je	.L12762
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16937
	cmpb	$14, %al
	je	.L16938
	cmpb	$15, %al
	jmp	.L17710
.L16937:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r11
	movq	h_i_d(%rip), %r9
	movslq	8(%rax),%r12
	leaq	(%r11,%r11,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%r9), %ecx
	leaq	(%r12,%r12,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r9),%r8
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%rbx,%r8,8), %rax
	jmp	.L17393
.L17784:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%r8
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r12), %ecx
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%r12),%r11
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17391
.L12805:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r10,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12807
	movl	$15, %r11d
	jmp	.L12804
.L12807:
	xorl	%r9d, %r9d
	jmp	.L12804
.L17769:
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12767
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12762
	jmp	.L12767
.L17768:
	movzwl	(%rbx), %edi
	movslq	%edi,%r11
	cmpb	$60, rtx_class(%r11)
	jne	.L12791
	call	reverse_condition
	cmpl	%eax, %r14d
	jne	.L12791
	movq	8(%rbx), %rcx
	cmpq	%rcx, 8(%r12)
	jne	.L12791
	movq	16(%rbx), %rax
	cmpq	%rax, 16(%r12)
	jne	.L12791
	movl	$1, %eax
	jmp	.L12792
	.p2align 6,,7
.L17767:
	cmpw	$47, %dx
	jne	.L12788
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12788
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12788
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17785
	movq	24(%rbx), %rax
.L12786:
	cmpw	$67, (%rax)
	jne	.L12788
	cmpq	%rsi, %rcx
	jne	.L12788
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12780
.L17785:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12780
	jmp	.L12786
	.p2align 6,,7
.L17766:
	movq	8(%rax), %rbx
	jmp	.L12780
.L17765:
	cmpw	$47, %cx
	je	.L17786
.L12777:
	xorl	%r12d, %r12d
	jmp	.L12769
.L17786:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12777
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12777
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L17787
	movq	24(%r12), %rax
.L12775:
	cmpw	$67, (%rax)
	jne	.L12777
	cmpq	%rsi, %rcx
	jne	.L12777
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L12769
.L17787:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L12769
	jmp	.L12775
	.p2align 6,,7
.L17764:
	movq	8(%rax), %r12
	jmp	.L12769
.L12753:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16936
	movl	$14, %esi
	cmpl	$15, %esi
.L17709:
	jne	.L12685
	movq	1696(%rsp), %rdi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdi),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17389:
	movslq	8(%rbp),%r10
	leaq	(%r10,%r10,2), %r9
	salq	$4, %r9
	movl	16(%r9,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17390
.L16936:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17389
.L17763:
	testq	%r11, %r11
	je	.L12739
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17789
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r12
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rsi
	leaq	(%r12,%r12,2), %r10
	salq	$4, %r10
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r14),%rbx
	movl	16(%r10,%r14), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17388:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12739:
	movzbl	2(%rdi), %edx
	movl	$14, %ebx
	cmpl	%edx, %ebx
	jge	.L12744
	movb	$14, 2(%rdi)
.L12744:
	testq	%r11, %r11
	je	.L12685
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16935
	cmpb	$14, %al
	je	.L16936
	cmpb	$15, %al
	jmp	.L17709
.L16935:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r9
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r14
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rdi), %ecx
	leaq	(%r14,%r14,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r11,%r8,8), %rax
	jmp	.L17390
.L17789:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%r14), %ecx
	leaq	(%rsi,%rsi,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%r14),%r9
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17388
	.p2align 6,,7
.L12728:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r10,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12730
	movl	$15, %ebx
	jmp	.L12727
.L12730:
	xorl	%r9d, %r9d
	jmp	.L12727
.L17762:
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12690
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12685
	jmp	.L12690
.L17761:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L12714
	call	reverse_condition
	cmpl	%eax, %r14d
	jne	.L12714
	movq	8(%rbx), %r11
	cmpq	%r11, 8(%r12)
	jne	.L12714
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%r12)
	jne	.L12714
	movl	$1, %eax
	jmp	.L12715
	.p2align 6,,7
.L17760:
	cmpw	$47, %dx
	jne	.L12711
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12711
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12711
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17790
	movq	24(%rbx), %rax
.L12709:
	cmpw	$67, (%rax)
	jne	.L12711
	cmpq	%rsi, %rcx
	jne	.L12711
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12703
.L17790:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12703
	jmp	.L12709
	.p2align 6,,7
.L17759:
	movq	8(%rax), %rbx
	jmp	.L12703
.L17758:
	cmpw	$47, %cx
	je	.L17791
.L12700:
	xorl	%r12d, %r12d
	jmp	.L12692
.L17791:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12700
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12700
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L17792
	movq	24(%r12), %rax
.L12698:
	cmpw	$67, (%rax)
	jne	.L12700
	cmpq	%rsi, %rcx
	jne	.L12700
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L12692
.L17792:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L12692
	jmp	.L12698
	.p2align 6,,7
.L17757:
	movq	8(%rax), %r12
	jmp	.L12692
.L12660:
	movq	1704(%rsp), %r15
	movq	reg_pending_uses(%rip), %rdx
	movl	$2, %ecx
	addq	$80, %r15
	movq	%r15, %rdi
	movq	%r15, %rsi
	call	bitmap_operation
	movl	$2, %ecx
	movq	reg_pending_clobbers(%rip), %rdx
	movq	%r15, %rdi
	movq	%r15, %rsi
	call	bitmap_operation
	movl	$2, %ecx
	movq	reg_pending_sets(%rip), %rdx
	movq	%r15, %rdi
	movq	%r15, %rsi
	call	bitmap_operation
	jmp	.L12959
	.p2align 6,,7
.L12657:
	movb	$1, reg_pending_barrier(%rip)
	jmp	.L12656
.L17735:
	movq	1696(%rsp), %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12422
	cmpw	$35, (%rax)
	je	.L17793
.L12422:
	leaq	1712(%rsp), %r12
	movq	%r12, %rdi
	call	bitmap_initialize
	movq	current_sched_info(%rip), %r13
	movq	%r12, %rsi
	movq	1696(%rsp), %rdi
	call	*56(%r13)
	movq	reg_pending_uses(%rip), %rdi
	movq	%r12, %rdx
	movl	$2, %ecx
	movq	%rdi, %rsi
	call	bitmap_operation
	movq	%r12, %rdi
	call	bitmap_clear
	movq	1704(%rsp), %r10
	movq	16(%r10), %r14
	testq	%r14, %r14
	je	.L16318
	movl	$15, %r15d
.L12498:
	movq	8(%r14), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L12428
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L12428
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L12430
	cmpw	$34, %ax
	je	.L12430
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L12432
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17794
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L17795
.L12432:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12443
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17796
	cmpw	$33, (%r13)
	je	.L17797
.L12451:
	xorl	%ebx, %ebx
.L12443:
	testq	%rbp, %rbp
	je	.L12430
	testq	%rbx, %rbx
	je	.L12430
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdx
	cmpb	$60, rtx_class(%rdx)
	je	.L17798
.L12454:
	xorl	%eax, %eax
.L12455:
	testl	%eax, %eax
	jne	.L17799
.L12430:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12456
	testb	$16, 3(%rax)
	je	.L12456
	cmpw	$36, (%rax)
	je	.L12456
.L12457:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12458
	testb	$16, 3(%rax)
	je	.L12458
	cmpw	$36, (%rax)
	je	.L12458
	movq	%rax, %rbx
	jmp	.L12457
.L12458:
	cmpq	%rbx, 1696(%rsp)
	je	.L12428
	movq	%rbx, %r13
.L12456:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L12463
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12467
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12468
	movl	$14, %r11d
.L12467:
	testl	%ebx, %ebx
	je	.L12473
	cmpl	%r11d, %r15d
	jge	.L12428
.L12463:
	testl	%ebx, %ebx
	je	.L12473
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L12473
.L12491:
	cmpq	%r13, 8(%rdi)
	je	.L17800
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12491
.L12473:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L12428
	testl	%r15d, %r15d
	jne	.L12493
	movslq	8(%r13),%rbp
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %rbx
	leaq	(%rbp,%rbp,2), %r11
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r11
	salq	$4, %rdx
	movl	16(%r11,%rbx), %ecx
	movslq	16(%rdx,%rbx),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17381:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L12428:
	movq	16(%r14), %r14
	testq	%r14, %r14
	jne	.L12498
.L16318:
	movq	1704(%rsp), %r11
	movq	(%r11), %r14
	movq	8(%r11), %r15
	testq	%r14, %r14
	movq	%r15, 72(%rsp)
	je	.L16321
.L12574:
	movq	72(%rsp), %rax
	movq	8(%rax), %rbx
	testb	$8, 3(%rbx)
	je	.L12502
	movq	8(%r14), %r13
	movl	$15, %r15d
	cmpq	%r13, 1696(%rsp)
	je	.L12502
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L12502
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L12506
	cmpw	$34, %ax
	je	.L12506
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L12508
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17801
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L17802
.L12508:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12519
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17803
	cmpw	$33, (%r13)
	je	.L17804
.L12527:
	xorl	%ebx, %ebx
.L12519:
	testq	%rbp, %rbp
	je	.L12506
	testq	%rbx, %rbx
	je	.L12506
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r10
	cmpb	$60, rtx_class(%r10)
	je	.L17805
.L12530:
	xorl	%eax, %eax
.L12531:
	testl	%eax, %eax
	jne	.L17806
.L12506:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12532
	testb	$16, 3(%rax)
	je	.L12532
	cmpw	$36, (%rax)
	je	.L12532
.L12533:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12534
	testb	$16, 3(%rax)
	je	.L12534
	cmpw	$36, (%rax)
	je	.L12534
	movq	%rax, %rbx
	jmp	.L12533
.L12534:
	cmpq	%rbx, 1696(%rsp)
	je	.L12502
	movq	%rbx, %r13
.L12532:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L12539
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12543
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12544
	movl	$14, %r11d
.L12543:
	testl	%ebx, %ebx
	je	.L12549
	cmpl	%r11d, %r15d
	jge	.L12502
.L12539:
	testl	%ebx, %ebx
	je	.L12549
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L12549
.L12567:
	cmpq	%r13, 8(%rdi)
	je	.L17807
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12567
.L12549:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L12502
	testl	%r15d, %r15d
	jne	.L12569
	movslq	8(%r13),%rbx
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%rbx,%rbx,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r11), %ecx
	movslq	16(%rbp,%r11),%r15
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17384:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L12502:
	movq	72(%rsp), %r15
	movq	16(%r14), %r14
	movq	16(%r15), %rdx
	testq	%r14, %r14
	movq	%rdx, 72(%rsp)
	jne	.L12574
.L16321:
	movq	1704(%rsp), %r14
	movq	40(%r14), %r15
	testq	%r15, %r15
	je	.L12421
	movl	$14, %r14d
.L12650:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L12577
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L12577
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L12582
	cmpw	$34, %ax
	je	.L12582
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L12584
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17808
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L17809
.L12584:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12595
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17810
	cmpw	$33, (%r13)
	je	.L17811
.L12603:
	xorl	%ebx, %ebx
.L12595:
	testq	%rbp, %rbp
	je	.L12582
	testq	%rbx, %rbx
	je	.L12582
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L17812
.L12606:
	xorl	%eax, %eax
.L12607:
	testl	%eax, %eax
	jne	.L17813
.L12582:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12608
	testb	$16, 3(%rax)
	je	.L12608
	cmpw	$36, (%rax)
	je	.L12608
.L12609:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12610
	testb	$16, 3(%rax)
	je	.L12610
	cmpw	$36, (%rax)
	je	.L12610
	movq	%rax, %rbx
	jmp	.L12609
.L12610:
	cmpq	%rbx, 1696(%rsp)
	je	.L12577
	movq	%rbx, %r13
.L12608:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L12615
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12619
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12620
	movl	$14, %r11d
.L12619:
	testl	%ebx, %ebx
	je	.L12625
	cmpl	%r11d, %r14d
	jge	.L12577
.L12615:
	testl	%ebx, %ebx
	je	.L12625
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L12625
.L12643:
	cmpq	%r13, 8(%rdi)
	je	.L17814
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12643
.L12625:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L12577
	testl	%r14d, %r14d
	jne	.L12645
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rbx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %rbx
	salq	$4, %r12
	movl	16(%rbx,%r9), %ecx
	movslq	16(%r12,%r9),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17387:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L12577:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L12650
	jmp	.L12421
.L12645:
	cmpl	$14, %r14d
	je	.L16934
	cmpl	$15, %r14d
.L17708:
	jne	.L12577
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17386:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17387
.L16934:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17386
.L17814:
	testq	%r10, %r10
	je	.L12631
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17816
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17385:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12631:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L12636
	movb	$14, 2(%rdi)
.L12636:
	testq	%r10, %r10
	je	.L12577
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16933
	cmpb	$14, %al
	je	.L16934
	cmpb	$15, %al
	jmp	.L17708
.L16933:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r9
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17387
.L17816:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17385
	.p2align 6,,7
.L12620:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12622
	movl	$15, %r11d
	jmp	.L12619
.L12622:
	xorl	%ebx, %ebx
	jmp	.L12619
.L17813:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12582
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12577
	jmp	.L12582
	.p2align 6,,7
.L17812:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L12606
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L12606
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rbp)
	jne	.L12606
	movq	16(%rbx), %r11
	cmpq	%r11, 16(%rbp)
	jne	.L12606
	movl	$1, %eax
	jmp	.L12607
	.p2align 6,,7
.L17811:
	cmpw	$47, %dx
	jne	.L12603
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12603
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12603
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17817
	movq	24(%rbx), %rax
.L12601:
	cmpw	$67, (%rax)
	jne	.L12603
	cmpq	%rsi, %rcx
	jne	.L12603
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12595
.L17817:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12595
	jmp	.L12601
	.p2align 6,,7
.L17810:
	movq	8(%rax), %rbx
	jmp	.L12595
.L17809:
	cmpw	$47, %dx
	je	.L17818
.L12592:
	xorl	%ebp, %ebp
	jmp	.L12584
.L17818:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12592
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12592
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L17819
	movq	24(%rbp), %rax
.L12590:
	cmpw	$67, (%rax)
	jne	.L12592
	cmpq	%rsi, %rcx
	jne	.L12592
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L12584
.L17819:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L12584
	jmp	.L12590
	.p2align 6,,7
.L17808:
	movq	8(%rax), %rbp
	jmp	.L12584
.L12569:
	cmpl	$14, %r15d
	je	.L16932
	cmpl	$15, %r15d
.L17707:
	jne	.L12502
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17383:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17384
.L16932:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17383
	.p2align 6,,7
.L17807:
	testq	%r10, %r10
	je	.L12555
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17821
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %rbx
	salq	$4, %rbx
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%rbx,%rbp), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17382:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12555:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r15d
	jge	.L12560
	movb	$15, 2(%rdi)
.L12560:
	testq	%r10, %r10
	je	.L12502
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16931
	cmpb	$14, %al
	je	.L16932
	cmpb	$15, %al
	jmp	.L17707
.L16931:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%r9
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r9,%r9,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17384
.L17821:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r11
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17382
	.p2align 6,,7
.L12544:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12546
	movl	$15, %r11d
	jmp	.L12543
.L12546:
	xorl	%ebx, %ebx
	jmp	.L12543
.L17806:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12506
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12502
	jmp	.L12506
.L17805:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L12530
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L12530
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L12530
	movq	16(%rbx), %rsi
	cmpq	%rsi, 16(%rbp)
	jne	.L12530
	movl	$1, %eax
	jmp	.L12531
	.p2align 6,,7
.L17804:
	cmpw	$47, %dx
	jne	.L12527
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12527
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12527
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17822
	movq	24(%rbx), %rax
.L12525:
	cmpw	$67, (%rax)
	jne	.L12527
	cmpq	%rsi, %rcx
	jne	.L12527
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12519
.L17822:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12519
	jmp	.L12525
	.p2align 6,,7
.L17803:
	movq	8(%rax), %rbx
	jmp	.L12519
.L17802:
	cmpw	$47, %dx
	je	.L17823
.L12516:
	xorl	%ebp, %ebp
	jmp	.L12508
.L17823:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12516
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12516
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L17824
	movq	24(%rbp), %rax
.L12514:
	cmpw	$67, (%rax)
	jne	.L12516
	cmpq	%rsi, %rcx
	jne	.L12516
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L12508
.L17824:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L12508
	jmp	.L12514
	.p2align 6,,7
.L17801:
	movq	8(%rax), %rbp
	jmp	.L12508
.L12493:
	cmpl	$14, %r15d
	je	.L16930
	cmpl	$15, %r15d
.L17706:
	jne	.L12428
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17380:
	movslq	8(%r13),%r9
	leaq	(%r9,%r9,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17381
.L16930:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%rbp
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17380
.L17800:
	testq	%r10, %r10
	je	.L12479
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17826
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %rbx
	salq	$4, %rbx
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%rbx,%rbp), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17379:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12479:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r15d
	jge	.L12484
	movb	$15, 2(%rdi)
.L12484:
	testq	%r10, %r10
	je	.L12428
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16929
	cmpb	$14, %al
	je	.L16930
	cmpb	$15, %al
	jmp	.L17706
.L16929:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %r9
	movslq	8(%rax),%rbx
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%r9), %ecx
	leaq	(%rbx,%rbx,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%r9),%r12
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17381
.L17826:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r11
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17379
	.p2align 6,,7
.L12468:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12470
	movl	$15, %r11d
	jmp	.L12467
.L12470:
	xorl	%ebx, %ebx
	jmp	.L12467
.L17799:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12430
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12428
	jmp	.L12430
	.p2align 6,,7
.L17798:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L12454
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L12454
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rbp)
	jne	.L12454
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%rbp)
	jne	.L12454
	movl	$1, %eax
	jmp	.L12455
	.p2align 6,,7
.L17797:
	cmpw	$47, %dx
	jne	.L12451
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12451
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12451
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17827
	movq	24(%rbx), %rax
.L12449:
	cmpw	$67, (%rax)
	jne	.L12451
	cmpq	%rsi, %rcx
	jne	.L12451
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12443
.L17827:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12443
	jmp	.L12449
	.p2align 6,,7
.L17796:
	movq	8(%rax), %rbx
	jmp	.L12443
.L17795:
	cmpw	$47, %dx
	je	.L17828
.L12440:
	xorl	%ebp, %ebp
	jmp	.L12432
.L17828:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12440
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12440
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L17829
	movq	24(%rbp), %rax
.L12438:
	cmpw	$67, (%rax)
	jne	.L12440
	cmpq	%rsi, %rcx
	jne	.L12440
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L12432
.L17829:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L12432
	jmp	.L12438
	.p2align 6,,7
.L17794:
	movq	8(%rax), %rbp
	jmp	.L12432
.L17793:
	movb	$1, reg_pending_barrier(%rip)
	jmp	.L12421
.L17734:
	movq	64(%rdx), %r14
	testq	%r14, %r14
	movq	%r14, 496(%rsp)
	je	.L16174
.L12419:
	movq	496(%rsp), %rdi
	movq	8(%rdi), %rbx
	movzwl	(%rbx), %eax
	movq	%rbx, 1608(%rsp)
	cmpw	$49, %ax
	je	.L17830
	cmpq	$0, 1608(%rsp)
	je	.L9008
	movq	1608(%rsp), %r15
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L11334
	mov	%eax, %r9d
	jmp	*.L12405(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L12405:
	.quad	.L11625
	.quad	.L11625
	.quad	.L11334
	.quad	.L11625
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11612
	.quad	.L11334
	.quad	.L9008
	.quad	.L9008
	.quad	.L9008
	.quad	.L11334
	.quad	.L9008
	.quad	.L11334
	.quad	.L11334
	.quad	.L11341
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11372
	.quad	.L9008
	.quad	.L9008
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11334
	.quad	.L11637
	.quad	.L11637
	.quad	.L11637
	.quad	.L11637
	.quad	.L12021
	.quad	.L12021
	.text
.L11341:
	movq	1608(%rsp), %rbx
	movl	8(%rbx), %ebp
	cmpl	$52, %ebp
	jg	.L11342
	leal	-8(%rbp), %r14d
	cmpl	$7, %r14d
	jbe	.L11345
	leal	-21(%rbp), %r12d
	cmpl	$7, %r12d
	jbe	.L11345
	leal	-45(%rbp), %r8d
	cmpl	$7, %r8d
	jbe	.L11345
	leal	-29(%rbp), %ecx
	cmpl	$7, %ecx
	ja	.L11343
.L11345:
	movq	1608(%rsp), %rax
	movzbq	2(%rax), %r13
	movl	mode_class(,%r13,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17338:
	addl	$2, %eax
.L11344:
	movl	%eax, %ebx
	decl	%ebx
	js	.L9008
.L11365:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L11365
.L9008:
	movq	496(%rsp), %rdi
	movq	16(%rdi), %r14
	testq	%r14, %r14
	movq	%r14, 496(%rsp)
	jne	.L12419
.L16174:
	movq	1696(%rsp), %rdi
	xorl	%edx, %edx
	movl	$28, %esi
	call	find_reg_note
	testq	%rax, %rax
	je	.L16672
	movq	1696(%rsp), %rbx
	movb	$1, reg_pending_barrier(%rip)
	movzwl	(%rbx), %eax
	jmp	.L9005
.L16672:
	movq	1696(%rsp), %r15
	movzwl	(%r15), %eax
	jmp	.L9005
.L11343:
	movq	1608(%rsp), %rdi
	movzbl	2(%rdi), %eax
	cmpb	$18, %al
	je	.L17831
	cmpb	$24, %al
	je	.L17832
	movl	target_flags(%rip), %r10d
	testl	$33554432, %r10d
	movl	%r10d, %ecx
	je	.L11356
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r11d
	leal	7(%r11), %edx
.L11357:
	andl	$33554432, %ecx
	je	.L11358
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L11344
.L11358:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L11344
.L11356:
	movzbl	%al, %r9d 
	movzbl	mode_size(%r9), %r15d
	leal	3(%r15), %edx
	jmp	.L11357
.L17832:
	xorl	%esi, %esi
	testb	$2, target_flags+3(%rip)
	sete	%sil
	leal	4(%rsi,%rsi), %eax
	jmp	.L11344
.L17831:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17338
	.p2align 6,,7
.L11342:
	movq	1704(%rsp), %rbx
	cmpl	68(%rbx), %ebp
	jl	.L11367
	movq	1696(%rsp), %r14
	movq	32(%r14), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L9008
.L17569:
	movl	$.LC0, %edi
	movl	$758, %esi
	movl	$.LC1, %edx
	jmp	.L17403
.L11367:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %r12d
	testl	%r12d, %r12d
	jne	.L16645
	movq	reg_known_equiv_p(%rip), %r8
	movslq	%ebp,%rbx
	addq	%rbx, %r8
	cmpb	$0, (%r8)
	je	.L11370
	leaq	0(,%rbx,8), %rcx
	addq	reg_known_value(%rip), %rcx
	movq	(%rcx), %rax
	cmpw	$66, (%rax)
	je	.L17833
.L11370:
	leaq	0(,%rbx,8), %rsi
	addq	reg_n_info(%rip), %rsi
	movq	32(%rsi), %rdi
	movl	32(%rdi), %r13d
	testl	%r13d, %r13d
	jne	.L9008
	movq	1704(%rsp), %rax
	movq	1696(%rsp), %rdi
	movq	56(%rax), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r10
	movq	%rax, 56(%r10)
	jmp	.L9008
.L17833:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L11370
.L16645:
	movslq	%ebp,%rbx
	jmp	.L11370
	.p2align 6,,7
.L11625:
	cmpl	$41, %ebx
	je	.L17834
.L11627:
	movb	$1, reg_pending_barrier(%rip)
.L11626:
	cmpl	$41, %ebx
	je	.L17835
.L11334:
	movslq	%ebx,%rdx
	movzbl	rtx_length(%rdx), %ebp
	movq	rtx_format(,%rdx,8), %r13
	movl	%ebp, %r12d
	decl	%r12d
	js	.L9008
	movq	1608(%rsp), %r14
	addq	$8, %r14
.L12418:
	movslq	%r12d,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L17836
	cmpb	$69, %dl
	je	.L17837
.L12408:
	decl	%r12d
	jns	.L12418
	jmp	.L9008
.L17837:
	movq	1608(%rsp), %r8
	xorl	%ebx, %ebx
	leaq	8(%r8,%rax,8), %rdx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L12408
	movq	%rdx, %rbp
.L12417:
	movq	(%rbp), %r9
	movslq	%ebx,%r11
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %r9
	movq	(%r9,%r11,8), %rsi
	call	sched_analyze_2
	movq	(%rbp), %rcx
	cmpl	(%rcx), %ebx
	jl	.L12417
	jmp	.L12408
.L17836:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L12408
.L17835:
	movq	1608(%rsp), %r13
	xorl	%ebx, %ebx
	movq	32(%r13), %rdx
	cmpl	(%rdx), %ebx
	jge	.L9008
.L11633:
	movslq	%ebx,%rbp
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%rbp,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1608(%rsp), %r12
	movq	32(%r12), %r14
	cmpl	(%r14), %ebx
	movq	%r14, %rdx
	jl	.L11633
	jmp	.L9008
	.p2align 6,,7
.L17834:
	movq	1608(%rsp), %rsi
	testb	$8, 3(%rsi)
	je	.L11626
	jmp	.L11627
.L11612:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r11, %rsi
	movl	$0, 32(%r11)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rdi
	movq	%rax, 40(%rdi)
	movl	$1, 36(%rdi)
	jmp	.L11334
.L11372:
	movq	current_sched_info(%rip), %r11
	movq	1608(%rsp), %r15
	testb	$2, 96(%r11)
	jne	.L17838
.L11373:
	movq	1704(%rsp), %r14
	movq	1704(%rsp), %rbp
	movq	(%r14), %r9
	movq	8(%rbp), %rbx
	testq	%r9, %r9
	movq	%r9, 200(%rsp)
	movq	%rbx, 208(%rsp)
	jne	.L11453
.L16272:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %rbx
	movq	16(%rcx), %r11
	movq	24(%rbx), %r9
	testq	%r11, %r11
	movq	%r11, 184(%rsp)
	movq	%r9, 192(%rsp)
	jne	.L11529
.L16275:
	movq	1704(%rsp), %r10
	movq	40(%r10), %r15
	testq	%r15, %r15
	movq	%r15, 176(%rsp)
	je	.L16278
.L11609:
	movq	176(%rsp), %r9
	movq	8(%r9), %r14
	cmpw	$33, (%r14)
	je	.L17839
.L11535:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	movl	$14, %r15d
	je	.L11532
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L11532
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11541
	cmpw	$34, %ax
	je	.L11541
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L11543
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17840
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L17841
.L11543:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11554
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17842
	cmpw	$33, (%r14)
	je	.L17843
.L11562:
	xorl	%ebx, %ebx
.L11554:
	testq	%rbp, %rbp
	je	.L11541
	testq	%rbx, %rbx
	je	.L11541
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L17844
.L11565:
	xorl	%eax, %eax
.L11566:
	testl	%eax, %eax
	jne	.L17845
.L11541:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11567
	testb	$16, 3(%rax)
	je	.L11567
	cmpw	$36, (%rax)
	je	.L11567
.L11568:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11569
	testb	$16, 3(%rax)
	je	.L11569
	cmpw	$36, (%rax)
	je	.L11569
	movq	%rax, %rbx
	jmp	.L11568
.L11569:
	cmpq	%rbx, 1696(%rsp)
	je	.L11532
	movq	%rbx, %r13
.L11567:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11574
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%rbp
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	leaq	(%rbp,%rbp,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r12
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	movl	%edx, %ecx
	leaq	0(,%r12,8), %rdi
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11578
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11579
	movl	$14, %r11d
.L11578:
	testl	%ebx, %ebx
	je	.L11584
	cmpl	%r11d, %r15d
	jge	.L11532
.L11574:
	testl	%ebx, %ebx
	je	.L11584
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L11584
.L11602:
	cmpq	%r13, 8(%rdi)
	je	.L17846
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11602
.L11584:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L11532
	testl	%r15d, %r15d
	jne	.L11604
	movslq	8(%r13),%rsi
	movslq	8(%rdx),%r11
	movq	h_i_d(%rip), %r9
	leaq	(%rsi,%rsi,2), %rdi
	leaq	(%r11,%r11,2), %rbx
	salq	$4, %rdi
	salq	$4, %rbx
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbx,%r9),%r15
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17347:
	andl	$63, %ecx
	movl	$1, %ebp
	salq	%cl, %rbp
	orq	%rbp, 16(%rax)
.L11532:
	movq	176(%rsp), %r8
	movq	16(%r8), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 176(%rsp)
	jne	.L11609
.L16278:
	movq	1704(%rsp), %r10
	movq	1696(%rsp), %rdi
	movq	1608(%rsp), %rbx
	movq	(%r10), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %rcx
	movq	1704(%rsp), %r15
	movq	%rax, (%r15)
	testb	$2, 96(%rcx)
	jne	.L17847
.L11610:
	movq	%rbx, %rsi
	xorl	%edi, %edi
	movq	1704(%rsp), %rbx
	movq	8(%rbx), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r9
	movq	%rax, 8(%r9)
	incl	32(%r9)
	movq	%r9, %rdi
	movq	1608(%rsp), %rax
	movq	8(%rax), %rsi
.L17376:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L9008
.L17847:
	movq	1608(%rsp), %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L11610
.L11604:
	cmpl	$14, %r15d
	je	.L16912
	cmpl	$15, %r15d
.L17695:
	jne	.L11532
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17346:
	movslq	8(%r13),%r12
	leaq	(%r12,%r12,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17347
.L16912:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rdi
	leaq	(%rdi,%rdi,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17346
.L17846:
	testq	%r10, %r10
	je	.L11590
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17849
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rbp
	movslq	8(%r13),%r14
	movq	h_i_d(%rip), %r11
	movslq	8(%rbp),%r12
	leaq	(%r14,%r14,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%r11), %ecx
	leaq	(%r12,%r12,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%r11),%r9
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17345:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11590:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r15d
	jge	.L11595
	movb	$14, 2(%rdi)
.L11595:
	testq	%r10, %r10
	je	.L11532
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16911
	cmpb	$14, %al
	je	.L16912
	cmpb	$15, %al
	jmp	.L17695
.L16911:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%r8
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r15
	leaq	(%r8,%r8,2), %r12
	salq	$4, %r12
	leaq	(%r15,%r15,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r14
	movl	16(%r12,%rbp), %ecx
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r14,8), %rax
	jmp	.L17347
.L17849:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rbp
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r14), %ecx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r14),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17345
	.p2align 6,,7
.L11579:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11581
	movl	$15, %r11d
	jmp	.L11578
.L11581:
	xorl	%ebx, %ebx
	jmp	.L11578
.L17845:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11541
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11532
	jmp	.L11541
.L17844:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L11565
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L11565
	movq	8(%rbx), %r11
	cmpq	%r11, 8(%rbp)
	jne	.L11565
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L11565
	movl	$1, %eax
	jmp	.L11566
	.p2align 6,,7
.L17843:
	cmpw	$47, %dx
	jne	.L11562
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11562
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11562
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17850
	movq	24(%rbx), %rax
.L11560:
	cmpw	$67, (%rax)
	jne	.L11562
	cmpq	%rsi, %rcx
	jne	.L11562
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11554
.L17850:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11554
	jmp	.L11560
	.p2align 6,,7
.L17842:
	movq	8(%rax), %rbx
	jmp	.L11554
.L17841:
	cmpw	$47, %dx
	je	.L17851
.L11551:
	xorl	%ebp, %ebp
	jmp	.L11543
.L17851:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11551
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11551
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L17852
	movq	24(%rbp), %rax
.L11549:
	cmpw	$67, (%rax)
	jne	.L11551
	cmpq	%rsi, %rcx
	jne	.L11551
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L11543
.L17852:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L11543
	jmp	.L11549
	.p2align 6,,7
.L17840:
	movq	8(%rax), %rbp
	jmp	.L11543
.L17839:
	movq	1608(%rsp), %rbx
	movq	8(%rbx), %rdi
	cmpw	$61, (%rdi)
	je	.L17853
.L11536:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L11532
	movq	176(%rsp), %rcx
	movq	8(%rcx), %r14
	jmp	.L11535
.L17853:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L11536
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	cmovne	%rbp, %rdi
	jmp	.L11536
	.p2align 6,,7
.L11529:
	movq	192(%rsp), %r12
	xorl	%esi, %esi
	movq	%r15, %rdx
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L11457
	movq	184(%rsp), %rbp
	xorl	%r14d, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L11457
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L11457
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11461
	cmpw	$34, %ax
	je	.L11461
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L11463
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17854
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L17855
.L11463:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11474
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17856
	cmpw	$33, (%r13)
	je	.L17857
.L11482:
	xorl	%ebx, %ebx
.L11474:
	testq	%rbp, %rbp
	je	.L11461
	testq	%rbx, %rbx
	je	.L11461
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L17858
.L11485:
	xorl	%eax, %eax
.L11486:
	testl	%eax, %eax
	jne	.L17859
.L11461:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11487
	testb	$16, 3(%rax)
	je	.L11487
	cmpw	$36, (%rax)
	je	.L11487
.L11488:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11489
	testb	$16, 3(%rax)
	je	.L11489
	cmpw	$36, (%rax)
	je	.L11489
	movq	%rax, %rbx
	jmp	.L11488
.L11489:
	cmpq	%rbx, 1696(%rsp)
	je	.L11457
	movq	%rbx, %r13
.L11487:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11494
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11498
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11499
	movl	$14, %r11d
.L11498:
	testl	%ebx, %ebx
	je	.L11504
	cmpl	%r11d, %r14d
	jge	.L11457
.L11494:
	testl	%ebx, %ebx
	je	.L11504
	movq	1696(%rsp), %r11
	movq	48(%r11), %rdi
	testq	%rdi, %rdi
	je	.L11504
.L11522:
	cmpq	%r13, 8(%rdi)
	je	.L17860
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11522
.L11504:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L11457
	testl	%r14d, %r14d
	jne	.L11524
	movslq	8(%r13),%rbx
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%rbx,%rbx,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17344:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L11457:
	movq	184(%rsp), %rax
	movq	192(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 184(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 192(%rsp)
	jne	.L11529
	jmp	.L16275
.L11524:
	cmpl	$14, %r14d
	je	.L16910
	cmpl	$15, %r14d
.L17694:
	jne	.L11457
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17343:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17344
.L16910:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17343
.L17860:
	testq	%r10, %r10
	je	.L11510
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17862
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %rbx
	salq	$4, %rbx
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r11
	movl	16(%rbx,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%r11,8), %rax
.L17342:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11510:
	movzbl	2(%rdi), %r11d
	cmpl	%r11d, %r14d
	jge	.L11515
	movb	$0, 2(%rdi)
.L11515:
	testq	%r10, %r10
	je	.L11457
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16909
	cmpb	$14, %al
	je	.L16910
	cmpb	$15, %al
	jmp	.L17694
.L16909:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%r11
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r11,%r11,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17344
.L17862:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17342
.L11499:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11501
	movl	$15, %r11d
	jmp	.L11498
.L11501:
	xorl	%ebx, %ebx
	jmp	.L11498
.L17859:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11461
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11457
	jmp	.L11461
.L17858:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L11485
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L11485
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L11485
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L11485
	movl	$1, %eax
	jmp	.L11486
.L17857:
	cmpw	$47, %dx
	jne	.L11482
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11482
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11482
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17863
	movq	24(%rbx), %rax
.L11480:
	cmpw	$67, (%rax)
	jne	.L11482
	cmpq	%rsi, %rcx
	jne	.L11482
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11474
.L17863:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11474
	jmp	.L11480
.L17856:
	movq	8(%rax), %rbx
	jmp	.L11474
.L17855:
	cmpw	$47, %dx
	je	.L17864
.L11471:
	xorl	%ebp, %ebp
	jmp	.L11463
.L17864:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11471
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11471
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L17865
	movq	24(%rbp), %rax
.L11469:
	cmpw	$67, (%rax)
	jne	.L11471
	cmpq	%rsi, %rcx
	jne	.L11471
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L11463
.L17865:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L11463
	jmp	.L11469
.L17854:
	movq	8(%rax), %rbp
	jmp	.L11463
	.p2align 6,,7
.L11453:
	movq	208(%rsp), %r12
	movq	%r15, %rsi
	movq	8(%r12), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L11381
	movq	200(%rsp), %r8
	movl	$14, %r14d
	movq	8(%r8), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L11381
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L11381
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11385
	cmpw	$34, %ax
	je	.L11385
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L11387
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17866
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L17867
.L11387:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11398
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17868
	cmpw	$33, (%r13)
	je	.L17869
.L11406:
	xorl	%ebx, %ebx
.L11398:
	testq	%rbp, %rbp
	je	.L11385
	testq	%rbx, %rbx
	je	.L11385
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L17870
.L11409:
	xorl	%eax, %eax
.L11410:
	testl	%eax, %eax
	jne	.L17871
.L11385:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11411
	testb	$16, 3(%rax)
	je	.L11411
	cmpw	$36, (%rax)
	je	.L11411
.L11412:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11413
	testb	$16, 3(%rax)
	je	.L11413
	cmpw	$36, (%rax)
	je	.L11413
	movq	%rax, %rbx
	jmp	.L11412
.L11413:
	cmpq	%rbx, 1696(%rsp)
	je	.L11381
	movq	%rbx, %r13
.L11411:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11418
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11422
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11423
	movl	$14, %r11d
.L11422:
	testl	%ebx, %ebx
	je	.L11428
	cmpl	%r11d, %r14d
	jge	.L11381
.L11418:
	testl	%ebx, %ebx
	je	.L11428
	movq	1696(%rsp), %r11
	movq	48(%r11), %rdi
	testq	%rdi, %rdi
	je	.L11428
.L11446:
	cmpq	%r13, 8(%rdi)
	je	.L17872
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11446
.L11428:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L11381
	testl	%r14d, %r14d
	jne	.L11448
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %rbx
	salq	$4, %rdi
	salq	$4, %rbx
	movl	16(%rdi,%r11), %ecx
	movslq	16(%rbx,%r11),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17341:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L11381:
	movq	200(%rsp), %rax
	movq	208(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 200(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 208(%rsp)
	jne	.L11453
	jmp	.L16272
.L11448:
	cmpl	$14, %r14d
	je	.L16908
	cmpl	$15, %r14d
.L17693:
	jne	.L11381
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17340:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17341
.L16908:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17340
.L17872:
	testq	%r10, %r10
	je	.L11434
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17874
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%r11,8), %rax
.L17339:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11434:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L11439
	movb	$14, 2(%rdi)
.L11439:
	testq	%r10, %r10
	je	.L11381
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16907
	cmpb	$14, %al
	je	.L16908
	cmpb	$15, %al
	jmp	.L17693
.L16907:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17341
.L17874:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %ebx
	salq	$3, %r9
	shrl	$6, %ebx
	addq	anti_dependency_cache(%rip), %r9
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17339
.L11423:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11425
	movl	$15, %r11d
	jmp	.L11422
.L11425:
	xorl	%ebx, %ebx
	jmp	.L11422
.L17871:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11385
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11381
	jmp	.L11385
.L17870:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L11409
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L11409
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%rbp)
	jne	.L11409
	movq	16(%rbx), %r10
	cmpq	%r10, 16(%rbp)
	jne	.L11409
	movl	$1, %eax
	jmp	.L11410
.L17869:
	cmpw	$47, %dx
	jne	.L11406
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11406
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11406
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17875
	movq	24(%rbx), %rax
.L11404:
	cmpw	$67, (%rax)
	jne	.L11406
	cmpq	%rsi, %rcx
	jne	.L11406
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11398
.L17875:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11398
	jmp	.L11404
.L17868:
	movq	8(%rax), %rbx
	jmp	.L11398
.L17867:
	cmpw	$47, %dx
	je	.L17876
.L11395:
	xorl	%ebp, %ebp
	jmp	.L11387
.L17876:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11395
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11395
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L17877
	movq	24(%rbp), %rax
.L11393:
	cmpw	$67, (%rax)
	jne	.L11395
	cmpq	%rsi, %rcx
	jne	.L11395
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L11387
.L17877:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L11387
	jmp	.L11393
.L17866:
	movq	8(%rax), %rbp
	jmp	.L11387
	.p2align 6,,7
.L17838:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	testb	$2, target_flags+3(%rip)
	setne	%dl
	movq	8(%rax), %rdi
	movq	%rax, %r15
	movzbl	%dl, %esi
	movl	$1, %edx
	addl	$4, %esi
	call	cselib_lookup
	movq	8(%r15), %rdi
	call	cselib_subst_to_values
	movq	%rax, 8(%r15)
	jmp	.L11373
.L11637:
	movq	1608(%rsp), %r8
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	8(%r8), %rsi
	call	sched_analyze_2
	movq	1608(%rsp), %rdx
	movq	8(%rdx), %rbp
	movzwl	(%rdx), %ebx
	testq	%rbp, %rbp
	je	.L9008
	movl	(%rbp), %edx
	cmpw	$39, %dx
	je	.L17878
	leal	-63(%rdx), %r10d
	cmpw	$1, %r10w
	ja	.L17879
.L11652:
	leal	-132(%rdx), %r9d
	cmpw	$1, %r9w
	jbe	.L17880
.L11651:
	movq	8(%rbp), %rbp
	movl	(%rbp), %edx
	leal	-63(%rdx), %edi
	cmpw	$1, %di
	jbe	.L11652
	cmpw	$133, %dx
	je	.L11652
	cmpw	$132, %dx
	je	.L11652
.L16284:
	cmpw	$61, %dx
	je	.L17881
	cmpw	$66, %dx
	je	.L17882
.L12153:
	movq	1608(%rsp), %rcx
	cmpw	$47, (%rcx)
	jne	.L9008
	movq	1704(%rsp), %rdi
	movq	16(%rcx), %rsi
	jmp	.L17376
.L17882:
	movq	current_sched_info(%rip), %r15
	movq	%rbp, 168(%rsp)
	testb	$2, 96(%r15)
	jne	.L17883
.L11771:
	movq	compiler_params(%rip), %r10
	movq	1704(%rsp), %rcx
	movl	80(%r10), %eax
	cmpl	%eax, 32(%rcx)
	jg	.L17728
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %rsi
	movq	(%rax), %rdx
	movq	8(%rsi), %r12
	testq	%rdx, %rdx
	movq	%rdx, 152(%rsp)
	movq	%r12, 160(%rsp)
	jne	.L11863
.L16290:
	movq	1704(%rsp), %r12
	movq	1704(%rsp), %r9
	movq	16(%r12), %r10
	movq	24(%r9), %r11
	testq	%r10, %r10
	movq	%r10, 136(%rsp)
	movq	%r11, 144(%rsp)
	jne	.L11939
.L16293:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 128(%rsp)
	je	.L16313
	movl	$14, %r15d
.L12015:
	movq	128(%rsp), %r11
	movq	8(%r11), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L11942
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L11942
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11947
	cmpw	$34, %ax
	je	.L11947
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L11949
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17884
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L17885
.L11949:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11960
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17886
	cmpw	$33, (%r14)
	je	.L17887
.L11968:
	xorl	%ebx, %ebx
.L11960:
	testq	%r12, %r12
	je	.L11947
	testq	%rbx, %rbx
	je	.L11947
	movzwl	(%r12), %r13d
	movslq	%r13d,%r9
	cmpb	$60, rtx_class(%r9)
	je	.L17888
.L11971:
	xorl	%eax, %eax
.L11972:
	testl	%eax, %eax
	jne	.L17889
.L11947:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11973
	testb	$16, 3(%rax)
	je	.L11973
	cmpw	$36, (%rax)
	je	.L11973
.L11974:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11975
	testb	$16, 3(%rax)
	je	.L11975
	cmpw	$36, (%rax)
	je	.L11975
	movq	%rax, %rbx
	jmp	.L11974
.L11975:
	cmpq	%rbx, 1696(%rsp)
	je	.L11942
	movq	%rbx, %r14
.L11973:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11980
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%r12
	movl	16(%r13,%rcx), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %r13d
	leaq	0(,%r13,8), %r12
	movq	%r12, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11984
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11985
	movl	$14, %r11d
.L11984:
	testl	%ebx, %ebx
	je	.L11990
	cmpl	%r11d, %r15d
	jge	.L11942
.L11980:
	testl	%ebx, %ebx
	je	.L11990
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L11990
.L12008:
	cmpq	%r14, 8(%rdi)
	je	.L17890
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12008
.L11990:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L11942
	testl	%r15d, %r15d
	jne	.L12010
	movslq	8(%r14),%r12
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r12,%r12,2), %r11
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r11
	salq	$4, %rdx
	movl	16(%r11,%r9), %ecx
	movslq	16(%rdx,%r9),%rdi
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17361:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L11942:
	movq	128(%rsp), %r9
	movq	16(%r9), %r11
	testq	%r11, %r11
	movq	%r11, 128(%rsp)
	jne	.L12015
.L16313:
	movq	1704(%rsp), %r12
	movq	1696(%rsp), %rdi
	movq	%rbp, %rbx
	movq	16(%r12), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r15
	movq	1704(%rsp), %r10
	movq	%rax, 16(%r10)
	testb	$2, 96(%r15)
	jne	.L17891
.L12401:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	24(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r13
	movq	%rax, 24(%r13)
	incl	32(%r13)
.L12171:
	movq	1704(%rsp), %rdi
	movq	8(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L12153
.L17891:
	movq	%rbp, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L12401
.L12010:
	cmpl	$14, %r15d
	je	.L16920
	cmpl	$15, %r15d
.L17699:
	jne	.L11942
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17360:
	movslq	8(%r14),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17361
.L16920:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%r12
	leaq	(%r12,%r12,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17360
.L17890:
	testq	%r10, %r10
	je	.L11996
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17893
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%r9,%r12), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17359:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11996:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r15d
	jge	.L12001
	movb	$14, 2(%rdi)
.L12001:
	testq	%r10, %r10
	je	.L11942
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16919
	cmpb	$14, %al
	je	.L16920
	cmpb	$15, %al
	jmp	.L17699
.L16919:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdi
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%r9
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbx), %ecx
	leaq	(%r9,%r9,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rbx),%r13
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17361
.L17893:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17359
.L11985:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11987
	movl	$15, %r11d
	jmp	.L11984
.L11987:
	xorl	%ebx, %ebx
	jmp	.L11984
.L17889:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11947
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11942
	jmp	.L11947
.L17888:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L11971
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L11971
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%r12)
	jne	.L11971
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%r12)
	jne	.L11971
	movl	$1, %eax
	jmp	.L11972
.L17887:
	cmpw	$47, %dx
	jne	.L11968
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11968
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11968
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17894
	movq	24(%rbx), %rax
.L11966:
	cmpw	$67, (%rax)
	jne	.L11968
	cmpq	%rsi, %rcx
	jne	.L11968
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11960
.L17894:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11960
	jmp	.L11966
.L17886:
	movq	8(%rax), %rbx
	jmp	.L11960
.L17885:
	cmpw	$47, %dx
	je	.L17895
.L11957:
	xorl	%r12d, %r12d
	jmp	.L11949
.L17895:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11957
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11957
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L17896
	movq	24(%r12), %rax
.L11955:
	cmpw	$67, (%rax)
	jne	.L11957
	cmpq	%rsi, %rcx
	jne	.L11957
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L11949
.L17896:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L11949
	jmp	.L11955
.L17884:
	movq	8(%rax), %r12
	jmp	.L11949
.L11939:
	movq	144(%rsp), %r13
	movq	168(%rsp), %rsi
	movq	8(%r13), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L11867
	movq	136(%rsp), %rcx
	movl	$15, %r15d
	movq	8(%rcx), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L11867
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L11867
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11871
	cmpw	$34, %ax
	je	.L11871
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L11873
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17897
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L17898
.L11873:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11884
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17899
	cmpw	$33, (%r14)
	je	.L17900
.L11892:
	xorl	%ebx, %ebx
.L11884:
	testq	%r12, %r12
	je	.L11871
	testq	%rbx, %rbx
	je	.L11871
	movzwl	(%r12), %r13d
	movslq	%r13d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L17901
.L11895:
	xorl	%eax, %eax
.L11896:
	testl	%eax, %eax
	jne	.L17902
.L11871:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11897
	testb	$16, 3(%rax)
	je	.L11897
	cmpw	$36, (%rax)
	je	.L11897
.L11898:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11899
	testb	$16, 3(%rax)
	je	.L11899
	cmpw	$36, (%rax)
	je	.L11899
	movq	%rax, %rbx
	jmp	.L11898
.L11899:
	cmpq	%rbx, 1696(%rsp)
	je	.L11867
	movq	%rbx, %r14
.L11897:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11904
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%r12
	movl	16(%rcx,%r13), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11908
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11909
	movl	$14, %r11d
.L11908:
	testl	%ebx, %ebx
	je	.L11914
	cmpl	%r11d, %r15d
	jge	.L11867
.L11904:
	testl	%ebx, %ebx
	je	.L11914
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L11914
.L11932:
	cmpq	%r14, 8(%rdi)
	je	.L17903
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11932
.L11914:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L11867
	testl	%r15d, %r15d
	jne	.L11934
	movslq	8(%r14),%r11
	movslq	8(%rdx),%r13
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%r13,%r13,2), %r9
	salq	$4, %rdi
	salq	$4, %r9
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r9,%rbx),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17358:
	andl	$63, %ecx
	movl	$1, %r15d
	salq	%cl, %r15
	orq	%r15, 16(%rax)
.L11867:
	movq	136(%rsp), %rax
	movq	144(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 136(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 144(%rsp)
	jne	.L11939
	jmp	.L16293
.L11934:
	cmpl	$14, %r15d
	je	.L16918
	cmpl	$15, %r15d
.L17698:
	jne	.L11867
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r13
	leaq	(%r13,%r13,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17357:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17358
.L16918:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17357
.L17903:
	testq	%r10, %r10
	je	.L11920
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17905
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r13), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r13),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17356:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11920:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r15d
	jge	.L11925
	movb	$15, 2(%rdi)
.L11925:
	testq	%r10, %r10
	je	.L11867
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16917
	cmpb	$14, %al
	je	.L16918
	cmpb	$15, %al
	jmp	.L17698
.L16917:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17358
.L17905:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r12
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%r12,%r12,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%r11
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17356
.L11909:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11911
	movl	$15, %r11d
	jmp	.L11908
.L11911:
	xorl	%ebx, %ebx
	jmp	.L11908
.L17902:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11871
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11867
	jmp	.L11871
.L17901:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L11895
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L11895
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%r12)
	jne	.L11895
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%r12)
	jne	.L11895
	movl	$1, %eax
	jmp	.L11896
.L17900:
	cmpw	$47, %dx
	jne	.L11892
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11892
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11892
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17906
	movq	24(%rbx), %rax
.L11890:
	cmpw	$67, (%rax)
	jne	.L11892
	cmpq	%rsi, %rcx
	jne	.L11892
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11884
.L17906:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11884
	jmp	.L11890
.L17899:
	movq	8(%rax), %rbx
	jmp	.L11884
.L17898:
	cmpw	$47, %dx
	je	.L17907
.L11881:
	xorl	%r12d, %r12d
	jmp	.L11873
.L17907:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11881
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11881
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L17908
	movq	24(%r12), %rax
.L11879:
	cmpw	$67, (%rax)
	jne	.L11881
	cmpq	%rsi, %rcx
	jne	.L11881
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L11873
.L17908:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L11873
	jmp	.L11879
.L17897:
	movq	8(%rax), %r12
	jmp	.L11873
.L11863:
	movq	160(%rsp), %rcx
	movq	168(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L11791
	movq	152(%rsp), %r13
	movl	$14, %r15d
	movq	8(%r13), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L11791
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L11791
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11795
	cmpw	$34, %ax
	je	.L11795
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L11797
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17909
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L17910
.L11797:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11808
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17911
	cmpw	$33, (%r14)
	je	.L17912
.L11816:
	xorl	%ebx, %ebx
.L11808:
	testq	%r12, %r12
	je	.L11795
	testq	%rbx, %rbx
	je	.L11795
	movzwl	(%r12), %r13d
	movslq	%r13d,%r8
	cmpb	$60, rtx_class(%r8)
	je	.L17913
.L11819:
	xorl	%eax, %eax
.L11820:
	testl	%eax, %eax
	jne	.L17914
.L11795:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11821
	testb	$16, 3(%rax)
	je	.L11821
	cmpw	$36, (%rax)
	je	.L11821
.L11822:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11823
	testb	$16, 3(%rax)
	je	.L11823
	cmpw	$36, (%rax)
	je	.L11823
	movq	%rax, %rbx
	jmp	.L11822
.L11823:
	cmpq	%rbx, 1696(%rsp)
	je	.L11791
	movq	%rbx, %r14
.L11821:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11828
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%r12
	movl	16(%r13,%rcx), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %r13d
	leaq	0(,%r13,8), %r12
	movq	%r12, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11832
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11833
	movl	$14, %r11d
.L11832:
	testl	%ebx, %ebx
	je	.L11838
	cmpl	%r11d, %r15d
	jge	.L11791
.L11828:
	testl	%ebx, %ebx
	je	.L11838
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L11838
.L11856:
	cmpq	%r14, 8(%rdi)
	je	.L17915
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11856
.L11838:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L11791
	testl	%r15d, %r15d
	jne	.L11858
	movslq	8(%r14),%r9
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rdi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movl	16(%rdi,%r11), %ecx
	movslq	16(%r12,%r11),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17355:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L11791:
	movq	152(%rsp), %rax
	movq	160(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 152(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r15
	movq	%r15, 160(%rsp)
	jne	.L11863
	jmp	.L16290
.L11858:
	cmpl	$14, %r15d
	je	.L16916
	cmpl	$15, %r15d
.L17697:
	jne	.L11791
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17354:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17355
.L16916:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17354
.L17915:
	testq	%r10, %r10
	je	.L11844
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17917
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%r9,%r12), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17353:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11844:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r15d
	jge	.L11849
	movb	$14, 2(%rdi)
.L11849:
	testq	%r10, %r10
	je	.L11791
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16915
	cmpb	$14, %al
	je	.L16916
	cmpb	$15, %al
	jmp	.L17697
.L16915:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r13
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17355
.L17917:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17353
.L11833:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11835
	movl	$15, %r11d
	jmp	.L11832
.L11835:
	xorl	%ebx, %ebx
	jmp	.L11832
.L17914:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11795
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11791
	jmp	.L11795
.L17913:
	movzwl	(%rbx), %edi
	movslq	%edi,%r11
	cmpb	$60, rtx_class(%r11)
	jne	.L11819
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L11819
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%r12)
	jne	.L11819
	movq	16(%rbx), %r9
	cmpq	%r9, 16(%r12)
	jne	.L11819
	movl	$1, %eax
	jmp	.L11820
.L17912:
	cmpw	$47, %dx
	jne	.L11816
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11816
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11816
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17918
	movq	24(%rbx), %rax
.L11814:
	cmpw	$67, (%rax)
	jne	.L11816
	cmpq	%rsi, %rcx
	jne	.L11816
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11808
.L17918:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11808
	jmp	.L11814
.L17911:
	movq	8(%rax), %rbx
	jmp	.L11808
.L17910:
	cmpw	$47, %dx
	je	.L17919
.L11805:
	xorl	%r12d, %r12d
	jmp	.L11797
.L17919:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11805
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11805
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L17920
	movq	24(%r12), %rax
.L11803:
	cmpw	$67, (%rax)
	jne	.L11805
	cmpq	%rsi, %rcx
	jne	.L11805
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L11797
.L17920:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L11797
	jmp	.L11803
.L17909:
	movq	8(%rax), %r12
	jmp	.L11797
.L17728:
	movq	1696(%rsp), %rdi
	movq	%rcx, %rsi
	movl	$14, %edx
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$8, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r12
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	movq	%r12, %rsi
	movl	$0, 32(%r12)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r9
	movq	%rax, 40(%r9)
	movl	$1, 36(%r9)
	jmp	.L12171
.L17883:
	movq	%rbp, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r9b
	movq	%rax, 168(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r9b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	168(%rsp), %r11
	movq	8(%r11), %rdi
	call	cselib_subst_to_values
	movq	168(%rsp), %r14
	movq	%rax, 8(%r14)
	jmp	.L11771
.L17881:
	movl	8(%rbp), %r12d
	cmpl	$52, %r12d
	jg	.L11654
	leal	-8(%r12), %r11d
	cmpl	$7, %r11d
	jbe	.L11657
	leal	-21(%r12), %esi
	cmpl	$7, %esi
	jbe	.L11657
	leal	-45(%r12), %r13d
	cmpl	$7, %r13d
	jbe	.L11657
	leal	-29(%r12), %r14d
	cmpl	$7, %r14d
	ja	.L11655
.L11657:
	movzbq	2(%rbp), %rdx
	movl	mode_class(,%rdx,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17348:
	addl	$2, %eax
.L11656:
	cmpl	$47, %ebx
	je	.L17921
	movl	%eax, %ebx
	decl	%ebx
	js	.L12153
.L11683:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%r12), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L11683
	jmp	.L12153
.L17921:
	movl	%eax, %ebx
	decl	%ebx
	js	.L12153
.L11678:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%r12), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L11678
	jmp	.L12153
.L11655:
	movzbl	2(%rbp), %eax
	cmpb	$18, %al
	je	.L17922
	cmpb	$24, %al
	je	.L17923
	movl	target_flags(%rip), %r8d
	testl	$33554432, %r8d
	movl	%r8d, %ecx
	je	.L11668
	movzbl	%al, %r10d 
	movzbl	mode_size(%r10), %r15d
	leal	7(%r15), %edx
.L11669:
	andl	$33554432, %ecx
	je	.L11670
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L11656
.L11670:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L11656
.L11668:
	movzbl	%al, %edi 
	movzbl	mode_size(%rdi), %r9d
	leal	3(%r9), %edx
	jmp	.L11669
.L17923:
	xorl	%ebp, %ebp
	testb	$2, target_flags+3(%rip)
	sete	%bpl
	leal	4(%rbp,%rbp), %eax
	jmp	.L11656
.L17922:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17348
.L11654:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %r12d
	jl	.L11685
	movq	1696(%rsp), %rbx
	movq	32(%rbx), %rax
.L17720:
	movzwl	(%rax), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L12153
.L17570:
	movl	$.LC0, %edi
	movl	$620, %esi
	movl	$.LC3, %edx
	jmp	.L17403
.L11685:
	cmpl	$47, %ebx
	je	.L17924
	movq	reg_pending_clobbers(%rip), %rdi
.L17349:
	movl	%r12d, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L16653
	movslq	%r12d,%rbx
	movq	reg_known_equiv_p(%rip), %r12
	addq	%rbx, %r12
	cmpb	$0, (%r12)
	je	.L11690
	leaq	0(,%rbx,8), %r11
	addq	reg_known_value(%rip), %r11
	movq	(%r11), %rax
	cmpw	$66, (%rax)
	je	.L17925
.L11690:
	leaq	0(,%rbx,8), %r14
	addq	reg_n_info(%rip), %r14
	movq	32(%r14), %r13
	movl	32(%r13), %esi
	testl	%esi, %esi
	jne	.L12153
	movq	1704(%rsp), %rdx
	movq	48(%rdx), %r15
	testq	%r15, %r15
	je	.L12153
	movl	$14, %r14d
.L11767:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L11694
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L11694
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11699
	cmpw	$34, %ax
	je	.L11699
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L11701
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17926
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L17927
.L11701:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11712
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17928
	cmpw	$33, (%r13)
	je	.L17929
.L11720:
	xorl	%ebx, %ebx
.L11712:
	testq	%rbp, %rbp
	je	.L11699
	testq	%rbx, %rbx
	je	.L11699
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r8
	cmpb	$60, rtx_class(%r8)
	je	.L17930
.L11723:
	xorl	%eax, %eax
.L11724:
	testl	%eax, %eax
	jne	.L17931
.L11699:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11725
	testb	$16, 3(%rax)
	je	.L11725
	cmpw	$36, (%rax)
	je	.L11725
.L11726:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11727
	testb	$16, 3(%rax)
	je	.L11727
	cmpw	$36, (%rax)
	je	.L11727
	movq	%rax, %rbx
	jmp	.L11726
.L11727:
	cmpq	%rbx, 1696(%rsp)
	je	.L11694
	movq	%rbx, %r13
.L11725:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11732
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11736
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11737
	movl	$14, %r11d
.L11736:
	testl	%ebx, %ebx
	je	.L11742
	cmpl	%r11d, %r14d
	jge	.L11694
.L11732:
	testl	%ebx, %ebx
	je	.L11742
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L11742
.L11760:
	cmpq	%r13, 8(%rdi)
	je	.L17932
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11760
.L11742:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L11694
	testl	%r14d, %r14d
	jne	.L11762
	movslq	8(%r13),%rbp
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%rbp,%rbp,2), %r11
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r11
	salq	$4, %rdx
	movl	16(%r11,%r9), %ecx
	movslq	16(%rdx,%r9),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17352:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L11694:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L11767
	jmp	.L12153
.L11762:
	cmpl	$14, %r14d
	je	.L16914
	cmpl	$15, %r14d
.L17696:
	jne	.L11694
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17351:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17352
.L16914:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%rbp
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17351
.L17932:
	testq	%r10, %r10
	je	.L11748
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17934
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r9,%rbp), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17350:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11748:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L11753
	movb	$14, 2(%rdi)
.L11753:
	testq	%r10, %r10
	je	.L11694
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16913
	cmpb	$14, %al
	je	.L16914
	cmpb	$15, %al
	jmp	.L17696
.L16913:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%r9
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbx), %ecx
	leaq	(%r9,%r9,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rbx),%r12
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17352
.L17934:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17350
.L11737:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11739
	movl	$15, %r11d
	jmp	.L11736
.L11739:
	xorl	%ebx, %ebx
	jmp	.L11736
.L17931:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11699
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11694
	jmp	.L11699
.L17930:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L11723
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L11723
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rbp)
	jne	.L11723
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L11723
	movl	$1, %eax
	jmp	.L11724
.L17929:
	cmpw	$47, %dx
	jne	.L11720
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11720
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11720
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17935
	movq	24(%rbx), %rax
.L11718:
	cmpw	$67, (%rax)
	jne	.L11720
	cmpq	%rsi, %rcx
	jne	.L11720
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11712
.L17935:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11712
	jmp	.L11718
.L17928:
	movq	8(%rax), %rbx
	jmp	.L11712
.L17927:
	cmpw	$47, %dx
	je	.L17936
.L11709:
	xorl	%ebp, %ebp
	jmp	.L11701
.L17936:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11709
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11709
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L17937
	movq	24(%rbp), %rax
.L11707:
	cmpw	$67, (%rax)
	jne	.L11709
	cmpq	%rsi, %rcx
	jne	.L11709
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L11701
.L17937:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L11701
	jmp	.L11707
.L17926:
	movq	8(%rax), %rbp
	jmp	.L11701
.L17925:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L11690
.L16653:
	movslq	%r12d,%rbx
	jmp	.L11690
.L17924:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17349
	.p2align 6,,7
.L17880:
	movq	1704(%rsp), %rdi
	movq	16(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	24(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L11651
.L17879:
	cmpw	$133, %dx
	je	.L11652
	cmpw	$132, %dx
	jne	.L16284
	jmp	.L11652
.L17878:
	movq	8(%rbp), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L16282
.L11646:
	movslq	%ebx,%r15
	movq	8(%rdx,%r15,8), %rcx
	movq	8(%rcx), %rdx
	testq	%rdx, %rdx
	jne	.L17938
.L11643:
	decl	%ebx
	js	.L16282
	movq	8(%rbp), %rdx
	jmp	.L11646
.L16282:
	movq	1608(%rsp), %rdx
	cmpw	$47, (%rdx)
	jne	.L9008
	movq	1704(%rsp), %rdi
	movq	16(%rdx), %rsi
	jmp	.L17376
	.p2align 6,,7
.L17938:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L11643
.L12021:
	movq	1608(%rsp), %r10
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	8(%r10), %rsi
	call	sched_analyze_2
	movq	1608(%rsp), %rbp
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	16(%rbp), %rsi
	call	sched_analyze_2
	movq	1608(%rsp), %r15
	movq	8(%r15), %rbp
	movzwl	(%r15), %ebx
	testq	%rbp, %rbp
	je	.L9008
	movl	(%rbp), %edx
	cmpw	$39, %dx
	je	.L17939
	leal	-63(%rdx), %esi
	cmpw	$1, %si
	ja	.L17940
.L12036:
	leal	-132(%rdx), %ecx
	cmpw	$1, %cx
	jbe	.L17941
.L12035:
	movq	8(%rbp), %rbp
	movl	(%rbp), %edx
	leal	-63(%rdx), %r14d
	cmpw	$1, %r14w
	jbe	.L12036
	cmpw	$133, %dx
	je	.L12036
	cmpw	$132, %dx
	je	.L12036
.L16301:
	cmpw	$61, %dx
	je	.L17942
	cmpw	$66, %dx
	jne	.L12153
	movq	current_sched_info(%rip), %r15
	movq	%rbp, 120(%rsp)
	testb	$2, 96(%r15)
	jne	.L17943
.L12155:
	movq	compiler_params(%rip), %r10
	movq	1704(%rsp), %rcx
	movl	80(%r10), %eax
	cmpl	%eax, 32(%rcx)
	jg	.L17728
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %r13
	movq	(%rax), %r8
	movq	8(%r13), %rsi
	testq	%r8, %r8
	movq	%r8, 104(%rsp)
	movq	%rsi, 112(%rsp)
	jne	.L12247
.L16307:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %r9
	movq	24(%r11), %rbx
	testq	%r9, %r9
	movq	%r9, 88(%rsp)
	movq	%rbx, 96(%rsp)
	jne	.L12323
.L16310:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %r10
	testq	%r10, %r10
	movq	%r10, 80(%rsp)
	je	.L16313
	movl	$14, %r15d
.L12399:
	movq	80(%rsp), %r11
	movq	8(%r11), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L12326
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L12326
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L12331
	cmpw	$34, %ax
	je	.L12331
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L12333
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17944
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L17945
.L12333:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12344
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17946
	cmpw	$33, (%r14)
	je	.L17947
.L12352:
	xorl	%ebx, %ebx
.L12344:
	testq	%r12, %r12
	je	.L12331
	testq	%rbx, %rbx
	je	.L12331
	movzwl	(%r12), %r13d
	movslq	%r13d,%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L17948
.L12355:
	xorl	%eax, %eax
.L12356:
	testl	%eax, %eax
	jne	.L17949
.L12331:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12357
	testb	$16, 3(%rax)
	je	.L12357
	cmpw	$36, (%rax)
	je	.L12357
.L12358:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12359
	testb	$16, 3(%rax)
	je	.L12359
	cmpw	$36, (%rax)
	je	.L12359
	movq	%rax, %rbx
	jmp	.L12358
.L12359:
	cmpq	%rbx, 1696(%rsp)
	je	.L12326
	movq	%rbx, %r14
.L12357:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L12364
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%r12
	movl	16(%r13,%rcx), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %r13d
	leaq	0(,%r13,8), %r12
	movq	%r12, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12368
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12369
	movl	$14, %r11d
.L12368:
	testl	%ebx, %ebx
	je	.L12374
	cmpl	%r11d, %r15d
	jge	.L12326
.L12364:
	testl	%ebx, %ebx
	je	.L12374
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L12374
.L12392:
	cmpq	%r14, 8(%rdi)
	je	.L17950
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12392
.L12374:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L12326
	testl	%r15d, %r15d
	jne	.L12394
	movslq	8(%r14),%r12
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r12,%r12,2), %rbx
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rbx
	salq	$4, %rdx
	movl	16(%rbx,%r11), %ecx
	movslq	16(%rdx,%r11),%rdi
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17375:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L12326:
	movq	80(%rsp), %r11
	movq	16(%r11), %rbx
	testq	%rbx, %rbx
	movq	%rbx, 80(%rsp)
	jne	.L12399
	jmp	.L16313
.L12394:
	cmpl	$14, %r15d
	je	.L16928
	cmpl	$15, %r15d
.L17705:
	jne	.L12326
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17374:
	movslq	8(%r14),%r9
	leaq	(%r9,%r9,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17375
.L16928:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%r12
	leaq	(%r12,%r12,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17374
.L17950:
	testq	%r10, %r10
	je	.L12380
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17952
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%r11,%r12), %ecx
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17373:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12380:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r15d
	jge	.L12385
	movb	$14, 2(%rdi)
.L12385:
	testq	%r10, %r10
	je	.L12326
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16927
	cmpb	$14, %al
	je	.L16928
	cmpb	$15, %al
	jmp	.L17705
.L16927:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdi
	movq	h_i_d(%rip), %r9
	movslq	8(%rax),%r11
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%r9), %ecx
	leaq	(%r11,%r11,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%r9),%r13
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17375
.L17952:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17373
.L12369:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12371
	movl	$15, %r11d
	jmp	.L12368
.L12371:
	xorl	%ebx, %ebx
	jmp	.L12368
.L17949:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12331
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12326
	jmp	.L12331
.L17948:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L12355
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L12355
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%r12)
	jne	.L12355
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%r12)
	jne	.L12355
	movl	$1, %eax
	jmp	.L12356
.L17947:
	cmpw	$47, %dx
	jne	.L12352
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12352
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12352
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17953
	movq	24(%rbx), %rax
.L12350:
	cmpw	$67, (%rax)
	jne	.L12352
	cmpq	%rsi, %rcx
	jne	.L12352
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12344
.L17953:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12344
	jmp	.L12350
.L17946:
	movq	8(%rax), %rbx
	jmp	.L12344
.L17945:
	cmpw	$47, %dx
	je	.L17954
.L12341:
	xorl	%r12d, %r12d
	jmp	.L12333
.L17954:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12341
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12341
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L17955
	movq	24(%r12), %rax
.L12339:
	cmpw	$67, (%rax)
	jne	.L12341
	cmpq	%rsi, %rcx
	jne	.L12341
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L12333
.L17955:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L12333
	jmp	.L12339
.L17944:
	movq	8(%rax), %r12
	jmp	.L12333
.L12323:
	movq	96(%rsp), %r13
	movq	120(%rsp), %rsi
	movq	8(%r13), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L12251
	movq	88(%rsp), %r12
	movl	$15, %r15d
	movq	8(%r12), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L12251
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L12251
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L12255
	cmpw	$34, %ax
	je	.L12255
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L12257
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17956
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L17957
.L12257:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12268
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17958
	cmpw	$33, (%r14)
	je	.L17959
.L12276:
	xorl	%ebx, %ebx
.L12268:
	testq	%r12, %r12
	je	.L12255
	testq	%rbx, %rbx
	je	.L12255
	movzwl	(%r12), %r13d
	movslq	%r13d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L17960
.L12279:
	xorl	%eax, %eax
.L12280:
	testl	%eax, %eax
	jne	.L17961
.L12255:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12281
	testb	$16, 3(%rax)
	je	.L12281
	cmpw	$36, (%rax)
	je	.L12281
.L12282:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12283
	testb	$16, 3(%rax)
	je	.L12283
	cmpw	$36, (%rax)
	je	.L12283
	movq	%rax, %rbx
	jmp	.L12282
.L12283:
	cmpq	%rbx, 1696(%rsp)
	je	.L12251
	movq	%rbx, %r14
.L12281:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L12288
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%r12
	movl	16(%r13,%rcx), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %r13d
	leaq	0(,%r13,8), %r12
	movq	%r12, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12292
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12293
	movl	$14, %r11d
.L12292:
	testl	%ebx, %ebx
	je	.L12298
	cmpl	%r11d, %r15d
	jge	.L12251
.L12288:
	testl	%ebx, %ebx
	je	.L12298
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L12298
.L12316:
	cmpq	%r14, 8(%rdi)
	je	.L17962
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12316
.L12298:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L12251
	testl	%r15d, %r15d
	jne	.L12318
	movslq	8(%r14),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r12,%rbx),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17372:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L12251:
	movq	88(%rsp), %rax
	movq	96(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 88(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r15
	movq	%r15, 96(%rsp)
	jne	.L12323
	jmp	.L16310
.L12318:
	cmpl	$14, %r15d
	je	.L16926
	cmpl	$15, %r15d
.L17704:
	jne	.L12251
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17371:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17372
.L16926:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17371
.L17962:
	testq	%r10, %r10
	je	.L12304
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17964
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%r11,%r12), %ecx
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17370:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12304:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r15d
	jge	.L12309
	movb	$15, 2(%rdi)
.L12309:
	testq	%r10, %r10
	je	.L12251
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16925
	cmpb	$14, %al
	je	.L16926
	cmpb	$15, %al
	jmp	.L17704
.L16925:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r9
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r9,%r9,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r13
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17372
.L17964:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17370
.L12293:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12295
	movl	$15, %r11d
	jmp	.L12292
.L12295:
	xorl	%ebx, %ebx
	jmp	.L12292
.L17961:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12255
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12251
	jmp	.L12255
.L17960:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L12279
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L12279
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%r12)
	jne	.L12279
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%r12)
	jne	.L12279
	movl	$1, %eax
	jmp	.L12280
.L17959:
	cmpw	$47, %dx
	jne	.L12276
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12276
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12276
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17965
	movq	24(%rbx), %rax
.L12274:
	cmpw	$67, (%rax)
	jne	.L12276
	cmpq	%rsi, %rcx
	jne	.L12276
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12268
.L17965:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12268
	jmp	.L12274
.L17958:
	movq	8(%rax), %rbx
	jmp	.L12268
.L17957:
	cmpw	$47, %dx
	je	.L17966
.L12265:
	xorl	%r12d, %r12d
	jmp	.L12257
.L17966:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12265
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12265
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L17967
	movq	24(%r12), %rax
.L12263:
	cmpw	$67, (%rax)
	jne	.L12265
	cmpq	%rsi, %rcx
	jne	.L12265
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L12257
.L17967:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L12257
	jmp	.L12263
.L17956:
	movq	8(%rax), %r12
	jmp	.L12257
.L12247:
	movq	112(%rsp), %rbx
	movq	120(%rsp), %rsi
	movq	8(%rbx), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L12175
	movq	104(%rsp), %rdi
	movl	$14, %r15d
	movq	8(%rdi), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L12175
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L12175
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L12179
	cmpw	$34, %ax
	je	.L12179
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L12181
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17968
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L17969
.L12181:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12192
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17970
	cmpw	$33, (%r14)
	je	.L17971
.L12200:
	xorl	%ebx, %ebx
.L12192:
	testq	%r12, %r12
	je	.L12179
	testq	%rbx, %rbx
	je	.L12179
	movzwl	(%r12), %r13d
	movslq	%r13d,%r11
	cmpb	$60, rtx_class(%r11)
	je	.L17972
.L12203:
	xorl	%eax, %eax
.L12204:
	testl	%eax, %eax
	jne	.L17973
.L12179:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12205
	testb	$16, 3(%rax)
	je	.L12205
	cmpw	$36, (%rax)
	je	.L12205
.L12206:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12207
	testb	$16, 3(%rax)
	je	.L12207
	cmpw	$36, (%rax)
	je	.L12207
	movq	%rax, %rbx
	jmp	.L12206
.L12207:
	cmpq	%rbx, 1696(%rsp)
	je	.L12175
	movq	%rbx, %r14
.L12205:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L12212
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%r12
	movl	16(%rcx,%r13), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12216
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12217
	movl	$14, %r11d
.L12216:
	testl	%ebx, %ebx
	je	.L12222
	cmpl	%r11d, %r15d
	jge	.L12175
.L12212:
	testl	%ebx, %ebx
	je	.L12222
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L12222
.L12240:
	cmpq	%r14, 8(%rdi)
	je	.L17974
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12240
.L12222:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L12175
	testl	%r15d, %r15d
	jne	.L12242
	movslq	8(%r14),%rbx
	movslq	8(%rdx),%r13
	movq	h_i_d(%rip), %r9
	leaq	(%rbx,%rbx,2), %rdi
	leaq	(%r13,%r13,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%r9), %ecx
	movslq	16(%r11,%r9),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17369:
	andl	$63, %ecx
	movl	$1, %r15d
	salq	%cl, %r15
	orq	%r15, 16(%rax)
.L12175:
	movq	104(%rsp), %rax
	movq	112(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 104(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 112(%rsp)
	jne	.L12247
	jmp	.L16307
.L12242:
	cmpl	$14, %r15d
	je	.L16924
	cmpl	$15, %r15d
.L17703:
	jne	.L12175
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r13
	leaq	(%r13,%r13,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17368:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17369
.L16924:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17368
.L17974:
	testq	%r10, %r10
	je	.L12228
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17976
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r13), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r13),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17367:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12228:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r15d
	jge	.L12233
	movb	$14, 2(%rdi)
.L12233:
	testq	%r10, %r10
	je	.L12175
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16923
	cmpb	$14, %al
	je	.L16924
	cmpb	$15, %al
	jmp	.L17703
.L16923:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17369
.L17976:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r12
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%r12,%r12,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%rbx
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r11d
	salq	$3, %rbx
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17367
.L12217:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12219
	movl	$15, %r11d
	jmp	.L12216
.L12219:
	xorl	%ebx, %ebx
	jmp	.L12216
.L17973:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12179
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12175
	jmp	.L12179
.L17972:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L12203
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L12203
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%r12)
	jne	.L12203
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%r12)
	jne	.L12203
	movl	$1, %eax
	jmp	.L12204
.L17971:
	cmpw	$47, %dx
	jne	.L12200
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12200
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12200
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17977
	movq	24(%rbx), %rax
.L12198:
	cmpw	$67, (%rax)
	jne	.L12200
	cmpq	%rsi, %rcx
	jne	.L12200
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12192
.L17977:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12192
	jmp	.L12198
.L17970:
	movq	8(%rax), %rbx
	jmp	.L12192
.L17969:
	cmpw	$47, %dx
	je	.L17978
.L12189:
	xorl	%r12d, %r12d
	jmp	.L12181
.L17978:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12189
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12189
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L17979
	movq	24(%r12), %rax
.L12187:
	cmpw	$67, (%rax)
	jne	.L12189
	cmpq	%rsi, %rcx
	jne	.L12189
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L12181
.L17979:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L12181
	jmp	.L12187
.L17968:
	movq	8(%rax), %r12
	jmp	.L12181
.L17943:
	movq	%rbp, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%cl
	movq	%rax, 120(%rsp)
	movq	8(%rax), %rdi
	movzbl	%cl, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	120(%rsp), %rdx
	movq	8(%rdx), %rdi
	call	cselib_subst_to_values
	movq	120(%rsp), %r14
	movq	%rax, 8(%r14)
	jmp	.L12155
.L17942:
	movl	8(%rbp), %r12d
	cmpl	$52, %r12d
	jg	.L12038
	leal	-8(%r12), %edx
	cmpl	$7, %edx
	jbe	.L12041
	leal	-21(%r12), %r8d
	cmpl	$7, %r8d
	jbe	.L12041
	leal	-45(%r12), %edi
	cmpl	$7, %edi
	jbe	.L12041
	leal	-29(%r12), %r11d
	cmpl	$7, %r11d
	ja	.L12039
.L12041:
	movzbq	2(%rbp), %r9
	movl	mode_class(,%r9,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17362:
	addl	$2, %eax
.L12040:
	cmpl	$47, %ebx
	je	.L17980
	movl	%eax, %ebx
	decl	%ebx
	js	.L12153
.L12067:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%r12), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L12067
	jmp	.L12153
.L17980:
	movl	%eax, %ebx
	decl	%ebx
	js	.L12153
.L12062:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%r12), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L12062
	jmp	.L12153
.L12039:
	movzbl	2(%rbp), %eax
	cmpb	$18, %al
	je	.L17981
	cmpb	$24, %al
	je	.L17982
	movl	target_flags(%rip), %ecx
	testl	$33554432, %ecx
	je	.L12052
	movzbl	%al, %r10d 
	movzbl	mode_size(%r10), %ebp
	leal	7(%rbp), %edx
.L12053:
	andl	$33554432, %ecx
	je	.L12054
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L12040
.L12054:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L12040
.L12052:
	movzbl	%al, %esi 
	movzbl	mode_size(%rsi), %r13d
	leal	3(%r13), %edx
	jmp	.L12053
.L17982:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L12040
.L17981:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17362
.L12038:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %r12d
	jl	.L12069
	movq	1696(%rsp), %rbx
	movq	32(%rbx), %rax
	jmp	.L17720
.L12069:
	cmpl	$47, %ebx
	je	.L17983
	movq	reg_pending_clobbers(%rip), %rdi
.L17363:
	movl	%r12d, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L16663
	movslq	%r12d,%rbx
	movq	reg_known_equiv_p(%rip), %r12
	addq	%rbx, %r12
	cmpb	$0, (%r12)
	je	.L12074
	leaq	0(,%rbx,8), %r14
	addq	reg_known_value(%rip), %r14
	movq	(%r14), %rax
	cmpw	$66, (%rax)
	je	.L17984
.L12074:
	leaq	0(,%rbx,8), %rdi
	addq	reg_n_info(%rip), %rdi
	movq	32(%rdi), %r8
	movl	32(%r8), %edx
	testl	%edx, %edx
	jne	.L12153
	movq	1704(%rsp), %r11
	movq	48(%r11), %r15
	testq	%r15, %r15
	je	.L12153
	movl	$14, %r14d
.L12151:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L12078
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L12078
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L12083
	cmpw	$34, %ax
	je	.L12083
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L12085
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17985
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L17986
.L12085:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L12096
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L17987
	cmpw	$33, (%r13)
	je	.L17988
.L12104:
	xorl	%ebx, %ebx
.L12096:
	testq	%rbp, %rbp
	je	.L12083
	testq	%rbx, %rbx
	je	.L12083
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r9
	cmpb	$60, rtx_class(%r9)
	je	.L17989
.L12107:
	xorl	%eax, %eax
.L12108:
	testl	%eax, %eax
	jne	.L17990
.L12083:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L12109
	testb	$16, 3(%rax)
	je	.L12109
	cmpw	$36, (%rax)
	je	.L12109
.L12110:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L12111
	testb	$16, 3(%rax)
	je	.L12111
	cmpw	$36, (%rax)
	je	.L12111
	movq	%rax, %rbx
	jmp	.L12110
.L12111:
	cmpq	%rbx, 1696(%rsp)
	je	.L12078
	movq	%rbx, %r13
.L12109:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L12116
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L12120
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12121
	movl	$14, %r11d
.L12120:
	testl	%ebx, %ebx
	je	.L12126
	cmpl	%r11d, %r14d
	jge	.L12078
.L12116:
	testl	%ebx, %ebx
	je	.L12126
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L12126
.L12144:
	cmpq	%r13, 8(%rdi)
	je	.L17991
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L12144
.L12126:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L12078
	testl	%r14d, %r14d
	jne	.L12146
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rbx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %rbx
	salq	$4, %r12
	movl	16(%rbx,%r11), %ecx
	movslq	16(%r12,%r11),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17366:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L12078:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L12151
	jmp	.L12153
.L12146:
	cmpl	$14, %r14d
	je	.L16922
	cmpl	$15, %r14d
.L17702:
	jne	.L12078
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17365:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17366
.L16922:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17365
.L17991:
	testq	%r10, %r10
	je	.L12132
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L17993
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17364:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L12132:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L12137
	movb	$14, 2(%rdi)
.L12137:
	testq	%r10, %r10
	je	.L12078
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16921
	cmpb	$14, %al
	je	.L16922
	cmpb	$15, %al
	jmp	.L17702
.L16921:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r11
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%r11,%r11,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17366
.L17993:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r11
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17364
.L12121:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L12123
	movl	$15, %r11d
	jmp	.L12120
.L12123:
	xorl	%ebx, %ebx
	jmp	.L12120
.L17990:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L12083
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L12078
	jmp	.L12083
.L17989:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L12107
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L12107
	movq	8(%rbx), %rsi
	cmpq	%rsi, 8(%rbp)
	jne	.L12107
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L12107
	movl	$1, %eax
	jmp	.L12108
.L17988:
	cmpw	$47, %dx
	jne	.L12104
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12104
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12104
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L17994
	movq	24(%rbx), %rax
.L12102:
	cmpw	$67, (%rax)
	jne	.L12104
	cmpq	%rsi, %rcx
	jne	.L12104
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L12096
.L17994:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L12096
	jmp	.L12102
.L17987:
	movq	8(%rax), %rbx
	jmp	.L12096
.L17986:
	cmpw	$47, %dx
	je	.L17995
.L12093:
	xorl	%ebp, %ebp
	jmp	.L12085
.L17995:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L12093
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L12093
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L17996
	movq	24(%rbp), %rax
.L12091:
	cmpw	$67, (%rax)
	jne	.L12093
	cmpq	%rsi, %rcx
	jne	.L12093
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L12085
.L17996:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L12085
	jmp	.L12091
.L17985:
	movq	8(%rax), %rbp
	jmp	.L12085
.L17984:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L12074
.L16663:
	movslq	%r12d,%rbx
	jmp	.L12074
.L17983:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17363
	.p2align 6,,7
.L17941:
	movq	1704(%rsp), %rdi
	movq	16(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	24(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L12035
.L17940:
	cmpw	$133, %dx
	je	.L12036
	cmpw	$132, %dx
	jne	.L16301
	jmp	.L12036
.L17939:
	movq	8(%rbp), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L16299
.L12030:
	movslq	%ebx,%r13
	movq	8(%rdx,%r13,8), %r12
	movq	8(%r12), %rdx
	testq	%rdx, %rdx
	jne	.L17997
.L12027:
	decl	%ebx
	js	.L16299
	movq	8(%rbp), %rdx
	jmp	.L12030
.L16299:
	movq	1608(%rsp), %rax
	cmpw	$47, (%rax)
	jne	.L9008
	movq	1704(%rsp), %rdi
	movq	16(%rax), %rsi
	jmp	.L17376
	.p2align 6,,7
.L17997:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L12027
	.p2align 6,,7
.L17830:
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 392(%rsp)
	je	.L9008
	movzwl	(%rcx), %edx
	cmpw	$39, %dx
	movl	%edx, %ecx
	je	.L17998
	leal	-63(%rcx), %r15d
	cmpw	$1, %r15w
	ja	.L17999
	.p2align 4,,7
.L9994:
	leal	-132(%rdx), %r13d
	cmpw	$1, %r13w
	ja	.L9347
	movq	392(%rsp), %rdi
	movq	16(%rdi), %r15
	testq	%r15, %r15
	je	.L9349
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L9350
	mov	%eax, %esi
	jmp	*.L9657(,%rsi,8)
	.section	.rodata
	.align 8
	.align 4
.L9657:
	.quad	.L9641
	.quad	.L9641
	.quad	.L9350
	.quad	.L9641
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9628
	.quad	.L9350
	.quad	.L9349
	.quad	.L9349
	.quad	.L9349
	.quad	.L9350
	.quad	.L9349
	.quad	.L9350
	.quad	.L9350
	.quad	.L9357
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9388
	.quad	.L9349
	.quad	.L9349
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9350
	.quad	.L9653
	.quad	.L9653
	.quad	.L9653
	.quad	.L9653
	.quad	.L9655
	.quad	.L9655
	.text
.L9357:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L9358
	leal	-8(%rbp), %ebx
	cmpl	$7, %ebx
	jbe	.L9361
	leal	-21(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L9361
	leal	-45(%rbp), %r10d
	cmpl	$7, %r10d
	jbe	.L9361
	leal	-29(%rbp), %r9d
	cmpl	$7, %r9d
	ja	.L9359
.L9361:
	movzbq	2(%r15), %r11
	movl	mode_class(,%r11,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17271:
	addl	$2, %eax
.L9360:
	movl	%eax, %ebx
	decl	%ebx
	js	.L9349
.L9381:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L9381
.L9349:
	movq	392(%rsp), %rbx
	movq	24(%rbx), %r15
	testq	%r15, %r15
	je	.L9347
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L9673
	mov	%eax, %r14d
	jmp	*.L9980(,%r14,8)
	.section	.rodata
	.align 8
	.align 4
.L9980:
	.quad	.L9964
	.quad	.L9964
	.quad	.L9673
	.quad	.L9964
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9951
	.quad	.L9673
	.quad	.L9347
	.quad	.L9347
	.quad	.L9347
	.quad	.L9673
	.quad	.L9347
	.quad	.L9673
	.quad	.L9673
	.quad	.L9680
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9711
	.quad	.L9347
	.quad	.L9347
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9673
	.quad	.L9976
	.quad	.L9976
	.quad	.L9976
	.quad	.L9976
	.quad	.L9978
	.quad	.L9978
	.text
.L9680:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L9681
	leal	-8(%rbp), %r13d
	cmpl	$7, %r13d
	jbe	.L9684
	leal	-21(%rbp), %ecx
	cmpl	$7, %ecx
	jbe	.L9684
	leal	-45(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L9684
	leal	-29(%rbp), %r8d
	cmpl	$7, %r8d
	ja	.L9682
.L9684:
	movzbq	2(%r15), %r12
	movl	mode_class(,%r12,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17282:
	addl	$2, %eax
.L9683:
	movl	%eax, %ebx
	decl	%ebx
	js	.L9347
.L9704:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L9704
	.p2align 4,,7
.L9347:
	movq	392(%rsp), %r14
	movq	8(%r14), %rbx
	movzwl	(%rbx), %edx
	movq	%rbx, 392(%rsp)
	leal	-63(%rdx), %r15d
	cmpw	$1, %r15w
	jbe	.L9994
	cmpw	$133, %dx
	je	.L9994
	cmpw	$132, %dx
	je	.L9994
.L16191:
	cmpw	$61, %dx
	je	.L18000
	cmpw	$66, %dx
	je	.L18001
.L10434:
	movq	1608(%rsp), %rcx
	cmpw	$47, (%rcx)
	jne	.L9008
	movq	16(%rcx), %r15
	testq	%r15, %r15
	je	.L9008
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L11010
	mov	%eax, %r9d
	jmp	*.L11317(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L11317:
	.quad	.L11301
	.quad	.L11301
	.quad	.L11010
	.quad	.L11301
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11288
	.quad	.L11010
	.quad	.L9008
	.quad	.L9008
	.quad	.L9008
	.quad	.L11010
	.quad	.L9008
	.quad	.L11010
	.quad	.L11010
	.quad	.L11017
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11048
	.quad	.L9008
	.quad	.L9008
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11010
	.quad	.L11313
	.quad	.L11313
	.quad	.L11313
	.quad	.L11313
	.quad	.L11315
	.quad	.L11315
	.text
.L11017:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L11342
	leal	-8(%rbp), %ebx
	cmpl	$7, %ebx
	jbe	.L11021
	leal	-21(%rbp), %r11d
	cmpl	$7, %r11d
	jbe	.L11021
	leal	-45(%rbp), %r14d
	cmpl	$7, %r14d
	jbe	.L11021
	leal	-29(%rbp), %r12d
	cmpl	$7, %r12d
	ja	.L11019
.L11021:
	movzbq	2(%r15), %r8
	movl	mode_class(,%r8,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17328:
	addl	$2, %eax
.L11020:
	movl	%eax, %ebx
	decl	%ebx
	js	.L9008
.L11041:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L11041
	jmp	.L9008
.L11019:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18002
	cmpb	$24, %al
	je	.L18003
	movl	target_flags(%rip), %r13d
	testl	$33554432, %r13d
	movl	%r13d, %ecx
	je	.L11032
	movzbl	%al, %esi 
	movzbl	mode_size(%rsi), %edi
	leal	7(%rdi), %edx
.L11033:
	andl	$33554432, %ecx
	je	.L11034
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L11020
.L11034:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L11020
.L11032:
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r10d
	leal	3(%r10), %edx
	jmp	.L11033
.L18003:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L11020
.L18002:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17328
.L11301:
	cmpl	$41, %ebx
	je	.L18004
.L11303:
	movb	$1, reg_pending_barrier(%rip)
.L11302:
	cmpl	$41, %ebx
	je	.L18005
.L11010:
	movslq	%ebx,%rbp
	movzbl	rtx_length(%rbp), %edi
	movq	rtx_format(,%rbp,8), %r13
	movl	%edi, %ebp
	decl	%ebp
	js	.L9008
	leaq	8(%r15), %r14
.L11330:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18006
	cmpb	$69, %dl
	je	.L18007
.L11320:
	decl	%ebp
	jns	.L11330
	jmp	.L9008
	.p2align 6,,7
.L18007:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L11320
	movq	%rdx, %r12
.L11329:
	movq	(%r12), %r10
	movslq	%ebx,%r11
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%r11,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rdx
	cmpl	(%rdx), %ebx
	jl	.L11329
	jmp	.L11320
.L18006:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L11320
.L18005:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L9008
.L11309:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %rcx
	cmpl	(%rcx), %ebx
	movq	%rcx, %rdx
	jl	.L11309
	jmp	.L9008
.L18004:
	testb	$8, 3(%r15)
	je	.L11302
	jmp	.L11303
.L11288:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r8
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r8, %rsi
	movl	$0, 32(%r8)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r12
	movq	%rax, 40(%r12)
	movl	$1, 36(%r12)
	jmp	.L11010
.L11048:
	movq	current_sched_info(%rip), %rbp
	movq	%r15, 256(%rsp)
	testb	$2, 96(%rbp)
	jne	.L18008
.L11049:
	movq	1704(%rsp), %r12
	movq	1704(%rsp), %r14
	movq	(%r12), %rbx
	movq	8(%r14), %r11
	testq	%rbx, %rbx
	movq	%rbx, 240(%rsp)
	movq	%r11, 248(%rsp)
	jne	.L11129
.L16259:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %r9
	movq	24(%r11), %rbx
	testq	%r9, %r9
	movq	%r9, 224(%rsp)
	movq	%rbx, 232(%rsp)
	jne	.L11205
.L16262:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %r10
	testq	%r10, %r10
	movq	%r10, 216(%rsp)
	je	.L16265
.L11285:
	movq	216(%rsp), %r11
	movq	8(%r11), %r14
	cmpw	$33, (%r14)
	je	.L18009
.L11211:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L11208
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L11208
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11217
	cmpw	$34, %ax
	je	.L11217
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L11219
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18010
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18011
.L11219:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11230
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18012
	cmpw	$33, (%r14)
	je	.L18013
.L11238:
	xorl	%ebx, %ebx
.L11230:
	testq	%rbp, %rbp
	je	.L11217
	testq	%rbx, %rbx
	je	.L11217
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18014
.L11241:
	xorl	%eax, %eax
.L11242:
	testl	%eax, %eax
	jne	.L18015
.L11217:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11243
	testb	$16, 3(%rax)
	je	.L11243
	cmpw	$36, (%rax)
	je	.L11243
.L11244:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11245
	testb	$16, 3(%rax)
	je	.L11245
	cmpw	$36, (%rax)
	je	.L11245
	movq	%rax, %rbx
	jmp	.L11244
.L11245:
	cmpq	%rbx, 1696(%rsp)
	je	.L11208
	movq	%rbx, %r13
.L11243:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11250
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%rbp
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	leaq	(%rbp,%rbp,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r12
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	movl	%edx, %ecx
	leaq	0(,%r12,8), %rdi
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11254
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11255
	movl	$14, %r11d
.L11254:
	testl	%ebx, %ebx
	je	.L11260
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L11208
.L11250:
	testl	%ebx, %ebx
	je	.L11260
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L11260
.L11278:
	cmpq	%r13, 8(%rdi)
	je	.L18016
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11278
.L11260:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L11208
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L11280
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rsi
	leaq	(%rcx,%rcx,2), %r14
	salq	$4, %rsi
	salq	$4, %r14
	movl	16(%rsi,%r11), %ecx
	movslq	16(%r14,%r11),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17337:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L11208:
	movq	216(%rsp), %rsi
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 216(%rsp)
	jne	.L11285
.L16265:
	movq	1704(%rsp), %r9
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%r9), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r10
	movq	1704(%rsp), %r11
	movq	%rax, (%r11)
	testb	$2, 96(%r10)
	jne	.L18017
.L11286:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r14
	incl	32(%r14)
	movq	%rax, 8(%r14)
	movq	%r14, %rdi
	movq	8(%r15), %rsi
	jmp	.L17376
.L18017:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L11286
.L11280:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16906
	movl	$14, %r14d
	cmpl	$15, %r14d
.L17685:
	jne	.L11208
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r8
	movq	h_i_d(%rip), %rcx
	leaq	(%r8,%r8,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17336:
	movslq	8(%r13),%rdi
	leaq	(%rdi,%rdi,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17337
.L16906:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17336
.L18016:
	testq	%r10, %r10
	je	.L11266
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18019
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%r14
	movq	h_i_d(%rip), %r9
	movslq	8(%r12),%rcx
	leaq	(%r14,%r14,2), %r11
	salq	$4, %r11
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%r11,%r9), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r9),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17335:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11266:
	movzbl	2(%rdi), %ebp
	movl	$14, %eax
	cmpl	%ebp, %eax
	jge	.L11271
	movb	$14, 2(%rdi)
.L11271:
	testq	%r10, %r10
	je	.L11208
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16905
	cmpb	$14, %al
	je	.L16906
	cmpb	$15, %al
	jmp	.L17685
.L16905:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%rsi
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbp), %ecx
	leaq	(%rsi,%rsi,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rbp),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17337
.L18019:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rbp
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r14), %ecx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r14),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17335
.L11255:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11257
	movl	$15, %r11d
	jmp	.L11254
.L11257:
	xorl	%ebx, %ebx
	jmp	.L11254
.L18015:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11217
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11208
	jmp	.L11217
.L18014:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L11241
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L11241
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rbp)
	jne	.L11241
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L11241
	movl	$1, %eax
	jmp	.L11242
.L18013:
	cmpw	$47, %dx
	jne	.L11238
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11238
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11238
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18020
	movq	24(%rbx), %rax
.L11236:
	cmpw	$67, (%rax)
	jne	.L11238
	cmpq	%rsi, %rcx
	jne	.L11238
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11230
.L18020:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11230
	jmp	.L11236
.L18012:
	movq	8(%rax), %rbx
	jmp	.L11230
.L18011:
	cmpw	$47, %dx
	je	.L18021
.L11227:
	xorl	%ebp, %ebp
	jmp	.L11219
.L18021:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11227
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11227
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18022
	movq	24(%rbp), %rax
.L11225:
	cmpw	$67, (%rax)
	jne	.L11227
	cmpq	%rsi, %rcx
	jne	.L11227
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L11219
.L18022:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L11219
	jmp	.L11225
.L18010:
	movq	8(%rax), %rbp
	jmp	.L11219
.L18009:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18023
.L11212:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L11208
	movq	216(%rsp), %rcx
	movq	8(%rcx), %r14
	jmp	.L11211
.L18023:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L11212
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	cmovne	%rbp, %rdi
	jmp	.L11212
.L11205:
	movq	232(%rsp), %r12
	movq	256(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L11133
	movq	224(%rsp), %rbp
	xorl	%r14d, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L11133
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L11133
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11137
	cmpw	$34, %ax
	je	.L11137
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L11139
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18024
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18025
.L11139:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11150
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18026
	cmpw	$33, (%r13)
	je	.L18027
.L11158:
	xorl	%ebx, %ebx
.L11150:
	testq	%rbp, %rbp
	je	.L11137
	testq	%rbx, %rbx
	je	.L11137
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18028
.L11161:
	xorl	%eax, %eax
.L11162:
	testl	%eax, %eax
	jne	.L18029
.L11137:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11163
	testb	$16, 3(%rax)
	je	.L11163
	cmpw	$36, (%rax)
	je	.L11163
.L11164:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11165
	testb	$16, 3(%rax)
	je	.L11165
	cmpw	$36, (%rax)
	je	.L11165
	movq	%rax, %rbx
	jmp	.L11164
.L11165:
	cmpq	%rbx, 1696(%rsp)
	je	.L11133
	movq	%rbx, %r13
.L11163:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11170
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11174
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11175
	movl	$14, %r11d
.L11174:
	testl	%ebx, %ebx
	je	.L11180
	cmpl	%r11d, %r14d
	jge	.L11133
.L11170:
	testl	%ebx, %ebx
	je	.L11180
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L11180
.L11198:
	cmpq	%r13, 8(%rdi)
	je	.L18030
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11198
.L11180:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L11133
	testl	%r14d, %r14d
	jne	.L11200
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%rbp,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17334:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L11133:
	movq	224(%rsp), %rax
	movq	232(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 224(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 232(%rsp)
	jne	.L11205
	jmp	.L16262
.L11200:
	cmpl	$14, %r14d
	je	.L16904
	cmpl	$15, %r14d
.L17684:
	jne	.L11133
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17333:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17334
.L16904:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17333
.L18030:
	testq	%r10, %r10
	je	.L11186
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18032
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17332:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11186:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r14d
	jge	.L11191
	movb	$0, 2(%rdi)
.L11191:
	testq	%r10, %r10
	je	.L11133
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16903
	cmpb	$14, %al
	je	.L16904
	cmpb	$15, %al
	jmp	.L17684
.L16903:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%r9
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r9,%r9,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17334
.L18032:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17332
.L11175:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11177
	movl	$15, %r11d
	jmp	.L11174
.L11177:
	xorl	%ebx, %ebx
	jmp	.L11174
.L18029:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11137
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11133
	jmp	.L11137
.L18028:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L11161
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L11161
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L11161
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L11161
	movl	$1, %eax
	jmp	.L11162
.L18027:
	cmpw	$47, %dx
	jne	.L11158
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11158
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11158
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18033
	movq	24(%rbx), %rax
.L11156:
	cmpw	$67, (%rax)
	jne	.L11158
	cmpq	%rsi, %rcx
	jne	.L11158
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11150
.L18033:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11150
	jmp	.L11156
.L18026:
	movq	8(%rax), %rbx
	jmp	.L11150
.L18025:
	cmpw	$47, %dx
	je	.L18034
.L11147:
	xorl	%ebp, %ebp
	jmp	.L11139
.L18034:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11147
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11147
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18035
	movq	24(%rbp), %rax
.L11145:
	cmpw	$67, (%rax)
	jne	.L11147
	cmpq	%rsi, %rcx
	jne	.L11147
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L11139
.L18035:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L11139
	jmp	.L11145
.L18024:
	movq	8(%rax), %rbp
	jmp	.L11139
.L11129:
	movq	248(%rsp), %r8
	movq	256(%rsp), %rsi
	movq	8(%r8), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L11057
	movq	240(%rsp), %rdi
	movl	$14, %r14d
	movq	8(%rdi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L11057
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L11057
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L11061
	cmpw	$34, %ax
	je	.L11061
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L11063
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18036
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18037
.L11063:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L11074
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18038
	cmpw	$33, (%r13)
	je	.L18039
.L11082:
	xorl	%ebx, %ebx
.L11074:
	testq	%rbp, %rbp
	je	.L11061
	testq	%rbx, %rbx
	je	.L11061
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18040
.L11085:
	xorl	%eax, %eax
.L11086:
	testl	%eax, %eax
	jne	.L18041
.L11061:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L11087
	testb	$16, 3(%rax)
	je	.L11087
	cmpw	$36, (%rax)
	je	.L11087
.L11088:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L11089
	testb	$16, 3(%rax)
	je	.L11089
	cmpw	$36, (%rax)
	je	.L11089
	movq	%rax, %rbx
	jmp	.L11088
.L11089:
	cmpq	%rbx, 1696(%rsp)
	je	.L11057
	movq	%rbx, %r13
.L11087:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L11094
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L11098
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11099
	movl	$14, %r11d
.L11098:
	testl	%ebx, %ebx
	je	.L11104
	cmpl	%r11d, %r14d
	jge	.L11057
.L11094:
	testl	%ebx, %ebx
	je	.L11104
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L11104
.L11122:
	cmpq	%r13, 8(%rdi)
	je	.L18042
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L11122
.L11104:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L11057
	testl	%r14d, %r14d
	jne	.L11124
	movslq	8(%r13),%rbx
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %r9
	leaq	(%rbx,%rbx,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%r9), %ecx
	movslq	16(%r11,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17331:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L11057:
	movq	240(%rsp), %rax
	movq	248(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 240(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 248(%rsp)
	jne	.L11129
	jmp	.L16259
.L11124:
	cmpl	$14, %r14d
	je	.L16902
	cmpl	$15, %r14d
.L17683:
	jne	.L11057
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17330:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17331
.L16902:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17330
.L18042:
	testq	%r10, %r10
	je	.L11110
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18044
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17329:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L11110:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L11115
	movb	$14, 2(%rdi)
.L11115:
	testq	%r10, %r10
	je	.L11057
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16901
	cmpb	$14, %al
	je	.L16902
	cmpb	$15, %al
	jmp	.L17683
.L16901:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17331
.L18044:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %rbx
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17329
.L11099:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L11101
	movl	$15, %r11d
	jmp	.L11098
.L11101:
	xorl	%ebx, %ebx
	jmp	.L11098
.L18041:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L11061
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L11057
	jmp	.L11061
.L18040:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L11085
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L11085
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L11085
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L11085
	movl	$1, %eax
	jmp	.L11086
.L18039:
	cmpw	$47, %dx
	jne	.L11082
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11082
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11082
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18045
	movq	24(%rbx), %rax
.L11080:
	cmpw	$67, (%rax)
	jne	.L11082
	cmpq	%rsi, %rcx
	jne	.L11082
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L11074
.L18045:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L11074
	jmp	.L11080
.L18038:
	movq	8(%rax), %rbx
	jmp	.L11074
.L18037:
	cmpw	$47, %dx
	je	.L18046
.L11071:
	xorl	%ebp, %ebp
	jmp	.L11063
.L18046:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L11071
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L11071
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18047
	movq	24(%rbp), %rax
.L11069:
	cmpw	$67, (%rax)
	jne	.L11071
	cmpq	%rsi, %rcx
	jne	.L11071
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L11063
.L18047:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L11063
	jmp	.L11069
.L18036:
	movq	8(%rax), %rbp
	jmp	.L11063
.L18008:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r9b
	movq	%rax, 256(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r9b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	256(%rsp), %rax
	movq	8(%rax), %rdi
	call	cselib_subst_to_values
	movq	256(%rsp), %rcx
	movq	%rax, 8(%rcx)
	jmp	.L11049
.L11313:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17377:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L9008
.L11315:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17377
	.p2align 6,,7
.L18001:
	movq	current_sched_info(%rip), %r14
	movq	392(%rsp), %r15
	testb	$2, 96(%r14)
	jne	.L18048
.L10436:
	movq	compiler_params(%rip), %rcx
	movl	80(%rcx), %eax
	movq	1704(%rsp), %rcx
	cmpl	%eax, 32(%rcx)
	jg	.L18049
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %rbp
	movq	(%rax), %r11
	movq	8(%rbp), %r12
	testq	%r11, %r11
	movq	%r11, 328(%rsp)
	movq	%r12, 336(%rsp)
	jne	.L10528
.L16236:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r9
	movq	16(%rcx), %rbx
	movq	24(%r9), %r11
	testq	%rbx, %rbx
	movq	%rbx, 312(%rsp)
	movq	%r11, 320(%rsp)
	jne	.L10604
.L16239:
	movq	1704(%rsp), %r10
	movq	40(%r10), %r15
	testq	%r15, %r15
	je	.L16242
	movl	$14, %r14d
.L10680:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L10607
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L10607
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10612
	cmpw	$34, %ax
	je	.L10612
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10614
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18050
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18051
.L10614:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10625
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18052
	cmpw	$33, (%r13)
	je	.L18053
.L10633:
	xorl	%ebx, %ebx
.L10625:
	testq	%rbp, %rbp
	je	.L10612
	testq	%rbx, %rbx
	je	.L10612
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r11
	cmpb	$60, rtx_class(%r11)
	je	.L18054
.L10636:
	xorl	%eax, %eax
.L10637:
	testl	%eax, %eax
	jne	.L18055
.L10612:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10638
	testb	$16, 3(%rax)
	je	.L10638
	cmpw	$36, (%rax)
	je	.L10638
.L10639:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10640
	testb	$16, 3(%rax)
	je	.L10640
	cmpw	$36, (%rax)
	je	.L10640
	movq	%rax, %rbx
	jmp	.L10639
.L10640:
	cmpq	%rbx, 1696(%rsp)
	je	.L10607
	movq	%rbx, %r13
.L10638:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10645
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10649
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10650
	movl	$14, %r11d
.L10649:
	testl	%ebx, %ebx
	je	.L10655
	cmpl	%r11d, %r14d
	jge	.L10607
.L10645:
	testl	%ebx, %ebx
	je	.L10655
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10655
.L10673:
	cmpq	%r13, 8(%rdi)
	je	.L18056
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10673
.L10655:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L10607
	testl	%r14d, %r14d
	jne	.L10675
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rbx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %rbx
	salq	$4, %r12
	movl	16(%rbx,%r11), %ecx
	movslq	16(%r12,%r11),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17316:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L10607:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L10680
.L16242:
	movq	1704(%rsp), %rdx
	movq	1696(%rsp), %rdi
	movq	392(%rsp), %rbx
	movq	16(%rdx), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r15
	movq	1704(%rsp), %r14
	movq	%rax, 16(%r14)
	testb	$2, 96(%r15)
	jne	.L18057
.L10682:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	24(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %rcx
	movq	%rax, 24(%rcx)
	incl	32(%rcx)
.L10452:
	movq	392(%rsp), %r10
	movq	8(%r10), %r15
	testq	%r15, %r15
	je	.L10434
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L10686
	mov	%eax, %r9d
	jmp	*.L10993(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L10993:
	.quad	.L10977
	.quad	.L10977
	.quad	.L10686
	.quad	.L10977
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10964
	.quad	.L10686
	.quad	.L10434
	.quad	.L10434
	.quad	.L10434
	.quad	.L10686
	.quad	.L10434
	.quad	.L10686
	.quad	.L10686
	.quad	.L10693
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10724
	.quad	.L10434
	.quad	.L10434
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10686
	.quad	.L10989
	.quad	.L10989
	.quad	.L10989
	.quad	.L10989
	.quad	.L10991
	.quad	.L10991
	.text
.L10693:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L10694
	leal	-8(%rbp), %r12d
	cmpl	$7, %r12d
	jbe	.L10697
	leal	-21(%rbp), %r8d
	cmpl	$7, %r8d
	jbe	.L10697
	leal	-45(%rbp), %esi
	cmpl	$7, %esi
	jbe	.L10697
	leal	-29(%rbp), %r13d
	cmpl	$7, %r13d
	ja	.L10695
.L10697:
	movzbq	2(%r15), %rdi
	movl	mode_class(,%rdi,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17317:
	addl	$2, %eax
.L10696:
	movl	%eax, %ebx
	decl	%ebx
	js	.L10434
.L10717:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L10717
	jmp	.L10434
.L10695:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18058
	cmpb	$24, %al
	je	.L18059
	movl	target_flags(%rip), %r11d
	testl	$33554432, %r11d
	movl	%r11d, %ecx
	je	.L10708
	movzbl	%al, %r14d 
	movzbl	mode_size(%r14), %r15d
	leal	7(%r15), %edx
.L10709:
	andl	$33554432, %ecx
	je	.L10710
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L10696
.L10710:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L10696
.L10708:
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r10d
	leal	3(%r10), %edx
	jmp	.L10709
.L18059:
	xorl	%ebx, %ebx
	testb	$2, target_flags+3(%rip)
	sete	%bl
	leal	4(%rbx,%rbx), %eax
	jmp	.L10696
.L18058:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17317
.L10694:
	movq	1704(%rsp), %rcx
	cmpl	68(%rcx), %ebp
	jl	.L10719
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L10434
	jmp	.L17569
.L10719:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L16631
	movq	reg_known_equiv_p(%rip), %r12
	movslq	%ebp,%rbx
	addq	%rbx, %r12
	cmpb	$0, (%r12)
	je	.L10722
	leaq	0(,%rbx,8), %r8
	addq	reg_known_value(%rip), %r8
	movq	(%r8), %rax
	cmpw	$66, (%rax)
	je	.L18060
.L10722:
	leaq	0(,%rbx,8), %rdi
	addq	reg_n_info(%rip), %rdi
	movq	32(%rdi), %r13
	movl	32(%r13), %esi
	testl	%esi, %esi
	jne	.L10434
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	56(%r11), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rbx
	movq	%rax, 56(%rbx)
	jmp	.L10434
.L18060:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L10722
.L16631:
	movslq	%ebp,%rbx
	jmp	.L10722
.L10977:
	cmpl	$41, %ebx
	je	.L18061
.L10979:
	movb	$1, reg_pending_barrier(%rip)
.L10978:
	cmpl	$41, %ebx
	je	.L18062
.L10686:
	movslq	%ebx,%rsi
	movzbl	rtx_length(%rsi), %edi
	movq	rtx_format(,%rsi,8), %r13
	movl	%edi, %ebp
	decl	%ebp
	js	.L10434
	leaq	8(%r15), %r14
.L11006:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18063
	cmpb	$69, %dl
	je	.L18064
.L10996:
	decl	%ebp
	jns	.L11006
	jmp	.L10434
	.p2align 6,,7
.L18064:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rcx
	cmpl	(%rcx), %ebx
	jge	.L10996
	movq	%rdx, %r12
.L11005:
	movq	(%r12), %r10
	movslq	%ebx,%rax
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%rax,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rdx
	cmpl	(%rdx), %ebx
	jl	.L11005
	jmp	.L10996
.L18063:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L10996
.L18062:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L10434
.L10985:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %r8
	cmpl	(%r8), %ebx
	movq	%r8, %rdx
	jl	.L10985
	jmp	.L10434
.L18061:
	testb	$8, 3(%r15)
	je	.L10978
	jmp	.L10979
.L10964:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r12
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r12, %rsi
	movl	$0, 32(%r12)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r14
	movq	%rax, 40(%r14)
	movl	$1, 36(%r14)
	jmp	.L10686
.L10724:
	movq	current_sched_info(%rip), %r14
	movq	%r15, 304(%rsp)
	testb	$2, 96(%r14)
	jne	.L18065
.L10725:
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %r12
	movq	(%rax), %rbp
	movq	8(%r12), %r9
	testq	%rbp, %rbp
	movq	%rbp, 288(%rsp)
	movq	%r9, 296(%rsp)
	jne	.L10805
.L16246:
	movq	1704(%rsp), %rbp
	movq	1704(%rsp), %r11
	movq	16(%rbp), %r10
	movq	24(%r11), %r9
	testq	%r10, %r10
	movq	%r10, 272(%rsp)
	movq	%r9, 280(%rsp)
	jne	.L10881
.L16249:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 264(%rsp)
	je	.L16252
.L10961:
	movq	264(%rsp), %r9
	movq	8(%r9), %r14
	cmpw	$33, (%r14)
	je	.L18066
.L10887:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L10884
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L10884
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10893
	cmpw	$34, %ax
	je	.L10893
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10895
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18067
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18068
.L10895:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10906
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18069
	cmpw	$33, (%r14)
	je	.L18070
.L10914:
	xorl	%ebx, %ebx
.L10906:
	testq	%rbp, %rbp
	je	.L10893
	testq	%rbx, %rbx
	je	.L10893
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18071
.L10917:
	xorl	%eax, %eax
.L10918:
	testl	%eax, %eax
	jne	.L18072
.L10893:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10919
	testb	$16, 3(%rax)
	je	.L10919
	cmpw	$36, (%rax)
	je	.L10919
.L10920:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10921
	testb	$16, 3(%rax)
	je	.L10921
	cmpw	$36, (%rax)
	je	.L10921
	movq	%rax, %rbx
	jmp	.L10920
.L10921:
	cmpq	%rbx, 1696(%rsp)
	je	.L10884
	movq	%rbx, %r13
.L10919:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10926
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rbp), %edx
	leaq	(%r12,%r12,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rbp),%rcx
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	leaq	0(,%rcx,8), %rdi
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10930
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10931
	movl	$14, %r11d
.L10930:
	testl	%ebx, %ebx
	je	.L10936
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L10884
.L10926:
	testl	%ebx, %ebx
	je	.L10936
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10936
.L10954:
	cmpq	%r13, 8(%rdi)
	je	.L18073
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10954
.L10936:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L10884
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L10956
	movslq	8(%r13),%r11
	movslq	8(%rdx),%r14
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rsi
	leaq	(%r14,%r14,2), %rbp
	salq	$4, %rsi
	salq	$4, %rbp
	movl	16(%rsi,%r9), %ecx
	movslq	16(%rbp,%r9),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17326:
	andl	$63, %ecx
	movl	$1, %esi
	salq	%cl, %rsi
	orq	%rsi, 16(%rax)
.L10884:
	movq	264(%rsp), %rax
	movq	16(%rax), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 264(%rsp)
	jne	.L10961
.L16252:
	movq	1704(%rsp), %r9
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%r9), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %rcx
	movq	1704(%rsp), %r10
	movq	%rax, (%r10)
	testb	$2, 96(%rcx)
	jne	.L18074
.L10962:
	movq	1704(%rsp), %rbp
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rbp), %rdx
	call	alloc_EXPR_LIST
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %r11
	incl	32(%r11)
	movq	%rax, 8(%r11)
	movq	%r11, %rdi
	movq	8(%r15), %rsi
	call	sched_analyze_2
	jmp	.L10434
.L18074:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L10962
.L10956:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16900
	movl	$14, %ebp
	cmpl	$15, %ebp
.L17682:
	jne	.L10884
	movq	1696(%rsp), %r8
	movq	h_i_d(%rip), %rcx
	movslq	8(%r8),%r12
	leaq	(%r12,%r12,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17325:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17326
.L16900:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17325
.L18073:
	testq	%r10, %r10
	je	.L10942
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18076
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r11
	movslq	8(%r12),%rcx
	leaq	(%rbp,%rbp,2), %r9
	salq	$4, %r9
	leaq	(%rcx,%rcx,2), %r14
	movl	16(%r9,%r11), %ecx
	salq	$4, %r14
	movslq	16(%r14,%r11),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17324:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10942:
	movzbl	2(%rdi), %edx
	movl	$14, %eax
	cmpl	%edx, %eax
	jge	.L10947
	movb	$14, 2(%rdi)
.L10947:
	testq	%r10, %r10
	je	.L10884
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16899
	cmpb	$14, %al
	je	.L16900
	cmpb	$15, %al
	jmp	.L17682
.L16899:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rbx), %ecx
	leaq	(%rsi,%rsi,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%rbx),%r12
	movl	%ecx, %r8d
	shrl	$6, %r8d
	mov	%r8d, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17326
.L18076:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r14,%rbp), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17324
.L10931:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10933
	movl	$15, %r11d
	jmp	.L10930
.L10933:
	xorl	%ebx, %ebx
	jmp	.L10930
.L18072:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10893
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10884
	jmp	.L10893
.L18071:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L10917
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10917
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L10917
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L10917
	movl	$1, %eax
	jmp	.L10918
.L18070:
	cmpw	$47, %dx
	jne	.L10914
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10914
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10914
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18077
	movq	24(%rbx), %rax
.L10912:
	cmpw	$67, (%rax)
	jne	.L10914
	cmpq	%rsi, %rcx
	jne	.L10914
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10906
.L18077:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10906
	jmp	.L10912
.L18069:
	movq	8(%rax), %rbx
	jmp	.L10906
.L18068:
	cmpw	$47, %dx
	je	.L18078
.L10903:
	xorl	%ebp, %ebp
	jmp	.L10895
.L18078:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10903
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10903
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18079
	movq	24(%rbp), %rax
.L10901:
	cmpw	$67, (%rax)
	jne	.L10903
	cmpq	%rsi, %rcx
	jne	.L10903
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10895
.L18079:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10895
	jmp	.L10901
.L18067:
	movq	8(%rax), %rbp
	jmp	.L10895
.L18066:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18080
.L10888:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L10884
	movq	264(%rsp), %rbp
	movq	8(%rbp), %r14
	jmp	.L10887
.L18080:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L10888
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %r11
	testq	%r11, %r11
	cmovne	%r11, %rdi
	jmp	.L10888
.L10881:
	movq	280(%rsp), %r12
	movq	304(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L10809
	movq	272(%rsp), %rcx
	xorl	%r14d, %r14d
	movq	8(%rcx), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L10809
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L10809
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10813
	cmpw	$34, %ax
	je	.L10813
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10815
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18081
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18082
.L10815:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10826
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18083
	cmpw	$33, (%r13)
	je	.L18084
.L10834:
	xorl	%ebx, %ebx
.L10826:
	testq	%rbp, %rbp
	je	.L10813
	testq	%rbx, %rbx
	je	.L10813
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18085
.L10837:
	xorl	%eax, %eax
.L10838:
	testl	%eax, %eax
	jne	.L18086
.L10813:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10839
	testb	$16, 3(%rax)
	je	.L10839
	cmpw	$36, (%rax)
	je	.L10839
.L10840:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10841
	testb	$16, 3(%rax)
	je	.L10841
	cmpw	$36, (%rax)
	je	.L10841
	movq	%rax, %rbx
	jmp	.L10840
.L10841:
	cmpq	%rbx, 1696(%rsp)
	je	.L10809
	movq	%rbx, %r13
.L10839:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10846
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10850
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10851
	movl	$14, %r11d
.L10850:
	testl	%ebx, %ebx
	je	.L10856
	cmpl	%r11d, %r14d
	jge	.L10809
.L10846:
	testl	%ebx, %ebx
	je	.L10856
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10856
.L10874:
	cmpq	%r13, 8(%rdi)
	je	.L18087
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10874
.L10856:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L10809
	testl	%r14d, %r14d
	jne	.L10876
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17323:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L10809:
	movq	272(%rsp), %rax
	movq	280(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 272(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 280(%rsp)
	jne	.L10881
	jmp	.L16249
.L10876:
	cmpl	$14, %r14d
	je	.L16898
	cmpl	$15, %r14d
.L17681:
	jne	.L10809
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17322:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17323
.L16898:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17322
.L18087:
	testq	%r10, %r10
	je	.L10862
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18089
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17321:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10862:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L10867
	movb	$0, 2(%rdi)
.L10867:
	testq	%r10, %r10
	je	.L10809
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16897
	cmpb	$14, %al
	je	.L16898
	cmpb	$15, %al
	jmp	.L17681
.L16897:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17323
.L18089:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17321
.L10851:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10853
	movl	$15, %r11d
	jmp	.L10850
.L10853:
	xorl	%ebx, %ebx
	jmp	.L10850
.L18086:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10813
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10809
	jmp	.L10813
.L18085:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L10837
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10837
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L10837
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L10837
	movl	$1, %eax
	jmp	.L10838
.L18084:
	cmpw	$47, %dx
	jne	.L10834
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10834
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10834
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18090
	movq	24(%rbx), %rax
.L10832:
	cmpw	$67, (%rax)
	jne	.L10834
	cmpq	%rsi, %rcx
	jne	.L10834
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10826
.L18090:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10826
	jmp	.L10832
.L18083:
	movq	8(%rax), %rbx
	jmp	.L10826
.L18082:
	cmpw	$47, %dx
	je	.L18091
.L10823:
	xorl	%ebp, %ebp
	jmp	.L10815
.L18091:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10823
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10823
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18092
	movq	24(%rbp), %rax
.L10821:
	cmpw	$67, (%rax)
	jne	.L10823
	cmpq	%rsi, %rcx
	jne	.L10823
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10815
.L18092:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10815
	jmp	.L10821
.L18081:
	movq	8(%rax), %rbp
	jmp	.L10815
.L10805:
	movq	296(%rsp), %r8
	movq	304(%rsp), %rsi
	movq	8(%r8), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L10733
	movq	288(%rsp), %rsi
	movl	$14, %r14d
	movq	8(%rsi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L10733
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L10733
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10737
	cmpw	$34, %ax
	je	.L10737
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10739
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18093
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18094
.L10739:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10750
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18095
	cmpw	$33, (%r13)
	je	.L18096
.L10758:
	xorl	%ebx, %ebx
.L10750:
	testq	%rbp, %rbp
	je	.L10737
	testq	%rbx, %rbx
	je	.L10737
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L18097
.L10761:
	xorl	%eax, %eax
.L10762:
	testl	%eax, %eax
	jne	.L18098
.L10737:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10763
	testb	$16, 3(%rax)
	je	.L10763
	cmpw	$36, (%rax)
	je	.L10763
.L10764:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10765
	testb	$16, 3(%rax)
	je	.L10765
	cmpw	$36, (%rax)
	je	.L10765
	movq	%rax, %rbx
	jmp	.L10764
.L10765:
	cmpq	%rbx, 1696(%rsp)
	je	.L10733
	movq	%rbx, %r13
.L10763:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10770
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10774
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10775
	movl	$14, %r11d
.L10774:
	testl	%ebx, %ebx
	je	.L10780
	cmpl	%r11d, %r14d
	jge	.L10733
.L10770:
	testl	%ebx, %ebx
	je	.L10780
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10780
.L10798:
	cmpq	%r13, 8(%rdi)
	je	.L18099
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10798
.L10780:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L10733
	testl	%r14d, %r14d
	jne	.L10800
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17320:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L10733:
	movq	288(%rsp), %rax
	movq	296(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 288(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 296(%rsp)
	jne	.L10805
	jmp	.L16246
.L10800:
	cmpl	$14, %r14d
	je	.L16896
	cmpl	$15, %r14d
.L17680:
	jne	.L10733
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17319:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17320
.L16896:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17319
.L18099:
	testq	%r10, %r10
	je	.L10786
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18101
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17318:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10786:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L10791
	movb	$14, 2(%rdi)
.L10791:
	testq	%r10, %r10
	je	.L10733
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16895
	cmpb	$14, %al
	je	.L16896
	cmpb	$15, %al
	jmp	.L17680
.L16895:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17320
.L18101:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17318
.L10775:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10777
	movl	$15, %r11d
	jmp	.L10774
.L10777:
	xorl	%ebx, %ebx
	jmp	.L10774
.L18098:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10737
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10733
	jmp	.L10737
.L18097:
	movzwl	(%rbx), %edi
	movslq	%edi,%r11
	cmpb	$60, rtx_class(%r11)
	jne	.L10761
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10761
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rbp)
	jne	.L10761
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L10761
	movl	$1, %eax
	jmp	.L10762
.L18096:
	cmpw	$47, %dx
	jne	.L10758
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10758
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10758
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18102
	movq	24(%rbx), %rax
.L10756:
	cmpw	$67, (%rax)
	jne	.L10758
	cmpq	%rsi, %rcx
	jne	.L10758
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10750
.L18102:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10750
	jmp	.L10756
.L18095:
	movq	8(%rax), %rbx
	jmp	.L10750
.L18094:
	cmpw	$47, %dx
	je	.L18103
.L10747:
	xorl	%ebp, %ebp
	jmp	.L10739
.L18103:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10747
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10747
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18104
	movq	24(%rbp), %rax
.L10745:
	cmpw	$67, (%rax)
	jne	.L10747
	cmpq	%rsi, %rcx
	jne	.L10747
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10739
.L18104:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10739
	jmp	.L10745
.L18093:
	movq	8(%rax), %rbp
	jmp	.L10739
.L18065:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%cl
	movq	%rax, 304(%rsp)
	movq	8(%rax), %rdi
	movzbl	%cl, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	304(%rsp), %rdx
	movq	8(%rdx), %rdi
	call	cselib_subst_to_values
	movq	304(%rsp), %r10
	movq	%rax, 8(%r10)
	jmp	.L10725
.L10989:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17327:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L10434
.L10991:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17327
.L18057:
	movq	392(%rsp), %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L10682
.L10675:
	cmpl	$14, %r14d
	je	.L16894
	cmpl	$15, %r14d
.L17679:
	jne	.L10607
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17315:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17316
.L16894:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17315
.L18056:
	testq	%r10, %r10
	je	.L10661
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18106
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17314:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10661:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L10666
	movb	$14, 2(%rdi)
.L10666:
	testq	%r10, %r10
	je	.L10607
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16893
	cmpb	$14, %al
	je	.L16894
	cmpb	$15, %al
	jmp	.L17679
.L16893:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r11
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%r11,%r11,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17316
.L18106:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r11
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17314
.L10650:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10652
	movl	$15, %r11d
	jmp	.L10649
.L10652:
	xorl	%ebx, %ebx
	jmp	.L10649
.L18055:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10612
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10607
	jmp	.L10612
.L18054:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L10636
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10636
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L10636
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L10636
	movl	$1, %eax
	jmp	.L10637
.L18053:
	cmpw	$47, %dx
	jne	.L10633
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10633
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10633
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18107
	movq	24(%rbx), %rax
.L10631:
	cmpw	$67, (%rax)
	jne	.L10633
	cmpq	%rsi, %rcx
	jne	.L10633
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10625
.L18107:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10625
	jmp	.L10631
.L18052:
	movq	8(%rax), %rbx
	jmp	.L10625
.L18051:
	cmpw	$47, %dx
	je	.L18108
.L10622:
	xorl	%ebp, %ebp
	jmp	.L10614
.L18108:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10622
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10622
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18109
	movq	24(%rbp), %rax
.L10620:
	cmpw	$67, (%rax)
	jne	.L10622
	cmpq	%rsi, %rcx
	jne	.L10622
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10614
.L18109:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10614
	jmp	.L10620
.L18050:
	movq	8(%rax), %rbp
	jmp	.L10614
	.p2align 6,,7
.L10604:
	movq	320(%rsp), %r12
	movq	%r15, %rsi
	movq	8(%r12), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L10532
	movq	312(%rsp), %rbp
	movl	$15, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L10532
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L10532
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10536
	cmpw	$34, %ax
	je	.L10536
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10538
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18110
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18111
.L10538:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10549
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18112
	cmpw	$33, (%r13)
	je	.L18113
.L10557:
	xorl	%ebx, %ebx
.L10549:
	testq	%rbp, %rbp
	je	.L10536
	testq	%rbx, %rbx
	je	.L10536
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18114
.L10560:
	xorl	%eax, %eax
.L10561:
	testl	%eax, %eax
	jne	.L18115
.L10536:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10562
	testb	$16, 3(%rax)
	je	.L10562
	cmpw	$36, (%rax)
	je	.L10562
.L10563:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10564
	testb	$16, 3(%rax)
	je	.L10564
	cmpw	$36, (%rax)
	je	.L10564
	movq	%rax, %rbx
	jmp	.L10563
.L10564:
	cmpq	%rbx, 1696(%rsp)
	je	.L10532
	movq	%rbx, %r13
.L10562:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10569
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10573
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10574
	movl	$14, %r11d
.L10573:
	testl	%ebx, %ebx
	je	.L10579
	cmpl	%r11d, %r14d
	jge	.L10532
.L10569:
	testl	%ebx, %ebx
	je	.L10579
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10579
.L10597:
	cmpq	%r13, 8(%rdi)
	je	.L18116
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10597
.L10579:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L10532
	testl	%r14d, %r14d
	jne	.L10599
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r11), %ecx
	movslq	16(%rbp,%r11),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17313:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L10532:
	movq	312(%rsp), %rax
	movq	320(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 312(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 320(%rsp)
	jne	.L10604
	jmp	.L16239
.L10599:
	cmpl	$14, %r14d
	je	.L16892
	cmpl	$15, %r14d
.L17678:
	jne	.L10532
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17312:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17313
.L16892:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17312
.L18116:
	testq	%r10, %r10
	je	.L10585
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18118
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r9,%rbp), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17311:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10585:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L10590
	movb	$15, 2(%rdi)
.L10590:
	testq	%r10, %r10
	je	.L10532
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16891
	cmpb	$14, %al
	je	.L16892
	cmpb	$15, %al
	jmp	.L17678
.L16891:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17313
.L18118:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17311
.L10574:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10576
	movl	$15, %r11d
	jmp	.L10573
.L10576:
	xorl	%ebx, %ebx
	jmp	.L10573
.L18115:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10536
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10532
	jmp	.L10536
.L18114:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L10560
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10560
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L10560
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L10560
	movl	$1, %eax
	jmp	.L10561
.L18113:
	cmpw	$47, %dx
	jne	.L10557
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10557
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10557
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18119
	movq	24(%rbx), %rax
.L10555:
	cmpw	$67, (%rax)
	jne	.L10557
	cmpq	%rsi, %rcx
	jne	.L10557
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10549
.L18119:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10549
	jmp	.L10555
.L18112:
	movq	8(%rax), %rbx
	jmp	.L10549
.L18111:
	cmpw	$47, %dx
	je	.L18120
.L10546:
	xorl	%ebp, %ebp
	jmp	.L10538
.L18120:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10546
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10546
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18121
	movq	24(%rbp), %rax
.L10544:
	cmpw	$67, (%rax)
	jne	.L10546
	cmpq	%rsi, %rcx
	jne	.L10546
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10538
.L18121:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10538
	jmp	.L10544
.L18110:
	movq	8(%rax), %rbp
	jmp	.L10538
	.p2align 6,,7
.L10528:
	movq	336(%rsp), %r8
	movq	%r15, %rsi
	movq	8(%r8), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L10456
	movq	328(%rsp), %rsi
	movl	$14, %r14d
	movq	8(%rsi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L10456
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L10456
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10460
	cmpw	$34, %ax
	je	.L10460
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10462
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18122
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18123
.L10462:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10473
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18124
	cmpw	$33, (%r13)
	je	.L18125
.L10481:
	xorl	%ebx, %ebx
.L10473:
	testq	%rbp, %rbp
	je	.L10460
	testq	%rbx, %rbx
	je	.L10460
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L18126
.L10484:
	xorl	%eax, %eax
.L10485:
	testl	%eax, %eax
	jne	.L18127
.L10460:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10486
	testb	$16, 3(%rax)
	je	.L10486
	cmpw	$36, (%rax)
	je	.L10486
.L10487:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10488
	testb	$16, 3(%rax)
	je	.L10488
	cmpw	$36, (%rax)
	je	.L10488
	movq	%rax, %rbx
	jmp	.L10487
.L10488:
	cmpq	%rbx, 1696(%rsp)
	je	.L10456
	movq	%rbx, %r13
.L10486:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10493
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10497
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10498
	movl	$14, %r11d
.L10497:
	testl	%ebx, %ebx
	je	.L10503
	cmpl	%r11d, %r14d
	jge	.L10456
.L10493:
	testl	%ebx, %ebx
	je	.L10503
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10503
.L10521:
	cmpq	%r13, 8(%rdi)
	je	.L18128
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10521
.L10503:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L10456
	testl	%r14d, %r14d
	jne	.L10523
	movslq	8(%r13),%r11
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%r12,%r12,2), %r9
	salq	$4, %rdi
	salq	$4, %r9
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r9,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17310:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L10456:
	movq	328(%rsp), %rax
	movq	336(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 328(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 336(%rsp)
	jne	.L10528
	jmp	.L16236
.L10523:
	cmpl	$14, %r14d
	je	.L16890
	cmpl	$15, %r14d
.L17677:
	jne	.L10456
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17309:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17310
.L16890:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17309
.L18128:
	testq	%r10, %r10
	je	.L10509
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18130
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17308:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10509:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L10514
	movb	$14, 2(%rdi)
.L10514:
	testq	%r10, %r10
	je	.L10456
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16889
	cmpb	$14, %al
	je	.L16890
	cmpb	$15, %al
	jmp	.L17677
.L16889:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17310
.L18130:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r11
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17308
.L10498:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10500
	movl	$15, %r11d
	jmp	.L10497
.L10500:
	xorl	%ebx, %ebx
	jmp	.L10497
.L18127:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10460
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10456
	jmp	.L10460
.L18126:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L10484
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10484
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L10484
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L10484
	movl	$1, %eax
	jmp	.L10485
.L18125:
	cmpw	$47, %dx
	jne	.L10481
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10481
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10481
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18131
	movq	24(%rbx), %rax
.L10479:
	cmpw	$67, (%rax)
	jne	.L10481
	cmpq	%rsi, %rcx
	jne	.L10481
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10473
.L18131:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10473
	jmp	.L10479
.L18124:
	movq	8(%rax), %rbx
	jmp	.L10473
.L18123:
	cmpw	$47, %dx
	je	.L18132
.L10470:
	xorl	%ebp, %ebp
	jmp	.L10462
.L18132:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10470
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10470
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18133
	movq	24(%rbp), %rax
.L10468:
	cmpw	$67, (%rax)
	jne	.L10470
	cmpq	%rsi, %rcx
	jne	.L10470
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10462
.L18133:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10462
	jmp	.L10468
.L18122:
	movq	8(%rax), %rbp
	jmp	.L10462
.L18049:
	movq	1696(%rsp), %rdi
	movq	%rcx, %rsi
	movl	$14, %edx
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$8, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r10
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	movq	%r10, %rsi
	movl	$0, 32(%r10)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r15
	movq	%rax, 40(%r15)
	movl	$1, 36(%r15)
	jmp	.L10452
.L18048:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	testb	$2, target_flags+3(%rip)
	setne	%dl
	movq	8(%rax), %rdi
	movq	%rax, %r15
	movzbl	%dl, %esi
	movl	$1, %edx
	addl	$4, %esi
	call	cselib_lookup
	movq	8(%r15), %rdi
	call	cselib_subst_to_values
	movq	%rax, 8(%r15)
	jmp	.L10436
	.p2align 6,,7
.L18000:
	movq	392(%rsp), %r13
	movl	8(%r13), %ebp
	cmpl	$52, %ebp
	jg	.L9996
	leal	-8(%rbp), %ecx
	cmpl	$7, %ecx
	jbe	.L9999
	leal	-21(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L9999
	leal	-45(%rbp), %r8d
	cmpl	$7, %r8d
	jbe	.L9999
	leal	-29(%rbp), %r12d
	cmpl	$7, %r12d
	ja	.L9997
.L9999:
	movq	392(%rsp), %rdi
	movzbq	2(%rdi), %rsi
	movl	mode_class(,%rsi,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17293:
	addl	$2, %eax
.L9998:
	movl	$49, %ecx
	cmpl	$47, %ecx
	je	.L18134
	movl	%eax, %ebx
	decl	%ebx
	js	.L10434
.L10025:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L10025
	jmp	.L10434
.L18134:
	movl	%eax, %ebx
	decl	%ebx
	js	.L10434
.L10020:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L10020
	jmp	.L10434
.L9997:
	movq	392(%rsp), %r9
	movzbl	2(%r9), %eax
	cmpb	$18, %al
	je	.L18135
	cmpb	$24, %al
	je	.L18136
	movl	target_flags(%rip), %r11d
	testl	$33554432, %r11d
	movl	%r11d, %ecx
	je	.L10010
	movzbl	%al, %ebx 
	movzbl	mode_size(%rbx), %r15d
	leal	7(%r15), %edx
.L10011:
	andl	$33554432, %ecx
	je	.L10012
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L9998
.L10012:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L9998
.L10010:
	movzbl	%al, %r13d 
	movzbl	mode_size(%r13), %r14d
	leal	3(%r14), %edx
	jmp	.L10011
.L18136:
	xorl	%r10d, %r10d
	testb	$2, target_flags+3(%rip)
	sete	%r10b
	leal	4(%r10,%r10), %eax
	jmp	.L9998
.L18135:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17293
.L9996:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %ebp
	jl	.L10027
	movq	1696(%rsp), %r8
	movq	32(%r8), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L10434
	jmp	.L17570
.L10027:
	movl	$49, %edx
	cmpl	$47, %edx
	je	.L18137
	movq	reg_pending_clobbers(%rip), %rdi
.L17294:
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %eax
	testl	%eax, %eax
	jne	.L16607
	movslq	%ebp,%rbp
	movq	%rbp, %r12
	movq	%rbp, 24(%rsp)
	addq	reg_known_equiv_p(%rip), %r12
	cmpb	$0, (%r12)
	je	.L16622
	movq	%rbp, %rsi
	salq	$3, %rsi
	addq	reg_known_value(%rip), %rsi
	movq	(%rsi), %rax
	cmpw	$66, (%rax)
	je	.L18138
.L16622:
	movq	reg_n_info(%rip), %rdx
.L10032:
	movq	24(%rsp), %r14
	movq	32(%rdx,%r14,8), %r11
	movl	32(%r11), %ebx
	testl	%ebx, %ebx
	jne	.L10434
	movq	1704(%rsp), %r12
	movq	48(%r12), %r15
	testq	%r15, %r15
	je	.L10434
	movl	$14, %r14d
.L10432:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L10359
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L10359
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10364
	cmpw	$34, %ax
	je	.L10364
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10366
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18139
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18140
.L10366:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10377
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18141
	cmpw	$33, (%r13)
	je	.L18142
.L10385:
	xorl	%ebx, %ebx
.L10377:
	testq	%rbp, %rbp
	je	.L10364
	testq	%rbx, %rbx
	je	.L10364
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r8
	cmpb	$60, rtx_class(%r8)
	je	.L18143
.L10388:
	xorl	%eax, %eax
.L10389:
	testl	%eax, %eax
	jne	.L18144
.L10364:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10390
	testb	$16, 3(%rax)
	je	.L10390
	cmpw	$36, (%rax)
	je	.L10390
.L10391:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10392
	testb	$16, 3(%rax)
	je	.L10392
	cmpw	$36, (%rax)
	je	.L10392
	movq	%rax, %rbx
	jmp	.L10391
.L10392:
	cmpq	%rbx, 1696(%rsp)
	je	.L10359
	movq	%rbx, %r13
.L10390:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10397
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10401
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10402
	movl	$14, %r11d
.L10401:
	testl	%ebx, %ebx
	je	.L10407
	cmpl	%r11d, %r14d
	jge	.L10359
.L10397:
	testl	%ebx, %ebx
	je	.L10407
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L10407
.L10425:
	cmpq	%r13, 8(%rdi)
	je	.L18145
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10425
.L10407:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L10359
	testl	%r14d, %r14d
	jne	.L10427
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %r9
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r9
	salq	$4, %r12
	movl	16(%r9,%rbx), %ecx
	movslq	16(%r12,%rbx),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17307:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L10359:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L10432
	jmp	.L10434
.L10427:
	cmpl	$14, %r14d
	je	.L16888
	cmpl	$15, %r14d
.L17676:
	jne	.L10359
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17306:
	movslq	8(%r13),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17307
.L16888:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17306
.L18145:
	testq	%r10, %r10
	je	.L10413
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18147
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17305:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10413:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L10418
	movb	$14, 2(%rdi)
.L10418:
	testq	%r10, %r10
	je	.L10359
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16887
	cmpb	$14, %al
	je	.L16888
	cmpb	$15, %al
	jmp	.L17676
.L16887:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%rbx
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%rbx,%rbx,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17307
.L18147:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %rbx
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17305
.L10402:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10404
	movl	$15, %r11d
	jmp	.L10401
.L10404:
	xorl	%ebx, %ebx
	jmp	.L10401
.L18144:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10364
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10359
	jmp	.L10364
.L18143:
	movzwl	(%rbx), %edi
	movslq	%edi,%rcx
	cmpb	$60, rtx_class(%rcx)
	jne	.L10388
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10388
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rbp)
	jne	.L10388
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L10388
	movl	$1, %eax
	jmp	.L10389
.L18142:
	cmpw	$47, %dx
	jne	.L10385
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10385
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10385
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18148
	movq	24(%rbx), %rax
.L10383:
	cmpw	$67, (%rax)
	jne	.L10385
	cmpq	%rsi, %rcx
	jne	.L10385
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10377
.L18148:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10377
	jmp	.L10383
.L18141:
	movq	8(%rax), %rbx
	jmp	.L10377
.L18140:
	cmpw	$47, %dx
	je	.L18149
.L10374:
	xorl	%ebp, %ebp
	jmp	.L10366
.L18149:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10374
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10374
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18150
	movq	24(%rbp), %rax
.L10372:
	cmpw	$67, (%rax)
	jne	.L10374
	cmpq	%rsi, %rcx
	jne	.L10374
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10366
.L18150:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10366
	jmp	.L10372
.L18139:
	movq	8(%rax), %rbp
	jmp	.L10366
.L18138:
	movq	8(%rax), %r15
	testq	%r15, %r15
	je	.L16622
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L10035
	mov	%eax, %edi
	jmp	*.L10342(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L10342:
	.quad	.L10326
	.quad	.L10326
	.quad	.L10035
	.quad	.L10326
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10313
	.quad	.L10035
	.quad	.L16622
	.quad	.L16622
	.quad	.L16622
	.quad	.L10035
	.quad	.L16622
	.quad	.L10035
	.quad	.L10035
	.quad	.L10042
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10073
	.quad	.L16622
	.quad	.L16622
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10035
	.quad	.L10338
	.quad	.L10338
	.quad	.L10338
	.quad	.L10338
	.quad	.L10340
	.quad	.L10340
	.text
.L10042:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L10043
	leal	-8(%rbp), %r9d
	cmpl	$7, %r9d
	jbe	.L10046
	leal	-21(%rbp), %r10d
	cmpl	$7, %r10d
	jbe	.L10046
	leal	-45(%rbp), %r11d
	cmpl	$7, %r11d
	jbe	.L10046
	leal	-29(%rbp), %ebx
	cmpl	$7, %ebx
	ja	.L10044
.L10046:
	movzbq	2(%r15), %r14
	movl	mode_class(,%r14,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17295:
	addl	$2, %eax
.L10045:
	movl	%eax, %ebx
	decl	%ebx
	js	.L16622
.L10066:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L10066
	jmp	.L16622
.L10044:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18151
	cmpb	$24, %al
	je	.L18152
	movl	target_flags(%rip), %r13d
	testl	$33554432, %r13d
	movl	%r13d, %ecx
	je	.L10057
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r8d
	leal	7(%r8), %edx
.L10058:
	andl	$33554432, %ecx
	je	.L10059
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L10045
.L10059:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L10045
.L10057:
	movzbl	%al, %esi 
	movzbl	mode_size(%rsi), %r12d
	leal	3(%r12), %edx
	jmp	.L10058
.L18152:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L10045
.L18151:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17295
.L10043:
	movq	1704(%rsp), %rcx
	cmpl	68(%rcx), %ebp
	jl	.L10068
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L16622
	jmp	.L17569
.L10068:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %edi
	testl	%edi, %edi
	jne	.L16614
	movq	reg_known_equiv_p(%rip), %r9
	movslq	%ebp,%rbx
	addq	%rbx, %r9
	cmpb	$0, (%r9)
	je	.L10071
	leaq	0(,%rbx,8), %r10
	addq	reg_known_value(%rip), %r10
	movq	(%r10), %rax
	cmpw	$66, (%rax)
	je	.L18153
.L10071:
	movq	reg_n_info(%rip), %rdx
	movq	32(%rdx,%rbx,8), %r14
	movl	32(%r14), %r11d
	testl	%r11d, %r11d
	jne	.L10032
	movq	1704(%rsp), %r15
	movq	1696(%rsp), %rdi
	movq	56(%r15), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rbx
	movq	%rax, 56(%rbx)
	jmp	.L16622
.L18153:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L10071
.L16614:
	movslq	%ebp,%rbx
	jmp	.L10071
.L10326:
	cmpl	$41, %ebx
	je	.L18154
.L10328:
	movb	$1, reg_pending_barrier(%rip)
.L10327:
	cmpl	$41, %ebx
	je	.L18155
.L10035:
	movslq	%ebx,%rbp
	movzbl	rtx_length(%rbp), %edi
	movq	rtx_format(,%rbp,8), %r13
	movl	%edi, %ebp
	decl	%ebp
	js	.L16622
	leaq	8(%r15), %r14
.L10355:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18156
	cmpb	$69, %dl
	je	.L18157
.L10345:
	decl	%ebp
	jns	.L10355
	jmp	.L16622
.L18157:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L10345
	movq	%rdx, %r12
.L10354:
	movq	(%r12), %r10
	movslq	%ebx,%r9
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%r9,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rdx
	cmpl	(%rdx), %ebx
	jl	.L10354
	jmp	.L10345
.L18156:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L10345
.L18155:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L16622
.L10334:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %rcx
	cmpl	(%rcx), %ebx
	movq	%rcx, %rdx
	jl	.L10334
	jmp	.L16622
.L18154:
	testb	$8, 3(%r15)
	je	.L10327
	jmp	.L10328
.L10313:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r8
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r8, %rsi
	movl	$0, 32(%r8)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r12
	movq	%rax, 40(%r12)
	movl	$1, 36(%r12)
	jmp	.L10035
.L10073:
	movq	current_sched_info(%rip), %r13
	movq	%r15, 384(%rsp)
	testb	$2, 96(%r13)
	jne	.L18158
.L10074:
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %rdi
	movq	(%rax), %rsi
	movq	8(%rdi), %rbp
	testq	%rsi, %rsi
	movq	%rsi, 368(%rsp)
	movq	%rbp, 376(%rsp)
	jne	.L10154
.L16222:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %rbx
	movq	24(%r11), %r9
	testq	%rbx, %rbx
	movq	%rbx, 352(%rsp)
	movq	%r9, 360(%rsp)
	jne	.L10230
.L16225:
	movq	1704(%rsp), %r9
	movq	40(%r9), %r10
	testq	%r10, %r10
	movq	%r10, 344(%rsp)
	je	.L16228
.L10310:
	movq	344(%rsp), %r11
	movq	8(%r11), %r14
	cmpw	$33, (%r14)
	je	.L18159
.L10236:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L10233
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L10233
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10242
	cmpw	$34, %ax
	je	.L10242
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10244
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18160
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18161
.L10244:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10255
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18162
	cmpw	$33, (%r14)
	je	.L18163
.L10263:
	xorl	%ebx, %ebx
.L10255:
	testq	%rbp, %rbp
	je	.L10242
	testq	%rbx, %rbx
	je	.L10242
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18164
.L10266:
	xorl	%eax, %eax
.L10267:
	testl	%eax, %eax
	jne	.L18165
.L10242:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10268
	testb	$16, 3(%rax)
	je	.L10268
	cmpw	$36, (%rax)
	je	.L10268
.L10269:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10270
	testb	$16, 3(%rax)
	je	.L10270
	cmpw	$36, (%rax)
	je	.L10270
	movq	%rax, %rbx
	jmp	.L10269
.L10270:
	cmpq	%rbx, 1696(%rsp)
	je	.L10233
	movq	%rbx, %r13
.L10268:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10275
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%rbp
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	leaq	(%rbp,%rbp,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r12
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	movl	%edx, %ecx
	leaq	0(,%r12,8), %rdi
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10279
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10280
	movl	$14, %r11d
.L10279:
	testl	%ebx, %ebx
	je	.L10285
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L10233
.L10275:
	testl	%ebx, %ebx
	je	.L10285
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10285
.L10303:
	cmpq	%r13, 8(%rdi)
	je	.L18166
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10303
.L10285:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L10233
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L10305
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rsi
	leaq	(%rcx,%rcx,2), %r14
	salq	$4, %rsi
	salq	$4, %r14
	movl	16(%rsi,%r9), %ecx
	movslq	16(%r14,%r9),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17304:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L10233:
	movq	344(%rsp), %rsi
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 344(%rsp)
	jne	.L10310
.L16228:
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%r11), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r10
	movq	1704(%rsp), %r9
	movq	%rax, (%r9)
	testb	$2, 96(%r10)
	jne	.L18167
.L10311:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %r14
	incl	32(%r14)
	movq	%rax, 8(%r14)
	movq	%r14, %rdi
	movq	8(%r15), %rsi
	call	sched_analyze_2
	jmp	.L16622
.L18167:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L10311
.L10305:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16886
	movl	$14, %r14d
	cmpl	$15, %r14d
.L17675:
	jne	.L10233
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r8
	movq	h_i_d(%rip), %rcx
	leaq	(%r8,%r8,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17303:
	movslq	8(%r13),%rdi
	leaq	(%rdi,%rdi,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17304
.L16886:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17303
.L18166:
	testq	%r10, %r10
	je	.L10291
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18169
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%r14
	movq	h_i_d(%rip), %r11
	movslq	8(%r12),%rcx
	leaq	(%r14,%r14,2), %r9
	salq	$4, %r9
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%r9,%r11), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r11),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17302:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10291:
	movzbl	2(%rdi), %ebp
	movl	$14, %eax
	cmpl	%ebp, %eax
	jge	.L10296
	movb	$14, 2(%rdi)
.L10296:
	testq	%r10, %r10
	je	.L10233
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16885
	cmpb	$14, %al
	je	.L16886
	cmpb	$15, %al
	jmp	.L17675
.L16885:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%rsi
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbp), %ecx
	leaq	(%rsi,%rsi,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rbp),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17304
.L18169:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rbp
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r14), %ecx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r14),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17302
.L10280:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10282
	movl	$15, %r11d
	jmp	.L10279
.L10282:
	xorl	%ebx, %ebx
	jmp	.L10279
.L18165:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10242
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10233
	jmp	.L10242
.L18164:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L10266
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10266
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L10266
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L10266
	movl	$1, %eax
	jmp	.L10267
.L18163:
	cmpw	$47, %dx
	jne	.L10263
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10263
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10263
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18170
	movq	24(%rbx), %rax
.L10261:
	cmpw	$67, (%rax)
	jne	.L10263
	cmpq	%rsi, %rcx
	jne	.L10263
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10255
.L18170:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10255
	jmp	.L10261
.L18162:
	movq	8(%rax), %rbx
	jmp	.L10255
.L18161:
	cmpw	$47, %dx
	je	.L18171
.L10252:
	xorl	%ebp, %ebp
	jmp	.L10244
.L18171:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10252
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10252
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18172
	movq	24(%rbp), %rax
.L10250:
	cmpw	$67, (%rax)
	jne	.L10252
	cmpq	%rsi, %rcx
	jne	.L10252
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10244
.L18172:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10244
	jmp	.L10250
.L18160:
	movq	8(%rax), %rbp
	jmp	.L10244
.L18159:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18173
.L10237:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L10233
	movq	344(%rsp), %rcx
	movq	8(%rcx), %r14
	jmp	.L10236
.L18173:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L10237
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	cmovne	%rbp, %rdi
	jmp	.L10237
.L10230:
	movq	360(%rsp), %r12
	movq	384(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L10158
	movq	352(%rsp), %rbp
	xorl	%r14d, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L10158
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L10158
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10162
	cmpw	$34, %ax
	je	.L10162
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10164
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18174
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18175
.L10164:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10175
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18176
	cmpw	$33, (%r13)
	je	.L18177
.L10183:
	xorl	%ebx, %ebx
.L10175:
	testq	%rbp, %rbp
	je	.L10162
	testq	%rbx, %rbx
	je	.L10162
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18178
.L10186:
	xorl	%eax, %eax
.L10187:
	testl	%eax, %eax
	jne	.L18179
.L10162:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10188
	testb	$16, 3(%rax)
	je	.L10188
	cmpw	$36, (%rax)
	je	.L10188
.L10189:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10190
	testb	$16, 3(%rax)
	je	.L10190
	cmpw	$36, (%rax)
	je	.L10190
	movq	%rax, %rbx
	jmp	.L10189
.L10190:
	cmpq	%rbx, 1696(%rsp)
	je	.L10158
	movq	%rbx, %r13
.L10188:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10195
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10199
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10200
	movl	$14, %r11d
.L10199:
	testl	%ebx, %ebx
	je	.L10205
	cmpl	%r11d, %r14d
	jge	.L10158
.L10195:
	testl	%ebx, %ebx
	je	.L10205
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10205
.L10223:
	cmpq	%r13, 8(%rdi)
	je	.L18180
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10223
.L10205:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L10158
	testl	%r14d, %r14d
	jne	.L10225
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17301:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L10158:
	movq	352(%rsp), %rax
	movq	360(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 352(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 360(%rsp)
	jne	.L10230
	jmp	.L16225
.L10225:
	cmpl	$14, %r14d
	je	.L16884
	cmpl	$15, %r14d
.L17674:
	jne	.L10158
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17300:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17301
.L16884:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17300
.L18180:
	testq	%r10, %r10
	je	.L10211
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18182
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17299:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10211:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L10216
	movb	$0, 2(%rdi)
.L10216:
	testq	%r10, %r10
	je	.L10158
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16883
	cmpb	$14, %al
	je	.L16884
	cmpb	$15, %al
	jmp	.L17674
.L16883:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17301
.L18182:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17299
.L10200:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10202
	movl	$15, %r11d
	jmp	.L10199
.L10202:
	xorl	%ebx, %ebx
	jmp	.L10199
.L18179:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10162
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10158
	jmp	.L10162
.L18178:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L10186
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10186
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L10186
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L10186
	movl	$1, %eax
	jmp	.L10187
.L18177:
	cmpw	$47, %dx
	jne	.L10183
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10183
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10183
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18183
	movq	24(%rbx), %rax
.L10181:
	cmpw	$67, (%rax)
	jne	.L10183
	cmpq	%rsi, %rcx
	jne	.L10183
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10175
.L18183:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10175
	jmp	.L10181
.L18176:
	movq	8(%rax), %rbx
	jmp	.L10175
.L18175:
	cmpw	$47, %dx
	je	.L18184
.L10172:
	xorl	%ebp, %ebp
	jmp	.L10164
.L18184:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10172
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10172
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18185
	movq	24(%rbp), %rax
.L10170:
	cmpw	$67, (%rax)
	jne	.L10172
	cmpq	%rsi, %rcx
	jne	.L10172
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10164
.L18185:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10164
	jmp	.L10170
.L18174:
	movq	8(%rax), %rbp
	jmp	.L10164
.L10154:
	movq	376(%rsp), %rcx
	movq	384(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L10082
	movq	368(%rsp), %r9
	movl	$14, %r14d
	movq	8(%r9), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L10082
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L10082
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L10086
	cmpw	$34, %ax
	je	.L10086
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L10088
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18186
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18187
.L10088:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L10099
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18188
	cmpw	$33, (%r13)
	je	.L18189
.L10107:
	xorl	%ebx, %ebx
.L10099:
	testq	%rbp, %rbp
	je	.L10086
	testq	%rbx, %rbx
	je	.L10086
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r10
	cmpb	$60, rtx_class(%r10)
	je	.L18190
.L10110:
	xorl	%eax, %eax
.L10111:
	testl	%eax, %eax
	jne	.L18191
.L10086:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L10112
	testb	$16, 3(%rax)
	je	.L10112
	cmpw	$36, (%rax)
	je	.L10112
.L10113:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L10114
	testb	$16, 3(%rax)
	je	.L10114
	cmpw	$36, (%rax)
	je	.L10114
	movq	%rax, %rbx
	jmp	.L10113
.L10114:
	cmpq	%rbx, 1696(%rsp)
	je	.L10082
	movq	%rbx, %r13
.L10112:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L10119
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L10123
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10124
	movl	$14, %r11d
.L10123:
	testl	%ebx, %ebx
	je	.L10129
	cmpl	%r11d, %r14d
	jge	.L10082
.L10119:
	testl	%ebx, %ebx
	je	.L10129
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10129
.L10147:
	cmpq	%r13, 8(%rdi)
	je	.L18192
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L10147
.L10129:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L10082
	testl	%r14d, %r14d
	jne	.L10149
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17298:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L10082:
	movq	368(%rsp), %rax
	movq	376(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 368(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 376(%rsp)
	jne	.L10154
	jmp	.L16222
.L10149:
	cmpl	$14, %r14d
	je	.L16882
	cmpl	$15, %r14d
.L17673:
	jne	.L10082
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17297:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17298
.L16882:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17297
.L18192:
	testq	%r10, %r10
	je	.L10135
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18194
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17296:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L10135:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L10140
	movb	$14, 2(%rdi)
.L10140:
	testq	%r10, %r10
	je	.L10082
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16881
	cmpb	$14, %al
	je	.L16882
	cmpb	$15, %al
	jmp	.L17673
.L16881:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17298
.L18194:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17296
.L10124:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L10126
	movl	$15, %r11d
	jmp	.L10123
.L10126:
	xorl	%ebx, %ebx
	jmp	.L10123
.L18191:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L10086
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L10082
	jmp	.L10086
.L18190:
	movzwl	(%rbx), %edi
	movslq	%edi,%r11
	cmpb	$60, rtx_class(%r11)
	jne	.L10110
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L10110
	movq	8(%rbx), %r8
	cmpq	%r8, 8(%rbp)
	jne	.L10110
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L10110
	movl	$1, %eax
	jmp	.L10111
.L18189:
	cmpw	$47, %dx
	jne	.L10107
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10107
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10107
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18195
	movq	24(%rbx), %rax
.L10105:
	cmpw	$67, (%rax)
	jne	.L10107
	cmpq	%rsi, %rcx
	jne	.L10107
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L10099
.L18195:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L10099
	jmp	.L10105
.L18188:
	movq	8(%rax), %rbx
	jmp	.L10099
.L18187:
	cmpw	$47, %dx
	je	.L18196
.L10096:
	xorl	%ebp, %ebp
	jmp	.L10088
.L18196:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L10096
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L10096
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18197
	movq	24(%rbp), %rax
.L10094:
	cmpw	$67, (%rax)
	jne	.L10096
	cmpq	%rsi, %rcx
	jne	.L10096
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L10088
.L18197:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L10088
	jmp	.L10094
.L18186:
	movq	8(%rax), %rbp
	jmp	.L10088
.L18158:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r12b
	movq	%rax, 384(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r12b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	384(%rsp), %rdx
	movq	8(%rdx), %rdi
	call	cselib_subst_to_values
	movq	384(%rsp), %r8
	movq	%rax, 8(%r8)
	jmp	.L10074
.L10338:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17508:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L16622
.L10340:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17508
.L16607:
	movq	reg_n_info(%rip), %rdx
	movslq	%ebp,%r15
	movq	%r15, 24(%rsp)
	jmp	.L10032
.L18137:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17294
	.p2align 6,,7
.L9682:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18198
	cmpb	$24, %al
	je	.L18199
	movl	target_flags(%rip), %esi
	testl	$33554432, %esi
	movl	%esi, %ecx
	je	.L9695
	movzbl	%al, %r9d 
	movzbl	mode_size(%r9), %edi
	leal	7(%rdi), %edx
.L9696:
	andl	$33554432, %ecx
	je	.L9697
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L9683
.L9697:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L9683
.L9695:
	movzbl	%al, %r11d 
	movzbl	mode_size(%r11), %r10d
	leal	3(%r10), %edx
	jmp	.L9696
.L18199:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L9683
.L18198:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17282
	.p2align 6,,7
.L9681:
	movq	1704(%rsp), %rbx
	cmpl	68(%rbx), %ebp
	jl	.L9706
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L9347
	jmp	.L17569
	.p2align 6,,7
.L9706:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %eax
	testl	%eax, %eax
	jne	.L16600
	movq	reg_known_equiv_p(%rip), %r14
	movslq	%ebp,%rbx
	addq	%rbx, %r14
	cmpb	$0, (%r14)
	je	.L9709
	leaq	0(,%rbx,8), %r13
	addq	reg_known_value(%rip), %r13
	movq	(%r13), %rax
	cmpw	$66, (%rax)
	je	.L18200
.L9709:
	leaq	0(,%rbx,8), %rdx
	addq	reg_n_info(%rip), %rdx
	movq	32(%rdx), %rcx
	movl	32(%rcx), %eax
	testl	%eax, %eax
	jne	.L9347
	movq	1704(%rsp), %r12
	movq	1696(%rsp), %rdi
	movq	56(%r12), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r8
	movq	%rax, 56(%r8)
	jmp	.L9347
.L18200:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L9709
	.p2align 6,,7
.L16600:
	movslq	%ebp,%rbx
	jmp	.L9709
	.p2align 6,,7
.L9964:
	cmpl	$41, %ebx
	je	.L18201
.L9966:
	movb	$1, reg_pending_barrier(%rip)
.L9965:
	cmpl	$41, %ebx
	je	.L18202
.L9673:
	movslq	%ebx,%rdi
	movzbl	rtx_length(%rdi), %esi
	movq	rtx_format(,%rdi,8), %r13
	movl	%esi, %r12d
	decl	%r12d
	js	.L9347
	leaq	8(%r15), %r14
	.p2align 4,,7
.L9993:
	movslq	%r12d,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18203
	cmpb	$69, %dl
	je	.L18204
.L9983:
	decl	%r12d
	jns	.L9993
	jmp	.L9347
.L18204:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %r9
	cmpl	(%r9), %ebx
	jge	.L9983
	movq	%rdx, %rbp
	.p2align 4,,7
.L9992:
	movq	(%rbp), %r11
	movslq	%ebx,%rax
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %r11
	movq	(%r11,%rax,8), %rsi
	call	sched_analyze_2
	movq	(%rbp), %r10
	cmpl	(%r10), %ebx
	jl	.L9992
	jmp	.L9983
.L18203:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L9983
.L18202:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L9347
.L9972:
	movslq	%ebx,%r12
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r12,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %r8
	cmpl	(%r8), %ebx
	movq	%r8, %rdx
	jl	.L9972
	jmp	.L9347
.L18201:
	testb	$8, 3(%r15)
	je	.L9965
	jmp	.L9966
.L9951:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rdx
	movq	1696(%rsp), %rdi
	movq	%rdx, %rsi
	movl	$0, 32(%rdx)
	movl	$14, %edx
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rcx
	movq	%rax, 40(%rcx)
	movl	$1, 36(%rcx)
	jmp	.L9673
.L9711:
	movq	current_sched_info(%rip), %rsi
	movq	%r15, 416(%rsp)
	testb	$2, 96(%rsi)
	jne	.L18205
.L9712:
	movq	1704(%rsp), %rbx
	movq	(%rbx), %r14
	movq	8(%rbx), %r11
	testq	%r14, %r14
	movq	%r11, 408(%rsp)
	jne	.L9792
.L16207:
	movq	1704(%rsp), %r13
	movq	16(%r13), %r14
	movq	24(%r13), %r11
	testq	%r14, %r14
	movq	%r11, 400(%rsp)
	jne	.L9868
.L16210:
	movq	1704(%rsp), %r11
	movq	40(%r11), %r14
	testq	%r14, %r14
	je	.L16213
.L9948:
	movq	8(%r14), %rbx
	cmpw	$33, (%rbx)
	je	.L18206
.L9874:
	cmpq	%rbx, 1696(%rsp)
	movq	%rbx, %r12
	je	.L9871
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L9871
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L9880
	cmpw	$34, %ax
	je	.L9880
	movq	32(%rcx), %rax
	xorl	%r13d, %r13d
	testq	%rax, %rax
	je	.L9882
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18207
	xorl	%r13d, %r13d
	cmpw	$33, %dx
	je	.L18208
.L9882:
	movq	32(%rbx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L9893
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18209
	cmpw	$33, (%rbx)
	je	.L18210
.L9901:
	xorl	%ebp, %ebp
.L9893:
	testq	%r13, %r13
	je	.L9880
	testq	%rbp, %rbp
	je	.L9880
	movzwl	(%r13), %r8d
	movl	%r8d, 1600(%rsp)
	movslq	1600(%rsp),%rdx
	cmpb	$60, rtx_class(%rdx)
	je	.L18211
.L9904:
	xorl	%eax, %eax
.L9905:
	testl	%eax, %eax
	jne	.L18212
.L9880:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L9906
	testb	$16, 3(%rax)
	je	.L9906
	cmpw	$36, (%rax)
	je	.L9906
.L9907:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L9908
	testb	$16, 3(%rax)
	je	.L9908
	cmpw	$36, (%rax)
	je	.L9908
	movq	%rax, %rbx
	jmp	.L9907
.L9908:
	cmpq	%rbx, 1696(%rsp)
	je	.L9871
	movq	%rbx, %r12
.L9906:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r9d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L9913
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r10
	testq	%r10, %r10
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r12),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%rbp
	movl	16(%rcx,%r13), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L9917
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9918
	movl	$14, %ebx
.L9917:
	testl	%r9d, %r9d
	je	.L9923
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L9871
.L9913:
	testl	%r9d, %r9d
	je	.L9923
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L9923
.L9941:
	cmpq	%r12, 8(%rdi)
	je	.L18213
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L9941
.L9923:
	movq	1696(%rsp), %r11
	movq	%r12, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L9871
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L9943
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r13
	movslq	8(%r12),%rdx
	leaq	(%rcx,%rcx,2), %rbp
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %rbp
	salq	$4, %r10
	movslq	16(%rbp,%r13),%r9
	movl	16(%r10,%r13), %ecx
	movl	%ecx, %r12d
	shrl	$6, %r12d
	mov	%r12d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17291:
	andl	$63, %ecx
	movl	$1, %r10d
	salq	%cl, %r10
	orq	%r10, 16(%rax)
.L9871:
	movq	16(%r14), %r14
	testq	%r14, %r14
	jne	.L9948
.L16213:
	movq	1704(%rsp), %rax
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%rax), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r14
	movq	1704(%rsp), %r13
	movq	%rax, (%r13)
	testb	$2, 96(%r14)
	jne	.L18214
.L9949:
	movq	1704(%rsp), %rbp
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rbp), %rdx
	call	alloc_EXPR_LIST
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %r11
	incl	32(%r11)
	movq	%rax, 8(%r11)
	movq	%r11, %rdi
	movq	8(%r15), %rsi
	call	sched_analyze_2
	jmp	.L9347
.L18214:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L9949
.L9943:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16880
	movl	$14, %edx
	cmpl	$15, %edx
.L17672:
	jne	.L9871
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17290:
	movslq	8(%r12),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r12d
	shrl	$6, %r12d
	mov	%r12d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17291
.L16880:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rbp
	movq	h_i_d(%rip), %rcx
	leaq	(%rbp,%rbp,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17290
.L18213:
	testq	%r11, %r11
	je	.L9929
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18216
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r12),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rsi),%rcx
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %r10
	leaq	(%rcx,%rcx,2), %rbp
	movl	16(%r10,%r13), %ecx
	salq	$4, %rbp
	movslq	16(%rbp,%r13),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17289:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L9929:
	movzbl	2(%rdi), %ebx
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L9934
	movb	$14, 2(%rdi)
.L9934:
	testq	%r11, %r11
	je	.L9871
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16879
	cmpb	$14, %al
	je	.L16880
	cmpb	$15, %al
	jmp	.L17672
.L16879:
	movq	1696(%rsp), %rax
	movslq	8(%r12),%r9
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r13
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rdi), %ecx
	leaq	(%r13,%r13,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r11,%r8,8), %rax
	jmp	.L17291
.L18216:
	movq	1696(%rsp), %rax
	movslq	8(%r12),%rbp
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%r9
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r10d
	salq	$3, %r9
	shrl	$6, %r10d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17289
	.p2align 6,,7
.L9918:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r10,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9920
	movl	$15, %ebx
	jmp	.L9917
.L9920:
	xorl	%r9d, %r9d
	jmp	.L9917
.L18212:
	movq	%r13, %rdi
	movq	%rbx, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L9880
	movq	1696(%rsp), %rsi
	movq	%rbp, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L9871
	jmp	.L9880
.L18211:
	movzwl	(%rbp), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L9904
	call	reverse_condition
	cmpl	%eax, 1600(%rsp)
	jne	.L9904
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%r13)
	jne	.L9904
	movq	16(%rbp), %r10
	cmpq	%r10, 16(%r13)
	jne	.L9904
	movl	$1, %eax
	jmp	.L9905
	.p2align 6,,7
.L18210:
	cmpw	$47, %dx
	jne	.L9901
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9901
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9901
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18217
	movq	24(%rbp), %rax
.L9899:
	cmpw	$67, (%rax)
	jne	.L9901
	cmpq	%rsi, %rcx
	jne	.L9901
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L9893
.L18217:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L9893
	jmp	.L9899
	.p2align 6,,7
.L18209:
	movq	8(%rax), %rbp
	jmp	.L9893
.L18208:
	cmpw	$47, %cx
	je	.L18218
.L9890:
	xorl	%r13d, %r13d
	jmp	.L9882
.L18218:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9890
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9890
	movq	8(%rax), %r13
	movq	16(%r13), %rcx
	cmpw	$67, (%rcx)
	je	.L18219
	movq	24(%r13), %rax
.L9888:
	cmpw	$67, (%rax)
	jne	.L9890
	cmpq	%rsi, %rcx
	jne	.L9890
	movzwl	(%r13), %edi
	call	reverse_condition
	movq	16(%r13), %rcx
	movq	8(%r13), %rdx
	movzbl	2(%r13), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r13
	jmp	.L9882
.L18219:
	movq	24(%r13), %rax
	cmpq	%rdx, %rax
	je	.L9882
	jmp	.L9888
	.p2align 6,,7
.L18207:
	movq	8(%rax), %r13
	jmp	.L9882
.L18206:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18220
.L9875:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L9871
	movq	8(%r14), %rbx
	jmp	.L9874
.L18220:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L9875
	mov	%eax, %ecx
	salq	$3, %rcx
	addq	reg_known_value(%rip), %rcx
	movq	(%rcx), %rsi
	testq	%rsi, %rsi
	cmovne	%rsi, %rdi
	jmp	.L9875
	.p2align 6,,7
.L9868:
	movq	400(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%rdx), %rdi
	movq	416(%rsp), %rdx
	call	true_dependence
	testl	%eax, %eax
	je	.L9796
	movq	8(%r14), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L9796
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L9796
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L9800
	cmpw	$34, %ax
	je	.L9800
	movq	32(%rcx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L9802
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18221
	xorl	%r12d, %r12d
	cmpw	$33, %dx
	je	.L18222
.L9802:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L9813
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18223
	cmpw	$33, (%rbp)
	je	.L18224
.L9821:
	xorl	%ebx, %ebx
.L9813:
	testq	%r12, %r12
	je	.L9800
	testq	%rbx, %rbx
	je	.L9800
	movzwl	(%r12), %r13d
	movslq	%r13d,%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18225
.L9824:
	xorl	%eax, %eax
.L9825:
	testl	%eax, %eax
	jne	.L18226
.L9800:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L9826
	testb	$16, 3(%rax)
	je	.L9826
	cmpw	$36, (%rax)
	je	.L9826
.L9827:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L9828
	testb	$16, 3(%rax)
	je	.L9828
	cmpw	$36, (%rax)
	je	.L9828
	movq	%rax, %rbx
	jmp	.L9827
.L9828:
	cmpq	%rbx, 1696(%rsp)
	je	.L9796
	movq	%rbx, %rbp
.L9826:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r10d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L9833
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rdx
	leaq	(%rdx,%rdx,2), %rdi
	movslq	8(%rbp),%rdx
	salq	$4, %rdi
	movslq	16(%rdi,%r13),%r12
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rcx
	movl	16(%rcx,%r13), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L9837
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9838
	movl	$14, %ebx
.L9837:
	testl	%r10d, %r10d
	je	.L9843
	xorl	%r9d, %r9d
	cmpl	%ebx, %r9d
	jge	.L9796
.L9833:
	testl	%r10d, %r10d
	je	.L9843
	movq	1696(%rsp), %r10
	movq	48(%r10), %rdi
	testq	%rdi, %rdi
	je	.L9843
.L9861:
	cmpq	%rbp, 8(%rdi)
	je	.L18227
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L9861
.L9843:
	movq	1696(%rsp), %r11
	movq	%rbp, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L9796
	xorl	%edi, %edi
	testl	%edi, %edi
	jne	.L9863
	movslq	8(%rbp),%r12
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r13
	leaq	(%r12,%r12,2), %rbx
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rbx
	salq	$4, %rdx
	movl	16(%rbx,%r13), %ecx
	movslq	16(%rdx,%r13),%r10
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r10,8), %rax
.L17288:
	andl	$63, %ecx
	movl	$1, %r13d
	salq	%cl, %r13
	orq	%r13, 16(%rax)
.L9796:
	movq	400(%rsp), %rax
	movq	16(%r14), %r14
	movq	16(%rax), %r12
	testq	%r14, %r14
	movq	%r12, 400(%rsp)
	jne	.L9868
	jmp	.L16210
.L9863:
	xorl	%esi, %esi
	cmpl	$14, %esi
	je	.L16878
	xorl	%edx, %edx
	cmpl	$15, %edx
.L17671:
	jne	.L9796
	movq	1696(%rsp), %rdi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdi),%r9
	leaq	(%r9,%r9,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17287:
	movslq	8(%rbp),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movl	16(%r10,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17288
.L16878:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17287
.L18227:
	testq	%r11, %r11
	je	.L9849
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18229
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%rbp),%r12
	movq	h_i_d(%rip), %r13
	movslq	8(%rsi),%rcx
	leaq	(%r12,%r12,2), %rbx
	salq	$4, %rbx
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%rbx,%r13), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r13),%r9
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17286:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L9849:
	movzbl	2(%rdi), %r9d
	xorl	%eax, %eax
	cmpl	%r9d, %eax
	jge	.L9854
	movb	$0, 2(%rdi)
.L9854:
	testq	%r11, %r11
	je	.L9796
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16877
	cmpb	$14, %al
	je	.L16878
	cmpb	$15, %al
	jmp	.L17671
	.p2align 6,,7
.L16877:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rbx
	movq	h_i_d(%rip), %r10
	movslq	8(%rax),%r12
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%r10), %ecx
	leaq	(%r12,%r12,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%r10),%r8
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11,%r8,8), %rax
	jmp	.L17288
.L18229:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%r8
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r12), %ecx
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%r12),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17286
	.p2align 6,,7
.L9838:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9840
	movl	$15, %ebx
	jmp	.L9837
.L9840:
	xorl	%r10d, %r10d
	jmp	.L9837
.L18226:
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L9800
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L9796
	jmp	.L9800
.L18225:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L9824
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L9824
	movq	8(%rbx), %rsi
	cmpq	%rsi, 8(%r12)
	jne	.L9824
	movq	16(%rbx), %r9
	cmpq	%r9, 16(%r12)
	jne	.L9824
	movl	$1, %eax
	jmp	.L9825
	.p2align 6,,7
.L18224:
	cmpw	$47, %dx
	jne	.L9821
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9821
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9821
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18230
	movq	24(%rbx), %rax
.L9819:
	cmpw	$67, (%rax)
	jne	.L9821
	cmpq	%rsi, %rcx
	jne	.L9821
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L9813
.L18230:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L9813
	jmp	.L9819
	.p2align 6,,7
.L18223:
	movq	8(%rax), %rbx
	jmp	.L9813
.L18222:
	cmpw	$47, %cx
	je	.L18231
.L9810:
	xorl	%r12d, %r12d
	jmp	.L9802
.L18231:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9810
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9810
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18232
	movq	24(%r12), %rax
.L9808:
	cmpw	$67, (%rax)
	jne	.L9810
	cmpq	%rsi, %rcx
	jne	.L9810
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L9802
.L18232:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L9802
	jmp	.L9808
	.p2align 6,,7
.L18221:
	movq	8(%rax), %r12
	jmp	.L9802
	.p2align 6,,7
.L9792:
	movq	408(%rsp), %rbp
	movq	416(%rsp), %rsi
	movq	8(%rbp), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L9720
	movq	8(%r14), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L9720
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L9720
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L9724
	cmpw	$34, %ax
	je	.L9724
	movq	32(%rcx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L9726
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18233
	xorl	%r12d, %r12d
	cmpw	$33, %dx
	je	.L18234
.L9726:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L9737
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18235
	cmpw	$33, (%rbp)
	je	.L18236
.L9745:
	xorl	%ebx, %ebx
.L9737:
	testq	%r12, %r12
	je	.L9724
	testq	%rbx, %rbx
	je	.L9724
	movzwl	(%r12), %r13d
	movslq	%r13d,%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18237
.L9748:
	xorl	%eax, %eax
.L9749:
	testl	%eax, %eax
	jne	.L18238
.L9724:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L9750
	testb	$16, 3(%rax)
	je	.L9750
	cmpw	$36, (%rax)
	je	.L9750
.L9751:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L9752
	testb	$16, 3(%rax)
	je	.L9752
	cmpw	$36, (%rax)
	je	.L9752
	movq	%rax, %rbx
	jmp	.L9751
.L9752:
	cmpq	%rbx, 1696(%rsp)
	je	.L9720
	movq	%rbx, %rbp
.L9750:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r10d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L9757
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%r12
	movl	16(%r13,%rcx), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %r13d
	leaq	0(,%r13,8), %r12
	movq	%r12, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L9761
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9762
	movl	$14, %ebx
.L9761:
	testl	%r10d, %r10d
	je	.L9767
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L9720
.L9757:
	testl	%r10d, %r10d
	je	.L9767
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L9767
.L9785:
	cmpq	%rbp, 8(%rdi)
	je	.L18239
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L9785
.L9767:
	movq	1696(%rsp), %r11
	movq	%rbp, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L9720
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L9787
	movslq	8(%rdx),%r13
	movq	h_i_d(%rip), %r12
	movslq	8(%rbp),%rdx
	leaq	(%r13,%r13,2), %rcx
	leaq	(%rdx,%rdx,2), %rbx
	salq	$4, %rcx
	salq	$4, %rbx
	movslq	16(%rcx,%r12),%r10
	movl	16(%rbx,%r12), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r10,8), %rax
.L17285:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L9720:
	movq	408(%rsp), %rax
	movq	16(%r14), %r14
	movq	16(%rax), %r12
	testq	%r14, %r14
	movq	%r12, 408(%rsp)
	jne	.L9792
	jmp	.L16207
.L9787:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16876
	movl	$14, %edx
	cmpl	$15, %edx
.L17670:
	jne	.L9720
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17284:
	movslq	8(%rbp),%r10
	leaq	(%r10,%r10,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17285
.L16876:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17284
.L18239:
	testq	%r11, %r11
	je	.L9773
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18241
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %rbx
	salq	$4, %rbx
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rbx,%r12), %ecx
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17283:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L9773:
	movzbl	2(%rdi), %r9d
	movl	$14, %eax
	cmpl	%r9d, %eax
	jge	.L9778
	movb	$14, 2(%rdi)
.L9778:
	testq	%r11, %r11
	je	.L9720
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16875
	cmpb	$14, %al
	je	.L16876
	cmpb	$15, %al
	jmp	.L17670
	.p2align 6,,7
.L16875:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r10
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r12
	leaq	(%r10,%r10,2), %r9
	salq	$4, %r9
	movl	16(%r9,%rdi), %ecx
	leaq	(%r12,%r12,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r11,%r8,8), %rax
	jmp	.L17285
.L18241:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r10
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	salq	$3, %r10
	addq	anti_dependency_cache(%rip), %r10
	addq	(%r10), %rax
	jmp	.L17283
	.p2align 6,,7
.L9762:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9764
	movl	$15, %ebx
	jmp	.L9761
.L9764:
	xorl	%r10d, %r10d
	jmp	.L9761
.L18238:
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L9724
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L9720
	jmp	.L9724
.L18237:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L9748
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L9748
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%r12)
	jne	.L9748
	movq	16(%rbx), %rax
	cmpq	%rax, 16(%r12)
	jne	.L9748
	movl	$1, %eax
	jmp	.L9749
	.p2align 6,,7
.L18236:
	cmpw	$47, %dx
	jne	.L9745
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9745
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9745
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18242
	movq	24(%rbx), %rax
.L9743:
	cmpw	$67, (%rax)
	jne	.L9745
	cmpq	%rsi, %rcx
	jne	.L9745
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L9737
.L18242:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L9737
	jmp	.L9743
	.p2align 6,,7
.L18235:
	movq	8(%rax), %rbx
	jmp	.L9737
.L18234:
	cmpw	$47, %cx
	je	.L18243
.L9734:
	xorl	%r12d, %r12d
	jmp	.L9726
.L18243:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9734
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9734
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18244
	movq	24(%r12), %rax
.L9732:
	cmpw	$67, (%rax)
	jne	.L9734
	cmpq	%rsi, %rcx
	jne	.L9734
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L9726
.L18244:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L9726
	jmp	.L9732
	.p2align 6,,7
.L18233:
	movq	8(%rax), %r12
	jmp	.L9726
.L18205:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r10b
	movq	%rax, 416(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r10b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	416(%rsp), %r9
	movq	8(%r9), %rdi
	call	cselib_subst_to_values
	movq	416(%rsp), %rdi
	movq	%rax, 8(%rdi)
	jmp	.L9712
.L9976:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17292:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L9347
.L9978:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17292
.L9359:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18245
	cmpb	$24, %al
	je	.L18246
	movl	target_flags(%rip), %r12d
	testl	$33554432, %r12d
	movl	%r12d, %ecx
	je	.L9372
	movzbl	%al, %r15d 
	movzbl	mode_size(%r15), %r8d
	leal	7(%r8), %edx
.L9373:
	andl	$33554432, %ecx
	je	.L9374
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L9360
.L9374:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L9360
.L9372:
	movzbl	%al, %edi 
	movzbl	mode_size(%rdi), %r13d
	leal	3(%r13), %edx
	jmp	.L9373
.L18246:
	xorl	%r14d, %r14d
	testb	$2, target_flags+3(%rip)
	sete	%r14b
	leal	4(%r14,%r14), %eax
	jmp	.L9360
.L18245:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17271
	.p2align 6,,7
.L9358:
	movq	1704(%rsp), %rcx
	cmpl	68(%rcx), %ebp
	jl	.L9383
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L9349
	jmp	.L17569
	.p2align 6,,7
.L9383:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %eax
	testl	%eax, %eax
	jne	.L16593
	movq	reg_known_equiv_p(%rip), %rsi
	movslq	%ebp,%rbx
	addq	%rbx, %rsi
	cmpb	$0, (%rsi)
	je	.L9386
	leaq	0(,%rbx,8), %rdx
	addq	reg_known_value(%rip), %rdx
	movq	(%rdx), %rax
	cmpw	$66, (%rax)
	je	.L18247
.L9386:
	leaq	0(,%rbx,8), %r10
	addq	reg_n_info(%rip), %r10
	movq	32(%r10), %rbx
	movl	32(%rbx), %eax
	testl	%eax, %eax
	jne	.L9349
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	56(%r11), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r9
	movq	%rax, 56(%r9)
	jmp	.L9349
.L18247:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L9386
	.p2align 6,,7
.L16593:
	movslq	%ebp,%rbx
	jmp	.L9386
	.p2align 6,,7
.L9641:
	cmpl	$41, %ebx
	je	.L18248
.L9643:
	movb	$1, reg_pending_barrier(%rip)
.L9642:
	cmpl	$41, %ebx
	je	.L18249
.L9350:
	movslq	%ebx,%rdi
	movzbl	rtx_length(%rdi), %esi
	movq	rtx_format(,%rdi,8), %r13
	movl	%esi, %r12d
	decl	%r12d
	js	.L9349
	leaq	8(%r15), %r14
	.p2align 4,,7
.L9670:
	movslq	%r12d,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18250
	cmpb	$69, %dl
	je	.L18251
.L9660:
	decl	%r12d
	jns	.L9670
	jmp	.L9349
.L18251:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %r9
	cmpl	(%r9), %ebx
	jge	.L9660
	movq	%rdx, %rbp
	.p2align 4,,7
.L9669:
	movq	(%rbp), %r11
	movslq	%ebx,%rax
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %r11
	movq	(%r11,%rax,8), %rsi
	call	sched_analyze_2
	movq	(%rbp), %r10
	cmpl	(%r10), %ebx
	jl	.L9669
	jmp	.L9660
.L18250:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L9660
.L18249:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L9349
.L9649:
	movslq	%ebx,%r12
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r12,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %r8
	cmpl	(%r8), %ebx
	movq	%r8, %rdx
	jl	.L9649
	jmp	.L9349
.L18248:
	testb	$8, 3(%r15)
	je	.L9642
	jmp	.L9643
.L9628:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rdx
	movq	1696(%rsp), %rdi
	movq	%rdx, %rsi
	movl	$0, 32(%rdx)
	movl	$14, %edx
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rcx
	movq	%rax, 40(%rcx)
	movl	$1, 36(%rcx)
	jmp	.L9350
.L9388:
	movq	current_sched_info(%rip), %r14
	movq	%r15, 440(%rsp)
	testb	$2, 96(%r14)
	jne	.L18252
.L9389:
	movq	1704(%rsp), %rbp
	movq	(%rbp), %r14
	movq	8(%rbp), %rdi
	testq	%r14, %r14
	movq	%rdi, 432(%rsp)
	jne	.L9469
.L16194:
	movq	1704(%rsp), %r12
	movq	16(%r12), %r14
	movq	24(%r12), %r11
	testq	%r14, %r14
	movq	%r11, 424(%rsp)
	jne	.L9545
.L16197:
	movq	1704(%rsp), %r11
	movq	40(%r11), %r14
	testq	%r14, %r14
	je	.L16200
.L9625:
	movq	8(%r14), %rbx
	cmpw	$33, (%rbx)
	je	.L18253
.L9551:
	cmpq	%rbx, 1696(%rsp)
	movq	%rbx, %r12
	je	.L9548
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L9548
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L9557
	cmpw	$34, %ax
	je	.L9557
	movq	32(%rcx), %rax
	xorl	%r13d, %r13d
	testq	%rax, %rax
	je	.L9559
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18254
	xorl	%r13d, %r13d
	cmpw	$33, %dx
	je	.L18255
.L9559:
	movq	32(%rbx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L9570
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18256
	cmpw	$33, (%rbx)
	je	.L18257
.L9578:
	xorl	%ebp, %ebp
.L9570:
	testq	%r13, %r13
	je	.L9557
	testq	%rbp, %rbp
	je	.L9557
	movzwl	(%r13), %r8d
	movl	%r8d, 1604(%rsp)
	movslq	1604(%rsp),%rdx
	cmpb	$60, rtx_class(%rdx)
	je	.L18258
.L9581:
	xorl	%eax, %eax
.L9582:
	testl	%eax, %eax
	jne	.L18259
.L9557:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L9583
	testb	$16, 3(%rax)
	je	.L9583
	cmpw	$36, (%rax)
	je	.L9583
.L9584:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L9585
	testb	$16, 3(%rax)
	je	.L9585
	cmpw	$36, (%rax)
	je	.L9585
	movq	%rax, %rbx
	jmp	.L9584
.L9585:
	cmpq	%rbx, 1696(%rsp)
	je	.L9548
	movq	%rbx, %r12
.L9583:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r9d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L9590
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r10
	testq	%r10, %r10
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r12),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%rbp
	movl	16(%rcx,%r13), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L9594
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9595
	movl	$14, %ebx
.L9594:
	testl	%r9d, %r9d
	je	.L9600
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L9548
.L9590:
	testl	%r9d, %r9d
	je	.L9600
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L9600
.L9618:
	cmpq	%r12, 8(%rdi)
	je	.L18260
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L9618
.L9600:
	movq	1696(%rsp), %r11
	movq	%r12, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L9548
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L9620
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r13
	movslq	8(%r12),%rdx
	leaq	(%rcx,%rcx,2), %rbp
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %rbp
	salq	$4, %r10
	movslq	16(%rbp,%r13),%r9
	movl	16(%r10,%r13), %ecx
	movl	%ecx, %r12d
	shrl	$6, %r12d
	mov	%r12d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17280:
	andl	$63, %ecx
	movl	$1, %r10d
	salq	%cl, %r10
	orq	%r10, 16(%rax)
.L9548:
	movq	16(%r14), %r14
	testq	%r14, %r14
	jne	.L9625
.L16200:
	movq	1704(%rsp), %rax
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%rax), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r14
	movq	1704(%rsp), %r13
	movq	%rax, (%r13)
	testb	$2, 96(%r14)
	jne	.L18261
.L9626:
	movq	1704(%rsp), %rbp
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rbp), %rdx
	call	alloc_EXPR_LIST
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %r11
	incl	32(%r11)
	movq	%rax, 8(%r11)
	movq	%r11, %rdi
	movq	8(%r15), %rsi
	call	sched_analyze_2
	jmp	.L9349
.L18261:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L9626
.L9620:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16874
	movl	$14, %edx
	cmpl	$15, %edx
.L17669:
	jne	.L9548
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17279:
	movslq	8(%r12),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r12d
	shrl	$6, %r12d
	mov	%r12d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17280
.L16874:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rbp
	movq	h_i_d(%rip), %rcx
	leaq	(%rbp,%rbp,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17279
.L18260:
	testq	%r11, %r11
	je	.L9606
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18263
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r12),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rsi),%rcx
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %r10
	leaq	(%rcx,%rcx,2), %rbp
	movl	16(%r10,%r13), %ecx
	salq	$4, %rbp
	movslq	16(%rbp,%r13),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17278:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L9606:
	movzbl	2(%rdi), %ebx
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L9611
	movb	$14, 2(%rdi)
.L9611:
	testq	%r11, %r11
	je	.L9548
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16873
	cmpb	$14, %al
	je	.L16874
	cmpb	$15, %al
	jmp	.L17669
.L16873:
	movq	1696(%rsp), %rax
	movslq	8(%r12),%r9
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r13
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rdi), %ecx
	leaq	(%r13,%r13,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r11,%r8,8), %rax
	jmp	.L17280
.L18263:
	movq	1696(%rsp), %rax
	movslq	8(%r12),%rbp
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%r9
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r10d
	salq	$3, %r9
	shrl	$6, %r10d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17278
	.p2align 6,,7
.L9595:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r10,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9597
	movl	$15, %ebx
	jmp	.L9594
.L9597:
	xorl	%r9d, %r9d
	jmp	.L9594
.L18259:
	movq	%r13, %rdi
	movq	%rbx, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L9557
	movq	1696(%rsp), %rsi
	movq	%rbp, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L9548
	jmp	.L9557
.L18258:
	movzwl	(%rbp), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L9581
	call	reverse_condition
	cmpl	%eax, 1604(%rsp)
	jne	.L9581
	movq	8(%rbp), %rdi
	cmpq	%rdi, 8(%r13)
	jne	.L9581
	movq	16(%rbp), %r10
	cmpq	%r10, 16(%r13)
	jne	.L9581
	movl	$1, %eax
	jmp	.L9582
	.p2align 6,,7
.L18257:
	cmpw	$47, %dx
	jne	.L9578
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9578
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9578
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18264
	movq	24(%rbp), %rax
.L9576:
	cmpw	$67, (%rax)
	jne	.L9578
	cmpq	%rsi, %rcx
	jne	.L9578
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L9570
.L18264:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L9570
	jmp	.L9576
	.p2align 6,,7
.L18256:
	movq	8(%rax), %rbp
	jmp	.L9570
.L18255:
	cmpw	$47, %cx
	je	.L18265
.L9567:
	xorl	%r13d, %r13d
	jmp	.L9559
.L18265:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9567
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9567
	movq	8(%rax), %r13
	movq	16(%r13), %rcx
	cmpw	$67, (%rcx)
	je	.L18266
	movq	24(%r13), %rax
.L9565:
	cmpw	$67, (%rax)
	jne	.L9567
	cmpq	%rsi, %rcx
	jne	.L9567
	movzwl	(%r13), %edi
	call	reverse_condition
	movq	16(%r13), %rcx
	movq	8(%r13), %rdx
	movzbl	2(%r13), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r13
	jmp	.L9559
.L18266:
	movq	24(%r13), %rax
	cmpq	%rdx, %rax
	je	.L9559
	jmp	.L9565
	.p2align 6,,7
.L18254:
	movq	8(%rax), %r13
	jmp	.L9559
.L18253:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18267
.L9552:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L9548
	movq	8(%r14), %rbx
	jmp	.L9551
.L18267:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L9552
	mov	%eax, %ecx
	salq	$3, %rcx
	addq	reg_known_value(%rip), %rcx
	movq	(%rcx), %rsi
	testq	%rsi, %rsi
	cmovne	%rsi, %rdi
	jmp	.L9552
	.p2align 6,,7
.L9545:
	movq	424(%rsp), %rsi
	movq	440(%rsp), %rdx
	movl	$rtx_varies_p, %ecx
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	call	true_dependence
	testl	%eax, %eax
	je	.L9473
	movq	8(%r14), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L9473
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L9473
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L9477
	cmpw	$34, %ax
	je	.L9477
	movq	32(%rcx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L9479
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18268
	xorl	%r12d, %r12d
	cmpw	$33, %dx
	je	.L18269
.L9479:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L9490
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18270
	cmpw	$33, (%rbp)
	je	.L18271
.L9498:
	xorl	%ebx, %ebx
.L9490:
	testq	%r12, %r12
	je	.L9477
	testq	%rbx, %rbx
	je	.L9477
	movzwl	(%r12), %r13d
	movslq	%r13d,%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18272
.L9501:
	xorl	%eax, %eax
.L9502:
	testl	%eax, %eax
	jne	.L18273
.L9477:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L9503
	testb	$16, 3(%rax)
	je	.L9503
	cmpw	$36, (%rax)
	je	.L9503
.L9504:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L9505
	testb	$16, 3(%rax)
	je	.L9505
	cmpw	$36, (%rax)
	je	.L9505
	movq	%rax, %rbx
	jmp	.L9504
.L9505:
	cmpq	%rbx, 1696(%rsp)
	je	.L9473
	movq	%rbx, %rbp
.L9503:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r10d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L9510
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rdx
	leaq	(%rdx,%rdx,2), %rdi
	movslq	8(%rbp),%rdx
	salq	$4, %rdi
	movslq	16(%rdi,%r13),%r12
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rcx
	movl	16(%rcx,%r13), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L9514
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9515
	movl	$14, %ebx
.L9514:
	testl	%r10d, %r10d
	je	.L9520
	xorl	%r9d, %r9d
	cmpl	%ebx, %r9d
	jge	.L9473
.L9510:
	testl	%r10d, %r10d
	je	.L9520
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L9520
.L9538:
	cmpq	%rbp, 8(%rdi)
	je	.L18274
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L9538
.L9520:
	movq	1696(%rsp), %r11
	movq	%rbp, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L9473
	xorl	%edi, %edi
	testl	%edi, %edi
	jne	.L9540
	movslq	8(%rbp),%r12
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r13
	leaq	(%r12,%r12,2), %r10
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r10
	salq	$4, %rdx
	movl	16(%r10,%r13), %ecx
	movslq	16(%rdx,%r13),%rbx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17277:
	andl	$63, %ecx
	movl	$1, %r13d
	salq	%cl, %r13
	orq	%r13, 16(%rax)
.L9473:
	movq	424(%rsp), %rax
	movq	16(%r14), %r14
	movq	16(%rax), %r12
	testq	%r14, %r14
	movq	%r12, 424(%rsp)
	jne	.L9545
	jmp	.L16197
.L9540:
	xorl	%esi, %esi
	cmpl	$14, %esi
	je	.L16872
	xorl	%edx, %edx
	cmpl	$15, %edx
.L17668:
	jne	.L9473
	movq	1696(%rsp), %rdi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdi),%r9
	leaq	(%r9,%r9,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17276:
	movslq	8(%rbp),%r10
	leaq	(%r10,%r10,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17277
.L16872:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17276
.L18274:
	testq	%r11, %r11
	je	.L9526
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18276
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%rbp),%r12
	movq	h_i_d(%rip), %r13
	movslq	8(%rsi),%rcx
	leaq	(%r12,%r12,2), %r10
	salq	$4, %r10
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%r10,%r13), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r13),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17275:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L9526:
	movzbl	2(%rdi), %r9d
	xorl	%eax, %eax
	cmpl	%r9d, %eax
	jge	.L9531
	movb	$0, 2(%rdi)
.L9531:
	testq	%r11, %r11
	je	.L9473
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16871
	cmpb	$14, %al
	je	.L16872
	cmpb	$15, %al
	jmp	.L17668
	.p2align 6,,7
.L16871:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r10
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%r12
	leaq	(%r10,%r10,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rbx), %ecx
	leaq	(%r12,%r12,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rbx),%r8
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11,%r8,8), %rax
	jmp	.L17277
.L18276:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%r8
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r12), %ecx
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%r12),%r10
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	salq	$3, %r10
	addq	anti_dependency_cache(%rip), %r10
	addq	(%r10), %rax
	jmp	.L17275
	.p2align 6,,7
.L9515:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9517
	movl	$15, %ebx
	jmp	.L9514
.L9517:
	xorl	%r10d, %r10d
	jmp	.L9514
.L18273:
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L9477
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L9473
	jmp	.L9477
.L18272:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L9501
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L9501
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%r12)
	jne	.L9501
	movq	16(%rbx), %r9
	cmpq	%r9, 16(%r12)
	jne	.L9501
	movl	$1, %eax
	jmp	.L9502
	.p2align 6,,7
.L18271:
	cmpw	$47, %dx
	jne	.L9498
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9498
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9498
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18277
	movq	24(%rbx), %rax
.L9496:
	cmpw	$67, (%rax)
	jne	.L9498
	cmpq	%rsi, %rcx
	jne	.L9498
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L9490
.L18277:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L9490
	jmp	.L9496
	.p2align 6,,7
.L18270:
	movq	8(%rax), %rbx
	jmp	.L9490
.L18269:
	cmpw	$47, %cx
	je	.L18278
.L9487:
	xorl	%r12d, %r12d
	jmp	.L9479
.L18278:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9487
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9487
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18279
	movq	24(%r12), %rax
.L9485:
	cmpw	$67, (%rax)
	jne	.L9487
	cmpq	%rsi, %rcx
	jne	.L9487
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L9479
.L18279:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L9479
	jmp	.L9485
	.p2align 6,,7
.L18268:
	movq	8(%rax), %r12
	jmp	.L9479
	.p2align 6,,7
.L9469:
	movq	432(%rsp), %rcx
	movq	440(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L9397
	movq	8(%r14), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L9397
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L9397
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L9401
	cmpw	$34, %ax
	je	.L9401
	movq	32(%rcx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L9403
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18280
	xorl	%r12d, %r12d
	cmpw	$33, %dx
	je	.L18281
.L9403:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L9414
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18282
	cmpw	$33, (%rbp)
	je	.L18283
.L9422:
	xorl	%ebx, %ebx
.L9414:
	testq	%r12, %r12
	je	.L9401
	testq	%rbx, %rbx
	je	.L9401
	movzwl	(%r12), %r13d
	movslq	%r13d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18284
.L9425:
	xorl	%eax, %eax
.L9426:
	testl	%eax, %eax
	jne	.L18285
.L9401:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L9427
	testb	$16, 3(%rax)
	je	.L9427
	cmpw	$36, (%rax)
	je	.L9427
.L9428:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L9429
	testb	$16, 3(%rax)
	je	.L9429
	cmpw	$36, (%rax)
	je	.L9429
	movq	%rax, %rbx
	jmp	.L9428
.L9429:
	cmpq	%rbx, 1696(%rsp)
	je	.L9397
	movq	%rbx, %rbp
.L9427:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r10d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L9434
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rdx
	leaq	(%rdx,%rdx,2), %rdi
	movslq	8(%rbp),%rdx
	salq	$4, %rdi
	movslq	16(%rdi,%r13),%r12
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rcx
	movl	16(%rcx,%r13), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L9438
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9439
	movl	$14, %ebx
.L9438:
	testl	%r10d, %r10d
	je	.L9444
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L9397
.L9434:
	testl	%r10d, %r10d
	je	.L9444
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L9444
.L9462:
	cmpq	%rbp, 8(%rdi)
	je	.L18286
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L9462
.L9444:
	movq	1696(%rsp), %r11
	movq	%rbp, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L9397
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L9464
	movslq	8(%rbp),%r12
	movslq	8(%rdx),%rsi
	movq	h_i_d(%rip), %r13
	leaq	(%rsi,%rsi,2), %rcx
	leaq	(%r12,%r12,2), %r10
	salq	$4, %rcx
	salq	$4, %r10
	movslq	16(%rcx,%r13),%r9
	movl	16(%r10,%r13), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17274:
	andl	$63, %ecx
	movl	$1, %r13d
	salq	%cl, %r13
	orq	%r13, 16(%rax)
.L9397:
	movq	432(%rsp), %rax
	movq	16(%r14), %r14
	movq	16(%rax), %rdx
	testq	%r14, %r14
	movq	%rdx, 432(%rsp)
	jne	.L9469
	jmp	.L16194
.L9464:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16870
	movl	$14, %esi
	cmpl	$15, %esi
.L17667:
	jne	.L9397
	movq	1696(%rsp), %rdi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdi),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17273:
	movslq	8(%rbp),%r10
	leaq	(%r10,%r10,2), %r9
	salq	$4, %r9
	movl	16(%r9,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17274
.L16870:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17273
.L18286:
	testq	%r11, %r11
	je	.L9450
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18288
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r12
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%r12,%r12,2), %r10
	salq	$4, %r10
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%rbx
	movl	16(%r10,%r13), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17272:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L9450:
	movzbl	2(%rdi), %edx
	movl	$14, %ebx
	cmpl	%edx, %ebx
	jge	.L9455
	movb	$14, 2(%rdi)
.L9455:
	testq	%r11, %r11
	je	.L9397
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16869
	cmpb	$14, %al
	je	.L16870
	cmpb	$15, %al
	jmp	.L17667
	.p2align 6,,7
.L16869:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r9
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r13
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rdi), %ecx
	leaq	(%r13,%r13,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r11,%r8,8), %rax
	jmp	.L17274
.L18288:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%r13), %ecx
	leaq	(%rsi,%rsi,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%r13),%r9
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17272
	.p2align 6,,7
.L9439:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9441
	movl	$15, %ebx
	jmp	.L9438
.L9441:
	xorl	%r10d, %r10d
	jmp	.L9438
.L18285:
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L9401
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L9397
	jmp	.L9401
.L18284:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L9425
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L9425
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%r12)
	jne	.L9425
	movq	16(%rbx), %rax
	cmpq	%rax, 16(%r12)
	jne	.L9425
	movl	$1, %eax
	jmp	.L9426
	.p2align 6,,7
.L18283:
	cmpw	$47, %dx
	jne	.L9422
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9422
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9422
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18289
	movq	24(%rbx), %rax
.L9420:
	cmpw	$67, (%rax)
	jne	.L9422
	cmpq	%rsi, %rcx
	jne	.L9422
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L9414
.L18289:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L9414
	jmp	.L9420
	.p2align 6,,7
.L18282:
	movq	8(%rax), %rbx
	jmp	.L9414
.L18281:
	cmpw	$47, %cx
	je	.L18290
.L9411:
	xorl	%r12d, %r12d
	jmp	.L9403
.L18290:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9411
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9411
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18291
	movq	24(%r12), %rax
.L9409:
	cmpw	$67, (%rax)
	jne	.L9411
	cmpq	%rsi, %rcx
	jne	.L9411
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L9403
.L18291:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L9403
	jmp	.L9409
	.p2align 6,,7
.L18280:
	movq	8(%rax), %r12
	jmp	.L9403
.L18252:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r13b
	movq	%rax, 440(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r13b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	440(%rsp), %r8
	movq	8(%r8), %rdi
	call	cselib_subst_to_values
	movq	440(%rsp), %r12
	movq	%rax, 8(%r12)
	jmp	.L9389
.L9653:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17281:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L9349
.L9655:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17281
.L17999:
	cmpw	$133, %dx
	je	.L9994
	cmpw	$132, %dx
	jne	.L16191
	jmp	.L9994
	.p2align 6,,7
.L17998:
	movq	392(%rsp), %r15
	movq	8(%r15), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L16176
.L9019:
	movslq	%ebx,%r13
	movq	8(%rdx,%r13,8), %rbp
	movq	8(%rbp), %rdx
	testq	%rdx, %rdx
	jne	.L18292
.L9016:
	decl	%ebx
	js	.L18293
	movq	392(%rsp), %r10
	movq	8(%r10), %rdx
	jmp	.L9019
.L18293:
	movq	1608(%rsp), %r12
	movzwl	(%r12), %eax
.L16176:
	cmpw	$47, %ax
	jne	.L9008
	movq	1608(%rsp), %rax
	movq	16(%rax), %r15
	testq	%r15, %r15
	je	.L9008
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L9023
	mov	%eax, %edx
	jmp	*.L9330(,%rdx,8)
	.section	.rodata
	.align 8
	.align 4
.L9330:
	.quad	.L9314
	.quad	.L9314
	.quad	.L9023
	.quad	.L9314
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9301
	.quad	.L9023
	.quad	.L9008
	.quad	.L9008
	.quad	.L9008
	.quad	.L9023
	.quad	.L9008
	.quad	.L9023
	.quad	.L9023
	.quad	.L9030
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9061
	.quad	.L9008
	.quad	.L9008
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L9023
	.quad	.L11313
	.quad	.L11313
	.quad	.L11313
	.quad	.L11313
	.quad	.L11315
	.quad	.L11315
	.text
.L9030:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L11342
	leal	-8(%rbp), %esi
	cmpl	$7, %esi
	jbe	.L9034
	leal	-21(%rbp), %r8d
	cmpl	$7, %r8d
	jbe	.L9034
	leal	-45(%rbp), %ecx
	cmpl	$7, %ecx
	jbe	.L9034
	leal	-29(%rbp), %r9d
	cmpl	$7, %r9d
	ja	.L9032
.L9034:
	movzbq	2(%r15), %r11
	movl	mode_class(,%r11,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17261:
	addl	$2, %eax
.L9033:
	movl	%eax, %ebx
	decl	%ebx
	js	.L9008
.L9054:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L9054
	jmp	.L9008
.L9032:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18294
	cmpb	$24, %al
	je	.L18295
	movl	target_flags(%rip), %ebx
	testl	$33554432, %ebx
	movl	%ebx, %ecx
	je	.L9045
	movzbl	%al, %r15d 
	movzbl	mode_size(%r15), %edi
	leal	7(%rdi), %edx
.L9046:
	andl	$33554432, %ecx
	je	.L9047
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L9033
.L9047:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L9033
.L9045:
	movzbl	%al, %r13d 
	movzbl	mode_size(%r13), %r10d
	leal	3(%r10), %edx
	jmp	.L9046
.L18295:
	xorl	%r14d, %r14d
	testb	$2, target_flags+3(%rip)
	sete	%r14b
	leal	4(%r14,%r14), %eax
	jmp	.L9033
.L18294:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17261
.L9314:
	cmpl	$41, %ebx
	je	.L18296
.L9316:
	movb	$1, reg_pending_barrier(%rip)
.L9315:
	cmpl	$41, %ebx
	je	.L18297
.L9023:
	movslq	%ebx,%rbp
	movzbl	rtx_length(%rbp), %r14d
	movq	rtx_format(,%rbp,8), %r13
	movl	%r14d, %ebp
	decl	%ebp
	js	.L9008
	leaq	8(%r15), %r14
.L9343:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18298
	cmpb	$69, %dl
	je	.L18299
.L9333:
	decl	%ebp
	jns	.L9343
	jmp	.L9008
	.p2align 6,,7
.L18299:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %r12
	cmpl	(%r12), %ebx
	jge	.L9333
	movq	%rdx, %r12
.L9342:
	movq	(%r12), %rcx
	movslq	%ebx,%rax
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %rcx
	movq	(%rcx,%rax,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %r8
	cmpl	(%r8), %ebx
	jl	.L9342
	jmp	.L9333
.L18298:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L9333
.L18297:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L9008
.L9322:
	movslq	%ebx,%r11
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r11,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %r9
	cmpl	(%r9), %ebx
	movq	%r9, %rdx
	jl	.L9322
	jmp	.L9008
.L18296:
	testb	$8, 3(%r15)
	je	.L9315
	jmp	.L9316
.L9301:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r10
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r10, %rsi
	movl	$0, 32(%r10)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rcx
	movq	%rax, 40(%rcx)
	movl	$1, 36(%rcx)
	jmp	.L9023
.L9061:
	movq	current_sched_info(%rip), %rbp
	movq	%r15, 488(%rsp)
	testb	$2, 96(%rbp)
	jne	.L18300
.L9062:
	movq	1704(%rsp), %r11
	movq	1704(%rsp), %r9
	movq	(%r11), %rsi
	movq	8(%r9), %r8
	testq	%rsi, %rsi
	movq	%rsi, 472(%rsp)
	movq	%r8, 480(%rsp)
	jne	.L9142
.L16179:
	movq	1704(%rsp), %rbp
	movq	1704(%rsp), %r11
	movq	16(%rbp), %r10
	movq	24(%r11), %r9
	testq	%r10, %r10
	movq	%r10, 456(%rsp)
	movq	%r9, 464(%rsp)
	jne	.L9218
.L16182:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 448(%rsp)
	je	.L16265
.L9298:
	movq	448(%rsp), %r9
	movq	8(%r9), %r14
	cmpw	$33, (%r14)
	je	.L18301
.L9224:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L9221
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L9221
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L9230
	cmpw	$34, %ax
	je	.L9230
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L9232
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18302
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18303
.L9232:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L9243
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18304
	cmpw	$33, (%r14)
	je	.L18305
.L9251:
	xorl	%ebx, %ebx
.L9243:
	testq	%rbp, %rbp
	je	.L9230
	testq	%rbx, %rbx
	je	.L9230
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18306
.L9254:
	xorl	%eax, %eax
.L9255:
	testl	%eax, %eax
	jne	.L18307
.L9230:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L9256
	testb	$16, 3(%rax)
	je	.L9256
	cmpw	$36, (%rax)
	je	.L9256
.L9257:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L9258
	testb	$16, 3(%rax)
	je	.L9258
	cmpw	$36, (%rax)
	je	.L9258
	movq	%rax, %rbx
	jmp	.L9257
.L9258:
	cmpq	%rbx, 1696(%rsp)
	je	.L9221
	movq	%rbx, %r13
.L9256:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L9263
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rbp), %edx
	leaq	(%r12,%r12,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rbp),%rcx
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	leaq	0(,%rcx,8), %rdi
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L9267
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9268
	movl	$14, %r11d
.L9267:
	testl	%ebx, %ebx
	je	.L9273
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L9221
.L9263:
	testl	%ebx, %ebx
	je	.L9273
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L9273
.L9291:
	cmpq	%r13, 8(%rdi)
	je	.L18308
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L9291
.L9273:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L9221
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L9293
	movslq	8(%r13),%r11
	movslq	8(%rdx),%r14
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rsi
	leaq	(%r14,%r14,2), %rbp
	salq	$4, %rsi
	salq	$4, %rbp
	movl	16(%rsi,%r9), %ecx
	movslq	16(%rbp,%r9),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17270:
	andl	$63, %ecx
	movl	$1, %esi
	salq	%cl, %rsi
	orq	%rsi, 16(%rax)
.L9221:
	movq	448(%rsp), %rax
	movq	16(%rax), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 448(%rsp)
	jne	.L9298
	jmp	.L16265
.L9293:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16868
	movl	$14, %ebp
	cmpl	$15, %ebp
.L17666:
	jne	.L9221
	movq	1696(%rsp), %r8
	movq	h_i_d(%rip), %rcx
	movslq	8(%r8),%r12
	leaq	(%r12,%r12,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17269:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17270
.L16868:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17269
.L18308:
	testq	%r10, %r10
	je	.L9279
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18310
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r11
	movslq	8(%r12),%rcx
	leaq	(%rbp,%rbp,2), %r9
	salq	$4, %r9
	leaq	(%rcx,%rcx,2), %r14
	movl	16(%r9,%r11), %ecx
	salq	$4, %r14
	movslq	16(%r14,%r11),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17268:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L9279:
	movzbl	2(%rdi), %edx
	movl	$14, %eax
	cmpl	%edx, %eax
	jge	.L9284
	movb	$14, 2(%rdi)
.L9284:
	testq	%r10, %r10
	je	.L9221
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16867
	cmpb	$14, %al
	je	.L16868
	cmpb	$15, %al
	jmp	.L17666
.L16867:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rbx), %ecx
	leaq	(%rsi,%rsi,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%rbx),%r12
	movl	%ecx, %r8d
	shrl	$6, %r8d
	mov	%r8d, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17270
.L18310:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r14,%rbp), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17268
.L9268:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9270
	movl	$15, %r11d
	jmp	.L9267
.L9270:
	xorl	%ebx, %ebx
	jmp	.L9267
.L18307:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L9230
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L9221
	jmp	.L9230
.L18306:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L9254
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L9254
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L9254
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L9254
	movl	$1, %eax
	jmp	.L9255
.L18305:
	cmpw	$47, %dx
	jne	.L9251
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9251
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9251
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18311
	movq	24(%rbx), %rax
.L9249:
	cmpw	$67, (%rax)
	jne	.L9251
	cmpq	%rsi, %rcx
	jne	.L9251
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L9243
.L18311:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L9243
	jmp	.L9249
.L18304:
	movq	8(%rax), %rbx
	jmp	.L9243
.L18303:
	cmpw	$47, %dx
	je	.L18312
.L9240:
	xorl	%ebp, %ebp
	jmp	.L9232
.L18312:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9240
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9240
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18313
	movq	24(%rbp), %rax
.L9238:
	cmpw	$67, (%rax)
	jne	.L9240
	cmpq	%rsi, %rcx
	jne	.L9240
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L9232
.L18313:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L9232
	jmp	.L9238
.L18302:
	movq	8(%rax), %rbp
	jmp	.L9232
.L18301:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18314
.L9225:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L9221
	movq	448(%rsp), %rbp
	movq	8(%rbp), %r14
	jmp	.L9224
.L18314:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L9225
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %r11
	testq	%r11, %r11
	cmovne	%r11, %rdi
	jmp	.L9225
.L9218:
	movq	464(%rsp), %r12
	movq	488(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L9146
	movq	456(%rsp), %rcx
	xorl	%r14d, %r14d
	movq	8(%rcx), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L9146
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L9146
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L9150
	cmpw	$34, %ax
	je	.L9150
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L9152
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18315
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18316
.L9152:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L9163
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18317
	cmpw	$33, (%r13)
	je	.L18318
.L9171:
	xorl	%ebx, %ebx
.L9163:
	testq	%rbp, %rbp
	je	.L9150
	testq	%rbx, %rbx
	je	.L9150
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18319
.L9174:
	xorl	%eax, %eax
.L9175:
	testl	%eax, %eax
	jne	.L18320
.L9150:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L9176
	testb	$16, 3(%rax)
	je	.L9176
	cmpw	$36, (%rax)
	je	.L9176
.L9177:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L9178
	testb	$16, 3(%rax)
	je	.L9178
	cmpw	$36, (%rax)
	je	.L9178
	movq	%rax, %rbx
	jmp	.L9177
.L9178:
	cmpq	%rbx, 1696(%rsp)
	je	.L9146
	movq	%rbx, %r13
.L9176:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L9183
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L9187
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9188
	movl	$14, %r11d
.L9187:
	testl	%ebx, %ebx
	je	.L9193
	cmpl	%r11d, %r14d
	jge	.L9146
.L9183:
	testl	%ebx, %ebx
	je	.L9193
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L9193
.L9211:
	cmpq	%r13, 8(%rdi)
	je	.L18321
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L9211
.L9193:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L9146
	testl	%r14d, %r14d
	jne	.L9213
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17267:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L9146:
	movq	456(%rsp), %rax
	movq	464(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 456(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 464(%rsp)
	jne	.L9218
	jmp	.L16182
.L9213:
	cmpl	$14, %r14d
	je	.L16866
	cmpl	$15, %r14d
.L17665:
	jne	.L9146
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17266:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17267
.L16866:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17266
.L18321:
	testq	%r10, %r10
	je	.L9199
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18323
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17265:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L9199:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L9204
	movb	$0, 2(%rdi)
.L9204:
	testq	%r10, %r10
	je	.L9146
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16865
	cmpb	$14, %al
	je	.L16866
	cmpb	$15, %al
	jmp	.L17665
.L16865:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17267
.L18323:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17265
.L9188:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9190
	movl	$15, %r11d
	jmp	.L9187
.L9190:
	xorl	%ebx, %ebx
	jmp	.L9187
.L18320:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L9150
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L9146
	jmp	.L9150
.L18319:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L9174
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L9174
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L9174
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L9174
	movl	$1, %eax
	jmp	.L9175
.L18318:
	cmpw	$47, %dx
	jne	.L9171
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9171
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9171
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18324
	movq	24(%rbx), %rax
.L9169:
	cmpw	$67, (%rax)
	jne	.L9171
	cmpq	%rsi, %rcx
	jne	.L9171
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L9163
.L18324:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L9163
	jmp	.L9169
.L18317:
	movq	8(%rax), %rbx
	jmp	.L9163
.L18316:
	cmpw	$47, %dx
	je	.L18325
.L9160:
	xorl	%ebp, %ebp
	jmp	.L9152
.L18325:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9160
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9160
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18326
	movq	24(%rbp), %rax
.L9158:
	cmpw	$67, (%rax)
	jne	.L9160
	cmpq	%rsi, %rcx
	jne	.L9160
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L9152
.L18326:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L9152
	jmp	.L9158
.L18315:
	movq	8(%rax), %rbp
	jmp	.L9152
.L9142:
	movq	480(%rsp), %rcx
	movq	488(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L9070
	movq	472(%rsp), %r14
	movq	8(%r14), %r13
	cmpq	%r13, 1696(%rsp)
	movl	$14, %r14d
	je	.L9070
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L9070
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L9074
	cmpw	$34, %ax
	je	.L9074
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L9076
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18327
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18328
.L9076:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L9087
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18329
	cmpw	$33, (%r13)
	je	.L18330
.L9095:
	xorl	%ebx, %ebx
.L9087:
	testq	%rbp, %rbp
	je	.L9074
	testq	%rbx, %rbx
	je	.L9074
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L18331
.L9098:
	xorl	%eax, %eax
.L9099:
	testl	%eax, %eax
	jne	.L18332
.L9074:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L9100
	testb	$16, 3(%rax)
	je	.L9100
	cmpw	$36, (%rax)
	je	.L9100
.L9101:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L9102
	testb	$16, 3(%rax)
	je	.L9102
	cmpw	$36, (%rax)
	je	.L9102
	movq	%rax, %rbx
	jmp	.L9101
.L9102:
	cmpq	%rbx, 1696(%rsp)
	je	.L9070
	movq	%rbx, %r13
.L9100:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L9107
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L9111
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9112
	movl	$14, %r11d
.L9111:
	testl	%ebx, %ebx
	je	.L9117
	cmpl	%r11d, %r14d
	jge	.L9070
.L9107:
	testl	%ebx, %ebx
	je	.L9117
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L9117
.L9135:
	cmpq	%r13, 8(%rdi)
	je	.L18333
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L9135
.L9117:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L9070
	testl	%r14d, %r14d
	jne	.L9137
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17264:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L9070:
	movq	472(%rsp), %rax
	movq	480(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 472(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 480(%rsp)
	jne	.L9142
	jmp	.L16179
.L9137:
	cmpl	$14, %r14d
	je	.L16864
	cmpl	$15, %r14d
.L17664:
	jne	.L9070
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17263:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17264
.L16864:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17263
.L18333:
	testq	%r10, %r10
	je	.L9123
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18335
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17262:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L9123:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L9128
	movb	$14, 2(%rdi)
.L9128:
	testq	%r10, %r10
	je	.L9070
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16863
	cmpb	$14, %al
	je	.L16864
	cmpb	$15, %al
	jmp	.L17664
.L16863:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17264
.L18335:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17262
.L9112:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L9114
	movl	$15, %r11d
	jmp	.L9111
.L9114:
	xorl	%ebx, %ebx
	jmp	.L9111
.L18332:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L9074
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L9070
	jmp	.L9074
.L18331:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L9098
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L9098
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L9098
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L9098
	movl	$1, %eax
	jmp	.L9099
.L18330:
	cmpw	$47, %dx
	jne	.L9095
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9095
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9095
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18336
	movq	24(%rbx), %rax
.L9093:
	cmpw	$67, (%rax)
	jne	.L9095
	cmpq	%rsi, %rcx
	jne	.L9095
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L9087
.L18336:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L9087
	jmp	.L9093
.L18329:
	movq	8(%rax), %rbx
	jmp	.L9087
.L18328:
	cmpw	$47, %dx
	je	.L18337
.L9084:
	xorl	%ebp, %ebp
	jmp	.L9076
.L18337:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L9084
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L9084
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18338
	movq	24(%rbp), %rax
.L9082:
	cmpw	$67, (%rax)
	jne	.L9084
	cmpq	%rsi, %rcx
	jne	.L9084
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L9076
.L18338:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L9076
	jmp	.L9082
.L18327:
	movq	8(%rax), %rbp
	jmp	.L9076
.L18300:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	testb	$2, target_flags+3(%rip)
	setne	%dl
	movq	%rax, 488(%rsp)
	movq	8(%rax), %rdi
	movzbl	%dl, %esi
	movl	$1, %edx
	addl	$4, %esi
	call	cselib_lookup
	movq	488(%rsp), %rax
	movq	8(%rax), %rdi
	call	cselib_subst_to_values
	movq	488(%rsp), %r12
	movq	%rax, 8(%r12)
	jmp	.L9062
	.p2align 6,,7
.L18292:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L9016
.L7929:
	movq	1616(%rsp), %rdx
	movzbl	2(%rdx), %eax
	cmpb	$18, %al
	je	.L18339
	cmpb	$24, %al
	je	.L18340
	movl	target_flags(%rip), %r8d
	testl	$33554432, %r8d
	movl	%r8d, %ecx
	je	.L7942
	movzbl	%al, %r11d 
	movzbl	mode_size(%r11), %r9d
	leal	7(%r9), %edx
.L7943:
	andl	$33554432, %ecx
	je	.L7944
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L7930
.L7944:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L7930
.L7942:
	movzbl	%al, %edi 
	movzbl	mode_size(%rdi), %r14d
	leal	3(%r14), %edx
	jmp	.L7943
.L18340:
	xorl	%esi, %esi
	testb	$2, target_flags+3(%rip)
	sete	%sil
	leal	4(%rsi,%rsi), %eax
	jmp	.L7930
.L18339:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17219
	.p2align 6,,7
.L7928:
	movq	1704(%rsp), %rcx
	cmpl	68(%rcx), %ebp
	jl	.L7953
	movq	1696(%rsp), %rbp
	movq	32(%rbp), %rax
.L17691:
	movzwl	(%rax), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L3412
	jmp	.L17569
.L7953:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L16558
	movq	reg_known_equiv_p(%rip), %r15
	movslq	%ebp,%rbx
	addq	%rbx, %r15
	cmpb	$0, (%r15)
	je	.L7956
	leaq	0(,%rbx,8), %r10
	addq	reg_known_value(%rip), %r10
	movq	(%r10), %rax
	cmpw	$66, (%rax)
	je	.L18341
.L7956:
	leaq	0(,%rbx,8), %rdx
	addq	reg_n_info(%rip), %rdx
	movq	32(%rdx), %r13
	movl	32(%r13), %r12d
	testl	%r12d, %r12d
	jne	.L3412
	movq	1704(%rsp), %rax
	movq	1696(%rsp), %rdi
	movq	56(%rax), %rsi
.L17260:
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rsi
	movq	%rax, 56(%rsi)
	jmp	.L3412
.L18341:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L7956
.L16558:
	movslq	%ebp,%rbx
	jmp	.L7956
	.p2align 6,,7
.L8211:
	cmpl	$41, %ebx
	je	.L18342
.L8213:
	movb	$1, reg_pending_barrier(%rip)
.L8212:
	cmpl	$41, %ebx
	je	.L18343
.L7920:
	movslq	%ebx,%r12
	movzbl	rtx_length(%r12), %edx
	movq	rtx_format(,%r12,8), %r13
	movl	%edx, %r12d
	decl	%r12d
	js	.L3412
	movq	1616(%rsp), %r14
	addq	$8, %r14
.L9004:
	movslq	%r12d,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18344
	cmpb	$69, %dl
	je	.L18345
.L8994:
	decl	%r12d
	jns	.L9004
	jmp	.L3412
.L18345:
	movq	1616(%rsp), %r8
	xorl	%ebx, %ebx
	leaq	8(%r8,%rax,8), %rdx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L8994
	movq	%rdx, %rbp
.L9003:
	movq	(%rbp), %r9
	movslq	%ebx,%r11
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %r9
	movq	(%r9,%r11,8), %rsi
	call	sched_analyze_2
	movq	(%rbp), %rcx
	cmpl	(%rcx), %ebx
	jl	.L9003
	jmp	.L8994
.L18344:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L8994
.L18343:
	movq	1616(%rsp), %r13
	xorl	%ebx, %ebx
	movq	32(%r13), %rdx
	cmpl	(%rdx), %ebx
	jge	.L3412
.L8219:
	movslq	%ebx,%r12
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r12,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1616(%rsp), %r14
	movq	32(%r14), %rbp
	cmpl	(%rbp), %ebx
	movq	%rbp, %rdx
	jl	.L8219
	jmp	.L3412
.L18342:
	movq	1616(%rsp), %rsi
	testb	$8, 3(%rsi)
	je	.L8212
	jmp	.L8213
	.p2align 6,,7
.L8198:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r9
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r9, %rsi
	movl	$0, 32(%r9)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rdi
	movq	%rax, 40(%rdi)
	movl	$1, 36(%rdi)
	jmp	.L7920
.L7958:
	movq	current_sched_info(%rip), %r8
	movq	1616(%rsp), %r15
	testb	$2, 96(%r8)
	jne	.L18346
.L7959:
	movq	1704(%rsp), %rbp
	movq	1704(%rsp), %rdi
	movq	(%rbp), %r11
	movq	8(%rdi), %r14
	testq	%r11, %r11
	movq	%r11, 872(%rsp)
	movq	%r14, 880(%rsp)
	jne	.L8039
.L16128:
	movq	1704(%rsp), %rbp
	movq	1704(%rsp), %rbx
	movq	16(%rbp), %r10
	movq	24(%rbx), %r11
	testq	%r10, %r10
	movq	%r10, 856(%rsp)
	movq	%r11, 864(%rsp)
	jne	.L8115
.L16131:
	movq	1704(%rsp), %rcx
	movq	40(%rcx), %r15
	testq	%r15, %r15
	movq	%r15, 848(%rsp)
	je	.L16134
.L8195:
	movq	848(%rsp), %r11
	movq	8(%r11), %r14
	cmpw	$33, (%r14)
	je	.L18347
.L8121:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	movl	$14, %r15d
	je	.L8118
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L8118
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8127
	cmpw	$34, %ax
	je	.L8127
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8129
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18348
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18349
.L8129:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8140
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18350
	cmpw	$33, (%r14)
	je	.L18351
.L8148:
	xorl	%ebx, %ebx
.L8140:
	testq	%rbp, %rbp
	je	.L8127
	testq	%rbx, %rbx
	je	.L8127
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18352
.L8151:
	xorl	%eax, %eax
.L8152:
	testl	%eax, %eax
	jne	.L18353
.L8127:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8153
	testb	$16, 3(%rax)
	je	.L8153
	cmpw	$36, (%rax)
	je	.L8153
.L8154:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8155
	testb	$16, 3(%rax)
	je	.L8155
	cmpw	$36, (%rax)
	je	.L8155
	movq	%rax, %rbx
	jmp	.L8154
.L8155:
	cmpq	%rbx, 1696(%rsp)
	je	.L8118
	movq	%rbx, %r13
.L8153:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8160
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rbp), %edx
	leaq	(%r12,%r12,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rbp),%rcx
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	leaq	0(,%rcx,8), %rdi
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8164
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8165
	movl	$14, %r11d
.L8164:
	testl	%ebx, %ebx
	je	.L8170
	cmpl	%r11d, %r15d
	jge	.L8118
.L8160:
	testl	%ebx, %ebx
	je	.L8170
	movq	1696(%rsp), %r11
	movq	48(%r11), %rdi
	testq	%rdi, %rdi
	je	.L8170
.L8188:
	cmpq	%r13, 8(%rdi)
	je	.L18354
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8188
.L8170:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L8118
	testl	%r15d, %r15d
	jne	.L8190
	movslq	8(%r13),%rsi
	movslq	8(%rdx),%r9
	movq	h_i_d(%rip), %r11
	leaq	(%rsi,%rsi,2), %rdi
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rdi
	salq	$4, %rbx
	movl	16(%rdi,%r11), %ecx
	movslq	16(%rbx,%r11),%r15
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17228:
	andl	$63, %ecx
	movl	$1, %r12d
	salq	%cl, %r12
	orq	%r12, 16(%rax)
.L8118:
	movq	848(%rsp), %rdx
	movq	16(%rdx), %r8
	testq	%r8, %r8
	movq	%r8, 848(%rsp)
	jne	.L8195
.L16134:
	movq	1704(%rsp), %r10
	movq	1696(%rsp), %rdi
	movq	1616(%rsp), %rbx
	movq	(%r10), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %rcx
	movq	1704(%rsp), %r15
	movq	%rax, (%r15)
	testb	$2, 96(%rcx)
	jne	.L18355
.L8196:
	movq	%rbx, %rsi
	xorl	%edi, %edi
	movq	1704(%rsp), %rbx
	movq	8(%rbx), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r11
	movq	%rax, 8(%r11)
	incl	32(%r11)
	movq	%r11, %rdi
	movq	1616(%rsp), %rax
	movq	8(%rax), %rsi
.L17257:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L3412
.L18355:
	movq	1616(%rsp), %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L8196
	.p2align 6,,7
.L8190:
	cmpl	$14, %r15d
	je	.L16846
	cmpl	$15, %r15d
.L17655:
	jne	.L8118
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17227:
	movslq	8(%r13),%r14
	leaq	(%r14,%r14,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17228
.L16846:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rdi
	leaq	(%rdi,%rdi,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17227
.L18354:
	testq	%r10, %r10
	je	.L8176
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18357
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r9
	movslq	8(%r12),%rdx
	leaq	(%rbp,%rbp,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%r9), %ecx
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r9),%r11
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%r11,8), %rax
.L17226:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8176:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r15d
	jge	.L8181
	movb	$14, 2(%rdi)
.L8181:
	testq	%r10, %r10
	je	.L8118
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16845
	cmpb	$14, %al
	je	.L16846
	cmpb	$15, %al
	jmp	.L17655
.L16845:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%r15
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %r12
	leaq	(%r15,%r15,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r8),%rbp
	movl	16(%r12,%r8), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17228
.L18357:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r14,%rbp), %ecx
	movl	%ecx, %r9d
	salq	$3, %rbx
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17226
.L8165:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8167
	movl	$15, %r11d
	jmp	.L8164
.L8167:
	xorl	%ebx, %ebx
	jmp	.L8164
.L18353:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8127
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8118
	jmp	.L8127
.L18352:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L8151
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L8151
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L8151
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L8151
	movl	$1, %eax
	jmp	.L8152
.L18351:
	cmpw	$47, %dx
	jne	.L8148
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8148
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8148
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18358
	movq	24(%rbx), %rax
.L8146:
	cmpw	$67, (%rax)
	jne	.L8148
	cmpq	%rsi, %rcx
	jne	.L8148
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8140
.L18358:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8140
	jmp	.L8146
	.p2align 6,,7
.L18350:
	movq	8(%rax), %rbx
	jmp	.L8140
.L18349:
	cmpw	$47, %dx
	je	.L18359
.L8137:
	xorl	%ebp, %ebp
	jmp	.L8129
.L18359:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8137
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8137
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18360
	movq	24(%rbp), %rax
.L8135:
	cmpw	$67, (%rax)
	jne	.L8137
	cmpq	%rsi, %rcx
	jne	.L8137
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8129
.L18360:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8129
	jmp	.L8135
	.p2align 6,,7
.L18348:
	movq	8(%rax), %rbp
	jmp	.L8129
.L18347:
	movq	1616(%rsp), %rbx
	movq	8(%rbx), %rdi
	cmpw	$61, (%rdi)
	je	.L18361
.L8122:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L8118
	movq	848(%rsp), %rbp
	movq	8(%rbp), %r14
	jmp	.L8121
.L18361:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L8122
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %r9
	testq	%r9, %r9
	cmovne	%r9, %rdi
	jmp	.L8122
	.p2align 6,,7
.L8115:
	movq	864(%rsp), %r12
	xorl	%esi, %esi
	movq	%r15, %rdx
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L8043
	movq	856(%rsp), %rcx
	xorl	%r14d, %r14d
	movq	8(%rcx), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L8043
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L8043
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8047
	cmpw	$34, %ax
	je	.L8047
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8049
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18362
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18363
.L8049:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8060
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18364
	cmpw	$33, (%r13)
	je	.L18365
.L8068:
	xorl	%ebx, %ebx
.L8060:
	testq	%rbp, %rbp
	je	.L8047
	testq	%rbx, %rbx
	je	.L8047
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18366
.L8071:
	xorl	%eax, %eax
.L8072:
	testl	%eax, %eax
	jne	.L18367
.L8047:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8073
	testb	$16, 3(%rax)
	je	.L8073
	cmpw	$36, (%rax)
	je	.L8073
.L8074:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8075
	testb	$16, 3(%rax)
	je	.L8075
	cmpw	$36, (%rax)
	je	.L8075
	movq	%rax, %rbx
	jmp	.L8074
.L8075:
	cmpq	%rbx, 1696(%rsp)
	je	.L8043
	movq	%rbx, %r13
.L8073:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8080
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8084
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8085
	movl	$14, %r11d
.L8084:
	testl	%ebx, %ebx
	je	.L8090
	cmpl	%r11d, %r14d
	jge	.L8043
.L8080:
	testl	%ebx, %ebx
	je	.L8090
	movq	1696(%rsp), %r11
	movq	48(%r11), %rdi
	testq	%rdi, %rdi
	je	.L8090
.L8108:
	cmpq	%r13, 8(%rdi)
	je	.L18368
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8108
.L8090:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L8043
	testl	%r14d, %r14d
	jne	.L8110
	movslq	8(%r13),%rbx
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %r11
	leaq	(%rbx,%rbx,2), %rdi
	leaq	(%r12,%r12,2), %r9
	salq	$4, %rdi
	salq	$4, %r9
	movl	16(%rdi,%r11), %ecx
	movslq	16(%r9,%r11),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17225:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L8043:
	movq	856(%rsp), %rax
	movq	864(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 856(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 864(%rsp)
	jne	.L8115
	jmp	.L16131
.L8110:
	cmpl	$14, %r14d
	je	.L16844
	cmpl	$15, %r14d
.L17654:
	jne	.L8043
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17224:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17225
.L16844:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17224
.L18368:
	testq	%r10, %r10
	je	.L8096
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18370
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%r11
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r11,8), %rax
.L17223:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8096:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L8101
	movb	$0, 2(%rdi)
.L8101:
	testq	%r10, %r10
	je	.L8043
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16843
	cmpb	$14, %al
	je	.L16844
	cmpb	$15, %al
	jmp	.L17654
.L16843:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17225
.L18370:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %rbx
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17223
.L8085:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8087
	movl	$15, %r11d
	jmp	.L8084
.L8087:
	xorl	%ebx, %ebx
	jmp	.L8084
.L18367:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8047
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8043
	jmp	.L8047
.L18366:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L8071
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L8071
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rbp)
	jne	.L8071
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L8071
	movl	$1, %eax
	jmp	.L8072
.L18365:
	cmpw	$47, %dx
	jne	.L8068
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8068
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8068
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18371
	movq	24(%rbx), %rax
.L8066:
	cmpw	$67, (%rax)
	jne	.L8068
	cmpq	%rsi, %rcx
	jne	.L8068
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8060
.L18371:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8060
	jmp	.L8066
.L18364:
	movq	8(%rax), %rbx
	jmp	.L8060
.L18363:
	cmpw	$47, %dx
	je	.L18372
.L8057:
	xorl	%ebp, %ebp
	jmp	.L8049
.L18372:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8057
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8057
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18373
	movq	24(%rbp), %rax
.L8055:
	cmpw	$67, (%rax)
	jne	.L8057
	cmpq	%rsi, %rcx
	jne	.L8057
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8049
.L18373:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8049
	jmp	.L8055
.L18362:
	movq	8(%rax), %rbp
	jmp	.L8049
	.p2align 6,,7
.L8039:
	movq	880(%rsp), %rcx
	movq	%r15, %rsi
	movq	8(%rcx), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L7967
	movq	872(%rsp), %rbx
	movl	$14, %r14d
	movq	8(%rbx), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L7967
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L7967
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7971
	cmpw	$34, %ax
	je	.L7971
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L7973
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18374
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18375
.L7973:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7984
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18376
	cmpw	$33, (%r13)
	je	.L18377
.L7992:
	xorl	%ebx, %ebx
.L7984:
	testq	%rbp, %rbp
	je	.L7971
	testq	%rbx, %rbx
	je	.L7971
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r10
	cmpb	$60, rtx_class(%r10)
	je	.L18378
.L7995:
	xorl	%eax, %eax
.L7996:
	testl	%eax, %eax
	jne	.L18379
.L7971:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7997
	testb	$16, 3(%rax)
	je	.L7997
	cmpw	$36, (%rax)
	je	.L7997
.L7998:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7999
	testb	$16, 3(%rax)
	je	.L7999
	cmpw	$36, (%rax)
	je	.L7999
	movq	%rax, %rbx
	jmp	.L7998
.L7999:
	cmpq	%rbx, 1696(%rsp)
	je	.L7967
	movq	%rbx, %r13
.L7997:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8004
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8008
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8009
	movl	$14, %r11d
.L8008:
	testl	%ebx, %ebx
	je	.L8014
	cmpl	%r11d, %r14d
	jge	.L7967
.L8004:
	testl	%ebx, %ebx
	je	.L8014
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L8014
.L8032:
	cmpq	%r13, 8(%rdi)
	je	.L18380
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8032
.L8014:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L7967
	testl	%r14d, %r14d
	jne	.L8034
	movslq	8(%r13),%rbx
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%rbx,%rbx,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r11), %ecx
	movslq	16(%rbp,%r11),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17222:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L7967:
	movq	872(%rsp), %rax
	movq	880(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 872(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 880(%rsp)
	jne	.L8039
	jmp	.L16128
.L8034:
	cmpl	$14, %r14d
	je	.L16842
	cmpl	$15, %r14d
.L17653:
	jne	.L7967
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17221:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17222
.L16842:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17221
.L18380:
	testq	%r10, %r10
	je	.L8020
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18382
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %rbx
	salq	$4, %rbx
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%rbx,%rbp), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17220:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8020:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r14d
	jge	.L8025
	movb	$14, 2(%rdi)
.L8025:
	testq	%r10, %r10
	je	.L7967
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16841
	cmpb	$14, %al
	je	.L16842
	cmpb	$15, %al
	jmp	.L17653
.L16841:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%r9
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r9,%r9,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17222
.L18382:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r11
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17220
.L8009:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8011
	movl	$15, %r11d
	jmp	.L8008
.L8011:
	xorl	%ebx, %ebx
	jmp	.L8008
.L18379:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7971
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7967
	jmp	.L7971
.L18378:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L7995
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L7995
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L7995
	movq	16(%rbx), %rsi
	cmpq	%rsi, 16(%rbp)
	jne	.L7995
	movl	$1, %eax
	jmp	.L7996
.L18377:
	cmpw	$47, %dx
	jne	.L7992
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7992
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7992
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18383
	movq	24(%rbx), %rax
.L7990:
	cmpw	$67, (%rax)
	jne	.L7992
	cmpq	%rsi, %rcx
	jne	.L7992
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7984
.L18383:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7984
	jmp	.L7990
.L18376:
	movq	8(%rax), %rbx
	jmp	.L7984
.L18375:
	cmpw	$47, %dx
	je	.L18384
.L7981:
	xorl	%ebp, %ebp
	jmp	.L7973
.L18384:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7981
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7981
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18385
	movq	24(%rbp), %rax
.L7979:
	cmpw	$67, (%rax)
	jne	.L7981
	cmpq	%rsi, %rcx
	jne	.L7981
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L7973
.L18385:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L7973
	jmp	.L7979
.L18374:
	movq	8(%rax), %rbp
	jmp	.L7973
.L18346:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r9b
	movq	8(%rax), %rdi
	movq	%rax, %r15
	movzbl	%r9b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	8(%r15), %rdi
	call	cselib_subst_to_values
	movq	%rax, 8(%r15)
	jmp	.L7959
	.p2align 6,,7
.L8223:
	movq	1616(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	8(%rdx), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1616(%rsp), %r8
	movq	8(%r8), %r12
	movzwl	(%r8), %ebx
	testq	%r12, %r12
	je	.L3412
	movzwl	(%r12), %edx
	cmpw	$39, %dx
	je	.L18386
	leal	-63(%rdx), %r10d
	cmpw	$1, %r10w
	ja	.L18387
.L8238:
	leal	-132(%rdx), %r11d
	cmpw	$1, %r11w
	jbe	.L18388
.L8237:
	movq	8(%r12), %r12
	movzwl	(%r12), %edx
	leal	-63(%rdx), %edi
	cmpw	$1, %di
	jbe	.L8238
	cmpw	$133, %dx
	je	.L8238
	cmpw	$132, %dx
	je	.L8238
.L16140:
	cmpw	$61, %dx
	je	.L18389
	cmpw	$66, %dx
	je	.L18390
.L8739:
	movq	1616(%rsp), %rcx
	cmpw	$47, (%rcx)
	jne	.L3412
	movq	1704(%rsp), %rdi
	movq	16(%rcx), %rsi
	jmp	.L17257
.L18390:
	movq	current_sched_info(%rip), %r15
	movq	%r12, 840(%rsp)
	testb	$2, 96(%r15)
	jne	.L18391
.L8357:
	movq	compiler_params(%rip), %r10
	movq	1704(%rsp), %rcx
	movl	80(%r10), %eax
	cmpl	%eax, 32(%rcx)
	jg	.L17726
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %rsi
	movq	(%rax), %rbp
	movq	8(%rsi), %rdx
	testq	%rbp, %rbp
	movq	%rbp, 824(%rsp)
	movq	%rdx, 832(%rsp)
	jne	.L8449
.L16146:
	movq	1704(%rsp), %rbp
	movq	1704(%rsp), %r11
	movq	16(%rbp), %r10
	movq	24(%r11), %r9
	testq	%r10, %r10
	movq	%r10, 808(%rsp)
	movq	%r9, 816(%rsp)
	jne	.L8525
.L16149:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 800(%rsp)
	je	.L16169
	movl	$14, %r15d
.L8601:
	movq	800(%rsp), %r9
	movq	8(%r9), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L8528
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L8528
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8533
	cmpw	$34, %ax
	je	.L8533
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8535
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18392
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18393
.L8535:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8546
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18394
	cmpw	$33, (%r14)
	je	.L18395
.L8554:
	xorl	%ebx, %ebx
.L8546:
	testq	%rbp, %rbp
	je	.L8533
	testq	%rbx, %rbx
	je	.L8533
	movzwl	(%rbp), %r13d
	movslq	%r13d,%r11
	cmpb	$60, rtx_class(%r11)
	je	.L18396
.L8557:
	xorl	%eax, %eax
.L8558:
	testl	%eax, %eax
	jne	.L18397
.L8533:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8559
	testb	$16, 3(%rax)
	je	.L8559
	cmpw	$36, (%rax)
	je	.L8559
.L8560:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8561
	testb	$16, 3(%rax)
	je	.L8561
	cmpw	$36, (%rax)
	je	.L8561
	movq	%rax, %rbx
	jmp	.L8560
.L8561:
	cmpq	%rbx, 1696(%rsp)
	je	.L8528
	movq	%rbx, %r14
.L8559:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8566
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r13,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r13d
	leaq	0(,%r13,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8570
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8571
	movl	$14, %r11d
.L8570:
	testl	%ebx, %ebx
	je	.L8576
	cmpl	%r11d, %r15d
	jge	.L8528
.L8566:
	testl	%ebx, %ebx
	je	.L8576
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8576
.L8594:
	cmpq	%r14, 8(%rdi)
	je	.L18398
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8594
.L8576:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L8528
	testl	%r15d, %r15d
	jne	.L8596
	movslq	8(%r14),%rbp
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%rbp,%rbp,2), %r9
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r9
	salq	$4, %rdx
	movl	16(%r9,%r11), %ecx
	movslq	16(%rdx,%r11),%rdi
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17242:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L8528:
	movq	800(%rsp), %r11
	movq	16(%r11), %r9
	testq	%r9, %r9
	movq	%r9, 800(%rsp)
	jne	.L8601
.L16169:
	movq	1704(%rsp), %rbp
	movq	1696(%rsp), %rdi
	movq	%r12, %rbx
	movq	16(%rbp), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r15
	movq	1704(%rsp), %r10
	movq	%rax, 16(%r10)
	testb	$2, 96(%r15)
	jne	.L18399
.L8987:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	24(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r13
	movq	%rax, 24(%r13)
	incl	32(%r13)
.L8757:
	movq	1704(%rsp), %rdi
	movq	8(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L8739
.L18399:
	movq	%r12, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L8987
.L8596:
	cmpl	$14, %r15d
	je	.L16854
	cmpl	$15, %r15d
.L17659:
	jne	.L8528
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17241:
	movslq	8(%r14),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17242
.L16854:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%rbp
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17241
.L18398:
	testq	%r10, %r10
	je	.L8582
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18401
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17240:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8582:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r15d
	jge	.L8587
	movb	$14, 2(%rdi)
.L8587:
	testq	%r10, %r10
	je	.L8528
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16853
	cmpb	$14, %al
	je	.L16854
	cmpb	$15, %al
	jmp	.L17659
.L16853:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdi
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%r11
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbx), %ecx
	leaq	(%r11,%r11,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rbx),%r13
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17242
.L18401:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17240
.L8571:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8573
	movl	$15, %r11d
	jmp	.L8570
.L8573:
	xorl	%ebx, %ebx
	jmp	.L8570
.L18397:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8533
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8528
	jmp	.L8533
.L18396:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L8557
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L8557
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%rbp)
	jne	.L8557
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%rbp)
	jne	.L8557
	movl	$1, %eax
	jmp	.L8558
.L18395:
	cmpw	$47, %dx
	jne	.L8554
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8554
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8554
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18402
	movq	24(%rbx), %rax
.L8552:
	cmpw	$67, (%rax)
	jne	.L8554
	cmpq	%rsi, %rcx
	jne	.L8554
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8546
.L18402:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8546
	jmp	.L8552
.L18394:
	movq	8(%rax), %rbx
	jmp	.L8546
.L18393:
	cmpw	$47, %dx
	je	.L18403
.L8543:
	xorl	%ebp, %ebp
	jmp	.L8535
.L18403:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8543
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8543
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18404
	movq	24(%rbp), %rax
.L8541:
	cmpw	$67, (%rax)
	jne	.L8543
	cmpq	%rsi, %rcx
	jne	.L8543
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8535
.L18404:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8535
	jmp	.L8541
.L18392:
	movq	8(%rax), %rbp
	jmp	.L8535
.L8525:
	movq	816(%rsp), %r13
	movq	840(%rsp), %rsi
	movq	8(%r13), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L8453
	movq	808(%rsp), %rcx
	movl	$15, %r15d
	movq	8(%rcx), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L8453
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L8453
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8457
	cmpw	$34, %ax
	je	.L8457
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8459
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18405
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18406
.L8459:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8470
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18407
	cmpw	$33, (%r14)
	je	.L18408
.L8478:
	xorl	%ebx, %ebx
.L8470:
	testq	%rbp, %rbp
	je	.L8457
	testq	%rbx, %rbx
	je	.L8457
	movzwl	(%rbp), %r13d
	movslq	%r13d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18409
.L8481:
	xorl	%eax, %eax
.L8482:
	testl	%eax, %eax
	jne	.L18410
.L8457:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8483
	testb	$16, 3(%rax)
	je	.L8483
	cmpw	$36, (%rax)
	je	.L8483
.L8484:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8485
	testb	$16, 3(%rax)
	je	.L8485
	cmpw	$36, (%rax)
	je	.L8485
	movq	%rax, %rbx
	jmp	.L8484
.L8485:
	cmpq	%rbx, 1696(%rsp)
	je	.L8453
	movq	%rbx, %r14
.L8483:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8490
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%rbp
	movl	16(%rcx,%r13), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8494
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8495
	movl	$14, %r11d
.L8494:
	testl	%ebx, %ebx
	je	.L8500
	cmpl	%r11d, %r15d
	jge	.L8453
.L8490:
	testl	%ebx, %ebx
	je	.L8500
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8500
.L8518:
	cmpq	%r14, 8(%rdi)
	je	.L18411
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8518
.L8500:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L8453
	testl	%r15d, %r15d
	jne	.L8520
	movslq	8(%r14),%r9
	movslq	8(%rdx),%r13
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r13,%r13,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17239:
	andl	$63, %ecx
	movl	$1, %r15d
	salq	%cl, %r15
	orq	%r15, 16(%rax)
.L8453:
	movq	808(%rsp), %rax
	movq	816(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 808(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 816(%rsp)
	jne	.L8525
	jmp	.L16149
.L8520:
	cmpl	$14, %r15d
	je	.L16852
	cmpl	$15, %r15d
.L17658:
	jne	.L8453
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r13
	leaq	(%r13,%r13,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17238:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17239
.L16852:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17238
.L18411:
	testq	%r10, %r10
	je	.L8506
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18413
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r13), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r13),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17237:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8506:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r15d
	jge	.L8511
	movb	$15, 2(%rdi)
.L8511:
	testq	%r10, %r10
	je	.L8453
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16851
	cmpb	$14, %al
	je	.L16852
	cmpb	$15, %al
	jmp	.L17658
.L16851:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17239
.L18413:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbp
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%r9
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17237
.L8495:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8497
	movl	$15, %r11d
	jmp	.L8494
.L8497:
	xorl	%ebx, %ebx
	jmp	.L8494
.L18410:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8457
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8453
	jmp	.L8457
.L18409:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L8481
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L8481
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L8481
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L8481
	movl	$1, %eax
	jmp	.L8482
.L18408:
	cmpw	$47, %dx
	jne	.L8478
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8478
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8478
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18414
	movq	24(%rbx), %rax
.L8476:
	cmpw	$67, (%rax)
	jne	.L8478
	cmpq	%rsi, %rcx
	jne	.L8478
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8470
.L18414:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8470
	jmp	.L8476
.L18407:
	movq	8(%rax), %rbx
	jmp	.L8470
.L18406:
	cmpw	$47, %dx
	je	.L18415
.L8467:
	xorl	%ebp, %ebp
	jmp	.L8459
.L18415:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8467
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8467
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18416
	movq	24(%rbp), %rax
.L8465:
	cmpw	$67, (%rax)
	jne	.L8467
	cmpq	%rsi, %rcx
	jne	.L8467
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8459
.L18416:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8459
	jmp	.L8465
.L18405:
	movq	8(%rax), %rbp
	jmp	.L8459
.L8449:
	movq	832(%rsp), %rcx
	movq	840(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L8377
	movq	824(%rsp), %r13
	movl	$14, %r15d
	movq	8(%r13), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L8377
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L8377
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8381
	cmpw	$34, %ax
	je	.L8381
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8383
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18417
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18418
.L8383:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8394
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18419
	cmpw	$33, (%r14)
	je	.L18420
.L8402:
	xorl	%ebx, %ebx
.L8394:
	testq	%rbp, %rbp
	je	.L8381
	testq	%rbx, %rbx
	je	.L8381
	movzwl	(%rbp), %r13d
	movslq	%r13d,%r8
	cmpb	$60, rtx_class(%r8)
	je	.L18421
.L8405:
	xorl	%eax, %eax
.L8406:
	testl	%eax, %eax
	jne	.L18422
.L8381:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8407
	testb	$16, 3(%rax)
	je	.L8407
	cmpw	$36, (%rax)
	je	.L8407
.L8408:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8409
	testb	$16, 3(%rax)
	je	.L8409
	cmpw	$36, (%rax)
	je	.L8409
	movq	%rax, %rbx
	jmp	.L8408
.L8409:
	cmpq	%rbx, 1696(%rsp)
	je	.L8377
	movq	%rbx, %r14
.L8407:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8414
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r13,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r13d
	leaq	0(,%r13,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8418
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8419
	movl	$14, %r11d
.L8418:
	testl	%ebx, %ebx
	je	.L8424
	cmpl	%r11d, %r15d
	jge	.L8377
.L8414:
	testl	%ebx, %ebx
	je	.L8424
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8424
.L8442:
	cmpq	%r14, 8(%rdi)
	je	.L18423
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8442
.L8424:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L8377
	testl	%r15d, %r15d
	jne	.L8444
	movslq	8(%r14),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17236:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L8377:
	movq	824(%rsp), %rax
	movq	832(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 824(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r15
	movq	%r15, 832(%rsp)
	jne	.L8449
	jmp	.L16146
.L8444:
	cmpl	$14, %r15d
	je	.L16850
	cmpl	$15, %r15d
.L17657:
	jne	.L8377
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17235:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17236
.L16850:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17235
.L18423:
	testq	%r10, %r10
	je	.L8430
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18425
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17234:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8430:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r15d
	jge	.L8435
	movb	$14, 2(%rdi)
.L8435:
	testq	%r10, %r10
	je	.L8377
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16849
	cmpb	$14, %al
	je	.L16850
	cmpb	$15, %al
	jmp	.L17657
.L16849:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r13
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17236
.L18425:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17234
.L8419:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8421
	movl	$15, %r11d
	jmp	.L8418
.L8421:
	xorl	%ebx, %ebx
	jmp	.L8418
.L18422:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8381
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8377
	jmp	.L8381
.L18421:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L8405
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L8405
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%rbp)
	jne	.L8405
	movq	16(%rbx), %r11
	cmpq	%r11, 16(%rbp)
	jne	.L8405
	movl	$1, %eax
	jmp	.L8406
.L18420:
	cmpw	$47, %dx
	jne	.L8402
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8402
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8402
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18426
	movq	24(%rbx), %rax
.L8400:
	cmpw	$67, (%rax)
	jne	.L8402
	cmpq	%rsi, %rcx
	jne	.L8402
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8394
.L18426:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8394
	jmp	.L8400
.L18419:
	movq	8(%rax), %rbx
	jmp	.L8394
.L18418:
	cmpw	$47, %dx
	je	.L18427
.L8391:
	xorl	%ebp, %ebp
	jmp	.L8383
.L18427:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8391
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8391
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18428
	movq	24(%rbp), %rax
.L8389:
	cmpw	$67, (%rax)
	jne	.L8391
	cmpq	%rsi, %rcx
	jne	.L8391
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8383
.L18428:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8383
	jmp	.L8389
.L18417:
	movq	8(%rax), %rbp
	jmp	.L8383
.L17726:
	movq	1696(%rsp), %rdi
	movq	%rcx, %rsi
	movl	$14, %edx
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$8, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rdx
	movq	1696(%rsp), %rdi
	movq	%rdx, %rsi
	movl	$0, 32(%rdx)
	movl	$15, %edx
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rbp
	movq	%rax, 40(%rbp)
	movl	$1, 36(%rbp)
	jmp	.L8757
.L18391:
	movq	%r12, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r11b
	movq	%rax, 840(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r11b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	840(%rsp), %r9
	movq	8(%r9), %rdi
	call	cselib_subst_to_values
	movq	840(%rsp), %r14
	movq	%rax, 8(%r14)
	jmp	.L8357
.L18389:
	movl	8(%r12), %ebp
	cmpl	$52, %ebp
	jg	.L8240
	leal	-8(%rbp), %r9d
	cmpl	$7, %r9d
	jbe	.L8243
	leal	-21(%rbp), %esi
	cmpl	$7, %esi
	jbe	.L8243
	leal	-45(%rbp), %r13d
	cmpl	$7, %r13d
	jbe	.L8243
	leal	-29(%rbp), %r14d
	cmpl	$7, %r14d
	ja	.L8241
.L8243:
	movzbq	2(%r12), %r8
	movl	mode_class(,%r8,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17229:
	addl	$2, %eax
.L8242:
	cmpl	$47, %ebx
	je	.L18429
	movl	%eax, %ebx
	decl	%ebx
	js	.L8739
.L8269:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L8269
	jmp	.L8739
.L18429:
	movl	%eax, %ebx
	decl	%ebx
	js	.L8739
.L8264:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L8264
	jmp	.L8739
.L8241:
	movzbl	2(%r12), %eax
	cmpb	$18, %al
	je	.L18430
	cmpb	$24, %al
	je	.L18431
	movl	target_flags(%rip), %r15d
	testl	$33554432, %r15d
	movl	%r15d, %ecx
	je	.L8254
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r10d
	leal	7(%r10), %edx
.L8255:
	andl	$33554432, %ecx
	je	.L8256
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L8242
.L8256:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L8242
.L8254:
	movzbl	%al, %edi 
	movzbl	mode_size(%rdi), %r11d
	leal	3(%r11), %edx
	jmp	.L8255
.L18431:
	xorl	%r12d, %r12d
	testb	$2, target_flags+3(%rip)
	sete	%r12b
	leal	4(%r12,%r12), %eax
	jmp	.L8242
.L18430:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17229
.L8240:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %ebp
	jl	.L8271
	movq	1696(%rsp), %rbx
	movq	32(%rbx), %rax
.L17718:
	movzwl	(%rax), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L8739
	jmp	.L17570
.L8271:
	cmpl	$47, %ebx
	je	.L18432
	movq	reg_pending_clobbers(%rip), %rdi
.L17230:
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L16566
	movslq	%ebp,%rbx
	movq	reg_known_equiv_p(%rip), %rbp
	addq	%rbx, %rbp
	cmpb	$0, (%rbp)
	je	.L8276
	leaq	0(,%rbx,8), %r9
	addq	reg_known_value(%rip), %r9
	movq	(%r9), %rax
	cmpw	$66, (%rax)
	je	.L18433
.L8276:
	leaq	0(,%rbx,8), %r14
	addq	reg_n_info(%rip), %r14
	movq	32(%r14), %r13
	movl	32(%r13), %esi
	testl	%esi, %esi
	jne	.L8739
	movq	1704(%rsp), %r8
	movq	48(%r8), %r15
	testq	%r15, %r15
	je	.L8739
	movl	$14, %r14d
.L8353:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L8280
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L8280
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8285
	cmpw	$34, %ax
	je	.L8285
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8287
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18434
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18435
.L8287:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8298
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18436
	cmpw	$33, (%r13)
	je	.L18437
.L8306:
	xorl	%ebx, %ebx
.L8298:
	testq	%rbp, %rbp
	je	.L8285
	testq	%rbx, %rbx
	je	.L8285
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r10
	cmpb	$60, rtx_class(%r10)
	je	.L18438
.L8309:
	xorl	%eax, %eax
.L8310:
	testl	%eax, %eax
	jne	.L18439
.L8285:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8311
	testb	$16, 3(%rax)
	je	.L8311
	cmpw	$36, (%rax)
	je	.L8311
.L8312:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8313
	testb	$16, 3(%rax)
	je	.L8313
	cmpw	$36, (%rax)
	je	.L8313
	movq	%rax, %rbx
	jmp	.L8312
.L8313:
	cmpq	%rbx, 1696(%rsp)
	je	.L8280
	movq	%rbx, %r13
.L8311:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8318
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8322
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8323
	movl	$14, %r11d
.L8322:
	testl	%ebx, %ebx
	je	.L8328
	cmpl	%r11d, %r14d
	jge	.L8280
.L8318:
	testl	%ebx, %ebx
	je	.L8328
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8328
.L8346:
	cmpq	%r13, 8(%rdi)
	je	.L18440
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8346
.L8328:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L8280
	testl	%r14d, %r14d
	jne	.L8348
	movslq	8(%r13),%rbp
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%rbp,%rbp,2), %r9
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r9
	salq	$4, %rdx
	movl	16(%r9,%r11), %ecx
	movslq	16(%rdx,%r11),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17233:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L8280:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L8353
	jmp	.L8739
.L8348:
	cmpl	$14, %r14d
	je	.L16848
	cmpl	$15, %r14d
.L17656:
	jne	.L8280
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17232:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17233
.L16848:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%rbp
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17232
.L18440:
	testq	%r10, %r10
	je	.L8334
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18442
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17231:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8334:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L8339
	movb	$14, 2(%rdi)
.L8339:
	testq	%r10, %r10
	je	.L8280
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16847
	cmpb	$14, %al
	je	.L16848
	cmpb	$15, %al
	jmp	.L17656
.L16847:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%r11
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbx), %ecx
	leaq	(%r11,%r11,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rbx),%r12
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17233
.L18442:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17231
.L8323:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8325
	movl	$15, %r11d
	jmp	.L8322
.L8325:
	xorl	%ebx, %ebx
	jmp	.L8322
.L18439:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8285
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8280
	jmp	.L8285
.L18438:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L8309
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L8309
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L8309
	movq	16(%rbx), %r11
	cmpq	%r11, 16(%rbp)
	jne	.L8309
	movl	$1, %eax
	jmp	.L8310
.L18437:
	cmpw	$47, %dx
	jne	.L8306
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8306
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8306
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18443
	movq	24(%rbx), %rax
.L8304:
	cmpw	$67, (%rax)
	jne	.L8306
	cmpq	%rsi, %rcx
	jne	.L8306
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8298
.L18443:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8298
	jmp	.L8304
.L18436:
	movq	8(%rax), %rbx
	jmp	.L8298
.L18435:
	cmpw	$47, %dx
	je	.L18444
.L8295:
	xorl	%ebp, %ebp
	jmp	.L8287
.L18444:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8295
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8295
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18445
	movq	24(%rbp), %rax
.L8293:
	cmpw	$67, (%rax)
	jne	.L8295
	cmpq	%rsi, %rcx
	jne	.L8295
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8287
.L18445:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8287
	jmp	.L8293
.L18434:
	movq	8(%rax), %rbp
	jmp	.L8287
.L18433:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L8276
.L16566:
	movslq	%ebp,%rbx
	jmp	.L8276
.L18432:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17230
	.p2align 6,,7
.L18388:
	movq	1704(%rsp), %rdi
	movq	16(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	24(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L8237
.L18387:
	cmpw	$133, %dx
	je	.L8238
	cmpw	$132, %dx
	jne	.L16140
	jmp	.L8238
.L18386:
	movq	8(%r12), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L16138
.L8232:
	movslq	%ebx,%r15
	movq	8(%rdx,%r15,8), %rcx
	movq	8(%rcx), %rdx
	testq	%rdx, %rdx
	jne	.L18446
.L8229:
	decl	%ebx
	js	.L16138
	movq	8(%r12), %rdx
	jmp	.L8232
.L16138:
	movq	1616(%rsp), %rdx
	cmpw	$47, (%rdx)
	jne	.L3412
	movq	1704(%rsp), %rdi
	movq	16(%rdx), %rsi
	jmp	.L17257
	.p2align 6,,7
.L18446:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L8229
.L8607:
	movq	1616(%rsp), %r10
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	8(%r10), %rsi
	call	sched_analyze_2
	movq	1616(%rsp), %r12
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	16(%r12), %rsi
	call	sched_analyze_2
	movq	1616(%rsp), %r15
	movq	8(%r15), %r12
	movzwl	(%r15), %ebx
	testq	%r12, %r12
	je	.L3412
	movzwl	(%r12), %edx
	cmpw	$39, %dx
	je	.L18447
	leal	-63(%rdx), %esi
	cmpw	$1, %si
	ja	.L18448
.L8622:
	leal	-132(%rdx), %ecx
	cmpw	$1, %cx
	jbe	.L18449
.L8621:
	movq	8(%r12), %r12
	movzwl	(%r12), %edx
	leal	-63(%rdx), %r14d
	cmpw	$1, %r14w
	jbe	.L8622
	cmpw	$133, %dx
	je	.L8622
	cmpw	$132, %dx
	je	.L8622
.L16157:
	cmpw	$61, %dx
	je	.L18450
	cmpw	$66, %dx
	jne	.L8739
	movq	current_sched_info(%rip), %r15
	movq	%r12, 792(%rsp)
	testb	$2, 96(%r15)
	jne	.L18451
.L8741:
	movq	compiler_params(%rip), %r10
	movq	1704(%rsp), %rcx
	movl	80(%r10), %eax
	cmpl	%eax, 32(%rcx)
	jg	.L17726
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %r8
	movq	(%rax), %rsi
	movq	8(%r8), %r13
	testq	%rsi, %rsi
	movq	%rsi, 776(%rsp)
	movq	%r13, 784(%rsp)
	jne	.L8833
.L16163:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %rbx
	movq	24(%r11), %r9
	testq	%rbx, %rbx
	movq	%rbx, 760(%rsp)
	movq	%r9, 768(%rsp)
	jne	.L8909
.L16166:
	movq	1704(%rsp), %r9
	movq	40(%r9), %r10
	testq	%r10, %r10
	movq	%r10, 752(%rsp)
	je	.L16169
	movl	$14, %r15d
.L8985:
	movq	752(%rsp), %r11
	movq	8(%r11), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L8912
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L8912
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8917
	cmpw	$34, %ax
	je	.L8917
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8919
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18452
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18453
.L8919:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8930
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18454
	cmpw	$33, (%r14)
	je	.L18455
.L8938:
	xorl	%ebx, %ebx
.L8930:
	testq	%rbp, %rbp
	je	.L8917
	testq	%rbx, %rbx
	je	.L8917
	movzwl	(%rbp), %r13d
	movslq	%r13d,%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18456
.L8941:
	xorl	%eax, %eax
.L8942:
	testl	%eax, %eax
	jne	.L18457
.L8917:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8943
	testb	$16, 3(%rax)
	je	.L8943
	cmpw	$36, (%rax)
	je	.L8943
.L8944:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8945
	testb	$16, 3(%rax)
	je	.L8945
	cmpw	$36, (%rax)
	je	.L8945
	movq	%rax, %rbx
	jmp	.L8944
.L8945:
	cmpq	%rbx, 1696(%rsp)
	je	.L8912
	movq	%rbx, %r14
.L8943:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8950
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r13,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r13d
	leaq	0(,%r13,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8954
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8955
	movl	$14, %r11d
.L8954:
	testl	%ebx, %ebx
	je	.L8960
	cmpl	%r11d, %r15d
	jge	.L8912
.L8950:
	testl	%ebx, %ebx
	je	.L8960
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8960
.L8978:
	cmpq	%r14, 8(%rdi)
	je	.L18458
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8978
.L8960:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L8912
	testl	%r15d, %r15d
	jne	.L8980
	movslq	8(%r14),%rbp
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%rbp,%rbp,2), %r9
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r9
	salq	$4, %rdx
	movl	16(%r9,%r11), %ecx
	movslq	16(%rdx,%r11),%rdi
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17256:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L8912:
	movq	752(%rsp), %r11
	movq	16(%r11), %r9
	testq	%r9, %r9
	movq	%r9, 752(%rsp)
	jne	.L8985
	jmp	.L16169
.L8980:
	cmpl	$14, %r15d
	je	.L16862
	cmpl	$15, %r15d
.L17663:
	jne	.L8912
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17255:
	movslq	8(%r14),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17256
.L16862:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%rbp
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17255
.L18458:
	testq	%r10, %r10
	je	.L8966
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18460
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17254:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8966:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r15d
	jge	.L8971
	movb	$14, 2(%rdi)
.L8971:
	testq	%r10, %r10
	je	.L8912
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16861
	cmpb	$14, %al
	je	.L16862
	cmpb	$15, %al
	jmp	.L17663
.L16861:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdi
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%r11
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbx), %ecx
	leaq	(%r11,%r11,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rbx),%r13
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17256
.L18460:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17254
.L8955:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8957
	movl	$15, %r11d
	jmp	.L8954
.L8957:
	xorl	%ebx, %ebx
	jmp	.L8954
.L18457:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8917
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8912
	jmp	.L8917
.L18456:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L8941
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L8941
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%rbp)
	jne	.L8941
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%rbp)
	jne	.L8941
	movl	$1, %eax
	jmp	.L8942
.L18455:
	cmpw	$47, %dx
	jne	.L8938
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8938
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8938
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18461
	movq	24(%rbx), %rax
.L8936:
	cmpw	$67, (%rax)
	jne	.L8938
	cmpq	%rsi, %rcx
	jne	.L8938
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8930
.L18461:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8930
	jmp	.L8936
.L18454:
	movq	8(%rax), %rbx
	jmp	.L8930
.L18453:
	cmpw	$47, %dx
	je	.L18462
.L8927:
	xorl	%ebp, %ebp
	jmp	.L8919
.L18462:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8927
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8927
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18463
	movq	24(%rbp), %rax
.L8925:
	cmpw	$67, (%rax)
	jne	.L8927
	cmpq	%rsi, %rcx
	jne	.L8927
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8919
.L18463:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8919
	jmp	.L8925
.L18452:
	movq	8(%rax), %rbp
	jmp	.L8919
.L8909:
	movq	768(%rsp), %r13
	movq	792(%rsp), %rsi
	movq	8(%r13), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L8837
	movq	760(%rsp), %rbp
	movl	$15, %r15d
	movq	8(%rbp), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L8837
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L8837
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8841
	cmpw	$34, %ax
	je	.L8841
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8843
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18464
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18465
.L8843:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8854
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18466
	cmpw	$33, (%r14)
	je	.L18467
.L8862:
	xorl	%ebx, %ebx
.L8854:
	testq	%rbp, %rbp
	je	.L8841
	testq	%rbx, %rbx
	je	.L8841
	movzwl	(%rbp), %r13d
	movslq	%r13d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18468
.L8865:
	xorl	%eax, %eax
.L8866:
	testl	%eax, %eax
	jne	.L18469
.L8841:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8867
	testb	$16, 3(%rax)
	je	.L8867
	cmpw	$36, (%rax)
	je	.L8867
.L8868:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8869
	testb	$16, 3(%rax)
	je	.L8869
	cmpw	$36, (%rax)
	je	.L8869
	movq	%rax, %rbx
	jmp	.L8868
.L8869:
	cmpq	%rbx, 1696(%rsp)
	je	.L8837
	movq	%rbx, %r14
.L8867:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8874
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r13,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r13d
	leaq	0(,%r13,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8878
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8879
	movl	$14, %r11d
.L8878:
	testl	%ebx, %ebx
	je	.L8884
	cmpl	%r11d, %r15d
	jge	.L8837
.L8874:
	testl	%ebx, %ebx
	je	.L8884
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8884
.L8902:
	cmpq	%r14, 8(%rdi)
	je	.L18470
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8902
.L8884:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L8837
	testl	%r15d, %r15d
	jne	.L8904
	movslq	8(%r14),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17253:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L8837:
	movq	760(%rsp), %rax
	movq	768(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 760(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r15
	movq	%r15, 768(%rsp)
	jne	.L8909
	jmp	.L16166
.L8904:
	cmpl	$14, %r15d
	je	.L16860
	cmpl	$15, %r15d
.L17662:
	jne	.L8837
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17252:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17253
.L16860:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17252
.L18470:
	testq	%r10, %r10
	je	.L8890
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18472
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17251:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8890:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r15d
	jge	.L8895
	movb	$15, 2(%rdi)
.L8895:
	testq	%r10, %r10
	je	.L8837
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16859
	cmpb	$14, %al
	je	.L16860
	cmpb	$15, %al
	jmp	.L17662
.L16859:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r13
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17253
.L18472:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17251
.L8879:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8881
	movl	$15, %r11d
	jmp	.L8878
.L8881:
	xorl	%ebx, %ebx
	jmp	.L8878
.L18469:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8841
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8837
	jmp	.L8841
.L18468:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L8865
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L8865
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L8865
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L8865
	movl	$1, %eax
	jmp	.L8866
.L18467:
	cmpw	$47, %dx
	jne	.L8862
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8862
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8862
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18473
	movq	24(%rbx), %rax
.L8860:
	cmpw	$67, (%rax)
	jne	.L8862
	cmpq	%rsi, %rcx
	jne	.L8862
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8854
.L18473:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8854
	jmp	.L8860
.L18466:
	movq	8(%rax), %rbx
	jmp	.L8854
.L18465:
	cmpw	$47, %dx
	je	.L18474
.L8851:
	xorl	%ebp, %ebp
	jmp	.L8843
.L18474:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8851
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8851
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18475
	movq	24(%rbp), %rax
.L8849:
	cmpw	$67, (%rax)
	jne	.L8851
	cmpq	%rsi, %rcx
	jne	.L8851
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8843
.L18475:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8843
	jmp	.L8849
.L18464:
	movq	8(%rax), %rbp
	jmp	.L8843
.L8833:
	movq	784(%rsp), %rcx
	movq	792(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L8761
	movq	776(%rsp), %rbx
	movl	$14, %r15d
	movq	8(%rbx), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L8761
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L8761
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8765
	cmpw	$34, %ax
	je	.L8765
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8767
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18476
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18477
.L8767:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8778
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18478
	cmpw	$33, (%r14)
	je	.L18479
.L8786:
	xorl	%ebx, %ebx
.L8778:
	testq	%rbp, %rbp
	je	.L8765
	testq	%rbx, %rbx
	je	.L8765
	movzwl	(%rbp), %r13d
	movslq	%r13d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L18480
.L8789:
	xorl	%eax, %eax
.L8790:
	testl	%eax, %eax
	jne	.L18481
.L8765:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8791
	testb	$16, 3(%rax)
	je	.L8791
	cmpw	$36, (%rax)
	je	.L8791
.L8792:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8793
	testb	$16, 3(%rax)
	je	.L8793
	cmpw	$36, (%rax)
	je	.L8793
	movq	%rax, %rbx
	jmp	.L8792
.L8793:
	cmpq	%rbx, 1696(%rsp)
	je	.L8761
	movq	%rbx, %r14
.L8791:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8798
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%rbp
	movl	16(%rcx,%r13), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8802
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8803
	movl	$14, %r11d
.L8802:
	testl	%ebx, %ebx
	je	.L8808
	cmpl	%r11d, %r15d
	jge	.L8761
.L8798:
	testl	%ebx, %ebx
	je	.L8808
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8808
.L8826:
	cmpq	%r14, 8(%rdi)
	je	.L18482
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8826
.L8808:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L8761
	testl	%r15d, %r15d
	jne	.L8828
	movslq	8(%r14),%r9
	movslq	8(%rdx),%r13
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r13,%r13,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17250:
	andl	$63, %ecx
	movl	$1, %r15d
	salq	%cl, %r15
	orq	%r15, 16(%rax)
.L8761:
	movq	776(%rsp), %rax
	movq	784(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 776(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 784(%rsp)
	jne	.L8833
	jmp	.L16163
.L8828:
	cmpl	$14, %r15d
	je	.L16858
	cmpl	$15, %r15d
.L17661:
	jne	.L8761
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r13
	leaq	(%r13,%r13,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17249:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17250
.L16858:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17249
.L18482:
	testq	%r10, %r10
	je	.L8814
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18484
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r13), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r13),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17248:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8814:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r15d
	jge	.L8819
	movb	$14, 2(%rdi)
.L8819:
	testq	%r10, %r10
	je	.L8761
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16857
	cmpb	$14, %al
	je	.L16858
	cmpb	$15, %al
	jmp	.L17661
.L16857:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17250
.L18484:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbp
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%r9
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17248
.L8803:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8805
	movl	$15, %r11d
	jmp	.L8802
.L8805:
	xorl	%ebx, %ebx
	jmp	.L8802
.L18481:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8765
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8761
	jmp	.L8765
.L18480:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L8789
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L8789
	movq	8(%rbx), %r11
	cmpq	%r11, 8(%rbp)
	jne	.L8789
	movq	16(%rbx), %r10
	cmpq	%r10, 16(%rbp)
	jne	.L8789
	movl	$1, %eax
	jmp	.L8790
.L18479:
	cmpw	$47, %dx
	jne	.L8786
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8786
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8786
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18485
	movq	24(%rbx), %rax
.L8784:
	cmpw	$67, (%rax)
	jne	.L8786
	cmpq	%rsi, %rcx
	jne	.L8786
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8778
.L18485:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8778
	jmp	.L8784
.L18478:
	movq	8(%rax), %rbx
	jmp	.L8778
.L18477:
	cmpw	$47, %dx
	je	.L18486
.L8775:
	xorl	%ebp, %ebp
	jmp	.L8767
.L18486:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8775
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8775
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18487
	movq	24(%rbp), %rax
.L8773:
	cmpw	$67, (%rax)
	jne	.L8775
	cmpq	%rsi, %rcx
	jne	.L8775
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8767
.L18487:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8767
	jmp	.L8773
.L18476:
	movq	8(%rax), %rbp
	jmp	.L8767
.L18451:
	movq	%r12, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r11b
	movq	%rax, 792(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r11b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	792(%rsp), %r9
	movq	8(%r9), %rdi
	call	cselib_subst_to_values
	movq	792(%rsp), %r14
	movq	%rax, 8(%r14)
	jmp	.L8741
.L18450:
	movl	8(%r12), %ebp
	cmpl	$52, %ebp
	jg	.L8624
	leal	-8(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L8627
	leal	-21(%rbp), %r8d
	cmpl	$7, %r8d
	jbe	.L8627
	leal	-45(%rbp), %edi
	cmpl	$7, %edi
	jbe	.L8627
	leal	-29(%rbp), %r9d
	cmpl	$7, %r9d
	ja	.L8625
.L8627:
	movzbq	2(%r12), %r11
	movl	mode_class(,%r11,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17243:
	addl	$2, %eax
.L8626:
	cmpl	$47, %ebx
	je	.L18488
	movl	%eax, %ebx
	decl	%ebx
	js	.L8739
.L8653:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L8653
	jmp	.L8739
.L18488:
	movl	%eax, %ebx
	decl	%ebx
	js	.L8739
.L8648:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L8648
	jmp	.L8739
.L8625:
	movzbl	2(%r12), %eax
	cmpb	$18, %al
	je	.L18489
	cmpb	$24, %al
	je	.L18490
	movl	target_flags(%rip), %r12d
	testl	$33554432, %r12d
	movl	%r12d, %ecx
	je	.L8638
	movzbl	%al, %r13d 
	movzbl	mode_size(%r13), %r10d
	leal	7(%r10), %edx
.L8639:
	andl	$33554432, %ecx
	je	.L8640
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L8626
.L8640:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L8626
.L8638:
	movzbl	%al, %r14d 
	movzbl	mode_size(%r14), %esi
	leal	3(%rsi), %edx
	jmp	.L8639
.L18490:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L8626
.L18489:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17243
.L8624:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %ebp
	jl	.L8655
	movq	1696(%rsp), %rbx
	movq	32(%rbx), %rax
	jmp	.L17718
.L8655:
	cmpl	$47, %ebx
	je	.L18491
	movq	reg_pending_clobbers(%rip), %rdi
.L17244:
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L16576
	movslq	%ebp,%rbx
	movq	reg_known_equiv_p(%rip), %rbp
	addq	%rbx, %rbp
	cmpb	$0, (%rbp)
	je	.L8660
	leaq	0(,%rbx,8), %rdx
	addq	reg_known_value(%rip), %rdx
	movq	(%rdx), %rax
	cmpw	$66, (%rax)
	je	.L18492
.L8660:
	leaq	0(,%rbx,8), %rdi
	addq	reg_n_info(%rip), %rdi
	movq	32(%rdi), %r8
	movl	32(%r8), %eax
	testl	%eax, %eax
	jne	.L8739
	movq	1704(%rsp), %r9
	movq	48(%r9), %r15
	testq	%r15, %r15
	je	.L8739
	movl	$14, %r14d
.L8737:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L8664
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L8664
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L8669
	cmpw	$34, %ax
	je	.L8669
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L8671
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18493
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18494
.L8671:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L8682
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18495
	cmpw	$33, (%r13)
	je	.L18496
.L8690:
	xorl	%ebx, %ebx
.L8682:
	testq	%rbp, %rbp
	je	.L8669
	testq	%rbx, %rbx
	je	.L8669
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r11
	cmpb	$60, rtx_class(%r11)
	je	.L18497
.L8693:
	xorl	%eax, %eax
.L8694:
	testl	%eax, %eax
	jne	.L18498
.L8669:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L8695
	testb	$16, 3(%rax)
	je	.L8695
	cmpw	$36, (%rax)
	je	.L8695
.L8696:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L8697
	testb	$16, 3(%rax)
	je	.L8697
	cmpw	$36, (%rax)
	je	.L8697
	movq	%rax, %rbx
	jmp	.L8696
.L8697:
	cmpq	%rbx, 1696(%rsp)
	je	.L8664
	movq	%rbx, %r13
.L8695:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L8702
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L8706
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8707
	movl	$14, %r11d
.L8706:
	testl	%ebx, %ebx
	je	.L8712
	cmpl	%r11d, %r14d
	jge	.L8664
.L8702:
	testl	%ebx, %ebx
	je	.L8712
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8712
.L8730:
	cmpq	%r13, 8(%rdi)
	je	.L18499
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L8730
.L8712:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L8664
	testl	%r14d, %r14d
	jne	.L8732
	movslq	8(%r13),%rbp
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%rbp,%rbp,2), %r9
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r9
	salq	$4, %rdx
	movl	16(%r9,%r11), %ecx
	movslq	16(%rdx,%r11),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17247:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L8664:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L8737
	jmp	.L8739
.L8732:
	cmpl	$14, %r14d
	je	.L16856
	cmpl	$15, %r14d
.L17660:
	jne	.L8664
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17246:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17247
.L16856:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%rbp
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17246
.L18499:
	testq	%r10, %r10
	je	.L8718
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18501
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17245:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L8718:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L8723
	movb	$14, 2(%rdi)
.L8723:
	testq	%r10, %r10
	je	.L8664
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16855
	cmpb	$14, %al
	je	.L16856
	cmpb	$15, %al
	jmp	.L17660
.L16855:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%r11
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbx), %ecx
	leaq	(%r11,%r11,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rbx),%r12
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17247
.L18501:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17245
.L8707:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L8709
	movl	$15, %r11d
	jmp	.L8706
.L8709:
	xorl	%ebx, %ebx
	jmp	.L8706
.L18498:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L8669
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L8664
	jmp	.L8669
.L18497:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L8693
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L8693
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L8693
	movq	16(%rbx), %rsi
	cmpq	%rsi, 16(%rbp)
	jne	.L8693
	movl	$1, %eax
	jmp	.L8694
.L18496:
	cmpw	$47, %dx
	jne	.L8690
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8690
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8690
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18502
	movq	24(%rbx), %rax
.L8688:
	cmpw	$67, (%rax)
	jne	.L8690
	cmpq	%rsi, %rcx
	jne	.L8690
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L8682
.L18502:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L8682
	jmp	.L8688
.L18495:
	movq	8(%rax), %rbx
	jmp	.L8682
.L18494:
	cmpw	$47, %dx
	je	.L18503
.L8679:
	xorl	%ebp, %ebp
	jmp	.L8671
.L18503:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L8679
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L8679
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18504
	movq	24(%rbp), %rax
.L8677:
	cmpw	$67, (%rax)
	jne	.L8679
	cmpq	%rsi, %rcx
	jne	.L8679
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L8671
.L18504:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L8671
	jmp	.L8677
.L18493:
	movq	8(%rax), %rbp
	jmp	.L8671
.L18492:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L8660
.L16576:
	movslq	%ebp,%rbx
	jmp	.L8660
.L18491:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17244
	.p2align 6,,7
.L18449:
	movq	1704(%rsp), %rdi
	movq	16(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	24(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L8621
.L18448:
	cmpw	$133, %dx
	je	.L8622
	cmpw	$132, %dx
	jne	.L16157
	jmp	.L8622
.L18447:
	movq	8(%r12), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L16155
.L8616:
	movslq	%ebx,%r13
	movq	8(%rdx,%r13,8), %rbp
	movq	8(%rbp), %rdx
	testq	%rdx, %rdx
	jne	.L18505
.L8613:
	decl	%ebx
	js	.L16155
	movq	8(%r12), %rdx
	jmp	.L8616
.L16155:
	movq	1616(%rsp), %rax
	cmpw	$47, (%rax)
	jne	.L3412
	movq	1704(%rsp), %rdi
	movq	16(%rax), %rsi
	jmp	.L17257
	.p2align 6,,7
.L18505:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L8613
.L17733:
	movq	1616(%rsp), %r15
	movq	8(%r15), %rdx
	movl	(%rdx), %eax
	decl	%eax
	movl	%eax, 1436(%rsp)
	js	.L3412
.L7916:
	movslq	1436(%rsp),%r14
	movq	8(%rdx,%r14,8), %r9
	movq	%r9, 1624(%rsp)
	movzwl	(%r9), %eax
	movzwl	%ax, %edx
	cmpl	$38, %edx
	je	.L18506
.L3418:
	cmpl	$47, %edx
	je	.L4507
	cmpl	$49, %edx
	je	.L4507
	movzwl	%ax, %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L6831
	mov	%eax, %r15d
	jmp	*.L7902(,%r15,8)
	.section	.rodata
	.align 8
	.align 4
.L7902:
	.quad	.L7122
	.quad	.L7122
	.quad	.L6831
	.quad	.L7122
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L7109
	.quad	.L6831
	.quad	.L3416
	.quad	.L3416
	.quad	.L3416
	.quad	.L6831
	.quad	.L3416
	.quad	.L6831
	.quad	.L6831
	.quad	.L6838
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6869
	.quad	.L3416
	.quad	.L3416
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L6831
	.quad	.L7134
	.quad	.L7134
	.quad	.L7134
	.quad	.L7134
	.quad	.L7518
	.quad	.L7518
	.text
.L6838:
	movq	1624(%rsp), %rbx
	movl	8(%rbx), %ebp
	cmpl	$52, %ebp
	jg	.L6839
	leal	-8(%rbp), %r9d
	cmpl	$7, %r9d
	jbe	.L6842
	leal	-21(%rbp), %r14d
	cmpl	$7, %r14d
	jbe	.L6842
	leal	-45(%rbp), %r12d
	cmpl	$7, %r12d
	jbe	.L6842
	leal	-29(%rbp), %r8d
	cmpl	$7, %r8d
	ja	.L6840
.L6842:
	movq	1624(%rsp), %rax
	movzbq	2(%rax), %rcx
	movl	mode_class(,%rcx,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17177:
	addl	$2, %eax
.L6841:
	movl	%eax, %ebx
	decl	%ebx
	js	.L3416
.L6862:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L6862
.L3416:
	decl	1436(%rsp)
	js	.L3412
	movq	1616(%rsp), %rbx
	movq	8(%rbx), %rdx
	jmp	.L7916
.L6840:
	movq	1624(%rsp), %r13
	movzbl	2(%r13), %eax
	cmpb	$18, %al
	je	.L18508
	cmpb	$24, %al
	je	.L18509
	movl	target_flags(%rip), %esi
	testl	$33554432, %esi
	movl	%esi, %ecx
	je	.L6853
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r10d
	leal	7(%r10), %edx
.L6854:
	andl	$33554432, %ecx
	je	.L6855
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L6841
.L6855:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L6841
.L6853:
	movzbl	%al, %r15d 
	movzbl	mode_size(%r15), %r11d
	leal	3(%r11), %edx
	jmp	.L6854
.L18509:
	xorl	%edi, %edi
	testb	$2, target_flags+3(%rip)
	sete	%dil
	leal	4(%rdi,%rdi), %eax
	jmp	.L6841
.L18508:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17177
	.p2align 6,,7
.L6839:
	movq	1704(%rsp), %rbx
	cmpl	68(%rbx), %ebp
	jl	.L6864
	movq	1696(%rsp), %rbp
	movq	32(%rbp), %rax
.L17689:
	movzwl	(%rax), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L3416
	jmp	.L17569
.L6864:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L16530
	movq	reg_known_equiv_p(%rip), %r14
	movslq	%ebp,%rbx
	addq	%rbx, %r14
	cmpb	$0, (%r14)
	je	.L6867
	leaq	0(,%rbx,8), %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rax
	cmpw	$66, (%rax)
	je	.L18510
.L6867:
	leaq	0(,%rbx,8), %r13
	addq	reg_n_info(%rip), %r13
	movq	32(%r13), %rcx
	movl	32(%rcx), %r8d
	testl	%r8d, %r8d
	jne	.L3416
	movq	1704(%rsp), %rax
	movq	1696(%rsp), %rdi
	movq	56(%rax), %rsi
.L17218:
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rdi
	movq	%rax, 56(%rdi)
	jmp	.L3416
.L18510:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L6867
.L16530:
	movslq	%ebp,%rbx
	jmp	.L6867
	.p2align 6,,7
.L7122:
	cmpl	$41, %ebx
	je	.L18511
.L7124:
	movb	$1, reg_pending_barrier(%rip)
.L7123:
	cmpl	$41, %ebx
	je	.L18512
.L6831:
	movslq	%ebx,%rdx
	movzbl	rtx_length(%rdx), %ebp
	movq	rtx_format(,%rdx,8), %r13
	movl	%ebp, %r12d
	decl	%r12d
	js	.L3416
	movq	1624(%rsp), %r14
	addq	$8, %r14
.L7915:
	movslq	%r12d,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18513
	cmpb	$69, %dl
	je	.L18514
.L7905:
	decl	%r12d
	jns	.L7915
	jmp	.L3416
.L18514:
	movq	1624(%rsp), %r8
	xorl	%ebx, %ebx
	leaq	8(%r8,%rax,8), %rdx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L7905
	movq	%rdx, %rbp
.L7914:
	movq	(%rbp), %r9
	movslq	%ebx,%r11
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %r9
	movq	(%r9,%r11,8), %rsi
	call	sched_analyze_2
	movq	(%rbp), %rcx
	cmpl	(%rcx), %ebx
	jl	.L7914
	jmp	.L7905
.L18513:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L7905
.L18512:
	movq	1624(%rsp), %r13
	xorl	%ebx, %ebx
	movq	32(%r13), %rdx
	cmpl	(%rdx), %ebx
	jge	.L3416
.L7130:
	movslq	%ebx,%r12
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r12,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1624(%rsp), %r14
	movq	32(%r14), %rbp
	cmpl	(%rbp), %ebx
	movq	%rbp, %rdx
	jl	.L7130
	jmp	.L3416
	.p2align 6,,7
.L18511:
	movq	1624(%rsp), %rsi
	testb	$8, 3(%rsi)
	je	.L7123
	jmp	.L7124
.L7109:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r11, %rsi
	movl	$0, 32(%r11)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rdi
	movq	%rax, 40(%rdi)
	movl	$1, 36(%rdi)
	jmp	.L6831
.L6869:
	movq	current_sched_info(%rip), %rsi
	movq	1624(%rsp), %r15
	testb	$2, 96(%rsi)
	jne	.L18515
.L6870:
	movq	1704(%rsp), %rbp
	movq	1704(%rsp), %rbx
	movq	(%rbp), %rdx
	movq	8(%rbx), %r11
	testq	%rdx, %rdx
	movq	%rdx, 1256(%rsp)
	movq	%r11, 1264(%rsp)
	jne	.L6950
.L16081:
	movq	1704(%rsp), %rbp
	movq	1704(%rsp), %r9
	movq	16(%rbp), %r10
	movq	24(%r9), %rbx
	testq	%r10, %r10
	movq	%r10, 1240(%rsp)
	movq	%rbx, 1248(%rsp)
	jne	.L7026
.L16084:
	movq	1704(%rsp), %rcx
	movq	40(%rcx), %r15
	testq	%r15, %r15
	movq	%r15, 1232(%rsp)
	je	.L16087
.L7106:
	movq	1232(%rsp), %rbx
	movq	8(%rbx), %r14
	cmpw	$33, (%r14)
	je	.L18516
.L7032:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	movl	$14, %r15d
	je	.L7029
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L7029
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7038
	cmpw	$34, %ax
	je	.L7038
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L7040
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18517
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18518
.L7040:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7051
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18519
	cmpw	$33, (%r14)
	je	.L18520
.L7059:
	xorl	%ebx, %ebx
.L7051:
	testq	%rbp, %rbp
	je	.L7038
	testq	%rbx, %rbx
	je	.L7038
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18521
.L7062:
	xorl	%eax, %eax
.L7063:
	testl	%eax, %eax
	jne	.L18522
.L7038:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7064
	testb	$16, 3(%rax)
	je	.L7064
	cmpw	$36, (%rax)
	je	.L7064
.L7065:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7066
	testb	$16, 3(%rax)
	je	.L7066
	cmpw	$36, (%rax)
	je	.L7066
	movq	%rax, %rbx
	jmp	.L7065
.L7066:
	cmpq	%rbx, 1696(%rsp)
	je	.L7029
	movq	%rbx, %r13
.L7064:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L7071
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rbp), %edx
	leaq	(%r12,%r12,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rbp),%rcx
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	leaq	0(,%rcx,8), %rdi
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L7075
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7076
	movl	$14, %r11d
.L7075:
	testl	%ebx, %ebx
	je	.L7081
	cmpl	%r11d, %r15d
	jge	.L7029
.L7071:
	testl	%ebx, %ebx
	je	.L7081
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7081
.L7099:
	cmpq	%r13, 8(%rdi)
	je	.L18523
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7099
.L7081:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L7029
	testl	%r15d, %r15d
	jne	.L7101
	movslq	8(%r13),%rsi
	movslq	8(%rdx),%r11
	movq	h_i_d(%rip), %rbx
	leaq	(%rsi,%rsi,2), %rdi
	leaq	(%r11,%r11,2), %r9
	salq	$4, %rdi
	salq	$4, %r9
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r9,%rbx),%r15
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17186:
	andl	$63, %ecx
	movl	$1, %r12d
	salq	%cl, %r12
	orq	%r12, 16(%rax)
.L7029:
	movq	1232(%rsp), %rdx
	movq	16(%rdx), %r8
	testq	%r8, %r8
	movq	%r8, 1232(%rsp)
	jne	.L7106
.L16087:
	movq	1704(%rsp), %r10
	movq	1696(%rsp), %rdi
	movq	1624(%rsp), %rbx
	movq	(%r10), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %rcx
	movq	1704(%rsp), %r15
	movq	%rax, (%r15)
	testb	$2, 96(%rcx)
	jne	.L18524
.L7107:
	movq	1704(%rsp), %r9
	movq	%rbx, %rsi
	xorl	%edi, %edi
	movq	8(%r9), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %rbx
	movq	%rax, 8(%rbx)
	incl	32(%rbx)
	movq	%rbx, %rdi
	movq	1624(%rsp), %rax
	movq	8(%rax), %rsi
.L17215:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L3416
.L18524:
	movq	1624(%rsp), %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L7107
.L7101:
	cmpl	$14, %r15d
	je	.L16824
	cmpl	$15, %r15d
.L17643:
	jne	.L7029
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17185:
	movslq	8(%r13),%r14
	leaq	(%r14,%r14,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17186
.L16824:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%rdi
	leaq	(%rdi,%rdi,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17185
.L18523:
	testq	%r10, %r10
	je	.L7087
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18526
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r11
	movslq	8(%r12),%rdx
	leaq	(%rbp,%rbp,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r11), %ecx
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r11),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17184:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7087:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r15d
	jge	.L7092
	movb	$14, 2(%rdi)
.L7092:
	testq	%r10, %r10
	je	.L7029
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16823
	cmpb	$14, %al
	je	.L16824
	cmpb	$15, %al
	jmp	.L17643
.L16823:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%r15
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %r12
	leaq	(%r15,%r15,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r8),%rbp
	movl	16(%r12,%r8), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17186
.L18526:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r14,%rbp), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17184
	.p2align 6,,7
.L7076:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7078
	movl	$15, %r11d
	jmp	.L7075
.L7078:
	xorl	%ebx, %ebx
	jmp	.L7075
.L18522:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7038
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7029
	jmp	.L7038
.L18521:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L7062
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L7062
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L7062
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L7062
	movl	$1, %eax
	jmp	.L7063
	.p2align 6,,7
.L18520:
	cmpw	$47, %dx
	jne	.L7059
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7059
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7059
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18527
	movq	24(%rbx), %rax
.L7057:
	cmpw	$67, (%rax)
	jne	.L7059
	cmpq	%rsi, %rcx
	jne	.L7059
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7051
.L18527:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7051
	jmp	.L7057
	.p2align 6,,7
.L18519:
	movq	8(%rax), %rbx
	jmp	.L7051
.L18518:
	cmpw	$47, %dx
	je	.L18528
.L7048:
	xorl	%ebp, %ebp
	jmp	.L7040
.L18528:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7048
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7048
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18529
	movq	24(%rbp), %rax
.L7046:
	cmpw	$67, (%rax)
	jne	.L7048
	cmpq	%rsi, %rcx
	jne	.L7048
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L7040
.L18529:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L7040
	jmp	.L7046
	.p2align 6,,7
.L18517:
	movq	8(%rax), %rbp
	jmp	.L7040
.L18516:
	movq	1624(%rsp), %r9
	movq	8(%r9), %rdi
	cmpw	$61, (%rdi)
	je	.L18530
.L7033:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L7029
	movq	1232(%rsp), %rbp
	movq	8(%rbp), %r14
	jmp	.L7032
.L18530:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L7033
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %r11
	testq	%r11, %r11
	cmovne	%r11, %rdi
	jmp	.L7033
.L7026:
	movq	1248(%rsp), %r12
	xorl	%esi, %esi
	movq	%r15, %rdx
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L6954
	movq	1240(%rsp), %rcx
	xorl	%r14d, %r14d
	movq	8(%rcx), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L6954
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L6954
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6958
	cmpw	$34, %ax
	je	.L6958
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6960
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18531
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18532
.L6960:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6971
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18533
	cmpw	$33, (%r13)
	je	.L18534
.L6979:
	xorl	%ebx, %ebx
.L6971:
	testq	%rbp, %rbp
	je	.L6958
	testq	%rbx, %rbx
	je	.L6958
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18535
.L6982:
	xorl	%eax, %eax
.L6983:
	testl	%eax, %eax
	jne	.L18536
.L6958:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6984
	testb	$16, 3(%rax)
	je	.L6984
	cmpw	$36, (%rax)
	je	.L6984
.L6985:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6986
	testb	$16, 3(%rax)
	je	.L6986
	cmpw	$36, (%rax)
	je	.L6986
	movq	%rax, %rbx
	jmp	.L6985
.L6986:
	cmpq	%rbx, 1696(%rsp)
	je	.L6954
	movq	%rbx, %r13
.L6984:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6991
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6995
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6996
	movl	$14, %r11d
.L6995:
	testl	%ebx, %ebx
	je	.L7001
	cmpl	%r11d, %r14d
	jge	.L6954
.L6991:
	testl	%ebx, %ebx
	je	.L7001
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7001
.L7019:
	cmpq	%r13, 8(%rdi)
	je	.L18537
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7019
.L7001:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L6954
	testl	%r14d, %r14d
	jne	.L7021
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17183:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L6954:
	movq	1240(%rsp), %rax
	movq	1248(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 1240(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 1248(%rsp)
	jne	.L7026
	jmp	.L16084
.L7021:
	cmpl	$14, %r14d
	je	.L16822
	cmpl	$15, %r14d
.L17642:
	jne	.L6954
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17182:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17183
.L16822:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17182
.L18537:
	testq	%r10, %r10
	je	.L7007
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18539
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17181:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7007:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L7012
	movb	$0, 2(%rdi)
.L7012:
	testq	%r10, %r10
	je	.L6954
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16821
	cmpb	$14, %al
	je	.L16822
	cmpb	$15, %al
	jmp	.L17642
.L16821:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17183
.L18539:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17181
.L6996:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6998
	movl	$15, %r11d
	jmp	.L6995
.L6998:
	xorl	%ebx, %ebx
	jmp	.L6995
.L18536:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6958
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6954
	jmp	.L6958
.L18535:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L6982
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6982
	movq	8(%rbx), %r11
	cmpq	%r11, 8(%rbp)
	jne	.L6982
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L6982
	movl	$1, %eax
	jmp	.L6983
.L18534:
	cmpw	$47, %dx
	jne	.L6979
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6979
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6979
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18540
	movq	24(%rbx), %rax
.L6977:
	cmpw	$67, (%rax)
	jne	.L6979
	cmpq	%rsi, %rcx
	jne	.L6979
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6971
.L18540:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6971
	jmp	.L6977
.L18533:
	movq	8(%rax), %rbx
	jmp	.L6971
.L18532:
	cmpw	$47, %dx
	je	.L18541
.L6968:
	xorl	%ebp, %ebp
	jmp	.L6960
.L18541:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6968
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6968
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18542
	movq	24(%rbp), %rax
.L6966:
	cmpw	$67, (%rax)
	jne	.L6968
	cmpq	%rsi, %rcx
	jne	.L6968
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6960
.L18542:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6960
	jmp	.L6966
.L18531:
	movq	8(%rax), %rbp
	jmp	.L6960
	.p2align 6,,7
.L6950:
	movq	1264(%rsp), %r9
	movq	%r15, %rsi
	movq	8(%r9), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L6878
	movq	1256(%rsp), %r14
	movq	8(%r14), %r13
	cmpq	%r13, 1696(%rsp)
	movl	$14, %r14d
	je	.L6878
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L6878
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6882
	cmpw	$34, %ax
	je	.L6882
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6884
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18543
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18544
.L6884:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6895
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18545
	cmpw	$33, (%r13)
	je	.L18546
.L6903:
	xorl	%ebx, %ebx
.L6895:
	testq	%rbp, %rbp
	je	.L6882
	testq	%rbx, %rbx
	je	.L6882
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r8
	cmpb	$60, rtx_class(%r8)
	je	.L18547
.L6906:
	xorl	%eax, %eax
.L6907:
	testl	%eax, %eax
	jne	.L18548
.L6882:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6908
	testb	$16, 3(%rax)
	je	.L6908
	cmpw	$36, (%rax)
	je	.L6908
.L6909:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6910
	testb	$16, 3(%rax)
	je	.L6910
	cmpw	$36, (%rax)
	je	.L6910
	movq	%rax, %rbx
	jmp	.L6909
.L6910:
	cmpq	%rbx, 1696(%rsp)
	je	.L6878
	movq	%rbx, %r13
.L6908:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6915
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6919
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6920
	movl	$14, %r11d
.L6919:
	testl	%ebx, %ebx
	je	.L6925
	cmpl	%r11d, %r14d
	jge	.L6878
.L6915:
	testl	%ebx, %ebx
	je	.L6925
	movq	1696(%rsp), %r11
	movq	48(%r11), %rdi
	testq	%rdi, %rdi
	je	.L6925
.L6943:
	cmpq	%r13, 8(%rdi)
	je	.L18549
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6943
.L6925:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L6878
	testl	%r14d, %r14d
	jne	.L6945
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%rbp,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17180:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L6878:
	movq	1256(%rsp), %rax
	movq	1264(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 1256(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 1264(%rsp)
	jne	.L6950
	jmp	.L16081
.L6945:
	cmpl	$14, %r14d
	je	.L16820
	cmpl	$15, %r14d
.L17641:
	jne	.L6878
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17179:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17180
.L16820:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17179
.L18549:
	testq	%r10, %r10
	je	.L6931
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18551
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r11
	movl	16(%r9,%rbp), %ecx
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r11,8), %rax
.L17178:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6931:
	movzbl	2(%rdi), %r11d
	cmpl	%r11d, %r14d
	jge	.L6936
	movb	$14, 2(%rdi)
.L6936:
	testq	%r10, %r10
	je	.L6878
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16819
	cmpb	$14, %al
	je	.L16820
	cmpb	$15, %al
	jmp	.L17641
.L16819:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%r11
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r11,%r11,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17180
.L18551:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17178
.L6920:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6922
	movl	$15, %r11d
	jmp	.L6919
.L6922:
	xorl	%ebx, %ebx
	jmp	.L6919
.L18548:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6882
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6878
	jmp	.L6882
.L18547:
	movzwl	(%rbx), %edi
	movslq	%edi,%rcx
	cmpb	$60, rtx_class(%rcx)
	jne	.L6906
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6906
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L6906
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L6906
	movl	$1, %eax
	jmp	.L6907
.L18546:
	cmpw	$47, %dx
	jne	.L6903
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6903
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6903
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18552
	movq	24(%rbx), %rax
.L6901:
	cmpw	$67, (%rax)
	jne	.L6903
	cmpq	%rsi, %rcx
	jne	.L6903
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6895
.L18552:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6895
	jmp	.L6901
.L18545:
	movq	8(%rax), %rbx
	jmp	.L6895
.L18544:
	cmpw	$47, %dx
	je	.L18553
.L6892:
	xorl	%ebp, %ebp
	jmp	.L6884
.L18553:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6892
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6892
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18554
	movq	24(%rbp), %rax
.L6890:
	cmpw	$67, (%rax)
	jne	.L6892
	cmpq	%rsi, %rcx
	jne	.L6892
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6884
.L18554:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6884
	jmp	.L6890
.L18543:
	movq	8(%rax), %rbp
	jmp	.L6884
	.p2align 6,,7
.L18515:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r10b
	movq	8(%rax), %rdi
	movq	%rax, %r15
	movzbl	%r10b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	8(%r15), %rdi
	call	cselib_subst_to_values
	movq	%rax, 8(%r15)
	jmp	.L6870
.L7134:
	movq	1624(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	8(%rdx), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1624(%rsp), %r8
	movq	8(%r8), %rbp
	movzwl	(%r8), %ebx
	testq	%rbp, %rbp
	je	.L3416
	movl	(%rbp), %edx
	cmpw	$39, %dx
	je	.L18555
	leal	-63(%rdx), %r10d
	cmpw	$1, %r10w
	ja	.L18556
.L7149:
	leal	-132(%rdx), %r9d
	cmpw	$1, %r9w
	jbe	.L18557
.L7148:
	movq	8(%rbp), %rbp
	movl	(%rbp), %edx
	leal	-63(%rdx), %edi
	cmpw	$1, %di
	jbe	.L7149
	cmpw	$133, %dx
	je	.L7149
	cmpw	$132, %dx
	je	.L7149
.L16093:
	cmpw	$61, %dx
	je	.L18558
	cmpw	$66, %dx
	je	.L18559
.L7650:
	movq	1624(%rsp), %rcx
	cmpw	$47, (%rcx)
	jne	.L3416
	movq	1704(%rsp), %rdi
	movq	16(%rcx), %rsi
	jmp	.L17215
.L18559:
	movq	current_sched_info(%rip), %r15
	movq	%rbp, 1224(%rsp)
	testb	$2, 96(%r15)
	jne	.L18560
.L7268:
	movq	compiler_params(%rip), %r10
	movq	1704(%rsp), %rcx
	movl	80(%r10), %eax
	cmpl	%eax, 32(%rcx)
	jg	.L17724
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %rsi
	movq	(%rax), %rdx
	movq	8(%rsi), %r12
	testq	%rdx, %rdx
	movq	%rdx, 1208(%rsp)
	movq	%r12, 1216(%rsp)
	jne	.L7360
.L16099:
	movq	1704(%rsp), %r12
	movq	1704(%rsp), %r9
	movq	16(%r12), %r10
	movq	24(%r9), %r11
	testq	%r10, %r10
	movq	%r10, 1192(%rsp)
	movq	%r11, 1200(%rsp)
	jne	.L7436
.L16102:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 1184(%rsp)
	je	.L16122
	movl	$14, %r15d
.L7512:
	movq	1184(%rsp), %r11
	movq	8(%r11), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L7439
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L7439
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7444
	cmpw	$34, %ax
	je	.L7444
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L7446
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18561
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L18562
.L7446:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7457
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18563
	cmpw	$33, (%r14)
	je	.L18564
.L7465:
	xorl	%ebx, %ebx
.L7457:
	testq	%r12, %r12
	je	.L7444
	testq	%rbx, %rbx
	je	.L7444
	movzwl	(%r12), %r13d
	movslq	%r13d,%r9
	cmpb	$60, rtx_class(%r9)
	je	.L18565
.L7468:
	xorl	%eax, %eax
.L7469:
	testl	%eax, %eax
	jne	.L18566
.L7444:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7470
	testb	$16, 3(%rax)
	je	.L7470
	cmpw	$36, (%rax)
	je	.L7470
.L7471:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7472
	testb	$16, 3(%rax)
	je	.L7472
	cmpw	$36, (%rax)
	je	.L7472
	movq	%rax, %rbx
	jmp	.L7471
.L7472:
	cmpq	%rbx, 1696(%rsp)
	je	.L7439
	movq	%rbx, %r14
.L7470:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L7477
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%r12
	movl	16(%r13,%rcx), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %r13d
	leaq	0(,%r13,8), %r12
	movq	%r12, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L7481
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7482
	movl	$14, %r11d
.L7481:
	testl	%ebx, %ebx
	je	.L7487
	cmpl	%r11d, %r15d
	jge	.L7439
.L7477:
	testl	%ebx, %ebx
	je	.L7487
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7487
.L7505:
	cmpq	%r14, 8(%rdi)
	je	.L18567
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7505
.L7487:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L7439
	testl	%r15d, %r15d
	jne	.L7507
	movslq	8(%r14),%r12
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r12,%r12,2), %r11
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r11
	salq	$4, %rdx
	movl	16(%r11,%r9), %ecx
	movslq	16(%rdx,%r9),%rdi
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17200:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L7439:
	movq	1184(%rsp), %r9
	movq	16(%r9), %r11
	testq	%r11, %r11
	movq	%r11, 1184(%rsp)
	jne	.L7512
.L16122:
	movq	1704(%rsp), %r12
	movq	1696(%rsp), %rdi
	movq	%rbp, %rbx
	movq	16(%r12), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r15
	movq	1704(%rsp), %r10
	movq	%rax, 16(%r10)
	testb	$2, 96(%r15)
	jne	.L18568
.L7898:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	24(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r13
	movq	%rax, 24(%r13)
	incl	32(%r13)
.L7668:
	movq	1704(%rsp), %rdi
	movq	8(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L7650
.L18568:
	movq	%rbp, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L7898
.L7507:
	cmpl	$14, %r15d
	je	.L16832
	cmpl	$15, %r15d
.L17647:
	jne	.L7439
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17199:
	movslq	8(%r14),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17200
.L16832:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%r12
	leaq	(%r12,%r12,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17199
.L18567:
	testq	%r10, %r10
	je	.L7493
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18570
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%r9,%r12), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17198:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7493:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r15d
	jge	.L7498
	movb	$14, 2(%rdi)
.L7498:
	testq	%r10, %r10
	je	.L7439
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16831
	cmpb	$14, %al
	je	.L16832
	cmpb	$15, %al
	jmp	.L17647
.L16831:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdi
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%r9
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbx), %ecx
	leaq	(%r9,%r9,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rbx),%r13
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17200
.L18570:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17198
.L7482:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7484
	movl	$15, %r11d
	jmp	.L7481
.L7484:
	xorl	%ebx, %ebx
	jmp	.L7481
.L18566:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7444
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7439
	jmp	.L7444
.L18565:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L7468
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L7468
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%r12)
	jne	.L7468
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%r12)
	jne	.L7468
	movl	$1, %eax
	jmp	.L7469
.L18564:
	cmpw	$47, %dx
	jne	.L7465
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7465
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7465
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18571
	movq	24(%rbx), %rax
.L7463:
	cmpw	$67, (%rax)
	jne	.L7465
	cmpq	%rsi, %rcx
	jne	.L7465
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7457
.L18571:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7457
	jmp	.L7463
.L18563:
	movq	8(%rax), %rbx
	jmp	.L7457
.L18562:
	cmpw	$47, %dx
	je	.L18572
.L7454:
	xorl	%r12d, %r12d
	jmp	.L7446
.L18572:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7454
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7454
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18573
	movq	24(%r12), %rax
.L7452:
	cmpw	$67, (%rax)
	jne	.L7454
	cmpq	%rsi, %rcx
	jne	.L7454
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L7446
.L18573:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L7446
	jmp	.L7452
.L18561:
	movq	8(%rax), %r12
	jmp	.L7446
	.p2align 6,,7
.L7436:
	movq	1200(%rsp), %r13
	movq	1224(%rsp), %rsi
	movq	8(%r13), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L7364
	movq	1192(%rsp), %rcx
	movl	$15, %r15d
	movq	8(%rcx), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L7364
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L7364
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7368
	cmpw	$34, %ax
	je	.L7368
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L7370
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18574
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L18575
.L7370:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7381
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18576
	cmpw	$33, (%r14)
	je	.L18577
.L7389:
	xorl	%ebx, %ebx
.L7381:
	testq	%r12, %r12
	je	.L7368
	testq	%rbx, %rbx
	je	.L7368
	movzwl	(%r12), %r13d
	movslq	%r13d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18578
.L7392:
	xorl	%eax, %eax
.L7393:
	testl	%eax, %eax
	jne	.L18579
.L7368:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7394
	testb	$16, 3(%rax)
	je	.L7394
	cmpw	$36, (%rax)
	je	.L7394
.L7395:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7396
	testb	$16, 3(%rax)
	je	.L7396
	cmpw	$36, (%rax)
	je	.L7396
	movq	%rax, %rbx
	jmp	.L7395
.L7396:
	cmpq	%rbx, 1696(%rsp)
	je	.L7364
	movq	%rbx, %r14
.L7394:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L7401
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%r12
	movl	16(%rcx,%r13), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L7405
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7406
	movl	$14, %r11d
.L7405:
	testl	%ebx, %ebx
	je	.L7411
	cmpl	%r11d, %r15d
	jge	.L7364
.L7401:
	testl	%ebx, %ebx
	je	.L7411
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7411
.L7429:
	cmpq	%r14, 8(%rdi)
	je	.L18580
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7429
.L7411:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L7364
	testl	%r15d, %r15d
	jne	.L7431
	movslq	8(%r14),%r11
	movslq	8(%rdx),%r13
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%r13,%r13,2), %r9
	salq	$4, %rdi
	salq	$4, %r9
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r9,%rbx),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17197:
	andl	$63, %ecx
	movl	$1, %r15d
	salq	%cl, %r15
	orq	%r15, 16(%rax)
.L7364:
	movq	1192(%rsp), %rax
	movq	1200(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 1192(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 1200(%rsp)
	jne	.L7436
	jmp	.L16102
.L7431:
	cmpl	$14, %r15d
	je	.L16830
	cmpl	$15, %r15d
.L17646:
	jne	.L7364
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r13
	leaq	(%r13,%r13,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17196:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17197
.L16830:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17196
.L18580:
	testq	%r10, %r10
	je	.L7417
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18582
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r13), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r13),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17195:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7417:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r15d
	jge	.L7422
	movb	$15, 2(%rdi)
.L7422:
	testq	%r10, %r10
	je	.L7364
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16829
	cmpb	$14, %al
	je	.L16830
	cmpb	$15, %al
	jmp	.L17646
.L16829:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17197
.L18582:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r12
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%r12,%r12,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%r11
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17195
.L7406:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7408
	movl	$15, %r11d
	jmp	.L7405
.L7408:
	xorl	%ebx, %ebx
	jmp	.L7405
.L18579:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7368
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7364
	jmp	.L7368
.L18578:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L7392
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L7392
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%r12)
	jne	.L7392
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%r12)
	jne	.L7392
	movl	$1, %eax
	jmp	.L7393
.L18577:
	cmpw	$47, %dx
	jne	.L7389
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7389
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7389
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18583
	movq	24(%rbx), %rax
.L7387:
	cmpw	$67, (%rax)
	jne	.L7389
	cmpq	%rsi, %rcx
	jne	.L7389
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7381
.L18583:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7381
	jmp	.L7387
.L18576:
	movq	8(%rax), %rbx
	jmp	.L7381
.L18575:
	cmpw	$47, %dx
	je	.L18584
.L7378:
	xorl	%r12d, %r12d
	jmp	.L7370
.L18584:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7378
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7378
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18585
	movq	24(%r12), %rax
.L7376:
	cmpw	$67, (%rax)
	jne	.L7378
	cmpq	%rsi, %rcx
	jne	.L7378
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L7370
.L18585:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L7370
	jmp	.L7376
.L18574:
	movq	8(%rax), %r12
	jmp	.L7370
	.p2align 6,,7
.L7360:
	movq	1216(%rsp), %rcx
	movq	1224(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L7288
	movq	1208(%rsp), %r13
	movl	$14, %r15d
	movq	8(%r13), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L7288
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L7288
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7292
	cmpw	$34, %ax
	je	.L7292
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L7294
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18586
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L18587
.L7294:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7305
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18588
	cmpw	$33, (%r14)
	je	.L18589
.L7313:
	xorl	%ebx, %ebx
.L7305:
	testq	%r12, %r12
	je	.L7292
	testq	%rbx, %rbx
	je	.L7292
	movzwl	(%r12), %r13d
	movslq	%r13d,%r8
	cmpb	$60, rtx_class(%r8)
	je	.L18590
.L7316:
	xorl	%eax, %eax
.L7317:
	testl	%eax, %eax
	jne	.L18591
.L7292:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7318
	testb	$16, 3(%rax)
	je	.L7318
	cmpw	$36, (%rax)
	je	.L7318
.L7319:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7320
	testb	$16, 3(%rax)
	je	.L7320
	cmpw	$36, (%rax)
	je	.L7320
	movq	%rax, %rbx
	jmp	.L7319
.L7320:
	cmpq	%rbx, 1696(%rsp)
	je	.L7288
	movq	%rbx, %r14
.L7318:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L7325
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%r12
	movl	16(%r13,%rcx), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %r13d
	leaq	0(,%r13,8), %r12
	movq	%r12, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L7329
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7330
	movl	$14, %r11d
.L7329:
	testl	%ebx, %ebx
	je	.L7335
	cmpl	%r11d, %r15d
	jge	.L7288
.L7325:
	testl	%ebx, %ebx
	je	.L7335
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7335
.L7353:
	cmpq	%r14, 8(%rdi)
	je	.L18592
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7353
.L7335:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L7288
	testl	%r15d, %r15d
	jne	.L7355
	movslq	8(%r14),%r9
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rdi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movl	16(%rdi,%r11), %ecx
	movslq	16(%r12,%r11),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17194:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L7288:
	movq	1208(%rsp), %rax
	movq	1216(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 1208(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r15
	movq	%r15, 1216(%rsp)
	jne	.L7360
	jmp	.L16099
.L7355:
	cmpl	$14, %r15d
	je	.L16828
	cmpl	$15, %r15d
.L17645:
	jne	.L7288
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17193:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17194
.L16828:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17193
.L18592:
	testq	%r10, %r10
	je	.L7341
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18594
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%r9,%r12), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17192:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7341:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r15d
	jge	.L7346
	movb	$14, 2(%rdi)
.L7346:
	testq	%r10, %r10
	je	.L7288
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16827
	cmpb	$14, %al
	je	.L16828
	cmpb	$15, %al
	jmp	.L17645
.L16827:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r13
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17194
.L18594:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17192
.L7330:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7332
	movl	$15, %r11d
	jmp	.L7329
.L7332:
	xorl	%ebx, %ebx
	jmp	.L7329
.L18591:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7292
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7288
	jmp	.L7292
.L18590:
	movzwl	(%rbx), %edi
	movslq	%edi,%r11
	cmpb	$60, rtx_class(%r11)
	jne	.L7316
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L7316
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%r12)
	jne	.L7316
	movq	16(%rbx), %r9
	cmpq	%r9, 16(%r12)
	jne	.L7316
	movl	$1, %eax
	jmp	.L7317
.L18589:
	cmpw	$47, %dx
	jne	.L7313
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7313
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7313
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18595
	movq	24(%rbx), %rax
.L7311:
	cmpw	$67, (%rax)
	jne	.L7313
	cmpq	%rsi, %rcx
	jne	.L7313
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7305
.L18595:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7305
	jmp	.L7311
.L18588:
	movq	8(%rax), %rbx
	jmp	.L7305
.L18587:
	cmpw	$47, %dx
	je	.L18596
.L7302:
	xorl	%r12d, %r12d
	jmp	.L7294
.L18596:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7302
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7302
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18597
	movq	24(%r12), %rax
.L7300:
	cmpw	$67, (%rax)
	jne	.L7302
	cmpq	%rsi, %rcx
	jne	.L7302
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L7294
.L18597:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L7294
	jmp	.L7300
.L18586:
	movq	8(%rax), %r12
	jmp	.L7294
.L17724:
	movq	1696(%rsp), %rdi
	movq	%rcx, %rsi
	movl	$14, %edx
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$8, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r12
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	movq	%r12, %rsi
	movl	$0, 32(%r12)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r9
	movq	%rax, 40(%r9)
	movl	$1, 36(%r9)
	jmp	.L7668
.L18560:
	movq	%rbp, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r9b
	movq	%rax, 1224(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r9b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	1224(%rsp), %r11
	movq	8(%r11), %rdi
	call	cselib_subst_to_values
	movq	1224(%rsp), %r14
	movq	%rax, 8(%r14)
	jmp	.L7268
.L18558:
	movl	8(%rbp), %r12d
	cmpl	$52, %r12d
	jg	.L7151
	leal	-8(%r12), %r11d
	cmpl	$7, %r11d
	jbe	.L7154
	leal	-21(%r12), %esi
	cmpl	$7, %esi
	jbe	.L7154
	leal	-45(%r12), %r13d
	cmpl	$7, %r13d
	jbe	.L7154
	leal	-29(%r12), %r14d
	cmpl	$7, %r14d
	ja	.L7152
.L7154:
	movzbq	2(%rbp), %r8
	movl	mode_class(,%r8,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17187:
	addl	$2, %eax
.L7153:
	cmpl	$47, %ebx
	je	.L18598
	movl	%eax, %ebx
	decl	%ebx
	js	.L7650
.L7180:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%r12), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L7180
	jmp	.L7650
.L18598:
	movl	%eax, %ebx
	decl	%ebx
	js	.L7650
.L7175:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%r12), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L7175
	jmp	.L7650
.L7152:
	movzbl	2(%rbp), %eax
	cmpb	$18, %al
	je	.L18599
	cmpb	$24, %al
	je	.L18600
	movl	target_flags(%rip), %r15d
	testl	$33554432, %r15d
	movl	%r15d, %ecx
	je	.L7165
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r10d
	leal	7(%r10), %edx
.L7166:
	andl	$33554432, %ecx
	je	.L7167
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L7153
.L7167:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L7153
.L7165:
	movzbl	%al, %edi 
	movzbl	mode_size(%rdi), %r9d
	leal	3(%r9), %edx
	jmp	.L7166
.L18600:
	xorl	%ebp, %ebp
	testb	$2, target_flags+3(%rip)
	sete	%bpl
	leal	4(%rbp,%rbp), %eax
	jmp	.L7153
.L18599:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17187
.L7151:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %r12d
	jl	.L7182
	movq	1696(%rsp), %rbx
	movq	32(%rbx), %rax
.L17719:
	movzwl	(%rax), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L7650
	jmp	.L17570
.L7182:
	cmpl	$47, %ebx
	je	.L18601
	movq	reg_pending_clobbers(%rip), %rdi
.L17188:
	movl	%r12d, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L16538
	movslq	%r12d,%rbx
	movq	reg_known_equiv_p(%rip), %r12
	addq	%rbx, %r12
	cmpb	$0, (%r12)
	je	.L7187
	leaq	0(,%rbx,8), %r11
	addq	reg_known_value(%rip), %r11
	movq	(%r11), %rax
	cmpw	$66, (%rax)
	je	.L18602
.L7187:
	leaq	0(,%rbx,8), %r14
	addq	reg_n_info(%rip), %r14
	movq	32(%r14), %r13
	movl	32(%r13), %esi
	testl	%esi, %esi
	jne	.L7650
	movq	1704(%rsp), %r8
	movq	48(%r8), %r15
	testq	%r15, %r15
	je	.L7650
	movl	$14, %r14d
.L7264:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L7191
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L7191
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7196
	cmpw	$34, %ax
	je	.L7196
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L7198
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18603
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18604
.L7198:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7209
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18605
	cmpw	$33, (%r13)
	je	.L18606
.L7217:
	xorl	%ebx, %ebx
.L7209:
	testq	%rbp, %rbp
	je	.L7196
	testq	%rbx, %rbx
	je	.L7196
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r10
	cmpb	$60, rtx_class(%r10)
	je	.L18607
.L7220:
	xorl	%eax, %eax
.L7221:
	testl	%eax, %eax
	jne	.L18608
.L7196:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7222
	testb	$16, 3(%rax)
	je	.L7222
	cmpw	$36, (%rax)
	je	.L7222
.L7223:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7224
	testb	$16, 3(%rax)
	je	.L7224
	cmpw	$36, (%rax)
	je	.L7224
	movq	%rax, %rbx
	jmp	.L7223
.L7224:
	cmpq	%rbx, 1696(%rsp)
	je	.L7191
	movq	%rbx, %r13
.L7222:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L7229
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L7233
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7234
	movl	$14, %r11d
.L7233:
	testl	%ebx, %ebx
	je	.L7239
	cmpl	%r11d, %r14d
	jge	.L7191
.L7229:
	testl	%ebx, %ebx
	je	.L7239
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7239
.L7257:
	cmpq	%r13, 8(%rdi)
	je	.L18609
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7257
.L7239:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L7191
	testl	%r14d, %r14d
	jne	.L7259
	movslq	8(%r13),%rbp
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%rbp,%rbp,2), %r11
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %r11
	salq	$4, %rdx
	movl	16(%r11,%r9), %ecx
	movslq	16(%rdx,%r9),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17191:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L7191:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L7264
	jmp	.L7650
.L7259:
	cmpl	$14, %r14d
	je	.L16826
	cmpl	$15, %r14d
.L17644:
	jne	.L7191
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17190:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17191
.L16826:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%rbp
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17190
.L18609:
	testq	%r10, %r10
	je	.L7245
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18611
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r9,%rbp), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17189:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7245:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L7250
	movb	$14, 2(%rdi)
.L7250:
	testq	%r10, %r10
	je	.L7191
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16825
	cmpb	$14, %al
	je	.L16826
	cmpb	$15, %al
	jmp	.L17644
.L16825:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%r9
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbx), %ecx
	leaq	(%r9,%r9,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rbx),%r12
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17191
.L18611:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17189
.L7234:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7236
	movl	$15, %r11d
	jmp	.L7233
.L7236:
	xorl	%ebx, %ebx
	jmp	.L7233
.L18608:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7196
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7191
	jmp	.L7196
.L18607:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L7220
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L7220
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rbp)
	jne	.L7220
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L7220
	movl	$1, %eax
	jmp	.L7221
.L18606:
	cmpw	$47, %dx
	jne	.L7217
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7217
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7217
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18612
	movq	24(%rbx), %rax
.L7215:
	cmpw	$67, (%rax)
	jne	.L7217
	cmpq	%rsi, %rcx
	jne	.L7217
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7209
.L18612:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7209
	jmp	.L7215
.L18605:
	movq	8(%rax), %rbx
	jmp	.L7209
.L18604:
	cmpw	$47, %dx
	je	.L18613
.L7206:
	xorl	%ebp, %ebp
	jmp	.L7198
.L18613:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7206
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7206
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18614
	movq	24(%rbp), %rax
.L7204:
	cmpw	$67, (%rax)
	jne	.L7206
	cmpq	%rsi, %rcx
	jne	.L7206
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L7198
.L18614:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L7198
	jmp	.L7204
.L18603:
	movq	8(%rax), %rbp
	jmp	.L7198
.L18602:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L7187
.L16538:
	movslq	%r12d,%rbx
	jmp	.L7187
.L18601:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17188
	.p2align 6,,7
.L18557:
	movq	1704(%rsp), %rdi
	movq	16(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	24(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L7148
.L18556:
	cmpw	$133, %dx
	je	.L7149
	cmpw	$132, %dx
	jne	.L16093
	jmp	.L7149
.L18555:
	movq	8(%rbp), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L16091
.L7143:
	movslq	%ebx,%r15
	movq	8(%rdx,%r15,8), %rcx
	movq	8(%rcx), %rdx
	testq	%rdx, %rdx
	jne	.L18615
.L7140:
	decl	%ebx
	js	.L16091
	movq	8(%rbp), %rdx
	jmp	.L7143
.L16091:
	movq	1624(%rsp), %rdx
	cmpw	$47, (%rdx)
	jne	.L3416
	movq	1704(%rsp), %rdi
	movq	16(%rdx), %rsi
	jmp	.L17215
	.p2align 6,,7
.L18615:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L7140
.L7518:
	movq	1624(%rsp), %r10
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	8(%r10), %rsi
	call	sched_analyze_2
	movq	1624(%rsp), %rbp
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	16(%rbp), %rsi
	call	sched_analyze_2
	movq	1624(%rsp), %r15
	movq	8(%r15), %rbp
	movzwl	(%r15), %ebx
	testq	%rbp, %rbp
	je	.L3416
	movl	(%rbp), %edx
	cmpw	$39, %dx
	je	.L18616
	leal	-63(%rdx), %esi
	cmpw	$1, %si
	ja	.L18617
.L7533:
	leal	-132(%rdx), %ecx
	cmpw	$1, %cx
	jbe	.L18618
.L7532:
	movq	8(%rbp), %rbp
	movl	(%rbp), %edx
	leal	-63(%rdx), %r14d
	cmpw	$1, %r14w
	jbe	.L7533
	cmpw	$133, %dx
	je	.L7533
	cmpw	$132, %dx
	je	.L7533
.L16110:
	cmpw	$61, %dx
	je	.L18619
	cmpw	$66, %dx
	jne	.L7650
	movq	current_sched_info(%rip), %r15
	movq	%rbp, 1176(%rsp)
	testb	$2, 96(%r15)
	jne	.L18620
.L7652:
	movq	compiler_params(%rip), %r10
	movq	1704(%rsp), %rcx
	movl	80(%r10), %eax
	cmpl	%eax, 32(%rcx)
	jg	.L17724
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %r13
	movq	(%rax), %r8
	movq	8(%r13), %rsi
	testq	%r8, %r8
	movq	%r8, 1160(%rsp)
	movq	%rsi, 1168(%rsp)
	jne	.L7744
.L16116:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %r9
	movq	24(%r11), %rbx
	testq	%r9, %r9
	movq	%r9, 1144(%rsp)
	movq	%rbx, 1152(%rsp)
	jne	.L7820
.L16119:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %r10
	testq	%r10, %r10
	movq	%r10, 1136(%rsp)
	je	.L16122
	movl	$14, %r15d
.L7896:
	movq	1136(%rsp), %r11
	movq	8(%r11), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L7823
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L7823
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7828
	cmpw	$34, %ax
	je	.L7828
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L7830
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18621
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L18622
.L7830:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7841
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18623
	cmpw	$33, (%r14)
	je	.L18624
.L7849:
	xorl	%ebx, %ebx
.L7841:
	testq	%r12, %r12
	je	.L7828
	testq	%rbx, %rbx
	je	.L7828
	movzwl	(%r12), %r13d
	movslq	%r13d,%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18625
.L7852:
	xorl	%eax, %eax
.L7853:
	testl	%eax, %eax
	jne	.L18626
.L7828:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7854
	testb	$16, 3(%rax)
	je	.L7854
	cmpw	$36, (%rax)
	je	.L7854
.L7855:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7856
	testb	$16, 3(%rax)
	je	.L7856
	cmpw	$36, (%rax)
	je	.L7856
	movq	%rax, %rbx
	jmp	.L7855
.L7856:
	cmpq	%rbx, 1696(%rsp)
	je	.L7823
	movq	%rbx, %r14
.L7854:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L7861
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%r12
	movl	16(%r13,%rcx), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %r13d
	leaq	0(,%r13,8), %r12
	movq	%r12, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L7865
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7866
	movl	$14, %r11d
.L7865:
	testl	%ebx, %ebx
	je	.L7871
	cmpl	%r11d, %r15d
	jge	.L7823
.L7861:
	testl	%ebx, %ebx
	je	.L7871
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L7871
.L7889:
	cmpq	%r14, 8(%rdi)
	je	.L18627
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7889
.L7871:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L7823
	testl	%r15d, %r15d
	jne	.L7891
	movslq	8(%r14),%r12
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r12,%r12,2), %rbx
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rbx
	salq	$4, %rdx
	movl	16(%rbx,%r11), %ecx
	movslq	16(%rdx,%r11),%rdi
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17214:
	andl	$63, %ecx
	movl	$1, %edi
	salq	%cl, %rdi
	orq	%rdi, 16(%rax)
.L7823:
	movq	1136(%rsp), %r11
	movq	16(%r11), %rbx
	testq	%rbx, %rbx
	movq	%rbx, 1136(%rsp)
	jne	.L7896
	jmp	.L16122
.L7891:
	cmpl	$14, %r15d
	je	.L16840
	cmpl	$15, %r15d
.L17651:
	jne	.L7823
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rsi
	movq	h_i_d(%rip), %rcx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17213:
	movslq	8(%r14),%r9
	leaq	(%r9,%r9,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17214
.L16840:
	movq	1696(%rsp), %rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rdx),%r12
	leaq	(%r12,%r12,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17213
.L18627:
	testq	%r10, %r10
	je	.L7877
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18629
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%r11,%r12), %ecx
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17212:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7877:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r15d
	jge	.L7882
	movb	$14, 2(%rdi)
.L7882:
	testq	%r10, %r10
	je	.L7823
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16839
	cmpb	$14, %al
	je	.L16840
	cmpb	$15, %al
	jmp	.L17651
.L16839:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdi
	movq	h_i_d(%rip), %r9
	movslq	8(%rax),%r11
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%r9), %ecx
	leaq	(%r11,%r11,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%r9),%r13
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17214
.L18629:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17212
.L7866:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7868
	movl	$15, %r11d
	jmp	.L7865
.L7868:
	xorl	%ebx, %ebx
	jmp	.L7865
.L18626:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7828
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7823
	jmp	.L7828
.L18625:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L7852
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L7852
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%r12)
	jne	.L7852
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%r12)
	jne	.L7852
	movl	$1, %eax
	jmp	.L7853
.L18624:
	cmpw	$47, %dx
	jne	.L7849
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7849
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7849
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18630
	movq	24(%rbx), %rax
.L7847:
	cmpw	$67, (%rax)
	jne	.L7849
	cmpq	%rsi, %rcx
	jne	.L7849
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7841
.L18630:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7841
	jmp	.L7847
.L18623:
	movq	8(%rax), %rbx
	jmp	.L7841
.L18622:
	cmpw	$47, %dx
	je	.L18631
.L7838:
	xorl	%r12d, %r12d
	jmp	.L7830
.L18631:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7838
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7838
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18632
	movq	24(%r12), %rax
.L7836:
	cmpw	$67, (%rax)
	jne	.L7838
	cmpq	%rsi, %rcx
	jne	.L7838
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L7830
.L18632:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L7830
	jmp	.L7836
.L18621:
	movq	8(%rax), %r12
	jmp	.L7830
	.p2align 6,,7
.L7820:
	movq	1152(%rsp), %r13
	movq	1176(%rsp), %rsi
	movq	8(%r13), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L7748
	movq	1144(%rsp), %r12
	movl	$15, %r15d
	movq	8(%r12), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L7748
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L7748
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7752
	cmpw	$34, %ax
	je	.L7752
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L7754
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18633
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L18634
.L7754:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7765
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18635
	cmpw	$33, (%r14)
	je	.L18636
.L7773:
	xorl	%ebx, %ebx
.L7765:
	testq	%r12, %r12
	je	.L7752
	testq	%rbx, %rbx
	je	.L7752
	movzwl	(%r12), %r13d
	movslq	%r13d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18637
.L7776:
	xorl	%eax, %eax
.L7777:
	testl	%eax, %eax
	jne	.L18638
.L7752:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7778
	testb	$16, 3(%rax)
	je	.L7778
	cmpw	$36, (%rax)
	je	.L7778
.L7779:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7780
	testb	$16, 3(%rax)
	je	.L7780
	cmpw	$36, (%rax)
	je	.L7780
	movq	%rax, %rbx
	jmp	.L7779
.L7780:
	cmpq	%rbx, 1696(%rsp)
	je	.L7748
	movq	%rbx, %r14
.L7778:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L7785
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%r12
	movl	16(%r13,%rcx), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %r13d
	leaq	0(,%r13,8), %r12
	movq	%r12, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L7789
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7790
	movl	$14, %r11d
.L7789:
	testl	%ebx, %ebx
	je	.L7795
	cmpl	%r11d, %r15d
	jge	.L7748
.L7785:
	testl	%ebx, %ebx
	je	.L7795
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L7795
.L7813:
	cmpq	%r14, 8(%rdi)
	je	.L18639
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7813
.L7795:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L7748
	testl	%r15d, %r15d
	jne	.L7815
	movslq	8(%r14),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r12,%rbx),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17211:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L7748:
	movq	1144(%rsp), %rax
	movq	1152(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 1144(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r15
	movq	%r15, 1152(%rsp)
	jne	.L7820
	jmp	.L16119
.L7815:
	cmpl	$14, %r15d
	je	.L16838
	cmpl	$15, %r15d
.L17650:
	jne	.L7748
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17210:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17211
.L16838:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17210
.L18639:
	testq	%r10, %r10
	je	.L7801
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18641
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%r11,%r12), %ecx
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17209:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7801:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r15d
	jge	.L7806
	movb	$15, 2(%rdi)
.L7806:
	testq	%r10, %r10
	je	.L7748
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16837
	cmpb	$14, %al
	je	.L16838
	cmpb	$15, %al
	jmp	.L17650
.L16837:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r9
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r9,%r9,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r13
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r13,8), %rax
	jmp	.L17211
.L18641:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %r12
	salq	$4, %r12
	movl	16(%r12,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17209
.L7790:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7792
	movl	$15, %r11d
	jmp	.L7789
.L7792:
	xorl	%ebx, %ebx
	jmp	.L7789
.L18638:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7752
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7748
	jmp	.L7752
.L18637:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L7776
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L7776
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%r12)
	jne	.L7776
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%r12)
	jne	.L7776
	movl	$1, %eax
	jmp	.L7777
.L18636:
	cmpw	$47, %dx
	jne	.L7773
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7773
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7773
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18642
	movq	24(%rbx), %rax
.L7771:
	cmpw	$67, (%rax)
	jne	.L7773
	cmpq	%rsi, %rcx
	jne	.L7773
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7765
.L18642:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7765
	jmp	.L7771
.L18635:
	movq	8(%rax), %rbx
	jmp	.L7765
.L18634:
	cmpw	$47, %dx
	je	.L18643
.L7762:
	xorl	%r12d, %r12d
	jmp	.L7754
.L18643:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7762
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7762
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18644
	movq	24(%r12), %rax
.L7760:
	cmpw	$67, (%rax)
	jne	.L7762
	cmpq	%rsi, %rcx
	jne	.L7762
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L7754
.L18644:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L7754
	jmp	.L7760
.L18633:
	movq	8(%rax), %r12
	jmp	.L7754
	.p2align 6,,7
.L7744:
	movq	1168(%rsp), %rbx
	movq	1176(%rsp), %rsi
	movq	8(%rbx), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L7672
	movq	1160(%rsp), %rdi
	movl	$14, %r15d
	movq	8(%rdi), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L7672
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L7672
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7676
	cmpw	$34, %ax
	je	.L7676
	movq	32(%rdx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L7678
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18645
	xorl	%r12d, %r12d
	cmpw	$33, %cx
	je	.L18646
.L7678:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7689
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18647
	cmpw	$33, (%r14)
	je	.L18648
.L7697:
	xorl	%ebx, %ebx
.L7689:
	testq	%r12, %r12
	je	.L7676
	testq	%rbx, %rbx
	je	.L7676
	movzwl	(%r12), %r13d
	movslq	%r13d,%r11
	cmpb	$60, rtx_class(%r11)
	je	.L18649
.L7700:
	xorl	%eax, %eax
.L7701:
	testl	%eax, %eax
	jne	.L18650
.L7676:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7702
	testb	$16, 3(%rax)
	je	.L7702
	cmpw	$36, (%rax)
	je	.L7702
.L7703:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7704
	testb	$16, 3(%rax)
	je	.L7704
	cmpw	$36, (%rax)
	je	.L7704
	movq	%rax, %rbx
	jmp	.L7703
.L7704:
	cmpq	%rbx, 1696(%rsp)
	je	.L7672
	movq	%rbx, %r14
.L7702:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L7709
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%r12
	movl	16(%rcx,%r13), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L7713
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7714
	movl	$14, %r11d
.L7713:
	testl	%ebx, %ebx
	je	.L7719
	cmpl	%r11d, %r15d
	jge	.L7672
.L7709:
	testl	%ebx, %ebx
	je	.L7719
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L7719
.L7737:
	cmpq	%r14, 8(%rdi)
	je	.L18651
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7737
.L7719:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L7672
	testl	%r15d, %r15d
	jne	.L7739
	movslq	8(%r14),%rbx
	movslq	8(%rdx),%r13
	movq	h_i_d(%rip), %r9
	leaq	(%rbx,%rbx,2), %rdi
	leaq	(%r13,%r13,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%r9), %ecx
	movslq	16(%r11,%r9),%r15
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r15,8), %rax
.L17208:
	andl	$63, %ecx
	movl	$1, %r15d
	salq	%cl, %r15
	orq	%r15, 16(%rax)
.L7672:
	movq	1160(%rsp), %rax
	movq	1168(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 1160(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 1168(%rsp)
	jne	.L7744
	jmp	.L16116
.L7739:
	cmpl	$14, %r15d
	je	.L16836
	cmpl	$15, %r15d
.L17649:
	jne	.L7672
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r13
	leaq	(%r13,%r13,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17207:
	movslq	8(%r14),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17208
.L16836:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17207
.L18651:
	testq	%r10, %r10
	je	.L7725
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18653
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r13), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r13),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17206:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7725:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r15d
	jge	.L7730
	movb	$14, 2(%rdi)
.L7730:
	testq	%r10, %r10
	je	.L7672
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16835
	cmpb	$14, %al
	je	.L16836
	cmpb	$15, %al
	jmp	.L17649
.L16835:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r15
	salq	$4, %r15
	movslq	16(%r15,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17208
.L18653:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r12
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%r12,%r12,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%rbx
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r11d
	salq	$3, %rbx
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17206
.L7714:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7716
	movl	$15, %r11d
	jmp	.L7713
.L7716:
	xorl	%ebx, %ebx
	jmp	.L7713
.L18650:
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7676
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7672
	jmp	.L7676
.L18649:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L7700
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L7700
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%r12)
	jne	.L7700
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%r12)
	jne	.L7700
	movl	$1, %eax
	jmp	.L7701
.L18648:
	cmpw	$47, %dx
	jne	.L7697
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7697
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7697
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18654
	movq	24(%rbx), %rax
.L7695:
	cmpw	$67, (%rax)
	jne	.L7697
	cmpq	%rsi, %rcx
	jne	.L7697
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7689
.L18654:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7689
	jmp	.L7695
.L18647:
	movq	8(%rax), %rbx
	jmp	.L7689
.L18646:
	cmpw	$47, %dx
	je	.L18655
.L7686:
	xorl	%r12d, %r12d
	jmp	.L7678
.L18655:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7686
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7686
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18656
	movq	24(%r12), %rax
.L7684:
	cmpw	$67, (%rax)
	jne	.L7686
	cmpq	%rsi, %rcx
	jne	.L7686
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L7678
.L18656:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L7678
	jmp	.L7684
.L18645:
	movq	8(%rax), %r12
	jmp	.L7678
.L18620:
	movq	%rbp, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%cl
	movq	%rax, 1176(%rsp)
	movq	8(%rax), %rdi
	movzbl	%cl, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	1176(%rsp), %rdx
	movq	8(%rdx), %rdi
	call	cselib_subst_to_values
	movq	1176(%rsp), %r14
	movq	%rax, 8(%r14)
	jmp	.L7652
.L18619:
	movl	8(%rbp), %r12d
	cmpl	$52, %r12d
	jg	.L7535
	leal	-8(%r12), %edx
	cmpl	$7, %edx
	jbe	.L7538
	leal	-21(%r12), %r8d
	cmpl	$7, %r8d
	jbe	.L7538
	leal	-45(%r12), %edi
	cmpl	$7, %edi
	jbe	.L7538
	leal	-29(%r12), %r11d
	cmpl	$7, %r11d
	ja	.L7536
.L7538:
	movzbq	2(%rbp), %r9
	movl	mode_class(,%r9,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17201:
	addl	$2, %eax
.L7537:
	cmpl	$47, %ebx
	je	.L18657
	movl	%eax, %ebx
	decl	%ebx
	js	.L7650
.L7564:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%r12), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L7564
	jmp	.L7650
.L18657:
	movl	%eax, %ebx
	decl	%ebx
	js	.L7650
.L7559:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%r12), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L7559
	jmp	.L7650
.L7536:
	movzbl	2(%rbp), %eax
	cmpb	$18, %al
	je	.L18658
	cmpb	$24, %al
	je	.L18659
	movl	target_flags(%rip), %ebp
	testl	$33554432, %ebp
	movl	%ebp, %ecx
	je	.L7549
	movzbl	%al, %r13d 
	movzbl	mode_size(%r13), %r10d
	leal	7(%r10), %edx
.L7550:
	andl	$33554432, %ecx
	je	.L7551
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L7537
.L7551:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L7537
.L7549:
	movzbl	%al, %r14d 
	movzbl	mode_size(%r14), %esi
	leal	3(%rsi), %edx
	jmp	.L7550
.L18659:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L7537
.L18658:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17201
.L7535:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %r12d
	jl	.L7566
	movq	1696(%rsp), %rbx
	movq	32(%rbx), %rax
	jmp	.L17719
.L7566:
	cmpl	$47, %ebx
	je	.L18660
	movq	reg_pending_clobbers(%rip), %rdi
.L17202:
	movl	%r12d, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L16548
	movslq	%r12d,%rbx
	movq	reg_known_equiv_p(%rip), %r12
	addq	%rbx, %r12
	cmpb	$0, (%r12)
	je	.L7571
	leaq	0(,%rbx,8), %rdx
	addq	reg_known_value(%rip), %rdx
	movq	(%rdx), %rax
	cmpw	$66, (%rax)
	je	.L18661
.L7571:
	leaq	0(,%rbx,8), %r11
	addq	reg_n_info(%rip), %r11
	movq	32(%r11), %rdi
	movl	32(%rdi), %r8d
	testl	%r8d, %r8d
	jne	.L7650
	movq	1704(%rsp), %r9
	movq	48(%r9), %r15
	testq	%r15, %r15
	je	.L7650
	movl	$14, %r14d
.L7648:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L7575
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L7575
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L7580
	cmpw	$34, %ax
	je	.L7580
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L7582
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18662
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18663
.L7582:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L7593
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18664
	cmpw	$33, (%r13)
	je	.L18665
.L7601:
	xorl	%ebx, %ebx
.L7593:
	testq	%rbp, %rbp
	je	.L7580
	testq	%rbx, %rbx
	je	.L7580
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r10
	cmpb	$60, rtx_class(%r10)
	je	.L18666
.L7604:
	xorl	%eax, %eax
.L7605:
	testl	%eax, %eax
	jne	.L18667
.L7580:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L7606
	testb	$16, 3(%rax)
	je	.L7606
	cmpw	$36, (%rax)
	je	.L7606
.L7607:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L7608
	testb	$16, 3(%rax)
	je	.L7608
	cmpw	$36, (%rax)
	je	.L7608
	movq	%rax, %rbx
	jmp	.L7607
.L7608:
	cmpq	%rbx, 1696(%rsp)
	je	.L7575
	movq	%rbx, %r13
.L7606:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L7613
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L7617
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7618
	movl	$14, %r11d
.L7617:
	testl	%ebx, %ebx
	je	.L7623
	cmpl	%r11d, %r14d
	jge	.L7575
.L7613:
	testl	%ebx, %ebx
	je	.L7623
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7623
.L7641:
	cmpq	%r13, 8(%rdi)
	je	.L18668
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L7641
.L7623:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L7575
	testl	%r14d, %r14d
	jne	.L7643
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rbx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %rbx
	salq	$4, %r12
	movl	16(%rbx,%r11), %ecx
	movslq	16(%r12,%r11),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17205:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L7575:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L7648
	jmp	.L7650
.L7643:
	cmpl	$14, %r14d
	je	.L16834
	cmpl	$15, %r14d
.L17648:
	jne	.L7575
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17204:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17205
.L16834:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17204
.L18668:
	testq	%r10, %r10
	je	.L7629
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18670
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17203:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L7629:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L7634
	movb	$14, 2(%rdi)
.L7634:
	testq	%r10, %r10
	je	.L7575
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16833
	cmpb	$14, %al
	je	.L16834
	cmpb	$15, %al
	jmp	.L17648
.L16833:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r11
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%r11,%r11,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17205
.L18670:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r11
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17203
.L7618:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L7620
	movl	$15, %r11d
	jmp	.L7617
.L7620:
	xorl	%ebx, %ebx
	jmp	.L7617
.L18667:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L7580
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L7575
	jmp	.L7580
.L18666:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L7604
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L7604
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rbp)
	jne	.L7604
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L7604
	movl	$1, %eax
	jmp	.L7605
.L18665:
	cmpw	$47, %dx
	jne	.L7601
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7601
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7601
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18671
	movq	24(%rbx), %rax
.L7599:
	cmpw	$67, (%rax)
	jne	.L7601
	cmpq	%rsi, %rcx
	jne	.L7601
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L7593
.L18671:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L7593
	jmp	.L7599
.L18664:
	movq	8(%rax), %rbx
	jmp	.L7593
.L18663:
	cmpw	$47, %dx
	je	.L18672
.L7590:
	xorl	%ebp, %ebp
	jmp	.L7582
.L18672:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L7590
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L7590
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18673
	movq	24(%rbp), %rax
.L7588:
	cmpw	$67, (%rax)
	jne	.L7590
	cmpq	%rsi, %rcx
	jne	.L7590
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L7582
.L18673:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L7582
	jmp	.L7588
.L18662:
	movq	8(%rax), %rbp
	jmp	.L7582
.L18661:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L7571
.L16548:
	movslq	%r12d,%rbx
	jmp	.L7571
.L18660:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17202
	.p2align 6,,7
.L18618:
	movq	1704(%rsp), %rdi
	movq	16(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	24(%rbp), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L7532
.L18617:
	cmpw	$133, %dx
	je	.L7533
	cmpw	$132, %dx
	jne	.L16110
	jmp	.L7533
.L18616:
	movq	8(%rbp), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L16108
.L7527:
	movslq	%ebx,%r13
	movq	8(%rdx,%r13,8), %r12
	movq	8(%r12), %rdx
	testq	%rdx, %rdx
	jne	.L18674
.L7524:
	decl	%ebx
	js	.L16108
	movq	8(%rbp), %rdx
	jmp	.L7527
.L16108:
	movq	1624(%rsp), %rax
	cmpw	$47, (%rax)
	jne	.L3416
	movq	1704(%rsp), %rdi
	movq	16(%rax), %rsi
	jmp	.L17215
	.p2align 6,,7
.L18674:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L7524
	.p2align 6,,7
.L4507:
	movq	1624(%rsp), %r10
	movzwl	%ax, %r13d
	movq	8(%r10), %rdx
	movl	%r13d, 1656(%rsp)
	testq	%rdx, %rdx
	movq	%rdx, 1064(%rsp)
	je	.L3416
	movzwl	(%rdx), %edx
	cmpw	$39, %dx
	movl	%edx, %ecx
	je	.L18675
	leal	-63(%rcx), %r15d
	cmpw	$1, %r15w
	ja	.L18676
	.p2align 4,,7
.L5491:
	leal	-132(%rdx), %r13d
	cmpw	$1, %r13w
	ja	.L4844
	movq	1064(%rsp), %rbp
	movq	16(%rbp), %r15
	testq	%r15, %r15
	je	.L4846
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L4847
	mov	%eax, %edi
	jmp	*.L5154(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L5154:
	.quad	.L5138
	.quad	.L5138
	.quad	.L4847
	.quad	.L5138
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L5125
	.quad	.L4847
	.quad	.L4846
	.quad	.L4846
	.quad	.L4846
	.quad	.L4847
	.quad	.L4846
	.quad	.L4847
	.quad	.L4847
	.quad	.L4854
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4885
	.quad	.L4846
	.quad	.L4846
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L4847
	.quad	.L5150
	.quad	.L5150
	.quad	.L5150
	.quad	.L5150
	.quad	.L5152
	.quad	.L5152
	.text
.L4854:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L4855
	leal	-8(%rbp), %ebx
	cmpl	$7, %ebx
	jbe	.L4858
	leal	-21(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L4858
	leal	-45(%rbp), %esi
	cmpl	$7, %esi
	jbe	.L4858
	leal	-29(%rbp), %r9d
	cmpl	$7, %r9d
	ja	.L4856
.L4858:
	movzbq	2(%r15), %r11
	movl	mode_class(,%r11,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17110:
	addl	$2, %eax
.L4857:
	movl	%eax, %ebx
	decl	%ebx
	js	.L4846
.L4878:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L4878
	.p2align 4,,7
.L4846:
	movq	1064(%rsp), %r13
	movq	24(%r13), %r15
	testq	%r15, %r15
	je	.L4844
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L5170
	mov	%eax, %r14d
	jmp	*.L5477(,%r14,8)
	.section	.rodata
	.align 8
	.align 4
.L5477:
	.quad	.L5461
	.quad	.L5461
	.quad	.L5170
	.quad	.L5461
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5448
	.quad	.L5170
	.quad	.L4844
	.quad	.L4844
	.quad	.L4844
	.quad	.L5170
	.quad	.L4844
	.quad	.L5170
	.quad	.L5170
	.quad	.L5177
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5208
	.quad	.L4844
	.quad	.L4844
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5170
	.quad	.L5473
	.quad	.L5473
	.quad	.L5473
	.quad	.L5473
	.quad	.L5475
	.quad	.L5475
	.text
.L5177:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L5178
	leal	-8(%rbp), %ebx
	cmpl	$7, %ebx
	jbe	.L5181
	leal	-21(%rbp), %r12d
	cmpl	$7, %r12d
	jbe	.L5181
	leal	-45(%rbp), %ecx
	cmpl	$7, %ecx
	jbe	.L5181
	leal	-29(%rbp), %edx
	cmpl	$7, %edx
	ja	.L5179
.L5181:
	movzbq	2(%r15), %r8
	movl	mode_class(,%r8,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17121:
	addl	$2, %eax
.L5180:
	movl	%eax, %ebx
	decl	%ebx
	js	.L4844
.L5201:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L5201
	.p2align 4,,7
.L4844:
	movq	1064(%rsp), %r14
	movq	8(%r14), %r13
	movzwl	(%r13), %edx
	movq	%r13, 1064(%rsp)
	leal	-63(%rdx), %r15d
	cmpw	$1, %r15w
	jbe	.L5491
	cmpw	$133, %dx
	je	.L5491
	cmpw	$132, %dx
	je	.L5491
.L16000:
	cmpw	$61, %dx
	je	.L18677
	cmpw	$66, %dx
	je	.L18678
.L5931:
	movq	1624(%rsp), %rcx
	cmpw	$47, (%rcx)
	jne	.L3416
	movq	16(%rcx), %r15
	testq	%r15, %r15
	je	.L3416
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L6507
	mov	%eax, %r9d
	jmp	*.L6814(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L6814:
	.quad	.L6798
	.quad	.L6798
	.quad	.L6507
	.quad	.L6798
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6785
	.quad	.L6507
	.quad	.L3416
	.quad	.L3416
	.quad	.L3416
	.quad	.L6507
	.quad	.L3416
	.quad	.L6507
	.quad	.L6507
	.quad	.L6514
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6545
	.quad	.L3416
	.quad	.L3416
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6507
	.quad	.L6810
	.quad	.L6810
	.quad	.L6810
	.quad	.L6810
	.quad	.L6812
	.quad	.L6812
	.text
.L6514:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L6839
	leal	-8(%rbp), %ebx
	cmpl	$7, %ebx
	jbe	.L6518
	leal	-21(%rbp), %r11d
	cmpl	$7, %r11d
	jbe	.L6518
	leal	-45(%rbp), %r14d
	cmpl	$7, %r14d
	jbe	.L6518
	leal	-29(%rbp), %r12d
	cmpl	$7, %r12d
	ja	.L6516
.L6518:
	movzbq	2(%r15), %r8
	movl	mode_class(,%r8,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17167:
	addl	$2, %eax
.L6517:
	movl	%eax, %ebx
	decl	%ebx
	js	.L3416
.L6538:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L6538
	jmp	.L3416
.L6516:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18679
	cmpb	$24, %al
	je	.L18680
	movl	target_flags(%rip), %r13d
	testl	$33554432, %r13d
	movl	%r13d, %ecx
	je	.L6529
	movzbl	%al, %esi 
	movzbl	mode_size(%rsi), %edi
	leal	7(%rdi), %edx
.L6530:
	andl	$33554432, %ecx
	je	.L6531
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L6517
.L6531:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L6517
.L6529:
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r10d
	leal	3(%r10), %edx
	jmp	.L6530
.L18680:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L6517
.L18679:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17167
.L6798:
	cmpl	$41, %ebx
	je	.L18681
.L6800:
	movb	$1, reg_pending_barrier(%rip)
.L6799:
	cmpl	$41, %ebx
	je	.L18682
.L6507:
	movslq	%ebx,%rbp
	movzbl	rtx_length(%rbp), %edi
	movq	rtx_format(,%rbp,8), %r13
	movl	%edi, %ebp
	decl	%ebp
	js	.L3416
	leaq	8(%r15), %r14
.L6827:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18683
	cmpb	$69, %dl
	je	.L18684
.L6817:
	decl	%ebp
	jns	.L6827
	jmp	.L3416
.L18684:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L6817
	movq	%rdx, %r12
.L6826:
	movq	(%r12), %r10
	movslq	%ebx,%r11
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%r11,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rdx
	cmpl	(%rdx), %ebx
	jl	.L6826
	jmp	.L6817
.L18683:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L6817
.L18682:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L3416
.L6806:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %rcx
	cmpl	(%rcx), %ebx
	movq	%rcx, %rdx
	jl	.L6806
	jmp	.L3416
.L18681:
	testb	$8, 3(%r15)
	je	.L6799
	jmp	.L6800
.L6785:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r8
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r8, %rsi
	movl	$0, 32(%r8)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r12
	movq	%rax, 40(%r12)
	movl	$1, 36(%r12)
	jmp	.L6507
.L6545:
	movq	current_sched_info(%rip), %rbp
	movq	%r15, 928(%rsp)
	testb	$2, 96(%rbp)
	jne	.L18685
.L6546:
	movq	1704(%rsp), %r12
	movq	1704(%rsp), %r14
	movq	(%r12), %rbx
	movq	8(%r14), %r11
	testq	%rbx, %rbx
	movq	%rbx, 912(%rsp)
	movq	%r11, 920(%rsp)
	jne	.L6626
.L16068:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %r9
	movq	24(%r11), %rbx
	testq	%r9, %r9
	movq	%r9, 896(%rsp)
	movq	%rbx, 904(%rsp)
	jne	.L6702
.L16071:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %r10
	testq	%r10, %r10
	movq	%r10, 888(%rsp)
	je	.L16074
.L6782:
	movq	888(%rsp), %r11
	movq	8(%r11), %r14
	cmpw	$33, (%r14)
	je	.L18686
.L6708:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L6705
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L6705
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6714
	cmpw	$34, %ax
	je	.L6714
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6716
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18687
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18688
.L6716:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6727
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18689
	cmpw	$33, (%r14)
	je	.L18690
.L6735:
	xorl	%ebx, %ebx
.L6727:
	testq	%rbp, %rbp
	je	.L6714
	testq	%rbx, %rbx
	je	.L6714
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18691
.L6738:
	xorl	%eax, %eax
.L6739:
	testl	%eax, %eax
	jne	.L18692
.L6714:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6740
	testb	$16, 3(%rax)
	je	.L6740
	cmpw	$36, (%rax)
	je	.L6740
.L6741:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6742
	testb	$16, 3(%rax)
	je	.L6742
	cmpw	$36, (%rax)
	je	.L6742
	movq	%rax, %rbx
	jmp	.L6741
.L6742:
	cmpq	%rbx, 1696(%rsp)
	je	.L6705
	movq	%rbx, %r13
.L6740:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6747
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%rbp
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	leaq	(%rbp,%rbp,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r12
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	movl	%edx, %ecx
	leaq	0(,%r12,8), %rdi
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6751
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6752
	movl	$14, %r11d
.L6751:
	testl	%ebx, %ebx
	je	.L6757
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L6705
.L6747:
	testl	%ebx, %ebx
	je	.L6757
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6757
.L6775:
	cmpq	%r13, 8(%rdi)
	je	.L18693
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6775
.L6757:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L6705
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L6777
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rsi
	leaq	(%rcx,%rcx,2), %r14
	salq	$4, %rsi
	salq	$4, %r14
	movl	16(%rsi,%r11), %ecx
	movslq	16(%r14,%r11),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17176:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L6705:
	movq	888(%rsp), %rsi
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 888(%rsp)
	jne	.L6782
.L16074:
	movq	1704(%rsp), %r9
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%r9), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r10
	movq	1704(%rsp), %r11
	movq	%rax, (%r11)
	testb	$2, 96(%r10)
	jne	.L18694
.L6783:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r14
	incl	32(%r14)
	movq	%rax, 8(%r14)
	movq	%r14, %rdi
	movq	8(%r15), %rsi
	jmp	.L17215
.L18694:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L6783
.L6777:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16818
	movl	$14, %r14d
	cmpl	$15, %r14d
.L17638:
	jne	.L6705
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r8
	movq	h_i_d(%rip), %rcx
	leaq	(%r8,%r8,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17175:
	movslq	8(%r13),%rdi
	leaq	(%rdi,%rdi,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17176
.L16818:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17175
.L18693:
	testq	%r10, %r10
	je	.L6763
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18696
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%r14
	movq	h_i_d(%rip), %r9
	movslq	8(%r12),%rcx
	leaq	(%r14,%r14,2), %r11
	salq	$4, %r11
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%r11,%r9), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r9),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17174:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6763:
	movzbl	2(%rdi), %ebp
	movl	$14, %eax
	cmpl	%ebp, %eax
	jge	.L6768
	movb	$14, 2(%rdi)
.L6768:
	testq	%r10, %r10
	je	.L6705
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16817
	cmpb	$14, %al
	je	.L16818
	cmpb	$15, %al
	jmp	.L17638
.L16817:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%rsi
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbp), %ecx
	leaq	(%rsi,%rsi,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rbp),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17176
.L18696:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rbp
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r14), %ecx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r14),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17174
.L6752:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6754
	movl	$15, %r11d
	jmp	.L6751
.L6754:
	xorl	%ebx, %ebx
	jmp	.L6751
.L18692:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6714
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6705
	jmp	.L6714
.L18691:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L6738
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6738
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rbp)
	jne	.L6738
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L6738
	movl	$1, %eax
	jmp	.L6739
.L18690:
	cmpw	$47, %dx
	jne	.L6735
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6735
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6735
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18697
	movq	24(%rbx), %rax
.L6733:
	cmpw	$67, (%rax)
	jne	.L6735
	cmpq	%rsi, %rcx
	jne	.L6735
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6727
.L18697:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6727
	jmp	.L6733
.L18689:
	movq	8(%rax), %rbx
	jmp	.L6727
.L18688:
	cmpw	$47, %dx
	je	.L18698
.L6724:
	xorl	%ebp, %ebp
	jmp	.L6716
.L18698:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6724
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6724
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18699
	movq	24(%rbp), %rax
.L6722:
	cmpw	$67, (%rax)
	jne	.L6724
	cmpq	%rsi, %rcx
	jne	.L6724
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6716
.L18699:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6716
	jmp	.L6722
.L18687:
	movq	8(%rax), %rbp
	jmp	.L6716
.L18686:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18700
.L6709:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L6705
	movq	888(%rsp), %rcx
	movq	8(%rcx), %r14
	jmp	.L6708
.L18700:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L6709
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	cmovne	%rbp, %rdi
	jmp	.L6709
.L6702:
	movq	904(%rsp), %r12
	movq	928(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L6630
	movq	896(%rsp), %rbp
	xorl	%r14d, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L6630
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L6630
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6634
	cmpw	$34, %ax
	je	.L6634
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6636
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18701
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18702
.L6636:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6647
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18703
	cmpw	$33, (%r13)
	je	.L18704
.L6655:
	xorl	%ebx, %ebx
.L6647:
	testq	%rbp, %rbp
	je	.L6634
	testq	%rbx, %rbx
	je	.L6634
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18705
.L6658:
	xorl	%eax, %eax
.L6659:
	testl	%eax, %eax
	jne	.L18706
.L6634:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6660
	testb	$16, 3(%rax)
	je	.L6660
	cmpw	$36, (%rax)
	je	.L6660
.L6661:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6662
	testb	$16, 3(%rax)
	je	.L6662
	cmpw	$36, (%rax)
	je	.L6662
	movq	%rax, %rbx
	jmp	.L6661
.L6662:
	cmpq	%rbx, 1696(%rsp)
	je	.L6630
	movq	%rbx, %r13
.L6660:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6667
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6671
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6672
	movl	$14, %r11d
.L6671:
	testl	%ebx, %ebx
	je	.L6677
	cmpl	%r11d, %r14d
	jge	.L6630
.L6667:
	testl	%ebx, %ebx
	je	.L6677
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L6677
.L6695:
	cmpq	%r13, 8(%rdi)
	je	.L18707
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6695
.L6677:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L6630
	testl	%r14d, %r14d
	jne	.L6697
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%rbp,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17173:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L6630:
	movq	896(%rsp), %rax
	movq	904(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 896(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 904(%rsp)
	jne	.L6702
	jmp	.L16071
.L6697:
	cmpl	$14, %r14d
	je	.L16816
	cmpl	$15, %r14d
.L17637:
	jne	.L6630
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17172:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17173
.L16816:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17172
.L18707:
	testq	%r10, %r10
	je	.L6683
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18709
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17171:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6683:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r14d
	jge	.L6688
	movb	$0, 2(%rdi)
.L6688:
	testq	%r10, %r10
	je	.L6630
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16815
	cmpb	$14, %al
	je	.L16816
	cmpb	$15, %al
	jmp	.L17637
.L16815:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%r9
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r9,%r9,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17173
.L18709:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17171
.L6672:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6674
	movl	$15, %r11d
	jmp	.L6671
.L6674:
	xorl	%ebx, %ebx
	jmp	.L6671
.L18706:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6634
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6630
	jmp	.L6634
.L18705:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L6658
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6658
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L6658
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L6658
	movl	$1, %eax
	jmp	.L6659
.L18704:
	cmpw	$47, %dx
	jne	.L6655
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6655
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6655
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18710
	movq	24(%rbx), %rax
.L6653:
	cmpw	$67, (%rax)
	jne	.L6655
	cmpq	%rsi, %rcx
	jne	.L6655
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6647
.L18710:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6647
	jmp	.L6653
.L18703:
	movq	8(%rax), %rbx
	jmp	.L6647
.L18702:
	cmpw	$47, %dx
	je	.L18711
.L6644:
	xorl	%ebp, %ebp
	jmp	.L6636
.L18711:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6644
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6644
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18712
	movq	24(%rbp), %rax
.L6642:
	cmpw	$67, (%rax)
	jne	.L6644
	cmpq	%rsi, %rcx
	jne	.L6644
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6636
.L18712:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6636
	jmp	.L6642
.L18701:
	movq	8(%rax), %rbp
	jmp	.L6636
.L6626:
	movq	920(%rsp), %r8
	movq	928(%rsp), %rsi
	movq	8(%r8), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L6554
	movq	912(%rsp), %rdi
	movl	$14, %r14d
	movq	8(%rdi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L6554
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L6554
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6558
	cmpw	$34, %ax
	je	.L6558
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6560
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18713
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18714
.L6560:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6571
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18715
	cmpw	$33, (%r13)
	je	.L18716
.L6579:
	xorl	%ebx, %ebx
.L6571:
	testq	%rbp, %rbp
	je	.L6558
	testq	%rbx, %rbx
	je	.L6558
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18717
.L6582:
	xorl	%eax, %eax
.L6583:
	testl	%eax, %eax
	jne	.L18718
.L6558:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6584
	testb	$16, 3(%rax)
	je	.L6584
	cmpw	$36, (%rax)
	je	.L6584
.L6585:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6586
	testb	$16, 3(%rax)
	je	.L6586
	cmpw	$36, (%rax)
	je	.L6586
	movq	%rax, %rbx
	jmp	.L6585
.L6586:
	cmpq	%rbx, 1696(%rsp)
	je	.L6554
	movq	%rbx, %r13
.L6584:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6591
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6595
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6596
	movl	$14, %r11d
.L6595:
	testl	%ebx, %ebx
	je	.L6601
	cmpl	%r11d, %r14d
	jge	.L6554
.L6591:
	testl	%ebx, %ebx
	je	.L6601
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L6601
.L6619:
	cmpq	%r13, 8(%rdi)
	je	.L18719
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6619
.L6601:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L6554
	testl	%r14d, %r14d
	jne	.L6621
	movslq	8(%r13),%rbx
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %r9
	leaq	(%rbx,%rbx,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%r9), %ecx
	movslq	16(%r11,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17170:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L6554:
	movq	912(%rsp), %rax
	movq	920(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 912(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 920(%rsp)
	jne	.L6626
	jmp	.L16068
.L6621:
	cmpl	$14, %r14d
	je	.L16814
	cmpl	$15, %r14d
.L17636:
	jne	.L6554
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17169:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17170
.L16814:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17169
.L18719:
	testq	%r10, %r10
	je	.L6607
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18721
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17168:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6607:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L6612
	movb	$14, 2(%rdi)
.L6612:
	testq	%r10, %r10
	je	.L6554
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16813
	cmpb	$14, %al
	je	.L16814
	cmpb	$15, %al
	jmp	.L17636
.L16813:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17170
.L18721:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %rbx
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17168
.L6596:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6598
	movl	$15, %r11d
	jmp	.L6595
.L6598:
	xorl	%ebx, %ebx
	jmp	.L6595
.L18718:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6558
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6554
	jmp	.L6558
.L18717:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L6582
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6582
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L6582
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L6582
	movl	$1, %eax
	jmp	.L6583
.L18716:
	cmpw	$47, %dx
	jne	.L6579
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6579
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6579
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18722
	movq	24(%rbx), %rax
.L6577:
	cmpw	$67, (%rax)
	jne	.L6579
	cmpq	%rsi, %rcx
	jne	.L6579
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6571
.L18722:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6571
	jmp	.L6577
.L18715:
	movq	8(%rax), %rbx
	jmp	.L6571
.L18714:
	cmpw	$47, %dx
	je	.L18723
.L6568:
	xorl	%ebp, %ebp
	jmp	.L6560
.L18723:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6568
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6568
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18724
	movq	24(%rbp), %rax
.L6566:
	cmpw	$67, (%rax)
	jne	.L6568
	cmpq	%rsi, %rcx
	jne	.L6568
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6560
.L18724:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6560
	jmp	.L6566
.L18713:
	movq	8(%rax), %rbp
	jmp	.L6560
.L18685:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r9b
	movq	%rax, 928(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r9b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	928(%rsp), %rax
	movq	8(%rax), %rdi
	call	cselib_subst_to_values
	movq	928(%rsp), %rcx
	movq	%rax, 8(%rcx)
	jmp	.L6546
.L6810:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17216:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L3416
.L6812:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17216
	.p2align 6,,7
.L18678:
	movq	current_sched_info(%rip), %r14
	movq	1064(%rsp), %r15
	testb	$2, 96(%r14)
	jne	.L18725
.L5933:
	movq	compiler_params(%rip), %rcx
	movl	80(%rcx), %eax
	movq	1704(%rsp), %rcx
	cmpl	%eax, 32(%rcx)
	jg	.L18726
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %rbp
	movq	(%rax), %r11
	movq	8(%rbp), %r12
	testq	%r11, %r11
	movq	%r11, 1000(%rsp)
	movq	%r12, 1008(%rsp)
	jne	.L6025
.L16045:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r9
	movq	16(%rcx), %rbx
	movq	24(%r9), %r11
	testq	%rbx, %rbx
	movq	%rbx, 984(%rsp)
	movq	%r11, 992(%rsp)
	jne	.L6101
.L16048:
	movq	1704(%rsp), %r10
	movq	40(%r10), %r15
	testq	%r15, %r15
	je	.L16051
	movl	$14, %r14d
.L6177:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L6104
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L6104
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6109
	cmpw	$34, %ax
	je	.L6109
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6111
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18727
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18728
.L6111:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6122
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18729
	cmpw	$33, (%r13)
	je	.L18730
.L6130:
	xorl	%ebx, %ebx
.L6122:
	testq	%rbp, %rbp
	je	.L6109
	testq	%rbx, %rbx
	je	.L6109
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r11
	cmpb	$60, rtx_class(%r11)
	je	.L18731
.L6133:
	xorl	%eax, %eax
.L6134:
	testl	%eax, %eax
	jne	.L18732
.L6109:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6135
	testb	$16, 3(%rax)
	je	.L6135
	cmpw	$36, (%rax)
	je	.L6135
.L6136:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6137
	testb	$16, 3(%rax)
	je	.L6137
	cmpw	$36, (%rax)
	je	.L6137
	movq	%rax, %rbx
	jmp	.L6136
.L6137:
	cmpq	%rbx, 1696(%rsp)
	je	.L6104
	movq	%rbx, %r13
.L6135:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6142
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6146
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6147
	movl	$14, %r11d
.L6146:
	testl	%ebx, %ebx
	je	.L6152
	cmpl	%r11d, %r14d
	jge	.L6104
.L6142:
	testl	%ebx, %ebx
	je	.L6152
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6152
.L6170:
	cmpq	%r13, 8(%rdi)
	je	.L18733
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6170
.L6152:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L6104
	testl	%r14d, %r14d
	jne	.L6172
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rbx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %rbx
	salq	$4, %r12
	movl	16(%rbx,%r11), %ecx
	movslq	16(%r12,%r11),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17155:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L6104:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L6177
.L16051:
	movq	1704(%rsp), %rdx
	movq	1696(%rsp), %rdi
	movq	1064(%rsp), %rbx
	movq	16(%rdx), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r15
	movq	1704(%rsp), %r14
	movq	%rax, 16(%r14)
	testb	$2, 96(%r15)
	jne	.L18734
.L6179:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	24(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %rcx
	movq	%rax, 24(%rcx)
	incl	32(%rcx)
.L5949:
	movq	1064(%rsp), %r10
	movq	8(%r10), %r15
	testq	%r15, %r15
	je	.L5931
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L6183
	mov	%eax, %r9d
	jmp	*.L6490(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L6490:
	.quad	.L6474
	.quad	.L6474
	.quad	.L6183
	.quad	.L6474
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6461
	.quad	.L6183
	.quad	.L5931
	.quad	.L5931
	.quad	.L5931
	.quad	.L6183
	.quad	.L5931
	.quad	.L6183
	.quad	.L6183
	.quad	.L6190
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6221
	.quad	.L5931
	.quad	.L5931
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6183
	.quad	.L6486
	.quad	.L6486
	.quad	.L6486
	.quad	.L6486
	.quad	.L6488
	.quad	.L6488
	.text
.L6190:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L6191
	leal	-8(%rbp), %r12d
	cmpl	$7, %r12d
	jbe	.L6194
	leal	-21(%rbp), %r8d
	cmpl	$7, %r8d
	jbe	.L6194
	leal	-45(%rbp), %esi
	cmpl	$7, %esi
	jbe	.L6194
	leal	-29(%rbp), %r13d
	cmpl	$7, %r13d
	ja	.L6192
.L6194:
	movzbq	2(%r15), %rdi
	movl	mode_class(,%rdi,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17156:
	addl	$2, %eax
.L6193:
	movl	%eax, %ebx
	decl	%ebx
	js	.L5931
.L6214:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L6214
	jmp	.L5931
.L6192:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18735
	cmpb	$24, %al
	je	.L18736
	movl	target_flags(%rip), %r11d
	testl	$33554432, %r11d
	movl	%r11d, %ecx
	je	.L6205
	movzbl	%al, %r14d 
	movzbl	mode_size(%r14), %r15d
	leal	7(%r15), %edx
.L6206:
	andl	$33554432, %ecx
	je	.L6207
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L6193
.L6207:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L6193
.L6205:
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r10d
	leal	3(%r10), %edx
	jmp	.L6206
.L18736:
	xorl	%ebx, %ebx
	testb	$2, target_flags+3(%rip)
	sete	%bl
	leal	4(%rbx,%rbx), %eax
	jmp	.L6193
.L18735:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17156
.L6191:
	movq	1704(%rsp), %rcx
	cmpl	68(%rcx), %ebp
	jl	.L6216
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L5931
	jmp	.L17569
.L6216:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L16516
	movq	reg_known_equiv_p(%rip), %r12
	movslq	%ebp,%rbx
	addq	%rbx, %r12
	cmpb	$0, (%r12)
	je	.L6219
	leaq	0(,%rbx,8), %r8
	addq	reg_known_value(%rip), %r8
	movq	(%r8), %rax
	cmpw	$66, (%rax)
	je	.L18737
.L6219:
	leaq	0(,%rbx,8), %rdi
	addq	reg_n_info(%rip), %rdi
	movq	32(%rdi), %r13
	movl	32(%r13), %esi
	testl	%esi, %esi
	jne	.L5931
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	56(%r11), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rbx
	movq	%rax, 56(%rbx)
	jmp	.L5931
.L18737:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L6219
.L16516:
	movslq	%ebp,%rbx
	jmp	.L6219
.L6474:
	cmpl	$41, %ebx
	je	.L18738
.L6476:
	movb	$1, reg_pending_barrier(%rip)
.L6475:
	cmpl	$41, %ebx
	je	.L18739
.L6183:
	movslq	%ebx,%rsi
	movzbl	rtx_length(%rsi), %edi
	movq	rtx_format(,%rsi,8), %r13
	movl	%edi, %ebp
	decl	%ebp
	js	.L5931
	leaq	8(%r15), %r14
.L6503:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18740
	cmpb	$69, %dl
	je	.L18741
.L6493:
	decl	%ebp
	jns	.L6503
	jmp	.L5931
.L18741:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rcx
	cmpl	(%rcx), %ebx
	jge	.L6493
	movq	%rdx, %r12
.L6502:
	movq	(%r12), %r10
	movslq	%ebx,%rax
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%rax,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rdx
	cmpl	(%rdx), %ebx
	jl	.L6502
	jmp	.L6493
.L18740:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L6493
.L18739:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L5931
.L6482:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %r8
	cmpl	(%r8), %ebx
	movq	%r8, %rdx
	jl	.L6482
	jmp	.L5931
.L18738:
	testb	$8, 3(%r15)
	je	.L6475
	jmp	.L6476
.L6461:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r12
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r12, %rsi
	movl	$0, 32(%r12)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r14
	movq	%rax, 40(%r14)
	movl	$1, 36(%r14)
	jmp	.L6183
.L6221:
	movq	current_sched_info(%rip), %r14
	movq	%r15, 976(%rsp)
	testb	$2, 96(%r14)
	jne	.L18742
.L6222:
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %r12
	movq	(%rax), %rbp
	movq	8(%r12), %r9
	testq	%rbp, %rbp
	movq	%rbp, 960(%rsp)
	movq	%r9, 968(%rsp)
	jne	.L6302
.L16055:
	movq	1704(%rsp), %rbp
	movq	1704(%rsp), %r11
	movq	16(%rbp), %r10
	movq	24(%r11), %r9
	testq	%r10, %r10
	movq	%r10, 944(%rsp)
	movq	%r9, 952(%rsp)
	jne	.L6378
.L16058:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 936(%rsp)
	je	.L16061
.L6458:
	movq	936(%rsp), %r9
	movq	8(%r9), %r14
	cmpw	$33, (%r14)
	je	.L18743
.L6384:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L6381
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L6381
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6390
	cmpw	$34, %ax
	je	.L6390
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6392
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18744
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18745
.L6392:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6403
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18746
	cmpw	$33, (%r14)
	je	.L18747
.L6411:
	xorl	%ebx, %ebx
.L6403:
	testq	%rbp, %rbp
	je	.L6390
	testq	%rbx, %rbx
	je	.L6390
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18748
.L6414:
	xorl	%eax, %eax
.L6415:
	testl	%eax, %eax
	jne	.L18749
.L6390:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6416
	testb	$16, 3(%rax)
	je	.L6416
	cmpw	$36, (%rax)
	je	.L6416
.L6417:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6418
	testb	$16, 3(%rax)
	je	.L6418
	cmpw	$36, (%rax)
	je	.L6418
	movq	%rax, %rbx
	jmp	.L6417
.L6418:
	cmpq	%rbx, 1696(%rsp)
	je	.L6381
	movq	%rbx, %r13
.L6416:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6423
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rbp), %edx
	leaq	(%r12,%r12,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rbp),%rcx
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	leaq	0(,%rcx,8), %rdi
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6427
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6428
	movl	$14, %r11d
.L6427:
	testl	%ebx, %ebx
	je	.L6433
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L6381
.L6423:
	testl	%ebx, %ebx
	je	.L6433
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6433
.L6451:
	cmpq	%r13, 8(%rdi)
	je	.L18750
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6451
.L6433:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L6381
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L6453
	movslq	8(%r13),%r11
	movslq	8(%rdx),%r14
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rsi
	leaq	(%r14,%r14,2), %rbp
	salq	$4, %rsi
	salq	$4, %rbp
	movl	16(%rsi,%r9), %ecx
	movslq	16(%rbp,%r9),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17165:
	andl	$63, %ecx
	movl	$1, %esi
	salq	%cl, %rsi
	orq	%rsi, 16(%rax)
.L6381:
	movq	936(%rsp), %rax
	movq	16(%rax), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 936(%rsp)
	jne	.L6458
.L16061:
	movq	1704(%rsp), %r9
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%r9), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %rcx
	movq	1704(%rsp), %r10
	movq	%rax, (%r10)
	testb	$2, 96(%rcx)
	jne	.L18751
.L6459:
	movq	1704(%rsp), %rbp
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rbp), %rdx
	call	alloc_EXPR_LIST
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %r11
	incl	32(%r11)
	movq	%rax, 8(%r11)
	movq	%r11, %rdi
	movq	8(%r15), %rsi
	call	sched_analyze_2
	jmp	.L5931
.L18751:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L6459
.L6453:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16812
	movl	$14, %ebp
	cmpl	$15, %ebp
.L17635:
	jne	.L6381
	movq	1696(%rsp), %r8
	movq	h_i_d(%rip), %rcx
	movslq	8(%r8),%r12
	leaq	(%r12,%r12,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17164:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17165
.L16812:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17164
.L18750:
	testq	%r10, %r10
	je	.L6439
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18753
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r11
	movslq	8(%r12),%rcx
	leaq	(%rbp,%rbp,2), %r9
	salq	$4, %r9
	leaq	(%rcx,%rcx,2), %r14
	movl	16(%r9,%r11), %ecx
	salq	$4, %r14
	movslq	16(%r14,%r11),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17163:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6439:
	movzbl	2(%rdi), %edx
	movl	$14, %eax
	cmpl	%edx, %eax
	jge	.L6444
	movb	$14, 2(%rdi)
.L6444:
	testq	%r10, %r10
	je	.L6381
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16811
	cmpb	$14, %al
	je	.L16812
	cmpb	$15, %al
	jmp	.L17635
.L16811:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rbx), %ecx
	leaq	(%rsi,%rsi,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%rbx),%r12
	movl	%ecx, %r8d
	shrl	$6, %r8d
	mov	%r8d, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17165
.L18753:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r14,%rbp), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17163
.L6428:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6430
	movl	$15, %r11d
	jmp	.L6427
.L6430:
	xorl	%ebx, %ebx
	jmp	.L6427
.L18749:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6390
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6381
	jmp	.L6390
.L18748:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L6414
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6414
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L6414
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L6414
	movl	$1, %eax
	jmp	.L6415
.L18747:
	cmpw	$47, %dx
	jne	.L6411
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6411
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6411
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18754
	movq	24(%rbx), %rax
.L6409:
	cmpw	$67, (%rax)
	jne	.L6411
	cmpq	%rsi, %rcx
	jne	.L6411
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6403
.L18754:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6403
	jmp	.L6409
.L18746:
	movq	8(%rax), %rbx
	jmp	.L6403
.L18745:
	cmpw	$47, %dx
	je	.L18755
.L6400:
	xorl	%ebp, %ebp
	jmp	.L6392
.L18755:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6400
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6400
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18756
	movq	24(%rbp), %rax
.L6398:
	cmpw	$67, (%rax)
	jne	.L6400
	cmpq	%rsi, %rcx
	jne	.L6400
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6392
.L18756:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6392
	jmp	.L6398
.L18744:
	movq	8(%rax), %rbp
	jmp	.L6392
.L18743:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18757
.L6385:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L6381
	movq	936(%rsp), %rbp
	movq	8(%rbp), %r14
	jmp	.L6384
.L18757:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L6385
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %r11
	testq	%r11, %r11
	cmovne	%r11, %rdi
	jmp	.L6385
.L6378:
	movq	952(%rsp), %r12
	movq	976(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L6306
	movq	944(%rsp), %rcx
	xorl	%r14d, %r14d
	movq	8(%rcx), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L6306
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L6306
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6310
	cmpw	$34, %ax
	je	.L6310
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6312
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18758
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18759
.L6312:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6323
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18760
	cmpw	$33, (%r13)
	je	.L18761
.L6331:
	xorl	%ebx, %ebx
.L6323:
	testq	%rbp, %rbp
	je	.L6310
	testq	%rbx, %rbx
	je	.L6310
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18762
.L6334:
	xorl	%eax, %eax
.L6335:
	testl	%eax, %eax
	jne	.L18763
.L6310:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6336
	testb	$16, 3(%rax)
	je	.L6336
	cmpw	$36, (%rax)
	je	.L6336
.L6337:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6338
	testb	$16, 3(%rax)
	je	.L6338
	cmpw	$36, (%rax)
	je	.L6338
	movq	%rax, %rbx
	jmp	.L6337
.L6338:
	cmpq	%rbx, 1696(%rsp)
	je	.L6306
	movq	%rbx, %r13
.L6336:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6343
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6347
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6348
	movl	$14, %r11d
.L6347:
	testl	%ebx, %ebx
	je	.L6353
	cmpl	%r11d, %r14d
	jge	.L6306
.L6343:
	testl	%ebx, %ebx
	je	.L6353
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6353
.L6371:
	cmpq	%r13, 8(%rdi)
	je	.L18764
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6371
.L6353:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L6306
	testl	%r14d, %r14d
	jne	.L6373
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17162:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L6306:
	movq	944(%rsp), %rax
	movq	952(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 944(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 952(%rsp)
	jne	.L6378
	jmp	.L16058
.L6373:
	cmpl	$14, %r14d
	je	.L16810
	cmpl	$15, %r14d
.L17634:
	jne	.L6306
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17161:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17162
.L16810:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17161
.L18764:
	testq	%r10, %r10
	je	.L6359
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18766
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17160:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6359:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L6364
	movb	$0, 2(%rdi)
.L6364:
	testq	%r10, %r10
	je	.L6306
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16809
	cmpb	$14, %al
	je	.L16810
	cmpb	$15, %al
	jmp	.L17634
.L16809:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17162
.L18766:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17160
.L6348:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6350
	movl	$15, %r11d
	jmp	.L6347
.L6350:
	xorl	%ebx, %ebx
	jmp	.L6347
.L18763:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6310
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6306
	jmp	.L6310
.L18762:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L6334
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6334
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L6334
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L6334
	movl	$1, %eax
	jmp	.L6335
.L18761:
	cmpw	$47, %dx
	jne	.L6331
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6331
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6331
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18767
	movq	24(%rbx), %rax
.L6329:
	cmpw	$67, (%rax)
	jne	.L6331
	cmpq	%rsi, %rcx
	jne	.L6331
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6323
.L18767:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6323
	jmp	.L6329
.L18760:
	movq	8(%rax), %rbx
	jmp	.L6323
.L18759:
	cmpw	$47, %dx
	je	.L18768
.L6320:
	xorl	%ebp, %ebp
	jmp	.L6312
.L18768:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6320
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6320
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18769
	movq	24(%rbp), %rax
.L6318:
	cmpw	$67, (%rax)
	jne	.L6320
	cmpq	%rsi, %rcx
	jne	.L6320
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6312
.L18769:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6312
	jmp	.L6318
.L18758:
	movq	8(%rax), %rbp
	jmp	.L6312
.L6302:
	movq	968(%rsp), %r8
	movq	976(%rsp), %rsi
	movq	8(%r8), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L6230
	movq	960(%rsp), %rsi
	movl	$14, %r14d
	movq	8(%rsi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L6230
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L6230
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6234
	cmpw	$34, %ax
	je	.L6234
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6236
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18770
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18771
.L6236:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6247
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18772
	cmpw	$33, (%r13)
	je	.L18773
.L6255:
	xorl	%ebx, %ebx
.L6247:
	testq	%rbp, %rbp
	je	.L6234
	testq	%rbx, %rbx
	je	.L6234
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L18774
.L6258:
	xorl	%eax, %eax
.L6259:
	testl	%eax, %eax
	jne	.L18775
.L6234:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6260
	testb	$16, 3(%rax)
	je	.L6260
	cmpw	$36, (%rax)
	je	.L6260
.L6261:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6262
	testb	$16, 3(%rax)
	je	.L6262
	cmpw	$36, (%rax)
	je	.L6262
	movq	%rax, %rbx
	jmp	.L6261
.L6262:
	cmpq	%rbx, 1696(%rsp)
	je	.L6230
	movq	%rbx, %r13
.L6260:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6267
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6271
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6272
	movl	$14, %r11d
.L6271:
	testl	%ebx, %ebx
	je	.L6277
	cmpl	%r11d, %r14d
	jge	.L6230
.L6267:
	testl	%ebx, %ebx
	je	.L6277
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6277
.L6295:
	cmpq	%r13, 8(%rdi)
	je	.L18776
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6295
.L6277:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L6230
	testl	%r14d, %r14d
	jne	.L6297
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17159:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L6230:
	movq	960(%rsp), %rax
	movq	968(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 960(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 968(%rsp)
	jne	.L6302
	jmp	.L16055
.L6297:
	cmpl	$14, %r14d
	je	.L16808
	cmpl	$15, %r14d
.L17633:
	jne	.L6230
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17158:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17159
.L16808:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17158
.L18776:
	testq	%r10, %r10
	je	.L6283
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18778
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17157:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6283:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L6288
	movb	$14, 2(%rdi)
.L6288:
	testq	%r10, %r10
	je	.L6230
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16807
	cmpb	$14, %al
	je	.L16808
	cmpb	$15, %al
	jmp	.L17633
.L16807:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17159
.L18778:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17157
.L6272:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6274
	movl	$15, %r11d
	jmp	.L6271
.L6274:
	xorl	%ebx, %ebx
	jmp	.L6271
.L18775:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6234
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6230
	jmp	.L6234
.L18774:
	movzwl	(%rbx), %edi
	movslq	%edi,%r11
	cmpb	$60, rtx_class(%r11)
	jne	.L6258
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6258
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rbp)
	jne	.L6258
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L6258
	movl	$1, %eax
	jmp	.L6259
.L18773:
	cmpw	$47, %dx
	jne	.L6255
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6255
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6255
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18779
	movq	24(%rbx), %rax
.L6253:
	cmpw	$67, (%rax)
	jne	.L6255
	cmpq	%rsi, %rcx
	jne	.L6255
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6247
.L18779:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6247
	jmp	.L6253
.L18772:
	movq	8(%rax), %rbx
	jmp	.L6247
.L18771:
	cmpw	$47, %dx
	je	.L18780
.L6244:
	xorl	%ebp, %ebp
	jmp	.L6236
.L18780:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6244
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6244
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18781
	movq	24(%rbp), %rax
.L6242:
	cmpw	$67, (%rax)
	jne	.L6244
	cmpq	%rsi, %rcx
	jne	.L6244
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6236
.L18781:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6236
	jmp	.L6242
.L18770:
	movq	8(%rax), %rbp
	jmp	.L6236
.L18742:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%cl
	movq	%rax, 976(%rsp)
	movq	8(%rax), %rdi
	movzbl	%cl, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	976(%rsp), %rdx
	movq	8(%rdx), %rdi
	call	cselib_subst_to_values
	movq	976(%rsp), %r10
	movq	%rax, 8(%r10)
	jmp	.L6222
.L6486:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17166:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L5931
.L6488:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17166
.L18734:
	movq	1064(%rsp), %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L6179
	.p2align 6,,7
.L6172:
	cmpl	$14, %r14d
	je	.L16806
	cmpl	$15, %r14d
.L17632:
	jne	.L6104
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17154:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17155
.L16806:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17154
.L18733:
	testq	%r10, %r10
	je	.L6158
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18783
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17153:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6158:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L6163
	movb	$14, 2(%rdi)
.L6163:
	testq	%r10, %r10
	je	.L6104
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16805
	cmpb	$14, %al
	je	.L16806
	cmpb	$15, %al
	jmp	.L17632
.L16805:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r11
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%r11,%r11,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17155
.L18783:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r11
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17153
.L6147:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6149
	movl	$15, %r11d
	jmp	.L6146
.L6149:
	xorl	%ebx, %ebx
	jmp	.L6146
.L18732:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6109
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6104
	jmp	.L6109
.L18731:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L6133
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6133
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L6133
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L6133
	movl	$1, %eax
	jmp	.L6134
.L18730:
	cmpw	$47, %dx
	jne	.L6130
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6130
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6130
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18784
	movq	24(%rbx), %rax
.L6128:
	cmpw	$67, (%rax)
	jne	.L6130
	cmpq	%rsi, %rcx
	jne	.L6130
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6122
.L18784:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6122
	jmp	.L6128
.L18729:
	movq	8(%rax), %rbx
	jmp	.L6122
.L18728:
	cmpw	$47, %dx
	je	.L18785
.L6119:
	xorl	%ebp, %ebp
	jmp	.L6111
.L18785:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6119
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6119
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18786
	movq	24(%rbp), %rax
.L6117:
	cmpw	$67, (%rax)
	jne	.L6119
	cmpq	%rsi, %rcx
	jne	.L6119
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6111
.L18786:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6111
	jmp	.L6117
.L18727:
	movq	8(%rax), %rbp
	jmp	.L6111
	.p2align 6,,7
.L6101:
	movq	992(%rsp), %r12
	movq	%r15, %rsi
	movq	8(%r12), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L6029
	movq	984(%rsp), %rbp
	movl	$15, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L6029
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L6029
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L6033
	cmpw	$34, %ax
	je	.L6033
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L6035
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18787
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18788
.L6035:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L6046
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18789
	cmpw	$33, (%r13)
	je	.L18790
.L6054:
	xorl	%ebx, %ebx
.L6046:
	testq	%rbp, %rbp
	je	.L6033
	testq	%rbx, %rbx
	je	.L6033
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18791
.L6057:
	xorl	%eax, %eax
.L6058:
	testl	%eax, %eax
	jne	.L18792
.L6033:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L6059
	testb	$16, 3(%rax)
	je	.L6059
	cmpw	$36, (%rax)
	je	.L6059
.L6060:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L6061
	testb	$16, 3(%rax)
	je	.L6061
	cmpw	$36, (%rax)
	je	.L6061
	movq	%rax, %rbx
	jmp	.L6060
.L6061:
	cmpq	%rbx, 1696(%rsp)
	je	.L6029
	movq	%rbx, %r13
.L6059:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L6066
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L6070
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6071
	movl	$14, %r11d
.L6070:
	testl	%ebx, %ebx
	je	.L6076
	cmpl	%r11d, %r14d
	jge	.L6029
.L6066:
	testl	%ebx, %ebx
	je	.L6076
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6076
.L6094:
	cmpq	%r13, 8(%rdi)
	je	.L18793
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6094
.L6076:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L6029
	testl	%r14d, %r14d
	jne	.L6096
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r11), %ecx
	movslq	16(%rbp,%r11),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17152:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L6029:
	movq	984(%rsp), %rax
	movq	992(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 984(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 992(%rsp)
	jne	.L6101
	jmp	.L16048
.L6096:
	cmpl	$14, %r14d
	je	.L16804
	cmpl	$15, %r14d
.L17631:
	jne	.L6029
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17151:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17152
.L16804:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17151
.L18793:
	testq	%r10, %r10
	je	.L6082
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18795
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r9,%rbp), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17150:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6082:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L6087
	movb	$15, 2(%rdi)
.L6087:
	testq	%r10, %r10
	je	.L6029
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16803
	cmpb	$14, %al
	je	.L16804
	cmpb	$15, %al
	jmp	.L17631
.L16803:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17152
.L18795:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17150
.L6071:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L6073
	movl	$15, %r11d
	jmp	.L6070
.L6073:
	xorl	%ebx, %ebx
	jmp	.L6070
.L18792:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L6033
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L6029
	jmp	.L6033
.L18791:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L6057
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L6057
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L6057
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L6057
	movl	$1, %eax
	jmp	.L6058
.L18790:
	cmpw	$47, %dx
	jne	.L6054
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6054
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6054
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18796
	movq	24(%rbx), %rax
.L6052:
	cmpw	$67, (%rax)
	jne	.L6054
	cmpq	%rsi, %rcx
	jne	.L6054
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L6046
.L18796:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L6046
	jmp	.L6052
.L18789:
	movq	8(%rax), %rbx
	jmp	.L6046
.L18788:
	cmpw	$47, %dx
	je	.L18797
.L6043:
	xorl	%ebp, %ebp
	jmp	.L6035
.L18797:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L6043
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L6043
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18798
	movq	24(%rbp), %rax
.L6041:
	cmpw	$67, (%rax)
	jne	.L6043
	cmpq	%rsi, %rcx
	jne	.L6043
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L6035
.L18798:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L6035
	jmp	.L6041
.L18787:
	movq	8(%rax), %rbp
	jmp	.L6035
	.p2align 6,,7
.L6025:
	movq	1008(%rsp), %r8
	movq	%r15, %rsi
	movq	8(%r8), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L5953
	movq	1000(%rsp), %rsi
	movl	$14, %r14d
	movq	8(%rsi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L5953
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L5953
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L5957
	cmpw	$34, %ax
	je	.L5957
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L5959
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18799
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18800
.L5959:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L5970
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18801
	cmpw	$33, (%r13)
	je	.L18802
.L5978:
	xorl	%ebx, %ebx
.L5970:
	testq	%rbp, %rbp
	je	.L5957
	testq	%rbx, %rbx
	je	.L5957
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L18803
.L5981:
	xorl	%eax, %eax
.L5982:
	testl	%eax, %eax
	jne	.L18804
.L5957:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5983
	testb	$16, 3(%rax)
	je	.L5983
	cmpw	$36, (%rax)
	je	.L5983
.L5984:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5985
	testb	$16, 3(%rax)
	je	.L5985
	cmpw	$36, (%rax)
	je	.L5985
	movq	%rax, %rbx
	jmp	.L5984
.L5985:
	cmpq	%rbx, 1696(%rsp)
	je	.L5953
	movq	%rbx, %r13
.L5983:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L5990
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5994
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5995
	movl	$14, %r11d
.L5994:
	testl	%ebx, %ebx
	je	.L6000
	cmpl	%r11d, %r14d
	jge	.L5953
.L5990:
	testl	%ebx, %ebx
	je	.L6000
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6000
.L6018:
	cmpq	%r13, 8(%rdi)
	je	.L18805
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L6018
.L6000:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L5953
	testl	%r14d, %r14d
	jne	.L6020
	movslq	8(%r13),%r11
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%r12,%r12,2), %r9
	salq	$4, %rdi
	salq	$4, %r9
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r9,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17149:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L5953:
	movq	1000(%rsp), %rax
	movq	1008(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 1000(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 1008(%rsp)
	jne	.L6025
	jmp	.L16045
.L6020:
	cmpl	$14, %r14d
	je	.L16802
	cmpl	$15, %r14d
.L17630:
	jne	.L5953
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17148:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17149
.L16802:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17148
.L18805:
	testq	%r10, %r10
	je	.L6006
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18807
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17147:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L6006:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L6011
	movb	$14, 2(%rdi)
.L6011:
	testq	%r10, %r10
	je	.L5953
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16801
	cmpb	$14, %al
	je	.L16802
	cmpb	$15, %al
	jmp	.L17630
.L16801:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17149
.L18807:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r11
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17147
.L5995:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5997
	movl	$15, %r11d
	jmp	.L5994
.L5997:
	xorl	%ebx, %ebx
	jmp	.L5994
.L18804:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L5957
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L5953
	jmp	.L5957
.L18803:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L5981
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L5981
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L5981
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L5981
	movl	$1, %eax
	jmp	.L5982
.L18802:
	cmpw	$47, %dx
	jne	.L5978
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5978
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5978
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18808
	movq	24(%rbx), %rax
.L5976:
	cmpw	$67, (%rax)
	jne	.L5978
	cmpq	%rsi, %rcx
	jne	.L5978
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L5970
.L18808:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L5970
	jmp	.L5976
.L18801:
	movq	8(%rax), %rbx
	jmp	.L5970
.L18800:
	cmpw	$47, %dx
	je	.L18809
.L5967:
	xorl	%ebp, %ebp
	jmp	.L5959
.L18809:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5967
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5967
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18810
	movq	24(%rbp), %rax
.L5965:
	cmpw	$67, (%rax)
	jne	.L5967
	cmpq	%rsi, %rcx
	jne	.L5967
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L5959
.L18810:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L5959
	jmp	.L5965
.L18799:
	movq	8(%rax), %rbp
	jmp	.L5959
.L18726:
	movq	1696(%rsp), %rdi
	movq	%rcx, %rsi
	movl	$14, %edx
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$8, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r10
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	movq	%r10, %rsi
	movl	$0, 32(%r10)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r15
	movq	%rax, 40(%r15)
	movl	$1, 36(%r15)
	jmp	.L5949
.L18725:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	testb	$2, target_flags+3(%rip)
	setne	%dl
	movq	8(%rax), %rdi
	movq	%rax, %r15
	movzbl	%dl, %esi
	movl	$1, %edx
	addl	$4, %esi
	call	cselib_lookup
	movq	8(%r15), %rdi
	call	cselib_subst_to_values
	movq	%rax, 8(%r15)
	jmp	.L5933
	.p2align 6,,7
.L18677:
	movq	1064(%rsp), %rbx
	movl	8(%rbx), %ebp
	cmpl	$52, %ebp
	jg	.L5493
	leal	-8(%rbp), %r12d
	cmpl	$7, %r12d
	jbe	.L5496
	leal	-21(%rbp), %ecx
	cmpl	$7, %ecx
	jbe	.L5496
	leal	-45(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L5496
	leal	-29(%rbp), %r8d
	cmpl	$7, %r8d
	ja	.L5494
.L5496:
	movq	1064(%rsp), %rsi
	movzbq	2(%rsi), %r9
	movl	mode_class(,%r9,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17132:
	addl	$2, %eax
.L5495:
	cmpl	$47, 1656(%rsp)
	je	.L18811
	movl	%eax, %ebx
	decl	%ebx
	js	.L5931
.L5522:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L5522
	jmp	.L5931
.L18811:
	movl	%eax, %ebx
	decl	%ebx
	js	.L5931
.L5517:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L5517
	jmp	.L5931
.L5494:
	movq	1064(%rsp), %rdi
	movzbl	2(%rdi), %eax
	cmpb	$18, %al
	je	.L18812
	cmpb	$24, %al
	je	.L18813
	movl	target_flags(%rip), %r10d
	testl	$33554432, %r10d
	movl	%r10d, %ecx
	je	.L5507
	movzbl	%al, %r13d 
	movzbl	mode_size(%r13), %r15d
	leal	7(%r15), %edx
.L5508:
	andl	$33554432, %ecx
	je	.L5509
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L5495
.L5509:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L5495
.L5507:
	movzbl	%al, %ebx 
	movzbl	mode_size(%rbx), %r14d
	leal	3(%r14), %edx
	jmp	.L5508
.L18813:
	xorl	%r11d, %r11d
	testb	$2, target_flags+3(%rip)
	sete	%r11b
	leal	4(%r11,%r11), %eax
	jmp	.L5495
.L18812:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17132
	.p2align 6,,7
.L5493:
	movq	1704(%rsp), %r12
	cmpl	68(%r12), %ebp
	jl	.L5524
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L5931
	jmp	.L17570
.L5524:
	cmpl	$47, 1656(%rsp)
	je	.L18814
	movq	reg_pending_clobbers(%rip), %rdi
.L17133:
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %eax
	testl	%eax, %eax
	jne	.L16492
	movslq	%ebp,%rbp
	movq	%rbp, %rcx
	movq	%rbp, 32(%rsp)
	addq	reg_known_equiv_p(%rip), %rcx
	cmpb	$0, (%rcx)
	je	.L16507
	movq	%rbp, %rdx
	salq	$3, %rdx
	addq	reg_known_value(%rip), %rdx
	movq	(%rdx), %rax
	cmpw	$66, (%rax)
	je	.L18815
.L16507:
	movq	reg_n_info(%rip), %rdx
.L5529:
	movq	32(%rsp), %r14
	movq	32(%rdx,%r14,8), %r11
	movl	32(%r11), %ebx
	testl	%ebx, %ebx
	jne	.L5931
	movq	1704(%rsp), %r12
	movq	48(%r12), %r15
	testq	%r15, %r15
	je	.L5931
	movl	$14, %r14d
.L5929:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L5856
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L5856
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L5861
	cmpw	$34, %ax
	je	.L5861
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L5863
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18816
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18817
.L5863:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L5874
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18818
	cmpw	$33, (%r13)
	je	.L18819
.L5882:
	xorl	%ebx, %ebx
.L5874:
	testq	%rbp, %rbp
	je	.L5861
	testq	%rbx, %rbx
	je	.L5861
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r8
	cmpb	$60, rtx_class(%r8)
	je	.L18820
.L5885:
	xorl	%eax, %eax
.L5886:
	testl	%eax, %eax
	jne	.L18821
.L5861:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5887
	testb	$16, 3(%rax)
	je	.L5887
	cmpw	$36, (%rax)
	je	.L5887
.L5888:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5889
	testb	$16, 3(%rax)
	je	.L5889
	cmpw	$36, (%rax)
	je	.L5889
	movq	%rax, %rbx
	jmp	.L5888
.L5889:
	cmpq	%rbx, 1696(%rsp)
	je	.L5856
	movq	%rbx, %r13
.L5887:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L5894
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5898
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5899
	movl	$14, %r11d
.L5898:
	testl	%ebx, %ebx
	je	.L5904
	cmpl	%r11d, %r14d
	jge	.L5856
.L5894:
	testl	%ebx, %ebx
	je	.L5904
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L5904
.L5922:
	cmpq	%r13, 8(%rdi)
	je	.L18822
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L5922
.L5904:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L5856
	testl	%r14d, %r14d
	jne	.L5924
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %r9
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r9
	salq	$4, %r12
	movl	16(%r9,%rbx), %ecx
	movslq	16(%r12,%rbx),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17146:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L5856:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L5929
	jmp	.L5931
.L5924:
	cmpl	$14, %r14d
	je	.L16800
	cmpl	$15, %r14d
.L17629:
	jne	.L5856
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17145:
	movslq	8(%r13),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17146
.L16800:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17145
.L18822:
	testq	%r10, %r10
	je	.L5910
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18824
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17144:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L5910:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L5915
	movb	$14, 2(%rdi)
.L5915:
	testq	%r10, %r10
	je	.L5856
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16799
	cmpb	$14, %al
	je	.L16800
	cmpb	$15, %al
	jmp	.L17629
.L16799:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%rbx
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%rbx,%rbx,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17146
.L18824:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %rbx
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17144
.L5899:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5901
	movl	$15, %r11d
	jmp	.L5898
.L5901:
	xorl	%ebx, %ebx
	jmp	.L5898
.L18821:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L5861
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L5856
	jmp	.L5861
.L18820:
	movzwl	(%rbx), %edi
	movslq	%edi,%rcx
	cmpb	$60, rtx_class(%rcx)
	jne	.L5885
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L5885
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rbp)
	jne	.L5885
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L5885
	movl	$1, %eax
	jmp	.L5886
.L18819:
	cmpw	$47, %dx
	jne	.L5882
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5882
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5882
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18825
	movq	24(%rbx), %rax
.L5880:
	cmpw	$67, (%rax)
	jne	.L5882
	cmpq	%rsi, %rcx
	jne	.L5882
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L5874
.L18825:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L5874
	jmp	.L5880
.L18818:
	movq	8(%rax), %rbx
	jmp	.L5874
.L18817:
	cmpw	$47, %dx
	je	.L18826
.L5871:
	xorl	%ebp, %ebp
	jmp	.L5863
.L18826:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5871
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5871
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18827
	movq	24(%rbp), %rax
.L5869:
	cmpw	$67, (%rax)
	jne	.L5871
	cmpq	%rsi, %rcx
	jne	.L5871
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L5863
.L18827:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L5863
	jmp	.L5869
.L18816:
	movq	8(%rax), %rbp
	jmp	.L5863
.L18815:
	movq	8(%rax), %r15
	testq	%r15, %r15
	je	.L16507
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L5532
	mov	%eax, %r8d
	jmp	*.L5839(,%r8,8)
	.section	.rodata
	.align 8
	.align 4
.L5839:
	.quad	.L5823
	.quad	.L5823
	.quad	.L5532
	.quad	.L5823
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5810
	.quad	.L5532
	.quad	.L16507
	.quad	.L16507
	.quad	.L16507
	.quad	.L5532
	.quad	.L16507
	.quad	.L5532
	.quad	.L5532
	.quad	.L5539
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5570
	.quad	.L16507
	.quad	.L16507
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5532
	.quad	.L5835
	.quad	.L5835
	.quad	.L5835
	.quad	.L5835
	.quad	.L5837
	.quad	.L5837
	.text
.L5539:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L5540
	leal	-8(%rbp), %r9d
	cmpl	$7, %r9d
	jbe	.L5543
	leal	-21(%rbp), %esi
	cmpl	$7, %esi
	jbe	.L5543
	leal	-45(%rbp), %edi
	cmpl	$7, %edi
	jbe	.L5543
	leal	-29(%rbp), %r11d
	cmpl	$7, %r11d
	ja	.L5541
.L5543:
	movzbq	2(%r15), %r10
	movl	mode_class(,%r10,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17134:
	addl	$2, %eax
.L5542:
	movl	%eax, %ebx
	decl	%ebx
	js	.L16507
.L5563:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L5563
	jmp	.L16507
.L5541:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18828
	cmpb	$24, %al
	je	.L18829
	movl	target_flags(%rip), %r13d
	testl	$33554432, %r13d
	movl	%r13d, %ecx
	je	.L5554
	movzbl	%al, %ebx 
	movzbl	mode_size(%rbx), %r14d
	leal	7(%r14), %edx
.L5555:
	andl	$33554432, %ecx
	je	.L5556
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L5542
.L5556:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L5542
.L5554:
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r12d
	leal	3(%r12), %edx
	jmp	.L5555
.L18829:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L5542
.L18828:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17134
.L5540:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %ebp
	jl	.L5565
	movq	1696(%rsp), %rcx
	movq	32(%rcx), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L16507
	jmp	.L17569
.L5565:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %eax
	testl	%eax, %eax
	jne	.L16499
	movq	reg_known_equiv_p(%rip), %r8
	movslq	%ebp,%rbx
	addq	%rbx, %r8
	cmpb	$0, (%r8)
	je	.L5568
	leaq	0(,%rbx,8), %r9
	addq	reg_known_value(%rip), %r9
	movq	(%r9), %rax
	cmpw	$66, (%rax)
	je	.L18830
.L5568:
	movq	reg_n_info(%rip), %rdx
	movq	32(%rdx,%rbx,8), %rsi
	movl	32(%rsi), %eax
	testl	%eax, %eax
	jne	.L5529
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	56(%r11), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rdi
	movq	%rax, 56(%rdi)
	jmp	.L16507
.L18830:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L5568
.L16499:
	movslq	%ebp,%rbx
	jmp	.L5568
.L5823:
	cmpl	$41, %ebx
	je	.L18831
.L5825:
	movb	$1, reg_pending_barrier(%rip)
.L5824:
	cmpl	$41, %ebx
	je	.L18832
.L5532:
	movslq	%ebx,%rbp
	movzbl	rtx_length(%rbp), %edi
	movq	rtx_format(,%rbp,8), %r13
	movl	%edi, %ebp
	decl	%ebp
	js	.L16507
	leaq	8(%r15), %r14
.L5852:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18833
	cmpb	$69, %dl
	je	.L18834
.L5842:
	decl	%ebp
	jns	.L5852
	jmp	.L16507
.L18834:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L5842
	movq	%rdx, %r12
.L5851:
	movq	(%r12), %r10
	movslq	%ebx,%r9
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%r9,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rdx
	cmpl	(%rdx), %ebx
	jl	.L5851
	jmp	.L5842
.L18833:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L5842
.L18832:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L16507
.L5831:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %rcx
	cmpl	(%rcx), %ebx
	movq	%rcx, %rdx
	jl	.L5831
	jmp	.L16507
.L18831:
	testb	$8, 3(%r15)
	je	.L5824
	jmp	.L5825
.L5810:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r8
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r8, %rsi
	movl	$0, 32(%r8)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r12
	movq	%rax, 40(%r12)
	movl	$1, 36(%r12)
	jmp	.L5532
.L5570:
	movq	current_sched_info(%rip), %r10
	movq	%r15, 1056(%rsp)
	testb	$2, 96(%r10)
	jne	.L18835
.L5571:
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %rbp
	movq	(%rax), %r12
	movq	8(%rbp), %rdx
	testq	%r12, %r12
	movq	%r12, 1040(%rsp)
	movq	%rdx, 1048(%rsp)
	jne	.L5651
.L16031:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %rbx
	movq	24(%r11), %r9
	testq	%rbx, %rbx
	movq	%rbx, 1024(%rsp)
	movq	%r9, 1032(%rsp)
	jne	.L5727
.L16034:
	movq	1704(%rsp), %r9
	movq	40(%r9), %r10
	testq	%r10, %r10
	movq	%r10, 1016(%rsp)
	je	.L16037
.L5807:
	movq	1016(%rsp), %r11
	movq	8(%r11), %r14
	cmpw	$33, (%r14)
	je	.L18836
.L5733:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L5730
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L5730
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L5739
	cmpw	$34, %ax
	je	.L5739
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L5741
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18837
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18838
.L5741:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L5752
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18839
	cmpw	$33, (%r14)
	je	.L18840
.L5760:
	xorl	%ebx, %ebx
.L5752:
	testq	%rbp, %rbp
	je	.L5739
	testq	%rbx, %rbx
	je	.L5739
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18841
.L5763:
	xorl	%eax, %eax
.L5764:
	testl	%eax, %eax
	jne	.L18842
.L5739:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5765
	testb	$16, 3(%rax)
	je	.L5765
	cmpw	$36, (%rax)
	je	.L5765
.L5766:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5767
	testb	$16, 3(%rax)
	je	.L5767
	cmpw	$36, (%rax)
	je	.L5767
	movq	%rax, %rbx
	jmp	.L5766
.L5767:
	cmpq	%rbx, 1696(%rsp)
	je	.L5730
	movq	%rbx, %r13
.L5765:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L5772
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%rbp
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	leaq	(%rbp,%rbp,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r12
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	movl	%edx, %ecx
	leaq	0(,%r12,8), %rdi
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5776
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5777
	movl	$14, %r11d
.L5776:
	testl	%ebx, %ebx
	je	.L5782
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L5730
.L5772:
	testl	%ebx, %ebx
	je	.L5782
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5782
.L5800:
	cmpq	%r13, 8(%rdi)
	je	.L18843
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L5800
.L5782:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L5730
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L5802
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rsi
	leaq	(%rcx,%rcx,2), %r14
	salq	$4, %rsi
	salq	$4, %r14
	movl	16(%rsi,%r9), %ecx
	movslq	16(%r14,%r9),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17143:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L5730:
	movq	1016(%rsp), %rsi
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 1016(%rsp)
	jne	.L5807
.L16037:
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%r11), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r10
	movq	1704(%rsp), %r9
	movq	%rax, (%r9)
	testb	$2, 96(%r10)
	jne	.L18844
.L5808:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %r14
	incl	32(%r14)
	movq	%rax, 8(%r14)
	movq	%r14, %rdi
	movq	8(%r15), %rsi
	call	sched_analyze_2
	jmp	.L16507
.L18844:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L5808
.L5802:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16798
	movl	$14, %r14d
	cmpl	$15, %r14d
.L17628:
	jne	.L5730
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r8
	movq	h_i_d(%rip), %rcx
	leaq	(%r8,%r8,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17142:
	movslq	8(%r13),%rdi
	leaq	(%rdi,%rdi,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17143
.L16798:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17142
.L18843:
	testq	%r10, %r10
	je	.L5788
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18846
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%r14
	movq	h_i_d(%rip), %r11
	movslq	8(%r12),%rcx
	leaq	(%r14,%r14,2), %r9
	salq	$4, %r9
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%r9,%r11), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r11),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17141:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L5788:
	movzbl	2(%rdi), %ebp
	movl	$14, %eax
	cmpl	%ebp, %eax
	jge	.L5793
	movb	$14, 2(%rdi)
.L5793:
	testq	%r10, %r10
	je	.L5730
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16797
	cmpb	$14, %al
	je	.L16798
	cmpb	$15, %al
	jmp	.L17628
.L16797:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%rsi
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbp), %ecx
	leaq	(%rsi,%rsi,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rbp),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17143
.L18846:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rbp
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r14), %ecx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r14),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17141
.L5777:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5779
	movl	$15, %r11d
	jmp	.L5776
.L5779:
	xorl	%ebx, %ebx
	jmp	.L5776
.L18842:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L5739
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L5730
	jmp	.L5739
.L18841:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L5763
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L5763
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L5763
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L5763
	movl	$1, %eax
	jmp	.L5764
.L18840:
	cmpw	$47, %dx
	jne	.L5760
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5760
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5760
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18847
	movq	24(%rbx), %rax
.L5758:
	cmpw	$67, (%rax)
	jne	.L5760
	cmpq	%rsi, %rcx
	jne	.L5760
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L5752
.L18847:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L5752
	jmp	.L5758
.L18839:
	movq	8(%rax), %rbx
	jmp	.L5752
.L18838:
	cmpw	$47, %dx
	je	.L18848
.L5749:
	xorl	%ebp, %ebp
	jmp	.L5741
.L18848:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5749
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5749
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18849
	movq	24(%rbp), %rax
.L5747:
	cmpw	$67, (%rax)
	jne	.L5749
	cmpq	%rsi, %rcx
	jne	.L5749
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L5741
.L18849:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L5741
	jmp	.L5747
.L18837:
	movq	8(%rax), %rbp
	jmp	.L5741
.L18836:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18850
.L5734:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L5730
	movq	1016(%rsp), %rcx
	movq	8(%rcx), %r14
	jmp	.L5733
.L18850:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L5734
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	cmovne	%rbp, %rdi
	jmp	.L5734
.L5727:
	movq	1032(%rsp), %r12
	movq	1056(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L5655
	movq	1024(%rsp), %rbp
	xorl	%r14d, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L5655
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L5655
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L5659
	cmpw	$34, %ax
	je	.L5659
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L5661
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18851
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18852
.L5661:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L5672
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18853
	cmpw	$33, (%r13)
	je	.L18854
.L5680:
	xorl	%ebx, %ebx
.L5672:
	testq	%rbp, %rbp
	je	.L5659
	testq	%rbx, %rbx
	je	.L5659
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18855
.L5683:
	xorl	%eax, %eax
.L5684:
	testl	%eax, %eax
	jne	.L18856
.L5659:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5685
	testb	$16, 3(%rax)
	je	.L5685
	cmpw	$36, (%rax)
	je	.L5685
.L5686:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5687
	testb	$16, 3(%rax)
	je	.L5687
	cmpw	$36, (%rax)
	je	.L5687
	movq	%rax, %rbx
	jmp	.L5686
.L5687:
	cmpq	%rbx, 1696(%rsp)
	je	.L5655
	movq	%rbx, %r13
.L5685:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L5692
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5696
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5697
	movl	$14, %r11d
.L5696:
	testl	%ebx, %ebx
	je	.L5702
	cmpl	%r11d, %r14d
	jge	.L5655
.L5692:
	testl	%ebx, %ebx
	je	.L5702
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5702
.L5720:
	cmpq	%r13, 8(%rdi)
	je	.L18857
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L5720
.L5702:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L5655
	testl	%r14d, %r14d
	jne	.L5722
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17140:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L5655:
	movq	1024(%rsp), %rax
	movq	1032(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 1024(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 1032(%rsp)
	jne	.L5727
	jmp	.L16034
.L5722:
	cmpl	$14, %r14d
	je	.L16796
	cmpl	$15, %r14d
.L17627:
	jne	.L5655
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17139:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17140
.L16796:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17139
.L18857:
	testq	%r10, %r10
	je	.L5708
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18859
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17138:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L5708:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L5713
	movb	$0, 2(%rdi)
.L5713:
	testq	%r10, %r10
	je	.L5655
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16795
	cmpb	$14, %al
	je	.L16796
	cmpb	$15, %al
	jmp	.L17627
.L16795:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17140
.L18859:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17138
.L5697:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5699
	movl	$15, %r11d
	jmp	.L5696
.L5699:
	xorl	%ebx, %ebx
	jmp	.L5696
.L18856:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L5659
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L5655
	jmp	.L5659
.L18855:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L5683
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L5683
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L5683
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L5683
	movl	$1, %eax
	jmp	.L5684
.L18854:
	cmpw	$47, %dx
	jne	.L5680
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5680
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5680
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18860
	movq	24(%rbx), %rax
.L5678:
	cmpw	$67, (%rax)
	jne	.L5680
	cmpq	%rsi, %rcx
	jne	.L5680
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L5672
.L18860:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L5672
	jmp	.L5678
.L18853:
	movq	8(%rax), %rbx
	jmp	.L5672
.L18852:
	cmpw	$47, %dx
	je	.L18861
.L5669:
	xorl	%ebp, %ebp
	jmp	.L5661
.L18861:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5669
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5669
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18862
	movq	24(%rbp), %rax
.L5667:
	cmpw	$67, (%rax)
	jne	.L5669
	cmpq	%rsi, %rcx
	jne	.L5669
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L5661
.L18862:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L5661
	jmp	.L5667
.L18851:
	movq	8(%rax), %rbp
	jmp	.L5661
.L5651:
	movq	1048(%rsp), %rcx
	movq	1056(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L5579
	movq	1040(%rsp), %r8
	movl	$14, %r14d
	movq	8(%r8), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L5579
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L5579
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L5583
	cmpw	$34, %ax
	je	.L5583
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L5585
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18863
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18864
.L5585:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L5596
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18865
	cmpw	$33, (%r13)
	je	.L18866
.L5604:
	xorl	%ebx, %ebx
.L5596:
	testq	%rbp, %rbp
	je	.L5583
	testq	%rbx, %rbx
	je	.L5583
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r9
	cmpb	$60, rtx_class(%r9)
	je	.L18867
.L5607:
	xorl	%eax, %eax
.L5608:
	testl	%eax, %eax
	jne	.L18868
.L5583:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5609
	testb	$16, 3(%rax)
	je	.L5609
	cmpw	$36, (%rax)
	je	.L5609
.L5610:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5611
	testb	$16, 3(%rax)
	je	.L5611
	cmpw	$36, (%rax)
	je	.L5611
	movq	%rax, %rbx
	jmp	.L5610
.L5611:
	cmpq	%rbx, 1696(%rsp)
	je	.L5579
	movq	%rbx, %r13
.L5609:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L5616
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5620
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5621
	movl	$14, %r11d
.L5620:
	testl	%ebx, %ebx
	je	.L5626
	cmpl	%r11d, %r14d
	jge	.L5579
.L5616:
	testl	%ebx, %ebx
	je	.L5626
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5626
.L5644:
	cmpq	%r13, 8(%rdi)
	je	.L18869
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L5644
.L5626:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L5579
	testl	%r14d, %r14d
	jne	.L5646
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17137:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L5579:
	movq	1040(%rsp), %rax
	movq	1048(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 1040(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 1048(%rsp)
	jne	.L5651
	jmp	.L16031
.L5646:
	cmpl	$14, %r14d
	je	.L16794
	cmpl	$15, %r14d
.L17626:
	jne	.L5579
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17136:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17137
.L16794:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17136
.L18869:
	testq	%r10, %r10
	je	.L5632
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18871
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17135:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L5632:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L5637
	movb	$14, 2(%rdi)
.L5637:
	testq	%r10, %r10
	je	.L5579
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16793
	cmpb	$14, %al
	je	.L16794
	cmpb	$15, %al
	jmp	.L17626
.L16793:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17137
.L18871:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17135
.L5621:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5623
	movl	$15, %r11d
	jmp	.L5620
.L5623:
	xorl	%ebx, %ebx
	jmp	.L5620
.L18868:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L5583
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L5579
	jmp	.L5583
.L18867:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L5607
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L5607
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%rbp)
	jne	.L5607
	movq	16(%rbx), %r11
	cmpq	%r11, 16(%rbp)
	jne	.L5607
	movl	$1, %eax
	jmp	.L5608
.L18866:
	cmpw	$47, %dx
	jne	.L5604
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5604
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5604
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18872
	movq	24(%rbx), %rax
.L5602:
	cmpw	$67, (%rax)
	jne	.L5604
	cmpq	%rsi, %rcx
	jne	.L5604
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L5596
.L18872:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L5596
	jmp	.L5602
.L18865:
	movq	8(%rax), %rbx
	jmp	.L5596
.L18864:
	cmpw	$47, %dx
	je	.L18873
.L5593:
	xorl	%ebp, %ebp
	jmp	.L5585
.L18873:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5593
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5593
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18874
	movq	24(%rbp), %rax
.L5591:
	cmpw	$67, (%rax)
	jne	.L5593
	cmpq	%rsi, %rcx
	jne	.L5593
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L5585
.L18874:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L5585
	jmp	.L5591
.L18863:
	movq	8(%rax), %rbp
	jmp	.L5585
.L18835:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%bl
	movq	%rax, 1056(%rsp)
	movq	8(%rax), %rdi
	movzbl	%bl, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	1056(%rsp), %r14
	movq	8(%r14), %rdi
	call	cselib_subst_to_values
	movq	1056(%rsp), %r13
	movq	%rax, 8(%r13)
	jmp	.L5571
.L5835:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17461:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L16507
.L5837:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17461
.L16492:
	movq	reg_n_info(%rip), %rdx
	movslq	%ebp,%r15
	movq	%r15, 32(%rsp)
	jmp	.L5529
.L18814:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17133
	.p2align 6,,7
.L5179:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18875
	cmpb	$24, %al
	je	.L18876
	movl	target_flags(%rip), %r9d
	testl	$33554432, %r9d
	movl	%r9d, %ecx
	je	.L5192
	movzbl	%al, %edi 
	movzbl	mode_size(%rdi), %esi
	leal	7(%rsi), %edx
.L5193:
	andl	$33554432, %ecx
	je	.L5194
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L5180
.L5194:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L5180
.L5192:
	movzbl	%al, %r10d 
	movzbl	mode_size(%r10), %r11d
	leal	3(%r11), %edx
	jmp	.L5193
.L18876:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L5180
.L18875:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17121
	.p2align 6,,7
.L5178:
	movq	1704(%rsp), %r13
	cmpl	68(%r13), %ebp
	jl	.L5203
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L4844
	jmp	.L17569
	.p2align 6,,7
.L5203:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %eax
	testl	%eax, %eax
	jne	.L16485
	movq	reg_known_equiv_p(%rip), %r14
	movslq	%ebp,%rbx
	addq	%rbx, %r14
	cmpb	$0, (%r14)
	je	.L5206
	leaq	0(,%rbx,8), %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rax
	cmpw	$66, (%rax)
	je	.L18877
.L5206:
	leaq	0(,%rbx,8), %rcx
	addq	reg_n_info(%rip), %rcx
	movq	32(%rcx), %rbx
	movl	32(%rbx), %eax
	testl	%eax, %eax
	jne	.L4844
	movq	1704(%rsp), %rdx
	movq	1696(%rsp), %rdi
	movq	56(%rdx), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r8
	movq	%rax, 56(%r8)
	jmp	.L4844
.L18877:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L5206
	.p2align 6,,7
.L16485:
	movslq	%ebp,%rbx
	jmp	.L5206
	.p2align 6,,7
.L5461:
	cmpl	$41, %ebx
	je	.L18878
.L5463:
	movb	$1, reg_pending_barrier(%rip)
.L5462:
	cmpl	$41, %ebx
	je	.L18879
.L5170:
	movslq	%ebx,%rbp
	movzbl	rtx_length(%rbp), %esi
	movq	rtx_format(,%rbp,8), %r13
	movl	%esi, %r12d
	decl	%r12d
	js	.L4844
	leaq	8(%r15), %r14
	.p2align 4,,7
.L5490:
	movslq	%r12d,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18880
	cmpb	$69, %dl
	je	.L18881
.L5480:
	decl	%r12d
	jns	.L5490
	jmp	.L4844
	.p2align 6,,7
.L18881:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rdi
	cmpl	(%rdi), %ebx
	jge	.L5480
	movq	%rdx, %rbp
	.p2align 4,,7
.L5489:
	movq	(%rbp), %r10
	movslq	%ebx,%rax
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%rax,8), %rsi
	call	sched_analyze_2
	movq	(%rbp), %r11
	cmpl	(%r11), %ebx
	jl	.L5489
	jmp	.L5480
	.p2align 6,,7
.L18880:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L5480
.L18879:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L4844
.L5469:
	movslq	%ebx,%r9
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r9,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %r8
	cmpl	(%r8), %ebx
	movq	%r8, %rdx
	jl	.L5469
	jmp	.L4844
.L18878:
	testb	$8, 3(%r15)
	je	.L5462
	jmp	.L5463
.L5448:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rdx
	movq	1696(%rsp), %rdi
	movq	%rdx, %rsi
	movl	$0, 32(%rdx)
	movl	$14, %edx
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rcx
	movq	%rax, 40(%rcx)
	movl	$1, 36(%rcx)
	jmp	.L5170
.L5208:
	movq	current_sched_info(%rip), %r9
	movq	%r15, 1072(%rsp)
	testb	$2, 96(%r9)
	jne	.L18882
.L5209:
	movq	1704(%rsp), %r10
	movq	(%r10), %r12
	movq	8(%r10), %r13
	testq	%r12, %r12
	jne	.L5289
.L16016:
	movq	1704(%rsp), %rdx
	movq	16(%rdx), %r12
	movq	24(%rdx), %r13
	testq	%r12, %r12
	jne	.L5365
.L16019:
	movq	1704(%rsp), %r12
	movq	40(%r12), %r13
	testq	%r13, %r13
	je	.L16022
.L5445:
	movq	8(%r13), %rbx
	cmpw	$33, (%rbx)
	je	.L18883
.L5371:
	cmpq	%rbx, 1696(%rsp)
	movq	%rbx, %rbp
	je	.L5368
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L5368
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L5377
	cmpw	$34, %ax
	je	.L5377
	movq	32(%rcx), %rax
	xorl	%r14d, %r14d
	testq	%rax, %rax
	je	.L5379
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18884
	xorl	%r14d, %r14d
	cmpw	$33, %dx
	je	.L18885
.L5379:
	movq	32(%rbx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L5390
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18886
	cmpw	$33, (%rbx)
	je	.L18887
.L5398:
	xorl	%r12d, %r12d
.L5390:
	testq	%r14, %r14
	je	.L5377
	testq	%r12, %r12
	je	.L5377
	movzwl	(%r14), %r10d
	movl	%r10d, 1632(%rsp)
	movslq	1632(%rsp),%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18888
.L5401:
	xorl	%eax, %eax
.L5402:
	testl	%eax, %eax
	jne	.L18889
.L5377:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5403
	testb	$16, 3(%rax)
	je	.L5403
	cmpw	$36, (%rax)
	je	.L5403
.L5404:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5405
	testb	$16, 3(%rax)
	je	.L5405
	cmpw	$36, (%rax)
	je	.L5405
	movq	%rax, %rbx
	jmp	.L5404
.L5405:
	cmpq	%rbx, 1696(%rsp)
	je	.L5368
	movq	%rbx, %rbp
.L5403:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r9d
	testq	%rsi, %rsi
	movq	%rsi, %rbx
	je	.L5410
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r10
	testq	%r10, %r10
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r14),%r12
	movl	16(%rcx,%r14), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5414
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5415
	movl	$14, %r11d
.L5414:
	testl	%r9d, %r9d
	je	.L5420
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L5368
.L5410:
	testl	%r9d, %r9d
	je	.L5420
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L5420
.L5438:
	cmpq	%rbp, 8(%rdi)
	je	.L18890
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L5438
.L5420:
	movq	1696(%rsp), %rbx
	movq	%rbp, %rdi
	movq	48(%rbx), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L5368
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L5440
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rbp),%rdx
	leaq	(%rcx,%rcx,2), %r12
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %r12
	salq	$4, %r10
	movslq	16(%r12,%r14),%r11
	movl	16(%r10,%r14), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r11,8), %rax
.L17130:
	andl	$63, %ecx
	movl	$1, %r10d
	salq	%cl, %r10
	orq	%r10, 16(%rax)
.L5368:
	movq	16(%r13), %r13
	testq	%r13, %r13
	jne	.L5445
.L16022:
	movq	1704(%rsp), %rax
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%rax), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r13
	movq	1704(%rsp), %r14
	movq	%rax, (%r14)
	testb	$2, 96(%r13)
	jne	.L18891
.L5446:
	movq	1704(%rsp), %r12
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%r12), %rdx
	call	alloc_EXPR_LIST
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rbx
	incl	32(%rbx)
	movq	%rax, 8(%rbx)
	movq	%rbx, %rdi
	movq	8(%r15), %rsi
	call	sched_analyze_2
	jmp	.L4844
.L18891:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L5446
.L5440:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16792
	movl	$14, %edx
	cmpl	$15, %edx
.L17625:
	jne	.L5368
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17129:
	movslq	8(%rbp),%r11
	leaq	(%r11,%r11,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17130
.L16792:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17129
.L18890:
	testq	%rbx, %rbx
	je	.L5426
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18893
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %r14
	movslq	8(%rsi),%rcx
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %r10
	leaq	(%rcx,%rcx,2), %r12
	movl	16(%r10,%r14), %ecx
	salq	$4, %r12
	movslq	16(%r12,%r14),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17128:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L5426:
	movzbl	2(%rdi), %r9d
	movl	$14, %eax
	cmpl	%r9d, %eax
	jge	.L5431
	movb	$14, 2(%rdi)
.L5431:
	testq	%rbx, %rbx
	je	.L5368
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16791
	cmpb	$14, %al
	je	.L16792
	cmpb	$15, %al
	jmp	.L17625
.L16791:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r11
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r14
	leaq	(%r11,%r11,2), %r9
	salq	$4, %r9
	movl	16(%r9,%rdi), %ecx
	leaq	(%r14,%r14,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%rbx,%r8,8), %rax
	jmp	.L17130
.L18893:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r12
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rsi
	leaq	(%r12,%r12,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r14),%r11
	movl	16(%rdx,%r14), %ecx
	movl	%ecx, %r10d
	salq	$3, %r11
	shrl	$6, %r10d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17128
	.p2align 6,,7
.L5415:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r10,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5417
	movl	$15, %r11d
	jmp	.L5414
.L5417:
	xorl	%r9d, %r9d
	jmp	.L5414
.L18889:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L5377
	movq	1696(%rsp), %rsi
	movq	%r12, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L5368
	jmp	.L5377
.L18888:
	movzwl	(%r12), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L5401
	call	reverse_condition
	cmpl	%eax, 1632(%rsp)
	jne	.L5401
	movq	8(%r12), %rax
	cmpq	%rax, 8(%r14)
	jne	.L5401
	movq	16(%r12), %rdi
	cmpq	%rdi, 16(%r14)
	jne	.L5401
	movl	$1, %eax
	jmp	.L5402
	.p2align 6,,7
.L18887:
	cmpw	$47, %dx
	jne	.L5398
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5398
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5398
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18894
	movq	24(%r12), %rax
.L5396:
	cmpw	$67, (%rax)
	jne	.L5398
	cmpq	%rsi, %rcx
	jne	.L5398
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L5390
.L18894:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L5390
	jmp	.L5396
	.p2align 6,,7
.L18886:
	movq	8(%rax), %r12
	jmp	.L5390
.L18885:
	cmpw	$47, %cx
	je	.L18895
.L5387:
	xorl	%r14d, %r14d
	jmp	.L5379
.L18895:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5387
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5387
	movq	8(%rax), %r14
	movq	16(%r14), %rcx
	cmpw	$67, (%rcx)
	je	.L18896
	movq	24(%r14), %rax
.L5385:
	cmpw	$67, (%rax)
	jne	.L5387
	cmpq	%rsi, %rcx
	jne	.L5387
	movzwl	(%r14), %edi
	call	reverse_condition
	movq	16(%r14), %rcx
	movq	8(%r14), %rdx
	movzbl	2(%r14), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r14
	jmp	.L5379
.L18896:
	movq	24(%r14), %rax
	cmpq	%rdx, %rax
	je	.L5379
	jmp	.L5385
	.p2align 6,,7
.L18884:
	movq	8(%rax), %r14
	jmp	.L5379
.L18883:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18897
.L5372:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L5368
	movq	8(%r13), %rbx
	jmp	.L5371
.L18897:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L5372
	mov	%eax, %r8d
	salq	$3, %r8
	addq	reg_known_value(%rip), %r8
	movq	(%r8), %rdx
	testq	%rdx, %rdx
	cmovne	%rdx, %rdi
	jmp	.L5372
	.p2align 6,,7
.L5365:
	movq	8(%r13), %rdi
	movq	1072(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	call	true_dependence
	testl	%eax, %eax
	je	.L5293
	movq	8(%r12), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L5293
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L5293
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L5297
	cmpw	$34, %ax
	je	.L5297
	movq	32(%rcx), %rax
	xorl	%r14d, %r14d
	testq	%rax, %rax
	je	.L5299
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18898
	xorl	%r14d, %r14d
	cmpw	$33, %dx
	je	.L18899
.L5299:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L5310
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18900
	cmpw	$33, (%rbp)
	je	.L18901
.L5318:
	xorl	%ebx, %ebx
.L5310:
	testq	%r14, %r14
	je	.L5297
	testq	%rbx, %rbx
	je	.L5297
	movzwl	(%r14), %r8d
	movl	%r8d, 1636(%rsp)
	movslq	1636(%rsp),%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18902
.L5321:
	xorl	%eax, %eax
.L5322:
	testl	%eax, %eax
	jne	.L18903
.L5297:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5323
	testb	$16, 3(%rax)
	je	.L5323
	cmpw	$36, (%rax)
	je	.L5323
.L5324:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5325
	testb	$16, 3(%rax)
	je	.L5325
	cmpw	$36, (%rax)
	je	.L5325
	movq	%rax, %rbx
	jmp	.L5324
.L5325:
	cmpq	%rbx, 1696(%rsp)
	je	.L5293
	movq	%rbx, %rbp
.L5323:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r10d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L5330
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%rdx
	movslq	8(%rax),%r14
	leaq	(%r14,%r14,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r14
	leaq	0(,%r14,8), %rdi
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	movl	%edx, %r14d
	andl	$63, %edx
	shrl	$6, %r14d
	mov	%r14d, %ecx
	leaq	0(,%rcx,8), %r14
	movq	%r14, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5334
	movq	%r14, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5335
	movl	$14, %ebx
.L5334:
	testl	%r10d, %r10d
	je	.L5340
	xorl	%r9d, %r9d
	cmpl	%ebx, %r9d
	jge	.L5293
.L5330:
	testl	%r10d, %r10d
	je	.L5340
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5340
.L5358:
	cmpq	%rbp, 8(%rdi)
	je	.L18904
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L5358
.L5340:
	movq	1696(%rsp), %r11
	movq	%rbp, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L5293
	xorl	%edi, %edi
	testl	%edi, %edi
	jne	.L5360
	movslq	8(%rdx),%rbx
	movq	h_i_d(%rip), %r9
	movslq	8(%rbp),%rdx
	leaq	(%rbx,%rbx,2), %rcx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$4, %rcx
	salq	$4, %rsi
	movslq	16(%rcx,%r9),%r14
	movl	16(%rsi,%r9), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17127:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L5293:
	movq	16(%r12), %r12
	movq	16(%r13), %r13
	testq	%r12, %r12
	jne	.L5365
	jmp	.L16019
.L5360:
	xorl	%r8d, %r8d
	cmpl	$14, %r8d
	je	.L16790
	xorl	%r10d, %r10d
	cmpl	$15, %r10d
.L17624:
	jne	.L5293
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r14
	leaq	(%r14,%r14,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17126:
	movslq	8(%rbp),%rbx
	leaq	(%rbx,%rbx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17127
.L16790:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r8
	movq	h_i_d(%rip), %rcx
	leaq	(%r8,%r8,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17126
.L18904:
	testq	%r11, %r11
	je	.L5346
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18906
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %rsi
	movslq	8(%rax),%r9
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	leaq	(%r9,%r9,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rsi),%rbx
	movl	16(%r14,%rsi), %ecx
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17125:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L5346:
	movzbl	2(%rdi), %ebx
	xorl	%r10d, %r10d
	cmpl	%ebx, %r10d
	jge	.L5351
	movb	$0, 2(%rdi)
.L5351:
	testq	%r11, %r11
	je	.L5293
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16789
	cmpb	$14, %al
	je	.L16790
	cmpb	$15, %al
	jmp	.L17624
.L16789:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r9
	movq	h_i_d(%rip), %rsi
	movslq	8(%rax),%rbx
	leaq	(%r9,%r9,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rsi), %ecx
	leaq	(%rbx,%rbx,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%rsi),%r10
	movl	%ecx, %edi
	shrl	$6, %edi
	mov	%edi, %eax
	salq	$3, %rax
	addq	(%r11,%r10,8), %rax
	jmp	.L17127
.L18906:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%r9
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r14), %ecx
	leaq	(%r9,%r9,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%r14),%r10
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	salq	$3, %r10
	addq	anti_dependency_cache(%rip), %r10
	addq	(%r10), %rax
	jmp	.L17125
	.p2align 6,,7
.L5335:
	movq	%r14, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5337
	movl	$15, %ebx
	jmp	.L5334
.L5337:
	xorl	%r10d, %r10d
	jmp	.L5334
.L18903:
	movq	%r14, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L5297
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L5293
	jmp	.L5297
.L18902:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L5321
	call	reverse_condition
	cmpl	%eax, 1636(%rsp)
	jne	.L5321
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%r14)
	jne	.L5321
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%r14)
	jne	.L5321
	movl	$1, %eax
	jmp	.L5322
	.p2align 6,,7
.L18901:
	cmpw	$47, %dx
	jne	.L5318
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5318
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5318
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18907
	movq	24(%rbx), %rax
.L5316:
	cmpw	$67, (%rax)
	jne	.L5318
	cmpq	%rsi, %rcx
	jne	.L5318
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L5310
.L18907:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L5310
	jmp	.L5316
	.p2align 6,,7
.L18900:
	movq	8(%rax), %rbx
	jmp	.L5310
.L18899:
	cmpw	$47, %cx
	je	.L18908
.L5307:
	xorl	%r14d, %r14d
	jmp	.L5299
.L18908:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5307
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5307
	movq	8(%rax), %r14
	movq	16(%r14), %rcx
	cmpw	$67, (%rcx)
	je	.L18909
	movq	24(%r14), %rax
.L5305:
	cmpw	$67, (%rax)
	jne	.L5307
	cmpq	%rsi, %rcx
	jne	.L5307
	movzwl	(%r14), %edi
	call	reverse_condition
	movq	16(%r14), %rcx
	movq	8(%r14), %rdx
	movzbl	2(%r14), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r14
	jmp	.L5299
.L18909:
	movq	24(%r14), %rax
	cmpq	%rdx, %rax
	je	.L5299
	jmp	.L5305
	.p2align 6,,7
.L18898:
	movq	8(%rax), %r14
	jmp	.L5299
	.p2align 6,,7
.L5289:
	movq	8(%r13), %rdi
	movq	1072(%rsp), %rsi
	call	read_dependence
	testl	%eax, %eax
	je	.L5217
	movq	8(%r12), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L5217
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L5217
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L5221
	cmpw	$34, %ax
	je	.L5221
	movq	32(%rcx), %rax
	xorl	%r14d, %r14d
	testq	%rax, %rax
	je	.L5223
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18910
	xorl	%r14d, %r14d
	cmpw	$33, %dx
	je	.L18911
.L5223:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L5234
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18912
	cmpw	$33, (%rbp)
	je	.L18913
.L5242:
	xorl	%ebx, %ebx
.L5234:
	testq	%r14, %r14
	je	.L5221
	testq	%rbx, %rbx
	je	.L5221
	movzwl	(%r14), %r8d
	movl	%r8d, 1640(%rsp)
	movslq	1640(%rsp),%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18914
.L5245:
	xorl	%eax, %eax
.L5246:
	testl	%eax, %eax
	jne	.L18915
.L5221:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5247
	testb	$16, 3(%rax)
	je	.L5247
	cmpw	$36, (%rax)
	je	.L5247
.L5248:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5249
	testb	$16, 3(%rax)
	je	.L5249
	cmpw	$36, (%rax)
	je	.L5249
	movq	%rax, %rbx
	jmp	.L5248
.L5249:
	cmpq	%rbx, 1696(%rsp)
	je	.L5217
	movq	%rbx, %rbp
.L5247:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r10d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L5254
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%rdx
	movslq	8(%rax),%r14
	leaq	(%r14,%r14,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r14
	leaq	0(,%r14,8), %rdi
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	movl	%edx, %r14d
	andl	$63, %edx
	shrl	$6, %r14d
	mov	%r14d, %ecx
	leaq	0(,%rcx,8), %r14
	movq	%r14, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5258
	movq	%r14, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5259
	movl	$14, %ebx
.L5258:
	testl	%r10d, %r10d
	je	.L5264
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L5217
.L5254:
	testl	%r10d, %r10d
	je	.L5264
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5264
.L5282:
	cmpq	%rbp, 8(%rdi)
	je	.L18916
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L5282
.L5264:
	movq	1696(%rsp), %r11
	movq	%rbp, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L5217
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L5284
	movslq	8(%rdx),%rbx
	movq	h_i_d(%rip), %rsi
	movslq	8(%rbp),%rdx
	leaq	(%rbx,%rbx,2), %rcx
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %rcx
	salq	$4, %r14
	movslq	16(%rcx,%rsi),%r9
	movl	16(%r14,%rsi), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17124:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L5217:
	movq	16(%r12), %r12
	movq	16(%r13), %r13
	testq	%r12, %r12
	jne	.L5289
	jmp	.L16016
.L5284:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16788
	movl	$14, %r8d
	cmpl	$15, %r8d
.L17623:
	jne	.L5217
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rdi
	leaq	(%rdi,%rdi,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17123:
	movslq	8(%rbp),%rsi
	leaq	(%rsi,%rsi,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17124
.L16788:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rbx
	movq	h_i_d(%rip), %rcx
	leaq	(%rbx,%rbx,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17123
.L18916:
	testq	%r11, %r11
	je	.L5270
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18918
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r14),%rbx
	movl	16(%r9,%r14), %ecx
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17122:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L5270:
	movzbl	2(%rdi), %ebx
	movl	$14, %r10d
	cmpl	%ebx, %r10d
	jge	.L5275
	movb	$14, 2(%rdi)
.L5275:
	testq	%r11, %r11
	je	.L5217
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16787
	cmpb	$14, %al
	je	.L16788
	cmpb	$15, %al
	jmp	.L17623
.L16787:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r14
	movq	h_i_d(%rip), %r9
	movslq	8(%rax),%rdx
	leaq	(%r14,%r14,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%r9), %ecx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%r9),%r8
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r11,%r8,8), %rax
	jmp	.L17124
.L18918:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%r8
	leaq	(%rcx,%rcx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rdx), %ecx
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%rdx),%r10
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r10
	addq	anti_dependency_cache(%rip), %r10
	addq	(%r10), %rax
	jmp	.L17122
	.p2align 6,,7
.L5259:
	movq	%r14, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5261
	movl	$15, %ebx
	jmp	.L5258
.L5261:
	xorl	%r10d, %r10d
	jmp	.L5258
.L18915:
	movq	%r14, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L5221
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L5217
	jmp	.L5221
.L18914:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L5245
	call	reverse_condition
	cmpl	%eax, 1640(%rsp)
	jne	.L5245
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%r14)
	jne	.L5245
	movq	16(%rbx), %r9
	cmpq	%r9, 16(%r14)
	jne	.L5245
	movl	$1, %eax
	jmp	.L5246
	.p2align 6,,7
.L18913:
	cmpw	$47, %dx
	jne	.L5242
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5242
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5242
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18919
	movq	24(%rbx), %rax
.L5240:
	cmpw	$67, (%rax)
	jne	.L5242
	cmpq	%rsi, %rcx
	jne	.L5242
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L5234
.L18919:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L5234
	jmp	.L5240
	.p2align 6,,7
.L18912:
	movq	8(%rax), %rbx
	jmp	.L5234
.L18911:
	cmpw	$47, %cx
	je	.L18920
.L5231:
	xorl	%r14d, %r14d
	jmp	.L5223
.L18920:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5231
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5231
	movq	8(%rax), %r14
	movq	16(%r14), %rcx
	cmpw	$67, (%rcx)
	je	.L18921
	movq	24(%r14), %rax
.L5229:
	cmpw	$67, (%rax)
	jne	.L5231
	cmpq	%rsi, %rcx
	jne	.L5231
	movzwl	(%r14), %edi
	call	reverse_condition
	movq	16(%r14), %rcx
	movq	8(%r14), %rdx
	movzbl	2(%r14), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r14
	jmp	.L5223
.L18921:
	movq	24(%r14), %rax
	cmpq	%rdx, %rax
	je	.L5223
	jmp	.L5229
	.p2align 6,,7
.L18910:
	movq	8(%rax), %r14
	jmp	.L5223
.L18882:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%dil
	movq	%rax, 1072(%rsp)
	movzbl	%dil, %esi
	movq	8(%rax), %rdi
	addl	$4, %esi
	call	cselib_lookup
	movq	1072(%rsp), %r11
	movq	8(%r11), %rdi
	call	cselib_subst_to_values
	movq	1072(%rsp), %rsi
	movq	%rax, 8(%rsi)
	jmp	.L5209
.L5473:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17131:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L4844
.L5475:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17131
.L4856:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18922
	cmpb	$24, %al
	je	.L18923
	movl	target_flags(%rip), %r12d
	testl	$33554432, %r12d
	movl	%r12d, %ecx
	je	.L4869
	movzbl	%al, %r10d 
	movzbl	mode_size(%r10), %r8d
	leal	7(%r8), %edx
.L4870:
	andl	$33554432, %ecx
	je	.L4871
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L4857
.L4871:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L4857
.L4869:
	movzbl	%al, %r13d 
	movzbl	mode_size(%r13), %r15d
	leal	3(%r15), %edx
	jmp	.L4870
.L18923:
	xorl	%r14d, %r14d
	testb	$2, target_flags+3(%rip)
	sete	%r14b
	leal	4(%r14,%r14), %eax
	jmp	.L4857
.L18922:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17110
	.p2align 6,,7
.L4855:
	movq	1704(%rsp), %rcx
	cmpl	68(%rcx), %ebp
	jl	.L4880
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L4846
	jmp	.L17569
	.p2align 6,,7
.L4880:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %edi
	testl	%edi, %edi
	jne	.L16478
	movq	reg_known_equiv_p(%rip), %rdx
	movslq	%ebp,%rbx
	addq	%rbx, %rdx
	cmpb	$0, (%rdx)
	je	.L4883
	leaq	0(,%rbx,8), %rsi
	addq	reg_known_value(%rip), %rsi
	movq	(%rsi), %rax
	cmpw	$66, (%rax)
	je	.L18924
.L4883:
	leaq	0(,%rbx,8), %r9
	addq	reg_n_info(%rip), %r9
	movq	32(%r9), %rbx
	movl	32(%rbx), %eax
	testl	%eax, %eax
	jne	.L4846
	movq	1704(%rsp), %r14
	movq	1696(%rsp), %rdi
	movq	56(%r14), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r11
	movq	%rax, 56(%r11)
	jmp	.L4846
.L18924:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L4883
	.p2align 6,,7
.L16478:
	movslq	%ebp,%rbx
	jmp	.L4883
	.p2align 6,,7
.L5138:
	cmpl	$41, %ebx
	je	.L18925
.L5140:
	movb	$1, reg_pending_barrier(%rip)
.L5139:
	cmpl	$41, %ebx
	je	.L18926
.L4847:
	movslq	%ebx,%rbp
	movzbl	rtx_length(%rbp), %esi
	movq	rtx_format(,%rbp,8), %r13
	movl	%esi, %r12d
	decl	%r12d
	js	.L4846
	leaq	8(%r15), %r14
	.p2align 4,,7
.L5167:
	movslq	%r12d,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18927
	cmpb	$69, %dl
	je	.L18928
.L5157:
	decl	%r12d
	jns	.L5167
	jmp	.L4846
	.p2align 6,,7
.L18928:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rdi
	cmpl	(%rdi), %ebx
	jge	.L5157
	movq	%rdx, %rbp
	.p2align 4,,7
.L5166:
	movq	(%rbp), %r10
	movslq	%ebx,%rax
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%rax,8), %rsi
	call	sched_analyze_2
	movq	(%rbp), %r11
	cmpl	(%r11), %ebx
	jl	.L5166
	jmp	.L5157
	.p2align 6,,7
.L18927:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L5157
.L18926:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L4846
.L5146:
	movslq	%ebx,%r9
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r9,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %r8
	cmpl	(%r8), %ebx
	movq	%r8, %rdx
	jl	.L5146
	jmp	.L4846
.L18925:
	testb	$8, 3(%r15)
	je	.L5139
	jmp	.L5140
.L5125:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rdx
	movq	1696(%rsp), %rdi
	movq	%rdx, %rsi
	movl	$0, 32(%rdx)
	movl	$14, %edx
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rcx
	movq	%rax, 40(%rcx)
	movl	$1, 36(%rcx)
	jmp	.L4847
.L4885:
	movq	current_sched_info(%rip), %r12
	movq	%r15, 1080(%rsp)
	testb	$2, 96(%r12)
	jne	.L18929
.L4886:
	movq	1704(%rsp), %rbp
	movq	(%rbp), %r12
	movq	8(%rbp), %r13
	testq	%r12, %r12
	jne	.L4966
.L16003:
	movq	1704(%rsp), %rdx
	movq	16(%rdx), %r12
	movq	24(%rdx), %r13
	testq	%r12, %r12
	jne	.L5042
.L16006:
	movq	1704(%rsp), %r12
	movq	40(%r12), %r13
	testq	%r13, %r13
	je	.L16009
.L5122:
	movq	8(%r13), %rbx
	cmpw	$33, (%rbx)
	je	.L18930
.L5048:
	cmpq	%rbx, 1696(%rsp)
	movq	%rbx, %rbp
	je	.L5045
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L5045
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L5054
	cmpw	$34, %ax
	je	.L5054
	movq	32(%rcx), %rax
	xorl	%r14d, %r14d
	testq	%rax, %rax
	je	.L5056
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18931
	xorl	%r14d, %r14d
	cmpw	$33, %dx
	je	.L18932
.L5056:
	movq	32(%rbx), %rax
	xorl	%r12d, %r12d
	testq	%rax, %rax
	je	.L5067
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18933
	cmpw	$33, (%rbx)
	je	.L18934
.L5075:
	xorl	%r12d, %r12d
.L5067:
	testq	%r14, %r14
	je	.L5054
	testq	%r12, %r12
	je	.L5054
	movzwl	(%r14), %r10d
	movl	%r10d, 1644(%rsp)
	movslq	1644(%rsp),%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18935
.L5078:
	xorl	%eax, %eax
.L5079:
	testl	%eax, %eax
	jne	.L18936
.L5054:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5080
	testb	$16, 3(%rax)
	je	.L5080
	cmpw	$36, (%rax)
	je	.L5080
.L5081:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5082
	testb	$16, 3(%rax)
	je	.L5082
	cmpw	$36, (%rax)
	je	.L5082
	movq	%rax, %rbx
	jmp	.L5081
.L5082:
	cmpq	%rbx, 1696(%rsp)
	je	.L5045
	movq	%rbx, %rbp
.L5080:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r9d
	testq	%rsi, %rsi
	movq	%rsi, %rbx
	je	.L5087
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r10
	testq	%r10, %r10
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r14),%r12
	movl	16(%rcx,%r14), %edx
	leaq	0(,%r12,8), %rdi
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %r12
	movl	%edx, %ecx
	movq	%r12, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5091
	movq	%r12, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5092
	movl	$14, %r11d
.L5091:
	testl	%r9d, %r9d
	je	.L5097
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L5045
.L5087:
	testl	%r9d, %r9d
	je	.L5097
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L5097
.L5115:
	cmpq	%rbp, 8(%rdi)
	je	.L18937
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L5115
.L5097:
	movq	1696(%rsp), %rbx
	movq	%rbp, %rdi
	movq	48(%rbx), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L5045
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L5117
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rbp),%rdx
	leaq	(%rcx,%rcx,2), %r12
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %r12
	salq	$4, %r10
	movslq	16(%r12,%r14),%r11
	movl	16(%r10,%r14), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r11,8), %rax
.L17119:
	andl	$63, %ecx
	movl	$1, %r10d
	salq	%cl, %r10
	orq	%r10, 16(%rax)
.L5045:
	movq	16(%r13), %r13
	testq	%r13, %r13
	jne	.L5122
.L16009:
	movq	1704(%rsp), %rax
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%rax), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r13
	movq	1704(%rsp), %r14
	movq	%rax, (%r14)
	testb	$2, 96(%r13)
	jne	.L18938
.L5123:
	movq	1704(%rsp), %r12
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%r12), %rdx
	call	alloc_EXPR_LIST
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rbx
	incl	32(%rbx)
	movq	%rax, 8(%rbx)
	movq	%rbx, %rdi
	movq	8(%r15), %rsi
	call	sched_analyze_2
	jmp	.L4846
.L18938:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L5123
.L5117:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16786
	movl	$14, %edx
	cmpl	$15, %edx
.L17622:
	jne	.L5045
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17118:
	movslq	8(%rbp),%r11
	leaq	(%r11,%r11,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17119
.L16786:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17118
.L18937:
	testq	%rbx, %rbx
	je	.L5103
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18940
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %r14
	movslq	8(%rsi),%rcx
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %r10
	leaq	(%rcx,%rcx,2), %r12
	movl	16(%r10,%r14), %ecx
	salq	$4, %r12
	movslq	16(%r12,%r14),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17117:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L5103:
	movzbl	2(%rdi), %r9d
	movl	$14, %eax
	cmpl	%r9d, %eax
	jge	.L5108
	movb	$14, 2(%rdi)
.L5108:
	testq	%rbx, %rbx
	je	.L5045
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16785
	cmpb	$14, %al
	je	.L16786
	cmpb	$15, %al
	jmp	.L17622
.L16785:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r11
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r14
	leaq	(%r11,%r11,2), %r9
	salq	$4, %r9
	movl	16(%r9,%rdi), %ecx
	leaq	(%r14,%r14,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%rbx,%r8,8), %rax
	jmp	.L17119
.L18940:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r12
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rsi
	leaq	(%r12,%r12,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r14),%r11
	movl	16(%rdx,%r14), %ecx
	movl	%ecx, %r10d
	salq	$3, %r11
	shrl	$6, %r10d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17117
	.p2align 6,,7
.L5092:
	movq	%r12, %r8
	movl	%edx, %ecx
	addq	(%r10,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5094
	movl	$15, %r11d
	jmp	.L5091
.L5094:
	xorl	%r9d, %r9d
	jmp	.L5091
.L18936:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L5054
	movq	1696(%rsp), %rsi
	movq	%r12, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L5045
	jmp	.L5054
.L18935:
	movzwl	(%r12), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L5078
	call	reverse_condition
	cmpl	%eax, 1644(%rsp)
	jne	.L5078
	movq	8(%r12), %rax
	cmpq	%rax, 8(%r14)
	jne	.L5078
	movq	16(%r12), %rdi
	cmpq	%rdi, 16(%r14)
	jne	.L5078
	movl	$1, %eax
	jmp	.L5079
	.p2align 6,,7
.L18934:
	cmpw	$47, %dx
	jne	.L5075
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5075
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5075
	movq	8(%rax), %r12
	movq	16(%r12), %rcx
	cmpw	$67, (%rcx)
	je	.L18941
	movq	24(%r12), %rax
.L5073:
	cmpw	$67, (%rax)
	jne	.L5075
	cmpq	%rsi, %rcx
	jne	.L5075
	movzwl	(%r12), %edi
	call	reverse_condition
	movq	16(%r12), %rcx
	movq	8(%r12), %rdx
	movzbl	2(%r12), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r12
	jmp	.L5067
.L18941:
	movq	24(%r12), %rax
	cmpq	%rdx, %rax
	je	.L5067
	jmp	.L5073
	.p2align 6,,7
.L18933:
	movq	8(%rax), %r12
	jmp	.L5067
.L18932:
	cmpw	$47, %cx
	je	.L18942
.L5064:
	xorl	%r14d, %r14d
	jmp	.L5056
.L18942:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L5064
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L5064
	movq	8(%rax), %r14
	movq	16(%r14), %rcx
	cmpw	$67, (%rcx)
	je	.L18943
	movq	24(%r14), %rax
.L5062:
	cmpw	$67, (%rax)
	jne	.L5064
	cmpq	%rsi, %rcx
	jne	.L5064
	movzwl	(%r14), %edi
	call	reverse_condition
	movq	16(%r14), %rcx
	movq	8(%r14), %rdx
	movzbl	2(%r14), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r14
	jmp	.L5056
.L18943:
	movq	24(%r14), %rax
	cmpq	%rdx, %rax
	je	.L5056
	jmp	.L5062
	.p2align 6,,7
.L18931:
	movq	8(%rax), %r14
	jmp	.L5056
.L18930:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18944
.L5049:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L5045
	movq	8(%r13), %rbx
	jmp	.L5048
.L18944:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L5049
	mov	%eax, %r8d
	salq	$3, %r8
	addq	reg_known_value(%rip), %r8
	movq	(%r8), %rdx
	testq	%rdx, %rdx
	cmovne	%rdx, %rdi
	jmp	.L5049
	.p2align 6,,7
.L5042:
	movq	8(%r13), %rdi
	movq	1080(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	call	true_dependence
	testl	%eax, %eax
	je	.L4970
	movq	8(%r12), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L4970
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L4970
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L4974
	cmpw	$34, %ax
	je	.L4974
	movq	32(%rcx), %rax
	xorl	%r14d, %r14d
	testq	%rax, %rax
	je	.L4976
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18945
	xorl	%r14d, %r14d
	cmpw	$33, %dx
	je	.L18946
.L4976:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4987
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18947
	cmpw	$33, (%rbp)
	je	.L18948
.L4995:
	xorl	%ebx, %ebx
.L4987:
	testq	%r14, %r14
	je	.L4974
	testq	%rbx, %rbx
	je	.L4974
	movzwl	(%r14), %r8d
	movl	%r8d, 1648(%rsp)
	movslq	1648(%rsp),%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18949
.L4998:
	xorl	%eax, %eax
.L4999:
	testl	%eax, %eax
	jne	.L18950
.L4974:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L5000
	testb	$16, 3(%rax)
	je	.L5000
	cmpw	$36, (%rax)
	je	.L5000
.L5001:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L5002
	testb	$16, 3(%rax)
	je	.L5002
	cmpw	$36, (%rax)
	je	.L5002
	movq	%rax, %rbx
	jmp	.L5001
.L5002:
	cmpq	%rbx, 1696(%rsp)
	je	.L4970
	movq	%rbx, %rbp
.L5000:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r10d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L5007
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%rdx
	movslq	8(%rax),%r14
	leaq	(%r14,%r14,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r14
	leaq	0(,%r14,8), %rdi
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	movl	%edx, %r14d
	andl	$63, %edx
	shrl	$6, %r14d
	mov	%r14d, %ecx
	leaq	0(,%rcx,8), %r14
	movq	%r14, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L5011
	movq	%r14, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5012
	movl	$14, %ebx
.L5011:
	testl	%r10d, %r10d
	je	.L5017
	xorl	%r9d, %r9d
	cmpl	%ebx, %r9d
	jge	.L4970
.L5007:
	testl	%r10d, %r10d
	je	.L5017
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L5017
.L5035:
	cmpq	%rbp, 8(%rdi)
	je	.L18951
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L5035
.L5017:
	movq	1696(%rsp), %r11
	movq	%rbp, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L4970
	xorl	%edi, %edi
	testl	%edi, %edi
	jne	.L5037
	movslq	8(%rdx),%rbx
	movq	h_i_d(%rip), %r9
	movslq	8(%rbp),%rdx
	leaq	(%rbx,%rbx,2), %rcx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$4, %rcx
	salq	$4, %rsi
	movslq	16(%rcx,%r9),%r14
	movl	16(%rsi,%r9), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17116:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L4970:
	movq	16(%r12), %r12
	movq	16(%r13), %r13
	testq	%r12, %r12
	jne	.L5042
	jmp	.L16006
.L5037:
	xorl	%r8d, %r8d
	cmpl	$14, %r8d
	je	.L16784
	xorl	%r10d, %r10d
	cmpl	$15, %r10d
.L17621:
	jne	.L4970
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r14
	leaq	(%r14,%r14,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17115:
	movslq	8(%rbp),%rbx
	leaq	(%rbx,%rbx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17116
.L16784:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r8
	movq	h_i_d(%rip), %rcx
	leaq	(%r8,%r8,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17115
.L18951:
	testq	%r11, %r11
	je	.L5023
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18953
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %rsi
	movslq	8(%rax),%r9
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	leaq	(%r9,%r9,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rsi),%rbx
	movl	16(%r14,%rsi), %ecx
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17114:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L5023:
	movzbl	2(%rdi), %ebx
	xorl	%r10d, %r10d
	cmpl	%ebx, %r10d
	jge	.L5028
	movb	$0, 2(%rdi)
.L5028:
	testq	%r11, %r11
	je	.L4970
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16783
	cmpb	$14, %al
	je	.L16784
	cmpb	$15, %al
	jmp	.L17621
.L16783:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r9
	movq	h_i_d(%rip), %rsi
	movslq	8(%rax),%rbx
	leaq	(%r9,%r9,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rsi), %ecx
	leaq	(%rbx,%rbx,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%rsi),%r10
	movl	%ecx, %edi
	shrl	$6, %edi
	mov	%edi, %eax
	salq	$3, %rax
	addq	(%r11,%r10,8), %rax
	jmp	.L17116
.L18953:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%r9
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r14), %ecx
	leaq	(%r9,%r9,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%r14),%r10
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	salq	$3, %r10
	addq	anti_dependency_cache(%rip), %r10
	addq	(%r10), %rax
	jmp	.L17114
	.p2align 6,,7
.L5012:
	movq	%r14, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L5014
	movl	$15, %ebx
	jmp	.L5011
.L5014:
	xorl	%r10d, %r10d
	jmp	.L5011
.L18950:
	movq	%r14, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4974
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4970
	jmp	.L4974
.L18949:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L4998
	call	reverse_condition
	cmpl	%eax, 1648(%rsp)
	jne	.L4998
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%r14)
	jne	.L4998
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%r14)
	jne	.L4998
	movl	$1, %eax
	jmp	.L4999
	.p2align 6,,7
.L18948:
	cmpw	$47, %dx
	jne	.L4995
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4995
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4995
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18954
	movq	24(%rbx), %rax
.L4993:
	cmpw	$67, (%rax)
	jne	.L4995
	cmpq	%rsi, %rcx
	jne	.L4995
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4987
.L18954:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4987
	jmp	.L4993
	.p2align 6,,7
.L18947:
	movq	8(%rax), %rbx
	jmp	.L4987
.L18946:
	cmpw	$47, %cx
	je	.L18955
.L4984:
	xorl	%r14d, %r14d
	jmp	.L4976
.L18955:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4984
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4984
	movq	8(%rax), %r14
	movq	16(%r14), %rcx
	cmpw	$67, (%rcx)
	je	.L18956
	movq	24(%r14), %rax
.L4982:
	cmpw	$67, (%rax)
	jne	.L4984
	cmpq	%rsi, %rcx
	jne	.L4984
	movzwl	(%r14), %edi
	call	reverse_condition
	movq	16(%r14), %rcx
	movq	8(%r14), %rdx
	movzbl	2(%r14), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r14
	jmp	.L4976
.L18956:
	movq	24(%r14), %rax
	cmpq	%rdx, %rax
	je	.L4976
	jmp	.L4982
	.p2align 6,,7
.L18945:
	movq	8(%rax), %r14
	jmp	.L4976
	.p2align 6,,7
.L4966:
	movq	8(%r13), %rdi
	movq	1080(%rsp), %rsi
	call	read_dependence
	testl	%eax, %eax
	je	.L4894
	movq	8(%r12), %rbp
	cmpq	%rbp, 1696(%rsp)
	je	.L4894
	movl	(%rbp), %eax
	cmpw	$37, %ax
	je	.L4894
	movq	1696(%rsp), %rcx
	movzwl	(%rcx), %edx
	cmpw	$34, %dx
	je	.L4898
	cmpw	$34, %ax
	je	.L4898
	movq	32(%rcx), %rax
	xorl	%r14d, %r14d
	testq	%rax, %rax
	je	.L4900
	movzwl	(%rax), %ecx
	cmpw	$38, %cx
	je	.L18957
	xorl	%r14d, %r14d
	cmpw	$33, %dx
	je	.L18958
.L4900:
	movq	32(%rbp), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4911
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18959
	cmpw	$33, (%rbp)
	je	.L18960
.L4919:
	xorl	%ebx, %ebx
.L4911:
	testq	%r14, %r14
	je	.L4898
	testq	%rbx, %rbx
	je	.L4898
	movzwl	(%r14), %edi
	movl	%edi, 1652(%rsp)
	movslq	1652(%rsp),%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L18961
.L4922:
	xorl	%eax, %eax
.L4923:
	testl	%eax, %eax
	jne	.L18962
.L4898:
	movq	%rbp, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L4924
	testb	$16, 3(%rax)
	je	.L4924
	cmpw	$36, (%rax)
	je	.L4924
.L4925:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L4926
	testb	$16, 3(%rax)
	je	.L4926
	cmpw	$36, (%rax)
	je	.L4926
	movq	%rax, %rbx
	jmp	.L4925
.L4926:
	cmpq	%rbx, 1696(%rsp)
	je	.L4894
	movq	%rbx, %rbp
.L4924:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %r10d
	testq	%rsi, %rsi
	movq	%rsi, %r11
	je	.L4931
	movq	anti_dependency_cache(%rip), %r8
	xorl	%ebx, %ebx
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%rdx
	movslq	8(%rax),%r14
	leaq	(%r14,%r14,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r14
	leaq	0(,%r14,8), %rdi
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	movl	%edx, %r14d
	andl	$63, %edx
	shrl	$6, %r14d
	mov	%r14d, %ecx
	leaq	0(,%rcx,8), %r14
	movq	%r14, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L4935
	movq	%r14, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4936
	movl	$14, %ebx
.L4935:
	testl	%r10d, %r10d
	je	.L4941
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L4894
.L4931:
	testl	%r10d, %r10d
	je	.L4941
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4941
.L4959:
	cmpq	%rbp, 8(%rdi)
	je	.L18963
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4959
.L4941:
	movq	1696(%rsp), %r11
	movq	%rbp, %rdi
	movq	48(%r11), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L4894
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L4961
	movslq	8(%rdx),%rbx
	movq	h_i_d(%rip), %rsi
	movslq	8(%rbp),%rdx
	leaq	(%rbx,%rbx,2), %rcx
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %rcx
	salq	$4, %r14
	movslq	16(%rcx,%rsi),%r10
	movl	16(%r14,%rsi), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%r8,%r10,8), %rax
.L17113:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L4894:
	movq	16(%r12), %r12
	movq	16(%r13), %r13
	testq	%r12, %r12
	jne	.L4966
	jmp	.L16003
.L4961:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16782
	movl	$14, %r8d
	cmpl	$15, %r8d
.L17620:
	jne	.L4894
	movq	1696(%rsp), %r10
	movq	h_i_d(%rip), %rcx
	movslq	8(%r10),%rdi
	leaq	(%rdi,%rdi,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17112:
	movslq	8(%rbp),%rsi
	leaq	(%rsi,%rsi,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %ecx
	movl	%ecx, %ebp
	shrl	$6, %ebp
	mov	%ebp, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17113
.L16782:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rbx
	movq	h_i_d(%rip), %rcx
	leaq	(%rbx,%rbx,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17112
.L18963:
	testq	%r11, %r11
	je	.L4947
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18965
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rdx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r10
	salq	$4, %r10
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r14),%rbx
	movl	16(%r10,%r14), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17111:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4947:
	movzbl	2(%rdi), %ebx
	movl	$14, %r9d
	cmpl	%ebx, %r9d
	jge	.L4952
	movb	$14, 2(%rdi)
.L4952:
	testq	%r11, %r11
	je	.L4894
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16781
	cmpb	$14, %al
	je	.L16782
	cmpb	$15, %al
	jmp	.L17620
.L16781:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%r14
	movq	h_i_d(%rip), %r10
	movslq	8(%rax),%rdx
	leaq	(%r14,%r14,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%r10), %ecx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%r10),%r8
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11,%r8,8), %rax
	jmp	.L17113
.L18965:
	movq	1696(%rsp), %rax
	movslq	8(%rbp),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%r8
	leaq	(%rcx,%rcx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rdx), %ecx
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movslq	16(%rsi,%rdx),%r9
	movl	%ecx, %r10d
	shrl	$6, %r10d
	mov	%r10d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17111
	.p2align 6,,7
.L4936:
	movq	%r14, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4938
	movl	$15, %ebx
	jmp	.L4935
.L4938:
	xorl	%r10d, %r10d
	jmp	.L4935
.L18962:
	movq	%r14, %rdi
	movq	%rbp, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4898
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4894
	jmp	.L4898
.L18961:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L4922
	call	reverse_condition
	cmpl	%eax, 1652(%rsp)
	jne	.L4922
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%r14)
	jne	.L4922
	movq	16(%rbx), %rsi
	cmpq	%rsi, 16(%r14)
	jne	.L4922
	movl	$1, %eax
	jmp	.L4923
	.p2align 6,,7
.L18960:
	cmpw	$47, %dx
	jne	.L4919
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4919
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4919
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18966
	movq	24(%rbx), %rax
.L4917:
	cmpw	$67, (%rax)
	jne	.L4919
	cmpq	%rsi, %rcx
	jne	.L4919
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4911
.L18966:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4911
	jmp	.L4917
	.p2align 6,,7
.L18959:
	movq	8(%rax), %rbx
	jmp	.L4911
.L18958:
	cmpw	$47, %cx
	je	.L18967
.L4908:
	xorl	%r14d, %r14d
	jmp	.L4900
.L18967:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4908
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4908
	movq	8(%rax), %r14
	movq	16(%r14), %rcx
	cmpw	$67, (%rcx)
	je	.L18968
	movq	24(%r14), %rax
.L4906:
	cmpw	$67, (%rax)
	jne	.L4908
	cmpq	%rsi, %rcx
	jne	.L4908
	movzwl	(%r14), %edi
	call	reverse_condition
	movq	16(%r14), %rcx
	movq	8(%r14), %rdx
	movzbl	2(%r14), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %r14
	jmp	.L4900
.L18968:
	movq	24(%r14), %rax
	cmpq	%rdx, %rax
	je	.L4900
	jmp	.L4906
	.p2align 6,,7
.L18957:
	movq	8(%rax), %r14
	jmp	.L4900
.L18929:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r13b
	movq	%rax, 1080(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r13b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	1080(%rsp), %r10
	movq	8(%r10), %rdi
	call	cselib_subst_to_values
	movq	1080(%rsp), %r8
	movq	%rax, 8(%r8)
	jmp	.L4886
.L5150:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17120:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L4846
.L5152:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17120
.L18676:
	cmpw	$133, %dx
	je	.L5491
	cmpw	$132, %dx
	jne	.L16000
	jmp	.L5491
.L18675:
	movq	1064(%rsp), %rbp
	movq	8(%rbp), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L15985
.L4516:
	movslq	%ebx,%r12
	movq	8(%rdx,%r12,8), %rcx
	movq	8(%rcx), %rdx
	testq	%rdx, %rdx
	jne	.L18969
.L4513:
	decl	%ebx
	js	.L15985
	movq	1064(%rsp), %r8
	movq	8(%r8), %rdx
	jmp	.L4516
.L15985:
	movq	1624(%rsp), %rax
	cmpw	$47, (%rax)
	jne	.L3416
	movq	16(%rax), %r15
	testq	%r15, %r15
	je	.L3416
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L4520
	mov	%eax, %edx
	jmp	*.L4827(,%rdx,8)
	.section	.rodata
	.align 8
	.align 4
.L4827:
	.quad	.L4811
	.quad	.L4811
	.quad	.L4520
	.quad	.L4811
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4798
	.quad	.L4520
	.quad	.L3416
	.quad	.L3416
	.quad	.L3416
	.quad	.L4520
	.quad	.L3416
	.quad	.L4520
	.quad	.L4520
	.quad	.L4527
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4558
	.quad	.L3416
	.quad	.L3416
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L4520
	.quad	.L6810
	.quad	.L6810
	.quad	.L6810
	.quad	.L6810
	.quad	.L6812
	.quad	.L6812
	.text
.L4527:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L4528
	leal	-8(%rbp), %ebx
	cmpl	$7, %ebx
	jbe	.L4531
	leal	-21(%rbp), %esi
	cmpl	$7, %esi
	jbe	.L4531
	leal	-45(%rbp), %edi
	cmpl	$7, %edi
	jbe	.L4531
	leal	-29(%rbp), %r9d
	cmpl	$7, %r9d
	ja	.L4529
.L4531:
	movzbq	2(%r15), %r11
	movl	mode_class(,%r11,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17100:
	addl	$2, %eax
.L4530:
	movl	%eax, %ebx
	decl	%ebx
	js	.L3416
.L4551:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L4551
	jmp	.L3416
.L4529:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L18970
	cmpb	$24, %al
	je	.L18971
	movl	target_flags(%rip), %r14d
	testl	$33554432, %r14d
	movl	%r14d, %ecx
	je	.L4542
	movzbl	%al, %r10d 
	movzbl	mode_size(%r10), %r13d
	leal	7(%r13), %edx
.L4543:
	andl	$33554432, %ecx
	je	.L4544
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L4530
.L4544:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L4530
.L4542:
	movzbl	%al, %r12d 
	movzbl	mode_size(%r12), %r8d
	leal	3(%r8), %edx
	jmp	.L4543
.L18971:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L4530
.L18970:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17100
.L4528:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %ebp
	jl	.L4553
	movq	1696(%rsp), %rbp
	movq	32(%rbp), %rax
	jmp	.L17689
.L4553:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L16471
	movq	reg_known_equiv_p(%rip), %rdx
	movslq	%ebp,%rbx
	addq	%rbx, %rdx
	cmpb	$0, (%rdx)
	je	.L4556
	leaq	0(,%rbx,8), %rsi
	addq	reg_known_value(%rip), %rsi
	movq	(%rsi), %rax
	cmpw	$66, (%rax)
	je	.L18972
.L4556:
	leaq	0(,%rbx,8), %r9
	addq	reg_n_info(%rip), %r9
	movq	32(%r9), %rdi
	movl	32(%rdi), %ebx
	testl	%ebx, %ebx
	jne	.L3416
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	56(%r11), %rsi
	jmp	.L17218
.L18972:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L4556
.L16471:
	movslq	%ebp,%rbx
	jmp	.L4556
.L4811:
	cmpl	$41, %ebx
	je	.L18973
.L4813:
	movb	$1, reg_pending_barrier(%rip)
.L4812:
	cmpl	$41, %ebx
	je	.L18974
.L4520:
	movslq	%ebx,%r12
	movzbl	rtx_length(%r12), %r14d
	movq	rtx_format(,%r12,8), %r13
	movl	%r14d, %ebp
	decl	%ebp
	js	.L3416
	leaq	8(%r15), %r14
.L4840:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L18975
	cmpb	$69, %dl
	je	.L18976
.L4830:
	decl	%ebp
	jns	.L4840
	jmp	.L3416
.L18976:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %r8
	cmpl	(%r8), %ebx
	jge	.L4830
	movq	%rdx, %r12
.L4839:
	movq	(%r12), %r10
	movslq	%ebx,%rax
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%rax,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rcx
	cmpl	(%rcx), %ebx
	jl	.L4839
	jmp	.L4830
.L18975:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L4830
.L18974:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L3416
.L4819:
	movslq	%ebx,%r11
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r11,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %r9
	cmpl	(%r9), %ebx
	movq	%r9, %rdx
	jl	.L4819
	jmp	.L3416
.L18973:
	testb	$8, 3(%r15)
	je	.L4812
	jmp	.L4813
.L4798:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rax
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%rax, %rsi
	movl	$0, 32(%rax)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r10
	movq	%rax, 40(%r10)
	movl	$1, 36(%r10)
	jmp	.L4520
.L4558:
	movq	current_sched_info(%rip), %r14
	movq	%r15, 1128(%rsp)
	testb	$2, 96(%r14)
	jne	.L18977
.L4559:
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %rdx
	movq	(%rax), %r12
	movq	8(%rdx), %rbp
	testq	%r12, %r12
	movq	%r12, 1112(%rsp)
	movq	%rbp, 1120(%rsp)
	jne	.L4639
.L15988:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %rbx
	movq	24(%r11), %r9
	testq	%rbx, %rbx
	movq	%rbx, 1096(%rsp)
	movq	%r9, 1104(%rsp)
	jne	.L4715
.L15991:
	movq	1704(%rsp), %r9
	movq	40(%r9), %r10
	testq	%r10, %r10
	movq	%r10, 1088(%rsp)
	je	.L16074
.L4795:
	movq	1088(%rsp), %r11
	movq	8(%r11), %r14
	cmpw	$33, (%r14)
	je	.L18978
.L4721:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L4718
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L4718
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L4727
	cmpw	$34, %ax
	je	.L4727
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L4729
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18979
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18980
.L4729:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4740
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18981
	cmpw	$33, (%r14)
	je	.L18982
.L4748:
	xorl	%ebx, %ebx
.L4740:
	testq	%rbp, %rbp
	je	.L4727
	testq	%rbx, %rbx
	je	.L4727
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18983
.L4751:
	xorl	%eax, %eax
.L4752:
	testl	%eax, %eax
	jne	.L18984
.L4727:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L4753
	testb	$16, 3(%rax)
	je	.L4753
	cmpw	$36, (%rax)
	je	.L4753
.L4754:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L4755
	testb	$16, 3(%rax)
	je	.L4755
	cmpw	$36, (%rax)
	je	.L4755
	movq	%rax, %rbx
	jmp	.L4754
.L4755:
	cmpq	%rbx, 1696(%rsp)
	je	.L4718
	movq	%rbx, %r13
.L4753:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L4760
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%rbp
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	leaq	(%rbp,%rbp,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r12
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	movl	%edx, %ecx
	leaq	0(,%r12,8), %rdi
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L4764
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4765
	movl	$14, %r11d
.L4764:
	testl	%ebx, %ebx
	je	.L4770
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L4718
.L4760:
	testl	%ebx, %ebx
	je	.L4770
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4770
.L4788:
	cmpq	%r13, 8(%rdi)
	je	.L18985
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4788
.L4770:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L4718
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L4790
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rsi
	leaq	(%rcx,%rcx,2), %r14
	salq	$4, %rsi
	salq	$4, %r14
	movl	16(%rsi,%r9), %ecx
	movslq	16(%r14,%r9),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17109:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L4718:
	movq	1088(%rsp), %rsi
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 1088(%rsp)
	jne	.L4795
	jmp	.L16074
.L4790:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16780
	movl	$14, %r14d
	cmpl	$15, %r14d
.L17619:
	jne	.L4718
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r8
	movq	h_i_d(%rip), %rcx
	leaq	(%r8,%r8,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17108:
	movslq	8(%r13),%rdi
	leaq	(%rdi,%rdi,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17109
.L16780:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17108
.L18985:
	testq	%r10, %r10
	je	.L4776
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L18987
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%r14
	movq	h_i_d(%rip), %r11
	movslq	8(%r12),%rcx
	leaq	(%r14,%r14,2), %r9
	salq	$4, %r9
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%r9,%r11), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r11),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17107:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4776:
	movzbl	2(%rdi), %ebp
	movl	$14, %eax
	cmpl	%ebp, %eax
	jge	.L4781
	movb	$14, 2(%rdi)
.L4781:
	testq	%r10, %r10
	je	.L4718
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16779
	cmpb	$14, %al
	je	.L16780
	cmpb	$15, %al
	jmp	.L17619
.L16779:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%rsi
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbp), %ecx
	leaq	(%rsi,%rsi,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rbp),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17109
.L18987:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rbp
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r14), %ecx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r14),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17107
.L4765:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4767
	movl	$15, %r11d
	jmp	.L4764
.L4767:
	xorl	%ebx, %ebx
	jmp	.L4764
.L18984:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4727
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4718
	jmp	.L4727
.L18983:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L4751
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L4751
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L4751
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L4751
	movl	$1, %eax
	jmp	.L4752
.L18982:
	cmpw	$47, %dx
	jne	.L4748
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4748
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4748
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L18988
	movq	24(%rbx), %rax
.L4746:
	cmpw	$67, (%rax)
	jne	.L4748
	cmpq	%rsi, %rcx
	jne	.L4748
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4740
.L18988:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4740
	jmp	.L4746
.L18981:
	movq	8(%rax), %rbx
	jmp	.L4740
.L18980:
	cmpw	$47, %dx
	je	.L18989
.L4737:
	xorl	%ebp, %ebp
	jmp	.L4729
.L18989:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4737
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4737
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L18990
	movq	24(%rbp), %rax
.L4735:
	cmpw	$67, (%rax)
	jne	.L4737
	cmpq	%rsi, %rcx
	jne	.L4737
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L4729
.L18990:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L4729
	jmp	.L4735
.L18979:
	movq	8(%rax), %rbp
	jmp	.L4729
.L18978:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L18991
.L4722:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L4718
	movq	1088(%rsp), %rcx
	movq	8(%rcx), %r14
	jmp	.L4721
.L18991:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L4722
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	cmovne	%rbp, %rdi
	jmp	.L4722
.L4715:
	movq	1104(%rsp), %r12
	movq	1128(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L4643
	movq	1096(%rsp), %rbp
	xorl	%r14d, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L4643
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L4643
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L4647
	cmpw	$34, %ax
	je	.L4647
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L4649
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18992
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L18993
.L4649:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4660
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L18994
	cmpw	$33, (%r13)
	je	.L18995
.L4668:
	xorl	%ebx, %ebx
.L4660:
	testq	%rbp, %rbp
	je	.L4647
	testq	%rbx, %rbx
	je	.L4647
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L18996
.L4671:
	xorl	%eax, %eax
.L4672:
	testl	%eax, %eax
	jne	.L18997
.L4647:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L4673
	testb	$16, 3(%rax)
	je	.L4673
	cmpw	$36, (%rax)
	je	.L4673
.L4674:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L4675
	testb	$16, 3(%rax)
	je	.L4675
	cmpw	$36, (%rax)
	je	.L4675
	movq	%rax, %rbx
	jmp	.L4674
.L4675:
	cmpq	%rbx, 1696(%rsp)
	je	.L4643
	movq	%rbx, %r13
.L4673:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L4680
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L4684
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4685
	movl	$14, %r11d
.L4684:
	testl	%ebx, %ebx
	je	.L4690
	cmpl	%r11d, %r14d
	jge	.L4643
.L4680:
	testl	%ebx, %ebx
	je	.L4690
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4690
.L4708:
	cmpq	%r13, 8(%rdi)
	je	.L18998
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4708
.L4690:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L4643
	testl	%r14d, %r14d
	jne	.L4710
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17106:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L4643:
	movq	1096(%rsp), %rax
	movq	1104(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 1096(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 1104(%rsp)
	jne	.L4715
	jmp	.L15991
.L4710:
	cmpl	$14, %r14d
	je	.L16778
	cmpl	$15, %r14d
.L17618:
	jne	.L4643
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17105:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17106
.L16778:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17105
.L18998:
	testq	%r10, %r10
	je	.L4696
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19000
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17104:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4696:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L4701
	movb	$0, 2(%rdi)
.L4701:
	testq	%r10, %r10
	je	.L4643
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16777
	cmpb	$14, %al
	je	.L16778
	cmpb	$15, %al
	jmp	.L17618
.L16777:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17106
.L19000:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17104
.L4685:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4687
	movl	$15, %r11d
	jmp	.L4684
.L4687:
	xorl	%ebx, %ebx
	jmp	.L4684
.L18997:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4647
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4643
	jmp	.L4647
.L18996:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L4671
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L4671
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L4671
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L4671
	movl	$1, %eax
	jmp	.L4672
.L18995:
	cmpw	$47, %dx
	jne	.L4668
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4668
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4668
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19001
	movq	24(%rbx), %rax
.L4666:
	cmpw	$67, (%rax)
	jne	.L4668
	cmpq	%rsi, %rcx
	jne	.L4668
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4660
.L19001:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4660
	jmp	.L4666
.L18994:
	movq	8(%rax), %rbx
	jmp	.L4660
.L18993:
	cmpw	$47, %dx
	je	.L19002
.L4657:
	xorl	%ebp, %ebp
	jmp	.L4649
.L19002:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4657
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4657
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19003
	movq	24(%rbp), %rax
.L4655:
	cmpw	$67, (%rax)
	jne	.L4657
	cmpq	%rsi, %rcx
	jne	.L4657
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L4649
.L19003:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L4649
	jmp	.L4655
.L18992:
	movq	8(%rax), %rbp
	jmp	.L4649
.L4639:
	movq	1120(%rsp), %rcx
	movq	1128(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L4567
	movq	1112(%rsp), %rsi
	movl	$14, %r14d
	movq	8(%rsi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L4567
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L4567
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L4571
	cmpw	$34, %ax
	je	.L4571
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L4573
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19004
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19005
.L4573:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4584
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19006
	cmpw	$33, (%r13)
	je	.L19007
.L4592:
	xorl	%ebx, %ebx
.L4584:
	testq	%rbp, %rbp
	je	.L4571
	testq	%rbx, %rbx
	je	.L4571
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L19008
.L4595:
	xorl	%eax, %eax
.L4596:
	testl	%eax, %eax
	jne	.L19009
.L4571:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L4597
	testb	$16, 3(%rax)
	je	.L4597
	cmpw	$36, (%rax)
	je	.L4597
.L4598:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L4599
	testb	$16, 3(%rax)
	je	.L4599
	cmpw	$36, (%rax)
	je	.L4599
	movq	%rax, %rbx
	jmp	.L4598
.L4599:
	cmpq	%rbx, 1696(%rsp)
	je	.L4567
	movq	%rbx, %r13
.L4597:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L4604
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L4608
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4609
	movl	$14, %r11d
.L4608:
	testl	%ebx, %ebx
	je	.L4614
	cmpl	%r11d, %r14d
	jge	.L4567
.L4604:
	testl	%ebx, %ebx
	je	.L4614
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4614
.L4632:
	cmpq	%r13, 8(%rdi)
	je	.L19010
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4632
.L4614:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L4567
	testl	%r14d, %r14d
	jne	.L4634
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17103:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L4567:
	movq	1112(%rsp), %rax
	movq	1120(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 1112(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 1120(%rsp)
	jne	.L4639
	jmp	.L15988
.L4634:
	cmpl	$14, %r14d
	je	.L16776
	cmpl	$15, %r14d
.L17617:
	jne	.L4567
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17102:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17103
.L16776:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17102
.L19010:
	testq	%r10, %r10
	je	.L4620
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19012
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17101:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4620:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L4625
	movb	$14, 2(%rdi)
.L4625:
	testq	%r10, %r10
	je	.L4567
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16775
	cmpb	$14, %al
	je	.L16776
	cmpb	$15, %al
	jmp	.L17617
.L16775:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17103
.L19012:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17101
.L4609:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4611
	movl	$15, %r11d
	jmp	.L4608
.L4611:
	xorl	%ebx, %ebx
	jmp	.L4608
.L19009:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4571
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4567
	jmp	.L4571
.L19008:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L4595
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L4595
	movq	8(%rbx), %r11
	cmpq	%r11, 8(%rbp)
	jne	.L4595
	movq	16(%rbx), %r10
	cmpq	%r10, 16(%rbp)
	jne	.L4595
	movl	$1, %eax
	jmp	.L4596
.L19007:
	cmpw	$47, %dx
	jne	.L4592
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4592
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4592
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19013
	movq	24(%rbx), %rax
.L4590:
	cmpw	$67, (%rax)
	jne	.L4592
	cmpq	%rsi, %rcx
	jne	.L4592
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4584
.L19013:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4584
	jmp	.L4590
.L19006:
	movq	8(%rax), %rbx
	jmp	.L4584
.L19005:
	cmpw	$47, %dx
	je	.L19014
.L4581:
	xorl	%ebp, %ebp
	jmp	.L4573
.L19014:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4581
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4581
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19015
	movq	24(%rbp), %rax
.L4579:
	cmpw	$67, (%rax)
	jne	.L4581
	cmpq	%rsi, %rcx
	jne	.L4581
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L4573
.L19015:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L4573
	jmp	.L4579
.L19004:
	movq	8(%rax), %rbp
	jmp	.L4573
.L18977:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r8b
	movq	%rax, 1128(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r8b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	1128(%rsp), %r10
	movq	8(%r10), %rdi
	call	cselib_subst_to_values
	movq	1128(%rsp), %r13
	movq	%rax, 8(%r13)
	jmp	.L4559
	.p2align 6,,7
.L18969:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L4513
.L18506:
	movq	1624(%rsp), %r12
	movq	8(%r12), %r15
	testq	%r15, %r15
	je	.L3420
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L3421
	mov	%eax, %r8d
	jmp	*.L4492(,%r8,8)
	.section	.rodata
	.align 8
	.align 4
.L4492:
	.quad	.L3712
	.quad	.L3712
	.quad	.L3421
	.quad	.L3712
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3699
	.quad	.L3421
	.quad	.L3420
	.quad	.L3420
	.quad	.L3420
	.quad	.L3421
	.quad	.L3420
	.quad	.L3421
	.quad	.L3421
	.quad	.L3428
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3459
	.quad	.L3420
	.quad	.L3420
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3421
	.quad	.L3724
	.quad	.L3724
	.quad	.L3724
	.quad	.L3724
	.quad	.L4108
	.quad	.L4108
	.text
.L3428:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L3429
	leal	-8(%rbp), %ecx
	cmpl	$7, %ecx
	jbe	.L3432
	leal	-21(%rbp), %r13d
	cmpl	$7, %r13d
	jbe	.L3432
	leal	-45(%rbp), %edi
	cmpl	$7, %edi
	jbe	.L3432
	leal	-29(%rbp), %esi
	cmpl	$7, %esi
	ja	.L3430
.L3432:
	movzbq	2(%r15), %rdx
	movl	mode_class(,%rdx,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17060:
	addl	$2, %eax
.L3431:
	movl	%eax, %ebx
	decl	%ebx
	js	.L3420
.L3452:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L3452
.L3420:
	movq	1624(%rsp), %r14
	movq	16(%r14), %r15
	movq	%r15, 1624(%rsp)
	movzwl	(%r15), %eax
	movzwl	%ax, %edx
	jmp	.L3418
.L3430:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L19016
	cmpb	$24, %al
	je	.L19017
	movl	target_flags(%rip), %r11d
	testl	$33554432, %r11d
	movl	%r11d, %ecx
	je	.L3443
	movzbl	%al, %ebx 
	movzbl	mode_size(%rbx), %r15d
	leal	7(%r15), %edx
.L3444:
	andl	$33554432, %ecx
	je	.L3445
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L3431
.L3445:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L3431
.L3443:
	movzbl	%al, %r14d 
	movzbl	mode_size(%r14), %r9d
	leal	3(%r9), %edx
	jmp	.L3444
.L19017:
	xorl	%r10d, %r10d
	testb	$2, target_flags+3(%rip)
	sete	%r10b
	leal	4(%r10,%r10), %eax
	jmp	.L3431
.L19016:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17060
	.p2align 6,,7
.L3429:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %ebp
	jl	.L3454
	movq	1696(%rsp), %r12
	movq	32(%r12), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L3420
	jmp	.L17569
.L3454:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L16443
	movq	reg_known_equiv_p(%rip), %rcx
	movslq	%ebp,%rbx
	addq	%rbx, %rcx
	cmpb	$0, (%rcx)
	je	.L3457
	leaq	0(,%rbx,8), %r13
	addq	reg_known_value(%rip), %r13
	movq	(%r13), %rax
	cmpw	$66, (%rax)
	je	.L19018
.L3457:
	leaq	0(,%rbx,8), %rdx
	addq	reg_n_info(%rip), %rdx
	movq	32(%rdx), %rsi
	movl	32(%rsi), %edi
	testl	%edi, %edi
	jne	.L3420
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	56(%r11), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r10
	movq	%rax, 56(%r10)
	jmp	.L3420
.L19018:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L3457
.L16443:
	movslq	%ebp,%rbx
	jmp	.L3457
	.p2align 6,,7
.L3712:
	cmpl	$41, %ebx
	je	.L19019
.L3714:
	movb	$1, reg_pending_barrier(%rip)
.L3713:
	cmpl	$41, %ebx
	je	.L19020
.L3421:
	movslq	%ebx,%r12
	movzbl	rtx_length(%r12), %edx
	movq	rtx_format(,%r12,8), %r13
	movl	%edx, %r12d
	decl	%r12d
	js	.L3420
	leaq	8(%r15), %r14
.L4505:
	movslq	%r12d,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L19021
	cmpb	$69, %dl
	je	.L19022
.L4495:
	decl	%r12d
	jns	.L4505
	jmp	.L3420
.L19022:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L4495
	movq	%rdx, %rbp
.L4504:
	movq	(%rbp), %r9
	movslq	%ebx,%r11
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	incl	%ebx
	addq	$8, %r9
	movq	(%r9,%r11,8), %rsi
	call	sched_analyze_2
	movq	(%rbp), %rdi
	cmpl	(%rdi), %ebx
	jl	.L4504
	jmp	.L4495
.L19021:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L4495
.L19020:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L3420
.L3720:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %rcx
	cmpl	(%rcx), %ebx
	movq	%rcx, %rdx
	jl	.L3720
	jmp	.L3420
.L19019:
	testb	$8, 3(%r15)
	je	.L3713
	jmp	.L3714
	.p2align 6,,7
.L3699:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r8
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r8, %rsi
	movl	$0, 32(%r8)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r12
	movq	%rax, 40(%r12)
	movl	$1, 36(%r12)
	jmp	.L3421
.L3459:
	movq	current_sched_info(%rip), %rbx
	movq	%r15, 1424(%rsp)
	testb	$2, 96(%rbx)
	jne	.L19023
.L3460:
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %r13
	movq	(%rax), %r12
	movq	8(%r13), %r8
	testq	%r12, %r12
	movq	%r12, 1408(%rsp)
	movq	%r8, 1416(%rsp)
	jne	.L3540
.L15939:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %rbx
	movq	24(%r11), %r9
	testq	%rbx, %rbx
	movq	%rbx, 1392(%rsp)
	movq	%r9, 1400(%rsp)
	jne	.L3616
.L15942:
	movq	1704(%rsp), %r9
	movq	40(%r9), %r10
	testq	%r10, %r10
	movq	%r10, 1384(%rsp)
	je	.L15945
.L3696:
	movq	1384(%rsp), %r11
	movq	8(%r11), %r14
	cmpw	$33, (%r14)
	je	.L19024
.L3622:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L3619
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L3619
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L3628
	cmpw	$34, %ax
	je	.L3628
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L3630
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19025
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19026
.L3630:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L3641
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19027
	cmpw	$33, (%r14)
	je	.L19028
.L3649:
	xorl	%ebx, %ebx
.L3641:
	testq	%rbp, %rbp
	je	.L3628
	testq	%rbx, %rbx
	je	.L3628
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19029
.L3652:
	xorl	%eax, %eax
.L3653:
	testl	%eax, %eax
	jne	.L19030
.L3628:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3654
	testb	$16, 3(%rax)
	je	.L3654
	cmpw	$36, (%rax)
	je	.L3654
.L3655:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3656
	testb	$16, 3(%rax)
	je	.L3656
	cmpw	$36, (%rax)
	je	.L3656
	movq	%rax, %rbx
	jmp	.L3655
.L3656:
	cmpq	%rbx, 1696(%rsp)
	je	.L3619
	movq	%rbx, %r13
.L3654:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3661
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%rbp
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	leaq	(%rbp,%rbp,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r12
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	movl	%edx, %ecx
	leaq	0(,%r12,8), %rdi
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3665
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3666
	movl	$14, %r11d
.L3665:
	testl	%ebx, %ebx
	je	.L3671
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L3619
.L3661:
	testl	%ebx, %ebx
	je	.L3671
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L3671
.L3689:
	cmpq	%r13, 8(%rdi)
	je	.L19031
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3689
.L3671:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L3619
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L3691
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rsi
	leaq	(%rcx,%rcx,2), %r14
	salq	$4, %rsi
	salq	$4, %r14
	movl	16(%rsi,%r9), %ecx
	movslq	16(%r14,%r9),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17069:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L3619:
	movq	1384(%rsp), %rsi
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 1384(%rsp)
	jne	.L3696
.L15945:
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%r11), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r10
	movq	1704(%rsp), %r9
	movq	%rax, (%r9)
	testb	$2, 96(%r10)
	jne	.L19032
.L3697:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r14
	incl	32(%r14)
	movq	%rax, 8(%r14)
	movq	%r14, %rdi
	movq	8(%r15), %rsi
.L17099:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L3420
.L19032:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L3697
	.p2align 6,,7
.L3691:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16758
	movl	$14, %r14d
	cmpl	$15, %r14d
.L17608:
	jne	.L3619
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r8
	movq	h_i_d(%rip), %rcx
	leaq	(%r8,%r8,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17068:
	movslq	8(%r13),%rdi
	leaq	(%rdi,%rdi,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17069
.L16758:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17068
.L19031:
	testq	%r10, %r10
	je	.L3677
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19034
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%r14
	movq	h_i_d(%rip), %r11
	movslq	8(%r12),%rcx
	leaq	(%r14,%r14,2), %r9
	salq	$4, %r9
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%r9,%r11), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r11),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17067:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L3677:
	movzbl	2(%rdi), %ebp
	movl	$14, %eax
	cmpl	%ebp, %eax
	jge	.L3682
	movb	$14, 2(%rdi)
.L3682:
	testq	%r10, %r10
	je	.L3619
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16757
	cmpb	$14, %al
	je	.L16758
	cmpb	$15, %al
	jmp	.L17608
.L16757:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%rsi
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbp), %ecx
	leaq	(%rsi,%rsi,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rbp),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17069
.L19034:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rbp
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r14), %ecx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r14),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17067
.L3666:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3668
	movl	$15, %r11d
	jmp	.L3665
.L3668:
	xorl	%ebx, %ebx
	jmp	.L3665
.L19030:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L3628
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L3619
	jmp	.L3628
.L19029:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L3652
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L3652
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L3652
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L3652
	movl	$1, %eax
	jmp	.L3653
.L19028:
	cmpw	$47, %dx
	jne	.L3649
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3649
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3649
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19035
	movq	24(%rbx), %rax
.L3647:
	cmpw	$67, (%rax)
	jne	.L3649
	cmpq	%rsi, %rcx
	jne	.L3649
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L3641
.L19035:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L3641
	jmp	.L3647
.L19027:
	movq	8(%rax), %rbx
	jmp	.L3641
.L19026:
	cmpw	$47, %dx
	je	.L19036
.L3638:
	xorl	%ebp, %ebp
	jmp	.L3630
.L19036:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3638
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3638
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19037
	movq	24(%rbp), %rax
.L3636:
	cmpw	$67, (%rax)
	jne	.L3638
	cmpq	%rsi, %rcx
	jne	.L3638
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L3630
.L19037:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L3630
	jmp	.L3636
.L19025:
	movq	8(%rax), %rbp
	jmp	.L3630
	.p2align 6,,7
.L19024:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L19038
.L3623:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L3619
	movq	1384(%rsp), %rcx
	movq	8(%rcx), %r14
	jmp	.L3622
.L19038:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L3623
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	cmovne	%rbp, %rdi
	jmp	.L3623
	.p2align 6,,7
.L3616:
	movq	1400(%rsp), %r12
	movq	1424(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L3544
	movq	1392(%rsp), %rbp
	xorl	%r14d, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L3544
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L3544
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L3548
	cmpw	$34, %ax
	je	.L3548
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L3550
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19039
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19040
.L3550:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L3561
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19041
	cmpw	$33, (%r13)
	je	.L19042
.L3569:
	xorl	%ebx, %ebx
.L3561:
	testq	%rbp, %rbp
	je	.L3548
	testq	%rbx, %rbx
	je	.L3548
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19043
.L3572:
	xorl	%eax, %eax
.L3573:
	testl	%eax, %eax
	jne	.L19044
.L3548:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3574
	testb	$16, 3(%rax)
	je	.L3574
	cmpw	$36, (%rax)
	je	.L3574
.L3575:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3576
	testb	$16, 3(%rax)
	je	.L3576
	cmpw	$36, (%rax)
	je	.L3576
	movq	%rax, %rbx
	jmp	.L3575
.L3576:
	cmpq	%rbx, 1696(%rsp)
	je	.L3544
	movq	%rbx, %r13
.L3574:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3581
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3585
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3586
	movl	$14, %r11d
.L3585:
	testl	%ebx, %ebx
	je	.L3591
	cmpl	%r11d, %r14d
	jge	.L3544
.L3581:
	testl	%ebx, %ebx
	je	.L3591
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L3591
.L3609:
	cmpq	%r13, 8(%rdi)
	je	.L19045
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3609
.L3591:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L3544
	testl	%r14d, %r14d
	jne	.L3611
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17066:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L3544:
	movq	1392(%rsp), %rax
	movq	1400(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 1392(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 1400(%rsp)
	jne	.L3616
	jmp	.L15942
.L3611:
	cmpl	$14, %r14d
	je	.L16756
	cmpl	$15, %r14d
.L17607:
	jne	.L3544
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17065:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17066
.L16756:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17065
.L19045:
	testq	%r10, %r10
	je	.L3597
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19047
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17064:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L3597:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L3602
	movb	$0, 2(%rdi)
.L3602:
	testq	%r10, %r10
	je	.L3544
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16755
	cmpb	$14, %al
	je	.L16756
	cmpb	$15, %al
	jmp	.L17607
.L16755:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17066
.L19047:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17064
.L3586:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3588
	movl	$15, %r11d
	jmp	.L3585
.L3588:
	xorl	%ebx, %ebx
	jmp	.L3585
.L19044:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L3548
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L3544
	jmp	.L3548
.L19043:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L3572
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L3572
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L3572
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L3572
	movl	$1, %eax
	jmp	.L3573
.L19042:
	cmpw	$47, %dx
	jne	.L3569
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3569
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3569
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19048
	movq	24(%rbx), %rax
.L3567:
	cmpw	$67, (%rax)
	jne	.L3569
	cmpq	%rsi, %rcx
	jne	.L3569
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L3561
.L19048:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L3561
	jmp	.L3567
.L19041:
	movq	8(%rax), %rbx
	jmp	.L3561
.L19040:
	cmpw	$47, %dx
	je	.L19049
.L3558:
	xorl	%ebp, %ebp
	jmp	.L3550
.L19049:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3558
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3558
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19050
	movq	24(%rbp), %rax
.L3556:
	cmpw	$67, (%rax)
	jne	.L3558
	cmpq	%rsi, %rcx
	jne	.L3558
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L3550
.L19050:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L3550
	jmp	.L3556
.L19039:
	movq	8(%rax), %rbp
	jmp	.L3550
	.p2align 6,,7
.L3540:
	movq	1416(%rsp), %rcx
	movq	1424(%rsp), %rsi
	movq	8(%rcx), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L3468
	movq	1408(%rsp), %rdi
	movl	$14, %r14d
	movq	8(%rdi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L3468
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L3468
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L3472
	cmpw	$34, %ax
	je	.L3472
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L3474
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19051
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19052
.L3474:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L3485
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19053
	cmpw	$33, (%r13)
	je	.L19054
.L3493:
	xorl	%ebx, %ebx
.L3485:
	testq	%rbp, %rbp
	je	.L3472
	testq	%rbx, %rbx
	je	.L3472
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19055
.L3496:
	xorl	%eax, %eax
.L3497:
	testl	%eax, %eax
	jne	.L19056
.L3472:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3498
	testb	$16, 3(%rax)
	je	.L3498
	cmpw	$36, (%rax)
	je	.L3498
.L3499:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3500
	testb	$16, 3(%rax)
	je	.L3500
	cmpw	$36, (%rax)
	je	.L3500
	movq	%rax, %rbx
	jmp	.L3499
.L3500:
	cmpq	%rbx, 1696(%rsp)
	je	.L3468
	movq	%rbx, %r13
.L3498:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3505
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3509
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3510
	movl	$14, %r11d
.L3509:
	testl	%ebx, %ebx
	je	.L3515
	cmpl	%r11d, %r14d
	jge	.L3468
.L3505:
	testl	%ebx, %ebx
	je	.L3515
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L3515
.L3533:
	cmpq	%r13, 8(%rdi)
	je	.L19057
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3533
.L3515:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L3468
	testl	%r14d, %r14d
	jne	.L3535
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17063:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L3468:
	movq	1408(%rsp), %rax
	movq	1416(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 1408(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 1416(%rsp)
	jne	.L3540
	jmp	.L15939
.L3535:
	cmpl	$14, %r14d
	je	.L16754
	cmpl	$15, %r14d
.L17606:
	jne	.L3468
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17062:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17063
.L16754:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17062
.L19057:
	testq	%r10, %r10
	je	.L3521
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19059
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17061:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L3521:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L3526
	movb	$14, 2(%rdi)
.L3526:
	testq	%r10, %r10
	je	.L3468
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16753
	cmpb	$14, %al
	je	.L16754
	cmpb	$15, %al
	jmp	.L17606
.L16753:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17063
.L19059:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17061
.L3510:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3512
	movl	$15, %r11d
	jmp	.L3509
.L3512:
	xorl	%ebx, %ebx
	jmp	.L3509
.L19056:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L3472
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L3468
	jmp	.L3472
.L19055:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L3496
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L3496
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rbp)
	jne	.L3496
	movq	16(%rbx), %r11
	cmpq	%r11, 16(%rbp)
	jne	.L3496
	movl	$1, %eax
	jmp	.L3497
.L19054:
	cmpw	$47, %dx
	jne	.L3493
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3493
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3493
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19060
	movq	24(%rbx), %rax
.L3491:
	cmpw	$67, (%rax)
	jne	.L3493
	cmpq	%rsi, %rcx
	jne	.L3493
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L3485
.L19060:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L3485
	jmp	.L3491
.L19053:
	movq	8(%rax), %rbx
	jmp	.L3485
.L19052:
	cmpw	$47, %dx
	je	.L19061
.L3482:
	xorl	%ebp, %ebp
	jmp	.L3474
.L19061:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3482
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3482
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19062
	movq	24(%rbp), %rax
.L3480:
	cmpw	$67, (%rax)
	jne	.L3482
	cmpq	%rsi, %rcx
	jne	.L3482
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L3474
.L19062:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L3474
	jmp	.L3480
.L19051:
	movq	8(%rax), %rbp
	jmp	.L3474
.L19023:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%bpl
	movq	%rax, 1424(%rsp)
	movq	8(%rax), %rdi
	movzbl	%bpl, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	1424(%rsp), %r14
	movq	8(%r14), %rdi
	call	cselib_subst_to_values
	movq	1424(%rsp), %r9
	movq	%rax, 8(%r9)
	jmp	.L3460
	.p2align 6,,7
.L3724:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	8(%r15), %r12
	movzwl	(%r15), %ebx
	testq	%r12, %r12
	je	.L3420
	movzwl	(%r12), %edx
	cmpw	$39, %dx
	je	.L19063
	leal	-63(%rdx), %esi
	cmpw	$1, %si
	ja	.L19064
.L3739:
	leal	-132(%rdx), %r10d
	cmpw	$1, %r10w
	jbe	.L19065
.L3738:
	movq	8(%r12), %r12
	movzwl	(%r12), %edx
	leal	-63(%rdx), %r9d
	cmpw	$1, %r9w
	jbe	.L3739
	cmpw	$133, %dx
	je	.L3739
	cmpw	$132, %dx
	je	.L3739
.L15951:
	cmpw	$61, %dx
	je	.L19066
	cmpw	$66, %dx
	je	.L19067
.L4240:
	cmpw	$47, (%r15)
	jne	.L3420
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17099
.L19067:
	movq	current_sched_info(%rip), %r14
	movq	%r12, 1368(%rsp)
	testb	$2, 96(%r14)
	jne	.L19068
.L3858:
	movq	compiler_params(%rip), %rbp
	movq	1704(%rsp), %rcx
	movl	80(%rbp), %eax
	cmpl	%eax, 32(%rcx)
	jg	.L17714
	movq	1704(%rsp), %rdi
	movq	1704(%rsp), %r13
	movq	(%rdi), %r8
	movq	8(%r13), %rsi
	testq	%r8, %r8
	movq	%r8, 1352(%rsp)
	movq	%rsi, 1360(%rsp)
	jne	.L3950
.L15957:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r9
	movq	16(%rcx), %r8
	movq	24(%r9), %rsi
	testq	%r8, %r8
	movq	%r8, 1336(%rsp)
	movq	%rsi, 1344(%rsp)
	jne	.L4026
.L15960:
	movq	1704(%rsp), %r8
	movq	40(%r8), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 1328(%rsp)
	je	.L15980
.L4102:
	movq	1328(%rsp), %rdx
	movq	8(%rdx), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L4029
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L4029
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L4034
	cmpw	$34, %ax
	je	.L4034
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L4036
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19069
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19070
.L4036:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4047
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19071
	cmpw	$33, (%r14)
	je	.L19072
.L4055:
	xorl	%ebx, %ebx
.L4047:
	testq	%rbp, %rbp
	je	.L4034
	testq	%rbx, %rbx
	je	.L4034
	movzwl	(%rbp), %r13d
	movslq	%r13d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19073
.L4058:
	xorl	%eax, %eax
.L4059:
	testl	%eax, %eax
	jne	.L19074
.L4034:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L4060
	testb	$16, 3(%rax)
	je	.L4060
	cmpw	$36, (%rax)
	je	.L4060
.L4061:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L4062
	testb	$16, 3(%rax)
	je	.L4062
	cmpw	$36, (%rax)
	je	.L4062
	movq	%rax, %rbx
	jmp	.L4061
.L4062:
	cmpq	%rbx, 1696(%rsp)
	je	.L4029
	movq	%rbx, %r14
.L4060:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L4067
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%rbp
	movl	16(%rcx,%r13), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L4071
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4072
	movl	$14, %r11d
.L4071:
	testl	%ebx, %ebx
	je	.L4077
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L4029
.L4067:
	testl	%ebx, %ebx
	je	.L4077
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4077
.L4095:
	cmpq	%r14, 8(%rdi)
	je	.L19075
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4095
.L4077:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L4029
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L4097
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r13
	movslq	8(%r14),%rdx
	leaq	(%rcx,%rcx,2), %rbp
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %rbp
	salq	$4, %r11
	movslq	16(%rbp,%r13),%r9
	movl	16(%r11,%r13), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17083:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L4029:
	movq	1328(%rsp), %rax
	movq	16(%rax), %r13
	testq	%r13, %r13
	movq	%r13, 1328(%rsp)
	jne	.L4102
.L15980:
	movq	1704(%rsp), %rcx
	movq	1696(%rsp), %rdi
	movq	%r12, %rbx
	movq	16(%rcx), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r10
	movq	1704(%rsp), %rbp
	movq	%rax, 16(%rbp)
	testb	$2, 96(%r10)
	jne	.L19076
.L4488:
	movq	%rbx, %rsi
	xorl	%edi, %edi
	movq	1704(%rsp), %rbx
	movq	24(%rbx), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r8
	movq	%rax, 24(%r8)
	incl	32(%r8)
.L4258:
	movq	1704(%rsp), %rdi
	movq	8(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L4240
.L19076:
	movq	%r12, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L4488
.L4097:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16766
	movl	$14, %edx
	cmpl	$15, %edx
.L17612:
	jne	.L4029
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17082:
	movslq	8(%r14),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17083
.L16766:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rbp
	movq	h_i_d(%rip), %rcx
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17082
.L19075:
	testq	%r10, %r10
	je	.L4083
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19078
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rsi),%rcx
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%rcx,%rcx,2), %rbp
	movl	16(%r11,%r13), %ecx
	salq	$4, %rbp
	movslq	16(%rbp,%r13),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17081:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4083:
	movzbl	2(%rdi), %ebx
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L4088
	movb	$14, 2(%rdi)
.L4088:
	testq	%r10, %r10
	je	.L4029
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16765
	cmpb	$14, %al
	je	.L16766
	cmpb	$15, %al
	jmp	.L17612
.L16765:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r9
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r13
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rdi), %ecx
	leaq	(%r13,%r13,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17083
.L19078:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbp
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%r9
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17081
.L4072:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4074
	movl	$15, %r11d
	jmp	.L4071
.L4074:
	xorl	%ebx, %ebx
	jmp	.L4071
.L19074:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4034
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4029
	jmp	.L4034
.L19073:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L4058
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L4058
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%rbp)
	jne	.L4058
	movq	16(%rbx), %r11
	cmpq	%r11, 16(%rbp)
	jne	.L4058
	movl	$1, %eax
	jmp	.L4059
.L19072:
	cmpw	$47, %dx
	jne	.L4055
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4055
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4055
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19079
	movq	24(%rbx), %rax
.L4053:
	cmpw	$67, (%rax)
	jne	.L4055
	cmpq	%rsi, %rcx
	jne	.L4055
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4047
.L19079:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4047
	jmp	.L4053
.L19071:
	movq	8(%rax), %rbx
	jmp	.L4047
.L19070:
	cmpw	$47, %dx
	je	.L19080
.L4044:
	xorl	%ebp, %ebp
	jmp	.L4036
.L19080:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4044
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4044
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19081
	movq	24(%rbp), %rax
.L4042:
	cmpw	$67, (%rax)
	jne	.L4044
	cmpq	%rsi, %rcx
	jne	.L4044
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L4036
.L19081:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L4036
	jmp	.L4042
.L19069:
	movq	8(%rax), %rbp
	jmp	.L4036
.L4026:
	movq	1344(%rsp), %rdx
	movq	1368(%rsp), %rsi
	movq	8(%rdx), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L3954
	movq	1336(%rsp), %rdi
	movq	8(%rdi), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L3954
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L3954
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L3958
	cmpw	$34, %ax
	je	.L3958
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L3960
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19082
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19083
.L3960:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L3971
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19084
	cmpw	$33, (%r14)
	je	.L19085
.L3979:
	xorl	%ebx, %ebx
.L3971:
	testq	%rbp, %rbp
	je	.L3958
	testq	%rbx, %rbx
	je	.L3958
	movzwl	(%rbp), %r13d
	movslq	%r13d,%r11
	cmpb	$60, rtx_class(%r11)
	je	.L19086
.L3982:
	xorl	%eax, %eax
.L3983:
	testl	%eax, %eax
	jne	.L19087
.L3958:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3984
	testb	$16, 3(%rax)
	je	.L3984
	cmpw	$36, (%rax)
	je	.L3984
.L3985:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3986
	testb	$16, 3(%rax)
	je	.L3986
	cmpw	$36, (%rax)
	je	.L3986
	movq	%rax, %rbx
	jmp	.L3985
.L3986:
	cmpq	%rbx, 1696(%rsp)
	je	.L3954
	movq	%rbx, %r14
.L3984:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3991
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r13,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r13d
	leaq	0(,%r13,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3995
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3996
	movl	$14, %r11d
.L3995:
	testl	%ebx, %ebx
	je	.L4001
	movl	$15, %eax
	cmpl	%r11d, %eax
	jge	.L3954
.L3991:
	testl	%ebx, %ebx
	je	.L4001
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4001
.L4019:
	cmpq	%r14, 8(%rdi)
	je	.L19088
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4019
.L4001:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L3954
	movl	$15, %edi
	testl	%edi, %edi
	jne	.L4021
	movslq	8(%rdx),%r13
	movq	h_i_d(%rip), %rbp
	movslq	8(%r14),%rdx
	leaq	(%r13,%r13,2), %rcx
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %rcx
	salq	$4, %r11
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17080:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L3954:
	movq	1336(%rsp), %rax
	movq	1344(%rsp), %r13
	movq	16(%rax), %rbp
	movq	%rbp, 1336(%rsp)
	testq	%rbp, %rbp
	movq	16(%r13), %r10
	movq	%r10, 1344(%rsp)
	jne	.L4026
	jmp	.L15960
.L4021:
	movl	$15, %eax
	cmpl	$14, %eax
	je	.L16764
	movl	$15, %edx
	cmpl	$15, %edx
.L17611:
	jne	.L3954
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17079:
	movslq	8(%r14),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17080
.L16764:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17079
.L19088:
	testq	%r10, %r10
	je	.L4007
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19090
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17078:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4007:
	movzbl	2(%rdi), %ebx
	movl	$15, %eax
	cmpl	%ebx, %eax
	jge	.L4012
	movb	$15, 2(%rdi)
.L4012:
	testq	%r10, %r10
	je	.L3954
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16763
	cmpb	$14, %al
	je	.L16764
	cmpb	$15, %al
	jmp	.L17611
.L16763:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r9
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%rbp
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rdi), %ecx
	leaq	(%rbp,%rbp,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17080
.L19090:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17078
.L3996:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3998
	movl	$15, %r11d
	jmp	.L3995
.L3998:
	xorl	%ebx, %ebx
	jmp	.L3995
.L19087:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L3958
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L3954
	jmp	.L3958
.L19086:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L3982
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L3982
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%rbp)
	jne	.L3982
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%rbp)
	jne	.L3982
	movl	$1, %eax
	jmp	.L3983
.L19085:
	cmpw	$47, %dx
	jne	.L3979
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3979
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3979
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19091
	movq	24(%rbx), %rax
.L3977:
	cmpw	$67, (%rax)
	jne	.L3979
	cmpq	%rsi, %rcx
	jne	.L3979
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L3971
.L19091:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L3971
	jmp	.L3977
.L19084:
	movq	8(%rax), %rbx
	jmp	.L3971
.L19083:
	cmpw	$47, %dx
	je	.L19092
.L3968:
	xorl	%ebp, %ebp
	jmp	.L3960
.L19092:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3968
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3968
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19093
	movq	24(%rbp), %rax
.L3966:
	cmpw	$67, (%rax)
	jne	.L3968
	cmpq	%rsi, %rcx
	jne	.L3968
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L3960
.L19093:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L3960
	jmp	.L3966
.L19082:
	movq	8(%rax), %rbp
	jmp	.L3960
.L3950:
	movq	1360(%rsp), %rbx
	movq	1368(%rsp), %rsi
	movq	8(%rbx), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L3878
	movq	1352(%rsp), %r11
	movq	8(%r11), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L3878
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L3878
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L3882
	cmpw	$34, %ax
	je	.L3882
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L3884
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19094
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19095
.L3884:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L3895
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19096
	cmpw	$33, (%r14)
	je	.L19097
.L3903:
	xorl	%ebx, %ebx
.L3895:
	testq	%rbp, %rbp
	je	.L3882
	testq	%rbx, %rbx
	je	.L3882
	movzwl	(%rbp), %r13d
	movslq	%r13d,%rdx
	cmpb	$60, rtx_class(%rdx)
	je	.L19098
.L3906:
	xorl	%eax, %eax
.L3907:
	testl	%eax, %eax
	jne	.L19099
.L3882:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3908
	testb	$16, 3(%rax)
	je	.L3908
	cmpw	$36, (%rax)
	je	.L3908
.L3909:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3910
	testb	$16, 3(%rax)
	je	.L3910
	cmpw	$36, (%rax)
	je	.L3910
	movq	%rax, %rbx
	jmp	.L3909
.L3910:
	cmpq	%rbx, 1696(%rsp)
	je	.L3878
	movq	%rbx, %r14
.L3908:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3915
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%rbp
	movl	16(%rcx,%r13), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3919
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3920
	movl	$14, %r11d
.L3919:
	testl	%ebx, %ebx
	je	.L3925
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L3878
.L3915:
	testl	%ebx, %ebx
	je	.L3925
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L3925
.L3943:
	cmpq	%r14, 8(%rdi)
	je	.L19100
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3943
.L3925:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L3878
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L3945
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r13
	movslq	8(%r14),%rdx
	leaq	(%rcx,%rcx,2), %rbp
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %rbp
	salq	$4, %r11
	movslq	16(%rbp,%r13),%rbx
	movl	16(%r11,%r13), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17077:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L3878:
	movq	1352(%rsp), %rax
	movq	1360(%rsp), %rbp
	movq	16(%rax), %r13
	movq	%r13, 1352(%rsp)
	testq	%r13, %r13
	movq	16(%rbp), %r10
	movq	%r10, 1360(%rsp)
	jne	.L3950
	jmp	.L15957
.L3945:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16762
	movl	$14, %edx
	cmpl	$15, %edx
.L17610:
	jne	.L3878
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17076:
	movslq	8(%r14),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17077
.L16762:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rbp
	movq	h_i_d(%rip), %rcx
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17076
.L19100:
	testq	%r10, %r10
	je	.L3931
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19102
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rsi),%rcx
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%rcx,%rcx,2), %rbp
	movl	16(%r11,%r13), %ecx
	salq	$4, %rbp
	movslq	16(%rbp,%r13),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17075:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L3931:
	movzbl	2(%rdi), %r9d
	movl	$14, %eax
	cmpl	%r9d, %eax
	jge	.L3936
	movb	$14, 2(%rdi)
.L3936:
	testq	%r10, %r10
	je	.L3878
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16761
	cmpb	$14, %al
	je	.L16762
	cmpb	$15, %al
	jmp	.L17610
.L16761:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r13
	leaq	(%rbx,%rbx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%rdi), %ecx
	leaq	(%r13,%r13,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17077
.L19102:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbp
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%rbx
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r11d
	salq	$3, %rbx
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17075
.L3920:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3922
	movl	$15, %r11d
	jmp	.L3919
.L3922:
	xorl	%ebx, %ebx
	jmp	.L3919
.L19099:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L3882
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L3878
	jmp	.L3882
.L19098:
	movzwl	(%rbx), %edi
	movslq	%edi,%rcx
	cmpb	$60, rtx_class(%rcx)
	jne	.L3906
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L3906
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rbp)
	jne	.L3906
	movq	16(%rbx), %r10
	cmpq	%r10, 16(%rbp)
	jne	.L3906
	movl	$1, %eax
	jmp	.L3907
.L19097:
	cmpw	$47, %dx
	jne	.L3903
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3903
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3903
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19103
	movq	24(%rbx), %rax
.L3901:
	cmpw	$67, (%rax)
	jne	.L3903
	cmpq	%rsi, %rcx
	jne	.L3903
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L3895
.L19103:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L3895
	jmp	.L3901
.L19096:
	movq	8(%rax), %rbx
	jmp	.L3895
.L19095:
	cmpw	$47, %dx
	je	.L19104
.L3892:
	xorl	%ebp, %ebp
	jmp	.L3884
.L19104:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3892
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3892
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19105
	movq	24(%rbp), %rax
.L3890:
	cmpw	$67, (%rax)
	jne	.L3892
	cmpq	%rsi, %rcx
	jne	.L3892
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L3884
.L19105:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L3884
	jmp	.L3890
.L19094:
	movq	8(%rax), %rbp
	jmp	.L3884
.L17714:
	movq	1696(%rsp), %rdi
	movq	%rcx, %rsi
	movl	$14, %edx
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$8, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r13
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	movq	%r13, %rsi
	movl	$0, 32(%r13)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r8
	movq	%rax, 40(%r8)
	movl	$1, 36(%r8)
	jmp	.L4258
.L19068:
	movq	%r12, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r9b
	movq	%rax, 1368(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r9b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	1368(%rsp), %r10
	movq	8(%r10), %rdi
	call	cselib_subst_to_values
	movq	1368(%rsp), %rcx
	movq	%rax, 8(%rcx)
	jmp	.L3858
.L19066:
	movl	8(%r12), %ebp
	cmpl	$52, %ebp
	jg	.L3741
	leal	-8(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L3744
	leal	-21(%rbp), %r11d
	cmpl	$7, %r11d
	jbe	.L3744
	leal	-45(%rbp), %r14d
	cmpl	$7, %r14d
	jbe	.L3744
	leal	-29(%rbp), %r8d
	cmpl	$7, %r8d
	ja	.L3742
.L3744:
	movzbq	2(%r12), %rcx
	movl	mode_class(,%rcx,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17070:
	addl	$2, %eax
.L3743:
	cmpl	$47, %ebx
	je	.L19106
	movl	%eax, %ebx
	decl	%ebx
	js	.L4240
.L3770:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L3770
	jmp	.L4240
.L19106:
	movl	%eax, %ebx
	decl	%ebx
	js	.L4240
.L3765:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L3765
	jmp	.L4240
.L3742:
	movzbl	2(%r12), %eax
	cmpb	$18, %al
	je	.L19107
	cmpb	$24, %al
	je	.L19108
	movl	target_flags(%rip), %r13d
	testl	$33554432, %r13d
	movl	%r13d, %ecx
	je	.L3755
	movzbl	%al, %esi 
	movzbl	mode_size(%rsi), %edi
	leal	7(%rdi), %edx
.L3756:
	andl	$33554432, %ecx
	je	.L3757
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L3743
.L3757:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L3743
.L3755:
	movzbl	%al, %r9d 
	movzbl	mode_size(%r9), %r10d
	leal	3(%r10), %edx
	jmp	.L3756
.L19108:
	xorl	%r12d, %r12d
	testb	$2, target_flags+3(%rip)
	sete	%r12b
	leal	4(%r12,%r12), %eax
	jmp	.L3743
.L19107:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17070
.L3741:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %ebp
	jge	.L17700
	cmpl	$47, %ebx
	je	.L19109
	movq	reg_pending_clobbers(%rip), %rdi
.L17071:
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L16451
	movslq	%ebp,%rbx
	movq	reg_known_equiv_p(%rip), %rbp
	addq	%rbx, %rbp
	cmpb	$0, (%rbp)
	je	.L3777
	leaq	0(,%rbx,8), %rdx
	addq	reg_known_value(%rip), %rdx
	movq	(%rdx), %rax
	cmpw	$66, (%rax)
	je	.L19110
.L3777:
	leaq	0(,%rbx,8), %r8
	addq	reg_n_info(%rip), %r8
	movq	32(%r8), %r14
	movl	32(%r14), %r11d
	testl	%r11d, %r11d
	jne	.L4240
	movq	1704(%rsp), %r13
	movq	48(%r13), %r12
	testq	%r12, %r12
	movq	%r12, 1376(%rsp)
	je	.L4240
	movl	$14, %r14d
.L3854:
	movq	1376(%rsp), %rcx
	movq	8(%rcx), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L3781
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L3781
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L3786
	cmpw	$34, %ax
	je	.L3786
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L3788
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19111
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19112
.L3788:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L3799
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19113
	cmpw	$33, (%r13)
	je	.L19114
.L3807:
	xorl	%ebx, %ebx
.L3799:
	testq	%rbp, %rbp
	je	.L3786
	testq	%rbx, %rbx
	je	.L3786
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L19115
.L3810:
	xorl	%eax, %eax
.L3811:
	testl	%eax, %eax
	jne	.L19116
.L3786:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3812
	testb	$16, 3(%rax)
	je	.L3812
	cmpw	$36, (%rax)
	je	.L3812
.L3813:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3814
	testb	$16, 3(%rax)
	je	.L3814
	cmpw	$36, (%rax)
	je	.L3814
	movq	%rax, %rbx
	jmp	.L3813
.L3814:
	cmpq	%rbx, 1696(%rsp)
	je	.L3781
	movq	%rbx, %r13
.L3812:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3819
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3823
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3824
	movl	$14, %r11d
.L3823:
	testl	%ebx, %ebx
	je	.L3829
	cmpl	%r11d, %r14d
	jge	.L3781
.L3819:
	testl	%ebx, %ebx
	je	.L3829
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L3829
.L3847:
	cmpq	%r13, 8(%rdi)
	je	.L19117
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3847
.L3829:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L3781
	testl	%r14d, %r14d
	jne	.L3849
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rbx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %rbx
	salq	$4, %r12
	movl	16(%rbx,%r11), %ecx
	movslq	16(%r12,%r11),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17074:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L3781:
	movq	1376(%rsp), %rax
	movq	16(%rax), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 1376(%rsp)
	jne	.L3854
	jmp	.L4240
.L3849:
	cmpl	$14, %r14d
	je	.L16760
	cmpl	$15, %r14d
.L17609:
	jne	.L3781
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17073:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17074
.L16760:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17073
.L19117:
	testq	%r10, %r10
	je	.L3835
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19119
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17072:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L3835:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L3840
	movb	$14, 2(%rdi)
.L3840:
	testq	%r10, %r10
	je	.L3781
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16759
	cmpb	$14, %al
	je	.L16760
	cmpb	$15, %al
	jmp	.L17609
.L16759:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r11
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%r11,%r11,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17074
.L19119:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r11
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17072
.L3824:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3826
	movl	$15, %r11d
	jmp	.L3823
.L3826:
	xorl	%ebx, %ebx
	jmp	.L3823
.L19116:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L3786
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L3781
	jmp	.L3786
.L19115:
	movzwl	(%rbx), %edi
	movslq	%edi,%rsi
	cmpb	$60, rtx_class(%rsi)
	jne	.L3810
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L3810
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rbp)
	jne	.L3810
	movq	16(%rbx), %r9
	cmpq	%r9, 16(%rbp)
	jne	.L3810
	movl	$1, %eax
	jmp	.L3811
.L19114:
	cmpw	$47, %dx
	jne	.L3807
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3807
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3807
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19120
	movq	24(%rbx), %rax
.L3805:
	cmpw	$67, (%rax)
	jne	.L3807
	cmpq	%rsi, %rcx
	jne	.L3807
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L3799
.L19120:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L3799
	jmp	.L3805
.L19113:
	movq	8(%rax), %rbx
	jmp	.L3799
.L19112:
	cmpw	$47, %dx
	je	.L19121
.L3796:
	xorl	%ebp, %ebp
	jmp	.L3788
.L19121:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3796
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3796
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19122
	movq	24(%rbp), %rax
.L3794:
	cmpw	$67, (%rax)
	jne	.L3796
	cmpq	%rsi, %rcx
	jne	.L3796
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L3788
.L19122:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L3788
	jmp	.L3794
.L19111:
	movq	8(%rax), %rbp
	jmp	.L3788
.L19110:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L3777
.L16451:
	movslq	%ebp,%rbx
	jmp	.L3777
.L19109:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17071
.L17700:
	movq	1696(%rsp), %rbp
	movq	32(%rbp), %rbx
	movzwl	(%rbx), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L4240
	jmp	.L17570
	.p2align 6,,7
.L19065:
	movq	1704(%rsp), %rdi
	movq	16(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	24(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L3738
.L19064:
	cmpw	$133, %dx
	je	.L3739
	cmpw	$132, %dx
	jne	.L15951
	jmp	.L3739
.L19063:
	movq	8(%r12), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L4240
.L3733:
	movslq	%ebx,%rdi
	movq	8(%rdx,%rdi,8), %rbp
	movq	8(%rbp), %rdx
	testq	%rdx, %rdx
	jne	.L19123
.L3730:
	decl	%ebx
	js	.L4240
	movq	8(%r12), %rdx
	jmp	.L3733
.L19123:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L3730
	.p2align 6,,7
.L4108:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	8(%r15), %r12
	movzwl	(%r15), %ebx
	testq	%r12, %r12
	je	.L3420
	movzwl	(%r12), %edx
	cmpw	$39, %dx
	je	.L19125
	leal	-63(%rdx), %ecx
	cmpw	$1, %cx
	ja	.L19126
.L4123:
	leal	-132(%rdx), %r8d
	cmpw	$1, %r8w
	jbe	.L19127
.L4122:
	movq	8(%r12), %r12
	movzwl	(%r12), %edx
	leal	-63(%rdx), %esi
	cmpw	$1, %si
	jbe	.L4123
	cmpw	$133, %dx
	je	.L4123
	cmpw	$132, %dx
	je	.L4123
.L15968:
	cmpw	$61, %dx
	je	.L19128
	cmpw	$66, %dx
	jne	.L4240
	movq	current_sched_info(%rip), %r14
	movq	%r12, 1312(%rsp)
	testb	$2, 96(%r14)
	jne	.L19129
.L4242:
	movq	compiler_params(%rip), %rbp
	movq	1704(%rsp), %rcx
	movl	80(%rbp), %eax
	cmpl	%eax, 32(%rcx)
	jg	.L17714
	movq	1704(%rsp), %r9
	movq	1704(%rsp), %rbx
	movq	(%r9), %rsi
	movq	8(%rbx), %rdi
	testq	%rsi, %rsi
	movq	%rsi, 1296(%rsp)
	movq	%rdi, 1304(%rsp)
	jne	.L4334
.L15974:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %rbx
	movq	16(%rcx), %r8
	movq	24(%rbx), %rsi
	testq	%r8, %r8
	movq	%r8, 1280(%rsp)
	movq	%rsi, 1288(%rsp)
	jne	.L4410
.L15977:
	movq	1704(%rsp), %r8
	movq	40(%r8), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 1272(%rsp)
	je	.L15980
.L4486:
	movq	1272(%rsp), %rdx
	movq	8(%rdx), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L4413
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L4413
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L4418
	cmpw	$34, %ax
	je	.L4418
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L4420
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19130
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19131
.L4420:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4431
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19132
	cmpw	$33, (%r14)
	je	.L19133
.L4439:
	xorl	%ebx, %ebx
.L4431:
	testq	%rbp, %rbp
	je	.L4418
	testq	%rbx, %rbx
	je	.L4418
	movzwl	(%rbp), %r13d
	movslq	%r13d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19134
.L4442:
	xorl	%eax, %eax
.L4443:
	testl	%eax, %eax
	jne	.L19135
.L4418:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L4444
	testb	$16, 3(%rax)
	je	.L4444
	cmpw	$36, (%rax)
	je	.L4444
.L4445:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L4446
	testb	$16, 3(%rax)
	je	.L4446
	cmpw	$36, (%rax)
	je	.L4446
	movq	%rax, %rbx
	jmp	.L4445
.L4446:
	cmpq	%rbx, 1696(%rsp)
	je	.L4413
	movq	%rbx, %r14
.L4444:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L4451
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%rbp
	movl	16(%rcx,%r13), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L4455
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4456
	movl	$14, %r11d
.L4455:
	testl	%ebx, %ebx
	je	.L4461
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L4413
.L4451:
	testl	%ebx, %ebx
	je	.L4461
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4461
.L4479:
	cmpq	%r14, 8(%rdi)
	je	.L19136
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4479
.L4461:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L4413
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L4481
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r13
	movslq	8(%r14),%rdx
	leaq	(%rcx,%rcx,2), %rbp
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %rbp
	salq	$4, %r11
	movslq	16(%rbp,%r13),%r9
	movl	16(%r11,%r13), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17097:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L4413:
	movq	1272(%rsp), %rax
	movq	16(%rax), %r13
	testq	%r13, %r13
	movq	%r13, 1272(%rsp)
	jne	.L4486
	jmp	.L15980
.L4481:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16774
	movl	$14, %edx
	cmpl	$15, %edx
.L17616:
	jne	.L4413
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17096:
	movslq	8(%r14),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17097
.L16774:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rbp
	movq	h_i_d(%rip), %rcx
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17096
.L19136:
	testq	%r10, %r10
	je	.L4467
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19138
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rsi),%rcx
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%rcx,%rcx,2), %rbp
	movl	16(%r11,%r13), %ecx
	salq	$4, %rbp
	movslq	16(%rbp,%r13),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17095:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4467:
	movzbl	2(%rdi), %ebx
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L4472
	movb	$14, 2(%rdi)
.L4472:
	testq	%r10, %r10
	je	.L4413
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16773
	cmpb	$14, %al
	je	.L16774
	cmpb	$15, %al
	jmp	.L17616
.L16773:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r9
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r13
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rdi), %ecx
	leaq	(%r13,%r13,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17097
.L19138:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbp
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%r9
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17095
.L4456:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4458
	movl	$15, %r11d
	jmp	.L4455
.L4458:
	xorl	%ebx, %ebx
	jmp	.L4455
.L19135:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4418
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4413
	jmp	.L4418
.L19134:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L4442
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L4442
	movq	8(%rbx), %rdi
	cmpq	%rdi, 8(%rbp)
	jne	.L4442
	movq	16(%rbx), %r11
	cmpq	%r11, 16(%rbp)
	jne	.L4442
	movl	$1, %eax
	jmp	.L4443
.L19133:
	cmpw	$47, %dx
	jne	.L4439
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4439
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4439
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19139
	movq	24(%rbx), %rax
.L4437:
	cmpw	$67, (%rax)
	jne	.L4439
	cmpq	%rsi, %rcx
	jne	.L4439
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4431
.L19139:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4431
	jmp	.L4437
.L19132:
	movq	8(%rax), %rbx
	jmp	.L4431
.L19131:
	cmpw	$47, %dx
	je	.L19140
.L4428:
	xorl	%ebp, %ebp
	jmp	.L4420
.L19140:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4428
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4428
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19141
	movq	24(%rbp), %rax
.L4426:
	cmpw	$67, (%rax)
	jne	.L4428
	cmpq	%rsi, %rcx
	jne	.L4428
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L4420
.L19141:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L4420
	jmp	.L4426
.L19130:
	movq	8(%rax), %rbp
	jmp	.L4420
.L4410:
	movq	1288(%rsp), %rdx
	movq	1312(%rsp), %rsi
	movq	8(%rdx), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L4338
	movq	1280(%rsp), %rdi
	movq	8(%rdi), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L4338
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L4338
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L4342
	cmpw	$34, %ax
	je	.L4342
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L4344
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19142
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19143
.L4344:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4355
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19144
	cmpw	$33, (%r14)
	je	.L19145
.L4363:
	xorl	%ebx, %ebx
.L4355:
	testq	%rbp, %rbp
	je	.L4342
	testq	%rbx, %rbx
	je	.L4342
	movzwl	(%rbp), %r13d
	movslq	%r13d,%r9
	cmpb	$60, rtx_class(%r9)
	je	.L19146
.L4366:
	xorl	%eax, %eax
.L4367:
	testl	%eax, %eax
	jne	.L19147
.L4342:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L4368
	testb	$16, 3(%rax)
	je	.L4368
	cmpw	$36, (%rax)
	je	.L4368
.L4369:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L4370
	testb	$16, 3(%rax)
	je	.L4370
	cmpw	$36, (%rax)
	je	.L4370
	movq	%rax, %rbx
	jmp	.L4369
.L4370:
	cmpq	%rbx, 1696(%rsp)
	je	.L4338
	movq	%rbx, %r14
.L4368:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L4375
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r13
	leaq	(%r13,%r13,2), %rdi
	leaq	(%rdx,%rdx,2), %r13
	salq	$4, %rdi
	salq	$4, %r13
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r13,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r13d
	leaq	0(,%r13,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L4379
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4380
	movl	$14, %r11d
.L4379:
	testl	%ebx, %ebx
	je	.L4385
	movl	$15, %eax
	cmpl	%r11d, %eax
	jge	.L4338
.L4375:
	testl	%ebx, %ebx
	je	.L4385
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4385
.L4403:
	cmpq	%r14, 8(%rdi)
	je	.L19148
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4403
.L4385:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L4338
	movl	$15, %edi
	testl	%edi, %edi
	jne	.L4405
	movslq	8(%rdx),%r13
	movq	h_i_d(%rip), %rbp
	movslq	8(%r14),%rdx
	leaq	(%r13,%r13,2), %rcx
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %rcx
	salq	$4, %r11
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17094:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L4338:
	movq	1280(%rsp), %rax
	movq	1288(%rsp), %r13
	movq	16(%rax), %rbp
	movq	%rbp, 1280(%rsp)
	testq	%rbp, %rbp
	movq	16(%r13), %r10
	movq	%r10, 1288(%rsp)
	jne	.L4410
	jmp	.L15977
.L4405:
	movl	$15, %eax
	cmpl	$14, %eax
	je	.L16772
	movl	$15, %edx
	cmpl	$15, %edx
.L17615:
	jne	.L4338
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17093:
	movslq	8(%r14),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17094
.L16772:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r13
	movq	h_i_d(%rip), %rcx
	leaq	(%r13,%r13,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17093
.L19148:
	testq	%r10, %r10
	je	.L4391
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19150
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r13
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r13,%r13,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17092:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4391:
	movzbl	2(%rdi), %ebx
	movl	$15, %eax
	cmpl	%ebx, %eax
	jge	.L4396
	movb	$15, 2(%rdi)
.L4396:
	testq	%r10, %r10
	je	.L4338
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16771
	cmpb	$14, %al
	je	.L16772
	cmpb	$15, %al
	jmp	.L17615
.L16771:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r9
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%rbp
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rdi), %ecx
	leaq	(%rbp,%rbp,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17094
.L19150:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r13
	salq	$4, %r13
	movslq	16(%r13,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17092
.L4380:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4382
	movl	$15, %r11d
	jmp	.L4379
.L4382:
	xorl	%ebx, %ebx
	jmp	.L4379
.L19147:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4342
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4338
	jmp	.L4342
.L19146:
	movzwl	(%rbx), %edi
	movslq	%edi,%r11
	cmpb	$60, rtx_class(%r11)
	jne	.L4366
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L4366
	movq	8(%rbx), %r13
	cmpq	%r13, 8(%rbp)
	jne	.L4366
	movq	16(%rbx), %r10
	cmpq	%r10, 16(%rbp)
	jne	.L4366
	movl	$1, %eax
	jmp	.L4367
.L19145:
	cmpw	$47, %dx
	jne	.L4363
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4363
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4363
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19151
	movq	24(%rbx), %rax
.L4361:
	cmpw	$67, (%rax)
	jne	.L4363
	cmpq	%rsi, %rcx
	jne	.L4363
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4355
.L19151:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4355
	jmp	.L4361
.L19144:
	movq	8(%rax), %rbx
	jmp	.L4355
.L19143:
	cmpw	$47, %dx
	je	.L19152
.L4352:
	xorl	%ebp, %ebp
	jmp	.L4344
.L19152:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4352
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4352
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19153
	movq	24(%rbp), %rax
.L4350:
	cmpw	$67, (%rax)
	jne	.L4352
	cmpq	%rsi, %rcx
	jne	.L4352
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L4344
.L19153:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L4344
	jmp	.L4350
.L19142:
	movq	8(%rax), %rbp
	jmp	.L4344
.L4334:
	movq	1304(%rsp), %rax
	movq	1312(%rsp), %rsi
	movq	8(%rax), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L4262
	movq	1296(%rsp), %rdx
	movq	8(%rdx), %r14
	cmpq	%r14, 1696(%rsp)
	je	.L4262
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L4262
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L4266
	cmpw	$34, %ax
	je	.L4266
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L4268
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19154
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19155
.L4268:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4279
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19156
	cmpw	$33, (%r14)
	je	.L19157
.L4287:
	xorl	%ebx, %ebx
.L4279:
	testq	%rbp, %rbp
	je	.L4266
	testq	%rbx, %rbx
	je	.L4266
	movzwl	(%rbp), %r13d
	movslq	%r13d,%rcx
	cmpb	$60, rtx_class(%rcx)
	je	.L19158
.L4290:
	xorl	%eax, %eax
.L4291:
	testl	%eax, %eax
	jne	.L19159
.L4266:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L4292
	testb	$16, 3(%rax)
	je	.L4292
	cmpw	$36, (%rax)
	je	.L4292
.L4293:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L4294
	testb	$16, 3(%rax)
	je	.L4294
	cmpw	$36, (%rax)
	je	.L4294
	movq	%rax, %rbx
	jmp	.L4293
.L4294:
	cmpq	%rbx, 1696(%rsp)
	je	.L4262
	movq	%rbx, %r14
.L4292:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L4299
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r13),%rbp
	movl	16(%rcx,%r13), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r13
	addq	(%rsi,%rdi), %r13
	movq	16(%r13), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L4303
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4304
	movl	$14, %r11d
.L4303:
	testl	%ebx, %ebx
	je	.L4309
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L4262
.L4299:
	testl	%ebx, %ebx
	je	.L4309
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4309
.L4327:
	cmpq	%r14, 8(%rdi)
	je	.L19160
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4327
.L4309:
	movq	1696(%rsp), %r10
	movq	%r14, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L4262
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L4329
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r13
	movslq	8(%r14),%rdx
	leaq	(%rcx,%rcx,2), %rbp
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %rbp
	salq	$4, %r11
	movslq	16(%rbp,%r13),%r9
	movl	16(%r11,%r13), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17091:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L4262:
	movq	1296(%rsp), %rax
	movq	1304(%rsp), %rbp
	movq	16(%rax), %r13
	movq	%r13, 1296(%rsp)
	testq	%r13, %r13
	movq	16(%rbp), %r10
	movq	%r10, 1304(%rsp)
	jne	.L4334
	jmp	.L15974
.L4329:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16770
	movl	$14, %edx
	cmpl	$15, %edx
.L17614:
	jne	.L4262
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%rsi
	leaq	(%rsi,%rsi,2), %r8
	salq	$4, %r8
	movslq	16(%r8,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17090:
	movslq	8(%r14),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r14d
	shrl	$6, %r14d
	mov	%r14d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17091
.L16770:
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%rbp
	movq	h_i_d(%rip), %rcx
	leaq	(%rbp,%rbp,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17090
.L19160:
	testq	%r10, %r10
	je	.L4315
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19162
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r14),%rdx
	movq	h_i_d(%rip), %r13
	movslq	8(%rsi),%rcx
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%rcx,%rcx,2), %rbp
	movl	16(%r11,%r13), %ecx
	salq	$4, %rbp
	movslq	16(%rbp,%r13),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17089:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4315:
	movzbl	2(%rdi), %ebx
	movl	$14, %eax
	cmpl	%ebx, %eax
	jge	.L4320
	movb	$14, 2(%rdi)
.L4320:
	testq	%r10, %r10
	je	.L4262
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16769
	cmpb	$14, %al
	je	.L16770
	cmpb	$15, %al
	jmp	.L17614
.L16769:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%r9
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r13
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movl	16(%rbx,%rdi), %ecx
	leaq	(%r13,%r13,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rdi),%r8
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17091
.L19162:
	movq	1696(%rsp), %rax
	movslq	8(%r14),%rbp
	movq	h_i_d(%rip), %r13
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r13),%r9
	movl	16(%rdx,%r13), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17089
.L4304:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4306
	movl	$15, %r11d
	jmp	.L4303
.L4306:
	xorl	%ebx, %ebx
	jmp	.L4303
.L19159:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4266
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4262
	jmp	.L4266
.L19158:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L4290
	call	reverse_condition
	cmpl	%eax, %r13d
	jne	.L4290
	movq	8(%rbx), %r11
	cmpq	%r11, 8(%rbp)
	jne	.L4290
	movq	16(%rbx), %r8
	cmpq	%r8, 16(%rbp)
	jne	.L4290
	movl	$1, %eax
	jmp	.L4291
.L19157:
	cmpw	$47, %dx
	jne	.L4287
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4287
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4287
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19163
	movq	24(%rbx), %rax
.L4285:
	cmpw	$67, (%rax)
	jne	.L4287
	cmpq	%rsi, %rcx
	jne	.L4287
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4279
.L19163:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4279
	jmp	.L4285
.L19156:
	movq	8(%rax), %rbx
	jmp	.L4279
.L19155:
	cmpw	$47, %dx
	je	.L19164
.L4276:
	xorl	%ebp, %ebp
	jmp	.L4268
.L19164:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4276
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4276
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19165
	movq	24(%rbp), %rax
.L4274:
	cmpw	$67, (%rax)
	jne	.L4276
	cmpq	%rsi, %rcx
	jne	.L4276
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L4268
.L19165:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L4268
	jmp	.L4274
.L19154:
	movq	8(%rax), %rbp
	jmp	.L4268
.L19129:
	movq	%r12, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r11b
	movq	%rax, 1312(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r11b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	1312(%rsp), %r10
	movq	8(%r10), %rdi
	call	cselib_subst_to_values
	movq	1312(%rsp), %rcx
	movq	%rax, 8(%rcx)
	jmp	.L4242
.L19128:
	movl	8(%r12), %ebp
	cmpl	$52, %ebp
	jg	.L4125
	leal	-8(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L4128
	leal	-21(%rbp), %r14d
	cmpl	$7, %r14d
	jbe	.L4128
	leal	-45(%rbp), %edi
	cmpl	$7, %edi
	jbe	.L4128
	leal	-29(%rbp), %r9d
	cmpl	$7, %r9d
	ja	.L4126
.L4128:
	movzbq	2(%r12), %r11
	movl	mode_class(,%r11,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17084:
	addl	$2, %eax
.L4127:
	cmpl	$47, %ebx
	je	.L19166
	movl	%eax, %ebx
	decl	%ebx
	js	.L4240
.L4154:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L4154
	jmp	.L4240
.L19166:
	movl	%eax, %ebx
	decl	%ebx
	js	.L4240
.L4149:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L4149
	jmp	.L4240
.L4126:
	movzbl	2(%r12), %eax
	cmpb	$18, %al
	je	.L19167
	cmpb	$24, %al
	je	.L19168
	movl	target_flags(%rip), %r13d
	testl	$33554432, %r13d
	movl	%r13d, %ecx
	je	.L4139
	movzbl	%al, %r8d 
	movzbl	mode_size(%r8), %r10d
	leal	7(%r10), %edx
.L4140:
	andl	$33554432, %ecx
	je	.L4141
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L4127
.L4141:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L4127
.L4139:
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %esi
	leal	3(%rsi), %edx
	jmp	.L4140
.L19168:
	xorl	%r12d, %r12d
	testb	$2, target_flags+3(%rip)
	sete	%r12b
	leal	4(%r12,%r12), %eax
	jmp	.L4127
.L19167:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17084
.L4125:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %ebp
	jge	.L17700
	cmpl	$47, %ebx
	je	.L19169
	movq	reg_pending_clobbers(%rip), %rdi
.L17085:
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L16461
	movq	reg_known_equiv_p(%rip), %r14
	movslq	%ebp,%rbx
	addq	%rbx, %r14
	cmpb	$0, (%r14)
	je	.L4161
	leaq	0(,%rbx,8), %rdi
	addq	reg_known_value(%rip), %rdi
	movq	(%rdi), %rax
	cmpw	$66, (%rax)
	je	.L19170
.L4161:
	leaq	0(,%rbx,8), %r12
	addq	reg_n_info(%rip), %r12
	movq	32(%r12), %r11
	movl	32(%r11), %r9d
	testl	%r9d, %r9d
	jne	.L4240
	movq	1704(%rsp), %r10
	movq	48(%r10), %r13
	testq	%r13, %r13
	movq	%r13, 1320(%rsp)
	je	.L4240
	movl	$14, %r14d
.L4238:
	movq	1320(%rsp), %r8
	movq	8(%r8), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L4165
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L4165
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L4170
	cmpw	$34, %ax
	je	.L4170
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L4172
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19171
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19172
.L4172:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L4183
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19173
	cmpw	$33, (%r13)
	je	.L19174
.L4191:
	xorl	%ebx, %ebx
.L4183:
	testq	%rbp, %rbp
	je	.L4170
	testq	%rbx, %rbx
	je	.L4170
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19175
.L4194:
	xorl	%eax, %eax
.L4195:
	testl	%eax, %eax
	jne	.L19176
.L4170:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L4196
	testb	$16, 3(%rax)
	je	.L4196
	cmpw	$36, (%rax)
	je	.L4196
.L4197:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L4198
	testb	$16, 3(%rax)
	je	.L4198
	cmpw	$36, (%rax)
	je	.L4198
	movq	%rax, %rbx
	jmp	.L4197
.L4198:
	cmpq	%rbx, 1696(%rsp)
	je	.L4165
	movq	%rbx, %r13
.L4196:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L4203
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L4207
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4208
	movl	$14, %r11d
.L4207:
	testl	%ebx, %ebx
	je	.L4213
	cmpl	%r11d, %r14d
	jge	.L4165
.L4203:
	testl	%ebx, %ebx
	je	.L4213
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L4213
.L4231:
	cmpq	%r13, 8(%rdi)
	je	.L19177
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L4231
.L4213:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L4165
	testl	%r14d, %r14d
	jne	.L4233
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rbx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %rbx
	salq	$4, %r12
	movl	16(%rbx,%r9), %ecx
	movslq	16(%r12,%r9),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17088:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L4165:
	movq	1320(%rsp), %rax
	movq	16(%rax), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 1320(%rsp)
	jne	.L4238
	jmp	.L4240
.L4233:
	cmpl	$14, %r14d
	je	.L16768
	cmpl	$15, %r14d
.L17613:
	jne	.L4165
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17087:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17088
.L16768:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17087
.L19177:
	testq	%r10, %r10
	je	.L4219
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19179
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17086:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L4219:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L4224
	movb	$14, 2(%rdi)
.L4224:
	testq	%r10, %r10
	je	.L4165
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16767
	cmpb	$14, %al
	je	.L16768
	cmpb	$15, %al
	jmp	.L17613
.L16767:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r9
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%r9,%r9,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17088
.L19179:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17086
.L4208:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L4210
	movl	$15, %r11d
	jmp	.L4207
.L4210:
	xorl	%ebx, %ebx
	jmp	.L4207
.L19176:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L4170
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L4165
	jmp	.L4170
.L19175:
	movzwl	(%rbx), %edi
	movslq	%edi,%rdx
	cmpb	$60, rtx_class(%rdx)
	jne	.L4194
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L4194
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rbp)
	jne	.L4194
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L4194
	movl	$1, %eax
	jmp	.L4195
.L19174:
	cmpw	$47, %dx
	jne	.L4191
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4191
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4191
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19180
	movq	24(%rbx), %rax
.L4189:
	cmpw	$67, (%rax)
	jne	.L4191
	cmpq	%rsi, %rcx
	jne	.L4191
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L4183
.L19180:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L4183
	jmp	.L4189
.L19173:
	movq	8(%rax), %rbx
	jmp	.L4183
.L19172:
	cmpw	$47, %dx
	je	.L19181
.L4180:
	xorl	%ebp, %ebp
	jmp	.L4172
.L19181:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L4180
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L4180
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19182
	movq	24(%rbp), %rax
.L4178:
	cmpw	$67, (%rax)
	jne	.L4180
	cmpq	%rsi, %rcx
	jne	.L4180
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L4172
.L19182:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L4172
	jmp	.L4178
.L19171:
	movq	8(%rax), %rbp
	jmp	.L4172
.L19170:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L4161
.L16461:
	movslq	%ebp,%rbx
	jmp	.L4161
.L19169:
	movq	reg_pending_sets(%rip), %rdi
	jmp	.L17085
	.p2align 6,,7
.L19127:
	movq	1704(%rsp), %rdi
	movq	16(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	24(%r12), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L4122
.L19126:
	cmpw	$133, %dx
	je	.L4123
	cmpw	$132, %dx
	jne	.L15968
	jmp	.L4123
.L19125:
	movq	8(%r12), %rdx
	movl	(%rdx), %ebx
	decl	%ebx
	js	.L4240
.L4117:
	movslq	%ebx,%rbp
	movq	8(%rdx,%rbp,8), %r10
	movq	8(%r10), %rdx
	testq	%rdx, %rdx
	jne	.L19183
.L4114:
	decl	%ebx
	js	.L4240
	movq	8(%r12), %rdx
	jmp	.L4117
.L19183:
	movl	$49, %edi
	xorl	%esi, %esi
	call	gen_rtx_fmt_e
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	movq	%rax, %rsi
	call	sched_analyze_1
	jmp	.L4114
	.p2align 6,,7
.L1091:
	movq	1616(%rsp), %r12
	movzwl	%ax, %r14d
	movq	8(%r12), %rdx
	movl	%r14d, 1684(%rsp)
	testq	%rdx, %rdx
	movq	%rdx, 680(%rsp)
	je	.L3412
	movzwl	(%rdx), %edx
	cmpw	$39, %dx
	movl	%edx, %ecx
	je	.L19185
	leal	-63(%rcx), %r15d
	cmpw	$1, %r15w
	ja	.L19186
	.p2align 4,,7
.L2075:
	leal	-132(%rdx), %r13d
	cmpw	$1, %r13w
	ja	.L1428
	movq	680(%rsp), %rdi
	movq	16(%rdi), %r15
	testq	%r15, %r15
	je	.L1430
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L1431
	mov	%eax, %esi
	jmp	*.L1738(,%rsi,8)
	.section	.rodata
	.align 8
	.align 4
.L1738:
	.quad	.L1722
	.quad	.L1722
	.quad	.L1431
	.quad	.L1722
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1709
	.quad	.L1431
	.quad	.L1430
	.quad	.L1430
	.quad	.L1430
	.quad	.L1431
	.quad	.L1430
	.quad	.L1431
	.quad	.L1431
	.quad	.L1438
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1469
	.quad	.L1430
	.quad	.L1430
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1431
	.quad	.L1734
	.quad	.L1734
	.quad	.L1734
	.quad	.L1734
	.quad	.L1736
	.quad	.L1736
	.text
.L1438:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L1439
	leal	-8(%rbp), %ebx
	cmpl	$7, %ebx
	jbe	.L1442
	leal	-21(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L1442
	leal	-45(%rbp), %r10d
	cmpl	$7, %r10d
	jbe	.L1442
	leal	-29(%rbp), %r9d
	cmpl	$7, %r9d
	ja	.L1440
.L1442:
	movzbq	2(%r15), %r11
	movl	mode_class(,%r11,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L16993:
	addl	$2, %eax
.L1441:
	movl	%eax, %ebx
	decl	%ebx
	js	.L1430
.L1462:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L1462
	.p2align 4,,7
.L1430:
	movq	680(%rsp), %rbx
	movq	24(%rbx), %r15
	testq	%r15, %r15
	je	.L1428
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L1754
	mov	%eax, %r13d
	jmp	*.L2061(,%r13,8)
	.section	.rodata
	.align 8
	.align 4
.L2061:
	.quad	.L2045
	.quad	.L2045
	.quad	.L1754
	.quad	.L2045
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L2032
	.quad	.L1754
	.quad	.L1428
	.quad	.L1428
	.quad	.L1428
	.quad	.L1754
	.quad	.L1428
	.quad	.L1754
	.quad	.L1754
	.quad	.L1761
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1792
	.quad	.L1428
	.quad	.L1428
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L1754
	.quad	.L2057
	.quad	.L2057
	.quad	.L2057
	.quad	.L2057
	.quad	.L2059
	.quad	.L2059
	.text
.L1761:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L1762
	leal	-8(%rbp), %r14d
	cmpl	$7, %r14d
	jbe	.L1765
	leal	-21(%rbp), %r12d
	cmpl	$7, %r12d
	jbe	.L1765
	leal	-45(%rbp), %ecx
	cmpl	$7, %ecx
	jbe	.L1765
	leal	-29(%rbp), %edx
	cmpl	$7, %edx
	ja	.L1763
.L1765:
	movzbq	2(%r15), %r8
	movl	mode_class(,%r8,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17004:
	addl	$2, %eax
.L1764:
	movl	%eax, %ebx
	decl	%ebx
	js	.L1428
.L1785:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L1785
	.p2align 4,,7
.L1428:
	movq	680(%rsp), %r13
	movq	8(%r13), %rbx
	movzwl	(%rbx), %edx
	movq	%rbx, 680(%rsp)
	leal	-63(%rdx), %r15d
	cmpw	$1, %r15w
	jbe	.L2075
	cmpw	$133, %dx
	je	.L2075
	cmpw	$132, %dx
	je	.L2075
.L15857:
	cmpw	$61, %dx
	je	.L19187
	cmpw	$66, %dx
	je	.L19188
.L2515:
	movq	1616(%rsp), %rcx
	cmpw	$47, (%rcx)
	jne	.L3412
	movq	16(%rcx), %r15
	testq	%r15, %r15
	je	.L3412
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L3091
	mov	%eax, %r9d
	jmp	*.L3398(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L3398:
	.quad	.L3382
	.quad	.L3382
	.quad	.L3091
	.quad	.L3382
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3369
	.quad	.L3091
	.quad	.L3412
	.quad	.L3412
	.quad	.L3412
	.quad	.L3091
	.quad	.L3412
	.quad	.L3091
	.quad	.L3091
	.quad	.L3098
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3129
	.quad	.L3412
	.quad	.L3412
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3091
	.quad	.L3394
	.quad	.L3394
	.quad	.L3394
	.quad	.L3394
	.quad	.L3396
	.quad	.L3396
	.text
.L3098:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L7928
	leal	-8(%rbp), %ebx
	cmpl	$7, %ebx
	jbe	.L3102
	leal	-21(%rbp), %r11d
	cmpl	$7, %r11d
	jbe	.L3102
	leal	-45(%rbp), %r14d
	cmpl	$7, %r14d
	jbe	.L3102
	leal	-29(%rbp), %r12d
	cmpl	$7, %r12d
	ja	.L3100
.L3102:
	movzbq	2(%r15), %r8
	movl	mode_class(,%r8,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17050:
	addl	$2, %eax
.L3101:
	movl	%eax, %ebx
	decl	%ebx
	js	.L3412
.L3122:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L3122
	jmp	.L3412
.L3100:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L19189
	cmpb	$24, %al
	je	.L19190
	movl	target_flags(%rip), %r13d
	testl	$33554432, %r13d
	movl	%r13d, %ecx
	je	.L3113
	movzbl	%al, %esi 
	movzbl	mode_size(%rsi), %edi
	leal	7(%rdi), %edx
.L3114:
	andl	$33554432, %ecx
	je	.L3115
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L3101
.L3115:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L3101
.L3113:
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r10d
	leal	3(%r10), %edx
	jmp	.L3114
.L19190:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L3101
.L19189:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17050
.L3382:
	cmpl	$41, %ebx
	je	.L19191
.L3384:
	movb	$1, reg_pending_barrier(%rip)
.L3383:
	cmpl	$41, %ebx
	je	.L19192
.L3091:
	movslq	%ebx,%rbp
	movzbl	rtx_length(%rbp), %edi
	movq	rtx_format(,%rbp,8), %r13
	movl	%edi, %ebp
	decl	%ebp
	js	.L3412
	leaq	8(%r15), %r14
.L3411:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L19193
	cmpb	$69, %dl
	je	.L19194
.L3401:
	decl	%ebp
	jns	.L3411
	jmp	.L3412
.L19194:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L3401
	movq	%rdx, %r12
.L3410:
	movq	(%r12), %r10
	movslq	%ebx,%r11
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%r11,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rdx
	cmpl	(%rdx), %ebx
	jl	.L3410
	jmp	.L3401
.L19193:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L3401
.L19192:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L3412
.L3390:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %rcx
	cmpl	(%rcx), %ebx
	movq	%rcx, %rdx
	jl	.L3390
	jmp	.L3412
.L19191:
	testb	$8, 3(%r15)
	je	.L3383
	jmp	.L3384
.L3369:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r8
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r8, %rsi
	movl	$0, 32(%r8)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r12
	movq	%rax, 40(%r12)
	movl	$1, 36(%r12)
	jmp	.L3091
.L3129:
	movq	current_sched_info(%rip), %rbp
	movq	%r15, 544(%rsp)
	testb	$2, 96(%rbp)
	jne	.L19195
.L3130:
	movq	1704(%rsp), %r12
	movq	1704(%rsp), %r14
	movq	(%r12), %rbx
	movq	8(%r14), %r11
	testq	%rbx, %rbx
	movq	%rbx, 528(%rsp)
	movq	%r11, 536(%rsp)
	jne	.L3210
.L15925:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %r9
	movq	24(%r11), %rbx
	testq	%r9, %r9
	movq	%r9, 512(%rsp)
	movq	%rbx, 520(%rsp)
	jne	.L3286
.L15928:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %r10
	testq	%r10, %r10
	movq	%r10, 504(%rsp)
	je	.L15931
.L3366:
	movq	504(%rsp), %r11
	movq	8(%r11), %r14
	cmpw	$33, (%r14)
	je	.L19196
.L3292:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L3289
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L3289
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L3298
	cmpw	$34, %ax
	je	.L3298
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L3300
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19197
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19198
.L3300:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L3311
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19199
	cmpw	$33, (%r14)
	je	.L19200
.L3319:
	xorl	%ebx, %ebx
.L3311:
	testq	%rbp, %rbp
	je	.L3298
	testq	%rbx, %rbx
	je	.L3298
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19201
.L3322:
	xorl	%eax, %eax
.L3323:
	testl	%eax, %eax
	jne	.L19202
.L3298:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3324
	testb	$16, 3(%rax)
	je	.L3324
	cmpw	$36, (%rax)
	je	.L3324
.L3325:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3326
	testb	$16, 3(%rax)
	je	.L3326
	cmpw	$36, (%rax)
	je	.L3326
	movq	%rax, %rbx
	jmp	.L3325
.L3326:
	cmpq	%rbx, 1696(%rsp)
	je	.L3289
	movq	%rbx, %r13
.L3324:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3331
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%rbp
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rcx), %edx
	leaq	(%rbp,%rbp,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rcx),%r12
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	movl	%edx, %ecx
	leaq	0(,%r12,8), %rdi
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3335
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3336
	movl	$14, %r11d
.L3335:
	testl	%ebx, %ebx
	je	.L3341
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L3289
.L3331:
	testl	%ebx, %ebx
	je	.L3341
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L3341
.L3359:
	cmpq	%r13, 8(%rdi)
	je	.L19203
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3359
.L3341:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L3289
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L3361
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rsi
	leaq	(%rcx,%rcx,2), %r14
	salq	$4, %rsi
	salq	$4, %r14
	movl	16(%rsi,%r11), %ecx
	movslq	16(%r14,%r11),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17059:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L3289:
	movq	504(%rsp), %rsi
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 504(%rsp)
	jne	.L3366
.L15931:
	movq	1704(%rsp), %r9
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%r9), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r10
	movq	1704(%rsp), %r11
	movq	%rax, (%r11)
	testb	$2, 96(%r10)
	jne	.L19204
.L3367:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %r14
	incl	32(%r14)
	movq	%rax, 8(%r14)
	movq	%r14, %rdi
	movq	8(%r15), %rsi
	jmp	.L17257
.L19204:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L3367
.L3361:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16752
	movl	$14, %r14d
	cmpl	$15, %r14d
.L17604:
	jne	.L3289
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r8
	movq	h_i_d(%rip), %rcx
	leaq	(%r8,%r8,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17058:
	movslq	8(%r13),%rdi
	leaq	(%rdi,%rdi,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17059
.L16752:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17058
.L19203:
	testq	%r10, %r10
	je	.L3347
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19206
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%r14
	movq	h_i_d(%rip), %r9
	movslq	8(%r12),%rcx
	leaq	(%r14,%r14,2), %r11
	salq	$4, %r11
	leaq	(%rcx,%rcx,2), %rdx
	movl	16(%r11,%r9), %ecx
	salq	$4, %rdx
	movslq	16(%rdx,%r9),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17057:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L3347:
	movzbl	2(%rdi), %ebp
	movl	$14, %eax
	cmpl	%ebp, %eax
	jge	.L3352
	movb	$14, 2(%rdi)
.L3352:
	testq	%r10, %r10
	je	.L3289
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16751
	cmpb	$14, %al
	je	.L16752
	cmpb	$15, %al
	jmp	.L17604
.L16751:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdi
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%rsi
	leaq	(%rdi,%rdi,2), %r8
	salq	$4, %r8
	movl	16(%r8,%rbp), %ecx
	leaq	(%rsi,%rsi,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rbp),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17059
.L19206:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r14
	movslq	8(%rax),%rbp
	leaq	(%rcx,%rcx,2), %rdx
	salq	$4, %rdx
	movl	16(%rdx,%r14), %ecx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%r14),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17057
.L3336:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3338
	movl	$15, %r11d
	jmp	.L3335
.L3338:
	xorl	%ebx, %ebx
	jmp	.L3335
.L19202:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L3298
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L3289
	jmp	.L3298
.L19201:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L3322
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L3322
	movq	8(%rbx), %r9
	cmpq	%r9, 8(%rbp)
	jne	.L3322
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L3322
	movl	$1, %eax
	jmp	.L3323
.L19200:
	cmpw	$47, %dx
	jne	.L3319
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3319
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3319
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19207
	movq	24(%rbx), %rax
.L3317:
	cmpw	$67, (%rax)
	jne	.L3319
	cmpq	%rsi, %rcx
	jne	.L3319
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L3311
.L19207:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L3311
	jmp	.L3317
.L19199:
	movq	8(%rax), %rbx
	jmp	.L3311
.L19198:
	cmpw	$47, %dx
	je	.L19208
.L3308:
	xorl	%ebp, %ebp
	jmp	.L3300
.L19208:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3308
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3308
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19209
	movq	24(%rbp), %rax
.L3306:
	cmpw	$67, (%rax)
	jne	.L3308
	cmpq	%rsi, %rcx
	jne	.L3308
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L3300
.L19209:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L3300
	jmp	.L3306
.L19197:
	movq	8(%rax), %rbp
	jmp	.L3300
.L19196:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L19210
.L3293:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L3289
	movq	504(%rsp), %rcx
	movq	8(%rcx), %r14
	jmp	.L3292
.L19210:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L3293
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	cmovne	%rbp, %rdi
	jmp	.L3293
.L3286:
	movq	520(%rsp), %r12
	movq	544(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L3214
	movq	512(%rsp), %rbp
	xorl	%r14d, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L3214
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L3214
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L3218
	cmpw	$34, %ax
	je	.L3218
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L3220
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19211
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19212
.L3220:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L3231
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19213
	cmpw	$33, (%r13)
	je	.L19214
.L3239:
	xorl	%ebx, %ebx
.L3231:
	testq	%rbp, %rbp
	je	.L3218
	testq	%rbx, %rbx
	je	.L3218
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19215
.L3242:
	xorl	%eax, %eax
.L3243:
	testl	%eax, %eax
	jne	.L19216
.L3218:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3244
	testb	$16, 3(%rax)
	je	.L3244
	cmpw	$36, (%rax)
	je	.L3244
.L3245:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3246
	testb	$16, 3(%rax)
	je	.L3246
	cmpw	$36, (%rax)
	je	.L3246
	movq	%rax, %rbx
	jmp	.L3245
.L3246:
	cmpq	%rbx, 1696(%rsp)
	je	.L3214
	movq	%rbx, %r13
.L3244:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3251
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3255
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3256
	movl	$14, %r11d
.L3255:
	testl	%ebx, %ebx
	je	.L3261
	cmpl	%r11d, %r14d
	jge	.L3214
.L3251:
	testl	%ebx, %ebx
	je	.L3261
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L3261
.L3279:
	cmpq	%r13, 8(%rdi)
	je	.L19217
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3279
.L3261:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L3214
	testl	%r14d, %r14d
	jne	.L3281
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%rbp,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17056:
	andl	$63, %ecx
	movl	$1, %r9d
	salq	%cl, %r9
	orq	%r9, 16(%rax)
.L3214:
	movq	512(%rsp), %rax
	movq	520(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 512(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 520(%rsp)
	jne	.L3286
	jmp	.L15928
.L3281:
	cmpl	$14, %r14d
	je	.L16750
	cmpl	$15, %r14d
.L17603:
	jne	.L3214
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17055:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17056
.L16750:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17055
.L19217:
	testq	%r10, %r10
	je	.L3267
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19219
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17054:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L3267:
	movzbl	2(%rdi), %r9d
	cmpl	%r9d, %r14d
	jge	.L3272
	movb	$0, 2(%rdi)
.L3272:
	testq	%r10, %r10
	je	.L3214
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16749
	cmpb	$14, %al
	je	.L16750
	cmpb	$15, %al
	jmp	.L17603
.L16749:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%r9
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%r9,%r9,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17056
.L19219:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %rbx
	addq	anti_dependency_cache(%rip), %rbx
	addq	(%rbx), %rax
	jmp	.L17054
.L3256:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3258
	movl	$15, %r11d
	jmp	.L3255
.L3258:
	xorl	%ebx, %ebx
	jmp	.L3255
.L19216:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L3218
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L3214
	jmp	.L3218
.L19215:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L3242
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L3242
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L3242
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L3242
	movl	$1, %eax
	jmp	.L3243
.L19214:
	cmpw	$47, %dx
	jne	.L3239
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3239
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3239
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19220
	movq	24(%rbx), %rax
.L3237:
	cmpw	$67, (%rax)
	jne	.L3239
	cmpq	%rsi, %rcx
	jne	.L3239
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L3231
.L19220:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L3231
	jmp	.L3237
.L19213:
	movq	8(%rax), %rbx
	jmp	.L3231
.L19212:
	cmpw	$47, %dx
	je	.L19221
.L3228:
	xorl	%ebp, %ebp
	jmp	.L3220
.L19221:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3228
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3228
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19222
	movq	24(%rbp), %rax
.L3226:
	cmpw	$67, (%rax)
	jne	.L3228
	cmpq	%rsi, %rcx
	jne	.L3228
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L3220
.L19222:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L3220
	jmp	.L3226
.L19211:
	movq	8(%rax), %rbp
	jmp	.L3220
.L3210:
	movq	536(%rsp), %r8
	movq	544(%rsp), %rsi
	movq	8(%r8), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L3138
	movq	528(%rsp), %rdi
	movl	$14, %r14d
	movq	8(%rdi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L3138
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L3138
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L3142
	cmpw	$34, %ax
	je	.L3142
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L3144
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19223
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19224
.L3144:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L3155
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19225
	cmpw	$33, (%r13)
	je	.L19226
.L3163:
	xorl	%ebx, %ebx
.L3155:
	testq	%rbp, %rbp
	je	.L3142
	testq	%rbx, %rbx
	je	.L3142
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19227
.L3166:
	xorl	%eax, %eax
.L3167:
	testl	%eax, %eax
	jne	.L19228
.L3142:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3168
	testb	$16, 3(%rax)
	je	.L3168
	cmpw	$36, (%rax)
	je	.L3168
.L3169:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3170
	testb	$16, 3(%rax)
	je	.L3170
	cmpw	$36, (%rax)
	je	.L3170
	movq	%rax, %rbx
	jmp	.L3169
.L3170:
	cmpq	%rbx, 1696(%rsp)
	je	.L3138
	movq	%rbx, %r13
.L3168:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3175
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3179
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3180
	movl	$14, %r11d
.L3179:
	testl	%ebx, %ebx
	je	.L3185
	cmpl	%r11d, %r14d
	jge	.L3138
.L3175:
	testl	%ebx, %ebx
	je	.L3185
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L3185
.L3203:
	cmpq	%r13, 8(%rdi)
	je	.L19229
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3203
.L3185:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L3138
	testl	%r14d, %r14d
	jne	.L3205
	movslq	8(%r13),%rbx
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %r9
	leaq	(%rbx,%rbx,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%r9), %ecx
	movslq	16(%r11,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17053:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L3138:
	movq	528(%rsp), %rax
	movq	536(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 528(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 536(%rsp)
	jne	.L3210
	jmp	.L15925
.L3205:
	cmpl	$14, %r14d
	je	.L16748
	cmpl	$15, %r14d
.L17602:
	jne	.L3138
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17052:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17053
.L16748:
	movq	1696(%rsp), %rbx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbx),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17052
.L19229:
	testq	%r10, %r10
	je	.L3191
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19231
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17051:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L3191:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L3196
	movb	$14, 2(%rdi)
.L3196:
	testq	%r10, %r10
	je	.L3138
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16747
	cmpb	$14, %al
	je	.L16748
	cmpb	$15, %al
	jmp	.L17602
.L16747:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17053
.L19231:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %rbx
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17051
.L3180:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3182
	movl	$15, %r11d
	jmp	.L3179
.L3182:
	xorl	%ebx, %ebx
	jmp	.L3179
.L19228:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L3142
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L3138
	jmp	.L3142
.L19227:
	movzwl	(%rbx), %edi
	movslq	%edi,%r10
	cmpb	$60, rtx_class(%r10)
	jne	.L3166
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L3166
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L3166
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L3166
	movl	$1, %eax
	jmp	.L3167
.L19226:
	cmpw	$47, %dx
	jne	.L3163
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3163
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3163
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19232
	movq	24(%rbx), %rax
.L3161:
	cmpw	$67, (%rax)
	jne	.L3163
	cmpq	%rsi, %rcx
	jne	.L3163
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L3155
.L19232:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L3155
	jmp	.L3161
.L19225:
	movq	8(%rax), %rbx
	jmp	.L3155
.L19224:
	cmpw	$47, %dx
	je	.L19233
.L3152:
	xorl	%ebp, %ebp
	jmp	.L3144
.L19233:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L3152
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L3152
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19234
	movq	24(%rbp), %rax
.L3150:
	cmpw	$67, (%rax)
	jne	.L3152
	cmpq	%rsi, %rcx
	jne	.L3152
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L3144
.L19234:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L3144
	jmp	.L3150
.L19223:
	movq	8(%rax), %rbp
	jmp	.L3144
.L19195:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%r9b
	movq	%rax, 544(%rsp)
	movq	8(%rax), %rdi
	movzbl	%r9b, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	544(%rsp), %rax
	movq	8(%rax), %rdi
	call	cselib_subst_to_values
	movq	544(%rsp), %rcx
	movq	%rax, 8(%rcx)
	jmp	.L3130
.L3394:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17258:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L3412
.L3396:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17258
	.p2align 6,,7
.L19188:
	movq	current_sched_info(%rip), %r14
	movq	680(%rsp), %r15
	testb	$2, 96(%r14)
	jne	.L19235
.L2517:
	movq	compiler_params(%rip), %rcx
	movl	80(%rcx), %eax
	movq	1704(%rsp), %rcx
	cmpl	%eax, 32(%rcx)
	jg	.L19236
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %rbp
	movq	(%rax), %r11
	movq	8(%rbp), %r12
	testq	%r11, %r11
	movq	%r11, 616(%rsp)
	movq	%r12, 624(%rsp)
	jne	.L2609
.L15902:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r9
	movq	16(%rcx), %rbx
	movq	24(%r9), %r11
	testq	%rbx, %rbx
	movq	%rbx, 600(%rsp)
	movq	%r11, 608(%rsp)
	jne	.L2685
.L15905:
	movq	1704(%rsp), %r10
	movq	40(%r10), %r15
	testq	%r15, %r15
	je	.L15908
	movl	$14, %r14d
.L2761:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L2688
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L2688
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L2693
	cmpw	$34, %ax
	je	.L2693
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L2695
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19237
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19238
.L2695:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L2706
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19239
	cmpw	$33, (%r13)
	je	.L19240
.L2714:
	xorl	%ebx, %ebx
.L2706:
	testq	%rbp, %rbp
	je	.L2693
	testq	%rbx, %rbx
	je	.L2693
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r11
	cmpb	$60, rtx_class(%r11)
	je	.L19241
.L2717:
	xorl	%eax, %eax
.L2718:
	testl	%eax, %eax
	jne	.L19242
.L2693:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L2719
	testb	$16, 3(%rax)
	je	.L2719
	cmpw	$36, (%rax)
	je	.L2719
.L2720:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L2721
	testb	$16, 3(%rax)
	je	.L2721
	cmpw	$36, (%rax)
	je	.L2721
	movq	%rax, %rbx
	jmp	.L2720
.L2721:
	cmpq	%rbx, 1696(%rsp)
	je	.L2688
	movq	%rbx, %r13
.L2719:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L2726
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L2730
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2731
	movl	$14, %r11d
.L2730:
	testl	%ebx, %ebx
	je	.L2736
	cmpl	%r11d, %r14d
	jge	.L2688
.L2726:
	testl	%ebx, %ebx
	je	.L2736
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2736
.L2754:
	cmpq	%r13, 8(%rdi)
	je	.L19243
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L2754
.L2736:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L2688
	testl	%r14d, %r14d
	jne	.L2756
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rbx
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %rbx
	salq	$4, %r12
	movl	16(%rbx,%r11), %ecx
	movslq	16(%r12,%r11),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17038:
	andl	$63, %ecx
	movl	$1, %r11d
	salq	%cl, %r11
	orq	%r11, 16(%rax)
.L2688:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L2761
.L15908:
	movq	1704(%rsp), %rdx
	movq	1696(%rsp), %rdi
	movq	680(%rsp), %rbx
	movq	16(%rdx), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %r15
	movq	1704(%rsp), %r14
	movq	%rax, 16(%r14)
	testb	$2, 96(%r15)
	jne	.L19244
.L2763:
	movq	1704(%rsp), %rax
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	24(%rax), %rdx
	call	alloc_EXPR_LIST
	movq	1704(%rsp), %rcx
	movq	%rax, 24(%rcx)
	incl	32(%rcx)
.L2533:
	movq	680(%rsp), %r10
	movq	8(%r10), %r15
	testq	%r15, %r15
	je	.L2515
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L2767
	mov	%eax, %r9d
	jmp	*.L3074(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L3074:
	.quad	.L3058
	.quad	.L3058
	.quad	.L2767
	.quad	.L3058
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L3045
	.quad	.L2767
	.quad	.L2515
	.quad	.L2515
	.quad	.L2515
	.quad	.L2767
	.quad	.L2515
	.quad	.L2767
	.quad	.L2767
	.quad	.L2774
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2805
	.quad	.L2515
	.quad	.L2515
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L2767
	.quad	.L3070
	.quad	.L3070
	.quad	.L3070
	.quad	.L3070
	.quad	.L3072
	.quad	.L3072
	.text
.L2774:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L2775
	leal	-8(%rbp), %r12d
	cmpl	$7, %r12d
	jbe	.L2778
	leal	-21(%rbp), %r8d
	cmpl	$7, %r8d
	jbe	.L2778
	leal	-45(%rbp), %esi
	cmpl	$7, %esi
	jbe	.L2778
	leal	-29(%rbp), %r13d
	cmpl	$7, %r13d
	ja	.L2776
.L2778:
	movzbq	2(%r15), %rdi
	movl	mode_class(,%rdi,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17039:
	addl	$2, %eax
.L2777:
	movl	%eax, %ebx
	decl	%ebx
	js	.L2515
.L2798:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L2798
	jmp	.L2515
.L2776:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L19245
	cmpb	$24, %al
	je	.L19246
	movl	target_flags(%rip), %r11d
	testl	$33554432, %r11d
	movl	%r11d, %ecx
	je	.L2789
	movzbl	%al, %r14d 
	movzbl	mode_size(%r14), %r15d
	leal	7(%r15), %edx
.L2790:
	andl	$33554432, %ecx
	je	.L2791
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L2777
.L2791:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L2777
.L2789:
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r10d
	leal	3(%r10), %edx
	jmp	.L2790
.L19246:
	xorl	%ebx, %ebx
	testb	$2, target_flags+3(%rip)
	sete	%bl
	leal	4(%rbx,%rbx), %eax
	jmp	.L2777
.L19245:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17039
.L2775:
	movq	1704(%rsp), %rcx
	cmpl	68(%rcx), %ebp
	jl	.L2800
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L2515
	jmp	.L17569
.L2800:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %r9d
	testl	%r9d, %r9d
	jne	.L16429
	movq	reg_known_equiv_p(%rip), %r12
	movslq	%ebp,%rbx
	addq	%rbx, %r12
	cmpb	$0, (%r12)
	je	.L2803
	leaq	0(,%rbx,8), %r8
	addq	reg_known_value(%rip), %r8
	movq	(%r8), %rax
	cmpw	$66, (%rax)
	je	.L19247
.L2803:
	leaq	0(,%rbx,8), %rdi
	addq	reg_n_info(%rip), %rdi
	movq	32(%rdi), %r13
	movl	32(%r13), %esi
	testl	%esi, %esi
	jne	.L2515
	movq	1704(%rsp), %r11
	movq	1696(%rsp), %rdi
	movq	56(%r11), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %rbx
	movq	%rax, 56(%rbx)
	jmp	.L2515
.L19247:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L2803
.L16429:
	movslq	%ebp,%rbx
	jmp	.L2803
.L3058:
	cmpl	$41, %ebx
	je	.L19248
.L3060:
	movb	$1, reg_pending_barrier(%rip)
.L3059:
	cmpl	$41, %ebx
	je	.L19249
.L2767:
	movslq	%ebx,%rsi
	movzbl	rtx_length(%rsi), %edi
	movq	rtx_format(,%rsi,8), %r13
	movl	%edi, %ebp
	decl	%ebp
	js	.L2515
	leaq	8(%r15), %r14
.L3087:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L19250
	cmpb	$69, %dl
	je	.L19251
.L3077:
	decl	%ebp
	jns	.L3087
	jmp	.L2515
	.p2align 6,,7
.L19251:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rcx
	cmpl	(%rcx), %ebx
	jge	.L3077
	movq	%rdx, %r12
.L3086:
	movq	(%r12), %r10
	movslq	%ebx,%rax
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%rax,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rdx
	cmpl	(%rdx), %ebx
	jl	.L3086
	jmp	.L3077
.L19250:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L3077
.L19249:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L2515
.L3066:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %r8
	cmpl	(%r8), %ebx
	movq	%r8, %rdx
	jl	.L3066
	jmp	.L2515
.L19248:
	testb	$8, 3(%r15)
	je	.L3059
	jmp	.L3060
.L3045:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r12
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r12, %rsi
	movl	$0, 32(%r12)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r14
	movq	%rax, 40(%r14)
	movl	$1, 36(%r14)
	jmp	.L2767
.L2805:
	movq	current_sched_info(%rip), %r14
	movq	%r15, 592(%rsp)
	testb	$2, 96(%r14)
	jne	.L19252
.L2806:
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %r12
	movq	(%rax), %rbp
	movq	8(%r12), %r9
	testq	%rbp, %rbp
	movq	%rbp, 576(%rsp)
	movq	%r9, 584(%rsp)
	jne	.L2886
.L15912:
	movq	1704(%rsp), %rbp
	movq	1704(%rsp), %r11
	movq	16(%rbp), %r10
	movq	24(%r11), %r9
	testq	%r10, %r10
	movq	%r10, 560(%rsp)
	movq	%r9, 568(%rsp)
	jne	.L2962
.L15915:
	movq	1704(%rsp), %rbx
	movq	40(%rbx), %rcx
	testq	%rcx, %rcx
	movq	%rcx, 552(%rsp)
	je	.L15918
.L3042:
	movq	552(%rsp), %r9
	movq	8(%r9), %r14
	cmpw	$33, (%r14)
	je	.L19253
.L2968:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
	je	.L2965
	movzwl	(%r14), %eax
	cmpw	$37, %ax
	je	.L2965
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L2974
	cmpw	$34, %ax
	je	.L2974
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L2976
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19254
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19255
.L2976:
	movq	32(%r14), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L2987
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19256
	cmpw	$33, (%r14)
	je	.L19257
.L2995:
	xorl	%ebx, %ebx
.L2987:
	testq	%rbp, %rbp
	je	.L2974
	testq	%rbx, %rbx
	je	.L2974
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19258
.L2998:
	xorl	%eax, %eax
.L2999:
	testl	%eax, %eax
	jne	.L19259
.L2974:
	movq	%r14, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L3000
	testb	$16, 3(%rax)
	je	.L3000
	cmpw	$36, (%rax)
	je	.L3000
.L3001:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L3002
	testb	$16, 3(%rax)
	je	.L3002
	cmpw	$36, (%rax)
	je	.L3002
	movq	%rax, %rbx
	jmp	.L3001
.L3002:
	cmpq	%rbx, 1696(%rsp)
	je	.L2965
	movq	%rbx, %r13
.L3000:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L3007
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	movl	16(%r14,%rbp), %edx
	leaq	(%r12,%r12,2), %rdi
	salq	$4, %rdi
	movslq	16(%rdi,%rbp),%rcx
	movl	%edx, %r12d
	andl	$63, %edx
	shrl	$6, %r12d
	leaq	0(,%rcx,8), %rdi
	mov	%r12d, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r14
	addq	(%rsi,%rdi), %r14
	movq	16(%r14), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L3011
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3012
	movl	$14, %r11d
.L3011:
	testl	%ebx, %ebx
	je	.L3017
	movl	$14, %eax
	cmpl	%r11d, %eax
	jge	.L2965
.L3007:
	testl	%ebx, %ebx
	je	.L3017
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L3017
.L3035:
	cmpq	%r13, 8(%rdi)
	je	.L19260
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L3035
.L3017:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L2965
	movl	$14, %edi
	testl	%edi, %edi
	jne	.L3037
	movslq	8(%r13),%r11
	movslq	8(%rdx),%r14
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rsi
	leaq	(%r14,%r14,2), %rbp
	salq	$4, %rsi
	salq	$4, %rbp
	movl	16(%rsi,%r9), %ecx
	movslq	16(%rbp,%r9),%rbx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17048:
	andl	$63, %ecx
	movl	$1, %esi
	salq	%cl, %rsi
	orq	%rsi, 16(%rax)
.L2965:
	movq	552(%rsp), %rax
	movq	16(%rax), %rdx
	testq	%rdx, %rdx
	movq	%rdx, 552(%rsp)
	jne	.L3042
.L15918:
	movq	1704(%rsp), %r9
	movq	1696(%rsp), %rdi
	movq	%r15, %rbx
	movq	(%r9), %rsi
	call	alloc_INSN_LIST
	movq	current_sched_info(%rip), %rcx
	movq	1704(%rsp), %r10
	movq	%rax, (%r10)
	testb	$2, 96(%rcx)
	jne	.L19261
.L3043:
	movq	1704(%rsp), %rbp
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movq	8(%rbp), %rdx
	call	alloc_EXPR_LIST
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %r11
	incl	32(%r11)
	movq	%rax, 8(%r11)
	movq	%r11, %rdi
	movq	8(%r15), %rsi
	call	sched_analyze_2
	jmp	.L2515
.L19261:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L3043
.L3037:
	movl	$14, %eax
	cmpl	$14, %eax
	je	.L16746
	movl	$14, %ebp
	cmpl	$15, %ebp
.L17601:
	jne	.L2965
	movq	1696(%rsp), %r8
	movq	h_i_d(%rip), %rcx
	movslq	8(%r8),%r12
	leaq	(%r12,%r12,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17047:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17048
.L16746:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17047
.L19260:
	testq	%r10, %r10
	je	.L3023
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19263
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %r12
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r11
	movslq	8(%r12),%rcx
	leaq	(%rbp,%rbp,2), %r9
	salq	$4, %r9
	leaq	(%rcx,%rcx,2), %r14
	movl	16(%r9,%r11), %ecx
	salq	$4, %r14
	movslq	16(%r14,%r11),%rbx
	movl	%ecx, %esi
	shrl	$6, %esi
	mov	%esi, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17046:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L3023:
	movzbl	2(%rdi), %edx
	movl	$14, %eax
	cmpl	%edx, %eax
	jge	.L3028
	movb	$14, 2(%rdi)
.L3028:
	testq	%r10, %r10
	je	.L2965
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16745
	cmpb	$14, %al
	je	.L16746
	cmpb	$15, %al
	jmp	.L17601
.L16745:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rbx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rbx), %ecx
	leaq	(%rsi,%rsi,2), %rdx
	salq	$4, %rdx
	movslq	16(%rdx,%rbx),%r12
	movl	%ecx, %r8d
	shrl	$6, %r8d
	mov	%r8d, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17048
.L19263:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rax),%r12
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%r9
	movl	16(%r14,%rbp), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17046
.L3012:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L3014
	movl	$15, %r11d
	jmp	.L3011
.L3014:
	xorl	%ebx, %ebx
	jmp	.L3011
.L19259:
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L2974
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L2965
	jmp	.L2974
.L19258:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L2998
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L2998
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L2998
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L2998
	movl	$1, %eax
	jmp	.L2999
.L19257:
	cmpw	$47, %dx
	jne	.L2995
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2995
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2995
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19264
	movq	24(%rbx), %rax
.L2993:
	cmpw	$67, (%rax)
	jne	.L2995
	cmpq	%rsi, %rcx
	jne	.L2995
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L2987
.L19264:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L2987
	jmp	.L2993
.L19256:
	movq	8(%rax), %rbx
	jmp	.L2987
.L19255:
	cmpw	$47, %dx
	je	.L19265
.L2984:
	xorl	%ebp, %ebp
	jmp	.L2976
.L19265:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2984
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2984
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19266
	movq	24(%rbp), %rax
.L2982:
	cmpw	$67, (%rax)
	jne	.L2984
	cmpq	%rsi, %rcx
	jne	.L2984
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L2976
.L19266:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L2976
	jmp	.L2982
.L19254:
	movq	8(%rax), %rbp
	jmp	.L2976
.L19253:
	movq	8(%r15), %rdi
	cmpw	$61, (%rdi)
	je	.L19267
.L2969:
	call	rtx_addr_can_trap_p
	testl	%eax, %eax
	je	.L2965
	movq	552(%rsp), %rbp
	movq	8(%rbp), %r14
	jmp	.L2968
.L19267:
	movl	8(%rdi), %eax
	cmpl	$52, %eax
	jbe	.L2969
	mov	%eax, %r12d
	salq	$3, %r12
	addq	reg_known_value(%rip), %r12
	movq	(%r12), %r11
	testq	%r11, %r11
	cmovne	%r11, %rdi
	jmp	.L2969
.L2962:
	movq	568(%rsp), %r12
	movq	592(%rsp), %rdx
	xorl	%esi, %esi
	movl	$rtx_varies_p, %ecx
	movq	8(%r12), %rdi
	call	true_dependence
	testl	%eax, %eax
	je	.L2890
	movq	560(%rsp), %rcx
	xorl	%r14d, %r14d
	movq	8(%rcx), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L2890
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L2890
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L2894
	cmpw	$34, %ax
	je	.L2894
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L2896
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19268
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19269
.L2896:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L2907
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19270
	cmpw	$33, (%r13)
	je	.L19271
.L2915:
	xorl	%ebx, %ebx
.L2907:
	testq	%rbp, %rbp
	je	.L2894
	testq	%rbx, %rbx
	je	.L2894
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19272
.L2918:
	xorl	%eax, %eax
.L2919:
	testl	%eax, %eax
	jne	.L19273
.L2894:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L2920
	testb	$16, 3(%rax)
	je	.L2920
	cmpw	$36, (%rax)
	je	.L2920
.L2921:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L2922
	testb	$16, 3(%rax)
	je	.L2922
	cmpw	$36, (%rax)
	je	.L2922
	movq	%rax, %rbx
	jmp	.L2921
.L2922:
	cmpq	%rbx, 1696(%rsp)
	je	.L2890
	movq	%rbx, %r13
.L2920:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L2927
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L2931
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2932
	movl	$14, %r11d
.L2931:
	testl	%ebx, %ebx
	je	.L2937
	cmpl	%r11d, %r14d
	jge	.L2890
.L2927:
	testl	%ebx, %ebx
	je	.L2937
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2937
.L2955:
	cmpq	%r13, 8(%rdi)
	je	.L19274
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L2955
.L2937:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$0, 2(%rax)
	je	.L2890
	testl	%r14d, %r14d
	jne	.L2957
	movslq	8(%r13),%r9
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r9,%r9,2), %rdi
	leaq	(%r12,%r12,2), %r11
	salq	$4, %rdi
	salq	$4, %r11
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r11,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17045:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L2890:
	movq	560(%rsp), %rax
	movq	568(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 560(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 568(%rsp)
	jne	.L2962
	jmp	.L15915
.L2957:
	cmpl	$14, %r14d
	je	.L16744
	cmpl	$15, %r14d
.L17600:
	jne	.L2890
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r11
	salq	$4, %r11
	movslq	16(%r11,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17044:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17045
.L16744:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17044
.L19274:
	testq	%r10, %r10
	je	.L2943
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19276
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17043:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L2943:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L2948
	movb	$0, 2(%rdi)
.L2948:
	testq	%r10, %r10
	je	.L2890
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16743
	cmpb	$14, %al
	je	.L16744
	cmpb	$15, %al
	jmp	.L17600
.L16743:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17045
.L19276:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r9
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %r9
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %r9
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r9), %rax
	jmp	.L17043
.L2932:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2934
	movl	$15, %r11d
	jmp	.L2931
.L2934:
	xorl	%ebx, %ebx
	jmp	.L2931
.L19273:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L2894
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L2890
	jmp	.L2894
.L19272:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L2918
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L2918
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L2918
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L2918
	movl	$1, %eax
	jmp	.L2919
.L19271:
	cmpw	$47, %dx
	jne	.L2915
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2915
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2915
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19277
	movq	24(%rbx), %rax
.L2913:
	cmpw	$67, (%rax)
	jne	.L2915
	cmpq	%rsi, %rcx
	jne	.L2915
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L2907
.L19277:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L2907
	jmp	.L2913
.L19270:
	movq	8(%rax), %rbx
	jmp	.L2907
.L19269:
	cmpw	$47, %dx
	je	.L19278
.L2904:
	xorl	%ebp, %ebp
	jmp	.L2896
.L19278:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2904
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2904
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19279
	movq	24(%rbp), %rax
.L2902:
	cmpw	$67, (%rax)
	jne	.L2904
	cmpq	%rsi, %rcx
	jne	.L2904
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L2896
.L19279:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L2896
	jmp	.L2902
.L19268:
	movq	8(%rax), %rbp
	jmp	.L2896
.L2886:
	movq	584(%rsp), %r8
	movq	592(%rsp), %rsi
	movq	8(%r8), %rdi
	call	read_dependence
	testl	%eax, %eax
	je	.L2814
	movq	576(%rsp), %rsi
	movl	$14, %r14d
	movq	8(%rsi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L2814
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L2814
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L2818
	cmpw	$34, %ax
	je	.L2818
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L2820
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19280
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19281
.L2820:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L2831
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19282
	cmpw	$33, (%r13)
	je	.L19283
.L2839:
	xorl	%ebx, %ebx
.L2831:
	testq	%rbp, %rbp
	je	.L2818
	testq	%rbx, %rbx
	je	.L2818
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L19284
.L2842:
	xorl	%eax, %eax
.L2843:
	testl	%eax, %eax
	jne	.L19285
.L2818:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L2844
	testb	$16, 3(%rax)
	je	.L2844
	cmpw	$36, (%rax)
	je	.L2844
.L2845:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L2846
	testb	$16, 3(%rax)
	je	.L2846
	cmpw	$36, (%rax)
	je	.L2846
	movq	%rax, %rbx
	jmp	.L2845
.L2846:
	cmpq	%rbx, 1696(%rsp)
	je	.L2814
	movq	%rbx, %r13
.L2844:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L2851
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L2855
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2856
	movl	$14, %r11d
.L2855:
	testl	%ebx, %ebx
	je	.L2861
	cmpl	%r11d, %r14d
	jge	.L2814
.L2851:
	testl	%ebx, %ebx
	je	.L2861
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2861
.L2879:
	cmpq	%r13, 8(%rdi)
	je	.L19286
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L2879
.L2861:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L2814
	testl	%r14d, %r14d
	jne	.L2881
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r9
	leaq	(%r11,%r11,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r9), %ecx
	movslq	16(%rbp,%r9),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17042:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L2814:
	movq	576(%rsp), %rax
	movq	584(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 576(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 584(%rsp)
	jne	.L2886
	jmp	.L15912
.L2881:
	cmpl	$14, %r14d
	je	.L16742
	cmpl	$15, %r14d
.L17599:
	jne	.L2814
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17041:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17042
.L16742:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17041
.L19286:
	testq	%r10, %r10
	je	.L2867
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19288
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r11,%rbp), %ecx
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17040:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L2867:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L2872
	movb	$14, 2(%rdi)
.L2872:
	testq	%r10, %r10
	je	.L2814
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16741
	cmpb	$14, %al
	je	.L16742
	cmpb	$15, %al
	jmp	.L17599
.L16741:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17042
.L19288:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r9
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	salq	$3, %r9
	addq	anti_dependency_cache(%rip), %r9
	addq	(%r9), %rax
	jmp	.L17040
.L2856:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2858
	movl	$15, %r11d
	jmp	.L2855
.L2858:
	xorl	%ebx, %ebx
	jmp	.L2855
.L19285:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L2818
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L2814
	jmp	.L2818
.L19284:
	movzwl	(%rbx), %edi
	movslq	%edi,%r11
	cmpb	$60, rtx_class(%r11)
	jne	.L2842
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L2842
	movq	8(%rbx), %r10
	cmpq	%r10, 8(%rbp)
	jne	.L2842
	movq	16(%rbx), %rdx
	cmpq	%rdx, 16(%rbp)
	jne	.L2842
	movl	$1, %eax
	jmp	.L2843
.L19283:
	cmpw	$47, %dx
	jne	.L2839
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2839
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2839
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19289
	movq	24(%rbx), %rax
.L2837:
	cmpw	$67, (%rax)
	jne	.L2839
	cmpq	%rsi, %rcx
	jne	.L2839
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L2831
.L19289:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L2831
	jmp	.L2837
.L19282:
	movq	8(%rax), %rbx
	jmp	.L2831
.L19281:
	cmpw	$47, %dx
	je	.L19290
.L2828:
	xorl	%ebp, %ebp
	jmp	.L2820
.L19290:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2828
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2828
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19291
	movq	24(%rbp), %rax
.L2826:
	cmpw	$67, (%rax)
	jne	.L2828
	cmpq	%rsi, %rcx
	jne	.L2828
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L2820
.L19291:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L2820
	jmp	.L2826
.L19280:
	movq	8(%rax), %rbp
	jmp	.L2820
.L19252:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	movl	$1, %edx
	testb	$2, target_flags+3(%rip)
	setne	%cl
	movq	%rax, 592(%rsp)
	movq	8(%rax), %rdi
	movzbl	%cl, %esi
	addl	$4, %esi
	call	cselib_lookup
	movq	592(%rsp), %rdx
	movq	8(%rdx), %rdi
	call	cselib_subst_to_values
	movq	592(%rsp), %r10
	movq	%rax, 8(%r10)
	jmp	.L2806
.L3070:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
.L17049:
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	1696(%rsp), %rdx
	movq	%r15, %rsi
	call	sched_analyze_1
	jmp	.L2515
.L3072:
	movq	1704(%rsp), %rdi
	movq	8(%r15), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	1704(%rsp), %rdi
	movq	16(%r15), %rsi
	jmp	.L17049
.L19244:
	movq	680(%rsp), %rdi
	call	shallow_copy_rtx
	movq	8(%rax), %rdi
	movq	%rax, %rbx
	call	cselib_subst_to_values
	movq	%rax, 8(%rbx)
	jmp	.L2763
.L2756:
	cmpl	$14, %r14d
	je	.L16740
	cmpl	$15, %r14d
.L17598:
	jne	.L2688
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17037:
	movslq	8(%r13),%rbx
	leaq	(%rbx,%rbx,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17038
.L16740:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r9
	leaq	(%r9,%r9,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17037
.L19243:
	testq	%r10, %r10
	je	.L2742
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19293
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17036:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L2742:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L2747
	movb	$14, 2(%rdi)
.L2747:
	testq	%r10, %r10
	je	.L2688
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16739
	cmpb	$14, %al
	je	.L16740
	cmpb	$15, %al
	jmp	.L17598
.L16739:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%r11
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%r11,%r11,2), %rbx
	salq	$4, %rbx
	movslq	16(%rbx,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17038
.L19293:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r11
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17036
.L2731:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2733
	movl	$15, %r11d
	jmp	.L2730
.L2733:
	xorl	%ebx, %ebx
	jmp	.L2730
.L19242:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L2693
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L2688
	jmp	.L2693
.L19241:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L2717
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L2717
	movq	8(%rbx), %r12
	cmpq	%r12, 8(%rbp)
	jne	.L2717
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L2717
	movl	$1, %eax
	jmp	.L2718
.L19240:
	cmpw	$47, %dx
	jne	.L2714
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2714
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2714
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19294
	movq	24(%rbx), %rax
.L2712:
	cmpw	$67, (%rax)
	jne	.L2714
	cmpq	%rsi, %rcx
	jne	.L2714
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L2706
.L19294:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L2706
	jmp	.L2712
.L19239:
	movq	8(%rax), %rbx
	jmp	.L2706
.L19238:
	cmpw	$47, %dx
	je	.L19295
.L2703:
	xorl	%ebp, %ebp
	jmp	.L2695
.L19295:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2703
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2703
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19296
	movq	24(%rbp), %rax
.L2701:
	cmpw	$67, (%rax)
	jne	.L2703
	cmpq	%rsi, %rcx
	jne	.L2703
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L2695
.L19296:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L2695
	jmp	.L2701
.L19237:
	movq	8(%rax), %rbp
	jmp	.L2695
	.p2align 6,,7
.L2685:
	movq	608(%rsp), %r12
	movq	%r15, %rsi
	movq	8(%r12), %rdi
	call	output_dependence
	testl	%eax, %eax
	je	.L2613
	movq	600(%rsp), %rbp
	movl	$15, %r14d
	movq	8(%rbp), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L2613
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L2613
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L2617
	cmpw	$34, %ax
	je	.L2617
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L2619
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19297
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19298
.L2619:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L2630
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19299
	cmpw	$33, (%r13)
	je	.L19300
.L2638:
	xorl	%ebx, %ebx
.L2630:
	testq	%rbp, %rbp
	je	.L2617
	testq	%rbx, %rbx
	je	.L2617
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rsi
	cmpb	$60, rtx_class(%rsi)
	je	.L19301
.L2641:
	xorl	%eax, %eax
.L2642:
	testl	%eax, %eax
	jne	.L19302
.L2617:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L2643
	testb	$16, 3(%rax)
	je	.L2643
	cmpw	$36, (%rax)
	je	.L2643
.L2644:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L2645
	testb	$16, 3(%rax)
	je	.L2645
	cmpw	$36, (%rax)
	je	.L2645
	movq	%rax, %rbx
	jmp	.L2644
.L2645:
	cmpq	%rbx, 1696(%rsp)
	je	.L2613
	movq	%rbx, %r13
.L2643:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L2650
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rcx
	movslq	8(%rax),%r12
	leaq	(%r12,%r12,2), %rdi
	leaq	(%rdx,%rdx,2), %r12
	salq	$4, %rdi
	salq	$4, %r12
	movslq	16(%rdi,%rcx),%rbp
	movl	16(%r12,%rcx), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %r12d
	leaq	0(,%r12,8), %rbp
	movq	%rbp, %rcx
	addq	(%rsi,%rdi), %rcx
	movq	16(%rcx), %rax
	movl	%edx, %ecx
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L2654
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2655
	movl	$14, %r11d
.L2654:
	testl	%ebx, %ebx
	je	.L2660
	cmpl	%r11d, %r14d
	jge	.L2613
.L2650:
	testl	%ebx, %ebx
	je	.L2660
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2660
.L2678:
	cmpq	%r13, 8(%rdi)
	je	.L19303
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L2678
.L2660:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$15, 2(%rax)
	je	.L2613
	testl	%r14d, %r14d
	jne	.L2680
	movslq	8(%r13),%r9
	movslq	8(%rdx),%rcx
	movq	h_i_d(%rip), %r11
	leaq	(%r9,%r9,2), %rdi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rdi
	salq	$4, %rbp
	movl	16(%rdi,%r11), %ecx
	movslq	16(%rbp,%r11),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17035:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L2613:
	movq	600(%rsp), %rax
	movq	608(%rsp), %rdi
	movq	16(%rax), %rdx
	movq	%rdx, 600(%rsp)
	testq	%rdx, %rdx
	movq	16(%rdi), %r14
	movq	%r14, 608(%rsp)
	jne	.L2685
	jmp	.L15905
.L2680:
	cmpl	$14, %r14d
	je	.L16738
	cmpl	$15, %r14d
.L17597:
	jne	.L2613
	movq	1696(%rsp), %rcx
	movslq	8(%rcx),%r12
	movq	h_i_d(%rip), %rcx
	leaq	(%r12,%r12,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17034:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17035
.L16738:
	movq	1696(%rsp), %r9
	movq	h_i_d(%rip), %rcx
	movslq	8(%r9),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17034
.L19303:
	testq	%r10, %r10
	je	.L2666
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19305
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rsi
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %rbp
	movslq	8(%rsi),%r12
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	leaq	(%r12,%r12,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%rbp),%rbx
	movl	16(%r9,%rbp), %ecx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17033:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L2666:
	movzbl	2(%rdi), %ebx
	cmpl	%ebx, %r14d
	jge	.L2671
	movb	$15, 2(%rdi)
.L2671:
	testq	%r10, %r10
	je	.L2613
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16737
	cmpb	$14, %al
	je	.L16738
	cmpb	$15, %al
	jmp	.L17597
.L16737:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rbx,%rbx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%r12
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r12,8), %rax
	jmp	.L17035
.L19305:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdx
	movslq	8(%rax),%rsi
	leaq	(%rcx,%rcx,2), %rbp
	salq	$4, %rbp
	movl	16(%rbp,%rdx), %ecx
	leaq	(%rsi,%rsi,2), %r12
	salq	$4, %r12
	movslq	16(%r12,%rdx),%r11
	movl	%ecx, %r9d
	shrl	$6, %r9d
	mov	%r9d, %eax
	salq	$3, %rax
	salq	$3, %r11
	addq	anti_dependency_cache(%rip), %r11
	addq	(%r11), %rax
	jmp	.L17033
.L2655:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2657
	movl	$15, %r11d
	jmp	.L2654
.L2657:
	xorl	%ebx, %ebx
	jmp	.L2654
.L19302:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L2617
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L2613
	jmp	.L2617
.L19301:
	movzwl	(%rbx), %edi
	movslq	%edi,%r8
	cmpb	$60, rtx_class(%r8)
	jne	.L2641
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L2641
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L2641
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L2641
	movl	$1, %eax
	jmp	.L2642
.L19300:
	cmpw	$47, %dx
	jne	.L2638
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2638
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2638
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19306
	movq	24(%rbx), %rax
.L2636:
	cmpw	$67, (%rax)
	jne	.L2638
	cmpq	%rsi, %rcx
	jne	.L2638
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L2630
.L19306:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L2630
	jmp	.L2636
.L19299:
	movq	8(%rax), %rbx
	jmp	.L2630
.L19298:
	cmpw	$47, %dx
	je	.L19307
.L2627:
	xorl	%ebp, %ebp
	jmp	.L2619
.L19307:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2627
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2627
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19308
	movq	24(%rbp), %rax
.L2625:
	cmpw	$67, (%rax)
	jne	.L2627
	cmpq	%rsi, %rcx
	jne	.L2627
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L2619
.L19308:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L2619
	jmp	.L2625
.L19297:
	movq	8(%rax), %rbp
	jmp	.L2619
	.p2align 6,,7
.L2609:
	movq	624(%rsp), %r8
	movq	%r15, %rsi
	movq	8(%r8), %rdi
	call	anti_dependence
	testl	%eax, %eax
	je	.L2537
	movq	616(%rsp), %rsi
	movl	$14, %r14d
	movq	8(%rsi), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L2537
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L2537
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L2541
	cmpw	$34, %ax
	je	.L2541
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L2543
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19309
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19310
.L2543:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L2554
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19311
	cmpw	$33, (%r13)
	je	.L19312
.L2562:
	xorl	%ebx, %ebx
.L2554:
	testq	%rbp, %rbp
	je	.L2541
	testq	%rbx, %rbx
	je	.L2541
	movzwl	(%rbp), %r12d
	movslq	%r12d,%rdi
	cmpb	$60, rtx_class(%rdi)
	je	.L19313
.L2565:
	xorl	%eax, %eax
.L2566:
	testl	%eax, %eax
	jne	.L19314
.L2541:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L2567
	testb	$16, 3(%rax)
	je	.L2567
	cmpw	$36, (%rax)
	je	.L2567
.L2568:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L2569
	testb	$16, 3(%rax)
	je	.L2569
	cmpw	$36, (%rax)
	je	.L2569
	movq	%rax, %rbx
	jmp	.L2568
.L2569:
	cmpq	%rbx, 1696(%rsp)
	je	.L2537
	movq	%rbx, %r13
.L2567:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L2574
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L2578
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2579
	movl	$14, %r11d
.L2578:
	testl	%ebx, %ebx
	je	.L2584
	cmpl	%r11d, %r14d
	jge	.L2537
.L2574:
	testl	%ebx, %ebx
	je	.L2584
	movq	1696(%rsp), %rbx
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L2584
.L2602:
	cmpq	%r13, 8(%rdi)
	je	.L19315
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L2602
.L2584:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L2537
	testl	%r14d, %r14d
	jne	.L2604
	movslq	8(%r13),%r11
	movslq	8(%rdx),%r12
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %rdi
	leaq	(%r12,%r12,2), %r9
	salq	$4, %rdi
	salq	$4, %r9
	movl	16(%rdi,%rbx), %ecx
	movslq	16(%r9,%rbx),%r14
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%r14,8), %rax
.L17032:
	andl	$63, %ecx
	movl	$1, %r14d
	salq	%cl, %r14
	orq	%r14, 16(%rax)
.L2537:
	movq	616(%rsp), %rax
	movq	624(%rsp), %r10
	movq	16(%rax), %rdx
	movq	%rdx, 616(%rsp)
	testq	%rdx, %rdx
	movq	16(%r10), %rdi
	movq	%rdi, 624(%rsp)
	jne	.L2609
	jmp	.L15902
.L2604:
	cmpl	$14, %r14d
	je	.L16736
	cmpl	$15, %r14d
.L17596:
	jne	.L2537
	movq	1696(%rsp), %rbp
	movq	h_i_d(%rip), %rcx
	movslq	8(%rbp),%r12
	leaq	(%r12,%r12,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17031:
	movslq	8(%r13),%r8
	leaq	(%r8,%r8,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17032
.L16736:
	movq	1696(%rsp), %r11
	movq	h_i_d(%rip), %rcx
	movslq	8(%r11),%rbx
	leaq	(%rbx,%rbx,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17031
.L19315:
	testq	%r10, %r10
	je	.L2590
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19317
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r9
	salq	$4, %r9
	movl	16(%r9,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%rbx
	movl	%ecx, %r11d
	shrl	$6, %r11d
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%r8,%rbx,8), %rax
.L17030:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L2590:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L2595
	movb	$14, 2(%rdi)
.L2595:
	testq	%r10, %r10
	je	.L2537
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16735
	cmpb	$14, %al
	je	.L16736
	cmpb	$15, %al
	jmp	.L17596
.L16735:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %r8
	movslq	8(%rax),%rdi
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%r8), %ecx
	leaq	(%rdi,%rdi,2), %r14
	salq	$4, %r14
	movslq	16(%r14,%r8),%rbp
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%rbp,8), %rax
	jmp	.L17032
.L19317:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%r11
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r9d
	salq	$3, %r11
	shrl	$6, %r9d
	addq	anti_dependency_cache(%rip), %r11
	mov	%r9d, %eax
	salq	$3, %rax
	addq	(%r11), %rax
	jmp	.L17030
.L2579:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2581
	movl	$15, %r11d
	jmp	.L2578
.L2581:
	xorl	%ebx, %ebx
	jmp	.L2578
.L19314:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L2541
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L2537
	jmp	.L2541
.L19313:
	movzwl	(%rbx), %edi
	movslq	%edi,%r9
	cmpb	$60, rtx_class(%r9)
	jne	.L2565
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L2565
	movq	8(%rbx), %rdx
	cmpq	%rdx, 8(%rbp)
	jne	.L2565
	movq	16(%rbx), %rcx
	cmpq	%rcx, 16(%rbp)
	jne	.L2565
	movl	$1, %eax
	jmp	.L2566
.L19312:
	cmpw	$47, %dx
	jne	.L2562
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2562
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2562
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19318
	movq	24(%rbx), %rax
.L2560:
	cmpw	$67, (%rax)
	jne	.L2562
	cmpq	%rsi, %rcx
	jne	.L2562
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L2554
.L19318:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L2554
	jmp	.L2560
.L19311:
	movq	8(%rax), %rbx
	jmp	.L2554
.L19310:
	cmpw	$47, %dx
	je	.L19319
.L2551:
	xorl	%ebp, %ebp
	jmp	.L2543
.L19319:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2551
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2551
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19320
	movq	24(%rbp), %rax
.L2549:
	cmpw	$67, (%rax)
	jne	.L2551
	cmpq	%rsi, %rcx
	jne	.L2551
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L2543
.L19320:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L2543
	jmp	.L2549
.L19309:
	movq	8(%rax), %rbp
	jmp	.L2543
.L19236:
	movq	1696(%rsp), %rdi
	movq	%rcx, %rsi
	movl	$14, %edx
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$8, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r10
	movq	1696(%rsp), %rdi
	movl	$15, %edx
	movq	%r10, %rsi
	movl	$0, 32(%r10)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r15
	movq	%rax, 40(%r15)
	movl	$1, 36(%r15)
	jmp	.L2533
.L19235:
	movq	%r15, %rdi
	call	shallow_copy_rtx
	testb	$2, target_flags+3(%rip)
	setne	%dl
	movq	8(%rax), %rdi
	movq	%rax, %r15
	movzbl	%dl, %esi
	movl	$1, %edx
	addl	$4, %esi
	call	cselib_lookup
	movq	8(%r15), %rdi
	call	cselib_subst_to_values
	movq	%rax, 8(%r15)
	jmp	.L2517
	.p2align 6,,7
.L19187:
	movq	680(%rsp), %r14
	movl	8(%r14), %ebp
	cmpl	$52, %ebp
	jg	.L2077
	leal	-8(%rbp), %r12d
	cmpl	$7, %r12d
	jbe	.L2080
	leal	-21(%rbp), %ecx
	cmpl	$7, %ecx
	jbe	.L2080
	leal	-45(%rbp), %edx
	cmpl	$7, %edx
	jbe	.L2080
	leal	-29(%rbp), %r8d
	cmpl	$7, %r8d
	ja	.L2078
.L2080:
	movq	680(%rsp), %rsi
	movzbq	2(%rsi), %r10
	movl	mode_class(,%r10,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17015:
	addl	$2, %eax
.L2079:
	cmpl	$47, 1684(%rsp)
	je	.L19321
	movl	%eax, %ebx
	decl	%ebx
	js	.L2515
.L2106:
	movq	reg_pending_clobbers(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L2106
	jmp	.L2515
.L19321:
	movl	%eax, %ebx
	decl	%ebx
	js	.L2515
.L2101:
	movq	reg_pending_sets(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L2101
	jmp	.L2515
.L2078:
	movq	680(%rsp), %rdi
	movzbl	2(%rdi), %eax
	cmpb	$18, %al
	je	.L19322
	cmpb	$24, %al
	je	.L19323
	movl	target_flags(%rip), %r11d
	testl	$33554432, %r11d
	movl	%r11d, %ecx
	je	.L2091
	movzbl	%al, %ebx 
	movzbl	mode_size(%rbx), %r15d
	leal	7(%r15), %edx
.L2092:
	andl	$33554432, %ecx
	je	.L2093
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L2079
.L2093:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L2079
.L2091:
	movzbl	%al, %r14d 
	movzbl	mode_size(%r14), %r13d
	leal	3(%r13), %edx
	jmp	.L2092
.L19323:
	xorl	%r9d, %r9d
	testb	$2, target_flags+3(%rip)
	sete	%r9b
	leal	4(%r9,%r9), %eax
	jmp	.L2079
.L19322:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17015
	.p2align 6,,7
.L2077:
	movq	1704(%rsp), %r12
	cmpl	68(%r12), %ebp
	jl	.L2108
	movq	1696(%rsp), %rax
	movq	32(%rax), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L2515
	jmp	.L17570
.L2108:
	cmpl	$47, 1684(%rsp)
	je	.L19324
	movq	reg_pending_clobbers(%rip), %rdi
.L17016:
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %eax
	testl	%eax, %eax
	jne	.L16405
	movslq	%ebp,%rbp
	movq	%rbp, %rcx
	movq	%rbp, 16(%rsp)
	addq	reg_known_equiv_p(%rip), %rcx
	cmpb	$0, (%rcx)
	je	.L16420
	movq	%rbp, %rdx
	salq	$3, %rdx
	addq	reg_known_value(%rip), %rdx
	movq	(%rdx), %rax
	cmpw	$66, (%rax)
	je	.L19325
.L16420:
	movq	reg_n_info(%rip), %rdx
.L2113:
	movq	16(%rsp), %r14
	movq	32(%rdx,%r14,8), %r11
	movl	32(%r11), %ebx
	testl	%ebx, %ebx
	jne	.L2515
	movq	1704(%rsp), %r12
	movq	48(%r12), %r15
	testq	%r15, %r15
	je	.L2515
	movl	$14, %r14d
.L2513:
	movq	8(%r15), %r13
	cmpq	%r13, 1696(%rsp)
	je	.L2440
	movzwl	(%r13), %eax
	cmpw	$37, %ax
	je	.L2440
	movq	1696(%rsp), %rdx
	movzwl	(%rdx), %ecx
	cmpw	$34, %cx
	je	.L2445
	cmpw	$34, %ax
	je	.L2445
	movq	32(%rdx), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	je	.L2447
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19326
	xorl	%ebp, %ebp
	cmpw	$33, %cx
	je	.L19327
.L2447:
	movq	32(%r13), %rax
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.L2458
	movzwl	(%rax), %edx
	cmpw	$38, %dx
	je	.L19328
	cmpw	$33, (%r13)
	je	.L19329
.L2466:
	xorl	%ebx, %ebx
.L2458:
	testq	%rbp, %rbp
	je	.L2445
	testq	%rbx, %rbx
	je	.L2445
	movzwl	(%rbp), %r12d
	movslq	%r12d,%r8
	cmpb	$60, rtx_class(%r8)
	je	.L19330
.L2469:
	xorl	%eax, %eax
.L2470:
	testl	%eax, %eax
	jne	.L19331
.L2445:
	movq	%r13, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L2471
	testb	$16, 3(%rax)
	je	.L2471
	cmpw	$36, (%rax)
	je	.L2471
.L2472:
	movq	%rbx, %rdi
	call	next_nonnote_insn
	testq	%rax, %rax
	je	.L2473
	testb	$16, 3(%rax)
	je	.L2473
	cmpw	$36, (%rax)
	je	.L2473
	movq	%rax, %rbx
	jmp	.L2472
.L2473:
	cmpq	%rbx, 1696(%rsp)
	je	.L2440
	movq	%rbx, %r13
.L2471:
	movq	true_dependency_cache(%rip), %rsi
	movl	$1, %ebx
	testq	%rsi, %rsi
	movq	%rsi, %r10
	je	.L2478
	movq	anti_dependency_cache(%rip), %r8
	xorl	%r11d, %r11d
	testq	%r8, %r8
	je	.L13041
	movq	output_dependency_cache(%rip), %r9
	testq	%r9, %r9
	je	.L13041
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rcx
	leaq	(%rcx,%rcx,2), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	movslq	16(%rdi,%r12),%rbp
	movl	16(%rcx,%r12), %edx
	leaq	0(,%rbp,8), %rdi
	movl	%edx, %ebp
	andl	$63, %edx
	shrl	$6, %ebp
	mov	%ebp, %ecx
	leaq	0(,%rcx,8), %rbp
	movl	%edx, %ecx
	movq	%rbp, %r12
	addq	(%rsi,%rdi), %r12
	movq	16(%r12), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	jne	.L2482
	movq	%rbp, %rsi
	addq	(%r8,%rdi), %rsi
	movq	16(%rsi), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2483
	movl	$14, %r11d
.L2482:
	testl	%ebx, %ebx
	je	.L2488
	cmpl	%r11d, %r14d
	jge	.L2440
.L2478:
	testl	%ebx, %ebx
	je	.L2488
	movq	1696(%rsp), %r9
	movq	48(%r9), %rdi
	testq	%rdi, %rdi
	je	.L2488
.L2506:
	cmpq	%r13, 8(%rdi)
	je	.L19332
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L2506
.L2488:
	movq	1696(%rsp), %r10
	movq	%r13, %rdi
	movq	48(%r10), %rsi
	call	alloc_INSN_LIST
	movq	true_dependency_cache(%rip), %r8
	movq	1696(%rsp), %rdx
	testq	%r8, %r8
	movq	%rax, 48(%rdx)
	movb	$14, 2(%rax)
	je	.L2440
	testl	%r14d, %r14d
	jne	.L2508
	movslq	8(%r13),%r11
	movslq	8(%rdx),%rbp
	movq	h_i_d(%rip), %rbx
	leaq	(%r11,%r11,2), %r9
	leaq	(%rbp,%rbp,2), %r12
	salq	$4, %r9
	salq	$4, %r12
	movl	16(%r9,%rbx), %ecx
	movslq	16(%r12,%rbx),%rdi
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%r8,%rdi,8), %rax
.L17029:
	andl	$63, %ecx
	movl	$1, %ebx
	salq	%cl, %rbx
	orq	%rbx, 16(%rax)
.L2440:
	movq	16(%r15), %r15
	testq	%r15, %r15
	jne	.L2513
	jmp	.L2515
.L2508:
	cmpl	$14, %r14d
	je	.L16734
	cmpl	$15, %r14d
.L17595:
	jne	.L2440
	movq	1696(%rsp), %rsi
	movq	h_i_d(%rip), %rcx
	movslq	8(%rsi),%r8
	leaq	(%r8,%r8,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%rcx),%rdx
	salq	$3, %rdx
	addq	output_dependency_cache(%rip), %rdx
.L17028:
	movslq	8(%r13),%r9
	leaq	(%r9,%r9,2), %rdi
	salq	$4, %rdi
	movl	16(%rdi,%rcx), %ecx
	movl	%ecx, %r13d
	shrl	$6, %r13d
	mov	%r13d, %eax
	salq	$3, %rax
	addq	(%rdx), %rax
	jmp	.L17029
.L16734:
	movq	1696(%rsp), %r12
	movq	h_i_d(%rip), %rcx
	movslq	8(%r12),%r11
	leaq	(%r11,%r11,2), %r10
	salq	$4, %r10
	movslq	16(%r10,%rcx),%rdx
	salq	$3, %rdx
	addq	anti_dependency_cache(%rip), %rdx
	jmp	.L17028
.L19332:
	testq	%r10, %r10
	je	.L2494
	movzbl	2(%rdi), %eax
	cmpb	$14, %al
	je	.L19334
	cmpb	$15, %al
	jne	.L13058
	movq	output_dependency_cache(%rip), %r8
	testq	%r8, %r8
	je	.L13058
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rdx
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rdx,%rdx,2), %r11
	salq	$4, %r11
	movl	16(%r11,%r12), %ecx
	leaq	(%rsi,%rsi,2), %rbp
	salq	$4, %rbp
	movslq	16(%rbp,%r12),%r9
	movl	%ecx, %ebx
	shrl	$6, %ebx
	mov	%ebx, %eax
	salq	$3, %rax
	addq	(%r8,%r9,8), %rax
.L17027:
	andl	$63, %ecx
	movq	$-2, %r8
	rolq	%cl, %r8
	andq	%r8, 16(%rax)
.L2494:
	movzbl	2(%rdi), %ecx
	cmpl	%ecx, %r14d
	jge	.L2499
	movb	$14, 2(%rdi)
.L2499:
	testq	%r10, %r10
	je	.L2440
	movzbl	2(%rdi), %eax
	testb	%al, %al
	je	.L16733
	cmpb	$14, %al
	je	.L16734
	cmpb	$15, %al
	jmp	.L17595
.L16733:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rcx
	movq	h_i_d(%rip), %rdi
	movslq	8(%rax),%rbx
	leaq	(%rcx,%rcx,2), %rsi
	salq	$4, %rsi
	movl	16(%rsi,%rdi), %ecx
	leaq	(%rbx,%rbx,2), %r9
	salq	$4, %r9
	movslq	16(%r9,%rdi),%r8
	movl	%ecx, %edx
	shrl	$6, %edx
	mov	%edx, %eax
	salq	$3, %rax
	addq	(%r10,%r8,8), %rax
	jmp	.L17029
.L19334:
	movq	1696(%rsp), %rax
	movslq	8(%r13),%rbp
	movq	h_i_d(%rip), %r12
	movslq	8(%rax),%rsi
	leaq	(%rbp,%rbp,2), %rdx
	salq	$4, %rdx
	leaq	(%rsi,%rsi,2), %rcx
	salq	$4, %rcx
	movslq	16(%rcx,%r12),%rbx
	movl	16(%rdx,%r12), %ecx
	movl	%ecx, %r11d
	salq	$3, %rbx
	shrl	$6, %r11d
	addq	anti_dependency_cache(%rip), %rbx
	mov	%r11d, %eax
	salq	$3, %rax
	addq	(%rbx), %rax
	jmp	.L17027
.L2483:
	movq	%rbp, %r8
	movl	%edx, %ecx
	addq	(%r9,%rdi), %r8
	movq	16(%r8), %rax
	shrq	%cl, %rax
	testl	$1, %eax 
	je	.L2485
	movl	$15, %r11d
	jmp	.L2482
.L2485:
	xorl	%ebx, %ebx
	jmp	.L2482
.L19331:
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	modified_in_p
	testl	%eax, %eax
	jne	.L2445
	movq	1696(%rsp), %rsi
	movq	%rbx, %rdi
	call	modified_in_p
	testl	%eax, %eax
	je	.L2440
	jmp	.L2445
.L19330:
	movzwl	(%rbx), %edi
	movslq	%edi,%rcx
	cmpb	$60, rtx_class(%rcx)
	jne	.L2469
	call	reverse_condition
	cmpl	%eax, %r12d
	jne	.L2469
	movq	8(%rbx), %rax
	cmpq	%rax, 8(%rbp)
	jne	.L2469
	movq	16(%rbx), %rdi
	cmpq	%rdi, 16(%rbp)
	jne	.L2469
	movl	$1, %eax
	jmp	.L2470
.L19329:
	cmpw	$47, %dx
	jne	.L2466
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2466
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2466
	movq	8(%rax), %rbx
	movq	16(%rbx), %rcx
	cmpw	$67, (%rcx)
	je	.L19335
	movq	24(%rbx), %rax
.L2464:
	cmpw	$67, (%rax)
	jne	.L2466
	cmpq	%rsi, %rcx
	jne	.L2466
	movzwl	(%rbx), %edi
	call	reverse_condition
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movzbl	2(%rbx), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbx
	jmp	.L2458
.L19335:
	movq	24(%rbx), %rax
	cmpq	%rdx, %rax
	je	.L2458
	jmp	.L2464
.L19328:
	movq	8(%rax), %rbx
	jmp	.L2458
.L19327:
	cmpw	$47, %dx
	je	.L19336
.L2455:
	xorl	%ebp, %ebp
	jmp	.L2447
.L19336:
	movq	global_rtl(%rip), %rdx
	cmpq	%rdx, 16(%rax)
	movq	%rdx, %rsi
	jne	.L2455
	movq	8(%rax), %rax
	cmpw	$72, (%rax)
	jne	.L2455
	movq	8(%rax), %rbp
	movq	16(%rbp), %rcx
	cmpw	$67, (%rcx)
	je	.L19337
	movq	24(%rbp), %rax
.L2453:
	cmpw	$67, (%rax)
	jne	.L2455
	cmpq	%rsi, %rcx
	jne	.L2455
	movzwl	(%rbp), %edi
	call	reverse_condition
	movq	16(%rbp), %rcx
	movq	8(%rbp), %rdx
	movzbl	2(%rbp), %esi
	movl	%eax, %edi
	call	gen_rtx_fmt_ee
	movq	%rax, %rbp
	jmp	.L2447
.L19337:
	movq	24(%rbp), %rax
	cmpq	%rdx, %rax
	je	.L2447
	jmp	.L2453
.L19326:
	movq	8(%rax), %rbp
	jmp	.L2447
.L19325:
	movq	8(%rax), %r15
	testq	%r15, %r15
	je	.L16420
	movzwl	(%r15), %ebx
	leal	-40(%rbx), %eax
	cmpl	$61, %eax
	ja	.L2116
	mov	%eax, %r8d
	jmp	*.L2423(,%r8,8)
	.section	.rodata
	.align 8
	.align 4
.L2423:
	.quad	.L2407
	.quad	.L2407
	.quad	.L2116
	.quad	.L2407
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2394
	.quad	.L2116
	.quad	.L16420
	.quad	.L16420
	.quad	.L16420
	.quad	.L2116
	.quad	.L16420
	.quad	.L2116
	.quad	.L2116
	.quad	.L2123
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2154
	.quad	.L16420
	.quad	.L16420
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2116
	.quad	.L2419
	.quad	.L2419
	.quad	.L2419
	.quad	.L2419
	.quad	.L2421
	.quad	.L2421
	.text
.L2123:
	movl	8(%r15), %ebp
	cmpl	$52, %ebp
	jg	.L2124
	leal	-8(%rbp), %r10d
	cmpl	$7, %r10d
	jbe	.L2127
	leal	-21(%rbp), %esi
	cmpl	$7, %esi
	jbe	.L2127
	leal	-45(%rbp), %edi
	cmpl	$7, %edi
	jbe	.L2127
	leal	-29(%rbp), %r9d
	cmpl	$7, %r9d
	ja	.L2125
.L2127:
	movzbq	2(%r15), %r11
	movl	mode_class(,%r11,4), %eax
	subl	$5, %eax
	cmpl	$2, %eax
	sbbl	%eax, %eax
	notl	%eax
.L17017:
	addl	$2, %eax
.L2126:
	movl	%eax, %ebx
	decl	%ebx
	js	.L16420
.L2147:
	movq	reg_pending_uses(%rip), %rdi
	leal	(%rbx,%rbp), %esi
	call	bitmap_set_bit
	decl	%ebx
	jns	.L2147
	jmp	.L16420
.L2125:
	movzbl	2(%r15), %eax
	cmpb	$18, %al
	je	.L19338
	cmpb	$24, %al
	je	.L19339
	movl	target_flags(%rip), %ebx
	testl	$33554432, %ebx
	movl	%ebx, %ecx
	je	.L2138
	movzbl	%al, %r14d 
	movzbl	mode_size(%r14), %r13d
	leal	7(%r13), %edx
.L2139:
	andl	$33554432, %ecx
	je	.L2140
	cmpl	$-1, %edx
	leal	7(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$3, %eax
	jmp	.L2126
.L2140:
	cmpl	$-1, %edx
	leal	3(%rdx), %eax
	cmovg	%edx, %eax
	sarl	$2, %eax
	jmp	.L2126
.L2138:
	movzbl	%al, %edx 
	movzbl	mode_size(%rdx), %r12d
	leal	3(%r12), %edx
	jmp	.L2139
.L19339:
	xorl	%r15d, %r15d
	testb	$2, target_flags+3(%rip)
	sete	%r15b
	leal	4(%r15,%r15), %eax
	jmp	.L2126
.L19338:
	xorl	%eax, %eax
	testb	$2, target_flags+3(%rip)
	sete	%al
	jmp	.L17017
.L2124:
	movq	1704(%rsp), %rax
	cmpl	68(%rax), %ebp
	jl	.L2149
	movq	1696(%rsp), %rcx
	movq	32(%rcx), %rbp
	movl	(%rbp), %eax
	subl	$48, %eax
	cmpw	$1, %ax
	jbe	.L16420
	jmp	.L17569
.L2149:
	movq	reg_pending_uses(%rip), %rdi
	movl	%ebp, %esi
	call	bitmap_set_bit
	movl	reload_completed(%rip), %r8d
	testl	%r8d, %r8d
	jne	.L16412
	movq	reg_known_equiv_p(%rip), %r10
	movslq	%ebp,%rbx
	addq	%rbx, %r10
	cmpb	$0, (%r10)
	je	.L2152
	leaq	0(,%rbx,8), %rsi
	addq	reg_known_value(%rip), %rsi
	movq	(%rsi), %rax
	cmpw	$66, (%rax)
	je	.L19340
.L2152:
	movq	reg_n_info(%rip), %rdx
	movq	32(%rdx,%rbx,8), %r9
	movl	32(%r9), %edi
	testl	%edi, %edi
	jne	.L2113
	movq	1704(%rsp), %r15
	movq	1696(%rsp), %rdi
	movq	56(%r15), %rsi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r11
	movq	%rax, 56(%r11)
	jmp	.L16420
.L19340:
	movq	1704(%rsp), %rdi
	movq	8(%rax), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L2152
.L16412:
	movslq	%ebp,%rbx
	jmp	.L2152
.L2407:
	cmpl	$41, %ebx
	je	.L19341
.L2409:
	movb	$1, reg_pending_barrier(%rip)
.L2408:
	cmpl	$41, %ebx
	je	.L19342
.L2116:
	movslq	%ebx,%rbp
	movzbl	rtx_length(%rbp), %edi
	movq	rtx_format(,%rbp,8), %r13
	movl	%edi, %ebp
	decl	%ebp
	js	.L16420
	leaq	8(%r15), %r14
.L2436:
	movslq	%ebp,%rax
	movzbl	(%rax,%r13), %edx
	cmpb	$101, %dl
	je	.L19343
	cmpb	$69, %dl
	je	.L19344
.L2426:
	decl	%ebp
	jns	.L2436
	jmp	.L16420
.L19344:
	leaq	8(%r15,%rax,8), %rdx
	xorl	%ebx, %ebx
	movq	(%rdx), %rsi
	cmpl	(%rsi), %ebx
	jge	.L2426
	movq	%rdx, %r12
.L2435:
	movq	(%r12), %r10
	movslq	%ebx,%r9
	movq	1696(%rsp), %rdx
	movq	1704(%rsp), %rdi
	incl	%ebx
	addq	$8, %r10
	movq	(%r10,%r9,8), %rsi
	call	sched_analyze_2
	movq	(%r12), %rdx
	cmpl	(%rdx), %ebx
	jl	.L2435
	jmp	.L2426
.L19343:
	movq	1704(%rsp), %rdi
	movq	(%r14,%rax,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	jmp	.L2426
.L19342:
	movq	32(%r15), %rdx
	xorl	%ebx, %ebx
	cmpl	(%rdx), %ebx
	jge	.L16420
.L2415:
	movslq	%ebx,%r13
	movq	1704(%rsp), %rdi
	incl	%ebx
	movq	8(%rdx,%r13,8), %rsi
	movq	1696(%rsp), %rdx
	call	sched_analyze_2
	movq	32(%r15), %rcx
	cmpl	(%rcx), %ebx
	movq	%rcx, %rdx
	jl	.L2415
	jmp	.L16420
.L19341:
	testb	$8, 3(%r15)
	je	.L2408
	jmp	.L2409
.L2394:
	movq	1704(%rsp), %rsi
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	addq	$16, %rsi
	call	add_dependence_list_and_free
	movq	1704(%rsp), %rdi
	addq	$24, %rdi
	call	free_EXPR_LIST_list
	movq	1704(%rsp), %r8
	movq	1696(%rsp), %rdi
	movl	$14, %edx
	movq	%r8, %rsi
	movl	$0, 32(%r8)
	addq	$40, %rsi
	call	add_dependence_list_and_free
	movq	1696(%rsp), %rdi
	xorl	%esi, %esi
	call	alloc_INSN_LIST
	movq	1704(%rsp), %r12
	movq	%rax, 40(%r12)
	movl	$1, 36(%r12)
	jmp	.L2116
.L2154:
	movq	current_sched_info(%rip), %rbx
	movq	%r15, 672(%rsp)
	testb	$2, 96(%rbx)
	jne	.L19345
.L2155:
	movq	1704(%rsp), %rax
	movq	1704(%rsp), %r8
	movq	(%rax), %rdx
	movq	8(%r8), %rbp
	testq	%rdx, %rdx
	movq	%rdx, 656(%rsp)
	movq	%rbp, 664(%rsp)
	jne	.L2235
.L15888:
	movq	1704(%rsp), %rcx
	movq	1704(%rsp), %r11
	movq	16(%rcx), %rbx
	movq	24(%r11), %r9
	testq	%rbx, %rbx
	movq	%rbx, 640(%rsp)
	movq	%r9, 648(%rsp)
	jne	.L2311
.L15891:
	movq	1704(%rsp), %r9
	movq	40(%r9), %r10
	testq	%r10, %r10
	movq	%r10, 632(%rsp)
	je	.L15894
.L2391:
	movq	632(%rsp), %r11
	movq	8(%r11), %r14
	cmpw	$33, (%r14)
	je	.L19346
.L2317:
	cmpq	%r14, 1696(%rsp)
	movq	%r14, %r13
.L2325: