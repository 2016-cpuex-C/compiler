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
	li	$a2, 5
	li	$a3, 6
	li	$t0, 7
	li	$t1, 8
	li	$t2, 9
	li	$t3, 10
	addi	$t4, $gp, 0
	addi	$gp, $gp, 40
	sw	$t3, 36($t4)
	sw	$t2, 32($t4)
	sw	$t1, 28($t4)
	sw	$t0, 24($t4)
	sw	$a3, 20($t4)
	sw	$a2, 16($t4)
	sw	$a1, 12($t4)
	sw	$a0, 8($t4)
	sw	$v1, 4($t4)
	sw	$v0, 0($t4)
	addi	$v0, $t4, 0
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	h.26
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_print_int
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_print_newline
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall
g.38:
	lw	$v1, 40($t8)
	lw	$a0, 36($t8)
	lw	$a1, 32($t8)
	lw	$a2, 28($t8)
	lw	$a3, 24($t8)
	lw	$t0, 20($t8)
	lw	$t1, 16($t8)
	lw	$t2, 12($t8)
	lw	$t3, 8($t8)
	lw	$t4, 4($t8)
	add	$t2, $t4, $t2
	add	$t1, $t2, $t1
	add	$t0, $t1, $t0
	add	$a3, $t0, $a3
	add	$a2, $a3, $a2
	add	$a1, $a2, $a1
	add	$a0, $a1, $a0
	add	$v1, $a0, $v1
	add	$v1, $v1, $t3
	li	$a0, 0
	bgt	$v0, $a0, ble_else.90
	neg	$v0, $v0
	lw	$s7, ($t8)
	jr	$s7
ble_else.90:
	addi	$v0, $v1, 0
	jr	$ra
h.26:
	lw	$v1, 36($v0)
	lw	$a0, 32($v0)
	lw	$a1, 28($v0)
	lw	$a2, 24($v0)
	lw	$a3, 20($v0)
	lw	$t0, 16($v0)
	lw	$t1, 12($v0)
	lw	$t2, 8($v0)
	lw	$t3, 4($v0)
	lw	$v0, 0($v0)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 48
	la	$t4, g.38
	sw	$t4, 0($t8)
	sw	$a0, 40($t8)
	sw	$a1, 36($t8)
	sw	$a2, 32($t8)
	sw	$a3, 28($t8)
	sw	$t0, 24($t8)
	sw	$t1, 20($t8)
	sw	$t2, 16($t8)
	sw	$t3, 12($t8)
	sw	$v1, 8($t8)
	sw	$v0, 4($t8)
	li	$v0, 1
	lw	$s7, ($t8)
	jr	$s7

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


