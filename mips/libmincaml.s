
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
	li	$v0, 3
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

# align8する必要あるんだろうか
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






