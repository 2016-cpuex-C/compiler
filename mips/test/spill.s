.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 1
	li	$v1, 2
	li	$a0, 3
	li	$a1, 4
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	f.43
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_print_int
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall
f.43:
	add	$a2, $v0, $v1
	add	$a3, $v0, $a0
	add	$t0, $v0, $a1
	add	$t1, $v1, $a0
	add	$t2, $v1, $a1
	add	$t3, $a0, $a1
	add	$t4, $a2, $a3
	add	$t5, $a2, $t0
	add	$t6, $a2, $t1
	add	$t7, $a2, $t2
	add	$s0, $a2, $t3
	add	$s1, $a3, $t0
	add	$s2, $a3, $t1
	add	$s3, $a3, $t2
	add	$s4, $a3, $t3
	add	$s5, $t0, $t1
	add	$s6, $t0, $t2
	add	$s7, $t0, $t3
	add	$t8, $t1, $t2
	sw	$t1, 0($sp)
	add	$t1, $t1, $t3
	sw	$t3, -4($sp)
	add	$t3, $t2, $t3
	sw	$t5, -8($sp)
	add	$t5, $t4, $t5
	sw	$t5, -12($sp)
	add	$t5, $t4, $t6
	sw	$t5, -16($sp)
	add	$t5, $t4, $t7
	sw	$t5, -20($sp)
	add	$t5, $t4, $s0
	sw	$t5, -24($sp)
	add	$t5, $t4, $s1
	sw	$t5, -28($sp)
	add	$t5, $t4, $s2
	sw	$t5, -32($sp)
	add	$t5, $t4, $s3
	sw	$t5, -36($sp)
	add	$t5, $t4, $s4
	sw	$t5, -40($sp)
	add	$t5, $t4, $s5
	sw	$t5, -44($sp)
	add	$t5, $t4, $s6
	sw	$t5, -48($sp)
	add	$t5, $t4, $s7
	sw	$t5, -52($sp)
	add	$t5, $t4, $t8
	sw	$t5, -56($sp)
	add	$t5, $t4, $t1
	sw	$t5, -60($sp)
	add	$t5, $t4, $t3
	add	$v0, $v0, $v1
	add	$v0, $v0, $a0
	add	$v0, $v0, $a1
	add	$v0, $v0, $a2
	add	$v0, $v0, $a3
	add	$v0, $v0, $t0
	lw	$v1, 0($sp)
	add	$v0, $v0, $v1
	add	$v0, $v0, $t2
	lw	$v1, -4($sp)
	add	$v0, $v0, $v1
	add	$v0, $v0, $t4
	lw	$v1, -8($sp)
	add	$v0, $v0, $v1
	add	$v0, $v0, $t6
	add	$v0, $v0, $t7
	add	$v0, $v0, $s0
	add	$v0, $v0, $s1
	add	$v0, $v0, $s2
	add	$v0, $v0, $s3
	add	$v0, $v0, $s4
	add	$v0, $v0, $s5
	add	$v0, $v0, $s6
	add	$v0, $v0, $s7
	add	$v0, $v0, $t8
	add	$v0, $v0, $t1
	add	$v0, $v0, $t3
	lw	$v1, -12($sp)
	add	$v0, $v0, $v1
	lw	$v1, -16($sp)
	add	$v0, $v0, $v1
	lw	$v1, -20($sp)
	add	$v0, $v0, $v1
	lw	$v1, -24($sp)
	add	$v0, $v0, $v1
	lw	$v1, -28($sp)
	add	$v0, $v0, $v1
	lw	$v1, -32($sp)
	add	$v0, $v0, $v1
	lw	$v1, -36($sp)
	add	$v0, $v0, $v1
	lw	$v1, -40($sp)
	add	$v0, $v0, $v1
	lw	$v1, -44($sp)
	add	$v0, $v0, $v1
	lw	$v1, -48($sp)
	add	$v0, $v0, $v1
	lw	$v1, -52($sp)
	add	$v0, $v0, $v1
	lw	$v1, -56($sp)
	add	$v0, $v0, $v1
	lw	$v1, -60($sp)
	add	$v0, $v0, $v1
	add	$v0, $v0, $t5
	neg	$v0, $v0
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


