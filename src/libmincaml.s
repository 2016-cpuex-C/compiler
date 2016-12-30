
##################
## libmincaml.s ##
##################

min_caml_print_newline:
	li	$v0, 10
	print_c	$v0
	jr	$ra

min_caml_print_int: # $v0
	print_i	$v0
	jr	$ra

min_caml_print_char: # $v0
	print_c	$v0
	jr	$ra

min_caml_print_float:
	print_f	$f0
	jr	$ra

min_caml_read_int:
	read_i	$v0
	jr	$ra

min_caml_read_float:
	read_f	$f0
	jr	$ra


min_caml_array_init:	# write $a0 in ($v0)~($v0+$v1-1), return $v0 itself
			# a0: elem, v0: init addr, v1: cnt
	move	$a2, $v0 # memory counter
	li	$a1, 0
min_caml_init_array_loop:
	bne	$v1, $a1, min_caml_init_array_cont
min_caml_init_array_exit:
	jr	$ra
min_caml_init_array_cont:
	sw	$a0, 0($a2)
	addi	$v1, $v1, -1
	addi	$a2, $a2, 1
	j	min_caml_init_array_loop

min_caml_create_array: # array of length $v0, initialized by $v1
	move	$a0, $v0 # counter
	move	$v0, $gp # return address
	li	$a2, 0
min_caml_create_array_loop:
	bne	$a0, $a2, min_caml_create_array_cont
min_caml_create_array_exit:
	jr	$ra
min_caml_create_array_cont:
	sw	$v1, 0($gp)
	addi	$a0, $a0, -1
	addi	$gp, $gp, 1
	j	min_caml_create_array_loop

min_caml_float_array_init:	# write $f0 in ($v0)~($v0+$v1-1), return $v0 itself
				# f0: elem, v0: init addr, v1: cnt
	move	$a2, $v0 # memory counter
	li	$a1, 0
min_caml_init_float_array_loop:
	bne	$v1, $a1, min_caml_init_float_array_cont
min_caml_init_float_array_exit:
	jr	$ra
min_caml_init_float_array_cont:
	s.s	$f0, 0($a2)
	addi	$v1, $v1, -1
	addi	$a2, $a2, 1
	j	min_caml_init_float_array_loop

min_caml_create_float_array: # array of length $v0, initialized by $f0
	move	$a0, $v0
	move	$v0, $gp
	li	$a2, 0
min_caml_create_float_array_loop:
	bne	$a0, $a2, min_caml_create_float_array_cont
min_caml_create_float_array_exit:
	jr	$ra
min_caml_create_float_array_cont:
	s.s	$f0, 0($gp)
	addi	$a0, $a0, -1
	addi	$gp, $gp, 1
	j	min_caml_create_float_array_loop

min_caml_truncate:
	j	min_caml_int_of_float
min_caml_int_of_float: # f0 -> v0
	ftoi	$v0, $f0
	jr	$ra

min_caml_float_of_int: # v0 -> f0
	itof	$f0, $v0
	jr	$ra

min_caml_floor: # f0 -> f0
	floor $f0, $f0
	jr	$ra

min_caml_sqrt: # f0 -> f0
	sqrt	$f0, $f0
	jr	$ra

min_caml_fsqr: # f0 -> f0
	mul.s	$f0, $f0, $f0
	jr	$ra

###############
### sin, cos ##
###############

min_caml_sin:
	sin	$f0, $f0
	jr	$ra

min_caml_cos:
	cos	$f0, $f0
	jr	$ra

min_caml_atan:
	atan	$f0, $f0
	jr	$ra

