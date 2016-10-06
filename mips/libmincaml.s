
##################
## libmincaml.s ##
##################

min_caml_print_newline:
	li	$a0, 10 # NL
	li	$v0, 11 # print char
	syscall
	jr	$ra

min_caml_print_int: # $v0
	move	$a0, $v0
	li	$v0, 1
	syscall
	jr	$ra

min_caml_print_char: # $v0
	move	$a0, $v0
	li	$v0, 11 # print char
	syscall
	jr	$ra

min_caml_print_double: # $f0 doubleという名前だがfloat
	mov.d	$f12, $f0
	li	$v0, 2
	syscall
	jr	$ra
min_caml_print_float:
	mov.d	$f12, $f0
	li	$v0, 2
	syscall
	jr	$ra

min_caml_read_int:
	li	$v0, 5
	syscall
	jr	$ra

min_caml_read_float:
	li	$v0, 6
	syscall
	jr	$ra

min_caml_truncate: # $f0:float -> $v0:int
	cvt.w.s $f0, $f0
	mfc1	$v0, $f0
	jr	$ra

min_caml_create_array: # array of length $v0, initialized by $v1
	move	$a0, $v0
	move	$v0, $gp
create_array_loop:
	li	$a2, 0
	bne	$a0, $a2, create_array_cont
	#align 8する必要はない
	#andi	$a1, $gp, 4
	#beq	$a1, $a2, create_array_exit
	#addi	$gp, $gp, 4
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
	#andi	$a1, $gp, 4
	#beq	$a1, $a2, create_float_array_exit
	#addi	$gp, $gp, 4
create_float_array_exit:
	jr	$ra
create_float_array_cont:
	s.s	$f0, ($gp) #ここがちがうだけ
	addi	$a0, $a0, -1
	addi	$gp, $gp, 4
	b	create_float_array_loop

min_caml_int_of_float: # f0 -> v0
	cvt.w.s $f0, $f0
	mfc1	$v0, $f0
	jr	$ra

min_caml_float_of_int: # v0 -> f0
	mtc1	$v0, $f0 # f0 := v0
	cvt.s.w	$f0, $f0 # convert
	jr	$ra

min_caml_floor: # f0 -> f0
	floor.w.s $f0, $f0
	cvt.s.w $f0, $f0
	jr	$ra

min_caml_sqrt: # f0 -> f0
	sqrt.s	$f0, $f0
	jr	$ra

min_caml_fiszero: # f0 -> v0
	l.s	$f1, const_f_zero
	c.eq.s	$f0, $f1
	bc1t	min_caml_fiszero_t
	l.s	$f1, const_f_zero_neg
	c.eq.s	$f0, $f1
	bc1t	min_caml_fiszero_t
	li	$v0, 0 # false
	jr	$ra
min_caml_fiszero_t:
	li	$v0, 1 # true
	jr	$ra

min_caml_fispos: # f0 -> v0
	l.s	$f1, const_f_zero
	c.lt.s	$f1, $f0 # 0.0 < f0?
	bc1t	min_caml_fispos_t
	li	$v0, 0 # false
	jr	$ra
min_caml_fispos_t:
	li	$v0, 1 # true
	jr	$ra

min_caml_fisneg: # f0 -> v0
	l.s	$f1, const_f_zero
	c.lt.s	$f0, $f1 # f0 < 0.0?
	bc1t	min_caml_fispos_t
	li	$v0, 0 # false
	jr	$ra
min_caml_fisneg_t:
	li	$v0, 1 # true
	jr	$ra

min_caml_xor: # v0, v1 -> v0
	li	$a0, 0
	beq	$v0, $a0, min_caml_xor_2
	# v0=t
	beq	$v1, $a0, min_caml_xor_1
	# v0=t, v1=t
	li	$v0, 0
	jr	$ra
min_caml_xor_1:
	# v0=t, v1=f
	li	$v0, 1
	jr	$ra
min_caml_xor_2:
	# v0=f
	beq	$v1, $a0, min_caml_xor_3
	# v0=f, v1=t
	li	$v0, 1
	jr	$ra
min_caml_xor_3:
	# v0=f, v1=f
	li	$v0, 0
	jr	$ra

