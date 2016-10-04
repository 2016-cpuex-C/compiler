.data
l.32:	# -7.890000
	.word	0xc0fc7ae1
l.30:	# 4.560000
	.word	0x4091eb85
l.28:	# 1.230000
	.word	0x3f9d70a4
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	la	$v0, l.28
	l.s	$f0, 0($v0)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_truncate
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	la	$v1, l.30
	l.s	$f0, 0($v1)
	sw	$v0, 0($sp)
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	min_caml_truncate
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	la	$v1, l.32
	l.s	$f0, 0($v1)
	sw	$v0, -4($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	min_caml_truncate
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	li	$v1, 0
	sw	$v0, -8($sp)
	bgt	$v1, $v0, ble_else.41
	lw	$v1, 0($sp)
	addi	$v0, $v1, 0
	b	ble_cont.42
ble_else.41:
	lw	$v1, -4($sp)
	addi	$v0, $v1, 0
ble_cont.42:
	li	$v1, 0
	lw	$a0, 0($sp)
	sw	$v0, -12($sp)
	bgt	$a0, $v1, ble_else.43
	lw	$v1, -4($sp)
	addi	$v0, $v1, 0
	b	ble_cont.44
ble_else.43:
	lw	$v1, -8($sp)
	addi	$v0, $v1, 0
ble_cont.44:
	lw	$v1, -12($sp)
	add	$v0, $v1, $v0
	li	$v1, 0
	lw	$a0, -4($sp)
	sw	$v0, -16($sp)
	bgt	$v1, $a0, ble_else.45
	lw	$v1, -8($sp)
	addi	$v0, $v1, 0
	b	ble_cont.46
ble_else.45:
	lw	$v1, 0($sp)
	addi	$v0, $v1, 0
ble_cont.46:
	lw	$v1, -16($sp)
	add	$v0, $v1, $v0
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	min_caml_print_int
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall

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


