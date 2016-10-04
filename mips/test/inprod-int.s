.data
.text
.globl	main
main:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addi	$fp, $sp, 0
	li	$v0, 1000000
	li	$v1, 1
	li	$a0, 2
	li	$a1, 3
	addi	$a2, $gp, 0
	addi	$gp, $gp, 16
	sw	$a1, 8($a2)
	sw	$a0, 4($a2)
	sw	$v1, 0($a2)
	addi	$v1, $a2, 0
	li	$a0, 4
	li	$a1, 5
	li	$a2, 6
	addi	$a3, $gp, 0
	addi	$gp, $gp, 16
	sw	$a2, 8($a3)
	sw	$a1, 4($a3)
	sw	$a0, 0($a3)
	addi	$a0, $a3, 0
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, -4($sp)
	addi	$sp, $sp, -8
	jal	inprod.37
	addi	$sp, $sp, 8
	lw	$ra, -4($sp)
	lw	$v1, 0($sp)
	mult	$v1, $v0
	mflo	 $v0
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
	exit
getx.22:
	lw	$v0, 0($v0)
	jr	$ra
gety.27:
	lw	$v0, 4($v0)
	jr	$ra
getz.32:
	lw	$v0, 8($v0)
	jr	$ra
inprod.37:
	sw	$v0, 0($sp)
	sw	$v1, -4($sp)
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	getx.22
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	lw	$v1, -4($sp)
	sw	$v0, -8($sp)
	addi	$v0, $v1, 0
	sw	$ra, -12($sp)
	addi	$sp, $sp, -16
	jal	getx.22
	addi	$sp, $sp, 16
	lw	$ra, -12($sp)
	lw	$v1, -8($sp)
	mult	$v1, $v0
	mflo	 $v0
	lw	$v1, 0($sp)
	sw	$v0, -12($sp)
	addi	$v0, $v1, 0
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	gety.27
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	lw	$v1, -4($sp)
	sw	$v0, -16($sp)
	addi	$v0, $v1, 0
	sw	$ra, -20($sp)
	addi	$sp, $sp, -24
	jal	gety.27
	addi	$sp, $sp, 24
	lw	$ra, -20($sp)
	lw	$v1, -16($sp)
	mult	$v1, $v0
	mflo	 $v0
	lw	$v1, -12($sp)
	add	$v0, $v1, $v0
	lw	$v1, 0($sp)
	sw	$v0, -20($sp)
	addi	$v0, $v1, 0
	sw	$ra, -28($sp)
	addi	$sp, $sp, -32
	jal	getz.32
	addi	$sp, $sp, 32
	lw	$ra, -28($sp)
	lw	$v1, -4($sp)
	sw	$v0, -24($sp)
	addi	$v0, $v1, 0
	sw	$ra, -28($sp)
	addi	$sp, $sp, -32
	jal	getz.32
	addi	$sp, $sp, 32
	lw	$ra, -28($sp)
	lw	$v1, -24($sp)
	mult	$v1, $v0
	mflo	 $v0
	lw	$v1, -20($sp)
	add	$v0, $v1, $v0
	jr	$ra