min_caml_fless: # f0,f1 -> v0
	c.le.s	$f0, $f1
	bc1t	min_caml_fless_1
	li	$v0, 0
	jr	$ra
min_caml_fless_1:
	li	$v0, 1
	jr	$ra

min_caml_fneg: # f0 -> f0
	l.s	$f1, const_f_zero
	sub.s	$f0, $f1, $f0
	jr	$ra

min_caml_fabs: # f0 -> f0
	l.s	$f1, const_f_zero
	c.lt.s	$f0, $f1
	bc1t	min_caml_fneg
	jr	$ra

min_caml_fsqr: # f0 -> f0
	mul.s	$f0, $f0, $f0
	jr	$ra

min_caml_fhalf: # f0 -> f0
	l.s	$f1, const_f_half
	mul.s	$f0, $f0, $f1
	jr	$ra

##############
## sin, cos ##
##############

min_caml_tri_fact:
	li	$v1, 2
	bgt	$v1, $v0, min_caml_tri_fact_ble_else
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_tri_fact
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	mult	$v1, $v0
	mflo	 $v0
	jr	$ra
min_caml_tri_fact_ble_else:
	li	$v0, 1
	jr	$ra
min_caml_tri_pow:
	li	$v1, 0
	bne	$v0, $v1, min_caml_tri_pow_beq_else
	l.s	$f0, const_f_one
	jr	$ra
