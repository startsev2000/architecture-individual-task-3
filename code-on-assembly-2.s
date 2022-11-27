	.file	"8.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
.LC4:
	.string	"%d"
.LC5:
	.string	"incorrect input"
.LC6:
	.string	"r"
.LC7:
	.string	"w"
.LC8:
	.string	"incorrect file"
	.align 8
.LC9:
	.string	"incorrect input\n N must be 1 - 9\n"
	.align 8
.LC12:
	.string	"\320\242\320\276\321\207\320\275\320\276\321\201\321\214 \320\262\321\213\321\207\320\270\321\201\320\273\320\265\320\275\321\217 (\320\276\321\202 1 \320\264\320\276 9): %d\n"
.LC13:
	.string	"\320\240\320\265\320\267\321\203\320\273\321\214\321\202\320\260\321\202: "
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	DWORD PTR -36[rbp], edi		#argc
	mov	QWORD PTR -48[rbp], rsi		#argv
	cmp	DWORD PTR -36[rbp], 3		#check correct input
	je	.L10
	lea	rdi, .LC5[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L16
.L10:
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax		
	mov	rax, QWORD PTR -48[rbp]		#FILE input
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax		#FILE out
	cmp	QWORD PTR -8[rbp], 0
	je	.L12
	cmp	QWORD PTR -16[rbp], 0
	jne	.L13
.L12:
	lea	rdi, .LC8[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L16
.L13:
	lea	rdx, -28[rbp]			#input
	mov	rax, QWORD PTR -8[rbp]		# %d
	lea	rsi, .LC4[rip]			# N
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -28[rbp]		#N
	test	eax, eax
	jle	.L14
	mov	eax, DWORD PTR -28[rbp]
	cmp	eax, 9
	jle	.L15
.L14:
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	mov	edx, 33
	mov	esi, 1
	lea	rdi, .LC9[rip]
	call	fwrite@PLT
	mov	eax, 0
	jmp	.L16
.L15:
	mov	eax, DWORD PTR -28[rbp]
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR .LC3[rip]
	movapd	xmm1, xmm0
	mov	QWORD PTR -56[rbp], rax
	movsd	xmm0, QWORD PTR -56[rbp]
	call	pow@PLT
	movsd	QWORD PTR -56[rbp], xmm0
	fld	QWORD PTR -56[rbp]
	mov	rax, QWORD PTR .LC10[rip]
	lea	rsp, -16[rsp]
	fstp	TBYTE PTR [rsp]
	mov	QWORD PTR -56[rbp], rax
	movsd	xmm0, QWORD PTR -56[rbp]
	call	Riman
	add	rsp, 16
	movq	rax, xmm0			#root from Riman
	mov	QWORD PTR -24[rbp], rax
	movsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR .LC11[rip]
	mulsd	xmm0, xmm1			#root * 6
	call	sqrt@PLT
	movq	rax, xmm0			#final root
	mov	QWORD PTR -24[rbp], rax		
	mov	edx, DWORD PTR -28[rbp]		#N
	mov	rax, QWORD PTR -16[rbp]		#string
	lea	rsi, .LC12[rip]			#out
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	mov	edx, 20
	mov	esi, 1
	lea	rdi, .LC13[rip]			#string
	call	fwrite@PLT
	mov	ecx, DWORD PTR -28[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, ecx
	mov	QWORD PTR -56[rbp], rdx		#out
	movsd	xmm0, QWORD PTR -56[rbp]	#root
	mov	rdi, rax			#N
	call	print
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
.L16:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 16
.LC1:
	.long	0
	.long	3221225472
	.long	16384
	.long	0
	.align 8
.LC3:
	.long	0
	.long	1076101120
	.align 8
.LC10:
	.long	0
	.long	1073741824
	.align 8
.LC11:
	.long	0
	.long	1075314688
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits