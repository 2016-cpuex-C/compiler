.data
const_f_zero:
	.word	0x00000000
const_f_zero_neg:
	.word	0x80000000
const_f_one:
	.word	0x3f800000
const_f_two:
	.word	0x40000000
const_f_half:
	.word	0x3f000000
const_pi:
	.word	0x40490fdb
const_half_pi:
	.word	0x3fc90fdb
l.6937:	# 128.000000
	.word	0x43000000
l.6888:	# 0.900000
	.word	0x3f666666
l.6886:	# 0.200000
	.word	0x3e4ccccd
l.6779:	# -150.000000
	.word	0xc3160000
l.6776:	# 150.000000
	.word	0x43160000
l.6765:	# 0.100000
	.word	0x3dcccccd
l.6761:	# -2.000000
	.word	0xc0000000
l.6757:	# 0.003906
	.word	0x3b800000
l.6727:	# 0.300000
	.word	0x3e99999a
l.6722:	# 0.500000
	.word	0x3f000000
l.6720:	# 0.150000
	.word	0x3e19999a
l.6713:	# 15.000000
	.word	0x41700000
l.6709:	# 0.000100
	.word	0x38d1b717
l.6700:	# 3.141593
	.word	0x40490fdb
l.6690:	# 0.250000
	.word	0x3e800000
l.6678:	# 10.000000
	.word	0x41200000
l.6675:	# 0.050000
	.word	0x3d4ccccd
l.6627:	# 100000000.000000
	.word	0x4cbebc20
l.6621:	# 1000000000.000000
	.word	0x4e6e6b28
l.6598:	# -0.100000
	.word	0xbdcccccd
l.6585:	# 0.010000
	.word	0x3c23d70a
l.6582:	# -0.200000
	.word	0xbe4ccccd
l.6410:	# 255.000000
	.word	0x437f0000
l.6404:	# 50.000000
	.word	0x42480000
l.6383:	# -200.000000
	.word	0xc3480000
l.6380:	# 200.000000
	.word	0x43480000
l.6378:	# 30.000000
	.word	0x41f00000
l.6376:	# 20.000000
	.word	0x41a00000
l.6373:	# -20.000000
	.word	0xc1a00000
l.6370:	# 35.000000
	.word	0x420c0000
l.6367:	# -70.000000
	.word	0xc28c0000
l.6365:	# 0.017453
	.word	0x3c8efa35
l.6275:	# -1.000000
	.word	0xbf800000
l.6262:	# 2.000000
	.word	0x40000000
l.6252:	# 1.570796
	.word	0x3fc90fdb
l.6250:	# 0.000000
	.word	0x0
l.6248:	# 1.000000
	.word	0x3f800000
