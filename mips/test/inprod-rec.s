.data
l.47:	# 1000000.000000
	.word	0x49742400
l.45:	# 4.560000
	.word	0x4091eb85
l.43:	# 1.230000
	.word	0x3f9d70a4
l.41:	# 0.000000
	.word	0x0
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 3
	la	$v1, l.43
	l.s	$f0, 0($v1)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_create_float_array
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	li	$v1, 3
	la	$a0, l.45
	l.s	$f0, 0($a0)
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_create_float_array
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	addi	$v1, $v0, 0
	la	$v0, l.47
	l.s	$f0, 0($v0)
	li	$a0, 2
	lw	$v0, 0($sp)
	s.s	$f0, -8($sp)
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	inprod.17
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
inprod.17:
	li	$a1, 0
	bgt	$a1, $a0, ble_else.54
	sll	$a1, $a0, 3
	add	$t9, $v0, $a1
	l.s	$f0, ($t9)
	sll	$a1, $a0, 3
	add	$t9, $v1, $a1
	l.s	$f2, ($t9)
	mul.s	$f0, $f0, $f2
	addi	$a0, $a0, -1
	s.s	$f0, 0($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	inprod.17
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	l.s	$f2, 0($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
ble_else.54:
	la	$v0, l.41
	l.s	$f0, 0($v0)
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

#min_caml_create_array:
#	move	$a0, $v0
#	move	$v0, $gp
#create_array_loop:
#	tst	%a0


