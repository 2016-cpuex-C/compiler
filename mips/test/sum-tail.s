.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 0
	li	$v1, 10000
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	sum.8
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
sum.8:
	li	$a0, 0
	bgt	$v1, $a0, ble_else.19
	jr	$ra
ble_else.19:
	add	$v0, $v0, $v1
	addi	$v1, $v1, -1
	j	sum.8

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

