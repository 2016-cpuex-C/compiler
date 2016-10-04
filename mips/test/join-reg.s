.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	f.12
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	sw	$v0, 0($sp)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	g.14
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	sw	$v0, -4($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	h.16
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.31
	lw	$v0, 0($sp)
	lw	$v1, -4($sp)
	sub	$v0, $v0, $v1
	b	beq_cont.32
beq_else.31:
	lw	$v0, -4($sp)
	lw	$v1, 0($sp)
	sub	$v0, $v0, $v1
beq_cont.32:
	lw	$v1, 0($sp)
	add	$v0, $v0, $v1
	lw	$v1, -4($sp)
	add	$v0, $v0, $v1
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	min_caml_print_int
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall
f.12:
	li	$v0, 123
	jr	$ra
g.14:
	li	$v0, 456
	jr	$ra
h.16:
	li	$v0, 789
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


