.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 0
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	f.56
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
f.56:
	addi	$v1, $v0, 1
	addi	$a0, $v1, 1
	addi	$a1, $a0, 1
	addi	$a2, $a1, 1
	addi	$a3, $a2, 1
	addi	$t0, $a3, 1
	addi	$t1, $t0, 1
	addi	$t2, $t1, 1
	addi	$t3, $t2, 1
	addi	$t4, $t3, 1
	addi	$t5, $t4, 1
	addi	$t6, $t5, 1
	addi	$t7, $t6, 1
	addi	$s0, $t7, 1
	addi	$s1, $s0, 1
	addi	$s2, $s1, 1
	addi	$s3, $s2, 1
	addi	$s4, $s3, 1
	add	$s5, $s4, $v1
	add	$s6, $s5, $a0
	add	$s7, $s6, $a1
	add	$t8, $s7, $a2
	sw	$t8, 0($sp)
	add	$t8, $t8, $a3
	sw	$t8, -4($sp)
	add	$t8, $t8, $t0
	sw	$t8, -8($sp)
	add	$t8, $t8, $t1
	sw	$t8, -12($sp)
	add	$t8, $t8, $t2
	sw	$t8, -16($sp)
	add	$t8, $t8, $t3
	sw	$t8, -20($sp)
	add	$t8, $t8, $t4
	sw	$t8, -24($sp)
	add	$t8, $t8, $t5
	sw	$t8, -28($sp)
	add	$t8, $t8, $t6
	sw	$t8, -32($sp)
	add	$t8, $t8, $t7
	sw	$t8, -36($sp)
	add	$t8, $t8, $s0
	sw	$t8, -40($sp)
	add	$t8, $t8, $s1
	sw	$t8, -44($sp)
	add	$t8, $t8, $s2
	sw	$t8, -48($sp)
	add	$t8, $t8, $s3
	sw	$v0, -52($sp)
	add	$v0, $t8, $v0
	add	$v1, $v1, $a0
	add	$v1, $v1, $a1
	add	$v1, $v1, $a2
	add	$v1, $v1, $a3
	add	$v1, $v1, $t0
	add	$v1, $v1, $t1
	add	$v1, $v1, $t2
	add	$v1, $v1, $t3
	add	$v1, $v1, $t4
	add	$v1, $v1, $t5
	add	$v1, $v1, $t6
	add	$v1, $v1, $t7
	add	$v1, $v1, $s0
	add	$v1, $v1, $s1
	add	$v1, $v1, $s2
	add	$v1, $v1, $s3
	add	$v1, $v1, $s4
	add	$v1, $v1, $s5
	add	$v1, $v1, $s6
	add	$v1, $v1, $s7
	lw	$a0, 0($sp)
	add	$v1, $v1, $a0
	lw	$a0, -4($sp)
	add	$v1, $v1, $a0
	lw	$a0, -8($sp)
	add	$v1, $v1, $a0
	lw	$a0, -12($sp)
	add	$v1, $v1, $a0
	lw	$a0, -16($sp)
	add	$v1, $v1, $a0
	lw	$a0, -20($sp)
	add	$v1, $v1, $a0
	lw	$a0, -24($sp)
	add	$v1, $v1, $a0
	lw	$a0, -28($sp)
	add	$v1, $v1, $a0
	lw	$a0, -32($sp)
	add	$v1, $v1, $a0
	lw	$a0, -36($sp)
	add	$v1, $v1, $a0
	lw	$a0, -40($sp)
	add	$v1, $v1, $a0
	lw	$a0, -44($sp)
	add	$v1, $v1, $a0
	lw	$a0, -48($sp)
	add	$v1, $v1, $a0
	add	$v1, $v1, $t8
	add	$v0, $v1, $v0
	lw	$v1, -52($sp)
	add	$v0, $v0, $v1
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


