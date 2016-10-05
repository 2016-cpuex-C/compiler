.data
l.79:	# 6.000000
	.word	0x40c00000
l.77:	# 5.000000
	.word	0x40a00000
l.75:	# 4.000000
	.word	0x40800000
l.69:	# 3.000000
	.word	0x40400000
l.67:	# 2.000000
	.word	0x40000000
l.65:	# 1.000000
	.word	0x3f800000
l.63:	# 1000000.000000
	.word	0x49742400
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	la	$v0, l.63
	l.s	$f0, 0($v0)
	la	$v0, l.65
	l.s	$f2, 0($v0)
	la	$v0, l.67
	l.s	$f4, 0($v0)
	la	$v0, l.69
	l.s	$f6, 0($v0)
	addi	$v0, $gp, 0
	addi	$gp, $gp, 24
	s.s	$f6, -16($v0)
	s.s	$f4, -8($v0)
	s.s	$f2, 0($v0)
	la	$v1, l.75
	l.s	$f2, 0($v1)
	la	$v1, l.77
	l.s	$f4, 0($v1)
	la	$v1, l.79
	l.s	$f6, 0($v1)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 24
	s.s	$f6, -16($v1)
	s.s	$f4, -8($v1)
	s.s	$f2, 0($v1)
	s.s	$f0, 0($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	inprod.38
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	l.s	$f2, 0($sp)
	mul.s	$f0, $f2, $f0
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	min_caml_truncate
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	min_caml_print_int
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall
getx.23:
	l.s	$f0, 0($v0)
	mov.s	$f0, $f0
	jr	$ra
gety.28:
	l.s	$f0, -8($v0)
	mov.s	$f0, $f0
	jr	$ra
getz.33:
	l.s	$f0, -16($v0)
	mov.s	$f0, $f0
	jr	$ra
inprod.38:
	sw	$v0, 0($sp)
	sw	$v1, -4($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	getx.23
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	lw	$v0, -4($sp)
	s.s	$f0, -8($sp)
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	getx.23
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	l.s	$f2, -8($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, -16($sp)
	sw	$ra, -28($sp)
	addi	$sp, $sp, -32
	jal	gety.28
	addi	$sp, $sp, 32
	lw	$ra, -28($sp)
	lw	$v0, -4($sp)
	s.s	$f0, -24($sp)
	sw	$ra, -36($sp)
	addi	$sp, $sp, -40
	jal	gety.28
	addi	$sp, $sp, 40
	lw	$ra, -36($sp)
	l.s	$f2, -24($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, -16($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, -32($sp)
	sw	$ra, -44($sp)
	addi	$sp, $sp, -48
	jal	getz.33
	addi	$sp, $sp, 48
	lw	$ra, -44($sp)
	lw	$v0, -4($sp)
	s.s	$f0, -40($sp)
	sw	$ra, -52($sp)
	addi	$sp, $sp, -56
	jal	getz.33
	addi	$sp, $sp, 56
	lw	$ra, -52($sp)
	l.s	$f2, -40($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, -32($sp)
	add.s	$f0, $f2, $f0
	jr	$ra

min_caml_print_newline:
	li	$a0, 10
	li	$v0, 11
	syscall
	jr	$ra
min_caml_print_int: #$v0
	move	$a0, $v0
	li	$v0, 1
	syscall
	jr	$ra
min_caml_print_double: #$f0
	mov.d	$f12, $f0
	li	$v0, 3
	syscall
	jr	$ra
min_caml_truncate: # $f0:float -> $v0:int
	trunc.w.s $f0, $f0
	mfc1	$v0, $f0
	jr	$ra

# align 8する必要あるんだろうか
min_caml_create_array: #長さ$v0, 中身$v1のarray
	move	$a0, $v0
	move	$v0, $gp
create_array_loop:
	li	$a2, 0
	bne	$a0, $a2, create_array_cont
	andi	$a1, $gp, 4
	beq	$a1, $a2, create_array_exit
	addi	$gp, $gp, 4
create_array_exit:
	jr	$ra
create_array_cont:
	sw	$v1, ($gp)
	addi	$a0, $a0, -1
	addi	$gp, $gp, 4
	b	create_array_loop

min_caml_create_float_array: #長さ$v0, 中身$f0のarra
	move	$a0, $v0
	move	$v0, $gp
create_float_array_loop:
	li	$a2, 0
	bne	$a0, $a2, create_float_array_cont
	andi	$a1, $gp, 4
	beq	$a1, $a2, create_float_array_exit
	addi	$gp, $gp, 4
create_float_array_exit:
	jr	$ra
create_float_array_cont:
	s.s	$f0, ($gp)
	addi	$a0, $a0, -1
	addi	$gp, $gp, 4
	b	create_float_array_loop


