.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 789
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	even.17
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
odd.19:
	li	$v1, 0
	bgt	$v0, $v1, ble_else.36
	li	$v1, 0
	bgt	$v1, $v0, ble_else.37
	li	$v0, 456
	jr	$ra
ble_else.37:
	addi	$v0, $v0, 1
	j	even.17
ble_else.36:
	addi	$v0, $v0, -1
	j	even.17
even.17:
	li	$v1, 0
	bgt	$v0, $v1, ble_else.38
	li	$v1, 0
	bgt	$v1, $v0, ble_else.39
	li	$v0, 123
	jr	$ra
ble_else.39:
	addi	$v0, $v0, 1
	j	odd.19
ble_else.38:
	addi	$v0, $v0, -1
	j	odd.19

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

