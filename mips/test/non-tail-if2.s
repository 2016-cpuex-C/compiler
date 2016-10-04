.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 10
	li	$v1, 3
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_create_array
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	lw	$v1, 0($v0)
	li	$a0, 3
	bne	$v1, $a0, beq_else.32
	sw	$v0, 0($sp)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	f.13
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	lw	$v1, 0($sp)
	lw	$v1, 4($v1)
	add	$v0, $v0, $v1
	addi	$v0, $v0, 67890
	b	beq_cont.33
beq_else.32:
	li	$v0, 7
beq_cont.33:
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
f.13:
	li	$v0, 12345
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


