.data
l.377:	# 12.000000
	.word	0x41400000
l.373:	# 11.000000
	.word	0x41300000
l.369:	# 10.000000
	.word	0x41200000
l.365:	# 9.000000
	.word	0x41100000
l.361:	# 8.000000
	.word	0x41000000
l.357:	# 7.000000
	.word	0x40e00000
l.353:	# 6.000000
	.word	0x40c00000
l.349:	# 5.000000
	.word	0x40a00000
l.345:	# 4.000000
	.word	0x40800000
l.341:	# 3.000000
	.word	0x40400000
l.337:	# 2.000000
	.word	0x40000000
l.333:	# 1.000000
	.word	0x3f800000
l.328:	# 0.000000
	.word	0x0
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 0
	la	$v1, l.328
	l.s	$f0, 0($v1)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_create_float_array
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	addi	$a0, $v0, 0
	li	$v0, 2
	li	$v1, 3
	sw	$a0, 0($sp)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	make.208
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	li	$v1, 3
	li	$a0, 2
	lw	$a1, 0($sp)
	sw	$v0, -4($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	addi	$a0, $a1, 0
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	make.208
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	li	$v1, 2
	li	$a0, 2
	lw	$a1, 0($sp)
	sw	$v0, -8($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	addi	$a0, $a1, 0
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	make.208
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	addi	$a3, $v0, 0
	lw	$a1, -4($sp)
	lw	$v0, 0($a1)
	la	$v1, l.333
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 0($a1)
	la	$v1, l.337
	l.s	$f0, 0($v1)
	s.s	$f0, -8($v0)
	lw	$v0, 0($a1)
	la	$v1, l.341
	l.s	$f0, 0($v1)
	s.s	$f0, -16($v0)
	lw	$v0, 4($a1)
	la	$v1, l.345
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 4($a1)
	la	$v1, l.349
	l.s	$f0, 0($v1)
	s.s	$f0, -8($v0)
	lw	$v0, 4($a1)
	la	$v1, l.353
	l.s	$f0, 0($v1)
	s.s	$f0, -16($v0)
	lw	$a2, -8($sp)
	lw	$v0, 0($a2)
	la	$v1, l.357
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 0($a2)
	la	$v1, l.361
	l.s	$f0, 0($v1)
	s.s	$f0, -8($v0)
	lw	$v0, 4($a2)
	la	$v1, l.365
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 4($a2)
	la	$v1, l.369
	l.s	$f0, 0($v1)
	s.s	$f0, -8($v0)
	lw	$v0, 8($a2)
	la	$v1, l.373
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 8($a2)
	la	$v1, l.377
	l.s	$f0, 0($v1)
	s.s	$f0, -8($v0)
	li	$v0, 2
	li	$v1, 3
	li	$a0, 2
	sw	$a3, -12($sp)
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	mul.186
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	lw	$v0, -12($sp)
	lw	$v1, 0($v0)
	l.s	$f0, 0($v1)
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
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	min_caml_print_newline
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	lw	$v0, -12($sp)
	lw	$v1, 0($v0)
	l.s	$f0, -8($v1)
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
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	min_caml_print_newline
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	lw	$v0, -12($sp)
	lw	$v1, 4($v0)
	l.s	$f0, 0($v1)
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
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	min_caml_print_newline
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	lw	$v0, -12($sp)
	lw	$v0, 4($v0)
	l.s	$f0, -8($v0)
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
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	min_caml_print_newline
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall
loop3.140:
	li	$t0, 0
	bgt	$t0, $v1, ble_else.420
	sll	$t0, $v0, 2
	add	$t9, $a3, $t0
	lw	$t0, ($t9)
	sll	$t1, $v0, 2
	add	$t9, $a3, $t1
	lw	$t1, ($t9)
	sll	$t2, $a0, 3
	add	$t9, $t1, $t2
	l.s	$f0, ($t9)
	sll	$t1, $v0, 2
	add	$t9, $a1, $t1
	lw	$t1, ($t9)
	sll	$t2, $v1, 3
	add	$t9, $t1, $t2
	l.s	$f2, ($t9)
	sll	$t1, $v1, 2
	add	$t9, $a2, $t1
	lw	$t1, ($t9)
	sll	$t2, $a0, 3
	add	$t9, $t1, $t2
	l.s	$f4, ($t9)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	sll	$t1, $a0, 3
	add	$t9, $t0, $t1
	s.s	$f0, ($t9)
	addi	$v1, $v1, -1
	j	loop3.140
ble_else.420:
	jr	$ra
loop2.160:
	li	$t0, 0
	bgt	$t0, $a0, ble_else.422
	addi	$t0, $v1, -1
	sw	$a3, 0($sp)
	sw	$a2, -4($sp)
	sw	$a1, -8($sp)
	sw	$v1, -12($sp)
	sw	$v0, -16($sp)
	sw	$a0, -20($sp)
	addi	$v1, $t0, 0
	sw	$ra, -28($sp)
	addi	$sp, $sp, -32
	jal	loop3.140
	addi	$sp, $sp, 32
	lw	$ra, -28($sp)
	lw	$v0, -20($sp)
	addi	$a0, $v0, -1
	lw	$v0, -16($sp)
	lw	$v1, -12($sp)
	lw	$a1, -8($sp)
	lw	$a2, -4($sp)
	lw	$a3, 0($sp)
	j	loop2.160
ble_else.422:
	jr	$ra
loop1.173:
	li	$t0, 0
	bgt	$t0, $v0, ble_else.424
	addi	$t0, $a0, -1
	sw	$a3, 0($sp)
	sw	$a2, -4($sp)
	sw	$a1, -8($sp)
	sw	$a0, -12($sp)
	sw	$v1, -16($sp)
	sw	$v0, -20($sp)
	addi	$a0, $t0, 0
	sw	$ra, -28($sp)
	addi	$sp, $sp, -32
	jal	loop2.160
	addi	$sp, $sp, 32
	lw	$ra, -28($sp)
	lw	$v0, -20($sp)
	addi	$v0, $v0, -1
	lw	$v1, -16($sp)
	lw	$a0, -12($sp)
	lw	$a1, -8($sp)
	lw	$a2, -4($sp)
	lw	$a3, 0($sp)
	j	loop1.173
ble_else.424:
	jr	$ra
mul.186:
	addi	$v0, $v0, -1
	j	loop1.173
init.198:
	li	$a1, 0
	bgt	$a1, $v0, ble_else.426
	la	$a1, l.328
	l.s	$f0, 0($a1)
	sw	$v1, 0($sp)
	sw	$a0, -4($sp)
	sw	$v0, -8($sp)
	addi	$v0, $v1, 0
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	min_caml_create_float_array
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	lw	$v1, -8($sp)
	sll	$a0, $v1, 2
	lw	$a1, -4($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	addi	$v0, $v1, -1
	lw	$v1, 0($sp)
	addi	$a0, $a1, 0
	j	init.198
ble_else.426:
	jr	$ra
make.208:
	sw	$v1, 0($sp)
	sw	$v0, -4($sp)
	addi	$v1, $a0, 0
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	min_caml_create_array
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	addi	$a0, $v0, 0
	lw	$v0, -4($sp)
	addi	$v0, $v0, -1
	lw	$v1, 0($sp)
	sw	$a0, -8($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	init.198
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	lw	$v0, -8($sp)
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