min_caml_tri_pow_beq_else:
	addi	$v0, $v0, -1
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_tri_pow
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	l.s	$f2, 0($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
min_caml_tri_even:
	li	$v1, 0
	bne	$v0, $v1, min_caml_tri_even_beq_else1
	li	$v0, 1
	jr	$ra
min_caml_tri_even_beq_else1:
	li	$v1, 1
	bne	$v0, $v1, min_caml_tri_even_beq_else2
	li	$v0, 0
	jr	$ra
min_caml_tri_even_beq_else2:
	addi	$v0, $v0, -2
	j	min_caml_tri_even
min_caml_sin_sub:
	l.s	$f0, 4($t8)
	sll	$v1, $v0, 1
	addi	$v1, $v1, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_tri_pow
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_tri_fact
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_tri_even
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, min_caml_sin_sub_beq_else
	l.s	$f0, 12($sp)
	j	min_caml_fneg
min_caml_sin_sub_beq_else:
	l.s	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
min_caml_sin:
	l.s	$f2, const_f_zero
	c.le.s	$f2, $f0
	bc1f	min_caml_sin_bc1t_else1
	l.s	$f2, const_half_pi
	c.le.s	$f0, $f2
	bc1f	min_caml_sin_bc1t_else2
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, min_caml_sin_sub
	sw	$v0, 0($t8)
	s.s	$f0, 4($t8)
	li	$v0, 0
	sw	$t8, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 1
	lw	$t8, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 2
	lw	$t8, 0($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 3
	lw	$t8, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 4
	lw	$t8, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 5
	lw	$t8, 0($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 6
	lw	$t8, 0($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 7
	lw	$t8, 0($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 8
	lw	$t8, 0($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 9
	lw	$t8, 0($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
min_caml_sin_bc1t_else2:
	l.s	$f2, const_pi
	sub.s	$f0, $f2, $f0
	j	min_caml_sin
min_caml_sin_bc1t_else1:
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fneg
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_sin
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	j	min_caml_fneg
min_caml_cos_sub:
	l.s	$f0, 4($t8)
	sll	$v1, $v0, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_tri_pow
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_tri_fact
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_tri_even
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, min_caml_cos_sub_beq_else
	l.s	$f0, 12($sp)
	j	min_caml_fneg
min_caml_cos_sub_beq_else:
	l.s	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
min_caml_cos:
	l.s	$f2, const_f_zero
	c.le.s	$f2, $f0
	bc1f	min_caml_cos_bc1t_else1
	l.s	$f2, const_half_pi
	c.le.s	$f0, $f2
	bc1f	min_caml_cos_bc1t_else2
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, min_caml_cos_sub
	sw	$v0, 0($t8)
	s.s	$f0, 4($t8)
	li	$v0, 0
	sw	$t8, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 1
	lw	$t8, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 2
	lw	$t8, 0($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 3
	lw	$t8, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 4
	lw	$t8, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 5
	lw	$t8, 0($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 6
	lw	$t8, 0($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 7
	lw	$t8, 0($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 8
	lw	$t8, 0($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 9
	lw	$t8, 0($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
min_caml_cos_bc1t_else2:
	l.s	$f2, const_pi
	sub.s	$f0, $f2, $f0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_cos
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	j	min_caml_fneg
min_caml_cos_bc1t_else1:
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fneg
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	j	min_caml_cos

min_caml_atan_g:
	la	$v1, const_f_two
	l.s	$f0, 0($v1)
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_float_of_int
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	mul.s	$f0, $f2, $f0
	la	$v0, const_f_two
	l.s	$f2, 0($v0)
	lw	$v0, 0($sp)
	s.s	$f0, 8($sp)
	s.s	$f2, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_float_of_int
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	mul.s	$f0, $f2, $f0
	la	$v0, const_f_one
	l.s	$f2, 0($v0)
	add.s	$f0, $f0, $f2
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	jr	$ra
min_caml_atan_hoge:
	li	$v1, 0
	bne	$v0, $v1, min_caml_atan_hoge_beq_else
	la	$v0, const_f_one
	l.s	$f0, 0($v0)
	jr	$ra
min_caml_atan_hoge_beq_else:
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_atan_hoge
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_atan_g
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
min_caml_atan_f:
	l.s	$f0, 4($t8)
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_atan_hoge
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v0, 2
	l.s	$f2, 4($sp)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_tri_pow
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	la	$v0, const_f_one
	l.s	$f2, 0($v0)
	li	$v0, 2
	l.s	$f4, 4($sp)
	s.s	$f0, 12($sp)
	s.s	$f2, 16($sp)
	mov.s	$f0, $f4
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_tri_pow
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 12($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_tri_pow
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 8($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
min_caml_atan:
	la	$v0, const_f_one
	l.s	$f2, 0($v0)
	c.le.s	$f0, $f2
	bc1f	min_caml_atan_bc1t_else
	addi	$v0, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, min_caml_atan_f
	sw	$v1, 0($v0)
	s.s	$f0, 4($v0)
	la	$v1, const_f_one
	l.s	$f2, 0($v1)
	li	$v1, 2
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	s.s	$f2, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_tri_pow
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 4($sp)
	div.s	$f0, $f2, $f0
	li	$v0, 0
	lw	$t8, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v0, 1
	lw	$t8, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 2
	lw	$t8, 0($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 3
	lw	$t8, 0($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 4
	lw	$t8, 0($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 5
	lw	$t8, 0($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 6
	lw	$t8, 0($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 7
	lw	$t8, 0($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 40($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 8
	lw	$t8, 0($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 9
	lw	$t8, 0($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 10
	lw	$t8, 0($sp)
	s.s	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 52($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 11
	lw	$t8, 0($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 56($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 12
	lw	$t8, 0($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 60($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 13
	lw	$t8, 0($sp)
	s.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	l.s	$f2, 64($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 14
	lw	$t8, 0($sp)
	s.s	$f0, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f2, 68($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 15
	lw	$t8, 0($sp)
	s.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	l.s	$f2, 72($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 16
	lw	$t8, 0($sp)
	s.s	$f0, 76($sp)
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -84
	lw	$ra, 80($sp)
	l.s	$f2, 76($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 17
	lw	$t8, 0($sp)
	s.s	$f0, 80($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	l.s	$f2, 80($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 18
	lw	$t8, 0($sp)
	s.s	$f0, 84($sp)
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -92
	lw	$ra, 88($sp)
	l.s	$f2, 84($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 19
	lw	$t8, 0($sp)
	s.s	$f0, 88($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	l.s	$f2, 88($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 12($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
min_caml_atan_bc1t_else:
	la	$v0, const_half_pi
	l.s	$f2, 0($v0)
	la	$v0, const_f_one
	l.s	$f4, 0($v0)
	div.s	$f0, $f4, $f0
	s.s	$f2, 92($sp)
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_atan
	addi	$sp, $sp, -100
	lw	$ra, 96($sp)
	l.s	$f2, 92($sp)
	sub.s	$f0, $f2, $f0
	jr	$ra
