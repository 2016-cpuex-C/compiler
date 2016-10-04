.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, f.9
	sw	$v0, 0($t8)
	li	$v0, 9
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall
f.9:
	li	$v1, 0
	bgt	$v1, $v0, ble_else.27
	sw	$v0, 0($sp)
	sw	$t8, -4($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	min_caml_print_int
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	li	$v0, 1
	lw	$v1, -4($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	min_caml_create_array
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	lw	$t8, 0($v0)
	lw	$v0, 0($sp)
	addi	$v0, $v0, -1
	lw	$s7, ($t8)
	jr	$s7
ble_else.27:
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