.text
.globl	main
main:
	addi	$sp, $sp, 24
	sw	$ra, -20($sp)
	sw	$fp, -16($sp)
	addi	$fp, $sp, 0
	la	$v0, l.6700
	l.s	$f0, 0($v0)
	addi	$v0, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, sin.2571
	sw	$v1, 0($v0)
	s.s	$f0, 4($v0)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	la	$a0, cos.2623
	sw	$a0, 0($v1)
	s.s	$f0, 4($v1)
	li	$a0, 1
	li	$a1, 0
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_array
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v1, 0
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 60
	li	$a0, 0
	li	$a1, 0
	li	$a2, 0
	li	$a3, 0
	li	$t0, 0
	addi	$t1, $gp, 0
	addi	$gp, $gp, 44
	sw	$v0, 40($t1)
	sw	$v0, 36($t1)
	sw	$v0, 32($t1)
	sw	$v0, 28($t1)
	sw	$t0, 24($t1)
	sw	$v0, 20($t1)
	sw	$v0, 16($t1)
	sw	$a3, 12($t1)
	sw	$a2, 8($t1)
	sw	$a1, 4($t1)
	sw	$a0, 0($t1)
	addi	$v0, $t1, 0
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_create_float_array
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_create_float_array
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_create_float_array
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 1
	la	$a0, l.6410
	l.s	$f0, 0($a0)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_float_array
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 50
	li	$a0, 1
	li	$a1, -1
	sw	$v0, 28($sp)
	sw	$v1, 32($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_create_array
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	addi	$v1, $v0, 0
	lw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_create_array
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v1, 1
	li	$a0, 1
	lw	$a1, 0($v0)
	sw	$v0, 36($sp)
	sw	$v1, 40($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_array
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	addi	$v1, $v0, 0
	lw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_array
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 1
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 44($sp)
	addi	$v0, $v1, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_create_float_array
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 48($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_create_array
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 1
	la	$a0, l.6621
	l.s	$f0, 0($a0)
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_create_float_array
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 56($sp)
	addi	$v0, $v1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_create_float_array
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 60($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_create_array
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 64($sp)
	addi	$v0, $v1, 0
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_create_float_array
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 68($sp)
	addi	$v0, $v1, 0
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_create_float_array
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 72($sp)
	addi	$v0, $v1, 0
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_create_float_array
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 76($sp)
	addi	$v0, $v1, 0
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	min_caml_create_float_array
	addi	$sp, $sp, -84
	lw	$ra, 80($sp)
	li	$v1, 2
	li	$a0, 0
	sw	$v0, 80($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_create_array
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	li	$v1, 2
	li	$a0, 0
	sw	$v0, 84($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	min_caml_create_array
	addi	$sp, $sp, -92
	lw	$ra, 88($sp)
	li	$v1, 1
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 88($sp)
	addi	$v0, $v1, 0
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_create_float_array
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 92($sp)
	addi	$v0, $v1, 0
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_create_float_array
	addi	$sp, $sp, -100
	lw	$ra, 96($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 96($sp)
	addi	$v0, $v1, 0
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_create_float_array
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 100($sp)
	addi	$v0, $v1, 0
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	min_caml_create_float_array
	addi	$sp, $sp, -108
	lw	$ra, 104($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 104($sp)
	addi	$v0, $v1, 0
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_create_float_array
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 108($sp)
	addi	$v0, $v1, 0
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_create_float_array
	addi	$sp, $sp, -116
	lw	$ra, 112($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 112($sp)
	addi	$v0, $v1, 0
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_float_array
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	li	$v1, 0
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 116($sp)
	addi	$v0, $v1, 0
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_create_float_array
	addi	$sp, $sp, -124
	lw	$ra, 120($sp)
	addi	$v1, $v0, 0
	li	$v0, 0
	sw	$v1, 120($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_create_array
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	li	$v1, 0
	addi	$a0, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($a0)
	lw	$v0, 120($sp)
	sw	$v0, 0($a0)
	addi	$v0, $a0, 0
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_create_array
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	addi	$v1, $v0, 0
	li	$v0, 5
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_create_array
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	li	$v1, 0
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 124($sp)
	addi	$v0, $v1, 0
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	min_caml_create_float_array
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 128($sp)
	addi	$v0, $v1, 0
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_create_float_array
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	li	$v1, 60
	lw	$a0, 128($sp)
	sw	$v0, 132($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	min_caml_create_array
	addi	$sp, $sp, -140
	lw	$ra, 136($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($v1)
	lw	$v0, 132($sp)
	sw	$v0, 0($v1)
	addi	$v0, $v1, 0
	li	$v1, 0
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 136($sp)
	addi	$v0, $v1, 0
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_create_float_array
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	addi	$v1, $v0, 0
	li	$v0, 0
	sw	$v1, 140($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	min_caml_create_array
	addi	$sp, $sp, -148
	lw	$ra, 144($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($v1)
	lw	$v0, 140($sp)
	sw	$v0, 0($v1)
	addi	$v0, $v1, 0
	li	$v1, 180
	li	$a0, 0
	la	$a1, l.6250
	l.s	$f0, 0($a1)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 12
	s.s	$f0, 8($a1)
	sw	$v0, 4($a1)
	sw	$a0, 0($a1)
	addi	$v0, $a1, 0
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	min_caml_create_array
	addi	$sp, $sp, -148
	lw	$ra, 144($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 144($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_create_array
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 32
	la	$a0, read_screen_settings.3526
	sw	$a0, 0($v1)
	lw	$a0, 20($sp)
	sw	$a0, 28($v1)
	lw	$a1, 4($sp)
	sw	$a1, 24($v1)
	lw	$a2, 112($sp)
	sw	$a2, 20($v1)
	lw	$a3, 108($sp)
	sw	$a3, 16($v1)
	lw	$t0, 104($sp)
	sw	$t0, 12($v1)
	lw	$t1, 16($sp)
	sw	$t1, 8($v1)
	lw	$t1, 0($sp)
	sw	$t1, 4($v1)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 20
	la	$t3, read_light.3598
	sw	$t3, 0($t2)
	sw	$a1, 16($t2)
	lw	$t3, 24($sp)
	sw	$t3, 12($t2)
	sw	$t1, 8($t2)
	lw	$t4, 28($sp)
	sw	$t4, 4($t2)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, read_object.3863
	sw	$t6, 0($t5)
	lw	$t6, 8($sp)
	sw	$t6, 4($t5)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s0, read_all_object.3871
	sw	$s0, 0($t7)
	sw	$t5, 4($t7)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 8
	la	$s0, read_and_network.3902
	sw	$s0, 0($t5)
	lw	$s0, 36($sp)
	sw	$s0, 4($t5)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 24
	la	$s2, read_parameter.3913
	sw	$s2, 0($s1)
	sw	$v1, 20($s1)
	sw	$t2, 16($s1)
	sw	$t5, 12($s1)
	sw	$t7, 8($s1)
	lw	$v1, 44($sp)
	sw	$v1, 4($s1)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$t5, solver_rect_surface.3926
	sw	$t5, 0($t2)
	lw	$t5, 48($sp)
	sw	$t5, 4($t2)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s2, solver_rect.3964
	sw	$s2, 0($t7)
	sw	$t2, 4($t7)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$s2, solver_surface.3985
	sw	$s2, 0($t2)
	sw	$t5, 4($t2)
	addi	$s2, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_second.4068
	sw	$s3, 0($s2)
	sw	$t5, 4($s2)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 20
	la	$s4, solver.4108
	sw	$s4, 0($s3)
	sw	$t2, 16($s3)
	sw	$s2, 12($s3)
	sw	$t7, 8($s3)
	lw	$t2, 12($sp)
	sw	$t2, 4($s3)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s2, solver_rect_fast.4128
	sw	$s2, 0($t7)
	sw	$t5, 4($t7)
	addi	$s2, $gp, 0
	addi	$gp, $gp, 8
	la	$s4, solver_surface_fast.4225
	sw	$s4, 0($s2)
	sw	$t5, 4($s2)
	addi	$s4, $gp, 0
	addi	$gp, $gp, 8
	la	$s5, solver_second_fast.4248
	sw	$s5, 0($s4)
	sw	$t5, 4($s4)
	addi	$s5, $gp, 0
	addi	$gp, $gp, 20
	la	$s6, solver_fast.4294
	sw	$s6, 0($s5)
	sw	$s2, 16($s5)
	sw	$s4, 12($s5)
	sw	$t7, 8($s5)
	sw	$t2, 4($s5)
	addi	$s2, $gp, 0
	addi	$gp, $gp, 8
	la	$s4, solver_surface_fast2.4317
	sw	$s4, 0($s2)
	sw	$t5, 4($s2)
	addi	$s4, $gp, 0
	addi	$gp, $gp, 8
	la	$s6, solver_second_fast2.4335
	sw	$s6, 0($s4)
	sw	$t5, 4($s4)
	addi	$s6, $gp, 0
	addi	$gp, $gp, 20
	la	$s7, solver_fast2.4379
	sw	$s7, 0($s6)
	sw	$s2, 16($s6)
	sw	$s4, 12($s6)
	sw	$t7, 8($s6)
	sw	$t2, 4($s6)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s2, iter_setup_dirvec_constants.4590
	sw	$s2, 0($t7)
	sw	$t2, 4($t7)
	addi	$s2, $gp, 0
	addi	$gp, $gp, 12
	la	$s4, setup_dirvec_constants.4606
	sw	$s4, 0($s2)
	sw	$t6, 8($s2)
	sw	$t7, 4($s2)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s4, setup_startp_constants.4612
	sw	$s4, 0($t7)
	sw	$t2, 4($t7)
	addi	$s4, $gp, 0
	addi	$gp, $gp, 16
	la	$s7, setup_startp.4662
	sw	$s7, 0($s4)
	lw	$s7, 100($sp)
	sw	$s7, 12($s4)
	sw	$t7, 8($s4)
	sw	$t6, 4($s4)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$t8, check_all_inside.4727
	sw	$t8, 0($t7)
	sw	$t2, 4($t7)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 32
	sw	$s1, 148($sp)
	la	$s1, shadow_check_and_group.4741
	sw	$s1, 0($t8)
	sw	$s5, 28($t8)
	sw	$t5, 24($t8)
	sw	$t2, 20($t8)
	lw	$s1, 136($sp)
	sw	$s1, 16($t8)
	sw	$t3, 12($t8)
	sw	$s2, 152($sp)
	lw	$s2, 60($sp)
	sw	$s2, 8($t8)
	sw	$t7, 4($t8)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 12
	la	$a3, shadow_check_one_or_group.4785
	sw	$a3, 0($t6)
	sw	$t8, 8($t6)
	sw	$s0, 4($t6)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 24
	la	$t8, shadow_check_one_or_matrix.4797
	sw	$t8, 0($a3)
	sw	$s5, 20($a3)
	sw	$t5, 16($a3)
	sw	$t6, 12($a3)
	sw	$s1, 8($a3)
	sw	$s2, 4($a3)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 40
	la	$s5, solve_each_element.4825
	sw	$s5, 0($t6)
	lw	$s5, 56($sp)
	sw	$s5, 36($t6)
	lw	$t8, 96($sp)
	sw	$t8, 32($t6)
	sw	$t5, 28($t6)
	sw	$s3, 24($t6)
	sw	$t2, 20($t6)
	lw	$s1, 52($sp)
	sw	$s1, 16($t6)
	sw	$s2, 12($t6)
	lw	$a2, 64($sp)
	sw	$a2, 8($t6)
	sw	$t7, 4($t6)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$a0, solve_one_or_network.4880
	sw	$a0, 0($t0)
	sw	$t6, 8($t0)
	sw	$s0, 4($t0)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 24
	la	$t6, trace_or_matrix.4892
	sw	$t6, 0($a0)
	sw	$s5, 20($a0)
	sw	$t8, 16($a0)
	sw	$t5, 12($a0)
	sw	$s3, 8($a0)
	sw	$t0, 4($a0)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 16
	la	$t6, judge_intersection.4915
	sw	$t6, 0($t0)
	sw	$a0, 12($t0)
	sw	$s5, 8($t0)
	sw	$v1, 4($t0)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 40
	la	$t6, solve_each_element_fast.4930
	sw	$t6, 0($a0)
	sw	$s5, 36($a0)
	sw	$s7, 32($a0)
	sw	$s6, 28($a0)
	sw	$t5, 24($a0)
	sw	$t2, 20($a0)
	sw	$s1, 16($a0)
	sw	$s2, 12($a0)
	sw	$a2, 8($a0)
	sw	$t7, 4($a0)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 12
	la	$t7, solve_one_or_network_fast.4986
	sw	$t7, 0($t6)
	sw	$a0, 8($t6)
	sw	$s0, 4($t6)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 20
	la	$t7, trace_or_matrix_fast.4998
	sw	$t7, 0($a0)
	sw	$s5, 16($a0)
	sw	$s6, 12($a0)
	sw	$t5, 8($a0)
	sw	$t6, 4($a0)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 16
	la	$t6, judge_intersection_fast.5021
	sw	$t6, 0($t5)
	sw	$a0, 12($t5)
	sw	$s5, 8($t5)
	sw	$v1, 4($t5)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, get_nvector_rect.5036
	sw	$t6, 0($a0)
	lw	$t6, 68($sp)
	sw	$t6, 8($a0)
	sw	$s1, 4($a0)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s0, get_nvector_plane.5048
	sw	$s0, 0($t7)
	sw	$t6, 4($t7)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 12
	la	$s3, get_nvector_second.5061
	sw	$s3, 0($s0)
	sw	$t6, 8($s0)
	sw	$s2, 4($s0)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 16
	la	$s6, get_nvector.5116
	sw	$s6, 0($s3)
	sw	$s0, 12($s3)
	sw	$a0, 8($s3)
	sw	$t7, 4($s3)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 16
	la	$t7, utexture.5122
	sw	$t7, 0($a0)
	lw	$t7, 72($sp)
	sw	$t7, 12($a0)
	sw	$a1, 8($a0)
	sw	$t1, 4($a0)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 12
	la	$s6, add_light.5279
	sw	$s6, 0($s0)
	sw	$t7, 8($s0)
	lw	$s6, 80($sp)
	sw	$s6, 4($s0)
	addi	$s7, $gp, 0
	addi	$gp, $gp, 36
	la	$t1, trace_reflections.5305
	sw	$t1, 0($s7)
	sw	$a3, 32($s7)
	lw	$t1, 144($sp)
	sw	$t1, 28($s7)
	sw	$v1, 24($s7)
	sw	$t6, 20($s7)
	sw	$t5, 16($s7)
	sw	$s1, 12($s7)
	sw	$a2, 8($s7)
	sw	$s0, 4($s7)
	addi	$t1, $gp, 0
	addi	$gp, $gp, 84
	la	$a1, trace_ray.5339
	sw	$a1, 0($t1)
	sw	$a0, 80($t1)
	sw	$s7, 76($t1)
	sw	$s5, 72($t1)
	sw	$t7, 68($t1)
	sw	$t8, 64($t1)
	sw	$a3, 60($t1)
	sw	$s4, 56($t1)
	sw	$s6, 52($t1)
	sw	$v1, 48($t1)
	sw	$t2, 44($t1)
	sw	$t6, 40($t1)
	sw	$v0, 36($t1)
	sw	$t3, 32($t1)
	sw	$t0, 28($t1)
	sw	$s1, 24($t1)
	sw	$s2, 20($t1)
	sw	$a2, 16($t1)
	sw	$s3, 12($t1)
	sw	$t4, 8($t1)
	sw	$s0, 4($t1)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 52
	la	$t0, trace_diffuse_ray.5457
	sw	$t0, 0($a1)
	sw	$a0, 48($a1)
	sw	$t7, 44($a1)
	sw	$a3, 40($a1)
	sw	$v1, 36($a1)
	sw	$t2, 32($a1)
	sw	$t6, 28($a1)
	sw	$t3, 24($a1)
	sw	$t5, 20($a1)
	sw	$s2, 16($a1)
	sw	$a2, 12($a1)
	sw	$s3, 8($a1)
	lw	$v1, 76($sp)
	sw	$v1, 4($a1)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 8
	la	$a2, iter_trace_diffuse_rays.5481
	sw	$a2, 0($a0)
	sw	$a1, 4($a0)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 12
	la	$a2, trace_diffuse_rays.5503
	sw	$a2, 0($a1)
	sw	$s4, 8($a1)
	sw	$a0, 4($a1)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$a2, trace_diffuse_ray_80percent.5509
	sw	$a2, 0($a0)
	sw	$a1, 8($a0)
	lw	$a2, 124($sp)
	sw	$a2, 4($a0)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 16
	la	$t0, calc_diffuse_using_1point.5532
	sw	$t0, 0($a3)
	sw	$a0, 12($a3)
	sw	$s6, 8($a3)
	sw	$v1, 4($a3)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$t0, calc_diffuse_using_5points.5546
	sw	$t0, 0($a0)
	sw	$s6, 8($a0)
	sw	$v1, 4($a0)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t4, do_without_neighbors.5579
	sw	$t4, 0($t0)
	sw	$a3, 4($t0)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 8
	la	$t4, neighbors_exist.5592
	sw	$t4, 0($a3)
	lw	$t4, 84($sp)
	sw	$t4, 4($a3)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, try_exploit_neighbors.5630
	sw	$t6, 0($t5)
	sw	$t0, 8($t5)
	sw	$a0, 4($t5)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, write_ppm_header.5650
	sw	$t6, 0($a0)
	sw	$t4, 4($a0)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 8
	la	$t7, write_rgb.5679
	sw	$t7, 0($t6)
	sw	$s6, 4($t6)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, pretrace_diffuse_rays.5695
	sw	$s0, 0($t7)
	sw	$a1, 12($t7)
	sw	$a2, 8($t7)
	sw	$v1, 4($t7)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 40
	la	$a1, pretrace_pixels.5717
	sw	$a1, 0($v1)
	lw	$a1, 20($sp)
	sw	$a1, 36($v1)
	sw	$t1, 32($v1)
	sw	$t8, 28($v1)
	lw	$a1, 104($sp)
	sw	$a1, 24($v1)
	lw	$a1, 92($sp)
	sw	$a1, 20($v1)
	sw	$s6, 16($v1)
	lw	$t1, 116($sp)
	sw	$t1, 12($v1)
	sw	$t7, 8($v1)
	lw	$t1, 88($sp)
	sw	$t1, 4($v1)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 28
	la	$s0, pretrace_line.5771
	sw	$s0, 0($t7)
	lw	$s0, 112($sp)
	sw	$s0, 24($t7)
	lw	$s0, 108($sp)
	sw	$s0, 20($t7)
	sw	$a1, 16($t7)
	sw	$v1, 12($t7)
	sw	$t4, 8($t7)
	sw	$t1, 4($t7)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 28
	la	$s0, scan_pixel.5804
	sw	$s0, 0($v1)
	sw	$t6, 24($v1)
	sw	$t5, 20($v1)
	sw	$s6, 16($v1)
	sw	$a3, 12($v1)
	sw	$t4, 8($v1)
	sw	$t0, 4($v1)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 16
	la	$t0, scan_line.5825
	sw	$t0, 0($a3)
	sw	$v1, 12($a3)
	sw	$t7, 8($a3)
	sw	$t4, 4($a3)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	la	$t0, create_pixelline.5904
	sw	$t0, 0($v1)
	sw	$t4, 4($v1)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$t5, tan.5915
	sw	$t5, 0($t0)
	lw	$t5, 4($sp)
	sw	$t5, 8($t0)
	lw	$t5, 0($sp)
	sw	$t5, 4($t0)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, adjust_position.5919
	sw	$t6, 0($t5)
	sw	$t0, 4($t5)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, calc_dirvec.5931
	sw	$t6, 0($t0)
	sw	$a2, 8($t0)
	sw	$t5, 4($t0)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, calc_dirvecs.5991
	sw	$t6, 0($t5)
	sw	$t0, 4($t5)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, calc_dirvec_rows.6021
	sw	$t6, 0($t0)
	sw	$t5, 4($t0)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, create_dirvec.6039
	sw	$t6, 0($t5)
	lw	$t6, 8($sp)
	sw	$t6, 4($t5)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, create_dirvec_elements.6047
	sw	$s1, 0($s0)
	sw	$t5, 4($s0)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 16
	la	$s2, create_dirvecs.6056
	sw	$s2, 0($s1)
	sw	$a2, 12($s1)
	sw	$s0, 8($s1)
	sw	$t5, 4($s1)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s2, init_dirvec_constants.6069
	sw	$s2, 0($s0)
	lw	$s2, 152($sp)
	sw	$s2, 4($s0)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 12
	la	$s4, init_vecset_constants.6077
	sw	$s4, 0($s3)
	sw	$s0, 8($s3)
	sw	$a2, 4($s3)
	addi	$a2, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, init_dirvecs.6085
	sw	$s0, 0($a2)
	sw	$s3, 12($a2)
	sw	$s1, 8($a2)
	sw	$t0, 4($a2)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, add_reflection.6094
	sw	$s0, 0($t0)
	sw	$s2, 12($t0)
	lw	$s0, 144($sp)
	sw	$s0, 8($t0)
	sw	$t5, 4($t0)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, setup_rect_reflection.6107
	sw	$s0, 0($t5)
	sw	$v0, 12($t5)
	sw	$t3, 8($t5)
	sw	$t0, 4($t5)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 16
	la	$s1, setup_surface_reflection.6148
	sw	$s1, 0($s0)
	sw	$v0, 12($s0)
	sw	$t3, 8($s0)
	sw	$t0, 4($s0)
	addi	$v0, $gp, 0
	addi	$gp, $gp, 16
	la	$t0, setup_reflections.6187
	sw	$t0, 0($v0)
	sw	$s0, 12($v0)
	sw	$t5, 8($v0)
	sw	$t2, 4($v0)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 60
	la	$t0, rt.6200
	sw	$t0, 0($t8)
	sw	$a0, 56($t8)
	sw	$v0, 52($t8)
	sw	$s2, 48($t8)
	sw	$a1, 44($t8)
	sw	$a3, 40($t8)
	lw	$v0, 148($sp)
	sw	$v0, 36($t8)
	sw	$t7, 32($t8)
	sw	$t6, 28($t8)
	lw	$v0, 136($sp)
	sw	$v0, 24($t8)
	sw	$t3, 20($t8)
	sw	$a2, 16($t8)
	sw	$t4, 12($t8)
	sw	$t1, 8($t8)
	sw	$v1, 4($t8)
	li	$v0, 512
	li	$v1, 512
	sw	$ra, 156($sp)
	addi	$sp, $sp, 160
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -160
	lw	$ra, 156($sp)
	addi	$sp, $fp, 0
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	li	$v0, 0
	li	$v0, 10
	syscall
fact.2552:
	li	$v1, 2
	bgt	$v1, $v0, ble_else.8851
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	fact.2552
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	mult	$v1, $v0
	mflo	 $v0
	jr	$ra
ble_else.8851:
	li	$v0, 1
	jr	$ra
pow.2558:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8852
	la	$v0, l.6248
	l.s	$f0, 0($v0)
	jr	$ra
beq_else.8852:
	addi	$v0, $v0, -1
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	pow.2558
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	l.s	$f2, 0($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
even.2565:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8853
	li	$v0, 1
	jr	$ra
beq_else.8853:
	li	$v1, 1
	bne	$v0, $v1, beq_else.8854
	li	$v0, 0
	jr	$ra
beq_else.8854:
	addi	$v0, $v0, -2
	j	even.2565
g.2580:
	l.s	$f0, 4($t8)
	sll	$v1, $v0, 1
	addi	$v1, $v1, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	pow.2558
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	fact.2552
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	even.2565
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8855
	l.s	$f0, 12($sp)
	j	min_caml_fneg
beq_else.8855:
	l.s	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
sin.2571:
	l.s	$f2, 4($t8)
	la	$v0, l.6250
	l.s	$f4, 0($v0)
	sw	$t8, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f0, 8($sp)
	mov.s	$f2, $f4
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8856
	la	$v0, l.6252
	l.s	$f0, 0($v0)
	l.s	$f2, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8857
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, g.2580
	sw	$v0, 0($t8)
	l.s	$f0, 8($sp)
	s.s	$f0, 4($t8)
	li	$v0, 0
	sw	$t8, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v0, 1
	lw	$t8, 12($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 2
	lw	$t8, 12($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 3
	lw	$t8, 12($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 4
	lw	$t8, 12($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 5
	lw	$t8, 12($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 6
	lw	$t8, 12($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 7
	lw	$t8, 12($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 40($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 8
	lw	$t8, 12($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 9
	lw	$t8, 12($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
beq_else.8857:
	l.s	$f0, 4($sp)
	l.s	$f2, 8($sp)
	sub.s	$f0, $f0, $f2
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8856:
	l.s	$f0, 8($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$t8, 0($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	j	min_caml_fneg
g.2632:
	l.s	$f0, 4($t8)
	sll	$v1, $v0, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	pow.2558
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	fact.2552
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	even.2565
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8858
	l.s	$f0, 12($sp)
	j	min_caml_fneg
beq_else.8858:
	l.s	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
cos.2623:
	l.s	$f2, 4($t8)
	la	$v0, l.6250
	l.s	$f4, 0($v0)
	sw	$t8, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f0, 8($sp)
	mov.s	$f2, $f4
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8859
	la	$v0, l.6252
	l.s	$f0, 0($v0)
	l.s	$f2, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8860
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, g.2632
	sw	$v0, 0($t8)
	l.s	$f0, 8($sp)
	s.s	$f0, 4($t8)
	li	$v0, 0
	sw	$t8, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v0, 1
	lw	$t8, 12($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 2
	lw	$t8, 12($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 3
	lw	$t8, 12($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 4
	lw	$t8, 12($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 5
	lw	$t8, 12($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 6
	lw	$t8, 12($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 7
	lw	$t8, 12($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 40($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 8
	lw	$t8, 12($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 9
	lw	$t8, 12($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
beq_else.8860:
	l.s	$f0, 4($sp)
	l.s	$f2, 8($sp)
	sub.s	$f0, $f0, $f2
	lw	$t8, 0($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	j	min_caml_fneg
beq_else.8859:
	l.s	$f0, 8($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
g.2680:
	la	$v1, l.6262
	l.s	$f0, 0($v1)
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_float_of_int
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	mul.s	$f0, $f2, $f0
	la	$v0, l.6262
	l.s	$f2, 0($v0)
	lw	$v0, 0($sp)
	s.s	$f0, 8($sp)
	s.s	$f2, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_float_of_int
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	mul.s	$f0, $f2, $f0
	la	$v0, l.6248
	l.s	$f2, 0($v0)
	add.s	$f0, $f0, $f2
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	jr	$ra
hoge.2690:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8861
	la	$v0, l.6248
	l.s	$f0, 0($v0)
	jr	$ra
beq_else.8861:
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	hoge.2690
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	g.2680
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
f.2678:
	l.s	$f0, 4($t8)
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	hoge.2690
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v0, 2
	l.s	$f2, 4($sp)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	pow.2558
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	la	$v0, l.6248
	l.s	$f2, 0($v0)
	li	$v0, 2
	l.s	$f4, 4($sp)
	s.s	$f0, 12($sp)
	s.s	$f2, 16($sp)
	mov.s	$f0, $f4
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	pow.2558
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 12($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	pow.2558
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 8($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
atan.2673:
	la	$v0, l.6248
	l.s	$f2, 0($v0)
	s.s	$f0, 0($sp)
	mov.s	$f30, $f2
	mov.s	$f2, $f0
	mov.s	$f0, $f30
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fless
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8862
	addi	$v0, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, f.2678
	sw	$v1, 0($v0)
	l.s	$f0, 0($sp)
	s.s	$f0, 4($v0)
	la	$v1, l.6248
	l.s	$f2, 0($v1)
	li	$v1, 2
	sw	$v0, 4($sp)
	s.s	$f2, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	pow.2558
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 0($sp)
	div.s	$f0, $f2, $f0
	li	$v0, 0
	lw	$t8, 4($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v0, 1
	lw	$t8, 4($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 2
	lw	$t8, 4($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 3
	lw	$t8, 4($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 4
	lw	$t8, 4($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 5
	lw	$t8, 4($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 6
	lw	$t8, 4($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 7
	lw	$t8, 4($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 40($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 8
	lw	$t8, 4($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 9
	lw	$t8, 4($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 10
	lw	$t8, 4($sp)
	s.s	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 52($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 11
	lw	$t8, 4($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 56($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 12
	lw	$t8, 4($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 60($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 13
	lw	$t8, 4($sp)
	s.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	l.s	$f2, 64($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 14
	lw	$t8, 4($sp)
	s.s	$f0, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f2, 68($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 15
	lw	$t8, 4($sp)
	s.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	l.s	$f2, 72($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 16
	lw	$t8, 4($sp)
	s.s	$f0, 76($sp)
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -84
	lw	$ra, 80($sp)
	l.s	$f2, 76($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 17
	lw	$t8, 4($sp)
	s.s	$f0, 80($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	l.s	$f2, 80($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 18
	lw	$t8, 4($sp)
	s.s	$f0, 84($sp)
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -92
	lw	$ra, 88($sp)
	l.s	$f2, 84($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 19
	lw	$t8, 4($sp)
	s.s	$f0, 88($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	l.s	$f2, 88($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 12($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
beq_else.8862:
	la	$v0, l.6252
	l.s	$f0, 0($v0)
	la	$v0, l.6248
	l.s	$f2, 0($v0)
	l.s	$f4, 0($sp)
	div.s	$f2, $f2, $f4
	s.s	$f0, 92($sp)
	mov.s	$f0, $f2
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	atan.2673
	addi	$sp, $sp, -100
	lw	$ra, 96($sp)
	l.s	$f2, 92($sp)
	sub.s	$f0, $f2, $f0
	jr	$ra
sgn.2900:
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fiszero
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8863
	l.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fispos
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8864
	la	$v0, l.6275
	l.s	$f0, 0($v0)
	jr	$ra
beq_else.8864:
	la	$v0, l.6248
	l.s	$f0, 0($v0)
	jr	$ra
beq_else.8863:
	la	$v0, l.6250
	l.s	$f0, 0($v0)
	jr	$ra
fneg_cond.2906:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8865
	j	min_caml_fneg
beq_else.8865:
	mov.s	$f0, $f0
	jr	$ra
add_mod5.2910:
	add	$v0, $v0, $v1
	li	$v1, 5
	bgt	$v1, $v0, ble_else.8866
	addi	$v0, $v0, -5
	jr	$ra
ble_else.8866:
	jr	$ra
vecset.2916:
	s.s	$f0, 0($v0)
	s.s	$f2, 4($v0)
	s.s	$f4, 8($v0)
	jr	$ra
vecfill.2926:
	s.s	$f0, 0($v0)
	s.s	$f0, 4($v0)
	s.s	$f0, 8($v0)
	jr	$ra
vecbzero.2934:
	la	$v1, l.6250
	l.s	$f0, 0($v1)
	j	vecfill.2926
veccpy.2937:
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	l.s	$f0, 4($v1)
	s.s	$f0, 4($v0)
	l.s	$f0, 8($v1)
	s.s	$f0, 8($v0)
	jr	$ra
vecunit_sgn.2951:
	l.s	$f0, 0($v0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fsqr
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	l.s	$f2, 4($v0)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fsqr
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	l.s	$f2, 8($v0)
	s.s	$f0, 12($sp)
	mov.s	$f0, $f2
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fsqr
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_sqrt
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fiszero
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8870
	li	$v0, 0
	lw	$v1, 0($sp)
	bne	$v1, $v0, beq_else.8872
	la	$v0, l.6248
	l.s	$f0, 0($v0)
	l.s	$f2, 16($sp)
	div.s	$f0, $f0, $f2
	b	beq_cont.8873
beq_else.8872:
	la	$v0, l.6275
	l.s	$f0, 0($v0)
	l.s	$f2, 16($sp)
	div.s	$f0, $f0, $f2
beq_cont.8873:
	b	beq_cont.8871
beq_else.8870:
	la	$v0, l.6248
	l.s	$f0, 0($v0)
beq_cont.8871:
	lw	$v0, 4($sp)
	l.s	$f2, 0($v0)
	mul.s	$f2, $f2, $f0
	s.s	$f2, 0($v0)
	l.s	$f2, 4($v0)
	mul.s	$f2, $f2, $f0
	s.s	$f2, 4($v0)
	l.s	$f2, 8($v0)
	mul.s	$f0, $f2, $f0
	s.s	$f0, 8($v0)
	jr	$ra
veciprod.2986:
	l.s	$f0, 0($v0)
	l.s	$f2, 0($v1)
	mul.s	$f0, $f0, $f2
	l.s	$f2, 4($v0)
	l.s	$f4, 4($v1)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	l.s	$f2, 8($v0)
	l.s	$f4, 8($v1)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	jr	$ra
veciprod2.3005:
	l.s	$f6, 0($v0)
	mul.s	$f0, $f6, $f0
	l.s	$f6, 4($v0)
	mul.s	$f2, $f6, $f2
	add.s	$f0, $f0, $f2
	l.s	$f2, 8($v0)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	jr	$ra
vecaccum.3020:
	l.s	$f2, 0($v0)
	l.s	$f4, 0($v1)
	mul.s	$f4, $f0, $f4
	add.s	$f2, $f2, $f4
	s.s	$f2, 0($v0)
	l.s	$f2, 4($v0)
	l.s	$f4, 4($v1)
	mul.s	$f4, $f0, $f4
	add.s	$f2, $f2, $f4
	s.s	$f2, 4($v0)
	l.s	$f2, 8($v0)
	l.s	$f4, 8($v1)
	mul.s	$f0, $f0, $f4
	add.s	$f0, $f2, $f0
	s.s	$f0, 8($v0)
	jr	$ra
vecadd.3047:
	l.s	$f0, 0($v0)
	l.s	$f2, 0($v1)
	add.s	$f0, $f0, $f2
	s.s	$f0, 0($v0)
	l.s	$f0, 4($v0)
	l.s	$f2, 4($v1)
	add.s	$f0, $f0, $f2
	s.s	$f0, 4($v0)
	l.s	$f0, 8($v0)
	l.s	$f2, 8($v1)
	add.s	$f0, $f0, $f2
	s.s	$f0, 8($v0)
	jr	$ra
vecscale.3070:
	l.s	$f2, 0($v0)
	mul.s	$f2, $f2, $f0
	s.s	$f2, 0($v0)
	l.s	$f2, 4($v0)
	mul.s	$f2, $f2, $f0
	s.s	$f2, 4($v0)
	l.s	$f2, 8($v0)
	mul.s	$f0, $f2, $f0
	s.s	$f0, 8($v0)
	jr	$ra
vecaccumv.3087:
	l.s	$f0, 0($v0)
	l.s	$f2, 0($v1)
	l.s	$f4, 0($a0)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	s.s	$f0, 0($v0)
	l.s	$f0, 4($v0)
	l.s	$f2, 4($v1)
	l.s	$f4, 4($a0)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	s.s	$f0, 4($v0)
	l.s	$f0, 8($v0)
	l.s	$f2, 8($v1)
	l.s	$f4, 8($a0)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	s.s	$f0, 8($v0)
	jr	$ra
o_texturetype.3120:
	lw	$v0, 0($v0)
	jr	$ra
o_form.3133:
	lw	$v0, 4($v0)
	jr	$ra
o_reflectiontype.3146:
	lw	$v0, 8($v0)
	jr	$ra
o_isinvert.3159:
	lw	$v0, 24($v0)
	jr	$ra
o_isrot.3172:
	lw	$v0, 12($v0)
	jr	$ra
o_param_a.3185:
	lw	$v0, 16($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_param_b.3199:
	lw	$v0, 16($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_param_c.3213:
	lw	$v0, 16($v0)
	l.s	$f0, 8($v0)
	jr	$ra
o_param_abc.3227:
	lw	$v0, 16($v0)
	jr	$ra
o_param_x.3240:
	lw	$v0, 20($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_param_y.3254:
	lw	$v0, 20($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_param_z.3268:
	lw	$v0, 20($v0)
	l.s	$f0, 8($v0)
	jr	$ra
o_diffuse.3282:
	lw	$v0, 28($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_hilight.3296:
	lw	$v0, 28($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_color_red.3310:
	lw	$v0, 32($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_color_green.3324:
	lw	$v0, 32($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_color_blue.3338:
	lw	$v0, 32($v0)
	l.s	$f0, 8($v0)
	jr	$ra
o_param_r1.3352:
	lw	$v0, 36($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_param_r2.3366:
	lw	$v0, 36($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_param_r3.3380:
	lw	$v0, 36($v0)
	l.s	$f0, 8($v0)
	jr	$ra
o_param_ctbl.3394:
	lw	$v0, 40($v0)
	jr	$ra
p_rgb.3407:
	lw	$v0, 0($v0)
	jr	$ra
p_intersection_points.3417:
	lw	$v0, 4($v0)
	jr	$ra
p_surface_ids.3427:
	lw	$v0, 8($v0)
	jr	$ra
p_calc_diffuse.3437:
	lw	$v0, 12($v0)
	jr	$ra
p_energy.3447:
	lw	$v0, 16($v0)
	jr	$ra
p_received_ray_20percent.3457:
	lw	$v0, 20($v0)
	jr	$ra
p_group_id.3467:
	lw	$v0, 24($v0)
	lw	$v0, 0($v0)
	jr	$ra
p_set_group_id.3478:
	lw	$v0, 24($v0)
	sw	$v1, 0($v0)
	jr	$ra
p_nvectors.3490:
	lw	$v0, 28($v0)
	jr	$ra
d_vec.3500:
	lw	$v0, 0($v0)
	jr	$ra
d_const.3504:
	lw	$v0, 4($v0)
	jr	$ra
r_surface_id.3508:
	lw	$v0, 0($v0)
	jr	$ra
r_dvec.3513:
	lw	$v0, 4($v0)
	jr	$ra
r_bright.3518:
	l.s	$f0, 8($v0)
	mov.s	$f0, $f0
	jr	$ra
rad.3523:
	la	$v0, l.6365
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	jr	$ra
read_screen_settings.3526:
	lw	$v0, 28($t8)
	lw	$v1, 24($t8)
	lw	$a0, 20($t8)
	lw	$a1, 16($t8)
	lw	$a2, 12($t8)
	lw	$a3, 8($t8)
	lw	$t0, 4($t8)
	la	$t1, l.6367
	l.s	$f0, 0($t1)
	s.s	$f0, 0($a3)
	la	$t1, l.6370
	l.s	$f0, 0($t1)
	s.s	$f0, 4($a3)
	la	$t1, l.6373
	l.s	$f0, 0($t1)
	s.s	$f0, 8($a3)
	la	$t1, l.6376
	l.s	$f0, 0($t1)
	sw	$v0, 0($sp)
	sw	$a3, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$a0, 16($sp)
	sw	$v1, 20($sp)
	sw	$t0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	rad.3523
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$t8, 24($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$t8, 20($sp)
	l.s	$f2, 28($sp)
	s.s	$f0, 32($sp)
	mov.s	$f0, $f2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	la	$v0, l.6378
	l.s	$f2, 0($v0)
	s.s	$f0, 36($sp)
	mov.s	$f0, $f2
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	rad.3523
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	lw	$t8, 24($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$t8, 20($sp)
	l.s	$f2, 40($sp)
	s.s	$f0, 44($sp)
	mov.s	$f0, $f2
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 32($sp)
	mul.s	$f4, $f2, $f0
	la	$v0, l.6380
	l.s	$f6, 0($v0)
	mul.s	$f4, $f4, $f6
	lw	$v0, 16($sp)
	s.s	$f4, 0($v0)
	la	$v1, l.6383
	l.s	$f4, 0($v1)
	l.s	$f6, 36($sp)
	mul.s	$f4, $f6, $f4
	s.s	$f4, 4($v0)
	l.s	$f4, 44($sp)
	mul.s	$f8, $f2, $f4
	la	$v1, l.6380
	l.s	$f10, 0($v1)
	mul.s	$f8, $f8, $f10
	s.s	$f8, 8($v0)
	lw	$v1, 12($sp)
	s.s	$f4, 0($v1)
	la	$a0, l.6250
	l.s	$f8, 0($a0)
	s.s	$f8, 4($v1)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 8($v0)
	l.s	$f0, 36($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 8($sp)
	s.s	$f0, 0($v0)
	l.s	$f0, 32($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 4($v0)
	l.s	$f0, 36($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 44($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 8($sp)
	s.s	$f0, 8($v0)
	lw	$v0, 4($sp)
	l.s	$f0, 0($v0)
	lw	$v1, 16($sp)
	l.s	$f2, 0($v1)
	sub.s	$f0, $f0, $f2
	lw	$a0, 0($sp)
	s.s	$f0, 0($a0)
	l.s	$f0, 4($v0)
	l.s	$f2, 4($v1)
	sub.s	$f0, $f0, $f2
	s.s	$f0, 4($a0)
	l.s	$f0, 8($v0)
	l.s	$f2, 8($v1)
	sub.s	$f0, $f0, $f2
	s.s	$f0, 8($a0)
	jr	$ra
read_light.3598:
	lw	$v0, 16($t8)
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	la	$a2, l.6404
	l.s	$f0, 0($a2)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$v1, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	rad.3523
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$t8, 12($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fneg
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 4($v0)
	la	$v1, l.6404
	l.s	$f0, 0($v1)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	rad.3523
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$t8, 4($sp)
	l.s	$f2, 16($sp)
	s.s	$f0, 20($sp)
	mov.s	$f0, $f2
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$t8, 12($sp)
	l.s	$f2, 20($sp)
	s.s	$f0, 24($sp)
	mov.s	$f0, $f2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 0($v0)
	lw	$t8, 4($sp)
	l.s	$f0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 8($v0)
	la	$v0, l.6410
	l.s	$f0, 0($v0)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	jr	$ra
read_nth_object.3733:
	li	$v0, 0
	jr	$ra
read_object.3863:
	lw	$v1, 4($t8)
	li	$a0, 60
	bgt	$a0, $v0, ble_else.8882
	jr	$ra
ble_else.8882:
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$v0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_nth_object.3733
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8884
	lw	$v0, 8($sp)
	lw	$v1, 4($sp)
	sw	$v0, 0($v1)
	jr	$ra
beq_else.8884:
	lw	$v0, 8($sp)
	addi	$v0, $v0, 1
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
read_all_object.3871:
	lw	$t8, 4($t8)
	li	$v0, 0
	lw	$s7, ($t8)
	jr	$s7
read_net_item.3874:
	addi	$v0, $v0, 1
	li	$v1, -1
	j	min_caml_create_array
read_or_network.3888:
	li	$v1, 0
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	read_net_item.3874
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$v1, $v0, 0
	lw	$v0, 0($v1)
	li	$a0, -1
	bne	$v0, $a0, beq_else.8886
	lw	$v0, 0($sp)
	addi	$v0, $v0, 1
	j	min_caml_create_array
beq_else.8886:
	lw	$v0, 0($sp)
	addi	$a0, $v0, 1
	sw	$v1, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	read_or_network.3888
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 0($sp)
	sll	$v1, $v1, 2
	lw	$a0, 4($sp)
	add	$t9, $v0, $v1
	sw	$a0, ($t9)
	jr	$ra
read_and_network.3902:
	lw	$v1, 4($t8)
	li	$a0, 0
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$v0, 8($sp)
	addi	$v0, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_net_item.3874
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v1, 0($v0)
	li	$a0, -1
	bne	$v1, $a0, beq_else.8887
	jr	$ra
beq_else.8887:
	lw	$v1, 8($sp)
	sll	$a0, $v1, 2
	lw	$a1, 4($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	addi	$v0, $v1, 1
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
read_parameter.3913:
	lw	$v0, 20($t8)
	lw	$v1, 16($t8)
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sw	$a2, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	sw	$v1, 12($sp)
	addi	$t8, $v0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$t8, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$t8, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v0, 0
	lw	$t8, 4($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	read_or_network.3888
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v1, 0($sp)
	sw	$v0, 0($v1)
	jr	$ra
solver_rect_surface.3926:
	lw	$a3, 4($t8)
	sll	$t0, $a0, 2
	add	$t9, $v1, $t0
	l.s	$f6, ($t9)
	sw	$a3, 0($sp)
	s.s	$f4, 4($sp)
	sw	$a2, 8($sp)
	s.s	$f2, 12($sp)
	sw	$a1, 16($sp)
	s.s	$f0, 20($sp)
	sw	$v1, 24($sp)
	sw	$a0, 28($sp)
	sw	$v0, 32($sp)
	mov.s	$f0, $f6
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fiszero
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8890
	lw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.3227
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v1, 32($sp)
	sw	$v0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isinvert.3159
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	lw	$v1, 28($sp)
	sll	$a0, $v1, 2
	lw	$a1, 24($sp)
	add	$t9, $a1, $a0
	l.s	$f0, ($t9)
	sw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fisneg
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	addi	$v1, $v0, 0
	lw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_xor
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v1, 28($sp)
	sll	$a0, $v1, 2
	lw	$a1, 36($sp)
	add	$t9, $a1, $a0
	l.s	$f0, ($t9)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	fneg_cond.2906
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 20($sp)
	sub.s	$f0, $f0, $f2
	lw	$v0, 28($sp)
	sll	$v0, $v0, 2
	lw	$v1, 24($sp)
	add	$t9, $v1, $v0
	l.s	$f2, ($t9)
	div.s	$f0, $f0, $f2
	lw	$v0, 16($sp)
	sll	$a0, $v0, 2
	add	$t9, $v1, $a0
	l.s	$f2, ($t9)
	mul.s	$f2, $f0, $f2
	l.s	$f4, 12($sp)
	add.s	$f2, $f2, $f4
	s.s	$f0, 44($sp)
	mov.s	$f0, $f2
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fabs
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	lw	$v0, 16($sp)
	sll	$v0, $v0, 2
	lw	$v1, 36($sp)
	add	$t9, $v1, $v0
	l.s	$f2, ($t9)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fless
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8891
	li	$v0, 0
	jr	$ra
beq_else.8891:
	lw	$v0, 8($sp)
	sll	$v1, $v0, 2
	lw	$a0, 24($sp)
	add	$t9, $a0, $v1
	l.s	$f0, ($t9)
	l.s	$f2, 44($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 4($sp)
	add.s	$f0, $f0, $f4
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fabs
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	lw	$v0, 8($sp)
	sll	$v0, $v0, 2
	lw	$v1, 36($sp)
	add	$t9, $v1, $v0
	l.s	$f2, ($t9)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fless
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8892
	li	$v0, 0
	jr	$ra
beq_else.8892:
	l.s	$f0, 44($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
beq_else.8890:
	li	$v0, 0
	jr	$ra
solver_rect.3964:
	lw	$t8, 4($t8)
	li	$a0, 0
	li	$a1, 1
	li	$a2, 2
	s.s	$f0, 0($sp)
	s.s	$f4, 4($sp)
	s.s	$f2, 8($sp)
	sw	$v1, 12($sp)
	sw	$v0, 16($sp)
	sw	$t8, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8893
	li	$a0, 1
	li	$a1, 2
	li	$a2, 0
	lw	$t8, 20($sp)
	lw	$v0, 16($sp)
	lw	$v1, 12($sp)
	l.s	$f0, 8($sp)
	l.s	$f2, 4($sp)
	l.s	$f4, 0($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8894
	li	$a0, 2
	li	$a1, 0
	li	$a2, 1
	lw	$t8, 20($sp)
	lw	$v0, 16($sp)
	lw	$v1, 12($sp)
	l.s	$f0, 4($sp)
	l.s	$f2, 0($sp)
	l.s	$f4, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8895
	li	$v0, 0
	jr	$ra
beq_else.8895:
	li	$v0, 3
	jr	$ra
beq_else.8894:
	li	$v0, 2
	jr	$ra
beq_else.8893:
	li	$v0, 1
	jr	$ra
solver_surface.3985:
	lw	$a0, 4($t8)
	sw	$a0, 0($sp)
	s.s	$f4, 4($sp)
	s.s	$f2, 8($sp)
	s.s	$f0, 12($sp)
	sw	$v1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_abc.3227
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$v1, $v0, 0
	lw	$v0, 16($sp)
	sw	$v1, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	veciprod.2986
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fispos
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8896
	li	$v0, 0
	jr	$ra
beq_else.8896:
	lw	$v0, 20($sp)
	l.s	$f0, 12($sp)
	l.s	$f2, 8($sp)
	l.s	$f4, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	veciprod2.3005
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fneg
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	div.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
quadratic.4000:
	s.s	$f0, 0($sp)
	s.s	$f4, 4($sp)
	s.s	$f2, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fsqr
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_a.3185
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 8($sp)
	s.s	$f0, 20($sp)
	mov.s	$f0, $f2
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fsqr
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_b.3199
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 4($sp)
	s.s	$f0, 28($sp)
	mov.s	$f0, $f2
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fsqr
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.3213
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 28($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 12($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isrot.3172
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8897
	l.s	$f0, 36($sp)
	mov.s	$f0, $f0
	jr	$ra
beq_else.8897:
	l.s	$f0, 8($sp)
	l.s	$f2, 4($sp)
	mul.s	$f4, $f0, $f2
	lw	$v0, 12($sp)
	s.s	$f4, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_r1.3352
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 40($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 4($sp)
	l.s	$f4, 0($sp)
	mul.s	$f2, $f2, $f4
	lw	$v0, 12($sp)
	s.s	$f0, 44($sp)
	s.s	$f2, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r2.3366
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 44($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 0($sp)
	l.s	$f4, 8($sp)
	mul.s	$f2, $f2, $f4
	lw	$v0, 12($sp)
	s.s	$f0, 52($sp)
	s.s	$f2, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_r3.3380
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 56($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 52($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
bilinear.4029:
	mul.s	$f12, $f0, $f6
	s.s	$f6, 0($sp)
	s.s	$f0, 4($sp)
	s.s	$f10, 8($sp)
	s.s	$f4, 12($sp)
	sw	$v0, 16($sp)
	s.s	$f8, 20($sp)
	s.s	$f2, 24($sp)
	s.s	$f12, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_a.3185
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 24($sp)
	l.s	$f4, 20($sp)
	mul.s	$f6, $f2, $f4
	lw	$v0, 16($sp)
	s.s	$f0, 32($sp)
	s.s	$f6, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_b.3199
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 32($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 12($sp)
	l.s	$f4, 8($sp)
	mul.s	$f6, $f2, $f4
	lw	$v0, 16($sp)
	s.s	$f0, 40($sp)
	s.s	$f6, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_c.3213
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 40($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isrot.3172
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8898
	l.s	$f0, 48($sp)
	mov.s	$f0, $f0
	jr	$ra
beq_else.8898:
	l.s	$f0, 12($sp)
	l.s	$f2, 20($sp)
	mul.s	$f4, $f0, $f2
	l.s	$f6, 24($sp)
	l.s	$f8, 8($sp)
	mul.s	$f10, $f6, $f8
	add.s	$f4, $f4, $f10
	lw	$v0, 16($sp)
	s.s	$f4, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r1.3352
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 52($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 4($sp)
	l.s	$f4, 8($sp)
	mul.s	$f4, $f2, $f4
	l.s	$f6, 12($sp)
	l.s	$f8, 0($sp)
	mul.s	$f6, $f6, $f8
	add.s	$f4, $f4, $f6
	lw	$v0, 16($sp)
	s.s	$f0, 56($sp)
	s.s	$f4, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_param_r2.3366
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 60($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 56($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 4($sp)
	l.s	$f4, 20($sp)
	mul.s	$f2, $f2, $f4
	l.s	$f4, 24($sp)
	l.s	$f6, 0($sp)
	mul.s	$f4, $f4, $f6
	add.s	$f2, $f2, $f4
	lw	$v0, 16($sp)
	s.s	$f0, 64($sp)
	s.s	$f2, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	o_param_r3.3380
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f2, 68($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 64($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_fhalf
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f2, 48($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
solver_second.4068:
	lw	$a0, 4($t8)
	l.s	$f6, 0($v1)
	l.s	$f8, 4($v1)
	l.s	$f10, 8($v1)
	sw	$a0, 0($sp)
	s.s	$f4, 4($sp)
	s.s	$f2, 8($sp)
	s.s	$f0, 12($sp)
	sw	$v0, 16($sp)
	sw	$v1, 20($sp)
	mov.s	$f4, $f10
	mov.s	$f2, $f8
	mov.s	$f0, $f6
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	quadratic.4000
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8899
	lw	$v0, 20($sp)
	l.s	$f0, 0($v0)
	l.s	$f2, 4($v0)
	l.s	$f4, 8($v0)
	lw	$v0, 16($sp)
	l.s	$f6, 12($sp)
	l.s	$f8, 8($sp)
	l.s	$f10, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	bilinear.4029
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 16($sp)
	l.s	$f2, 12($sp)
	l.s	$f4, 8($sp)
	l.s	$f6, 4($sp)
	s.s	$f0, 28($sp)
	mov.s	$f0, $f2
	mov.s	$f2, $f4
	mov.s	$f4, $f6
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	quadratic.4000
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 16($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_form.3133
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.8900
	la	$v0, l.6248
	l.s	$f0, 0($v0)
	l.s	$f2, 32($sp)
	sub.s	$f0, $f2, $f0
	b	beq_cont.8901
beq_else.8900:
	l.s	$f0, 32($sp)
	mov.s	$f0, $f0
beq_cont.8901:
	l.s	$f2, 28($sp)
	s.s	$f0, 36($sp)
	mov.s	$f0, $f2
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fsqr
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 24($sp)
	l.s	$f4, 36($sp)
	mul.s	$f4, $f2, $f4
	sub.s	$f0, $f0, $f4
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fispos
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8902
	li	$v0, 0
	jr	$ra
beq_else.8902:
	l.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 16($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_isinvert.3159
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8903
	l.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fneg
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	b	beq_cont.8904
beq_else.8903:
	l.s	$f0, 44($sp)
	mov.s	$f0, $f0
beq_cont.8904:
	l.s	$f2, 28($sp)
	sub.s	$f0, $f0, $f2
	l.s	$f2, 24($sp)
	div.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
beq_else.8899:
	li	$v0, 0
	jr	$ra
solver.4108:
	lw	$a1, 16($t8)
	lw	$a2, 12($t8)
	lw	$a3, 8($t8)
	lw	$t0, 4($t8)
	sll	$v0, $v0, 2
	add	$t9, $t0, $v0
	lw	$v0, ($t9)
	l.s	$f0, 0($a0)
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$v1, 8($sp)
	sw	$a3, 12($sp)
	sw	$v0, 16($sp)
	sw	$a0, 20($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.3240
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 20($sp)
	l.s	$f2, 4($v0)
	lw	$v1, 16($sp)
	s.s	$f0, 28($sp)
	s.s	$f2, 32($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_y.3254
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 20($sp)
	l.s	$f2, 8($v0)
	lw	$v0, 16($sp)
	s.s	$f0, 36($sp)
	s.s	$f2, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_z.3268
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 40($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_form.3133
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8905
	lw	$t8, 12($sp)
	lw	$v0, 16($sp)
	lw	$v1, 8($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 36($sp)
	l.s	$f4, 44($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8905:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8906
	lw	$t8, 4($sp)
	lw	$v0, 16($sp)
	lw	$v1, 8($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 36($sp)
	l.s	$f4, 44($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8906:
	lw	$t8, 0($sp)
	lw	$v0, 16($sp)
	lw	$v1, 8($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 36($sp)
	l.s	$f4, 44($sp)
	lw	$s7, ($t8)
	jr	$s7
solver_rect_fast.4128:
	lw	$a1, 4($t8)
	l.s	$f6, 0($a0)
	sub.s	$f6, $f6, $f0
	l.s	$f8, 4($a0)
	mul.s	$f6, $f6, $f8
	l.s	$f8, 4($v1)
	mul.s	$f8, $f6, $f8
	add.s	$f8, $f8, $f2
	sw	$a1, 0($sp)
	s.s	$f0, 4($sp)
	s.s	$f2, 8($sp)
	sw	$a0, 12($sp)
	s.s	$f4, 16($sp)
	s.s	$f6, 20($sp)
	sw	$v1, 24($sp)
	sw	$v0, 28($sp)
	mov.s	$f0, $f8
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fabs
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 28($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_b.3199
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	mov.s	$f2, $f0
	l.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fless
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8907
	li	$v0, 0
	b	beq_cont.8908
beq_else.8907:
	lw	$v0, 24($sp)
	l.s	$f0, 8($v0)
	l.s	$f2, 20($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 16($sp)
	add.s	$f0, $f0, $f4
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fabs
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 28($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_c.3213
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	mov.s	$f2, $f0
	l.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fless
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8909
	li	$v0, 0
	b	beq_cont.8910
beq_else.8909:
	lw	$v0, 12($sp)
	l.s	$f0, 4($v0)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fiszero
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8911
	li	$v0, 1
	b	beq_cont.8912
beq_else.8911:
	li	$v0, 0
beq_cont.8912:
beq_cont.8910:
beq_cont.8908:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8913
	lw	$v0, 12($sp)
	l.s	$f0, 8($v0)
	l.s	$f2, 8($sp)
	sub.s	$f0, $f0, $f2
	l.s	$f4, 12($v0)
	mul.s	$f0, $f0, $f4
	lw	$v1, 24($sp)
	l.s	$f4, 0($v1)
	mul.s	$f4, $f0, $f4
	l.s	$f6, 4($sp)
	add.s	$f4, $f4, $f6
	s.s	$f0, 40($sp)
	mov.s	$f0, $f4
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fabs
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 28($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_a.3185
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	mov.s	$f2, $f0
	l.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fless
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8914
	li	$v0, 0
	b	beq_cont.8915
beq_else.8914:
	lw	$v0, 24($sp)
	l.s	$f0, 8($v0)
	l.s	$f2, 40($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 16($sp)
	add.s	$f0, $f0, $f4
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fabs
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	lw	$v0, 28($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_c.3213
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	mov.s	$f2, $f0
	l.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fless
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8916
	li	$v0, 0
	b	beq_cont.8917
beq_else.8916:
	lw	$v0, 12($sp)
	l.s	$f0, 12($v0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fiszero
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8918
	li	$v0, 1
	b	beq_cont.8919
beq_else.8918:
	li	$v0, 0
beq_cont.8919:
beq_cont.8917:
beq_cont.8915:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8920
	lw	$v0, 12($sp)
	l.s	$f0, 16($v0)
	l.s	$f2, 16($sp)
	sub.s	$f0, $f0, $f2
	l.s	$f2, 20($v0)
	mul.s	$f0, $f0, $f2
	lw	$v1, 24($sp)
	l.s	$f2, 0($v1)
	mul.s	$f2, $f0, $f2
	l.s	$f4, 4($sp)
	add.s	$f2, $f2, $f4
	s.s	$f0, 52($sp)
	mov.s	$f0, $f2
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fabs
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	lw	$v0, 28($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_a.3185
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	mov.s	$f2, $f0
	l.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8921
	li	$v0, 0
	b	beq_cont.8922
beq_else.8921:
	lw	$v0, 24($sp)
	l.s	$f0, 4($v0)
	l.s	$f2, 52($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 8($sp)
	add.s	$f0, $f0, $f4
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fabs
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 28($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_param_b.3199
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	mov.s	$f2, $f0
	l.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fless
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8923
	li	$v0, 0
	b	beq_cont.8924
beq_else.8923:
	lw	$v0, 12($sp)
	l.s	$f0, 20($v0)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fiszero
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8925
	li	$v0, 1
	b	beq_cont.8926
beq_else.8925:
	li	$v0, 0
beq_cont.8926:
beq_cont.8924:
beq_cont.8922:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8927
	li	$v0, 0
	jr	$ra
beq_else.8927:
	l.s	$f0, 52($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 3
	jr	$ra
beq_else.8920:
	l.s	$f0, 40($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 2
	jr	$ra
beq_else.8913:
	l.s	$f0, 20($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_surface_fast.4225:
	lw	$v0, 4($t8)
	l.s	$f6, 0($v1)
	sw	$v0, 0($sp)
	s.s	$f4, 4($sp)
	s.s	$f2, 8($sp)
	s.s	$f0, 12($sp)
	sw	$v1, 16($sp)
	mov.s	$f0, $f6
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fisneg
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8928
	li	$v0, 0
	jr	$ra
beq_else.8928:
	lw	$v0, 16($sp)
	l.s	$f0, 4($v0)
	l.s	$f2, 12($sp)
	mul.s	$f0, $f0, $f2
	l.s	$f2, 8($v0)
	l.s	$f4, 8($sp)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	l.s	$f2, 12($v0)
	l.s	$f4, 4($sp)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_second_fast.4248:
	lw	$a0, 4($t8)
	l.s	$f6, 0($v1)
	sw	$a0, 0($sp)
	s.s	$f6, 4($sp)
	sw	$v0, 8($sp)
	s.s	$f4, 12($sp)
	s.s	$f2, 16($sp)
	s.s	$f0, 20($sp)
	sw	$v1, 24($sp)
	mov.s	$f0, $f6
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8929
	lw	$v0, 24($sp)
	l.s	$f0, 4($v0)
	l.s	$f2, 20($sp)
	mul.s	$f0, $f0, $f2
	l.s	$f4, 8($v0)
	l.s	$f6, 16($sp)
	mul.s	$f4, $f4, $f6
	add.s	$f0, $f0, $f4
	l.s	$f4, 12($v0)
	l.s	$f8, 12($sp)
	mul.s	$f4, $f4, $f8
	add.s	$f0, $f0, $f4
	lw	$v1, 8($sp)
	s.s	$f0, 28($sp)
	addi	$v0, $v1, 0
	mov.s	$f4, $f8
	mov.s	$f0, $f2
	mov.s	$f2, $f6
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	quadratic.4000
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_form.3133
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.8930
	la	$v0, l.6248
	l.s	$f0, 0($v0)
	l.s	$f2, 32($sp)
	sub.s	$f0, $f2, $f0
	b	beq_cont.8931
beq_else.8930:
	l.s	$f0, 32($sp)
	mov.s	$f0, $f0
beq_cont.8931:
	l.s	$f2, 28($sp)
	s.s	$f0, 36($sp)
	mov.s	$f0, $f2
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fsqr
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 4($sp)
	l.s	$f4, 36($sp)
	mul.s	$f2, $f2, $f4
	sub.s	$f0, $f0, $f2
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fispos
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8932
	li	$v0, 0
	jr	$ra
beq_else.8932:
	lw	$v0, 8($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.3159
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8933
	l.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 28($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 24($sp)
	l.s	$f2, 16($v0)
	mul.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	b	beq_cont.8934
beq_else.8933:
	l.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 28($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 24($sp)
	l.s	$f2, 16($v0)
	mul.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
beq_cont.8934:
	li	$v0, 1
	jr	$ra
beq_else.8929:
	li	$v0, 0
	jr	$ra
solver_fast.4294:
	lw	$a1, 16($t8)
	lw	$a2, 12($t8)
	lw	$a3, 8($t8)
	lw	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $t0, $t1
	lw	$t0, ($t9)
	l.s	$f0, 0($a0)
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$a3, 8($sp)
	sw	$v0, 12($sp)
	sw	$v1, 16($sp)
	sw	$t0, 20($sp)
	sw	$a0, 24($sp)
	s.s	$f0, 28($sp)
	addi	$v0, $t0, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_x.3240
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 24($sp)
	l.s	$f2, 4($v0)
	lw	$v1, 20($sp)
	s.s	$f0, 32($sp)
	s.s	$f2, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_y.3254
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 24($sp)
	l.s	$f2, 8($v0)
	lw	$v0, 20($sp)
	s.s	$f0, 40($sp)
	s.s	$f2, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_z.3268
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	d_const.3504
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v1, 12($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lw	$v0, ($t9)
	lw	$v1, 20($sp)
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_form.3133
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8935
	lw	$v0, 16($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	d_vec.3500
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	addi	$v1, $v0, 0
	lw	$t8, 8($sp)
	lw	$v0, 20($sp)
	lw	$a0, 52($sp)
	l.s	$f0, 32($sp)
	l.s	$f2, 40($sp)
	l.s	$f4, 48($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8935:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8936
	lw	$t8, 4($sp)
	lw	$v0, 20($sp)
	lw	$v1, 52($sp)
	l.s	$f0, 32($sp)
	l.s	$f2, 40($sp)
	l.s	$f4, 48($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8936:
	lw	$t8, 0($sp)
	lw	$v0, 20($sp)
	lw	$v1, 52($sp)
	l.s	$f0, 32($sp)
	l.s	$f2, 40($sp)
	l.s	$f4, 48($sp)
	lw	$s7, ($t8)
	jr	$s7
solver_surface_fast2.4317:
	lw	$v0, 4($t8)
	l.s	$f0, 0($v1)
	sw	$v0, 0($sp)
	sw	$a0, 4($sp)
	sw	$v1, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fisneg
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8937
	li	$v0, 0
	jr	$ra
beq_else.8937:
	lw	$v0, 8($sp)
	l.s	$f0, 0($v0)
	lw	$v0, 4($sp)
	l.s	$f2, 12($v0)
	mul.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_second_fast2.4335:
	lw	$a1, 4($t8)
	l.s	$f6, 0($v1)
	sw	$a1, 0($sp)
	sw	$v0, 4($sp)
	s.s	$f6, 8($sp)
	sw	$a0, 12($sp)
	s.s	$f4, 16($sp)
	s.s	$f2, 20($sp)
	s.s	$f0, 24($sp)
	sw	$v1, 28($sp)
	mov.s	$f0, $f6
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fiszero
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8938
	lw	$v0, 28($sp)
	l.s	$f0, 4($v0)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f0, $f2
	l.s	$f2, 8($v0)
	l.s	$f4, 20($sp)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	l.s	$f2, 12($v0)
	l.s	$f4, 16($sp)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	lw	$v1, 12($sp)
	l.s	$f2, 12($v1)
	s.s	$f0, 32($sp)
	s.s	$f2, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fsqr
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 8($sp)
	l.s	$f4, 36($sp)
	mul.s	$f2, $f2, $f4
	sub.s	$f0, $f0, $f2
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fispos
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8939
	li	$v0, 0
	jr	$ra
beq_else.8939:
	lw	$v0, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.3159
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8940
	l.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 32($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 28($sp)
	l.s	$f2, 16($v0)
	mul.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	b	beq_cont.8941
beq_else.8940:
	l.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 32($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 28($sp)
	l.s	$f2, 16($v0)
	mul.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
beq_cont.8941:
	li	$v0, 1
	jr	$ra
beq_else.8938:
	li	$v0, 0
	jr	$ra
solver_fast2.4379:
	lw	$a0, 16($t8)
	lw	$a1, 12($t8)
	lw	$a2, 8($t8)
	lw	$a3, 4($t8)
	sll	$t0, $v0, 2
	add	$t9, $a3, $t0
	lw	$a3, ($t9)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	sw	$a3, 12($sp)
	sw	$v0, 16($sp)
	sw	$v1, 20($sp)
	addi	$v0, $a3, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_ctbl.3394
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f0, 0($v0)
	l.s	$f2, 4($v0)
	l.s	$f4, 8($v0)
	lw	$v1, 20($sp)
	sw	$v0, 24($sp)
	s.s	$f4, 28($sp)
	s.s	$f2, 32($sp)
	s.s	$f0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	d_const.3504
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	lw	$v1, 16($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lw	$v0, ($t9)
	lw	$v1, 12($sp)
	sw	$v0, 40($sp)
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_form.3133
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8942
	lw	$v0, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	d_vec.3500
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	addi	$v1, $v0, 0
	lw	$t8, 8($sp)
	lw	$v0, 12($sp)
	lw	$a0, 40($sp)
	l.s	$f0, 36($sp)
	l.s	$f2, 32($sp)
	l.s	$f4, 28($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8942:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8943
	lw	$t8, 4($sp)
	lw	$v0, 12($sp)
	lw	$v1, 40($sp)
	lw	$a0, 24($sp)
	l.s	$f0, 36($sp)
	l.s	$f2, 32($sp)
	l.s	$f4, 28($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8943:
	lw	$t8, 0($sp)
	lw	$v0, 12($sp)
	lw	$v1, 40($sp)
	lw	$a0, 24($sp)
	l.s	$f0, 36($sp)
	l.s	$f2, 32($sp)
	l.s	$f4, 28($sp)
	lw	$s7, ($t8)
	jr	$s7
setup_rect_table.4396:
	li	$a0, 6
	la	$a1, l.6250
	l.s	$f0, 0($a1)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_float_array
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 4($sp)
	l.s	$f0, 0($v1)
	sw	$v0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fiszero
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8944
	lw	$v0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.3159
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v1, 4($sp)
	l.s	$f0, 0($v1)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fisneg
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	addi	$v1, $v0, 0
	lw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_xor
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v1, 0($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_a.3185
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	fneg_cond.2906
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 0($v0)
	la	$v1, l.6248
	l.s	$f0, 0($v1)
	lw	$v1, 4($sp)
	l.s	$f2, 0($v1)
	div.s	$f0, $f0, $f2
	s.s	$f0, 4($v0)
	b	beq_cont.8945
beq_else.8944:
	la	$v0, l.6250
	l.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	s.s	$f0, 4($v0)
beq_cont.8945:
	lw	$v0, 4($sp)
	l.s	$f0, 4($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fiszero
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8946
	lw	$v0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.3159
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 4($sp)
	l.s	$f0, 4($v1)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fisneg
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	addi	$v1, $v0, 0
	lw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_xor
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 0($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_b.3199
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	fneg_cond.2906
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 8($v0)
	la	$v1, l.6248
	l.s	$f0, 0($v1)
	lw	$v1, 4($sp)
	l.s	$f2, 4($v1)
	div.s	$f0, $f0, $f2
	s.s	$f0, 12($v0)
	b	beq_cont.8947
beq_else.8946:
	la	$v0, l.6250
	l.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	s.s	$f0, 12($v0)
beq_cont.8947:
	lw	$v0, 4($sp)
	l.s	$f0, 8($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8948
	lw	$v0, 0($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_isinvert.3159
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v1, 4($sp)
	l.s	$f0, 8($v1)
	sw	$v0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fisneg
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	addi	$v1, $v0, 0
	lw	$v0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_xor
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v1, 0($sp)
	sw	$v0, 32($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.3213
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg_cond.2906
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 16($v0)
	la	$v1, l.6248
	l.s	$f0, 0($v1)
	lw	$v1, 4($sp)
	l.s	$f2, 8($v1)
	div.s	$f0, $f0, $f2
	s.s	$f0, 20($v0)
	b	beq_cont.8949
beq_else.8948:
	la	$v0, l.6250
	l.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	s.s	$f0, 20($v0)
beq_cont.8949:
	lw	$v0, 8($sp)
	jr	$ra
setup_surface_table.4465:
	li	$a0, 4
	la	$a1, l.6250
	l.s	$f0, 0($a1)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_float_array
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 4($sp)
	l.s	$f0, 0($v1)
	lw	$a0, 0($sp)
	sw	$v0, 8($sp)
	s.s	$f0, 12($sp)
	addi	$v0, $a0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_a.3185
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	l.s	$f2, 4($v0)
	lw	$v1, 0($sp)
	s.s	$f0, 16($sp)
	s.s	$f2, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_b.3199
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	l.s	$f2, 8($v0)
	lw	$v0, 0($sp)
	s.s	$f0, 24($sp)
	s.s	$f2, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_c.3213
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 24($sp)
	add.s	$f0, $f2, $f0
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fispos
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8950
	la	$v0, l.6250
	l.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	s.s	$f0, 0($v0)
	b	beq_cont.8951
beq_else.8950:
	la	$v0, l.6275
	l.s	$f0, 0($v0)
	l.s	$f2, 32($sp)
	div.s	$f0, $f0, $f2
	lw	$v0, 8($sp)
	s.s	$f0, 0($v0)
	lw	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.3185
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	div.s	$f0, $f0, $f2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 4($v0)
	lw	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_b.3199
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	div.s	$f0, $f0, $f2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 8($v0)
	lw	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.3213
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	div.s	$f0, $f0, $f2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 12($v0)
beq_cont.8951:
	lw	$v0, 8($sp)
	jr	$ra
setup_second_table.4508:
	li	$a0, 5
	la	$a1, l.6250
	l.s	$f0, 0($a1)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_float_array
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 4($sp)
	l.s	$f0, 0($v1)
	l.s	$f2, 4($v1)
	l.s	$f4, 8($v1)
	lw	$a0, 0($sp)
	sw	$v0, 8($sp)
	addi	$v0, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	quadratic.4000
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 4($sp)
	l.s	$f2, 0($v0)
	lw	$v1, 0($sp)
	s.s	$f0, 12($sp)
	s.s	$f2, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_a.3185
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	mul.s	$f0, $f2, $f0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fneg
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 4($sp)
	l.s	$f2, 4($v0)
	lw	$v1, 0($sp)
	s.s	$f0, 20($sp)
	s.s	$f2, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_b.3199
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fneg
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 4($sp)
	l.s	$f2, 8($v0)
	lw	$v1, 0($sp)
	s.s	$f0, 28($sp)
	s.s	$f2, 32($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.3213
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	mul.s	$f0, $f2, $f0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 12($sp)
	lw	$v0, 8($sp)
	s.s	$f2, 0($v0)
	lw	$v1, 0($sp)
	s.s	$f0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isrot.3172
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8952
	l.s	$f0, 20($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 4($v0)
	l.s	$f0, 28($sp)
	s.s	$f0, 8($v0)
	l.s	$f0, 36($sp)
	s.s	$f0, 12($v0)
	b	beq_cont.8953
beq_else.8952:
	lw	$v0, 4($sp)
	l.s	$f0, 8($v0)
	lw	$v1, 0($sp)
	s.s	$f0, 40($sp)
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_r2.3366
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 40($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	l.s	$f2, 4($v0)
	lw	$v1, 0($sp)
	s.s	$f0, 44($sp)
	s.s	$f2, 48($sp)
	addi	$v0, $v1, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r3.3380
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 44($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fhalf
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 20($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 4($v0)
	lw	$v1, 4($sp)
	l.s	$f0, 8($v1)
	lw	$a0, 0($sp)
	s.s	$f0, 52($sp)
	addi	$v0, $a0, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r1.3352
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 52($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	l.s	$f2, 0($v0)
	lw	$v1, 0($sp)
	s.s	$f0, 56($sp)
	s.s	$f2, 60($sp)
	addi	$v0, $v1, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_param_r3.3380
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 60($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 56($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fhalf
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 28($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 8($v0)
	lw	$v1, 4($sp)
	l.s	$f0, 4($v1)
	lw	$a0, 0($sp)
	s.s	$f0, 64($sp)
	addi	$v0, $a0, 0
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_r1.3352
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	l.s	$f2, 64($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	l.s	$f2, 0($v0)
	lw	$v0, 0($sp)
	s.s	$f0, 68($sp)
	s.s	$f2, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_r2.3366
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	l.s	$f2, 72($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 68($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fhalf
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	l.s	$f2, 36($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 12($v0)
beq_cont.8953:
	l.s	$f0, 12($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fiszero
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8954
	la	$v0, l.6248
	l.s	$f0, 0($v0)
	l.s	$f2, 12($sp)
	div.s	$f0, $f0, $f2
	lw	$v0, 8($sp)
	s.s	$f0, 16($v0)
	b	beq_cont.8955
beq_else.8954:
beq_cont.8955:
	lw	$v0, 8($sp)
	jr	$ra
iter_setup_dirvec_constants.4590:
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.8956
	sll	$a1, $v1, 2
	add	$t9, $a0, $a1
	lw	$a0, ($t9)
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$a0, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	d_const.3504
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	d_vec.3500
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 8($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_form.3133
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8957
	lw	$v0, 20($sp)
	lw	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_rect_table.4396
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 4($sp)
	sll	$a0, $v1, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	b	beq_cont.8958
beq_else.8957:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8959
	lw	$v0, 20($sp)
	lw	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_surface_table.4465
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 4($sp)
	sll	$a0, $v1, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	b	beq_cont.8960
beq_else.8959:
	lw	$v0, 20($sp)
	lw	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_second_table.4508
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 4($sp)
	sll	$a0, $v1, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
beq_cont.8960:
beq_cont.8958:
	lw	$v0, 4($sp)
	addi	$v1, $v0, -1
	lw	$t8, 0($sp)
	lw	$v0, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.8956:
	jr	$ra
setup_dirvec_constants.4606:
	lw	$v1, 8($t8)
	lw	$t8, 4($t8)
	lw	$v1, 0($v1)
	addi	$v1, $v1, -1
	lw	$s7, ($t8)
	jr	$s7
setup_startp_constants.4612:
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.8962
	sll	$a1, $v1, 2
	add	$t9, $a0, $a1
	lw	$a0, ($t9)
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$v0, 8($sp)
	sw	$a0, 12($sp)
	addi	$v0, $a0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_ctbl.3394
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.3133
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 8($sp)
	l.s	$f0, 0($v1)
	lw	$a0, 12($sp)
	sw	$v0, 20($sp)
	s.s	$f0, 24($sp)
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.3240
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 0($v0)
	lw	$v1, 8($sp)
	l.s	$f0, 4($v1)
	lw	$a0, 12($sp)
	s.s	$f0, 28($sp)
	addi	$v0, $a0, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_y.3254
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 4($v0)
	lw	$v1, 8($sp)
	l.s	$f0, 8($v1)
	lw	$a0, 12($sp)
	s.s	$f0, 32($sp)
	addi	$v0, $a0, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_z.3268
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 8($v0)
	li	$v1, 2
	lw	$a0, 20($sp)
	bne	$a0, $v1, beq_else.8963
	lw	$v1, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.3227
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v1, 16($sp)
	l.s	$f0, 0($v1)
	l.s	$f2, 4($v1)
	l.s	$f4, 8($v1)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veciprod2.3005
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 16($sp)
	s.s	$f0, 12($v0)
	b	beq_cont.8964
beq_else.8963:
	li	$v1, 2
	bgt	$a0, $v1, ble_else.8965
	b	ble_cont.8966
ble_else.8965:
	l.s	$f0, 0($v0)
	l.s	$f2, 4($v0)
	l.s	$f4, 8($v0)
	lw	$v1, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	quadratic.4000
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v0, 3
	lw	$v1, 20($sp)
	bne	$v1, $v0, beq_else.8967
	la	$v0, l.6248
	l.s	$f2, 0($v0)
	sub.s	$f0, $f0, $f2
	b	beq_cont.8968
beq_else.8967:
	mov.s	$f0, $f0
beq_cont.8968:
	lw	$v0, 16($sp)
	s.s	$f0, 12($v0)
ble_cont.8966:
beq_cont.8964:
	lw	$v0, 4($sp)
	addi	$v1, $v0, -1
	lw	$t8, 0($sp)
	lw	$v0, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.8962:
	jr	$ra
setup_startp.4662:
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	sw	$v0, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	veccpy.2937
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 8($sp)
	lw	$v0, 0($v0)
	addi	$v1, $v0, -1
	lw	$t8, 4($sp)
	lw	$v0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
is_rect_outside.4669:
	s.s	$f4, 0($sp)
	s.s	$f2, 4($sp)
	sw	$v0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fabs
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_a.3185
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	mov.s	$f2, $f0
	l.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fless
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8970
	li	$v0, 0
	b	beq_cont.8971
beq_else.8970:
	l.s	$f0, 4($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fabs
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_b.3199
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	mov.s	$f2, $f0
	l.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fless
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8972
	li	$v0, 0
	b	beq_cont.8973
beq_else.8972:
	l.s	$f0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fabs
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_c.3213
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	mov.s	$f2, $f0
	l.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fless
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
beq_cont.8973:
beq_cont.8971:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8974
	lw	$v0, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_isinvert.3159
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8975
	li	$v0, 1
	jr	$ra
beq_else.8975:
	li	$v0, 0
	jr	$ra
beq_else.8974:
	lw	$v0, 8($sp)
	j	o_isinvert.3159
is_plane_outside.4688:
	sw	$v0, 0($sp)
	s.s	$f4, 4($sp)
	s.s	$f2, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_abc.3227
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f0, 12($sp)
	l.s	$f2, 8($sp)
	l.s	$f4, 4($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	veciprod2.3005
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.3159
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f0, 16($sp)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fisneg
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	addi	$v1, $v0, 0
	lw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_xor
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8976
	li	$v0, 1
	jr	$ra
beq_else.8976:
	li	$v0, 0
	jr	$ra
is_second_outside.4699:
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	quadratic.4000
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_form.3133
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.8977
	la	$v0, l.6248
	l.s	$f0, 0($v0)
	l.s	$f2, 4($sp)
	sub.s	$f0, $f2, $f0
	b	beq_cont.8978
beq_else.8977:
	l.s	$f0, 4($sp)
	mov.s	$f0, $f0
beq_cont.8978:
	lw	$v0, 0($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.3159
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f0, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fisneg
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	addi	$v1, $v0, 0
	lw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_xor
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8979
	li	$v0, 1
	jr	$ra
beq_else.8979:
	li	$v0, 0
	jr	$ra
is_outside.4713:
	s.s	$f4, 0($sp)
	s.s	$f2, 4($sp)
	sw	$v0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_x.3240
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_y.3254
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 4($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_z.3268
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 0($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_form.3133
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8980
	lw	$v0, 8($sp)
	l.s	$f0, 16($sp)
	l.s	$f2, 20($sp)
	l.s	$f4, 24($sp)
	j	is_rect_outside.4669
beq_else.8980:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8981
	lw	$v0, 8($sp)
	l.s	$f0, 16($sp)
	l.s	$f2, 20($sp)
	l.s	$f4, 24($sp)
	j	is_plane_outside.4688
beq_else.8981:
	lw	$v0, 8($sp)
	l.s	$f0, 16($sp)
	l.s	$f2, 20($sp)
	l.s	$f4, 24($sp)
	j	is_second_outside.4699
check_all_inside.4727:
	lw	$a0, 4($t8)
	sll	$a1, $v0, 2
	add	$t9, $v1, $a1
	lw	$a1, ($t9)
	li	$a2, -1
	bne	$a1, $a2, beq_else.8982
	li	$v0, 1
	jr	$ra
beq_else.8982:
	sll	$a1, $a1, 2
	add	$t9, $a0, $a1
	lw	$a0, ($t9)
	s.s	$f4, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f0, 8($sp)
	sw	$v1, 12($sp)
	sw	$t8, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	is_outside.4713
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8983
	lw	$v0, 20($sp)
	addi	$v0, $v0, 1
	lw	$t8, 16($sp)
	lw	$v1, 12($sp)
	l.s	$f0, 8($sp)
	l.s	$f2, 4($sp)
	l.s	$f4, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8983:
	li	$v0, 0
	jr	$ra
shadow_check_and_group.4741:
	lw	$a0, 28($t8)
	lw	$a1, 24($t8)
	lw	$a2, 20($t8)
	lw	$a3, 16($t8)
	lw	$t0, 12($t8)
	lw	$t1, 8($t8)
	lw	$t2, 4($t8)
	sll	$t3, $v0, 2
	add	$t9, $v1, $t3
	lw	$t3, ($t9)
	li	$t4, -1
	bne	$t3, $t4, beq_else.8984
	li	$v0, 0
	jr	$ra
beq_else.8984:
	sll	$t3, $v0, 2
	add	$t9, $v1, $t3
	lw	$t3, ($t9)
	sw	$t2, 0($sp)
	sw	$t1, 4($sp)
	sw	$t0, 8($sp)
	sw	$v1, 12($sp)
	sw	$t8, 16($sp)
	sw	$v0, 20($sp)
	sw	$a2, 24($sp)
	sw	$t3, 28($sp)
	sw	$a1, 32($sp)
	addi	$v1, $a3, 0
	addi	$v0, $t3, 0
	addi	$t8, $a0, 0
	addi	$a0, $t1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v1, 32($sp)
	l.s	$f0, 0($v1)
	li	$v1, 0
	s.s	$f0, 36($sp)
	bne	$v0, $v1, beq_else.8985
	li	$v0, 0
	b	beq_cont.8986
beq_else.8985:
	la	$v0, l.6582
	l.s	$f2, 0($v0)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fless
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
beq_cont.8986:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8987
	lw	$v0, 28($sp)
	sll	$v0, $v0, 2
	lw	$v1, 24($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isinvert.3159
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8988
	li	$v0, 0
	jr	$ra
beq_else.8988:
	lw	$v0, 20($sp)
	addi	$v0, $v0, 1
	lw	$t8, 16($sp)
	lw	$v1, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8987:
	la	$v0, l.6585
	l.s	$f0, 0($v0)
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	l.s	$f2, 0($v0)
	mul.s	$f2, $f2, $f0
	lw	$v1, 4($sp)
	l.s	$f4, 0($v1)
	add.s	$f2, $f2, $f4
	l.s	$f4, 4($v0)
	mul.s	$f4, $f4, $f0
	l.s	$f6, 4($v1)
	add.s	$f4, $f4, $f6
	l.s	$f6, 8($v0)
	mul.s	$f0, $f6, $f0
	l.s	$f6, 8($v1)
	add.s	$f0, $f0, $f6
	li	$v0, 0
	lw	$t8, 0($sp)
	lw	$v1, 12($sp)
	mov.s	$f30, $f4
	mov.s	$f4, $f0
	mov.s	$f0, $f2
	mov.s	$f2, $f30
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8989
	lw	$v0, 20($sp)
	addi	$v0, $v0, 1
	lw	$t8, 16($sp)
	lw	$v1, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8989:
	li	$v0, 1
	jr	$ra
shadow_check_one_or_group.4785:
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	sll	$a2, $v0, 2
	add	$t9, $v1, $a2
	lw	$a2, ($t9)
	li	$a3, -1
	bne	$a2, $a3, beq_else.8990
	li	$v0, 0
	jr	$ra
beq_else.8990:
	sll	$a2, $a2, 2
	add	$t9, $a1, $a2
	lw	$a1, ($t9)
	li	$a2, 0
	sw	$v1, 0($sp)
	sw	$t8, 4($sp)
	sw	$v0, 8($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a2, 0
	addi	$t8, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8991
	lw	$v0, 8($sp)
	addi	$v0, $v0, 1
	lw	$t8, 4($sp)
	lw	$v1, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.8991:
	li	$v0, 1
	jr	$ra
shadow_check_one_or_matrix.4797:
	lw	$a0, 20($t8)
	lw	$a1, 16($t8)
	lw	$a2, 12($t8)
	lw	$a3, 8($t8)
	lw	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $v1, $t1
	lw	$t1, ($t9)
	lw	$t2, 0($t1)
	li	$t3, -1
	bne	$t2, $t3, beq_else.8992
	li	$v0, 0
	jr	$ra
beq_else.8992:
	li	$t3, 99
	sw	$t1, 0($sp)
	sw	$a2, 4($sp)
	sw	$v1, 8($sp)
	sw	$t8, 12($sp)
	sw	$v0, 16($sp)
	bne	$t2, $t3, beq_else.8993
	li	$v0, 1
	b	beq_cont.8994
beq_else.8993:
	sw	$a1, 20($sp)
	addi	$v1, $a3, 0
	addi	$v0, $t2, 0
	addi	$t8, $a0, 0
	addi	$a0, $t0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8995
	li	$v0, 0
	b	beq_cont.8996
beq_else.8995:
	lw	$v0, 20($sp)
	l.s	$f0, 0($v0)
	la	$v0, l.6598
	l.s	$f2, 0($v0)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fless
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8997
	li	$v0, 0
	b	beq_cont.8998
beq_else.8997:
	li	$v0, 1
	lw	$t8, 4($sp)
	lw	$v1, 0($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8999
	li	$v0, 0
	b	beq_cont.9000
beq_else.8999:
	li	$v0, 1
beq_cont.9000:
beq_cont.8998:
beq_cont.8996:
beq_cont.8994:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9001
	lw	$v0, 16($sp)
	addi	$v0, $v0, 1
	lw	$t8, 12($sp)
	lw	$v1, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9001:
	li	$v0, 1
	lw	$t8, 4($sp)
	lw	$v1, 0($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9002
	lw	$v0, 16($sp)
	addi	$v0, $v0, 1
	lw	$t8, 12($sp)
	lw	$v1, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9002:
	li	$v0, 1
	jr	$ra
solve_each_element.4825:
	lw	$a1, 36($t8)
	lw	$a2, 32($t8)
	lw	$a3, 28($t8)
	lw	$t0, 24($t8)
	lw	$t1, 20($t8)
	lw	$t2, 16($t8)
	lw	$t3, 12($t8)
	lw	$t4, 8($t8)
	lw	$t5, 4($t8)
	sll	$t6, $v0, 2
	add	$t9, $v1, $t6
	lw	$t6, ($t9)
	li	$t7, -1
	bne	$t6, $t7, beq_else.9003
	jr	$ra
beq_else.9003:
	sw	$t2, 0($sp)
	sw	$t4, 4($sp)
	sw	$t3, 8($sp)
	sw	$t5, 12($sp)
	sw	$a2, 16($sp)
	sw	$a1, 20($sp)
	sw	$a3, 24($sp)
	sw	$a0, 28($sp)
	sw	$v1, 32($sp)
	sw	$t8, 36($sp)
	sw	$v0, 40($sp)
	sw	$t1, 44($sp)
	sw	$t6, 48($sp)
	addi	$v1, $a0, 0
	addi	$v0, $t6, 0
	addi	$t8, $t0, 0
	addi	$a0, $a2, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9005
	lw	$v0, 48($sp)
	sll	$v0, $v0, 2
	lw	$v1, 44($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.3159
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9006
	jr	$ra
beq_else.9006:
	lw	$v0, 40($sp)
	addi	$v0, $v0, 1
	lw	$t8, 36($sp)
	lw	$v1, 32($sp)
	lw	$a0, 28($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9005:
	lw	$v1, 24($sp)
	l.s	$f2, 0($v1)
	la	$v1, l.6250
	l.s	$f0, 0($v1)
	sw	$v0, 52($sp)
	s.s	$f2, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9008
	b	beq_cont.9009
beq_else.9008:
	lw	$v0, 20($sp)
	l.s	$f2, 0($v0)
	l.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9010
	b	beq_cont.9011
beq_else.9010:
	la	$v0, l.6585
	l.s	$f0, 0($v0)
	l.s	$f2, 56($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 28($sp)
	l.s	$f2, 0($v0)
	mul.s	$f2, $f2, $f0
	lw	$v1, 16($sp)
	l.s	$f4, 0($v1)
	add.s	$f2, $f2, $f4
	l.s	$f4, 4($v0)
	mul.s	$f4, $f4, $f0
	l.s	$f6, 4($v1)
	add.s	$f4, $f4, $f6
	l.s	$f6, 8($v0)
	mul.s	$f6, $f6, $f0
	l.s	$f8, 8($v1)
	add.s	$f6, $f6, $f8
	li	$v1, 0
	lw	$t8, 12($sp)
	lw	$a0, 32($sp)
	s.s	$f6, 60($sp)
	s.s	$f4, 64($sp)
	s.s	$f2, 68($sp)
	s.s	$f0, 72($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	mov.s	$f0, $f2
	mov.s	$f2, $f4
	mov.s	$f4, $f6
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9012
	b	beq_cont.9013
beq_else.9012:
	l.s	$f0, 72($sp)
	lw	$v0, 20($sp)
	s.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	l.s	$f0, 68($sp)
	l.s	$f2, 64($sp)
	l.s	$f4, 60($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	vecset.2916
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lw	$v0, 48($sp)
	lw	$v1, 4($sp)
	sw	$v0, 0($v1)
	lw	$v0, 52($sp)
	lw	$v1, 0($sp)
	sw	$v0, 0($v1)
beq_cont.9013:
beq_cont.9011:
beq_cont.9009:
	lw	$v0, 40($sp)
	addi	$v0, $v0, 1
	lw	$t8, 36($sp)
	lw	$v1, 32($sp)
	lw	$a0, 28($sp)
	lw	$s7, ($t8)
	jr	$s7
solve_one_or_network.4880:
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sll	$a3, $v0, 2
	add	$t9, $v1, $a3
	lw	$a3, ($t9)
	li	$t0, -1
	bne	$a3, $t0, beq_else.9014
	jr	$ra
beq_else.9014:
	sll	$a3, $a3, 2
	add	$t9, $a2, $a3
	lw	$a2, ($t9)
	li	$a3, 0
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	addi	$v1, $a2, 0
	addi	$v0, $a3, 0
	addi	$t8, $a1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v0, 12($sp)
	addi	$v0, $v0, 1
	lw	$t8, 8($sp)
	lw	$v1, 4($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
trace_or_matrix.4892:
	lw	$a1, 20($t8)
	lw	$a2, 16($t8)
	lw	$a3, 12($t8)
	lw	$t0, 8($t8)
	lw	$t1, 4($t8)
	sll	$t2, $v0, 2
	add	$t9, $v1, $t2
	lw	$t2, ($t9)
	lw	$t3, 0($t2)
	li	$t4, -1
	bne	$t3, $t4, beq_else.9016
	jr	$ra
beq_else.9016:
	li	$t4, 99
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	bne	$t3, $t4, beq_else.9018
	li	$a1, 1
	addi	$v1, $t2, 0
	addi	$v0, $a1, 0
	addi	$t8, $t1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	b	beq_cont.9019
beq_else.9018:
	sw	$t2, 16($sp)
	sw	$t1, 20($sp)
	sw	$a1, 24($sp)
	sw	$a3, 28($sp)
	addi	$v1, $a0, 0
	addi	$v0, $t3, 0
	addi	$t8, $t0, 0
	addi	$a0, $a2, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9020
	b	beq_cont.9021
beq_else.9020:
	lw	$v0, 28($sp)
	l.s	$f0, 0($v0)
	lw	$v0, 24($sp)
	l.s	$f2, 0($v0)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fless
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9022
	b	beq_cont.9023
beq_else.9022:
	li	$v0, 1
	lw	$t8, 20($sp)
	lw	$v1, 16($sp)
	lw	$a0, 0($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
beq_cont.9023:
beq_cont.9021:
beq_cont.9019:
	lw	$v0, 12($sp)
	addi	$v0, $v0, 1
	lw	$t8, 8($sp)
	lw	$v1, 4($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
judge_intersection.4915:
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	la	$a2, l.6621
	l.s	$f0, 0($a2)
	s.s	$f0, 0($a0)
	li	$a2, 0
	lw	$a1, 0($a1)
	sw	$a0, 0($sp)
	addi	$a0, $v0, 0
	addi	$t8, $v1, 0
	addi	$v1, $a1, 0
	addi	$v0, $a2, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	l.s	$f2, 0($v0)
	la	$v0, l.6598
	l.s	$f0, 0($v0)
	s.s	$f2, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fless
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9024
	li	$v0, 0
	jr	$ra
beq_else.9024:
	la	$v0, l.6627
	l.s	$f2, 0($v0)
	l.s	$f0, 4($sp)
	j	min_caml_fless
solve_each_element_fast.4930:
	lw	$a1, 36($t8)
	lw	$a2, 32($t8)
	lw	$a3, 28($t8)
	lw	$t0, 24($t8)
	lw	$t1, 20($t8)
	lw	$t2, 16($t8)
	lw	$t3, 12($t8)
	lw	$t4, 8($t8)
	lw	$t5, 4($t8)
	sw	$t2, 0($sp)
	sw	$t4, 4($sp)
	sw	$t3, 8($sp)
	sw	$t5, 12($sp)
	sw	$a2, 16($sp)
	sw	$a1, 20($sp)
	sw	$t0, 24($sp)
	sw	$t8, 28($sp)
	sw	$t1, 32($sp)
	sw	$a0, 36($sp)
	sw	$a3, 40($sp)
	sw	$v1, 44($sp)
	sw	$v0, 48($sp)
	addi	$v0, $a0, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	d_vec.3500
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v1, 48($sp)
	sll	$a0, $v1, 2
	lw	$a1, 44($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	li	$a2, -1
	bne	$a0, $a2, beq_else.9025
	jr	$ra
beq_else.9025:
	lw	$t8, 40($sp)
	lw	$a2, 36($sp)
	sw	$v0, 52($sp)
	sw	$a0, 56($sp)
	addi	$v1, $a2, 0
	addi	$v0, $a0, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9027
	lw	$v0, 56($sp)
	sll	$v0, $v0, 2
	lw	$v1, 32($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.3159
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9028
	jr	$ra
beq_else.9028:
	lw	$v0, 48($sp)
	addi	$v0, $v0, 1
	lw	$t8, 28($sp)
	lw	$v1, 44($sp)
	lw	$a0, 36($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9027:
	lw	$v1, 24($sp)
	l.s	$f2, 0($v1)
	la	$v1, l.6250
	l.s	$f0, 0($v1)
	sw	$v0, 60($sp)
	s.s	$f2, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9030
	b	beq_cont.9031
beq_else.9030:
	lw	$v0, 20($sp)
	l.s	$f2, 0($v0)
	l.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9032
	b	beq_cont.9033
beq_else.9032:
	la	$v0, l.6585
	l.s	$f0, 0($v0)
	l.s	$f2, 64($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 52($sp)
	l.s	$f2, 0($v0)
	mul.s	$f2, $f2, $f0
	lw	$v1, 16($sp)
	l.s	$f4, 0($v1)
	add.s	$f2, $f2, $f4
	l.s	$f4, 4($v0)
	mul.s	$f4, $f4, $f0
	l.s	$f6, 4($v1)
	add.s	$f4, $f4, $f6
	l.s	$f6, 8($v0)
	mul.s	$f6, $f6, $f0
	l.s	$f8, 8($v1)
	add.s	$f6, $f6, $f8
	li	$v0, 0
	lw	$t8, 12($sp)
	lw	$v1, 44($sp)
	s.s	$f6, 68($sp)
	s.s	$f4, 72($sp)
	s.s	$f2, 76($sp)
	s.s	$f0, 80($sp)
	mov.s	$f0, $f2
	mov.s	$f2, $f4
	mov.s	$f4, $f6
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9034
	b	beq_cont.9035
beq_else.9034:
	l.s	$f0, 80($sp)
	lw	$v0, 20($sp)
	s.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	l.s	$f0, 76($sp)
	l.s	$f2, 72($sp)
	l.s	$f4, 68($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	vecset.2916
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lw	$v0, 56($sp)
	lw	$v1, 4($sp)
	sw	$v0, 0($v1)
	lw	$v0, 60($sp)
	lw	$v1, 0($sp)
	sw	$v0, 0($v1)
beq_cont.9035:
beq_cont.9033:
beq_cont.9031:
	lw	$v0, 48($sp)
	addi	$v0, $v0, 1
	lw	$t8, 28($sp)
	lw	$v1, 44($sp)
	lw	$a0, 36($sp)
	lw	$s7, ($t8)
	jr	$s7
solve_one_or_network_fast.4986:
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sll	$a3, $v0, 2
	add	$t9, $v1, $a3
	lw	$a3, ($t9)
	li	$t0, -1
	bne	$a3, $t0, beq_else.9036
	jr	$ra
beq_else.9036:
	sll	$a3, $a3, 2
	add	$t9, $a2, $a3
	lw	$a2, ($t9)
	li	$a3, 0
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	addi	$v1, $a2, 0
	addi	$v0, $a3, 0
	addi	$t8, $a1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v0, 12($sp)
	addi	$v0, $v0, 1
	lw	$t8, 8($sp)
	lw	$v1, 4($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
trace_or_matrix_fast.4998:
	lw	$a1, 16($t8)
	lw	$a2, 12($t8)
	lw	$a3, 8($t8)
	lw	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $v1, $t1
	lw	$t1, ($t9)
	lw	$t2, 0($t1)
	li	$t3, -1
	bne	$t2, $t3, beq_else.9038
	jr	$ra
beq_else.9038:
	li	$t3, 99
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	bne	$t2, $t3, beq_else.9040
	li	$a1, 1
	addi	$v1, $t1, 0
	addi	$v0, $a1, 0
	addi	$t8, $t0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	b	beq_cont.9041
beq_else.9040:
	sw	$t1, 16($sp)
	sw	$t0, 20($sp)
	sw	$a1, 24($sp)
	sw	$a3, 28($sp)
	addi	$v1, $a0, 0
	addi	$v0, $t2, 0
	addi	$t8, $a2, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9042
	b	beq_cont.9043
beq_else.9042:
	lw	$v0, 28($sp)
	l.s	$f0, 0($v0)
	lw	$v0, 24($sp)
	l.s	$f2, 0($v0)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fless
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9044
	b	beq_cont.9045
beq_else.9044:
	li	$v0, 1
	lw	$t8, 20($sp)
	lw	$v1, 16($sp)
	lw	$a0, 0($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
beq_cont.9045:
beq_cont.9043:
beq_cont.9041:
	lw	$v0, 12($sp)
	addi	$v0, $v0, 1
	lw	$t8, 8($sp)
	lw	$v1, 4($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
judge_intersection_fast.5021:
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	la	$a2, l.6621
	l.s	$f0, 0($a2)
	s.s	$f0, 0($a0)
	li	$a2, 0
	lw	$a1, 0($a1)
	sw	$a0, 0($sp)
	addi	$a0, $v0, 0
	addi	$t8, $v1, 0
	addi	$v1, $a1, 0
	addi	$v0, $a2, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	l.s	$f2, 0($v0)
	la	$v0, l.6598
	l.s	$f0, 0($v0)
	s.s	$f2, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fless
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9046
	li	$v0, 0
	jr	$ra
beq_else.9046:
	la	$v0, l.6627
	l.s	$f2, 0($v0)
	l.s	$f0, 4($sp)
	j	min_caml_fless
get_nvector_rect.5036:
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	lw	$a0, 0($a0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	vecbzero.2934
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 8($sp)
	addi	$v1, $v0, -1
	addi	$v0, $v0, -1
	sll	$v0, $v0, 2
	lw	$a0, 4($sp)
	add	$t9, $a0, $v0
	l.s	$f0, ($t9)
	sw	$v1, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	sgn.2900
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fneg
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v0, 12($sp)
	sll	$v0, $v0, 2
	lw	$v1, 0($sp)
	add	$t9, $v1, $v0
	s.s	$f0, ($t9)
	jr	$ra
get_nvector_plane.5048:
	lw	$v1, 4($t8)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_a.3185
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fneg
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 0($v0)
	lw	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_b.3199
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fneg
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 4($v0)
	lw	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_c.3213
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fneg
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 8($v0)
	jr	$ra
get_nvector_second.5061:
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	l.s	$f0, 0($a0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_x.3240
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	l.s	$f2, 4($v0)
	lw	$v1, 4($sp)
	s.s	$f0, 16($sp)
	s.s	$f2, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_y.3254
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	l.s	$f2, 8($v0)
	lw	$v0, 4($sp)
	s.s	$f0, 24($sp)
	s.s	$f2, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_z.3268
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.3185
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 16($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_b.3199
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_c.3213
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 32($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_isrot.3172
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9049
	l.s	$f0, 36($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	l.s	$f0, 40($sp)
	s.s	$f0, 4($v0)
	l.s	$f0, 44($sp)
	s.s	$f0, 8($v0)
	b	beq_cont.9050
beq_else.9049:
	lw	$v0, 4($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_r3.3380
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r2.3366
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 32($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 48($sp)
	add.s	$f0, $f4, $f0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fhalf
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	lw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r3.3380
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 16($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r1.3352
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 32($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 52($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fhalf
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 40($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 4($v0)
	lw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r2.3366
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 16($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_r1.3352
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 56($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fhalf
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 44($sp)
	add.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 8($v0)
beq_cont.9050:
	lw	$v0, 4($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.3159
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$v1, $v0, 0
	lw	$v0, 0($sp)
	j	vecunit_sgn.2951
get_nvector.5116:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sw	$a0, 0($sp)
	sw	$v0, 4($sp)
	sw	$a2, 8($sp)
	sw	$v1, 12($sp)
	sw	$a1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.3133
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9051
	lw	$t8, 16($sp)
	lw	$v0, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9051:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9052
	lw	$t8, 8($sp)
	lw	$v0, 4($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9052:
	lw	$t8, 0($sp)
	lw	$v0, 4($sp)
	lw	$s7, ($t8)
	jr	$s7
utexture.5122:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$v1, 8($sp)
	sw	$a0, 12($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_texturetype.3120
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_color_red.3310
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 0($v0)
	lw	$v1, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_color_green.3324
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 4($v0)
	lw	$v1, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_color_blue.3338
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 8($v0)
	li	$v1, 1
	lw	$a0, 20($sp)
	bne	$a0, $v1, beq_else.9053
	lw	$v1, 8($sp)
	l.s	$f0, 0($v1)
	lw	$a0, 16($sp)
	s.s	$f0, 24($sp)
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.3240
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6675
	l.s	$f2, 0($v0)
	mul.s	$f2, $f0, $f2
	s.s	$f0, 28($sp)
	mov.s	$f0, $f2
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_floor
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	la	$v0, l.6376
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	l.s	$f2, 28($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6678
	l.s	$f2, 0($v0)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fless
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v1, 8($sp)
	l.s	$f0, 8($v1)
	lw	$v1, 16($sp)
	sw	$v0, 32($sp)
	s.s	$f0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_z.3268
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6675
	l.s	$f2, 0($v0)
	mul.s	$f2, $f0, $f2
	s.s	$f0, 40($sp)
	mov.s	$f0, $f2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_floor
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	la	$v0, l.6376
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	l.s	$f2, 40($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6678
	l.s	$f2, 0($v0)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fless
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	lw	$a0, 32($sp)
	bne	$a0, $v1, beq_else.9054
	li	$v1, 0
	bne	$v0, $v1, beq_else.9056
	la	$v0, l.6410
	l.s	$f0, 0($v0)
	b	beq_cont.9057
beq_else.9056:
	la	$v0, l.6250
	l.s	$f0, 0($v0)
beq_cont.9057:
	b	beq_cont.9055
beq_else.9054:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9058
	la	$v0, l.6250
	l.s	$f0, 0($v0)
	b	beq_cont.9059
beq_else.9058:
	la	$v0, l.6410
	l.s	$f0, 0($v0)
beq_cont.9059:
beq_cont.9055:
	lw	$v0, 12($sp)
	s.s	$f0, 4($v0)
	jr	$ra
beq_else.9053:
	li	$v1, 2
	bne	$a0, $v1, beq_else.9061
	lw	$v1, 8($sp)
	l.s	$f0, 4($v1)
	la	$v1, l.6690
	l.s	$f2, 0($v1)
	mul.s	$f0, $f0, $f2
	lw	$t8, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fsqr
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	la	$v0, l.6410
	l.s	$f2, 0($v0)
	mul.s	$f2, $f2, $f0
	lw	$v0, 12($sp)
	s.s	$f2, 0($v0)
	la	$v1, l.6410
	l.s	$f2, 0($v1)
	la	$v1, l.6248
	l.s	$f4, 0($v1)
	sub.s	$f0, $f4, $f0
	mul.s	$f0, $f2, $f0
	s.s	$f0, 4($v0)
	jr	$ra
beq_else.9061:
	li	$v1, 3
	bne	$a0, $v1, beq_else.9063
	lw	$v1, 8($sp)
	l.s	$f0, 0($v1)
	lw	$a0, 16($sp)
	s.s	$f0, 44($sp)
	addi	$v0, $a0, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_x.3240
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	l.s	$f2, 8($v0)
	lw	$v0, 16($sp)
	s.s	$f0, 48($sp)
	s.s	$f2, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_z.3268
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 52($sp)
	sub.s	$f0, $f2, $f0
	l.s	$f2, 48($sp)
	s.s	$f0, 56($sp)
	mov.s	$f0, $f2
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fsqr
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 56($sp)
	s.s	$f0, 60($sp)
	mov.s	$f0, $f2
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fsqr
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 60($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_sqrt
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	la	$v0, l.6678
	l.s	$f2, 0($v0)
	div.s	$f0, $f0, $f2
	s.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_floor
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	l.s	$f2, 64($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6700
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	lw	$t8, 0($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fsqr
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	la	$v0, l.6410
	l.s	$f2, 0($v0)
	mul.s	$f2, $f0, $f2
	lw	$v0, 12($sp)
	s.s	$f2, 4($v0)
	la	$v1, l.6248
	l.s	$f2, 0($v1)
	sub.s	$f0, $f2, $f0
	la	$v1, l.6410
	l.s	$f2, 0($v1)
	mul.s	$f0, $f0, $f2
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.9063:
	li	$v1, 4
	bne	$a0, $v1, beq_else.9065
	lw	$v1, 8($sp)
	l.s	$f0, 0($v1)
	lw	$a0, 16($sp)
	s.s	$f0, 68($sp)
	addi	$v0, $a0, 0
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	o_param_x.3240
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f2, 68($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_a.3185
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_sqrt
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	l.s	$f2, 72($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	l.s	$f2, 8($v0)
	lw	$v1, 16($sp)
	s.s	$f0, 76($sp)
	s.s	$f2, 80($sp)
	addi	$v0, $v1, 0
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_param_z.3268
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	l.s	$f2, 80($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 84($sp)
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	o_param_c.3213
	addi	$sp, $sp, -92
	lw	$ra, 88($sp)
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	min_caml_sqrt
	addi	$sp, $sp, -92
	lw	$ra, 88($sp)
	l.s	$f2, 84($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 76($sp)
	s.s	$f0, 88($sp)
	mov.s	$f0, $f2
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	l.s	$f2, 88($sp)
	s.s	$f0, 92($sp)
	mov.s	$f0, $f2
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_fsqr
	addi	$sp, $sp, -100
	lw	$ra, 96($sp)
	l.s	$f2, 92($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 76($sp)
	s.s	$f0, 96($sp)
	mov.s	$f0, $f2
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fabs
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	la	$v0, l.6709
	l.s	$f2, 0($v0)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fless
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9066
	l.s	$f0, 88($sp)
	l.s	$f2, 76($sp)
	div.s	$f0, $f0, $f2
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fabs
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	atan.2673
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	la	$v0, l.6378
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6700
	l.s	$f2, 0($v0)
	div.s	$f0, $f0, $f2
	b	beq_cont.9067
beq_else.9066:
	la	$v0, l.6713
	l.s	$f0, 0($v0)
beq_cont.9067:
	s.s	$f0, 100($sp)
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	min_caml_floor
	addi	$sp, $sp, -108
	lw	$ra, 104($sp)
	l.s	$f2, 100($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	l.s	$f2, 4($v0)
	lw	$v0, 16($sp)
	s.s	$f0, 104($sp)
	s.s	$f2, 108($sp)
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	o_param_y.3254
	addi	$sp, $sp, -116
	lw	$ra, 112($sp)
	l.s	$f2, 108($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 112($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_param_b.3199
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_sqrt
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	l.s	$f2, 112($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 96($sp)
	s.s	$f0, 116($sp)
	mov.s	$f0, $f2
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_fabs
	addi	$sp, $sp, -124
	lw	$ra, 120($sp)
	la	$v0, l.6709
	l.s	$f2, 0($v0)
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_fless
	addi	$sp, $sp, -124
	lw	$ra, 120($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9068
	l.s	$f0, 116($sp)
	l.s	$f2, 96($sp)
	div.s	$f0, $f0, $f2
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_fabs
	addi	$sp, $sp, -124
	lw	$ra, 120($sp)
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	atan.2673
	addi	$sp, $sp, -124
	lw	$ra, 120($sp)
	la	$v0, l.6378
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6700
	l.s	$f2, 0($v0)
	div.s	$f0, $f0, $f2
	b	beq_cont.9069
beq_else.9068:
	la	$v0, l.6713
	l.s	$f0, 0($v0)
beq_cont.9069:
	s.s	$f0, 120($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_floor
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	l.s	$f2, 120($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6720
	l.s	$f2, 0($v0)
	la	$v0, l.6722
	l.s	$f4, 0($v0)
	l.s	$f6, 104($sp)
	sub.s	$f4, $f4, $f6
	s.s	$f0, 124($sp)
	s.s	$f2, 128($sp)
	mov.s	$f0, $f4
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_fsqr
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	l.s	$f2, 128($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6722
	l.s	$f2, 0($v0)
	l.s	$f4, 124($sp)
	sub.s	$f2, $f2, $f4
	s.s	$f0, 132($sp)
	mov.s	$f0, $f2
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	min_caml_fsqr
	addi	$sp, $sp, -140
	lw	$ra, 136($sp)
	l.s	$f2, 132($sp)
	sub.s	$f0, $f2, $f0
	s.s	$f0, 136($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_fisneg
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9070
	l.s	$f0, 136($sp)
	mov.s	$f0, $f0
	b	beq_cont.9071
beq_else.9070:
	la	$v0, l.6250
	l.s	$f0, 0($v0)
beq_cont.9071:
	la	$v0, l.6410
	l.s	$f2, 0($v0)
	mul.s	$f0, $f2, $f0
	la	$v0, l.6727
	l.s	$f2, 0($v0)
	div.s	$f0, $f0, $f2
	lw	$v0, 12($sp)
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.9065:
	jr	$ra
add_light.5279:
	lw	$v0, 8($t8)
	lw	$v1, 4($t8)
	s.s	$f4, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f0, 8($sp)
	sw	$v0, 12($sp)
	sw	$v1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fispos
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9074
	b	beq_cont.9075
beq_else.9074:
	lw	$v0, 16($sp)
	lw	$v1, 12($sp)
	l.s	$f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	vecaccum.3020
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.9075:
	l.s	$f0, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fispos
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9076
	jr	$ra
beq_else.9076:
	l.s	$f0, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fsqr
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fsqr
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 0($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 16($sp)
	l.s	$f2, 0($v0)
	add.s	$f2, $f2, $f0
	s.s	$f2, 0($v0)
	l.s	$f2, 4($v0)
	add.s	$f2, $f2, $f0
	s.s	$f2, 4($v0)
	l.s	$f2, 8($v0)
	add.s	$f0, $f2, $f0
	s.s	$f0, 8($v0)
	jr	$ra
trace_reflections.5305:
	lw	$a0, 32($t8)
	lw	$a1, 28($t8)
	lw	$a2, 24($t8)
	lw	$a3, 20($t8)
	lw	$t0, 16($t8)
	lw	$t1, 12($t8)
	lw	$t2, 8($t8)
	lw	$t3, 4($t8)
	li	$t4, 0
	bgt	$t4, $v0, ble_else.9079
	sll	$t4, $v0, 2
	add	$t9, $a1, $t4
	lw	$a1, ($t9)
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	s.s	$f2, 8($sp)
	sw	$t3, 12($sp)
	sw	$v1, 16($sp)
	s.s	$f0, 20($sp)
	sw	$a3, 24($sp)
	sw	$a0, 28($sp)
	sw	$a2, 32($sp)
	sw	$a1, 36($sp)
	sw	$t1, 40($sp)
	sw	$t2, 44($sp)
	sw	$t0, 48($sp)
	addi	$v0, $a1, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	r_dvec.3513
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$t8, 48($sp)
	sw	$v0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9080
	b	beq_cont.9081
beq_else.9080:
	lw	$v0, 44($sp)
	lw	$v0, 0($v0)
	sll	$v0, $v0, 2
	lw	$v1, 40($sp)
	lw	$v1, 0($v1)
	add	$v0, $v0, $v1
	lw	$v1, 36($sp)
	sw	$v0, 56($sp)
	addi	$v0, $v1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	r_surface_id.3508
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v1, 56($sp)
	bne	$v1, $v0, beq_else.9082
	li	$v0, 0
	lw	$v1, 32($sp)
	lw	$v1, 0($v1)
	lw	$t8, 28($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9084
	lw	$v0, 52($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_vec.3500
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$v1, $v0, 0
	lw	$v0, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veciprod.2986
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 36($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	r_bright.3518
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 20($sp)
	mul.s	$f4, $f0, $f2
	l.s	$f6, 60($sp)
	mul.s	$f4, $f4, $f6
	lw	$v0, 52($sp)
	s.s	$f4, 64($sp)
	s.s	$f0, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	d_vec.3500
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	addi	$v1, $v0, 0
	lw	$v0, 16($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	veciprod.2986
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f2, 68($sp)
	mul.s	$f2, $f2, $f0
	lw	$t8, 12($sp)
	l.s	$f0, 64($sp)
	l.s	$f4, 8($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	b	beq_cont.9085
beq_else.9084:
beq_cont.9085:
	b	beq_cont.9083
beq_else.9082:
beq_cont.9083:
beq_cont.9081:
	lw	$v0, 4($sp)
	addi	$v0, $v0, -1
	lw	$t8, 0($sp)
	lw	$v1, 16($sp)
	l.s	$f0, 20($sp)
	l.s	$f2, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9079:
	jr	$ra
trace_ray.5339:
	lw	$a1, 80($t8)
	lw	$a2, 76($t8)
	lw	$a3, 72($t8)
	lw	$t0, 68($t8)
	lw	$t1, 64($t8)
	lw	$t2, 60($t8)
	lw	$t3, 56($t8)
	lw	$t4, 52($t8)
	lw	$t5, 48($t8)
	lw	$t6, 44($t8)
	lw	$t7, 40($t8)
	lw	$s0, 36($t8)
	lw	$s1, 32($t8)
	lw	$s2, 28($t8)
	lw	$s3, 24($t8)
	lw	$s4, 20($t8)
	lw	$s5, 16($t8)
	lw	$s6, 12($t8)
	lw	$s7, 8($t8)
	sw	$t8, 0($sp)
	lw	$t8, 4($t8)
	sw	$a3, 4($sp)
	li	$a3, 4
	bgt	$v0, $a3, ble_else.9087
	s.s	$f2, 8($sp)
	sw	$a2, 12($sp)
	sw	$s0, 16($sp)
	sw	$t3, 20($sp)
	sw	$t8, 24($sp)
	sw	$t2, 28($sp)
	sw	$t5, 32($sp)
	sw	$t7, 36($sp)
	sw	$t0, 40($sp)
	sw	$a0, 44($sp)
	sw	$s3, 48($sp)
	sw	$a1, 52($sp)
	sw	$s4, 56($sp)
	sw	$t1, 60($sp)
	sw	$s6, 64($sp)
	sw	$t6, 68($sp)
	sw	$s5, 72($sp)
	sw	$t4, 76($sp)
	sw	$s7, 80($sp)
	s.s	$f0, 84($sp)
	sw	$s1, 88($sp)
	sw	$v0, 92($sp)
	sw	$v1, 96($sp)
	sw	$s2, 100($sp)
	addi	$v0, $a0, 0
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	p_surface_ids.3427
	addi	$sp, $sp, -108
	lw	$ra, 104($sp)
	lw	$t8, 100($sp)
	lw	$v1, 96($sp)
	sw	$v0, 104($sp)
	addi	$v0, $v1, 0
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9088
	li	$v0, -1
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	lw	$a1, 104($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	li	$v0, 0
	bne	$v1, $v0, beq_else.9089
	jr	$ra
beq_else.9089:
	lw	$v0, 96($sp)
	lw	$v1, 88($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	veciprod.2986
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_fneg
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	s.s	$f0, 108($sp)
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_fispos
	addi	$sp, $sp, -116
	lw	$ra, 112($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9091
	jr	$ra
beq_else.9091:
	l.s	$f0, 108($sp)
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_fsqr
	addi	$sp, $sp, -116
	lw	$ra, 112($sp)
	l.s	$f2, 108($sp)
	mul.s	$f0, $f0, $f2
	l.s	$f2, 84($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 80($sp)
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	lw	$v0, 76($sp)
	l.s	$f2, 0($v0)
	add.s	$f2, $f2, $f0
	s.s	$f2, 0($v0)
	l.s	$f2, 4($v0)
	add.s	$f2, $f2, $f0
	s.s	$f2, 4($v0)
	l.s	$f2, 8($v0)
	add.s	$f0, $f2, $f0
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.9088:
	lw	$v0, 72($sp)
	lw	$v0, 0($v0)
	sll	$v1, $v0, 2
	lw	$a0, 68($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	sw	$v0, 112($sp)
	sw	$v1, 116($sp)
	addi	$v0, $v1, 0
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	o_reflectiontype.3146
	addi	$sp, $sp, -124
	lw	$ra, 120($sp)
	lw	$v1, 116($sp)
	sw	$v0, 120($sp)
	addi	$v0, $v1, 0
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	o_diffuse.3282
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	l.s	$f2, 84($sp)
	mul.s	$f0, $f0, $f2
	lw	$t8, 64($sp)
	lw	$v0, 116($sp)
	lw	$v1, 96($sp)
	s.s	$f0, 124($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	lw	$v0, 60($sp)
	lw	$v1, 56($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	veccpy.2937
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	lw	$t8, 52($sp)
	lw	$v0, 116($sp)
	lw	$v1, 56($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	lw	$v0, 112($sp)
	sll	$v0, $v0, 2
	lw	$v1, 48($sp)
	lw	$v1, 0($v1)
	add	$v0, $v0, $v1
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	lw	$a1, 104($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	lw	$v0, 44($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	p_intersection_points.3417
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lw	$v0, ($t9)
	lw	$a0, 56($sp)
	addi	$v1, $a0, 0
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	veccpy.2937
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	lw	$v0, 44($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	p_calc_diffuse.3437
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	lw	$v1, 116($sp)
	sw	$v0, 128($sp)
	addi	$v0, $v1, 0
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	o_diffuse.3282
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	la	$v0, l.6722
	l.s	$f2, 0($v0)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_fless
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9094
	li	$v0, 1
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	lw	$a1, 128($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	lw	$v0, 44($sp)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	p_energy.3447
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lw	$a0, ($t9)
	lw	$a1, 40($sp)
	sw	$v0, 132($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	veccpy.2937
	addi	$sp, $sp, -140
	lw	$ra, 136($sp)
	lw	$v0, 92($sp)
	sll	$v1, $v0, 2
	lw	$a0, 132($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	la	$a0, l.6757
	l.s	$f0, 0($a0)
	l.s	$f2, 124($sp)
	mul.s	$f0, $f0, $f2
	addi	$v0, $v1, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	vecscale.3070
	addi	$sp, $sp, -140
	lw	$ra, 136($sp)
	lw	$v0, 44($sp)
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	p_nvectors.3490
	addi	$sp, $sp, -140
	lw	$ra, 136($sp)
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lw	$v0, ($t9)
	lw	$a0, 36($sp)
	addi	$v1, $a0, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	veccpy.2937
	addi	$sp, $sp, -140
	lw	$ra, 136($sp)
	b	beq_cont.9095
beq_else.9094:
	li	$v0, 0
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	lw	$a1, 128($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
beq_cont.9095:
	la	$v0, l.6761
	l.s	$f0, 0($v0)
	lw	$v0, 96($sp)
	lw	$v1, 36($sp)
	s.s	$f0, 136($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	veciprod.2986
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	l.s	$f2, 136($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 96($sp)
	lw	$v1, 36($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	vecaccum.3020
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	lw	$v0, 116($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	o_hilight.3296
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	l.s	$f2, 84($sp)
	mul.s	$f0, $f2, $f0
	li	$v0, 0
	lw	$v1, 32($sp)
	lw	$v1, 0($v1)
	lw	$t8, 28($sp)
	s.s	$f0, 140($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -148
	lw	$ra, 144($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9096
	lw	$v0, 36($sp)
	lw	$v1, 88($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	veciprod.2986
	addi	$sp, $sp, -148
	lw	$ra, 144($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	min_caml_fneg
	addi	$sp, $sp, -148
	lw	$ra, 144($sp)
	l.s	$f2, 124($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 96($sp)
	lw	$v1, 88($sp)
	s.s	$f0, 144($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	veciprod.2986
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fneg
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	mov.s	$f2, $f0
	lw	$t8, 24($sp)
	l.s	$f0, 144($sp)
	l.s	$f4, 140($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	b	beq_cont.9097
beq_else.9096:
beq_cont.9097:
	lw	$t8, 20($sp)
	lw	$v0, 56($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lw	$v0, 16($sp)
	lw	$v0, 0($v0)
	addi	$v0, $v0, -1
	lw	$t8, 12($sp)
	lw	$v1, 96($sp)
	l.s	$f0, 124($sp)
	l.s	$f2, 140($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	la	$v0, l.6765
	l.s	$f0, 0($v0)
	l.s	$f2, 84($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fless
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9098
	jr	$ra
beq_else.9098:
	li	$v0, 4
	lw	$v1, 92($sp)
	bgt	$v0, $v1, ble_else.9100
	b	ble_cont.9101
ble_else.9100:
	addi	$v0, $v1, 1
	li	$a0, -1
	sll	$v0, $v0, 2
	lw	$a1, 104($sp)
	add	$t9, $a1, $v0
	sw	$a0, ($t9)
ble_cont.9101:
	li	$v0, 2
	lw	$v1, 120($sp)
	bne	$v1, $v0, beq_else.9102
	la	$v0, l.6248
	l.s	$f0, 0($v0)
	lw	$v0, 116($sp)
	s.s	$f0, 148($sp)
	sw	$ra, 152($sp)
	addi	$sp, $sp, 156
	jal	o_diffuse.3282
	addi	$sp, $sp, -156
	lw	$ra, 152($sp)
	l.s	$f2, 148($sp)
	sub.s	$f0, $f2, $f0
	l.s	$f2, 84($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 92($sp)
	addi	$v0, $v0, 1
	lw	$v1, 4($sp)
	l.s	$f2, 0($v1)
	l.s	$f4, 8($sp)
	add.s	$f2, $f4, $f2
	lw	$t8, 0($sp)
	lw	$v1, 96($sp)
	lw	$a0, 44($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9102:
	jr	$ra
ble_else.9087:
	jr	$ra
trace_diffuse_ray.5457:
	lw	$v1, 48($t8)
	lw	$a0, 44($t8)
	lw	$a1, 40($t8)
	lw	$a2, 36($t8)
	lw	$a3, 32($t8)
	lw	$t0, 28($t8)
	lw	$t1, 24($t8)
	lw	$t2, 20($t8)
	lw	$t3, 16($t8)
	lw	$t4, 12($t8)
	lw	$t5, 8($t8)
	lw	$t6, 4($t8)
	sw	$a0, 0($sp)
	sw	$t6, 4($sp)
	s.s	$f0, 8($sp)
	sw	$t1, 12($sp)
	sw	$t0, 16($sp)
	sw	$a1, 20($sp)
	sw	$a2, 24($sp)
	sw	$t3, 28($sp)
	sw	$v1, 32($sp)
	sw	$t5, 36($sp)
	sw	$v0, 40($sp)
	sw	$a3, 44($sp)
	sw	$t4, 48($sp)
	addi	$t8, $t2, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9105
	jr	$ra
beq_else.9105:
	lw	$v0, 48($sp)
	lw	$v0, 0($v0)
	sll	$v0, $v0, 2
	lw	$v1, 44($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	lw	$v1, 40($sp)
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	d_vec.3500
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	addi	$v1, $v0, 0
	lw	$t8, 36($sp)
	lw	$v0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	lw	$t8, 32($sp)
	lw	$v0, 52($sp)
	lw	$v1, 28($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	li	$v0, 0
	lw	$v1, 24($sp)
	lw	$v1, 0($v1)
	lw	$t8, 20($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9107
	lw	$v0, 16($sp)
	lw	$v1, 12($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	veciprod.2986
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fneg
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fispos
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9108
	la	$v0, l.6250
	l.s	$f0, 0($v0)
	b	beq_cont.9109
beq_else.9108:
	l.s	$f0, 56($sp)
	mov.s	$f0, $f0
beq_cont.9109:
	l.s	$f2, 8($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 52($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_diffuse.3282
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 60($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	lw	$v1, 0($sp)
	j	vecaccum.3020
beq_else.9107:
	jr	$ra
iter_trace_diffuse_rays.5481:
	lw	$a2, 4($t8)
	li	$a3, 0
	bgt	$a3, $a1, ble_else.9111
	sll	$a3, $a1, 2
	add	$t9, $v0, $a3
	lw	$a3, ($t9)
	sw	$a0, 0($sp)
	sw	$t8, 4($sp)
	sw	$a2, 8($sp)
	sw	$v0, 12($sp)
	sw	$a1, 16($sp)
	sw	$v1, 20($sp)
	addi	$v0, $a3, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	d_vec.3500
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	veciprod.2986
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fisneg
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9112
	lw	$v0, 16($sp)
	sll	$v1, $v0, 2
	lw	$a0, 12($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	la	$a1, l.6776
	l.s	$f0, 0($a1)
	l.s	$f2, 24($sp)
	div.s	$f0, $f2, $f0
	lw	$t8, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	b	beq_cont.9113
beq_else.9112:
	lw	$v0, 16($sp)
	addi	$v1, $v0, 1
	sll	$v1, $v1, 2
	lw	$a0, 12($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	la	$a1, l.6779
	l.s	$f0, 0($a1)
	l.s	$f2, 24($sp)
	div.s	$f0, $f2, $f0
	lw	$t8, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
beq_cont.9113:
	lw	$v0, 16($sp)
	addi	$a1, $v0, -2
	lw	$t8, 4($sp)
	lw	$v0, 12($sp)
	lw	$v1, 20($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9111:
	jr	$ra
trace_diffuse_rays.5503:
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$v0, 8($sp)
	sw	$a2, 12($sp)
	addi	$v0, $a0, 0
	addi	$t8, $a1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$a1, 118
	lw	$t8, 12($sp)
	lw	$v0, 8($sp)
	lw	$v1, 4($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
trace_diffuse_ray_80percent.5509:
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	li	$a3, 0
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$v0, 16($sp)
	bne	$v0, $a3, beq_else.9115
	b	beq_cont.9116
beq_else.9115:
	lw	$a3, 0($a2)
	addi	$v0, $a3, 0
	addi	$t8, $a1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.9116:
	li	$v0, 1
	lw	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9117
	b	beq_cont.9118
beq_else.9117:
	lw	$v0, 12($sp)
	lw	$a0, 4($v0)
	lw	$t8, 8($sp)
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	addi	$a0, $a2, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.9118:
	li	$v0, 2
	lw	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9119
	b	beq_cont.9120
beq_else.9119:
	lw	$v0, 12($sp)
	lw	$a0, 8($v0)
	lw	$t8, 8($sp)
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	addi	$a0, $a2, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.9120:
	li	$v0, 3
	lw	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9121
	b	beq_cont.9122
beq_else.9121:
	lw	$v0, 12($sp)
	lw	$a0, 12($v0)
	lw	$t8, 8($sp)
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	addi	$a0, $a2, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.9122:
	li	$v0, 4
	lw	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9123
	jr	$ra
beq_else.9123:
	lw	$v0, 12($sp)
	lw	$v0, 16($v0)
	lw	$t8, 8($sp)
	lw	$v1, 4($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
calc_diffuse_using_1point.5532:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	sw	$v1, 12($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	p_received_ray_20percent.3457
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_nvectors.3490
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 16($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_intersection_points.3417
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v1, 16($sp)
	sw	$v0, 28($sp)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_energy.3447
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v1, 12($sp)
	sll	$a0, $v1, 2
	lw	$a1, 20($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	lw	$a1, 8($sp)
	sw	$v0, 32($sp)
	addi	$v1, $a0, 0
	addi	$v0, $a1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veccpy.2937
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 16($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_group_id.3467
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v1, 12($sp)
	sll	$a0, $v1, 2
	lw	$a1, 24($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	sll	$a1, $v1, 2
	lw	$a2, 28($sp)
	add	$t9, $a2, $a1
	lw	$a1, ($t9)
	lw	$t8, 4($sp)
	addi	$v1, $a0, 0
	addi	$a0, $a1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 12($sp)
	sll	$v0, $v0, 2
	lw	$v1, 32($sp)
	add	$t9, $v1, $v0
	lw	$v1, ($t9)
	lw	$v0, 0($sp)
	lw	$a0, 8($sp)
	j	vecaccumv.3087
calc_diffuse_using_5points.5546:
	lw	$a3, 8($t8)
	lw	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $v1, $t1
	lw	$v1, ($t9)
	sw	$a3, 0($sp)
	sw	$t0, 4($sp)
	sw	$a2, 8($sp)
	sw	$a1, 12($sp)
	sw	$a0, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_received_ray_20percent.3457
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	addi	$a0, $v1, -1
	sll	$a0, $a0, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	sw	$v0, 24($sp)
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_received_ray_20percent.3457
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v1, 20($sp)
	sll	$a0, $v1, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	sw	$v0, 28($sp)
	addi	$v0, $a0, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_received_ray_20percent.3457
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v1, 20($sp)
	addi	$a0, $v1, 1
	sll	$a0, $a0, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	sw	$v0, 32($sp)
	addi	$v0, $a0, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_received_ray_20percent.3457
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v1, 20($sp)
	sll	$a0, $v1, 2
	lw	$a1, 12($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	sw	$v0, 36($sp)
	addi	$v0, $a0, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	p_received_ray_20percent.3457
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	lw	$v1, 8($sp)
	sll	$a0, $v1, 2
	lw	$a1, 24($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	lw	$a1, 4($sp)
	sw	$v0, 40($sp)
	addi	$v1, $a0, 0
	addi	$v0, $a1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veccpy.2937
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 8($sp)
	sll	$v1, $v0, 2
	lw	$a0, 28($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	lw	$a0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.3047
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 8($sp)
	sll	$v1, $v0, 2
	lw	$a0, 32($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	lw	$a0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.3047
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 8($sp)
	sll	$v1, $v0, 2
	lw	$a0, 36($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	lw	$a0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.3047
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 8($sp)
	sll	$v1, $v0, 2
	lw	$a0, 40($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	lw	$a0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.3047
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 20($sp)
	sll	$v0, $v0, 2
	lw	$v1, 16($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_energy.3447
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v1, 8($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lw	$v1, ($t9)
	lw	$v0, 0($sp)
	lw	$a0, 4($sp)
	j	vecaccumv.3087
do_without_neighbors.5579:
	lw	$a0, 4($t8)
	li	$a1, 4
	bgt	$v1, $a1, ble_else.9125
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	sw	$v1, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	p_surface_ids.3427
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	lw	$a0, 12($sp)
	sll	$a1, $a0, 2
	add	$t9, $v0, $a1
	lw	$v0, ($t9)
	bgt	$v1, $v0, ble_else.9126
	lw	$v0, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	p_calc_diffuse.3437
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v1, 12($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lw	$v0, ($t9)
	li	$a0, 0
	bne	$v0, $a0, beq_else.9127
	b	beq_cont.9128
beq_else.9127:
	lw	$t8, 4($sp)
	lw	$v0, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
beq_cont.9128:
	lw	$v0, 12($sp)
	addi	$v1, $v0, 1
	lw	$t8, 0($sp)
	lw	$v0, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9126:
	jr	$ra
ble_else.9125:
	jr	$ra
neighbors_exist.5592:
	lw	$a0, 4($t8)
	lw	$a1, 4($a0)
	addi	$a2, $v1, 1
	bgt	$a1, $a2, ble_else.9131
	li	$v0, 0
	jr	$ra
ble_else.9131:
	li	$a1, 0
	bgt	$v1, $a1, ble_else.9132
	li	$v0, 0
	jr	$ra
ble_else.9132:
	lw	$v1, 0($a0)
	addi	$a0, $v0, 1
	bgt	$v1, $a0, ble_else.9133
	li	$v0, 0
	jr	$ra
ble_else.9133:
	li	$v1, 0
	bgt	$v0, $v1, ble_else.9134
	li	$v0, 0
	jr	$ra
ble_else.9134:
	li	$v0, 1
	jr	$ra
get_surface_id.5606:
	sw	$v1, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	p_surface_ids.3427
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lw	$v0, ($t9)
	jr	$ra
neighbors_are_available.5610:
	sll	$a3, $v0, 2
	add	$t9, $a0, $a3
	lw	$a3, ($t9)
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$a2, 8($sp)
	sw	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v1, $a2, 0
	addi	$v0, $a3, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	get_surface_id.5606
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 16($sp)
	sll	$a0, $v1, 2
	lw	$a1, 12($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	lw	$a1, 8($sp)
	sw	$v0, 20($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5606
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9135
	lw	$v0, 16($sp)
	sll	$a0, $v0, 2
	lw	$a1, 4($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	lw	$a1, 8($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5606
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9136
	lw	$v0, 16($sp)
	addi	$a0, $v0, -1
	sll	$a0, $a0, 2
	lw	$a1, 0($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	lw	$a2, 8($sp)
	addi	$v1, $a2, 0
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5606
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9137
	lw	$v0, 16($sp)
	addi	$v0, $v0, 1
	sll	$v0, $v0, 2
	lw	$a0, 0($sp)
	add	$t9, $a0, $v0
	lw	$v0, ($t9)
	lw	$a0, 8($sp)
	addi	$v1, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5606
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9138
	li	$v0, 1
	jr	$ra
beq_else.9138:
	li	$v0, 0
	jr	$ra
beq_else.9137:
	li	$v0, 0
	jr	$ra
beq_else.9136:
	li	$v0, 0
	jr	$ra
beq_else.9135:
	li	$v0, 0
	jr	$ra
try_exploit_neighbors.5630:
	lw	$t0, 8($t8)
	lw	$t1, 4($t8)
	sll	$t2, $v0, 2
	add	$t9, $a1, $t2
	lw	$t2, ($t9)
	li	$t3, 4
	bgt	$a3, $t3, ble_else.9139
	li	$t3, 0
	sw	$v1, 0($sp)
	sw	$t8, 4($sp)
	sw	$t1, 8($sp)
	sw	$t2, 12($sp)
	sw	$t0, 16($sp)
	sw	$a3, 20($sp)
	sw	$a2, 24($sp)
	sw	$a1, 28($sp)
	sw	$a0, 32($sp)
	sw	$v0, 36($sp)
	sw	$t3, 40($sp)
	addi	$v1, $a3, 0
	addi	$v0, $t2, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	get_surface_id.5606
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v1, 40($sp)
	bgt	$v1, $v0, ble_else.9140
	lw	$v0, 36($sp)
	lw	$v1, 32($sp)
	lw	$a0, 28($sp)
	lw	$a1, 24($sp)
	lw	$a2, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	neighbors_are_available.5610
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9141
	lw	$v0, 36($sp)
	sll	$v0, $v0, 2
	lw	$v1, 28($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	lw	$t8, 16($sp)
	lw	$v1, 20($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9141:
	lw	$v0, 12($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_calc_diffuse.3437
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a2, 20($sp)
	sll	$v1, $a2, 2
	add	$t9, $v0, $v1
	lw	$v0, ($t9)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9142
	b	beq_cont.9143
beq_else.9142:
	lw	$t8, 8($sp)
	lw	$v0, 36($sp)
	lw	$v1, 32($sp)
	lw	$a0, 28($sp)
	lw	$a1, 24($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
beq_cont.9143:
	lw	$v0, 20($sp)
	addi	$a3, $v0, 1
	lw	$t8, 4($sp)
	lw	$v0, 36($sp)
	lw	$v1, 0($sp)
	lw	$a0, 32($sp)
	lw	$a1, 28($sp)
	lw	$a2, 24($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9140:
	jr	$ra
ble_else.9139:
	jr	$ra
write_ppm_header.5650:
	lw	$v0, 4($t8)
	li	$v1, 80
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 51
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 10
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	lw	$v1, 0($v0)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	lw	$v0, 4($v0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 255
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 10
	j	min_caml_print_char
write_rgb_element.5673:
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_int_of_float
	addi	$sp, $sp, -4
	lw	$ra, 0($sp)
	li	$v1, 255
	bgt	$v0, $v1, ble_else.9146
	li	$v1, 0
	bgt	$v1, $v0, ble_else.9148
	b	ble_cont.9149
ble_else.9148:
	li	$v0, 0
ble_cont.9149:
	b	ble_cont.9147
ble_else.9146:
	li	$v0, 255
ble_cont.9147:
	j	min_caml_print_int
write_rgb.5679:
	lw	$v0, 4($t8)
	l.s	$f0, 0($v0)
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.5673
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	l.s	$f0, 4($v0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.5673
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	l.s	$f0, 8($v0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.5673
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 10
	j	min_caml_print_char
pretrace_diffuse_rays.5695:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	li	$a3, 4
	bgt	$v1, $a3, ble_else.9150
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$v1, 16($sp)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5606
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bgt	$v1, $v0, ble_else.9151
	lw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_calc_diffuse.3437
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 16($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lw	$v0, ($t9)
	li	$a0, 0
	bne	$v0, $a0, beq_else.9152
	b	beq_cont.9153
beq_else.9152:
	lw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_group_id.3467
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 12($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	vecbzero.2934
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_nvectors.3490
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v1, 20($sp)
	sw	$v0, 28($sp)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_intersection_points.3417
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v1, 24($sp)
	sll	$v1, $v1, 2
	lw	$a0, 8($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	lw	$a0, 16($sp)
	sll	$a1, $a0, 2
	lw	$a2, 28($sp)
	add	$t9, $a2, $a1
	lw	$a1, ($t9)
	sll	$a2, $a0, 2
	add	$t9, $v0, $a2
	lw	$v0, ($t9)
	lw	$t8, 4($sp)
	addi	$a0, $v0, 0
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 20($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_received_ray_20percent.3457
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v1, 16($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lw	$v0, ($t9)
	lw	$a0, 12($sp)
	addi	$v1, $a0, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	veccpy.2937
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
beq_cont.9153:
	lw	$v0, 16($sp)
	addi	$v1, $v0, 1
	lw	$t8, 0($sp)
	lw	$v0, 20($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9151:
	jr	$ra
ble_else.9150:
	jr	$ra
pretrace_pixels.5717:
	lw	$a1, 36($t8)
	lw	$a2, 32($t8)
	lw	$a3, 28($t8)
	lw	$t0, 24($t8)
	lw	$t1, 20($t8)
	lw	$t2, 16($t8)
	lw	$t3, 12($t8)
	lw	$t4, 8($t8)
	lw	$t5, 4($t8)
	li	$t6, 0
	bgt	$t6, $v1, ble_else.9156
	l.s	$f6, 0($t1)
	lw	$t1, 0($t5)
	sub	$t1, $v1, $t1
	sw	$t8, 0($sp)
	sw	$t4, 4($sp)
	sw	$a0, 8($sp)
	sw	$a2, 12($sp)
	sw	$v0, 16($sp)
	sw	$v1, 20($sp)
	sw	$a1, 24($sp)
	sw	$a3, 28($sp)
	sw	$t2, 32($sp)
	s.s	$f4, 36($sp)
	s.s	$f2, 40($sp)
	sw	$t3, 44($sp)
	s.s	$f0, 48($sp)
	sw	$t0, 52($sp)
	s.s	$f6, 56($sp)
	addi	$v0, $t1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_float_of_int
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 56($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 52($sp)
	l.s	$f2, 0($v0)
	mul.s	$f2, $f0, $f2
	l.s	$f4, 48($sp)
	add.s	$f2, $f2, $f4
	lw	$v1, 44($sp)
	s.s	$f2, 0($v1)
	l.s	$f2, 4($v0)
	mul.s	$f2, $f0, $f2
	l.s	$f6, 40($sp)
	add.s	$f2, $f2, $f6
	s.s	$f2, 4($v1)
	l.s	$f2, 8($v0)
	mul.s	$f0, $f0, $f2
	l.s	$f2, 36($sp)
	add.s	$f0, $f0, $f2
	s.s	$f0, 8($v1)
	li	$v0, 0
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	vecunit_sgn.2951
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	vecbzero.2934
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 28($sp)
	lw	$v1, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veccpy.2937
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v0, 0
	la	$v1, l.6248
	l.s	$f0, 0($v1)
	lw	$v1, 20($sp)
	sll	$a0, $v1, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	la	$a2, l.6250
	l.s	$f2, 0($a2)
	lw	$t8, 12($sp)
	lw	$a2, 44($sp)
	addi	$v1, $a2, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 20($sp)
	sll	$v1, $v0, 2
	lw	$a0, 16($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	addi	$v0, $v1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	p_rgb.3407
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v1, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veccpy.2937
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 20($sp)
	sll	$v1, $v0, 2
	lw	$a0, 16($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	lw	$a1, 8($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	p_set_group_id.3478
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 20($sp)
	sll	$v1, $v0, 2
	lw	$a0, 16($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	li	$a1, 0
	lw	$t8, 4($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 20($sp)
	addi	$v0, $v0, -1
	li	$v1, 1
	lw	$a0, 8($sp)
	sw	$v0, 60($sp)
	addi	$v0, $a0, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	add_mod5.2910
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	addi	$a0, $v0, 0
	lw	$t8, 0($sp)
	lw	$v0, 16($sp)
	lw	$v1, 60($sp)
	l.s	$f0, 48($sp)
	l.s	$f2, 40($sp)
	l.s	$f4, 36($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9156:
	jr	$ra
pretrace_line.5771:
	lw	$a1, 24($t8)
	lw	$a2, 20($t8)
	lw	$a3, 16($t8)
	lw	$t0, 12($t8)
	lw	$t1, 8($t8)
	lw	$t2, 4($t8)
	l.s	$f0, 0($a3)
	lw	$a3, 4($t2)
	sub	$v1, $v1, $a3
	sw	$a0, 0($sp)
	sw	$v0, 4($sp)
	sw	$t0, 8($sp)
	sw	$t1, 12($sp)
	sw	$a1, 16($sp)
	sw	$a2, 20($sp)
	s.s	$f0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_float_of_int
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 20($sp)
	l.s	$f2, 0($v0)
	mul.s	$f2, $f0, $f2
	lw	$v1, 16($sp)
	l.s	$f4, 0($v1)
	add.s	$f2, $f2, $f4
	l.s	$f4, 4($v0)
	mul.s	$f4, $f0, $f4
	l.s	$f6, 4($v1)
	add.s	$f4, $f4, $f6
	l.s	$f6, 8($v0)
	mul.s	$f0, $f0, $f6
	l.s	$f6, 8($v1)
	add.s	$f0, $f0, $f6
	lw	$v0, 12($sp)
	lw	$v0, 0($v0)
	addi	$v1, $v0, -1
	lw	$t8, 8($sp)
	lw	$v0, 4($sp)
	lw	$a0, 0($sp)
	mov.s	$f30, $f4
	mov.s	$f4, $f0
	mov.s	$f0, $f2
	mov.s	$f2, $f30
	lw	$s7, ($t8)
	jr	$s7
scan_pixel.5804:
	lw	$a3, 24($t8)
	lw	$t0, 20($t8)
	lw	$t1, 16($t8)
	lw	$t2, 12($t8)
	lw	$t3, 8($t8)
	lw	$t4, 4($t8)
	lw	$t3, 0($t3)
	bgt	$t3, $v0, ble_else.9158
	jr	$ra
ble_else.9158:
	sll	$t3, $v0, 2
	add	$t9, $a1, $t3
	lw	$t3, ($t9)
	sw	$t8, 0($sp)
	sw	$a3, 4($sp)
	sw	$a0, 8($sp)
	sw	$t0, 12($sp)
	sw	$t4, 16($sp)
	sw	$a1, 20($sp)
	sw	$a2, 24($sp)
	sw	$v1, 28($sp)
	sw	$v0, 32($sp)
	sw	$t2, 36($sp)
	sw	$t1, 40($sp)
	addi	$v0, $t3, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_rgb.3407
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	addi	$v1, $v0, 0
	lw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veccpy.2937
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$t8, 36($sp)
	lw	$v0, 32($sp)
	lw	$v1, 28($sp)
	lw	$a0, 24($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9160
	lw	$v0, 32($sp)
	sll	$v1, $v0, 2
	lw	$a0, 20($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	li	$a1, 0
	lw	$t8, 16($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	b	beq_cont.9161
beq_else.9160:
	li	$a3, 0
	lw	$t8, 12($sp)
	lw	$v0, 32($sp)
	lw	$v1, 28($sp)
	lw	$a0, 8($sp)
	lw	$a1, 20($sp)
	lw	$a2, 24($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
beq_cont.9161:
	lw	$t8, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 32($sp)
	addi	$v0, $v0, 1
	lw	$t8, 0($sp)
	lw	$v1, 28($sp)
	lw	$a0, 8($sp)
	lw	$a1, 20($sp)
	lw	$a2, 24($sp)
	lw	$s7, ($t8)
	jr	$s7
scan_line.5825:
	lw	$a3, 12($t8)
	lw	$t0, 8($t8)
	lw	$t1, 4($t8)
	lw	$t2, 4($t1)
	bgt	$t2, $v0, ble_else.9162
	jr	$ra
ble_else.9162:
	lw	$t1, 4($t1)
	addi	$t1, $t1, -1
	sw	$t8, 0($sp)
	sw	$a2, 4($sp)
	sw	$a1, 8($sp)
	sw	$a0, 12($sp)
	sw	$v1, 16($sp)
	sw	$v0, 20($sp)
	sw	$a3, 24($sp)
	bgt	$t1, $v0, ble_else.9164
	b	ble_cont.9165
ble_else.9164:
	addi	$t1, $v0, 1
	addi	$a0, $a2, 0
	addi	$v1, $t1, 0
	addi	$v0, $a1, 0
	addi	$t8, $t0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
ble_cont.9165:
	li	$v0, 0
	lw	$t8, 24($sp)
	lw	$v1, 20($sp)
	lw	$a0, 16($sp)
	lw	$a1, 12($sp)
	lw	$a2, 8($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 20($sp)
	addi	$v0, $v0, 1
	li	$v1, 2
	lw	$a0, 4($sp)
	sw	$v0, 28($sp)
	addi	$v0, $a0, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	add_mod5.2910
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	addi	$a2, $v0, 0
	lw	$t8, 0($sp)
	lw	$v0, 28($sp)
	lw	$v1, 12($sp)
	lw	$a0, 8($sp)
	lw	$a1, 16($sp)
	lw	$s7, ($t8)
	jr	$s7
create_float5x3array.5846:
	li	$v0, 3
	la	$v1, l.6250
	l.s	$f0, 0($v1)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_float_array
	addi	$sp, $sp, -4
	lw	$ra, 0($sp)
	addi	$v1, $v0, 0
	li	$v0, 5
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_array
	addi	$sp, $sp, -4
	lw	$ra, 0($sp)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	sw	$v0, 4($v1)
	li	$v0, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	sw	$v0, 8($v1)
	li	$v0, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	sw	$v0, 12($v1)
	li	$v0, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	sw	$v0, 16($v1)
	addi	$v0, $v1, 0
	jr	$ra
create_pixel.5873:
	li	$v0, 3
	la	$v1, l.6250
	l.s	$f0, 0($v1)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_float_array
	addi	$sp, $sp, -4
	lw	$ra, 0($sp)
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	create_float5x3array.5846
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v1, 5
	li	$a0, 0
	sw	$v0, 4($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_array
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v1, 5
	li	$a0, 0
	sw	$v0, 8($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	create_float5x3array.5846
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	create_float5x3array.5846
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_create_array
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	sw	$v0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	create_float5x3array.5846
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 32
	sw	$v0, 28($v1)
	lw	$v0, 24($sp)
	sw	$v0, 24($v1)
	lw	$v0, 20($sp)
	sw	$v0, 20($v1)
	lw	$v0, 16($sp)
	sw	$v0, 16($v1)
	lw	$v0, 12($sp)
	sw	$v0, 12($v1)
	lw	$v0, 8($sp)
	sw	$v0, 8($v1)
	lw	$v0, 4($sp)
	sw	$v0, 4($v1)
	lw	$v0, 0($sp)
	sw	$v0, 0($v1)
	addi	$v0, $v1, 0
	jr	$ra
init_line_elements.5895:
	li	$a0, 0
	bgt	$a0, $v1, ble_else.9166
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	create_pixel.5873
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 4($sp)
	sll	$a0, $v1, 2
	lw	$a1, 0($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	addi	$v1, $v1, -1
	addi	$v0, $a1, 0
	j	init_line_elements.5895
ble_else.9166:
	jr	$ra
create_pixelline.5904:
	lw	$v0, 4($t8)
	lw	$v1, 0($v0)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	create_pixel.5873
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	addi	$v1, $v0, 0
	lw	$v0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_array
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 0($sp)
	lw	$v1, 0($v1)
	addi	$v1, $v1, -2
	j	init_line_elements.5895
tan.5915:
	lw	$v0, 8($t8)
	lw	$v1, 4($t8)
	s.s	$f0, 0($sp)
	sw	$v1, 4($sp)
	addi	$t8, $v0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$t8, 4($sp)
	l.s	$f2, 0($sp)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	jr	$ra
adjust_position.5919:
	lw	$v0, 4($t8)
	mul.s	$f0, $f0, $f0
	la	$v1, l.6765
	l.s	$f4, 0($v1)
	add.s	$f0, $f0, $f4
	sw	$v0, 0($sp)
	s.s	$f2, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_sqrt
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	la	$v0, l.6248
	l.s	$f2, 0($v0)
	div.s	$f2, $f2, $f0
	s.s	$f0, 8($sp)
	mov.s	$f0, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	atan.2673
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 4($sp)
	mul.s	$f0, $f0, $f2
	lw	$t8, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	mul.s	$f0, $f0, $f2
	jr	$ra
calc_dirvec.5931:
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	li	$a3, 5
	bgt	$a3, $v0, ble_else.9167
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$v1, 8($sp)
	s.s	$f0, 12($sp)
	s.s	$f2, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fsqr
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	s.s	$f0, 20($sp)
	mov.s	$f0, $f2
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fsqr
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	la	$v0, l.6248
	l.s	$f2, 0($v0)
	add.s	$f0, $f0, $f2
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_sqrt
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 12($sp)
	div.s	$f2, $f2, $f0
	l.s	$f4, 16($sp)
	div.s	$f4, $f4, $f0
	la	$v0, l.6248
	l.s	$f6, 0($v0)
	div.s	$f0, $f6, $f0
	lw	$v0, 8($sp)
	sll	$v0, $v0, 2
	lw	$v1, 4($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	lw	$v1, 0($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lw	$a0, ($t9)
	sw	$v0, 24($sp)
	s.s	$f0, 28($sp)
	s.s	$f4, 32($sp)
	s.s	$f2, 36($sp)
	addi	$v0, $a0, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	d_vec.3500
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f0, 36($sp)
	l.s	$f2, 32($sp)
	l.s	$f4, 28($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	vecset.2916
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	lw	$v0, 0($sp)
	addi	$v1, $v0, 40
	sll	$v1, $v1, 2
	lw	$a0, 24($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	d_vec.3500
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f0, 32($sp)
	sw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fneg
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	mov.s	$f4, $f0
	lw	$v0, 40($sp)
	l.s	$f0, 36($sp)
	l.s	$f2, 28($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecset.2916
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 0($sp)
	addi	$v1, $v0, 80
	sll	$v1, $v1, 2
	lw	$a0, 24($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	d_vec.3500
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f0, 36($sp)
	sw	$v0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fneg
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 32($sp)
	s.s	$f0, 48($sp)
	mov.s	$f0, $f2
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	mov.s	$f4, $f0
	lw	$v0, 44($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	vecset.2916
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v0, 0($sp)
	addi	$v1, $v0, 1
	sll	$v1, $v1, 2
	lw	$a0, 24($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	addi	$v0, $v1, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	d_vec.3500
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f0, 36($sp)
	sw	$v0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fneg
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 32($sp)
	s.s	$f0, 56($sp)
	mov.s	$f0, $f2
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fneg
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 28($sp)
	s.s	$f0, 60($sp)
	mov.s	$f0, $f2
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fneg
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	mov.s	$f4, $f0
	lw	$v0, 52($sp)
	l.s	$f0, 56($sp)
	l.s	$f2, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	vecset.2916
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	lw	$v0, 0($sp)
	addi	$v1, $v0, 41
	sll	$v1, $v1, 2
	lw	$a0, 24($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	addi	$v0, $v1, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	d_vec.3500
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f0, 36($sp)
	sw	$v0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fneg
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	l.s	$f2, 28($sp)
	s.s	$f0, 68($sp)
	mov.s	$f0, $f2
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_fneg
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	mov.s	$f2, $f0
	lw	$v0, 64($sp)
	l.s	$f0, 68($sp)
	l.s	$f4, 32($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	vecset.2916
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	lw	$v0, 0($sp)
	addi	$v0, $v0, 81
	sll	$v0, $v0, 2
	lw	$v1, 24($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	d_vec.3500
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f0, 28($sp)
	sw	$v0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fneg
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lw	$v0, 72($sp)
	l.s	$f2, 36($sp)
	l.s	$f4, 32($sp)
	j	vecset.2916
ble_else.9167:
	s.s	$f4, 76($sp)
	sw	$a0, 0($sp)
	sw	$v1, 8($sp)
	sw	$t8, 80($sp)
	s.s	$f6, 84($sp)
	sw	$a2, 88($sp)
	sw	$v0, 92($sp)
	addi	$t8, $a2, 0
	mov.s	$f0, $f2
	mov.s	$f2, $f4
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -100
	lw	$ra, 96($sp)
	lw	$v0, 92($sp)
	addi	$v0, $v0, 1
	lw	$t8, 88($sp)
	l.s	$f2, 84($sp)
	s.s	$f0, 96($sp)
	sw	$v0, 100($sp)
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -108
	lw	$ra, 104($sp)
	mov.s	$f2, $f0
	lw	$t8, 80($sp)
	lw	$v0, 100($sp)
	lw	$v1, 8($sp)
	lw	$a0, 0($sp)
	l.s	$f0, 96($sp)
	l.s	$f4, 76($sp)
	l.s	$f6, 84($sp)
	lw	$s7, ($t8)
	jr	$s7
calc_dirvecs.5991:
	lw	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9168
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$a0, 12($sp)
	sw	$v1, 16($sp)
	sw	$a1, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_float_of_int
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	la	$v0, l.6886
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6888
	l.s	$f2, 0($v0)
	sub.s	$f4, $f0, $f2
	li	$v0, 0
	la	$v1, l.6250
	l.s	$f0, 0($v1)
	la	$v1, l.6250
	l.s	$f2, 0($v1)
	lw	$t8, 20($sp)
	lw	$v1, 16($sp)
	lw	$a0, 12($sp)
	l.s	$f6, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 4($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_float_of_int
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	la	$v0, l.6886
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6765
	l.s	$f2, 0($v0)
	add.s	$f4, $f0, $f2
	li	$v0, 0
	la	$v1, l.6250
	l.s	$f0, 0($v1)
	la	$v1, l.6250
	l.s	$f2, 0($v1)
	lw	$v1, 12($sp)
	addi	$a0, $v1, 2
	lw	$t8, 20($sp)
	lw	$a1, 16($sp)
	l.s	$f6, 8($sp)
	addi	$v1, $a1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 4($sp)
	addi	$v0, $v0, -1
	li	$v1, 1
	lw	$a0, 16($sp)
	sw	$v0, 24($sp)
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	add_mod5.2910
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	addi	$v1, $v0, 0
	lw	$t8, 0($sp)
	lw	$v0, 24($sp)
	lw	$a0, 12($sp)
	l.s	$f0, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9168:
	jr	$ra
calc_dirvec_rows.6021:
	lw	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9170
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	sw	$v1, 12($sp)
	sw	$a1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_float_of_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	la	$v0, l.6886
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6888
	l.s	$f2, 0($v0)
	sub.s	$f0, $f0, $f2
	li	$v0, 4
	lw	$t8, 16($sp)
	lw	$v1, 12($sp)
	lw	$a0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 4($sp)
	addi	$v0, $v0, -1
	li	$v1, 2
	lw	$a0, 12($sp)
	sw	$v0, 20($sp)
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	add_mod5.2910
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	addi	$v1, $v0, 0
	lw	$v0, 8($sp)
	addi	$a0, $v0, 4
	lw	$t8, 0($sp)
	lw	$v0, 20($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9170:
	jr	$ra
create_dirvec.6039:
	lw	$v0, 4($t8)
	li	$v1, 3
	la	$a0, l.6250
	l.s	$f0, 0($a0)
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$v1, $v0, 0
	lw	$v0, 0($sp)
	lw	$v0, 0($v0)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_array
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($v1)
	lw	$v0, 4($sp)
	sw	$v0, 0($v1)
	addi	$v0, $v1, 0
	jr	$ra
create_dirvec_elements.6047:
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.9172
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	sw	$v1, 8($sp)
	addi	$t8, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v1, 8($sp)
	sll	$a0, $v1, 2
	lw	$a1, 4($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	addi	$v1, $v1, -1
	lw	$t8, 0($sp)
	addi	$v0, $a1, 0
	lw	$s7, ($t8)
	jr	$s7
ble_else.9172:
	jr	$ra
create_dirvecs.6056:
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9174
	li	$a2, 120
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$v1, 8($sp)
	sw	$v0, 12($sp)
	sw	$a2, 16($sp)
	addi	$t8, $a1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$v1, $v0, 0
	lw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_create_array
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 12($sp)
	sll	$a0, $v1, 2
	lw	$a1, 8($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	sll	$v0, $v1, 2
	add	$t9, $a1, $v0
	lw	$v0, ($t9)
	li	$a0, 118
	lw	$t8, 4($sp)
	addi	$v1, $a0, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 12($sp)
	addi	$v0, $v0, -1
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9174:
	jr	$ra
init_dirvec_constants.6069:
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.9176
	sll	$a1, $v1, 2
	add	$t9, $v0, $a1
	lw	$a1, ($t9)
	sw	$v0, 0($sp)
	sw	$t8, 4($sp)
	sw	$v1, 8($sp)
	addi	$v0, $a1, 0
	addi	$t8, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 8($sp)
	addi	$v1, $v0, -1
	lw	$t8, 4($sp)
	lw	$v0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9176:
	jr	$ra
init_vecset_constants.6077:
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v0, ble_else.9178
	sll	$a1, $v0, 2
	add	$t9, $a0, $a1
	lw	$a0, ($t9)
	li	$a1, 119
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	addi	$t8, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	addi	$v0, $v0, -1
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9178:
	jr	$ra
init_dirvecs.6085:
	lw	$v0, 12($t8)
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	li	$a1, 4
	sw	$v0, 0($sp)
	sw	$a0, 4($sp)
	addi	$v0, $a1, 0
	addi	$t8, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v0, 9
	li	$v1, 0
	li	$a0, 0
	lw	$t8, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v0, 4
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
add_reflection.6094:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$t8, 4($t8)
	sw	$a1, 0($sp)
	sw	$v0, 4($sp)
	sw	$v1, 8($sp)
	s.s	$f0, 12($sp)
	sw	$a0, 16($sp)
	s.s	$f6, 20($sp)
	s.s	$f4, 24($sp)
	s.s	$f2, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	sw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	d_vec.3500
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 24($sp)
	l.s	$f4, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	vecset.2916
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$t8, 16($sp)
	lw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	addi	$v0, $gp, 0
	addi	$gp, $gp, 12
	l.s	$f0, 12($sp)
	s.s	$f0, 8($v0)
	lw	$v1, 32($sp)
	sw	$v1, 4($v0)
	lw	$v1, 8($sp)
	sw	$v1, 0($v0)
	lw	$v1, 4($sp)
	sll	$v1, $v1, 2
	lw	$a0, 0($sp)
	add	$t9, $a0, $v1
	sw	$v0, ($t9)
	jr	$ra
setup_rect_reflection.6107:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sll	$v0, $v0, 2
	lw	$a3, 0($a0)
	la	$t0, l.6248
	l.s	$f0, 0($t0)
	sw	$a0, 0($sp)
	sw	$a3, 4($sp)
	sw	$a2, 8($sp)
	sw	$v0, 12($sp)
	sw	$a1, 16($sp)
	s.s	$f0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_diffuse.3282
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	l.s	$f2, 0($v0)
	s.s	$f0, 24($sp)
	mov.s	$f0, $f2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fneg
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 16($sp)
	l.s	$f2, 4($v0)
	s.s	$f0, 28($sp)
	mov.s	$f0, $f2
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fneg
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 16($sp)
	l.s	$f2, 8($v0)
	s.s	$f0, 32($sp)
	mov.s	$f0, $f2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	mov.s	$f6, $f0
	lw	$v0, 12($sp)
	addi	$v1, $v0, 1
	lw	$a0, 16($sp)
	l.s	$f2, 0($a0)
	lw	$t8, 8($sp)
	lw	$a1, 4($sp)
	l.s	$f0, 24($sp)
	l.s	$f4, 32($sp)
	s.s	$f6, 36($sp)
	addi	$v0, $a1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	lw	$v0, 4($sp)
	addi	$v1, $v0, 1
	lw	$a0, 12($sp)
	addi	$a1, $a0, 2
	lw	$a2, 16($sp)
	l.s	$f4, 4($a2)
	lw	$t8, 8($sp)
	l.s	$f0, 24($sp)
	l.s	$f2, 28($sp)
	l.s	$f6, 36($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	lw	$v0, 4($sp)
	addi	$v1, $v0, 2
	lw	$a0, 12($sp)
	addi	$a0, $a0, 3
	lw	$a1, 16($sp)
	l.s	$f6, 8($a1)
	lw	$t8, 8($sp)
	l.s	$f0, 24($sp)
	l.s	$f2, 28($sp)
	l.s	$f4, 32($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	lw	$v0, 4($sp)
	addi	$v0, $v0, 3
	lw	$v1, 0($sp)
	sw	$v0, 0($v1)
	jr	$ra
setup_surface_reflection.6148:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sll	$v0, $v0, 2
	addi	$v0, $v0, 1
	lw	$a3, 0($a0)
	la	$t0, l.6248
	l.s	$f0, 0($t0)
	sw	$a0, 0($sp)
	sw	$v0, 4($sp)
	sw	$a3, 8($sp)
	sw	$a2, 12($sp)
	sw	$a1, 16($sp)
	sw	$v1, 20($sp)
	s.s	$f0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_diffuse.3282
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 20($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_abc.3227
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	addi	$v1, $v0, 0
	lw	$v0, 16($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	veciprod.2986
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	la	$v0, l.6262
	l.s	$f2, 0($v0)
	lw	$v0, 20($sp)
	s.s	$f0, 32($sp)
	s.s	$f2, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_a.3185
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 32($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 16($sp)
	l.s	$f4, 0($v0)
	sub.s	$f0, $f0, $f4
	la	$v1, l.6262
	l.s	$f4, 0($v1)
	lw	$v1, 20($sp)
	s.s	$f0, 40($sp)
	s.s	$f4, 44($sp)
	addi	$v0, $v1, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_b.3199
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 32($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 16($sp)
	l.s	$f4, 4($v0)
	sub.s	$f0, $f0, $f4
	la	$v1, l.6262
	l.s	$f4, 0($v1)
	lw	$v1, 20($sp)
	s.s	$f0, 48($sp)
	s.s	$f4, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_c.3213
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 52($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 32($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 16($sp)
	l.s	$f2, 8($v0)
	sub.s	$f6, $f0, $f2
	lw	$t8, 12($sp)
	lw	$v0, 8($sp)
	lw	$v1, 4($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 40($sp)
	l.s	$f4, 48($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	lw	$v0, 8($sp)
	addi	$v0, $v0, 1
	lw	$v1, 0($sp)
	sw	$v0, 0($v1)
	jr	$ra
setup_reflections.6187:
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9183
	sll	$a2, $v0, 2
	add	$t9, $a1, $a2
	lw	$a1, ($t9)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	sw	$a1, 12($sp)
	addi	$v0, $a1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_reflectiontype.3146
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 2
	bne	$v0, $v1, beq_else.9184
	lw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_diffuse.3282
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	la	$v0, l.6248
	l.s	$f2, 0($v0)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fless
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9185
	jr	$ra
beq_else.9185:
	lw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_form.3133
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9187
	lw	$t8, 8($sp)
	lw	$v0, 4($sp)
	lw	$v1, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9187:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9188
	lw	$t8, 0($sp)
	lw	$v0, 4($sp)
	lw	$v1, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9188:
	jr	$ra
beq_else.9184:
	jr	$ra
ble_else.9183:
	jr	$ra
rt.6200:
	lw	$a0, 56($t8)
	lw	$a1, 52($t8)
	lw	$a2, 48($t8)
	lw	$a3, 44($t8)
	lw	$t0, 40($t8)
	lw	$t1, 36($t8)
	lw	$t2, 32($t8)
	lw	$t3, 28($t8)
	lw	$t4, 24($t8)
	lw	$t5, 20($t8)
	lw	$t6, 16($t8)
	lw	$t7, 12($t8)
	lw	$s0, 8($t8)
	lw	$s1, 4($t8)
	sw	$v0, 0($t7)
	sw	$v1, 4($t7)
	srl	$t7, $v0, 1
	sw	$t7, 0($s0)
	srl	$v1, $v1, 1
	sw	$v1, 4($s0)
	la	$v1, l.6937
	l.s	$f0, 0($v1)
	sw	$t0, 0($sp)
	sw	$t2, 4($sp)
	sw	$a1, 8($sp)
	sw	$t3, 12($sp)
	sw	$a2, 16($sp)
	sw	$t5, 20($sp)
	sw	$t4, 24($sp)
	sw	$t6, 28($sp)
	sw	$a0, 32($sp)
	sw	$t1, 36($sp)
	sw	$s1, 40($sp)
	sw	$a3, 44($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_float_of_int
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 44($sp)
	s.s	$f0, 0($v0)
	lw	$t8, 40($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$t8, 40($sp)
	sw	$v0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	lw	$t8, 40($sp)
	sw	$v0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$t8, 36($sp)
	sw	$v0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	lw	$t8, 32($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	lw	$t8, 28($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	lw	$v0, 24($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	d_vec.3500
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	lw	$v1, 20($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	veccpy.2937
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	lw	$t8, 16($sp)
	lw	$v0, 24($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	lw	$v0, 12($sp)
	lw	$v0, 0($v0)
	addi	$v0, $v0, -1
	lw	$t8, 8($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	li	$v1, 0
	li	$a0, 0
	lw	$t8, 4($sp)
	lw	$v0, 56($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	li	$v0, 0
	li	$a2, 2
	lw	$t8, 0($sp)
	lw	$v1, 52($sp)
	lw	$a0, 56($sp)
	lw	$a1, 60($sp)
	lw	$s7, ($t8)
	jr	$s7

##################
## libmincaml.s ##
##################

min_caml_print_newline:
	li	$a0, 10 # NL
	li	$v0, 11 # print char
	syscall
	jr	$ra

min_caml_print_int: # $v0
	move	$a0, $v0
	li	$v0, 1
	syscall
	jr	$ra

min_caml_print_char: # $v0
	move	$a0, $v0
	li	$v0, 11 # print char
	syscall
	jr	$ra

min_caml_print_double: # $f0 doubleという名前だがfloat
	mov.s	$f12, $f0
	li	$v0, 2
	syscall
	jr	$ra
min_caml_print_float:
	mov.s	$f12, $f0
	li	$v0, 2
	syscall
	jr	$ra

min_caml_read_int:
	li	$v0, 5
	syscall
	jr	$ra

min_caml_read_float:
	li	$v0, 6
	syscall
	jr	$ra

min_caml_truncate: # $f0:float -> $v0:int
	cvt.w.s $f0, $f0
	mfc1	$v0, $f0
	jr	$ra

min_caml_create_array: # array of length $v0, initialized by $v1
	move	$a0, $v0
	move	$v0, $gp
create_array_loop:
	li	$a2, 0
	bne	$a0, $a2, create_array_cont
create_array_exit:
	jr	$ra
create_array_cont:
	sw	$v1, ($gp)
	addi	$a0, $a0, -1
	addi	$gp, $gp, 4
	b	create_array_loop

min_caml_create_float_array: # array of length $v0, initialized by $f0
	move	$a0, $v0
	move	$v0, $gp
create_float_array_loop:
	li	$a2, 0
	bne	$a0, $a2, create_float_array_cont
create_float_array_exit:
	jr	$ra
create_float_array_cont:
	s.s	$f0, ($gp)
	addi	$a0, $a0, -1
	addi	$gp, $gp, 4
	b	create_float_array_loop

min_caml_int_of_float: # f0 -> v0
	cvt.w.s $f0, $f0
	mfc1	$v0, $f0
	jr	$ra

min_caml_float_of_int: # v0 -> f0
	mtc1	$v0, $f0 # f0 := v0
	cvt.s.w	$f0, $f0 # convert
	jr	$ra

min_caml_floor: # f0 -> f0
	floor.w.s $f0, $f0
	cvt.s.w $f0, $f0
	jr	$ra

min_caml_sqrt: # f0 -> f0
	sqrt.s	$f0, $f0
	jr	$ra

min_caml_fiszero: # f0 -> v0
	l.s	$f1, const_f_zero
	c.eq.s	$f0, $f1
	bc1t	min_caml_fiszero_t
	l.s	$f1, const_f_zero_neg
	c.eq.s	$f0, $f1
	bc1t	min_caml_fiszero_t
	li	$v0, 0 # false
	jr	$ra
min_caml_fiszero_t:
	li	$v0, 1 # true
	jr	$ra

min_caml_fispos: # f0 -> v0
	l.s	$f1, const_f_zero
	c.lt.s	$f1, $f0 # 0.0 < f0?
	bc1t	min_caml_fispos_t
	li	$v0, 0 # false
	jr	$ra
min_caml_fispos_t:
	li	$v0, 1 # true
	jr	$ra

min_caml_fisneg: # f0 -> v0
	l.s	$f1, const_f_zero
	c.lt.s	$f0, $f1 # f0 < 0.0?
	bc1t	min_caml_fispos_t
	li	$v0, 0 # false
	jr	$ra
min_caml_fisneg_t:
	li	$v0, 1 # true
	jr	$ra

min_caml_xor: # v0, v1 -> v0
	li	$a0, 0
	beq	$v0, $a0, min_caml_xor_2
	# v0=t
	beq	$v1, $a0, min_caml_xor_1
	# v0=t, v1=t
	li	$v0, 0
	jr	$ra
min_caml_xor_1:
	# v0=t, v1=f
	li	$v0, 1
	jr	$ra
min_caml_xor_2:
	# v0=f
	beq	$v1, $a0, min_caml_xor_3
	# v0=f, v1=t
	li	$v0, 1
	jr	$ra
min_caml_xor_3:
	# v0=f, v1=f
	li	$v0, 0
	jr	$ra

min_caml_fless: # f0,f1 -> v0
	c.le.s	$f0, $f1
	bc1t	min_caml_fless_1
	li	$v0, 0
	jr	$ra
min_caml_fless_1:
	li	$v0, 1
	jr	$ra

min_caml_fneg: # f0 -> f0
	l.s	$f1, const_f_zero
	sub.s	$f0, $f1, $f0
	jr	$ra

min_caml_fabs: # f0 -> f0
	l.s	$f1, const_f_zero
	c.lt.s	$f0, $f1
	bc1t	min_caml_fneg
	jr	$ra

min_caml_fsqr: # f0 -> f0
	mul.s	$f0, $f0, $f0
	jr	$ra

min_caml_fhalf: # f0 -> f0
	l.s	$f1, const_f_half
	mul.s	$f0, $f0, $f1
	jr	$ra

##############
## sin, cos ##
##############

min_caml_tri_fact:
	li	$v1, 2
	bgt	$v1, $v0, min_caml_tri_fact_ble_else
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_tri_fact
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	mult	$v1, $v0
	mflo	 $v0
	jr	$ra
min_caml_tri_fact_ble_else:
	li	$v0, 1
	jr	$ra
min_caml_tri_pow:
	li	$v1, 0
	bne	$v0, $v1, min_caml_tri_pow_beq_else
	l.s	$f0, const_f_one
	jr	$ra
min_caml_tri_pow_beq_else:
	addi	$v0, $v0, -1
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_tri_pow
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	l.s	$f2, 0($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
min_caml_tri_even:
	li	$v1, 0
	bne	$v0, $v1, min_caml_tri_even_beq_else1
	li	$v0, 1
	jr	$ra
min_caml_tri_even_beq_else1:
	li	$v1, 1
	bne	$v0, $v1, min_caml_tri_even_beq_else2
	li	$v0, 0
	jr	$ra
min_caml_tri_even_beq_else2:
	addi	$v0, $v0, -2
	j	min_caml_tri_even
min_caml_sin_sub:
	l.s	$f0, 4($t8)
	sll	$v1, $v0, 1
	addi	$v1, $v1, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_tri_pow
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_tri_fact
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_tri_even
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, min_caml_sin_sub_beq_else
	l.s	$f0, 12($sp)
	j	min_caml_fneg
min_caml_sin_sub_beq_else:
	l.s	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
min_caml_sin:
	l.s	$f2, const_f_zero
	c.le.s	$f2, $f0
	bc1f	min_caml_sin_bc1t_else1
	l.s	$f2, const_half_pi
	c.le.s	$f0, $f2
	bc1f	min_caml_sin_bc1t_else2
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, min_caml_sin_sub
	sw	$v0, 0($t8)
	s.s	$f0, 4($t8)
	li	$v0, 0
	sw	$t8, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 1
	lw	$t8, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 2
	lw	$t8, 0($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 3
	lw	$t8, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 4
	lw	$t8, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 5
	lw	$t8, 0($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
min_caml_sin_bc1t_else2:
	l.s	$f2, const_pi
	sub.s	$f0, $f2, $f0
	j	min_caml_sin
min_caml_sin_bc1t_else1:
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fneg
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_sin
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	j	min_caml_fneg
min_caml_cos_sub:
	l.s	$f0, 4($t8)
	sll	$v1, $v0, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_tri_pow
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_tri_fact
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_tri_even
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, min_caml_cos_sub_beq_else
	l.s	$f0, 12($sp)
	j	min_caml_fneg
min_caml_cos_sub_beq_else:
	l.s	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
min_caml_cos:
	l.s	$f2, const_f_zero
	c.le.s	$f2, $f0
	bc1f	min_caml_cos_bc1t_else1
	l.s	$f2, const_half_pi
	c.le.s	$f0, $f2
	bc1f	min_caml_cos_bc1t_else2
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, min_caml_cos_sub
	sw	$v0, 0($t8)
	s.s	$f0, 4($t8)
	li	$v0, 0
	sw	$t8, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 1
	lw	$t8, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 2
	lw	$t8, 0($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 3
	lw	$t8, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 4
	lw	$t8, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 5
	lw	$t8, 0($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
min_caml_cos_bc1t_else2:
	l.s	$f2, const_pi
	sub.s	$f0, $f2, $f0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_cos
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	j	min_caml_fneg
min_caml_cos_bc1t_else1:
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fneg
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	j	min_caml_cos

min_caml_atan_g:
	la	$v1, const_f_two
	l.s	$f0, 0($v1)
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_float_of_int
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	mul.s	$f0, $f2, $f0
	la	$v0, const_f_two
	l.s	$f2, 0($v0)
	lw	$v0, 0($sp)
	s.s	$f0, 8($sp)
	s.s	$f2, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_float_of_int
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	mul.s	$f0, $f2, $f0
	la	$v0, const_f_one
	l.s	$f2, 0($v0)
	add.s	$f0, $f0, $f2
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	jr	$ra
min_caml_atan_hoge:
	li	$v1, 0
	bne	$v0, $v1, min_caml_atan_hoge_beq_else
	la	$v0, const_f_one
	l.s	$f0, 0($v0)
	jr	$ra
min_caml_atan_hoge_beq_else:
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_atan_hoge
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_atan_g
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
min_caml_atan_f:
	l.s	$f0, 4($t8)
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_atan_hoge
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v0, 2
	l.s	$f2, 4($sp)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_tri_pow
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	la	$v0, const_f_one
	l.s	$f2, 0($v0)
	li	$v0, 2
	l.s	$f4, 4($sp)
	s.s	$f0, 12($sp)
	s.s	$f2, 16($sp)
	mov.s	$f0, $f4
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_tri_pow
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 12($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_tri_pow
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 8($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
min_caml_atan:
	la	$v0, const_f_one
	l.s	$f2, 0($v0)
	c.le.s	$f0, $f2
	bc1f	min_caml_atan_bc1t_else
	addi	$v0, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, min_caml_atan_f
	sw	$v1, 0($v0)
	s.s	$f0, 4($v0)
	la	$v1, const_f_one
	l.s	$f2, 0($v1)
	li	$v1, 2
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	s.s	$f2, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_tri_pow
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	l.s	$f2, 8($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 4($sp)
	div.s	$f0, $f2, $f0
	li	$v0, 0
	lw	$t8, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v0, 1
	lw	$t8, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 2
	lw	$t8, 0($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 20($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 3
	lw	$t8, 0($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 4
	lw	$t8, 0($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 5
	lw	$t8, 0($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 6
	lw	$t8, 0($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 7
	lw	$t8, 0($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 40($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 8
	lw	$t8, 0($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 9
	lw	$t8, 0($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 10
	lw	$t8, 0($sp)
	s.s	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 52($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 11
	lw	$t8, 0($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 56($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 12
	lw	$t8, 0($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 60($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 13
	lw	$t8, 0($sp)
	s.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	l.s	$f2, 64($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 14
	lw	$t8, 0($sp)
	s.s	$f0, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f2, 68($sp)
	add.s	$f0, $f2, $f0
	li	$v0, 15
	lw	$t8, 0($sp)
	s.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	l.s	$f2, 72($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 12($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
min_caml_atan_bc1t_else:
	la	$v0, const_half_pi
	l.s	$f2, 0($v0)
	la	$v0, const_f_one
	l.s	$f4, 0($v0)
	div.s	$f0, $f4, $f0
	s.s	$f2, 92($sp)
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_atan
	addi	$sp, $sp, -100
	lw	$ra, 96($sp)
	l.s	$f2, 92($sp)
	sub.s	$f0, $f2, $f0
	jr	$ra

