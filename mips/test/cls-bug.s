.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	addi	$v0, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, f.6
	sw	$v1, 0($v0)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, g.9
	sw	$v1, 0($t8)
	sw	$v0, 4($t8)
	li	$v0, 456
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	addi	$t8, $v0, 0
	li	$v0, 789
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	lw	$s7, ($t8)
	jalr	$s7
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
f.6:
	addi	$v0, $v0, 123
	jr	$ra
g.9:
	lw	$v0, 4($t8)
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


