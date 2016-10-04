.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 10
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, f.8
	sw	$v1, 0($t8)
	sw	$v0, 4($t8)
	li	$v0, 123
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
f.8:
	lw	$v1, 4($t8)
	li	$a0, 0
	bne	$v0, $a0, beq_else.21
	li	$v0, 0
	jr	$ra
beq_else.21:
	addi	$v0, $v0, -1
	sw	$v1, 0($sp)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	lw	$v1, 0($sp)
	add	$v0, $v1, $v0
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


