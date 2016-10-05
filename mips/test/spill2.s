.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 10
	li	$v1, 1
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_create_array
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	sw	$v0, 0($sp)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	f.26
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	li	$v1, 67890
	lw	$a0, 0($sp)
	lw	$a1, 0($a0)
	add	$a2, $a1, $a1
	add	$a3, $a2, $a2
	add	$t0, $a3, $a3
	add	$t1, $t0, $t0
	add	$t2, $t1, $t1
	add	$t3, $t2, $t2
	add	$t4, $t3, $t3
	add	$t5, $t4, $t4
	add	$t6, $t5, $t5
	add	$t7, $t6, $t6
	add	$s0, $t7, $t7
	add	$s1, $s0, $s0
	add	$s2, $s1, $s1
	add	$s3, $s2, $s2
	add	$s4, $s3, $s3
	lw	$a0, 4($a0)
	li	$s5, 0
	bne	$a0, $s5, beq_else.77
	addi	$v0, $v1, 0
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	g.28
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	b	beq_cont.78
beq_else.77:
	add	$v1, $a1, $a2
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
	add	$v0, $v1, $v0
beq_cont.78:
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
f.26:
	li	$v0, 12345
	jr	$ra
g.28:
	addi	$v0, $v0, 1
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


