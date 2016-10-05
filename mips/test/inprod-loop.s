.data
l.50:	# 0.000000
	.word	0x0
l.48:	# 1000000.000000
	.word	0x49742400
l.46:	# 4.560000
	.word	0x4091eb85
l.44:	# 1.230000
	.word	0x3f9d70a4
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 3
	la	$v1, l.44
	l.s	$f0, 0($v1)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_create_float_array
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	li	$v1, 3
	la	$a0, l.46
	l.s	$f0, 0($a0)
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_create_float_array
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	addi	$v1, $v0, 0
	la	$v0, l.48
	l.s	$f0, 0($v0)
	la	$v0, l.50
	l.s	$f2, 0($v0)
	li	$a0, 2
	lw	$v0, 0($sp)
	s.s	$f0, -8($sp)
	mov.s	$f0, $f2
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	inprod.18
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	l.s	$f2, -8($sp)
	mul.s	$f0, $f2, $f0
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	min_caml_truncate
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	min_caml_print_int
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall
inprod.18:
	li	$a1, 0
	bgt	$a1, $a0, ble_else.56
	sll	$a1, $a0, 2
	add	$t9, $v0, $a1
	l.s	$f2, ($t9)
	sll	$a1, $a0, 2
	add	$t9, $v1, $a1
	l.s	$f4, ($t9)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	addi	$a0, $a0, -1
	j	inprod.18
ble_else.56:
	mov.s	$f0, $f0
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
min_caml_print_double: #$f0 doubleという名前だがfloat
	mov.d	$f12, $f0
	li	$v0, 3
	syscall
	jr	$ra
min_caml_truncate: # $f0:float -> $v0:int
	trunc.w.s $f0, $f0
	mfc1	$v0, $f0
	jr	$ra

# align 8する必要あるんだろうか
min_caml_create_array: # array of length $v0, initialized by $v1
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

min_caml_create_float_array: # array of length $v0, initialized by $f0
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


