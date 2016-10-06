.data
l.384:	# 12.000000
	.word	0x41400000
l.380:	# 11.000000
	.word	0x41300000
l.376:	# 10.000000
	.word	0x41200000
l.372:	# 9.000000
	.word	0x41100000
l.368:	# 8.000000
	.word	0x41000000
l.364:	# 7.000000
	.word	0x40e00000
l.360:	# 6.000000
	.word	0x40c00000
l.356:	# 5.000000
	.word	0x40a00000
l.352:	# 4.000000
	.word	0x40800000
l.348:	# 3.000000
	.word	0x40400000
l.344:	# 2.000000
	.word	0x40000000
l.340:	# 1.000000
	.word	0x3f800000
l.331:	# 0.000000
	.word	0x0
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 0
	la	$v1, l.331
	l.s	$f0, 0($v1)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, make.183
	sw	$v1, 0($t8)
	sw	$v0, 4($t8)
	li	$v0, 2
	li	$v1, 3
	sw	$t8, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v1, 3
	li	$a0, 2
	lw	$t8, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 2
	li	$a0, 2
	lw	$t8, 0($sp)
	sw	$v0, 8($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$a3, $v0, 0
	lw	$a1, 4($sp)
	lw	$v0, 0($a1)
	la	$v1, l.340
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 0($a1)
	la	$v1, l.344
	l.s	$f0, 0($v1)
	s.s	$f0, 4($v0)
	lw	$v0, 0($a1)
	la	$v1, l.348
	l.s	$f0, 0($v1)
	s.s	$f0, 8($v0)
	lw	$v0, 4($a1)
	la	$v1, l.352
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 4($a1)
	la	$v1, l.356
	l.s	$f0, 0($v1)
	s.s	$f0, 4($v0)
	lw	$v0, 4($a1)
	la	$v1, l.360
	l.s	$f0, 0($v1)
	s.s	$f0, 8($v0)
	lw	$a2, 8($sp)
	lw	$v0, 0($a2)
	la	$v1, l.364
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 0($a2)
	la	$v1, l.368
	l.s	$f0, 0($v1)
	s.s	$f0, 4($v0)
	lw	$v0, 4($a2)
	la	$v1, l.372
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 4($a2)
	la	$v1, l.376
	l.s	$f0, 0($v1)
	s.s	$f0, 4($v0)
	lw	$v0, 8($a2)
	la	$v1, l.380
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	lw	$v0, 8($a2)
	la	$v1, l.384
	l.s	$f0, 0($v1)
	s.s	$f0, 4($v0)
	li	$v0, 2
	li	$v1, 3
	li	$a0, 2
	sw	$a3, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	mul.140
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 12($sp)
	lw	$v1, 0($v0)
	l.s	$f0, 0($v1)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_truncate
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_newline
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 12($sp)
	lw	$v1, 0($v0)
	l.s	$f0, 4($v1)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_truncate
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_newline
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 12($sp)
	lw	$v1, 4($v0)
	l.s	$f0, 0($v1)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_truncate
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_newline
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 12($sp)
	lw	$v0, 4($v0)
	l.s	$f0, 4($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_truncate
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_newline
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall
loop3.153:
	lw	$v1, 20($t8)
	lw	$a0, 16($t8)
	lw	$a1, 12($t8)
	lw	$a2, 8($t8)
	lw	$a3, 4($t8)
	li	$t0, 0
	bgt	$t0, $v0, ble_else.422
	sll	$t0, $a0, 2
	add	$t9, $a1, $t0
	lw	$t0, ($t9)
	sll	$t1, $a0, 2
	add	$t9, $a1, $t1
	lw	$a1, ($t9)
	sll	$t1, $v1, 2
	add	$t9, $a1, $t1
	l.s	$f0, ($t9)
	sll	$a0, $a0, 2
	add	$t9, $a3, $a0
	lw	$a0, ($t9)
	sll	$a1, $v0, 2
	add	$t9, $a0, $a1
	l.s	$f2, ($t9)
	sll	$a0, $v0, 2
	add	$t9, $a2, $a0
	lw	$a0, ($t9)
	sll	$a1, $v1, 2
	add	$t9, $a0, $a1
	l.s	$f4, ($t9)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	sll	$v1, $v1, 2
	add	$t9, $t0, $v1
	s.s	$f0, ($t9)
	addi	$v0, $v0, -1
	lw	$s7, ($t8)
	jr	$s7
ble_else.422:
	jr	$ra
loop2.150:
	lw	$v1, 20($t8)
	lw	$a0, 16($t8)
	lw	$a1, 12($t8)
	lw	$a2, 8($t8)
	lw	$a3, 4($t8)
	li	$t0, 0
	bgt	$t0, $v0, ble_else.424
	addi	$t0, $gp, 0
	addi	$gp, $gp, 24
	la	$t1, loop3.153
	sw	$t1, 0($t0)
	sw	$v0, 20($t0)
	sw	$a0, 16($t0)
	sw	$a1, 12($t0)
	sw	$a2, 8($t0)
	sw	$a3, 4($t0)
	addi	$v1, $v1, -1
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $v1, 0
	addi	$t8, $t0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 4($sp)
	addi	$v0, $v0, -1
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.424:
	jr	$ra
loop1.147:
	lw	$v1, 20($t8)
	lw	$a0, 16($t8)
	lw	$a1, 12($t8)
	lw	$a2, 8($t8)
	lw	$a3, 4($t8)
	li	$t0, 0
	bgt	$t0, $v0, ble_else.426
	addi	$t0, $gp, 0
	addi	$gp, $gp, 24
	la	$t1, loop2.150
	sw	$t1, 0($t0)
	sw	$a0, 20($t0)
	sw	$v0, 16($t0)
	sw	$a1, 12($t0)
	sw	$a2, 8($t0)
	sw	$a3, 4($t0)
	addi	$v1, $v1, -1
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $v1, 0
	addi	$t8, $t0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 4($sp)
	addi	$v0, $v0, -1
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.426:
	jr	$ra
mul.140:
	addi	$t8, $gp, 0
	addi	$gp, $gp, 24
	la	$t0, loop1.147
	sw	$t0, 0($t8)
	sw	$a0, 20($t8)
	sw	$v1, 16($t8)
	sw	$a3, 12($t8)
	sw	$a2, 8($t8)
	sw	$a1, 4($t8)
	addi	$v0, $v0, -1
	lw	$s7, ($t8)
	jr	$s7
init.187:
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v0, ble_else.428
	la	$a1, l.331
	l.s	$f0, 0($a1)
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v1, 8($sp)
	sll	$a0, $v1, 2
	lw	$a1, 4($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	addi	$v0, $v1, -1
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.428:
	jr	$ra
make.183:
	lw	$a0, 4($t8)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v1, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 16
	la	$v1, init.187
	sw	$v1, 0($t8)
	lw	$v1, 4($sp)
	sw	$v1, 8($t8)
	sw	$v0, 4($t8)
	lw	$v1, 0($sp)
	addi	$v1, $v1, -1
	sw	$v0, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 8($sp)
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
	s.s	$f0, ($gp) #ここがちがうだけ
	addi	$a0, $a0, -1
	addi	$gp, $gp, 4
	b	create_float_array_loop


