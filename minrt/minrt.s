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
l.6799:	# 128.000000
	.word	0x43000000
l.6766:	# 0.900000
	.word	0x3f666666
l.6765:	# 0.200000
	.word	0x3e4ccccd
l.6671:	# -150.000000
	.word	0xc3160000
l.6669:	# 150.000000
	.word	0x43160000
l.6661:	# 0.100000
	.word	0x3dcccccd
l.6658:	# -2.000000
	.word	0xc0000000
l.6655:	# 0.003906
	.word	0x3b800000
l.6627:	# 0.300000
	.word	0x3e99999a
l.6626:	# 0.500000
	.word	0x3f000000
l.6625:	# 0.150000
	.word	0x3e19999a
l.6623:	# 15.000000
	.word	0x41700000
l.6622:	# 30.000000
	.word	0x41f00000
l.6621:	# 0.000100
	.word	0x38d1b717
l.6616:	# 3.141593
	.word	0x40490fdb
l.6611:	# 0.250000
	.word	0x3e800000
l.6608:	# 255.000000
	.word	0x437f0000
l.6606:	# 10.000000
	.word	0x41200000
l.6605:	# 20.000000
	.word	0x41a00000
l.6604:	# 0.050000
	.word	0x3d4ccccd
l.6562:	# 100000000.000000
	.word	0x4cbebc20
l.6558:	# 1000000000.000000
	.word	0x4e6e6b28
l.6538:	# -0.100000
	.word	0xbdcccccd
l.6526:	# 0.010000
	.word	0x3c23d70a
l.6524:	# -0.200000
	.word	0xbe4ccccd
l.6300:	# -200.000000
	.word	0xc3480000
l.6298:	# 200.000000
	.word	0x43480000
l.6294:	# 0.017453
	.word	0x3c8efa35
l.6211:	# -1.000000
	.word	0xbf800000
l.6207:	# 2.000000
	.word	0x40000000
l.6200:	# 1.570796
	.word	0x3fc90fdb
l.6199:	# 0.000000
	.word	0x00000000
l.6198:	# 1.000000
	.word	0x3f800000
.text
.globl	main
main:
	sw	$ra, 4($sp)
	sw	$fp, 8($sp)
	addi	$sp, $sp, 24
	addi	$fp, $sp, 0
	l.sl	$f0, l.6616
	addi	$v0, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, sin.2548
	sw	$v1, 0($v0)
	s.s	$f0, 4($v0)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	la	$a0, cos.2588
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
	lwr	$ra, 8($sp)
	li	$v1, 0
	l.sl	$f0, l.6199
	sw	$v0, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
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
	lwr	$ra, 12($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_create_float_array
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_create_float_array
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_create_float_array
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 1
	l.sl	$f0, l.6608
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_float_array
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
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
	lwr	$ra, 36($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_create_array
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 1
	li	$a0, 1
	lwr	$a1, 0($v0)
	sw	$v0, 36($sp)
	sw	$v1, 40($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_array
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_array
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 1
	l.sl	$f0, l.6199
	sw	$v0, 44($sp)
	addi	$v0, $v1, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_create_float_array
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 48($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_create_array
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 1
	l.sl	$f0, l.6558
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_create_float_array
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 56($sp)
	addi	$v0, $v1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_create_float_array
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 60($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_create_array
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 64($sp)
	addi	$v0, $v1, 0
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_create_float_array
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 68($sp)
	addi	$v0, $v1, 0
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_create_float_array
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 72($sp)
	addi	$v0, $v1, 0
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_create_float_array
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 76($sp)
	addi	$v0, $v1, 0
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	min_caml_create_float_array
	addi	$sp, $sp, -84
	lwr	$ra, 80($sp)
	li	$v1, 2
	li	$a0, 0
	sw	$v0, 80($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_create_array
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	li	$v1, 2
	li	$a0, 0
	sw	$v0, 84($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	min_caml_create_array
	addi	$sp, $sp, -92
	lwr	$ra, 88($sp)
	li	$v1, 1
	l.sl	$f0, l.6199
	sw	$v0, 88($sp)
	addi	$v0, $v1, 0
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_create_float_array
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 92($sp)
	addi	$v0, $v1, 0
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_create_float_array
	addi	$sp, $sp, -100
	lwr	$ra, 96($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 96($sp)
	addi	$v0, $v1, 0
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_create_float_array
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 100($sp)
	addi	$v0, $v1, 0
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	min_caml_create_float_array
	addi	$sp, $sp, -108
	lwr	$ra, 104($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 104($sp)
	addi	$v0, $v1, 0
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_create_float_array
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 108($sp)
	addi	$v0, $v1, 0
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_create_float_array
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 112($sp)
	addi	$v0, $v1, 0
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_float_array
	addi	$sp, $sp, -120
	lwr	$ra, 116($sp)
	li	$v1, 0
	l.sl	$f0, l.6199
	sw	$v0, 116($sp)
	addi	$v0, $v1, 0
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_create_float_array
	addi	$sp, $sp, -124
	lwr	$ra, 120($sp)
	addi	$v1, $v0, 0
	li	$v0, 0
	sw	$v1, 120($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_create_array
	addi	$sp, $sp, -128
	lwr	$ra, 124($sp)
	li	$v1, 0
	addi	$a0, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($a0)
	lwr	$v0, 120($sp)
	sw	$v0, 0($a0)
	addi	$v0, $a0, 0
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_create_array
	addi	$sp, $sp, -128
	lwr	$ra, 124($sp)
	addi	$v1, $v0, 0
	li	$v0, 5
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_create_array
	addi	$sp, $sp, -128
	lwr	$ra, 124($sp)
	li	$v1, 0
	l.sl	$f0, l.6199
	sw	$v0, 124($sp)
	addi	$v0, $v1, 0
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	min_caml_create_float_array
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 128($sp)
	addi	$v0, $v1, 0
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_create_float_array
	addi	$sp, $sp, -136
	lwr	$ra, 132($sp)
	li	$v1, 60
	lwr	$a0, 128($sp)
	sw	$v0, 132($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	min_caml_create_array
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($v1)
	lwr	$v0, 132($sp)
	sw	$v0, 0($v1)
	addi	$v0, $v1, 0
	li	$v1, 0
	l.sl	$f0, l.6199
	sw	$v0, 136($sp)
	addi	$v0, $v1, 0
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_create_float_array
	addi	$sp, $sp, -144
	lwr	$ra, 140($sp)
	addi	$v1, $v0, 0
	li	$v0, 0
	sw	$v1, 140($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	min_caml_create_array
	addi	$sp, $sp, -148
	lwr	$ra, 144($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($v1)
	lwr	$v0, 140($sp)
	sw	$v0, 0($v1)
	addi	$v0, $v1, 0
	li	$v1, 180
	li	$a0, 0
	l.sl	$f0, l.6199
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
	lwr	$ra, 144($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 144($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_create_array
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 32
	la	$a0, read_screen_settings.3467
	sw	$a0, 0($v1)
	lwr	$a0, 20($sp)
	sw	$a0, 28($v1)
	lwr	$a1, 4($sp)
	sw	$a1, 24($v1)
	lwr	$a2, 112($sp)
	sw	$a2, 20($v1)
	lwr	$a3, 108($sp)
	sw	$a3, 16($v1)
	lwr	$t0, 104($sp)
	sw	$t0, 12($v1)
	lwr	$t1, 16($sp)
	sw	$t1, 8($v1)
	lwr	$t1, 0($sp)
	sw	$t1, 4($v1)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 20
	la	$t3, read_light.3544
	sw	$t3, 0($t2)
	sw	$a1, 16($t2)
	lwr	$t3, 24($sp)
	sw	$t3, 12($t2)
	sw	$t1, 8($t2)
	lwr	$t4, 28($sp)
	sw	$t4, 4($t2)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, rotate_quadratic_matrix.3570
	sw	$t6, 0($t5)
	sw	$a1, 8($t5)
	sw	$t1, 4($t5)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 12
	la	$t7, read_nth_object.3683
	sw	$t7, 0($t6)
	sw	$t5, 8($t6)
	lwr	$t5, 12($sp)
	sw	$t5, 4($t6)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 12
	la	$s0, read_object.3813
	sw	$s0, 0($t7)
	sw	$t6, 8($t7)
	lwr	$t6, 8($sp)
	sw	$t6, 4($t7)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, read_all_object.3821
	sw	$s1, 0($s0)
	sw	$t7, 4($s0)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, read_and_network.3852
	sw	$s1, 0($t7)
	lwr	$s1, 36($sp)
	sw	$s1, 4($t7)
	addi	$s2, $gp, 0
	addi	$gp, $gp, 24
	la	$s3, read_parameter.3863
	sw	$s3, 0($s2)
	sw	$v1, 20($s2)
	sw	$t2, 16($s2)
	sw	$t7, 12($s2)
	sw	$s0, 8($s2)
	lwr	$v1, 44($sp)
	sw	$v1, 4($s2)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$t7, solver_rect_surface.3876
	sw	$t7, 0($t2)
	lwr	$t7, 48($sp)
	sw	$t7, 4($t2)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_rect.3914
	sw	$s3, 0($s0)
	sw	$t2, 4($s0)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_surface.3935
	sw	$s3, 0($t2)
	sw	$t7, 4($t2)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 8
	la	$s4, solver_second.4018
	sw	$s4, 0($s3)
	sw	$t7, 4($s3)
	addi	$s4, $gp, 0
	addi	$gp, $gp, 20
	la	$s5, solver.4058
	sw	$s5, 0($s4)
	sw	$t2, 16($s4)
	sw	$s3, 12($s4)
	sw	$s0, 8($s4)
	sw	$t5, 4($s4)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$s0, solver_rect_fast.4078
	sw	$s0, 0($t2)
	sw	$t7, 4($t2)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_surface_fast.4175
	sw	$s3, 0($s0)
	sw	$t7, 4($s0)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 8
	la	$s5, solver_second_fast.4198
	sw	$s5, 0($s3)
	sw	$t7, 4($s3)
	addi	$s5, $gp, 0
	addi	$gp, $gp, 20
	la	$s6, solver_fast.4244
	sw	$s6, 0($s5)
	sw	$s0, 16($s5)
	sw	$s3, 12($s5)
	sw	$t2, 8($s5)
	sw	$t5, 4($s5)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_surface_fast2.4267
	sw	$s3, 0($s0)
	sw	$t7, 4($s0)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 8
	la	$s6, solver_second_fast2.4285
	sw	$s6, 0($s3)
	sw	$t7, 4($s3)
	addi	$s6, $gp, 0
	addi	$gp, $gp, 20
	la	$s7, solver_fast2.4329
	sw	$s7, 0($s6)
	sw	$s0, 16($s6)
	sw	$s3, 12($s6)
	sw	$t2, 8($s6)
	sw	$t5, 4($s6)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$s0, iter_setup_dirvec_constants.4540
	sw	$s0, 0($t2)
	sw	$t5, 4($t2)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 12
	la	$s3, setup_dirvec_constants.4556
	sw	$s3, 0($s0)
	sw	$t6, 8($s0)
	sw	$t2, 4($s0)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, setup_startp_constants.4562
	sw	$s3, 0($t2)
	sw	$t5, 4($t2)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 16
	la	$s7, setup_startp.4612
	sw	$s7, 0($s3)
	lwr	$s7, 100($sp)
	sw	$s7, 12($s3)
	sw	$t2, 8($s3)
	sw	$t6, 4($s3)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$t8, check_all_inside.4677
	sw	$t8, 0($t2)
	sw	$t5, 4($t2)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 32
	sw	$s2, 148($sp)
	la	$s2, shadow_check_and_group.4691
	sw	$s2, 0($t8)
	sw	$s5, 28($t8)
	sw	$t7, 24($t8)
	sw	$t5, 20($t8)
	lwr	$s2, 136($sp)
	sw	$s2, 16($t8)
	sw	$t3, 12($t8)
	sw	$s0, 152($sp)
	lwr	$s0, 60($sp)
	sw	$s0, 8($t8)
	sw	$t2, 4($t8)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 12
	la	$a3, shadow_check_one_or_group.4735
	sw	$a3, 0($t6)
	sw	$t8, 8($t6)
	sw	$s1, 4($t6)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 24
	la	$t8, shadow_check_one_or_matrix.4747
	sw	$t8, 0($a3)
	sw	$s5, 20($a3)
	sw	$t7, 16($a3)
	sw	$t6, 12($a3)
	sw	$s2, 8($a3)
	sw	$s0, 4($a3)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 40
	la	$s5, solve_each_element.4775
	sw	$s5, 0($t6)
	lwr	$s5, 56($sp)
	sw	$s5, 36($t6)
	lwr	$t8, 96($sp)
	sw	$t8, 32($t6)
	sw	$t7, 28($t6)
	sw	$s4, 24($t6)
	sw	$t5, 20($t6)
	lwr	$s2, 52($sp)
	sw	$s2, 16($t6)
	sw	$s0, 12($t6)
	lwr	$a2, 64($sp)
	sw	$a2, 8($t6)
	sw	$t2, 4($t6)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$a0, solve_one_or_network.4830
	sw	$a0, 0($t0)
	sw	$t6, 8($t0)
	sw	$s1, 4($t0)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 24
	la	$t6, trace_or_matrix.4842
	sw	$t6, 0($a0)
	sw	$s5, 20($a0)
	sw	$t8, 16($a0)
	sw	$t7, 12($a0)
	sw	$s4, 8($a0)
	sw	$t0, 4($a0)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 16
	la	$t6, judge_intersection.4865
	sw	$t6, 0($t0)
	sw	$a0, 12($t0)
	sw	$s5, 8($t0)
	sw	$v1, 4($t0)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 40
	la	$t6, solve_each_element_fast.4880
	sw	$t6, 0($a0)
	sw	$s5, 36($a0)
	sw	$s7, 32($a0)
	sw	$s6, 28($a0)
	sw	$t7, 24($a0)
	sw	$t5, 20($a0)
	sw	$s2, 16($a0)
	sw	$s0, 12($a0)
	sw	$a2, 8($a0)
	sw	$t2, 4($a0)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, solve_one_or_network_fast.4936
	sw	$t6, 0($t2)
	sw	$a0, 8($t2)
	sw	$s1, 4($t2)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 20
	la	$t6, trace_or_matrix_fast.4948
	sw	$t6, 0($a0)
	sw	$s5, 16($a0)
	sw	$s6, 12($a0)
	sw	$t7, 8($a0)
	sw	$t2, 4($a0)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 16
	la	$t6, judge_intersection_fast.4971
	sw	$t6, 0($t2)
	sw	$a0, 12($t2)
	sw	$s5, 8($t2)
	sw	$v1, 4($t2)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, get_nvector_rect.4986
	sw	$t6, 0($a0)
	lwr	$t6, 68($sp)
	sw	$t6, 8($a0)
	sw	$s2, 4($a0)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, get_nvector_plane.4998
	sw	$s1, 0($t7)
	sw	$t6, 4($t7)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 12
	la	$s4, get_nvector_second.5011
	sw	$s4, 0($s1)
	sw	$t6, 8($s1)
	sw	$s0, 4($s1)
	addi	$s4, $gp, 0
	addi	$gp, $gp, 16
	la	$s6, get_nvector.5066
	sw	$s6, 0($s4)
	sw	$s1, 12($s4)
	sw	$a0, 8($s4)
	sw	$t7, 4($s4)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 16
	la	$t7, utexture.5072
	sw	$t7, 0($a0)
	lwr	$t7, 72($sp)
	sw	$t7, 12($a0)
	sw	$a1, 8($a0)
	sw	$t1, 4($a0)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 12
	la	$s6, add_light.5229
	sw	$s6, 0($s1)
	sw	$t7, 8($s1)
	lwr	$s6, 80($sp)
	sw	$s6, 4($s1)
	addi	$s7, $gp, 0
	addi	$gp, $gp, 36
	la	$t1, trace_reflections.5255
	sw	$t1, 0($s7)
	sw	$a3, 32($s7)
	lwr	$t1, 144($sp)
	sw	$t1, 28($s7)
	sw	$v1, 24($s7)
	sw	$t6, 20($s7)
	sw	$t2, 16($s7)
	sw	$s2, 12($s7)
	sw	$a2, 8($s7)
	sw	$s1, 4($s7)
	addi	$t1, $gp, 0
	addi	$gp, $gp, 84
	la	$a1, trace_ray.5289
	sw	$a1, 0($t1)
	sw	$a0, 80($t1)
	sw	$s7, 76($t1)
	sw	$s5, 72($t1)
	sw	$t7, 68($t1)
	sw	$t8, 64($t1)
	sw	$a3, 60($t1)
	sw	$s3, 56($t1)
	sw	$s6, 52($t1)
	sw	$v1, 48($t1)
	sw	$t5, 44($t1)
	sw	$t6, 40($t1)
	sw	$v0, 36($t1)
	sw	$t3, 32($t1)
	sw	$t0, 28($t1)
	sw	$s2, 24($t1)
	sw	$s0, 20($t1)
	sw	$a2, 16($t1)
	sw	$s4, 12($t1)
	sw	$t4, 8($t1)
	sw	$s1, 4($t1)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 52
	la	$t0, trace_diffuse_ray.5407
	sw	$t0, 0($a1)
	sw	$a0, 48($a1)
	sw	$t7, 44($a1)
	sw	$a3, 40($a1)
	sw	$v1, 36($a1)
	sw	$t5, 32($a1)
	sw	$t6, 28($a1)
	sw	$t3, 24($a1)
	sw	$t2, 20($a1)
	sw	$s0, 16($a1)
	sw	$a2, 12($a1)
	sw	$s4, 8($a1)
	lwr	$v1, 76($sp)
	sw	$v1, 4($a1)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 8
	la	$a2, iter_trace_diffuse_rays.5431
	sw	$a2, 0($a0)
	sw	$a1, 4($a0)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 12
	la	$a2, trace_diffuse_rays.5453
	sw	$a2, 0($a1)
	sw	$s3, 8($a1)
	sw	$a0, 4($a1)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$a2, trace_diffuse_ray_80percent.5459
	sw	$a2, 0($a0)
	sw	$a1, 8($a0)
	lwr	$a2, 124($sp)
	sw	$a2, 4($a0)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 16
	la	$t0, calc_diffuse_using_1point.5482
	sw	$t0, 0($a3)
	sw	$a0, 12($a3)
	sw	$s6, 8($a3)
	sw	$v1, 4($a3)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$t0, calc_diffuse_using_5points.5496
	sw	$t0, 0($a0)
	sw	$s6, 8($a0)
	sw	$v1, 4($a0)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t2, do_without_neighbors.5529
	sw	$t2, 0($t0)
	sw	$a3, 4($t0)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 8
	la	$t2, neighbors_exist.5542
	sw	$t2, 0($a3)
	lwr	$t2, 84($sp)
	sw	$t2, 4($a3)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, try_exploit_neighbors.5580
	sw	$t6, 0($t4)
	sw	$t0, 8($t4)
	sw	$a0, 4($t4)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, write_ppm_header.5600
	sw	$t6, 0($a0)
	sw	$t2, 4($a0)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 8
	la	$t7, write_rgb.5629
	sw	$t7, 0($t6)
	sw	$s6, 4($t6)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, pretrace_diffuse_rays.5645
	sw	$s0, 0($t7)
	sw	$a1, 12($t7)
	sw	$a2, 8($t7)
	sw	$v1, 4($t7)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 40
	la	$a1, pretrace_pixels.5667
	sw	$a1, 0($v1)
	lwr	$a1, 20($sp)
	sw	$a1, 36($v1)
	sw	$t1, 32($v1)
	sw	$t8, 28($v1)
	lwr	$a1, 104($sp)
	sw	$a1, 24($v1)
	lwr	$a1, 92($sp)
	sw	$a1, 20($v1)
	sw	$s6, 16($v1)
	lwr	$t1, 116($sp)
	sw	$t1, 12($v1)
	sw	$t7, 8($v1)
	lwr	$t1, 88($sp)
	sw	$t1, 4($v1)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 28
	la	$s0, pretrace_line.5721
	sw	$s0, 0($t7)
	lwr	$s0, 112($sp)
	sw	$s0, 24($t7)
	lwr	$s0, 108($sp)
	sw	$s0, 20($t7)
	sw	$a1, 16($t7)
	sw	$v1, 12($t7)
	sw	$t2, 8($t7)
	sw	$t1, 4($t7)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 28
	la	$s0, scan_pixel.5754
	sw	$s0, 0($v1)
	sw	$t6, 24($v1)
	sw	$t4, 20($v1)
	sw	$s6, 16($v1)
	sw	$a3, 12($v1)
	sw	$t2, 8($v1)
	sw	$t0, 4($v1)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 16
	la	$t0, scan_line.5775
	sw	$t0, 0($a3)
	sw	$v1, 12($a3)
	sw	$t7, 8($a3)
	sw	$t2, 4($a3)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	la	$t0, create_pixelline.5854
	sw	$t0, 0($v1)
	sw	$t2, 4($v1)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$t4, tan.5865
	sw	$t4, 0($t0)
	lwr	$t4, 4($sp)
	sw	$t4, 8($t0)
	lwr	$t4, 0($sp)
	sw	$t4, 4($t0)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, adjust_position.5869
	sw	$t6, 0($t4)
	sw	$t0, 4($t4)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, calc_dirvec.5881
	sw	$t6, 0($t0)
	sw	$a2, 8($t0)
	sw	$t4, 4($t0)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, calc_dirvecs.5941
	sw	$t6, 0($t4)
	sw	$t0, 4($t4)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, calc_dirvec_rows.5971
	sw	$t6, 0($t0)
	sw	$t4, 4($t0)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, create_dirvec.5989
	sw	$t6, 0($t4)
	lwr	$t6, 8($sp)
	sw	$t6, 4($t4)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, create_dirvec_elements.5997
	sw	$s1, 0($s0)
	sw	$t4, 4($s0)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 16
	la	$s2, create_dirvecs.6006
	sw	$s2, 0($s1)
	sw	$a2, 12($s1)
	sw	$s0, 8($s1)
	sw	$t4, 4($s1)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s2, init_dirvec_constants.6019
	sw	$s2, 0($s0)
	lwr	$s2, 152($sp)
	sw	$s2, 4($s0)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 12
	la	$s4, init_vecset_constants.6027
	sw	$s4, 0($s3)
	sw	$s0, 8($s3)
	sw	$a2, 4($s3)
	addi	$a2, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, init_dirvecs.6035
	sw	$s0, 0($a2)
	sw	$s3, 12($a2)
	sw	$s1, 8($a2)
	sw	$t0, 4($a2)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, add_reflection.6044
	sw	$s0, 0($t0)
	sw	$s2, 12($t0)
	lwr	$s0, 144($sp)
	sw	$s0, 8($t0)
	sw	$t4, 4($t0)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, setup_rect_reflection.6057
	sw	$s0, 0($t4)
	sw	$v0, 12($t4)
	sw	$t3, 8($t4)
	sw	$t0, 4($t4)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 16
	la	$s1, setup_surface_reflection.6098
	sw	$s1, 0($s0)
	sw	$v0, 12($s0)
	sw	$t3, 8($s0)
	sw	$t0, 4($s0)
	addi	$v0, $gp, 0
	addi	$gp, $gp, 16
	la	$t0, setup_reflections.6137
	sw	$t0, 0($v0)
	sw	$s0, 12($v0)
	sw	$t4, 8($v0)
	sw	$t5, 4($v0)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 60
	la	$t0, rt.6150
	sw	$t0, 0($t8)
	sw	$a0, 56($t8)
	sw	$v0, 52($t8)
	sw	$s2, 48($t8)
	sw	$a1, 44($t8)
	sw	$a3, 40($t8)
	lwr	$v0, 148($sp)
	sw	$v0, 36($t8)
	sw	$t7, 32($t8)
	sw	$t6, 28($t8)
	lwr	$v0, 136($sp)
	sw	$v0, 24($t8)
	sw	$t3, 20($t8)
	sw	$a2, 16($t8)
	sw	$t2, 12($t8)
	sw	$t1, 8($t8)
	sw	$v1, 4($t8)
	li	$v0, 512
	li	$v1, 512
	sw	$ra, 156($sp)
	addi	$sp, $sp, 160
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -160
	lwr	$ra, 156($sp)
	move	$sp, $fp
	subi	$sp, $sp, 24
	lwr	$ra, 4($sp)
	lwr	$fp, 8($sp)
	li	$v0, 0
	exit
pow.2525:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8792
	l.sl	$f0, l.6198
	jr	$ra
beq_else.8792:
	addi	$v0, $v0, -1
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	pow.2525
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	l.sr	$f1, 0($sp)
	mul.s	$f0, $f1, $f0
	jr	$ra
fact.2532:
	li	$v1, 2
	bgt	$v1, $v0, ble_else.8793
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	fact.2532
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	mult	$v1, $v0
	jr	$ra
ble_else.8793:
	li	$v0, 1
	jr	$ra
fneg.2539:
	l.sl	$f1, l.6199
	sub.s	$f0, $f1, $f0
	jr	$ra
even.2542:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8794
	li	$v0, 1
	jr	$ra
beq_else.8794:
	li	$v1, 1
	bne	$v0, $v1, beq_else.8795
	li	$v0, 0
	jr	$ra
beq_else.8795:
	addi	$v0, $v0, -2
	j	even.2542
g.2557:
	l.sr	$f0, 4($t8)
	sll	$v1, $v0, 1
	addi	$v1, $v1, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	pow.2525
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	fact.2532
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sr	$f1, 8($sp)
	div.s	$f0, $f1, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	even.2542
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8796
	l.sr	$f0, 12($sp)
	j	fneg.2539
beq_else.8796:
	l.sr	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
sin.2548:
	l.sr	$f1, 4($t8)
	l.sl	$f2, l.6199
	sw	$t8, 0($sp)
	s.s	$f1, 4($sp)
	s.s	$f0, 8($sp)
	mov.s	$f1, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8797
	l.sl	$f0, l.6200
	l.sr	$f1, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8798
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, g.2557
	sw	$v0, 0($t8)
	l.sr	$f0, 8($sp)
	s.s	$f0, 4($t8)
	li	$v0, 0
	sw	$t8, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v0, 1
	lwr	$t8, 12($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 2
	lwr	$t8, 12($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 20($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 3
	lwr	$t8, 12($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 4
	lwr	$t8, 12($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 5
	lwr	$t8, 12($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
beq_else.8798:
	l.sr	$f0, 4($sp)
	l.sr	$f1, 8($sp)
	sub.s	$f0, $f0, $f1
	lwr	$t8, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8797:
	l.sr	$f0, 8($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg.2539
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$t8, 0($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	j	fneg.2539
g.2597:
	l.sr	$f0, 4($t8)
	sll	$v1, $v0, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	pow.2525
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	fact.2532
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sr	$f1, 8($sp)
	div.s	$f0, $f1, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	even.2542
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8799
	l.sr	$f0, 12($sp)
	j	fneg.2539
beq_else.8799:
	l.sr	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
cos.2588:
	l.sr	$f1, 4($t8)
	l.sl	$f2, l.6199
	sw	$t8, 0($sp)
	s.s	$f1, 4($sp)
	s.s	$f0, 8($sp)
	mov.s	$f1, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8800
	l.sl	$f0, l.6200
	l.sr	$f1, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8801
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, g.2597
	sw	$v0, 0($t8)
	l.sr	$f0, 8($sp)
	s.s	$f0, 4($t8)
	li	$v0, 0
	sw	$t8, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v0, 1
	lwr	$t8, 12($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 2
	lwr	$t8, 12($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 20($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 3
	lwr	$t8, 12($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 4
	lwr	$t8, 12($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 5
	lwr	$t8, 12($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
beq_else.8801:
	l.sr	$f0, 4($sp)
	l.sr	$f1, 8($sp)
	sub.s	$f0, $f0, $f1
	lwr	$t8, 0($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	j	fneg.2539
beq_else.8800:
	l.sr	$f0, 8($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg.2539
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$t8, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
g.2633:
	l.sl	$f0, l.6207
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_float_of_int
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	l.sr	$f1, 4($sp)
	mul.s	$f0, $f1, $f0
	l.sl	$f1, l.6207
	lwr	$v0, 0($sp)
	s.s	$f0, 8($sp)
	s.s	$f1, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_float_of_int
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sr	$f1, 12($sp)
	mul.s	$f0, $f1, $f0
	l.sl	$f1, l.6198
	add.s	$f0, $f0, $f1
	l.sr	$f1, 8($sp)
	div.s	$f0, $f1, $f0
	jr	$ra
h.2643:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8802
	l.sl	$f0, l.6198
	jr	$ra
beq_else.8802:
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	h.2643
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	g.2633
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	l.sr	$f1, 4($sp)
	mul.s	$f0, $f1, $f0
	jr	$ra
f.2631:
	l.sr	$f0, 4($t8)
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	h.2643
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v0, 2
	l.sr	$f1, 4($sp)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	pow.2525
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sl	$f1, l.6198
	li	$v0, 2
	l.sr	$f2, 4($sp)
	s.s	$f0, 12($sp)
	s.s	$f1, 16($sp)
	mov.s	$f0, $f2
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	pow.2525
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 12($sp)
	div.s	$f0, $f1, $f0
	lwr	$v0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	pow.2525
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 8($sp)
	mul.s	$f0, $f1, $f0
	jr	$ra
atan.2626:
	l.sl	$f1, l.6198
	s.s	$f0, 0($sp)
	mov.s	$f31, $f1
	mov.s	$f1, $f0
	mov.s	$f0, $f31
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fless
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8803
	addi	$v0, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, f.2631
	sw	$v1, 0($v0)
	l.sr	$f0, 0($sp)
	s.s	$f0, 4($v0)
	l.sl	$f1, l.6198
	li	$v1, 2
	sw	$v0, 4($sp)
	s.s	$f1, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	pow.2525
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sr	$f1, 8($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 0($sp)
	div.s	$f0, $f1, $f0
	li	$v0, 0
	lwr	$t8, 4($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v0, 1
	lwr	$t8, 4($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 2
	lwr	$t8, 4($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 20($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 3
	lwr	$t8, 4($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 4
	lwr	$t8, 4($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 5
	lwr	$t8, 4($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 6
	lwr	$t8, 4($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 36($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 7
	lwr	$t8, 4($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 40($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 8
	lwr	$t8, 4($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 44($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 9
	lwr	$t8, 4($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 48($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 10
	lwr	$t8, 4($sp)
	s.s	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 52($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 11
	lwr	$t8, 4($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 12
	lwr	$t8, 4($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 60($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 13
	lwr	$t8, 4($sp)
	s.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	l.sr	$f1, 64($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 14
	lwr	$t8, 4($sp)
	s.s	$f0, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	l.sr	$f1, 68($sp)
	add.s	$f0, $f1, $f0
	li	$v0, 15
	lwr	$t8, 4($sp)
	s.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	l.sr	$f1, 72($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 12($sp)
	mul.s	$f0, $f1, $f0
	jr	$ra
beq_else.8803:
	l.sl	$f0, l.6200
	l.sl	$f1, l.6198
	l.sr	$f2, 0($sp)
	div.s	$f1, $f1, $f2
	s.s	$f0, 76($sp)
	mov.s	$f0, $f1
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	atan.2626
	addi	$sp, $sp, -84
	lwr	$ra, 80($sp)
	l.sr	$f1, 76($sp)
	sub.s	$f0, $f1, $f0
	jr	$ra
sgn.2841:
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fiszero
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8804
	l.sr	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fispos
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8805
	l.sl	$f0, l.6211
	jr	$ra
beq_else.8805:
	l.sl	$f0, l.6198
	jr	$ra
beq_else.8804:
	l.sl	$f0, l.6199
	jr	$ra
fneg_cond.2847:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8806
	j	fneg.2539
beq_else.8806:
	mov.s	$f0, $f0
	jr	$ra
add_mod5.2851:
	add	$v0, $v0, $v1
	li	$v1, 5
	bgt	$v1, $v0, ble_else.8807
	addi	$v0, $v0, -5
	jr	$ra
ble_else.8807:
	jr	$ra
vecset.2857:
	s.s	$f0, 0($v0)
	s.s	$f1, 4($v0)
	s.s	$f2, 8($v0)
	jr	$ra
vecfill.2867:
	s.s	$f0, 0($v0)
	s.s	$f0, 4($v0)
	s.s	$f0, 8($v0)
	jr	$ra
vecbzero.2875:
	l.sl	$f0, l.6199
	j	vecfill.2867
veccpy.2878:
	l.sr	$f0, 0($v1)
	s.s	$f0, 0($v0)
	l.sr	$f0, 4($v1)
	s.s	$f0, 4($v0)
	l.sr	$f0, 8($v1)
	s.s	$f0, 8($v0)
	jr	$ra
vecunit_sgn.2892:
	l.sr	$f0, 0($v0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fsqr
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	l.sr	$f1, 4($v0)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fsqr
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sr	$f1, 8($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	l.sr	$f1, 8($v0)
	s.s	$f0, 12($sp)
	mov.s	$f0, $f1
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fsqr
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sr	$f1, 12($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_sqrt
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fiszero
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8811
	li	$v0, 0
	lwr	$v1, 0($sp)
	bne	$v1, $v0, beq_else.8813
	l.sl	$f0, l.6198
	l.sr	$f1, 16($sp)
	div.s	$f0, $f0, $f1
	j	beq_cont.8814
beq_else.8813:
	l.sl	$f0, l.6211
	l.sr	$f1, 16($sp)
	div.s	$f0, $f0, $f1
beq_cont.8814:
	j	beq_cont.8812
beq_else.8811:
	l.sl	$f0, l.6198
beq_cont.8812:
	lwr	$v0, 4($sp)
	l.sr	$f1, 0($v0)
	mul.s	$f1, $f1, $f0
	s.s	$f1, 0($v0)
	l.sr	$f1, 4($v0)
	mul.s	$f1, $f1, $f0
	s.s	$f1, 4($v0)
	l.sr	$f1, 8($v0)
	mul.s	$f0, $f1, $f0
	s.s	$f0, 8($v0)
	jr	$ra
veciprod.2927:
	l.sr	$f0, 0($v0)
	l.sr	$f1, 0($v1)
	mul.s	$f0, $f0, $f1
	l.sr	$f1, 4($v0)
	l.sr	$f2, 4($v1)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	l.sr	$f1, 8($v0)
	l.sr	$f2, 8($v1)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	jr	$ra
veciprod2.2946:
	l.sr	$f3, 0($v0)
	mul.s	$f0, $f3, $f0
	l.sr	$f3, 4($v0)
	mul.s	$f1, $f3, $f1
	add.s	$f0, $f0, $f1
	l.sr	$f1, 8($v0)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	jr	$ra
vecaccum.2961:
	l.sr	$f1, 0($v0)
	l.sr	$f2, 0($v1)
	mul.s	$f2, $f0, $f2
	add.s	$f1, $f1, $f2
	s.s	$f1, 0($v0)
	l.sr	$f1, 4($v0)
	l.sr	$f2, 4($v1)
	mul.s	$f2, $f0, $f2
	add.s	$f1, $f1, $f2
	s.s	$f1, 4($v0)
	l.sr	$f1, 8($v0)
	l.sr	$f2, 8($v1)
	mul.s	$f0, $f0, $f2
	add.s	$f0, $f1, $f0
	s.s	$f0, 8($v0)
	jr	$ra
vecadd.2988:
	l.sr	$f0, 0($v0)
	l.sr	$f1, 0($v1)
	add.s	$f0, $f0, $f1
	s.s	$f0, 0($v0)
	l.sr	$f0, 4($v0)
	l.sr	$f1, 4($v1)
	add.s	$f0, $f0, $f1
	s.s	$f0, 4($v0)
	l.sr	$f0, 8($v0)
	l.sr	$f1, 8($v1)
	add.s	$f0, $f0, $f1
	s.s	$f0, 8($v0)
	jr	$ra
vecscale.3011:
	l.sr	$f1, 0($v0)
	mul.s	$f1, $f1, $f0
	s.s	$f1, 0($v0)
	l.sr	$f1, 4($v0)
	mul.s	$f1, $f1, $f0
	s.s	$f1, 4($v0)
	l.sr	$f1, 8($v0)
	mul.s	$f0, $f1, $f0
	s.s	$f0, 8($v0)
	jr	$ra
vecaccumv.3028:
	l.sr	$f0, 0($v0)
	l.sr	$f1, 0($v1)
	l.sr	$f2, 0($a0)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	s.s	$f0, 0($v0)
	l.sr	$f0, 4($v0)
	l.sr	$f1, 4($v1)
	l.sr	$f2, 4($a0)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	s.s	$f0, 4($v0)
	l.sr	$f0, 8($v0)
	l.sr	$f1, 8($v1)
	l.sr	$f2, 8($a0)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	s.s	$f0, 8($v0)
	jr	$ra
o_texturetype.3061:
	lwr	$v0, 0($v0)
	jr	$ra
o_form.3074:
	lwr	$v0, 4($v0)
	jr	$ra
o_reflectiontype.3087:
	lwr	$v0, 8($v0)
	jr	$ra
o_isinvert.3100:
	lwr	$v0, 24($v0)
	jr	$ra
o_isrot.3113:
	lwr	$v0, 12($v0)
	jr	$ra
o_param_a.3126:
	lwr	$v0, 16($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_param_b.3140:
	lwr	$v0, 16($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_param_c.3154:
	lwr	$v0, 16($v0)
	l.sr	$f0, 8($v0)
	jr	$ra
o_param_abc.3168:
	lwr	$v0, 16($v0)
	jr	$ra
o_param_x.3181:
	lwr	$v0, 20($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_param_y.3195:
	lwr	$v0, 20($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_param_z.3209:
	lwr	$v0, 20($v0)
	l.sr	$f0, 8($v0)
	jr	$ra
o_diffuse.3223:
	lwr	$v0, 28($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_hilight.3237:
	lwr	$v0, 28($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_color_red.3251:
	lwr	$v0, 32($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_color_green.3265:
	lwr	$v0, 32($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_color_blue.3279:
	lwr	$v0, 32($v0)
	l.sr	$f0, 8($v0)
	jr	$ra
o_param_r1.3293:
	lwr	$v0, 36($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_param_r2.3307:
	lwr	$v0, 36($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_param_r3.3321:
	lwr	$v0, 36($v0)
	l.sr	$f0, 8($v0)
	jr	$ra
o_param_ctbl.3335:
	lwr	$v0, 40($v0)
	jr	$ra
p_rgb.3348:
	lwr	$v0, 0($v0)
	jr	$ra
p_intersection_points.3358:
	lwr	$v0, 4($v0)
	jr	$ra
p_surface_ids.3368:
	lwr	$v0, 8($v0)
	jr	$ra
p_calc_diffuse.3378:
	lwr	$v0, 12($v0)
	jr	$ra
p_energy.3388:
	lwr	$v0, 16($v0)
	jr	$ra
p_received_ray_20percent.3398:
	lwr	$v0, 20($v0)
	jr	$ra
p_group_id.3408:
	lwr	$v0, 24($v0)
	lwr	$v0, 0($v0)
	jr	$ra
p_set_group_id.3419:
	lwr	$v0, 24($v0)
	sw	$v1, 0($v0)
	jr	$ra
p_nvectors.3431:
	lwr	$v0, 28($v0)
	jr	$ra
d_vec.3441:
	lwr	$v0, 0($v0)
	jr	$ra
d_const.3445:
	lwr	$v0, 4($v0)
	jr	$ra
r_surface_id.3449:
	lwr	$v0, 0($v0)
	jr	$ra
r_dvec.3454:
	lwr	$v0, 4($v0)
	jr	$ra
r_bright.3459:
	l.sr	$f0, 8($v0)
	mov.s	$f0, $f0
	jr	$ra
rad.3464:
	l.sl	$f1, l.6294
	mul.s	$f0, $f0, $f1
	jr	$ra
read_screen_settings.3467:
	lwr	$v0, 28($t8)
	lwr	$v1, 24($t8)
	lwr	$a0, 20($t8)
	lwr	$a1, 16($t8)
	lwr	$a2, 12($t8)
	lwr	$a3, 8($t8)
	lwr	$t0, 4($t8)
	sw	$v0, 0($sp)
	sw	$a1, 4($sp)
	sw	$a2, 8($sp)
	sw	$a0, 12($sp)
	sw	$v1, 16($sp)
	sw	$t0, 20($sp)
	sw	$a3, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 24($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 24($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 24($sp)
	s.s	$f0, 8($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	rad.3464
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$t8, 20($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$t8, 16($sp)
	l.sr	$f1, 28($sp)
	s.s	$f0, 32($sp)
	mov.s	$f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_read_float
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	rad.3464
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$t8, 20($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$t8, 16($sp)
	l.sr	$f1, 40($sp)
	s.s	$f0, 44($sp)
	mov.s	$f0, $f1
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 32($sp)
	mul.s	$f2, $f1, $f0
	l.sl	$f3, l.6298
	mul.s	$f2, $f2, $f3
	lwr	$v0, 12($sp)
	s.s	$f2, 0($v0)
	l.sl	$f2, l.6300
	l.sr	$f3, 36($sp)
	mul.s	$f2, $f3, $f2
	s.s	$f2, 4($v0)
	l.sr	$f2, 44($sp)
	mul.s	$f4, $f1, $f2
	l.sl	$f5, l.6298
	mul.s	$f4, $f4, $f5
	s.s	$f4, 8($v0)
	lwr	$v1, 8($sp)
	s.s	$f2, 0($v1)
	l.sl	$f4, l.6199
	s.s	$f4, 4($v1)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	fneg.2539
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 8($v0)
	l.sr	$f0, 36($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	fneg.2539
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 48($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 4($sp)
	s.s	$f0, 0($v0)
	l.sr	$f0, 32($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	fneg.2539
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 36($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	fneg.2539
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 44($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 4($sp)
	s.s	$f0, 8($v0)
	lwr	$v0, 24($sp)
	l.sr	$f0, 0($v0)
	lwr	$v1, 12($sp)
	l.sr	$f1, 0($v1)
	sub.s	$f0, $f0, $f1
	lwr	$a0, 0($sp)
	s.s	$f0, 0($a0)
	l.sr	$f0, 4($v0)
	l.sr	$f1, 4($v1)
	sub.s	$f0, $f0, $f1
	s.s	$f0, 4($a0)
	l.sr	$f0, 8($v0)
	l.sr	$f1, 8($v1)
	sub.s	$f0, $f0, $f1
	s.s	$f0, 8($a0)
	jr	$ra
read_light.3544:
	lwr	$v0, 16($t8)
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$v1, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_read_int
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_read_float
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	rad.3464
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$t8, 12($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	fneg.2539
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	rad.3464
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$t8, 4($sp)
	l.sr	$f1, 16($sp)
	s.s	$f0, 20($sp)
	mov.s	$f0, $f1
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$t8, 12($sp)
	l.sr	$f1, 20($sp)
	s.s	$f0, 24($sp)
	mov.s	$f0, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 0($v0)
	lwr	$t8, 4($sp)
	l.sr	$f0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 8($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	jr	$ra
rotate_quadratic_matrix.3570:
	lwr	$a0, 8($t8)
	lwr	$t8, 4($t8)
	l.sr	$f0, 0($v1)
	sw	$v0, 0($sp)
	sw	$t8, 4($sp)
	sw	$a0, 8($sp)
	sw	$v1, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 12($sp)
	l.sr	$f1, 0($v0)
	lwr	$t8, 8($sp)
	s.s	$f0, 16($sp)
	mov.s	$f0, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 12($sp)
	l.sr	$f1, 4($v0)
	lwr	$t8, 4($sp)
	s.s	$f0, 20($sp)
	mov.s	$f0, $f1
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v0, 12($sp)
	l.sr	$f1, 4($v0)
	lwr	$t8, 8($sp)
	s.s	$f0, 24($sp)
	mov.s	$f0, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 12($sp)
	l.sr	$f1, 8($v0)
	lwr	$t8, 4($sp)
	s.s	$f0, 28($sp)
	mov.s	$f0, $f1
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 12($sp)
	l.sr	$f1, 8($v0)
	lwr	$t8, 8($sp)
	s.s	$f0, 32($sp)
	mov.s	$f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 24($sp)
	l.sr	$f2, 32($sp)
	mul.s	$f3, $f1, $f2
	l.sr	$f4, 20($sp)
	l.sr	$f5, 28($sp)
	mul.s	$f6, $f4, $f5
	mul.s	$f6, $f6, $f2
	l.sr	$f7, 16($sp)
	mul.s	$f8, $f7, $f0
	sub.s	$f6, $f6, $f8
	mul.s	$f8, $f7, $f5
	mul.s	$f8, $f8, $f2
	mul.s	$f9, $f4, $f0
	add.s	$f8, $f8, $f9
	mul.s	$f9, $f1, $f0
	mul.s	$f10, $f4, $f5
	mul.s	$f10, $f10, $f0
	mul.s	$f11, $f7, $f2
	add.s	$f10, $f10, $f11
	mul.s	$f11, $f7, $f5
	mul.s	$f0, $f11, $f0
	mul.s	$f2, $f4, $f2
	sub.s	$f0, $f0, $f2
	s.s	$f0, 36($sp)
	s.s	$f8, 40($sp)
	s.s	$f10, 44($sp)
	s.s	$f6, 48($sp)
	s.s	$f9, 52($sp)
	s.s	$f3, 56($sp)
	mov.s	$f0, $f5
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	fneg.2539
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 20($sp)
	l.sr	$f2, 24($sp)
	mul.s	$f1, $f1, $f2
	l.sr	$f3, 16($sp)
	mul.s	$f2, $f3, $f2
	lwr	$v0, 0($sp)
	l.sr	$f3, 0($v0)
	l.sr	$f4, 4($v0)
	l.sr	$f5, 8($v0)
	l.sr	$f6, 56($sp)
	s.s	$f2, 60($sp)
	s.s	$f1, 64($sp)
	s.s	$f5, 68($sp)
	s.s	$f0, 72($sp)
	s.s	$f4, 76($sp)
	s.s	$f3, 80($sp)
	mov.s	$f0, $f6
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fsqr
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	l.sr	$f1, 80($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 52($sp)
	s.s	$f0, 84($sp)
	mov.s	$f0, $f2
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	min_caml_fsqr
	addi	$sp, $sp, -92
	lwr	$ra, 88($sp)
	l.sr	$f1, 76($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 84($sp)
	add.s	$f0, $f2, $f0
	l.sr	$f2, 72($sp)
	s.s	$f0, 88($sp)
	mov.s	$f0, $f2
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	l.sr	$f1, 68($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 88($sp)
	add.s	$f0, $f2, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	l.sr	$f0, 48($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	l.sr	$f1, 80($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 44($sp)
	s.s	$f0, 92($sp)
	mov.s	$f0, $f2
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_fsqr
	addi	$sp, $sp, -100
	lwr	$ra, 96($sp)
	l.sr	$f1, 76($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 92($sp)
	add.s	$f0, $f2, $f0
	l.sr	$f2, 64($sp)
	s.s	$f0, 96($sp)
	mov.s	$f0, $f2
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fsqr
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	l.sr	$f1, 68($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 96($sp)
	add.s	$f0, $f2, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 40($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fsqr
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	l.sr	$f1, 80($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 36($sp)
	s.s	$f0, 100($sp)
	mov.s	$f0, $f2
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	min_caml_fsqr
	addi	$sp, $sp, -108
	lwr	$ra, 104($sp)
	l.sr	$f1, 76($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 100($sp)
	add.s	$f0, $f2, $f0
	l.sr	$f2, 60($sp)
	s.s	$f0, 104($sp)
	mov.s	$f0, $f2
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_fsqr
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	l.sr	$f1, 68($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 104($sp)
	add.s	$f0, $f2, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 8($v0)
	l.sl	$f0, l.6207
	l.sr	$f2, 80($sp)
	l.sr	$f3, 48($sp)
	mul.s	$f4, $f2, $f3
	l.sr	$f5, 40($sp)
	mul.s	$f4, $f4, $f5
	l.sr	$f6, 76($sp)
	l.sr	$f7, 44($sp)
	mul.s	$f8, $f6, $f7
	l.sr	$f9, 36($sp)
	mul.s	$f8, $f8, $f9
	add.s	$f4, $f4, $f8
	l.sr	$f8, 64($sp)
	mul.s	$f10, $f1, $f8
	l.sr	$f11, 60($sp)
	mul.s	$f10, $f10, $f11
	add.s	$f4, $f4, $f10
	mul.s	$f0, $f0, $f4
	lwr	$v0, 12($sp)
	s.s	$f0, 0($v0)
	l.sl	$f0, l.6207
	l.sr	$f4, 56($sp)
	mul.s	$f10, $f2, $f4
	mul.s	$f5, $f10, $f5
	l.sr	$f10, 52($sp)
	mul.s	$f12, $f6, $f10
	mul.s	$f9, $f12, $f9
	add.s	$f5, $f5, $f9
	l.sr	$f9, 72($sp)
	mul.s	$f12, $f1, $f9
	mul.s	$f11, $f12, $f11
	add.s	$f5, $f5, $f11
	mul.s	$f0, $f0, $f5
	s.s	$f0, 4($v0)
	l.sl	$f0, l.6207
	mul.s	$f2, $f2, $f4
	mul.s	$f2, $f2, $f3
	mul.s	$f3, $f6, $f10
	mul.s	$f3, $f3, $f7
	add.s	$f2, $f2, $f3
	mul.s	$f1, $f1, $f9
	mul.s	$f1, $f1, $f8
	add.s	$f1, $f2, $f1
	mul.s	$f0, $f0, $f1
	s.s	$f0, 8($v0)
	jr	$ra
read_nth_object.3683:
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	sw	$v1, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_read_int
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, -1
	bne	$v0, $v1, beq_else.8824
	li	$v0, 0
	jr	$ra
beq_else.8824:
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_read_int
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_int
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_read_int
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_float_array
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	sw	$v0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_read_float
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 28($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_read_float
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 28($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_read_float
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 28($sp)
	s.s	$f0, 8($v0)
	li	$v1, 3
	l.sl	$f0, l.6199
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_create_float_array
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	sw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 32($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 32($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 32($sp)
	s.s	$f0, 8($v0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fisneg
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 2
	l.sl	$f0, l.6199
	sw	$v0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_create_float_array
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	sw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 40($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 40($sp)
	s.s	$f0, 4($v0)
	li	$v1, 3
	l.sl	$f0, l.6199
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_float_array
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	sw	$v0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_read_float
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	lwr	$v0, 44($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_read_float
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	lwr	$v0, 44($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_read_float
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	lwr	$v0, 44($sp)
	s.s	$f0, 8($v0)
	li	$v1, 3
	l.sl	$f0, l.6199
	addi	$v0, $v1, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_create_float_array
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 0
	lwr	$a0, 24($sp)
	sw	$v0, 48($sp)
	bne	$a0, $v1, beq_else.8825
	j	beq_cont.8826
beq_else.8825:
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.3464
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$v0, 48($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.3464
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$v0, 48($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.3464
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$v0, 48($sp)
	s.s	$f0, 8($v0)
beq_cont.8826:
	li	$v0, 2
	lwr	$v1, 16($sp)
	bne	$v1, $v0, beq_else.8827
	li	$v0, 1
	j	beq_cont.8828
beq_else.8827:
	lwr	$v0, 36($sp)
beq_cont.8828:
	li	$v1, 4
	l.sl	$f0, l.6199
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_create_float_array
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 44
	sw	$v0, 40($v1)
	lwr	$v0, 48($sp)
	sw	$v0, 36($v1)
	lwr	$a0, 44($sp)
	sw	$a0, 32($v1)
	lwr	$a0, 40($sp)
	sw	$a0, 28($v1)
	lwr	$a0, 52($sp)
	sw	$a0, 24($v1)
	lwr	$a0, 32($sp)
	sw	$a0, 20($v1)
	lwr	$a0, 28($sp)
	sw	$a0, 16($v1)
	lwr	$a1, 24($sp)
	sw	$a1, 12($v1)
	lwr	$a2, 20($sp)
	sw	$a2, 8($v1)
	lwr	$a2, 16($sp)
	sw	$a2, 4($v1)
	lwr	$a3, 12($sp)
	sw	$a3, 0($v1)
	lwr	$a3, 8($sp)
	sll	$a3, $a3, 2
	lwr	$t0, 4($sp)
	add	$t9, $t0, $a3
	sw	$v1, 0($t9)
	li	$v1, 3
	bne	$a2, $v1, beq_else.8829
	l.sr	$f0, 0($a0)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fiszero
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8831
	l.sr	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	sgn.2841
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 56($sp)
	s.s	$f0, 60($sp)
	mov.s	$f0, $f1
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fsqr
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 60($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8832
beq_else.8831:
	l.sl	$f0, l.6199
beq_cont.8832:
	lwr	$v0, 28($sp)
	s.s	$f0, 0($v0)
	l.sr	$f0, 4($v0)
	s.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fiszero
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8833
	l.sr	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	sgn.2841
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	l.sr	$f1, 64($sp)
	s.s	$f0, 68($sp)
	mov.s	$f0, $f1
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_fsqr
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	l.sr	$f1, 68($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8834
beq_else.8833:
	l.sl	$f0, l.6199
beq_cont.8834:
	lwr	$v0, 28($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 8($v0)
	s.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fiszero
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8835
	l.sr	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	sgn.2841
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	l.sr	$f1, 72($sp)
	s.s	$f0, 76($sp)
	mov.s	$f0, $f1
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	min_caml_fsqr
	addi	$sp, $sp, -84
	lwr	$ra, 80($sp)
	l.sr	$f1, 76($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8836
beq_else.8835:
	l.sl	$f0, l.6199
beq_cont.8836:
	lwr	$v0, 28($sp)
	s.s	$f0, 8($v0)
	j	beq_cont.8830
beq_else.8829:
	li	$v1, 2
	bne	$a2, $v1, beq_else.8837
	li	$v1, 0
	lwr	$a2, 36($sp)
	bne	$a2, $v1, beq_else.8839
	li	$v1, 1
	j	beq_cont.8840
beq_else.8839:
	li	$v1, 0
beq_cont.8840:
	lwr	$v0, 28($sp)
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	vecunit_sgn.2892
	addi	$sp, $sp, -84
	lwr	$ra, 80($sp)
	j	beq_cont.8838
beq_else.8837:
beq_cont.8838:
beq_cont.8830:
	li	$v0, 0
	lwr	$v1, 24($sp)
	bne	$v1, $v0, beq_else.8841
	j	beq_cont.8842
beq_else.8841:
	lwr	$t8, 0($sp)
	lwr	$v0, 28($sp)
	lwr	$v1, 48($sp)
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -84
	lwr	$ra, 80($sp)
beq_cont.8842:
	li	$v0, 1
	jr	$ra
read_object.3813:
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	li	$a1, 60
	bgt	$a1, $v0, ble_else.8843
	jr	$ra
ble_else.8843:
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	addi	$t8, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8845
	lwr	$v0, 8($sp)
	lwr	$v1, 4($sp)
	sw	$v0, 0($v1)
	jr	$ra
beq_else.8845:
	lwr	$v0, 8($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
read_all_object.3821:
	lwr	$t8, 4($t8)
	li	$v0, 0
	lwr	$s7, 0($t8)
	jr	$s7
read_net_item.3824:
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_read_int
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v1, -1
	bne	$v0, $v1, beq_else.8847
	lwr	$v0, 0($sp)
	addi	$v0, $v0, 1
	li	$v1, -1
	j	min_caml_create_array
beq_else.8847:
	lwr	$v1, 0($sp)
	addi	$a0, $v1, 1
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	read_net_item.3824
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 0($sp)
	sll	$v1, $v1, 2
	lwr	$a0, 4($sp)
	add	$t9, $v0, $v1
	sw	$a0, 0($t9)
	jr	$ra
read_or_network.3838:
	li	$v1, 0
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	read_net_item.3824
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 0($v1)
	li	$a0, -1
	bne	$v0, $a0, beq_else.8848
	lwr	$v0, 0($sp)
	addi	$v0, $v0, 1
	j	min_caml_create_array
beq_else.8848:
	lwr	$v0, 0($sp)
	addi	$a0, $v0, 1
	sw	$v1, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	read_or_network.3838
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 0($sp)
	sll	$v1, $v1, 2
	lwr	$a0, 4($sp)
	add	$t9, $v0, $v1
	sw	$a0, 0($t9)
	jr	$ra
read_and_network.3852:
	lwr	$v1, 4($t8)
	li	$a0, 0
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$v0, 8($sp)
	addi	$v0, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_net_item.3824
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v1, 0($v0)
	li	$a0, -1
	bne	$v1, $a0, beq_else.8849
	jr	$ra
beq_else.8849:
	lwr	$v1, 8($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 4($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	addi	$v0, $v1, 1
	lwr	$t8, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
read_parameter.3863:
	lwr	$v0, 20($t8)
	lwr	$v1, 16($t8)
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sw	$a2, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	sw	$v1, 12($sp)
	addi	$t8, $v0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$t8, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$t8, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v0, 0
	lwr	$t8, 4($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	read_or_network.3838
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 0($v1)
	jr	$ra
solver_rect_surface.3876:
	lwr	$a3, 4($t8)
	sll	$t0, $a0, 2
	add	$t9, $v1, $t0
	l.sr	$f3, 0($t9)
	sw	$a3, 0($sp)
	s.s	$f2, 4($sp)
	sw	$a2, 8($sp)
	s.s	$f1, 12($sp)
	sw	$a1, 16($sp)
	s.s	$f0, 20($sp)
	sw	$v1, 24($sp)
	sw	$a0, 28($sp)
	sw	$v0, 32($sp)
	mov.s	$f0, $f3
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fiszero
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8852
	lwr	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.3168
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v1, 32($sp)
	sw	$v0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isinvert.3100
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$v1, 28($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 24($sp)
	add	$t9, $a1, $a0
	l.sr	$f0, 0($t9)
	sw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fisneg
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_xor
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v1, 28($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 36($sp)
	add	$t9, $a1, $a0
	l.sr	$f0, 0($t9)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	fneg_cond.2847
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 20($sp)
	sub.s	$f0, $f0, $f1
	lwr	$v0, 28($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 24($sp)
	add	$t9, $v1, $v0
	l.sr	$f1, 0($t9)
	div.s	$f0, $f0, $f1
	lwr	$v0, 16($sp)
	sll	$a0, $v0, 2
	add	$t9, $v1, $a0
	l.sr	$f1, 0($t9)
	mul.s	$f1, $f0, $f1
	l.sr	$f2, 12($sp)
	add.s	$f1, $f1, $f2
	s.s	$f0, 44($sp)
	mov.s	$f0, $f1
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fabs
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	lwr	$v0, 16($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 36($sp)
	add	$t9, $v1, $v0
	l.sr	$f1, 0($t9)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fless
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8853
	li	$v0, 0
	jr	$ra
beq_else.8853:
	lwr	$v0, 8($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 24($sp)
	add	$t9, $a0, $v1
	l.sr	$f0, 0($t9)
	l.sr	$f1, 44($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 4($sp)
	add.s	$f0, $f0, $f2
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fabs
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	lwr	$v0, 8($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 36($sp)
	add	$t9, $v1, $v0
	l.sr	$f1, 0($t9)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fless
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8854
	li	$v0, 0
	jr	$ra
beq_else.8854:
	l.sr	$f0, 44($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
beq_else.8852:
	li	$v0, 0
	jr	$ra
solver_rect.3914:
	lwr	$t8, 4($t8)
	li	$a0, 0
	li	$a1, 1
	li	$a2, 2
	s.s	$f0, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f1, 8($sp)
	sw	$v1, 12($sp)
	sw	$v0, 16($sp)
	sw	$t8, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8855
	li	$a0, 1
	li	$a1, 2
	li	$a2, 0
	lwr	$t8, 20($sp)
	lwr	$v0, 16($sp)
	lwr	$v1, 12($sp)
	l.sr	$f0, 8($sp)
	l.sr	$f1, 4($sp)
	l.sr	$f2, 0($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8856
	li	$a0, 2
	li	$a1, 0
	li	$a2, 1
	lwr	$t8, 20($sp)
	lwr	$v0, 16($sp)
	lwr	$v1, 12($sp)
	l.sr	$f0, 4($sp)
	l.sr	$f1, 0($sp)
	l.sr	$f2, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8857
	li	$v0, 0
	jr	$ra
beq_else.8857:
	li	$v0, 3
	jr	$ra
beq_else.8856:
	li	$v0, 2
	jr	$ra
beq_else.8855:
	li	$v0, 1
	jr	$ra
solver_surface.3935:
	lwr	$a0, 4($t8)
	sw	$a0, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f1, 8($sp)
	s.s	$f0, 12($sp)
	sw	$v1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_abc.3168
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 16($sp)
	sw	$v1, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	veciprod.2927
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fispos
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8858
	li	$v0, 0
	jr	$ra
beq_else.8858:
	lwr	$v0, 20($sp)
	l.sr	$f0, 12($sp)
	l.sr	$f1, 8($sp)
	l.sr	$f2, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	veciprod2.2946
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	fneg.2539
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	div.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
quadratic.3950:
	s.s	$f0, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f1, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fsqr
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 12($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_a.3126
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 8($sp)
	s.s	$f0, 20($sp)
	mov.s	$f0, $f1
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fsqr
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v0, 12($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_b.3140
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 20($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 4($sp)
	s.s	$f0, 28($sp)
	mov.s	$f0, $f1
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fsqr
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 12($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.3154
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 28($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 12($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isrot.3113
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8859
	l.sr	$f0, 36($sp)
	mov.s	$f0, $f0
	jr	$ra
beq_else.8859:
	l.sr	$f0, 8($sp)
	l.sr	$f1, 4($sp)
	mul.s	$f2, $f0, $f1
	lwr	$v0, 12($sp)
	s.s	$f2, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_r1.3293
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 36($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 4($sp)
	l.sr	$f2, 0($sp)
	mul.s	$f1, $f1, $f2
	lwr	$v0, 12($sp)
	s.s	$f0, 44($sp)
	s.s	$f1, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r2.3307
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 48($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 44($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 0($sp)
	l.sr	$f2, 8($sp)
	mul.s	$f1, $f1, $f2
	lwr	$v0, 12($sp)
	s.s	$f0, 52($sp)
	s.s	$f1, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_r3.3321
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 52($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
bilinear.3979:
	mul.s	$f6, $f0, $f3
	s.s	$f3, 0($sp)
	s.s	$f0, 4($sp)
	s.s	$f5, 8($sp)
	s.s	$f2, 12($sp)
	sw	$v0, 16($sp)
	s.s	$f4, 20($sp)
	s.s	$f1, 24($sp)
	s.s	$f6, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_a.3126
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 24($sp)
	l.sr	$f2, 20($sp)
	mul.s	$f3, $f1, $f2
	lwr	$v0, 16($sp)
	s.s	$f0, 32($sp)
	s.s	$f3, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_b.3140
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 36($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 32($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 12($sp)
	l.sr	$f2, 8($sp)
	mul.s	$f3, $f1, $f2
	lwr	$v0, 16($sp)
	s.s	$f0, 40($sp)
	s.s	$f3, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_c.3154
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 44($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 40($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isrot.3113
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8860
	l.sr	$f0, 48($sp)
	mov.s	$f0, $f0
	jr	$ra
beq_else.8860:
	l.sr	$f0, 12($sp)
	l.sr	$f1, 20($sp)
	mul.s	$f2, $f0, $f1
	l.sr	$f3, 24($sp)
	l.sr	$f4, 8($sp)
	mul.s	$f5, $f3, $f4
	add.s	$f2, $f2, $f5
	lwr	$v0, 16($sp)
	s.s	$f2, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r1.3293
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 52($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 4($sp)
	l.sr	$f2, 8($sp)
	mul.s	$f2, $f1, $f2
	l.sr	$f3, 12($sp)
	l.sr	$f4, 0($sp)
	mul.s	$f3, $f3, $f4
	add.s	$f2, $f2, $f3
	lwr	$v0, 16($sp)
	s.s	$f0, 56($sp)
	s.s	$f2, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_param_r2.3307
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 60($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 4($sp)
	l.sr	$f2, 20($sp)
	mul.s	$f1, $f1, $f2
	l.sr	$f2, 24($sp)
	l.sr	$f3, 0($sp)
	mul.s	$f2, $f2, $f3
	add.s	$f1, $f1, $f2
	lwr	$v0, 16($sp)
	s.s	$f0, 64($sp)
	s.s	$f1, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	o_param_r3.3321
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	l.sr	$f1, 68($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 64($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_fhalf
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	l.sr	$f1, 48($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
solver_second.4018:
	lwr	$a0, 4($t8)
	l.sr	$f3, 0($v1)
	l.sr	$f4, 4($v1)
	l.sr	$f5, 8($v1)
	sw	$a0, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f1, 8($sp)
	s.s	$f0, 12($sp)
	sw	$v0, 16($sp)
	sw	$v1, 20($sp)
	mov.s	$f2, $f5
	mov.s	$f1, $f4
	mov.s	$f0, $f3
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	quadratic.3950
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8861
	lwr	$v0, 20($sp)
	l.sr	$f0, 0($v0)
	l.sr	$f1, 4($v0)
	l.sr	$f2, 8($v0)
	lwr	$v0, 16($sp)
	l.sr	$f3, 12($sp)
	l.sr	$f4, 8($sp)
	l.sr	$f5, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	bilinear.3979
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 16($sp)
	l.sr	$f1, 12($sp)
	l.sr	$f2, 8($sp)
	l.sr	$f3, 4($sp)
	s.s	$f0, 28($sp)
	mov.s	$f0, $f1
	mov.s	$f1, $f2
	mov.s	$f2, $f3
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	quadratic.3950
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 16($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_form.3074
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.8862
	l.sl	$f0, l.6198
	l.sr	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8863
beq_else.8862:
	l.sr	$f0, 32($sp)
	mov.s	$f0, $f0
beq_cont.8863:
	l.sr	$f1, 28($sp)
	s.s	$f0, 36($sp)
	mov.s	$f0, $f1
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fsqr
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 24($sp)
	l.sr	$f2, 36($sp)
	mul.s	$f2, $f1, $f2
	sub.s	$f0, $f0, $f2
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fispos
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8864
	li	$v0, 0
	jr	$ra
beq_else.8864:
	l.sr	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 16($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_isinvert.3100
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8865
	l.sr	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	fneg.2539
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	j	beq_cont.8866
beq_else.8865:
	l.sr	$f0, 44($sp)
	mov.s	$f0, $f0
beq_cont.8866:
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f0, $f1
	l.sr	$f1, 24($sp)
	div.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
beq_else.8861:
	li	$v0, 0
	jr	$ra
solver.4058:
	lwr	$a1, 16($t8)
	lwr	$a2, 12($t8)
	lwr	$a3, 8($t8)
	lwr	$t0, 4($t8)
	sll	$v0, $v0, 2
	add	$t9, $t0, $v0
	lwr	$v0, 0($t9)
	l.sr	$f0, 0($a0)
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$v1, 8($sp)
	sw	$a3, 12($sp)
	sw	$v0, 16($sp)
	sw	$a0, 20($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.3181
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 20($sp)
	l.sr	$f1, 4($v0)
	lwr	$v1, 16($sp)
	s.s	$f0, 28($sp)
	s.s	$f1, 32($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_y.3195
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 20($sp)
	l.sr	$f1, 8($v0)
	lwr	$v0, 16($sp)
	s.s	$f0, 36($sp)
	s.s	$f1, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_z.3209
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 40($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_form.3074
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8867
	lwr	$t8, 12($sp)
	lwr	$v0, 16($sp)
	lwr	$v1, 8($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 36($sp)
	l.sr	$f2, 44($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8867:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8868
	lwr	$t8, 4($sp)
	lwr	$v0, 16($sp)
	lwr	$v1, 8($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 36($sp)
	l.sr	$f2, 44($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8868:
	lwr	$t8, 0($sp)
	lwr	$v0, 16($sp)
	lwr	$v1, 8($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 36($sp)
	l.sr	$f2, 44($sp)
	lwr	$s7, 0($t8)
	jr	$s7
solver_rect_fast.4078:
	lwr	$a1, 4($t8)
	l.sr	$f3, 0($a0)
	sub.s	$f3, $f3, $f0
	l.sr	$f4, 4($a0)
	mul.s	$f3, $f3, $f4
	l.sr	$f4, 4($v1)
	mul.s	$f4, $f3, $f4
	add.s	$f4, $f4, $f1
	sw	$a1, 0($sp)
	s.s	$f0, 4($sp)
	s.s	$f1, 8($sp)
	sw	$a0, 12($sp)
	s.s	$f2, 16($sp)
	s.s	$f3, 20($sp)
	sw	$v1, 24($sp)
	sw	$v0, 28($sp)
	mov.s	$f0, $f4
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fabs
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 28($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_b.3140
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fless
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8869
	li	$v0, 0
	j	beq_cont.8870
beq_else.8869:
	lwr	$v0, 24($sp)
	l.sr	$f0, 8($v0)
	l.sr	$f1, 20($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 16($sp)
	add.s	$f0, $f0, $f2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fabs
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 28($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_c.3154
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fless
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8871
	li	$v0, 0
	j	beq_cont.8872
beq_else.8871:
	lwr	$v0, 12($sp)
	l.sr	$f0, 4($v0)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fiszero
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8873
	li	$v0, 1
	j	beq_cont.8874
beq_else.8873:
	li	$v0, 0
beq_cont.8874:
beq_cont.8872:
beq_cont.8870:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8875
	lwr	$v0, 12($sp)
	l.sr	$f0, 8($v0)
	l.sr	$f1, 8($sp)
	sub.s	$f0, $f0, $f1
	l.sr	$f2, 12($v0)
	mul.s	$f0, $f0, $f2
	lwr	$v1, 24($sp)
	l.sr	$f2, 0($v1)
	mul.s	$f2, $f0, $f2
	l.sr	$f3, 4($sp)
	add.s	$f2, $f2, $f3
	s.s	$f0, 40($sp)
	mov.s	$f0, $f2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fabs
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 28($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_a.3126
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fless
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8876
	li	$v0, 0
	j	beq_cont.8877
beq_else.8876:
	lwr	$v0, 24($sp)
	l.sr	$f0, 8($v0)
	l.sr	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 16($sp)
	add.s	$f0, $f0, $f2
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fabs
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	lwr	$v0, 28($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_c.3154
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fless
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8878
	li	$v0, 0
	j	beq_cont.8879
beq_else.8878:
	lwr	$v0, 12($sp)
	l.sr	$f0, 12($v0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fiszero
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8880
	li	$v0, 1
	j	beq_cont.8881
beq_else.8880:
	li	$v0, 0
beq_cont.8881:
beq_cont.8879:
beq_cont.8877:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8882
	lwr	$v0, 12($sp)
	l.sr	$f0, 16($v0)
	l.sr	$f1, 16($sp)
	sub.s	$f0, $f0, $f1
	l.sr	$f1, 20($v0)
	mul.s	$f0, $f0, $f1
	lwr	$v1, 24($sp)
	l.sr	$f1, 0($v1)
	mul.s	$f1, $f0, $f1
	l.sr	$f2, 4($sp)
	add.s	$f1, $f1, $f2
	s.s	$f0, 52($sp)
	mov.s	$f0, $f1
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fabs
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	lwr	$v0, 28($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_a.3126
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8883
	li	$v0, 0
	j	beq_cont.8884
beq_else.8883:
	lwr	$v0, 24($sp)
	l.sr	$f0, 4($v0)
	l.sr	$f1, 52($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 8($sp)
	add.s	$f0, $f0, $f2
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fabs
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 28($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_param_b.3140
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fless
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8885
	li	$v0, 0
	j	beq_cont.8886
beq_else.8885:
	lwr	$v0, 12($sp)
	l.sr	$f0, 20($v0)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fiszero
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8887
	li	$v0, 1
	j	beq_cont.8888
beq_else.8887:
	li	$v0, 0
beq_cont.8888:
beq_cont.8886:
beq_cont.8884:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8889
	li	$v0, 0
	jr	$ra
beq_else.8889:
	l.sr	$f0, 52($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 3
	jr	$ra
beq_else.8882:
	l.sr	$f0, 40($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 2
	jr	$ra
beq_else.8875:
	l.sr	$f0, 20($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_surface_fast.4175:
	lwr	$v0, 4($t8)
	l.sr	$f3, 0($v1)
	sw	$v0, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f1, 8($sp)
	s.s	$f0, 12($sp)
	sw	$v1, 16($sp)
	mov.s	$f0, $f3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fisneg
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8890
	li	$v0, 0
	jr	$ra
beq_else.8890:
	lwr	$v0, 16($sp)
	l.sr	$f0, 4($v0)
	l.sr	$f1, 12($sp)
	mul.s	$f0, $f0, $f1
	l.sr	$f1, 8($v0)
	l.sr	$f2, 8($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	l.sr	$f1, 12($v0)
	l.sr	$f2, 4($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_second_fast.4198:
	lwr	$a0, 4($t8)
	l.sr	$f3, 0($v1)
	sw	$a0, 0($sp)
	s.s	$f3, 4($sp)
	sw	$v0, 8($sp)
	s.s	$f2, 12($sp)
	s.s	$f1, 16($sp)
	s.s	$f0, 20($sp)
	sw	$v1, 24($sp)
	mov.s	$f0, $f3
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8891
	lwr	$v0, 24($sp)
	l.sr	$f0, 4($v0)
	l.sr	$f1, 20($sp)
	mul.s	$f0, $f0, $f1
	l.sr	$f2, 8($v0)
	l.sr	$f3, 16($sp)
	mul.s	$f2, $f2, $f3
	add.s	$f0, $f0, $f2
	l.sr	$f2, 12($v0)
	l.sr	$f4, 12($sp)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	lwr	$v1, 8($sp)
	s.s	$f0, 28($sp)
	addi	$v0, $v1, 0
	mov.s	$f2, $f4
	mov.s	$f0, $f1
	mov.s	$f1, $f3
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	quadratic.3950
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_form.3074
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.8892
	l.sl	$f0, l.6198
	l.sr	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8893
beq_else.8892:
	l.sr	$f0, 32($sp)
	mov.s	$f0, $f0
beq_cont.8893:
	l.sr	$f1, 28($sp)
	s.s	$f0, 36($sp)
	mov.s	$f0, $f1
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fsqr
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 4($sp)
	l.sr	$f2, 36($sp)
	mul.s	$f1, $f1, $f2
	sub.s	$f0, $f0, $f1
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fispos
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8894
	li	$v0, 0
	jr	$ra
beq_else.8894:
	lwr	$v0, 8($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.3100
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8895
	l.sr	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 24($sp)
	l.sr	$f1, 16($v0)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	j	beq_cont.8896
beq_else.8895:
	l.sr	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 28($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 24($sp)
	l.sr	$f1, 16($v0)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
beq_cont.8896:
	li	$v0, 1
	jr	$ra
beq_else.8891:
	li	$v0, 0
	jr	$ra
solver_fast.4244:
	lwr	$a1, 16($t8)
	lwr	$a2, 12($t8)
	lwr	$a3, 8($t8)
	lwr	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $t0, $t1
	lwr	$t0, 0($t9)
	l.sr	$f0, 0($a0)
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
	jal	o_param_x.3181
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 24($sp)
	l.sr	$f1, 4($v0)
	lwr	$v1, 20($sp)
	s.s	$f0, 32($sp)
	s.s	$f1, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_y.3195
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 36($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 24($sp)
	l.sr	$f1, 8($v0)
	lwr	$v0, 20($sp)
	s.s	$f0, 40($sp)
	s.s	$f1, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_z.3209
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 44($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	d_const.3445
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$v1, 12($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lwr	$v0, 0($t9)
	lwr	$v1, 20($sp)
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_form.3074
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8897
	lwr	$v0, 16($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	d_vec.3441
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	addi	$v1, $v0, 0
	lwr	$t8, 8($sp)
	lwr	$v0, 20($sp)
	lwr	$a0, 52($sp)
	l.sr	$f0, 32($sp)
	l.sr	$f1, 40($sp)
	l.sr	$f2, 48($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8897:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8898
	lwr	$t8, 4($sp)
	lwr	$v0, 20($sp)
	lwr	$v1, 52($sp)
	l.sr	$f0, 32($sp)
	l.sr	$f1, 40($sp)
	l.sr	$f2, 48($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8898:
	lwr	$t8, 0($sp)
	lwr	$v0, 20($sp)
	lwr	$v1, 52($sp)
	l.sr	$f0, 32($sp)
	l.sr	$f1, 40($sp)
	l.sr	$f2, 48($sp)
	lwr	$s7, 0($t8)
	jr	$s7
solver_surface_fast2.4267:
	lwr	$v0, 4($t8)
	l.sr	$f0, 0($v1)
	sw	$v0, 0($sp)
	sw	$a0, 4($sp)
	sw	$v1, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fisneg
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8899
	li	$v0, 0
	jr	$ra
beq_else.8899:
	lwr	$v0, 8($sp)
	l.sr	$f0, 0($v0)
	lwr	$v0, 4($sp)
	l.sr	$f1, 12($v0)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_second_fast2.4285:
	lwr	$a1, 4($t8)
	l.sr	$f3, 0($v1)
	sw	$a1, 0($sp)
	sw	$v0, 4($sp)
	s.s	$f3, 8($sp)
	sw	$a0, 12($sp)
	s.s	$f2, 16($sp)
	s.s	$f1, 20($sp)
	s.s	$f0, 24($sp)
	sw	$v1, 28($sp)
	mov.s	$f0, $f3
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fiszero
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8900
	lwr	$v0, 28($sp)
	l.sr	$f0, 4($v0)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f0, $f1
	l.sr	$f1, 8($v0)
	l.sr	$f2, 20($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	l.sr	$f1, 12($v0)
	l.sr	$f2, 16($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lwr	$v1, 12($sp)
	l.sr	$f1, 12($v1)
	s.s	$f0, 32($sp)
	s.s	$f1, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fsqr
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 8($sp)
	l.sr	$f2, 36($sp)
	mul.s	$f1, $f1, $f2
	sub.s	$f0, $f0, $f1
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fispos
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8901
	li	$v0, 0
	jr	$ra
beq_else.8901:
	lwr	$v0, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.3100
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8902
	l.sr	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 28($sp)
	l.sr	$f1, 16($v0)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	j	beq_cont.8903
beq_else.8902:
	l.sr	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sqrt
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 32($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 28($sp)
	l.sr	$f1, 16($v0)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
beq_cont.8903:
	li	$v0, 1
	jr	$ra
beq_else.8900:
	li	$v0, 0
	jr	$ra
solver_fast2.4329:
	lwr	$a0, 16($t8)
	lwr	$a1, 12($t8)
	lwr	$a2, 8($t8)
	lwr	$a3, 4($t8)
	sll	$t0, $v0, 2
	add	$t9, $a3, $t0
	lwr	$a3, 0($t9)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	sw	$a3, 12($sp)
	sw	$v0, 16($sp)
	sw	$v1, 20($sp)
	addi	$v0, $a3, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_ctbl.3335
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f0, 0($v0)
	l.sr	$f1, 4($v0)
	l.sr	$f2, 8($v0)
	lwr	$v1, 20($sp)
	sw	$v0, 24($sp)
	s.s	$f2, 28($sp)
	s.s	$f1, 32($sp)
	s.s	$f0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	d_const.3445
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$v1, 16($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lwr	$v0, 0($t9)
	lwr	$v1, 12($sp)
	sw	$v0, 40($sp)
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_form.3074
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8904
	lwr	$v0, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	d_vec.3441
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	addi	$v1, $v0, 0
	lwr	$t8, 8($sp)
	lwr	$v0, 12($sp)
	lwr	$a0, 40($sp)
	l.sr	$f0, 36($sp)
	l.sr	$f1, 32($sp)
	l.sr	$f2, 28($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8904:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8905
	lwr	$t8, 4($sp)
	lwr	$v0, 12($sp)
	lwr	$v1, 40($sp)
	lwr	$a0, 24($sp)
	l.sr	$f0, 36($sp)
	l.sr	$f1, 32($sp)
	l.sr	$f2, 28($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8905:
	lwr	$t8, 0($sp)
	lwr	$v0, 12($sp)
	lwr	$v1, 40($sp)
	lwr	$a0, 24($sp)
	l.sr	$f0, 36($sp)
	l.sr	$f1, 32($sp)
	l.sr	$f2, 28($sp)
	lwr	$s7, 0($t8)
	jr	$s7
setup_rect_table.4346:
	li	$a0, 6
	l.sl	$f0, l.6199
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_float_array
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 4($sp)
	l.sr	$f0, 0($v1)
	sw	$v0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fiszero
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8906
	lwr	$v0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.3100
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v1, 4($sp)
	l.sr	$f0, 0($v1)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fisneg
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_xor
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_a.3126
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	fneg_cond.2847
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 0($v0)
	l.sl	$f0, l.6198
	lwr	$v1, 4($sp)
	l.sr	$f1, 0($v1)
	div.s	$f0, $f0, $f1
	s.s	$f0, 4($v0)
	j	beq_cont.8907
beq_else.8906:
	l.sl	$f0, l.6199
	lwr	$v0, 8($sp)
	s.s	$f0, 4($v0)
beq_cont.8907:
	lwr	$v0, 4($sp)
	l.sr	$f0, 4($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fiszero
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8908
	lwr	$v0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.3100
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v1, 4($sp)
	l.sr	$f0, 4($v1)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fisneg
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_xor
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_b.3140
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	fneg_cond.2847
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 8($v0)
	l.sl	$f0, l.6198
	lwr	$v1, 4($sp)
	l.sr	$f1, 4($v1)
	div.s	$f0, $f0, $f1
	s.s	$f0, 12($v0)
	j	beq_cont.8909
beq_else.8908:
	l.sl	$f0, l.6199
	lwr	$v0, 8($sp)
	s.s	$f0, 12($v0)
beq_cont.8909:
	lwr	$v0, 4($sp)
	l.sr	$f0, 8($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8910
	lwr	$v0, 0($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_isinvert.3100
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v1, 4($sp)
	l.sr	$f0, 8($v1)
	sw	$v0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fisneg
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_xor
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 32($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.3154
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg_cond.2847
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 16($v0)
	l.sl	$f0, l.6198
	lwr	$v1, 4($sp)
	l.sr	$f1, 8($v1)
	div.s	$f0, $f0, $f1
	s.s	$f0, 20($v0)
	j	beq_cont.8911
beq_else.8910:
	l.sl	$f0, l.6199
	lwr	$v0, 8($sp)
	s.s	$f0, 20($v0)
beq_cont.8911:
	lwr	$v0, 8($sp)
	jr	$ra
setup_surface_table.4415:
	li	$a0, 4
	l.sl	$f0, l.6199
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_float_array
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 4($sp)
	l.sr	$f0, 0($v1)
	lwr	$a0, 0($sp)
	sw	$v0, 8($sp)
	s.s	$f0, 12($sp)
	addi	$v0, $a0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_a.3126
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sr	$f1, 12($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	l.sr	$f1, 4($v0)
	lwr	$v1, 0($sp)
	s.s	$f0, 16($sp)
	s.s	$f1, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_b.3140
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 20($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 16($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	l.sr	$f1, 8($v0)
	lwr	$v0, 0($sp)
	s.s	$f0, 24($sp)
	s.s	$f1, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_c.3154
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 24($sp)
	add.s	$f0, $f1, $f0
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fispos
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8912
	l.sl	$f0, l.6199
	lwr	$v0, 8($sp)
	s.s	$f0, 0($v0)
	j	beq_cont.8913
beq_else.8912:
	l.sl	$f0, l.6211
	l.sr	$f1, 32($sp)
	div.s	$f0, $f0, $f1
	lwr	$v0, 8($sp)
	s.s	$f0, 0($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.3126
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg.2539
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 4($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_b.3140
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg.2539
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 8($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.3154
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg.2539
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 12($v0)
beq_cont.8913:
	lwr	$v0, 8($sp)
	jr	$ra
setup_second_table.4458:
	li	$a0, 5
	l.sl	$f0, l.6199
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_float_array
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 4($sp)
	l.sr	$f0, 0($v1)
	l.sr	$f1, 4($v1)
	l.sr	$f2, 8($v1)
	lwr	$a0, 0($sp)
	sw	$v0, 8($sp)
	addi	$v0, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	quadratic.3950
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v0, 4($sp)
	l.sr	$f1, 0($v0)
	lwr	$v1, 0($sp)
	s.s	$f0, 12($sp)
	s.s	$f1, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_a.3126
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	fneg.2539
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 4($sp)
	l.sr	$f1, 4($v0)
	lwr	$v1, 0($sp)
	s.s	$f0, 20($sp)
	s.s	$f1, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_b.3140
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	fneg.2539
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 4($sp)
	l.sr	$f1, 8($v0)
	lwr	$v1, 0($sp)
	s.s	$f0, 28($sp)
	s.s	$f1, 32($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.3154
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg.2539
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 12($sp)
	lwr	$v0, 8($sp)
	s.s	$f1, 0($v0)
	lwr	$v1, 0($sp)
	s.s	$f0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isrot.3113
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8914
	l.sr	$f0, 20($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 28($sp)
	s.s	$f0, 8($v0)
	l.sr	$f0, 36($sp)
	s.s	$f0, 12($v0)
	j	beq_cont.8915
beq_else.8914:
	lwr	$v0, 4($sp)
	l.sr	$f0, 8($v0)
	lwr	$v1, 0($sp)
	s.s	$f0, 40($sp)
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_r2.3307
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	l.sr	$f1, 4($v0)
	lwr	$v1, 0($sp)
	s.s	$f0, 44($sp)
	s.s	$f1, 48($sp)
	addi	$v0, $v1, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r3.3321
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 48($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 44($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fhalf
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 20($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 4($v0)
	lwr	$v1, 4($sp)
	l.sr	$f0, 8($v1)
	lwr	$a0, 0($sp)
	s.s	$f0, 52($sp)
	addi	$v0, $a0, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r1.3293
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 52($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	l.sr	$f1, 0($v0)
	lwr	$v1, 0($sp)
	s.s	$f0, 56($sp)
	s.s	$f1, 60($sp)
	addi	$v0, $v1, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_param_r3.3321
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 60($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fhalf
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 8($v0)
	lwr	$v1, 4($sp)
	l.sr	$f0, 4($v1)
	lwr	$a0, 0($sp)
	s.s	$f0, 64($sp)
	addi	$v0, $a0, 0
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_r1.3293
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	l.sr	$f1, 64($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	l.sr	$f1, 0($v0)
	lwr	$v0, 0($sp)
	s.s	$f0, 68($sp)
	s.s	$f1, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_r2.3307
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	l.sr	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 68($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fhalf
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	l.sr	$f1, 36($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 12($v0)
beq_cont.8915:
	l.sr	$f0, 12($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fiszero
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8916
	l.sl	$f0, l.6198
	l.sr	$f1, 12($sp)
	div.s	$f0, $f0, $f1
	lwr	$v0, 8($sp)
	s.s	$f0, 16($v0)
	j	beq_cont.8917
beq_else.8916:
beq_cont.8917:
	lwr	$v0, 8($sp)
	jr	$ra
iter_setup_dirvec_constants.4540:
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.8918
	sll	$a1, $v1, 2
	add	$t9, $a0, $a1
	lwr	$a0, 0($t9)
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$a0, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	d_const.3445
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	d_vec.3441
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v1, 8($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_form.3074
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8919
	lwr	$v0, 20($sp)
	lwr	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_rect_table.4346
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 4($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	j	beq_cont.8920
beq_else.8919:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8921
	lwr	$v0, 20($sp)
	lwr	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_surface_table.4415
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 4($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	j	beq_cont.8922
beq_else.8921:
	lwr	$v0, 20($sp)
	lwr	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_second_table.4458
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 4($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
beq_cont.8922:
beq_cont.8920:
	lwr	$v0, 4($sp)
	addi	$v1, $v0, -1
	lwr	$t8, 0($sp)
	lwr	$v0, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8918:
	jr	$ra
setup_dirvec_constants.4556:
	lwr	$v1, 8($t8)
	lwr	$t8, 4($t8)
	lwr	$v1, 0($v1)
	addi	$v1, $v1, -1
	lwr	$s7, 0($t8)
	jr	$s7
setup_startp_constants.4562:
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.8924
	sll	$a1, $v1, 2
	add	$t9, $a0, $a1
	lwr	$a0, 0($t9)
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$v0, 8($sp)
	sw	$a0, 12($sp)
	addi	$v0, $a0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_ctbl.3335
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.3074
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v1, 8($sp)
	l.sr	$f0, 0($v1)
	lwr	$a0, 12($sp)
	sw	$v0, 20($sp)
	s.s	$f0, 24($sp)
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.3181
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 0($v0)
	lwr	$v1, 8($sp)
	l.sr	$f0, 4($v1)
	lwr	$a0, 12($sp)
	s.s	$f0, 28($sp)
	addi	$v0, $a0, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_y.3195
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 4($v0)
	lwr	$v1, 8($sp)
	l.sr	$f0, 8($v1)
	lwr	$a0, 12($sp)
	s.s	$f0, 32($sp)
	addi	$v0, $a0, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_z.3209
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 8($v0)
	li	$v1, 2
	lwr	$a0, 20($sp)
	bne	$a0, $v1, beq_else.8925
	lwr	$v1, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.3168
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v1, 16($sp)
	l.sr	$f0, 0($v1)
	l.sr	$f1, 4($v1)
	l.sr	$f2, 8($v1)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veciprod2.2946
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 16($sp)
	s.s	$f0, 12($v0)
	j	beq_cont.8926
beq_else.8925:
	li	$v1, 2
	bgt	$a0, $v1, ble_else.8927
	j	ble_cont.8928
ble_else.8927:
	l.sr	$f0, 0($v0)
	l.sr	$f1, 4($v0)
	l.sr	$f2, 8($v0)
	lwr	$v1, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	quadratic.3950
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v0, 3
	lwr	$v1, 20($sp)
	bne	$v1, $v0, beq_else.8929
	l.sl	$f1, l.6198
	sub.s	$f0, $f0, $f1
	j	beq_cont.8930
beq_else.8929:
	mov.s	$f0, $f0
beq_cont.8930:
	lwr	$v0, 16($sp)
	s.s	$f0, 12($v0)
ble_cont.8928:
beq_cont.8926:
	lwr	$v0, 4($sp)
	addi	$v1, $v0, -1
	lwr	$t8, 0($sp)
	lwr	$v0, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8924:
	jr	$ra
setup_startp.4612:
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	sw	$v0, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	veccpy.2878
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v0, 8($sp)
	lwr	$v0, 0($v0)
	addi	$v1, $v0, -1
	lwr	$t8, 4($sp)
	lwr	$v0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
is_rect_outside.4619:
	s.s	$f2, 0($sp)
	s.s	$f1, 4($sp)
	sw	$v0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fabs
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_a.3126
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fless
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8932
	li	$v0, 0
	j	beq_cont.8933
beq_else.8932:
	l.sr	$f0, 4($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fabs
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_b.3140
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fless
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8934
	li	$v0, 0
	j	beq_cont.8935
beq_else.8934:
	l.sr	$f0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fabs
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_c.3154
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fless
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
beq_cont.8935:
beq_cont.8933:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8936
	lwr	$v0, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_isinvert.3100
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8937
	li	$v0, 1
	jr	$ra
beq_else.8937:
	li	$v0, 0
	jr	$ra
beq_else.8936:
	lwr	$v0, 8($sp)
	j	o_isinvert.3100
is_plane_outside.4638:
	sw	$v0, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f1, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_abc.3168
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sr	$f0, 12($sp)
	l.sr	$f1, 8($sp)
	l.sr	$f2, 4($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	veciprod2.2946
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.3100
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f0, 16($sp)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fisneg
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_xor
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8938
	li	$v0, 1
	jr	$ra
beq_else.8938:
	li	$v0, 0
	jr	$ra
is_second_outside.4649:
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	quadratic.3950
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_form.3074
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.8939
	l.sl	$f0, l.6198
	l.sr	$f1, 4($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8940
beq_else.8939:
	l.sr	$f0, 4($sp)
	mov.s	$f0, $f0
beq_cont.8940:
	lwr	$v0, 0($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.3100
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sr	$f0, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fisneg
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_xor
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8941
	li	$v0, 1
	jr	$ra
beq_else.8941:
	li	$v0, 0
	jr	$ra
is_outside.4663:
	s.s	$f2, 0($sp)
	s.s	$f1, 4($sp)
	sw	$v0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_x.3181
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sr	$f1, 12($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_y.3195
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 4($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_z.3209
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 0($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_form.3074
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8942
	lwr	$v0, 8($sp)
	l.sr	$f0, 16($sp)
	l.sr	$f1, 20($sp)
	l.sr	$f2, 24($sp)
	j	is_rect_outside.4619
beq_else.8942:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8943
	lwr	$v0, 8($sp)
	l.sr	$f0, 16($sp)
	l.sr	$f1, 20($sp)
	l.sr	$f2, 24($sp)
	j	is_plane_outside.4638
beq_else.8943:
	lwr	$v0, 8($sp)
	l.sr	$f0, 16($sp)
	l.sr	$f1, 20($sp)
	l.sr	$f2, 24($sp)
	j	is_second_outside.4649
check_all_inside.4677:
	lwr	$a0, 4($t8)
	sll	$a1, $v0, 2
	add	$t9, $v1, $a1
	lwr	$a1, 0($t9)
	li	$a2, -1
	bne	$a1, $a2, beq_else.8944
	li	$v0, 1
	jr	$ra
beq_else.8944:
	sll	$a1, $a1, 2
	add	$t9, $a0, $a1
	lwr	$a0, 0($t9)
	s.s	$f2, 0($sp)
	s.s	$f1, 4($sp)
	s.s	$f0, 8($sp)
	sw	$v1, 12($sp)
	sw	$t8, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	is_outside.4663
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8945
	lwr	$v0, 20($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 16($sp)
	lwr	$v1, 12($sp)
	l.sr	$f0, 8($sp)
	l.sr	$f1, 4($sp)
	l.sr	$f2, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8945:
	li	$v0, 0
	jr	$ra
shadow_check_and_group.4691:
	lwr	$a0, 28($t8)
	lwr	$a1, 24($t8)
	lwr	$a2, 20($t8)
	lwr	$a3, 16($t8)
	lwr	$t0, 12($t8)
	lwr	$t1, 8($t8)
	lwr	$t2, 4($t8)
	sll	$t3, $v0, 2
	add	$t9, $v1, $t3
	lwr	$t3, 0($t9)
	li	$t4, -1
	bne	$t3, $t4, beq_else.8946
	li	$v0, 0
	jr	$ra
beq_else.8946:
	sll	$t3, $v0, 2
	add	$t9, $v1, $t3
	lwr	$t3, 0($t9)
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
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v1, 32($sp)
	l.sr	$f0, 0($v1)
	li	$v1, 0
	s.s	$f0, 36($sp)
	bne	$v0, $v1, beq_else.8947
	li	$v0, 0
	j	beq_cont.8948
beq_else.8947:
	l.sl	$f1, l.6524
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fless
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
beq_cont.8948:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8949
	lwr	$v0, 28($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 24($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isinvert.3100
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8950
	li	$v0, 0
	jr	$ra
beq_else.8950:
	lwr	$v0, 20($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 16($sp)
	lwr	$v1, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8949:
	l.sl	$f0, l.6526
	l.sr	$f1, 36($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	l.sr	$f1, 0($v0)
	mul.s	$f1, $f1, $f0
	lwr	$v1, 4($sp)
	l.sr	$f2, 0($v1)
	add.s	$f1, $f1, $f2
	l.sr	$f2, 4($v0)
	mul.s	$f2, $f2, $f0
	l.sr	$f3, 4($v1)
	add.s	$f2, $f2, $f3
	l.sr	$f3, 8($v0)
	mul.s	$f0, $f3, $f0
	l.sr	$f3, 8($v1)
	add.s	$f0, $f0, $f3
	li	$v0, 0
	lwr	$t8, 0($sp)
	lwr	$v1, 12($sp)
	mov.s	$f31, $f2
	mov.s	$f2, $f0
	mov.s	$f0, $f1
	mov.s	$f1, $f31
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8951
	lwr	$v0, 20($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 16($sp)
	lwr	$v1, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8951:
	li	$v0, 1
	jr	$ra
shadow_check_one_or_group.4735:
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	sll	$a2, $v0, 2
	add	$t9, $v1, $a2
	lwr	$a2, 0($t9)
	li	$a3, -1
	bne	$a2, $a3, beq_else.8952
	li	$v0, 0
	jr	$ra
beq_else.8952:
	sll	$a2, $a2, 2
	add	$t9, $a1, $a2
	lwr	$a1, 0($t9)
	li	$a2, 0
	sw	$v1, 0($sp)
	sw	$t8, 4($sp)
	sw	$v0, 8($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a2, 0
	addi	$t8, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8953
	lwr	$v0, 8($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 4($sp)
	lwr	$v1, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8953:
	li	$v0, 1
	jr	$ra
shadow_check_one_or_matrix.4747:
	lwr	$a0, 20($t8)
	lwr	$a1, 16($t8)
	lwr	$a2, 12($t8)
	lwr	$a3, 8($t8)
	lwr	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $v1, $t1
	lwr	$t1, 0($t9)
	lwr	$t2, 0($t1)
	li	$t3, -1
	bne	$t2, $t3, beq_else.8954
	li	$v0, 0
	jr	$ra
beq_else.8954:
	li	$t3, 99
	sw	$t1, 0($sp)
	sw	$a2, 4($sp)
	sw	$v1, 8($sp)
	sw	$t8, 12($sp)
	sw	$v0, 16($sp)
	bne	$t2, $t3, beq_else.8955
	li	$v0, 1
	j	beq_cont.8956
beq_else.8955:
	sw	$a1, 20($sp)
	addi	$v1, $a3, 0
	addi	$v0, $t2, 0
	addi	$t8, $a0, 0
	addi	$a0, $t0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8957
	li	$v0, 0
	j	beq_cont.8958
beq_else.8957:
	lwr	$v0, 20($sp)
	l.sr	$f0, 0($v0)
	l.sl	$f1, l.6538
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fless
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8959
	li	$v0, 0
	j	beq_cont.8960
beq_else.8959:
	li	$v0, 1
	lwr	$t8, 4($sp)
	lwr	$v1, 0($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8961
	li	$v0, 0
	j	beq_cont.8962
beq_else.8961:
	li	$v0, 1
beq_cont.8962:
beq_cont.8960:
beq_cont.8958:
beq_cont.8956:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8963
	lwr	$v0, 16($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 12($sp)
	lwr	$v1, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8963:
	li	$v0, 1
	lwr	$t8, 4($sp)
	lwr	$v1, 0($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8964
	lwr	$v0, 16($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 12($sp)
	lwr	$v1, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8964:
	li	$v0, 1
	jr	$ra
solve_each_element.4775:
	lwr	$a1, 36($t8)
	lwr	$a2, 32($t8)
	lwr	$a3, 28($t8)
	lwr	$t0, 24($t8)
	lwr	$t1, 20($t8)
	lwr	$t2, 16($t8)
	lwr	$t3, 12($t8)
	lwr	$t4, 8($t8)
	lwr	$t5, 4($t8)
	sll	$t6, $v0, 2
	add	$t9, $v1, $t6
	lwr	$t6, 0($t9)
	li	$t7, -1
	bne	$t6, $t7, beq_else.8965
	jr	$ra
beq_else.8965:
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
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8967
	lwr	$v0, 48($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 44($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.3100
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8968
	jr	$ra
beq_else.8968:
	lwr	$v0, 40($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 36($sp)
	lwr	$v1, 32($sp)
	lwr	$a0, 28($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8967:
	lwr	$v1, 24($sp)
	l.sr	$f1, 0($v1)
	l.sl	$f0, l.6199
	sw	$v0, 52($sp)
	s.s	$f1, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8970
	j	beq_cont.8971
beq_else.8970:
	lwr	$v0, 20($sp)
	l.sr	$f1, 0($v0)
	l.sr	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8972
	j	beq_cont.8973
beq_else.8972:
	l.sl	$f0, l.6526
	l.sr	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 28($sp)
	l.sr	$f1, 0($v0)
	mul.s	$f1, $f1, $f0
	lwr	$v1, 16($sp)
	l.sr	$f2, 0($v1)
	add.s	$f1, $f1, $f2
	l.sr	$f2, 4($v0)
	mul.s	$f2, $f2, $f0
	l.sr	$f3, 4($v1)
	add.s	$f2, $f2, $f3
	l.sr	$f3, 8($v0)
	mul.s	$f3, $f3, $f0
	l.sr	$f4, 8($v1)
	add.s	$f3, $f3, $f4
	li	$v1, 0
	lwr	$t8, 12($sp)
	lwr	$a0, 32($sp)
	s.s	$f3, 60($sp)
	s.s	$f2, 64($sp)
	s.s	$f1, 68($sp)
	s.s	$f0, 72($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	mov.s	$f0, $f1
	mov.s	$f1, $f2
	mov.s	$f2, $f3
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8974
	j	beq_cont.8975
beq_else.8974:
	l.sr	$f0, 72($sp)
	lwr	$v0, 20($sp)
	s.s	$f0, 0($v0)
	lwr	$v0, 8($sp)
	l.sr	$f0, 68($sp)
	l.sr	$f1, 64($sp)
	l.sr	$f2, 60($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	vecset.2857
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	lwr	$v0, 48($sp)
	lwr	$v1, 4($sp)
	sw	$v0, 0($v1)
	lwr	$v0, 52($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 0($v1)
beq_cont.8975:
beq_cont.8973:
beq_cont.8971:
	lwr	$v0, 40($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 36($sp)
	lwr	$v1, 32($sp)
	lwr	$a0, 28($sp)
	lwr	$s7, 0($t8)
	jr	$s7
solve_one_or_network.4830:
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sll	$a3, $v0, 2
	add	$t9, $v1, $a3
	lwr	$a3, 0($t9)
	li	$t0, -1
	bne	$a3, $t0, beq_else.8976
	jr	$ra
beq_else.8976:
	sll	$a3, $a3, 2
	add	$t9, $a2, $a3
	lwr	$a2, 0($t9)
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
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 12($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 8($sp)
	lwr	$v1, 4($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
trace_or_matrix.4842:
	lwr	$a1, 20($t8)
	lwr	$a2, 16($t8)
	lwr	$a3, 12($t8)
	lwr	$t0, 8($t8)
	lwr	$t1, 4($t8)
	sll	$t2, $v0, 2
	add	$t9, $v1, $t2
	lwr	$t2, 0($t9)
	lwr	$t3, 0($t2)
	li	$t4, -1
	bne	$t3, $t4, beq_else.8978
	jr	$ra
beq_else.8978:
	li	$t4, 99
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	bne	$t3, $t4, beq_else.8980
	li	$a1, 1
	addi	$v1, $t2, 0
	addi	$v0, $a1, 0
	addi	$t8, $t1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	j	beq_cont.8981
beq_else.8980:
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
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8982
	j	beq_cont.8983
beq_else.8982:
	lwr	$v0, 28($sp)
	l.sr	$f0, 0($v0)
	lwr	$v0, 24($sp)
	l.sr	$f1, 0($v0)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fless
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8984
	j	beq_cont.8985
beq_else.8984:
	li	$v0, 1
	lwr	$t8, 20($sp)
	lwr	$v1, 16($sp)
	lwr	$a0, 0($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
beq_cont.8985:
beq_cont.8983:
beq_cont.8981:
	lwr	$v0, 12($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 8($sp)
	lwr	$v1, 4($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
judge_intersection.4865:
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	l.sl	$f0, l.6558
	s.s	$f0, 0($a0)
	li	$a2, 0
	lwr	$a1, 0($a1)
	sw	$a0, 0($sp)
	addi	$a0, $v0, 0
	addi	$t8, $v1, 0
	addi	$v1, $a1, 0
	addi	$v0, $a2, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v0, 0($sp)
	l.sr	$f1, 0($v0)
	l.sl	$f0, l.6538
	s.s	$f1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fless
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8986
	li	$v0, 0
	jr	$ra
beq_else.8986:
	l.sl	$f1, l.6562
	l.sr	$f0, 4($sp)
	j	min_caml_fless
solve_each_element_fast.4880:
	lwr	$a1, 36($t8)
	lwr	$a2, 32($t8)
	lwr	$a3, 28($t8)
	lwr	$t0, 24($t8)
	lwr	$t1, 20($t8)
	lwr	$t2, 16($t8)
	lwr	$t3, 12($t8)
	lwr	$t4, 8($t8)
	lwr	$t5, 4($t8)
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
	jal	d_vec.3441
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$v1, 48($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 44($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	li	$a2, -1
	bne	$a0, $a2, beq_else.8987
	jr	$ra
beq_else.8987:
	lwr	$t8, 40($sp)
	lwr	$a2, 36($sp)
	sw	$v0, 52($sp)
	sw	$a0, 56($sp)
	addi	$v1, $a2, 0
	addi	$v0, $a0, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8989
	lwr	$v0, 56($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 32($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.3100
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8990
	jr	$ra
beq_else.8990:
	lwr	$v0, 48($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 28($sp)
	lwr	$v1, 44($sp)
	lwr	$a0, 36($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8989:
	lwr	$v1, 24($sp)
	l.sr	$f1, 0($v1)
	l.sl	$f0, l.6199
	sw	$v0, 60($sp)
	s.s	$f1, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8992
	j	beq_cont.8993
beq_else.8992:
	lwr	$v0, 20($sp)
	l.sr	$f1, 0($v0)
	l.sr	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8994
	j	beq_cont.8995
beq_else.8994:
	l.sl	$f0, l.6526
	l.sr	$f1, 64($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 52($sp)
	l.sr	$f1, 0($v0)
	mul.s	$f1, $f1, $f0
	lwr	$v1, 16($sp)
	l.sr	$f2, 0($v1)
	add.s	$f1, $f1, $f2
	l.sr	$f2, 4($v0)
	mul.s	$f2, $f2, $f0
	l.sr	$f3, 4($v1)
	add.s	$f2, $f2, $f3
	l.sr	$f3, 8($v0)
	mul.s	$f3, $f3, $f0
	l.sr	$f4, 8($v1)
	add.s	$f3, $f3, $f4
	li	$v0, 0
	lwr	$t8, 12($sp)
	lwr	$v1, 44($sp)
	s.s	$f3, 68($sp)
	s.s	$f2, 72($sp)
	s.s	$f1, 76($sp)
	s.s	$f0, 80($sp)
	mov.s	$f0, $f1
	mov.s	$f1, $f2
	mov.s	$f2, $f3
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8996
	j	beq_cont.8997
beq_else.8996:
	l.sr	$f0, 80($sp)
	lwr	$v0, 20($sp)
	s.s	$f0, 0($v0)
	lwr	$v0, 8($sp)
	l.sr	$f0, 76($sp)
	l.sr	$f1, 72($sp)
	l.sr	$f2, 68($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	vecset.2857
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	lwr	$v0, 56($sp)
	lwr	$v1, 4($sp)
	sw	$v0, 0($v1)
	lwr	$v0, 60($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 0($v1)
beq_cont.8997:
beq_cont.8995:
beq_cont.8993:
	lwr	$v0, 48($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 28($sp)
	lwr	$v1, 44($sp)
	lwr	$a0, 36($sp)
	lwr	$s7, 0($t8)
	jr	$s7
solve_one_or_network_fast.4936:
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sll	$a3, $v0, 2
	add	$t9, $v1, $a3
	lwr	$a3, 0($t9)
	li	$t0, -1
	bne	$a3, $t0, beq_else.8998
	jr	$ra
beq_else.8998:
	sll	$a3, $a3, 2
	add	$t9, $a2, $a3
	lwr	$a2, 0($t9)
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
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 12($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 8($sp)
	lwr	$v1, 4($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
trace_or_matrix_fast.4948:
	lwr	$a1, 16($t8)
	lwr	$a2, 12($t8)
	lwr	$a3, 8($t8)
	lwr	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $v1, $t1
	lwr	$t1, 0($t9)
	lwr	$t2, 0($t1)
	li	$t3, -1
	bne	$t2, $t3, beq_else.9000
	jr	$ra
beq_else.9000:
	li	$t3, 99
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	bne	$t2, $t3, beq_else.9002
	li	$a1, 1
	addi	$v1, $t1, 0
	addi	$v0, $a1, 0
	addi	$t8, $t0, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	j	beq_cont.9003
beq_else.9002:
	sw	$t1, 16($sp)
	sw	$t0, 20($sp)
	sw	$a1, 24($sp)
	sw	$a3, 28($sp)
	addi	$v1, $a0, 0
	addi	$v0, $t2, 0
	addi	$t8, $a2, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9004
	j	beq_cont.9005
beq_else.9004:
	lwr	$v0, 28($sp)
	l.sr	$f0, 0($v0)
	lwr	$v0, 24($sp)
	l.sr	$f1, 0($v0)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fless
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9006
	j	beq_cont.9007
beq_else.9006:
	li	$v0, 1
	lwr	$t8, 20($sp)
	lwr	$v1, 16($sp)
	lwr	$a0, 0($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
beq_cont.9007:
beq_cont.9005:
beq_cont.9003:
	lwr	$v0, 12($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 8($sp)
	lwr	$v1, 4($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
judge_intersection_fast.4971:
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	l.sl	$f0, l.6558
	s.s	$f0, 0($a0)
	li	$a2, 0
	lwr	$a1, 0($a1)
	sw	$a0, 0($sp)
	addi	$a0, $v0, 0
	addi	$t8, $v1, 0
	addi	$v1, $a1, 0
	addi	$v0, $a2, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v0, 0($sp)
	l.sr	$f1, 0($v0)
	l.sl	$f0, l.6538
	s.s	$f1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fless
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9008
	li	$v0, 0
	jr	$ra
beq_else.9008:
	l.sl	$f1, l.6562
	l.sr	$f0, 4($sp)
	j	min_caml_fless
get_nvector_rect.4986:
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	lwr	$a0, 0($a0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	vecbzero.2875
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v0, 8($sp)
	addi	$v1, $v0, -1
	addi	$v0, $v0, -1
	sll	$v0, $v0, 2
	lwr	$a0, 4($sp)
	add	$t9, $a0, $v0
	l.sr	$f0, 0($t9)
	sw	$v1, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	sgn.2841
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	fneg.2539
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 12($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 0($sp)
	add	$t9, $v1, $v0
	s.s	$f0, 0($t9)
	jr	$ra
get_nvector_plane.4998:
	lwr	$v1, 4($t8)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_a.3126
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	fneg.2539
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 0($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_b.3140
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	fneg.2539
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 4($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_c.3154
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	fneg.2539
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 8($v0)
	jr	$ra
get_nvector_second.5011:
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	l.sr	$f0, 0($a0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_x.3181
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sr	$f1, 12($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	l.sr	$f1, 4($v0)
	lwr	$v1, 4($sp)
	s.s	$f0, 16($sp)
	s.s	$f1, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_y.3195
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 20($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	l.sr	$f1, 8($v0)
	lwr	$v0, 4($sp)
	s.s	$f0, 24($sp)
	s.s	$f1, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_z.3209
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.3126
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_b.3140
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_c.3154
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_isrot.3113
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9011
	l.sr	$f0, 36($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	l.sr	$f0, 40($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 44($sp)
	s.s	$f0, 8($v0)
	j	beq_cont.9012
beq_else.9011:
	lwr	$v0, 4($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_r3.3321
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r2.3307
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 48($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fhalf
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 36($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	lwr	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r3.3321
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r1.3293
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 52($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fhalf
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 40($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 4($v0)
	lwr	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r2.3307
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_r1.3293
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fhalf
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 44($sp)
	add.s	$f0, $f1, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 8($v0)
beq_cont.9012:
	lwr	$v0, 4($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.3100
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 0($sp)
	j	vecunit_sgn.2892
get_nvector.5066:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sw	$a0, 0($sp)
	sw	$v0, 4($sp)
	sw	$a2, 8($sp)
	sw	$v1, 12($sp)
	sw	$a1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.3074
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9013
	lwr	$t8, 16($sp)
	lwr	$v0, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.9013:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9014
	lwr	$t8, 8($sp)
	lwr	$v0, 4($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.9014:
	lwr	$t8, 0($sp)
	lwr	$v0, 4($sp)
	lwr	$s7, 0($t8)
	jr	$s7
utexture.5072:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$v1, 8($sp)
	sw	$a0, 12($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_texturetype.3061
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v1, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_color_red.3251
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v0, 12($sp)
	s.s	$f0, 0($v0)
	lwr	$v1, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_color_green.3265
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v0, 12($sp)
	s.s	$f0, 4($v0)
	lwr	$v1, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_color_blue.3279
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v0, 12($sp)
	s.s	$f0, 8($v0)
	li	$v1, 1
	lwr	$a0, 20($sp)
	bne	$a0, $v1, beq_else.9015
	lwr	$v1, 8($sp)
	l.sr	$f0, 0($v1)
	lwr	$a0, 16($sp)
	s.s	$f0, 24($sp)
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.3181
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6604
	mul.s	$f1, $f0, $f1
	s.s	$f0, 28($sp)
	mov.s	$f0, $f1
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_floor
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sl	$f1, l.6605
	mul.s	$f0, $f0, $f1
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6606
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fless
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v1, 8($sp)
	l.sr	$f0, 8($v1)
	lwr	$v1, 16($sp)
	sw	$v0, 32($sp)
	s.s	$f0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_z.3209
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 36($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6604
	mul.s	$f1, $f0, $f1
	s.s	$f0, 40($sp)
	mov.s	$f0, $f1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_floor
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sl	$f1, l.6605
	mul.s	$f0, $f0, $f1
	l.sr	$f1, 40($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6606
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fless
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	lwr	$a0, 32($sp)
	bne	$a0, $v1, beq_else.9016
	li	$v1, 0
	bne	$v0, $v1, beq_else.9018
	l.sl	$f0, l.6608
	j	beq_cont.9019
beq_else.9018:
	l.sl	$f0, l.6199
beq_cont.9019:
	j	beq_cont.9017
beq_else.9016:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9020
	l.sl	$f0, l.6199
	j	beq_cont.9021
beq_else.9020:
	l.sl	$f0, l.6608
beq_cont.9021:
beq_cont.9017:
	lwr	$v0, 12($sp)
	s.s	$f0, 4($v0)
	jr	$ra
beq_else.9015:
	li	$v1, 2
	bne	$a0, $v1, beq_else.9023
	lwr	$v1, 8($sp)
	l.sr	$f0, 4($v1)
	l.sl	$f1, l.6611
	mul.s	$f0, $f0, $f1
	lwr	$t8, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fsqr
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sl	$f1, l.6608
	mul.s	$f1, $f1, $f0
	lwr	$v0, 12($sp)
	s.s	$f1, 0($v0)
	l.sl	$f1, l.6608
	l.sl	$f2, l.6198
	sub.s	$f0, $f2, $f0
	mul.s	$f0, $f1, $f0
	s.s	$f0, 4($v0)
	jr	$ra
beq_else.9023:
	li	$v1, 3
	bne	$a0, $v1, beq_else.9025
	lwr	$v1, 8($sp)
	l.sr	$f0, 0($v1)
	lwr	$a0, 16($sp)
	s.s	$f0, 44($sp)
	addi	$v0, $a0, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_x.3181
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 44($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	l.sr	$f1, 8($v0)
	lwr	$v0, 16($sp)
	s.s	$f0, 48($sp)
	s.s	$f1, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_z.3209
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 52($sp)
	sub.s	$f0, $f1, $f0
	l.sr	$f1, 48($sp)
	s.s	$f0, 56($sp)
	mov.s	$f0, $f1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fsqr
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 56($sp)
	s.s	$f0, 60($sp)
	mov.s	$f0, $f1
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fsqr
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 60($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_sqrt
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sl	$f1, l.6606
	div.s	$f0, $f0, $f1
	s.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_floor
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	l.sr	$f1, 64($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6616
	mul.s	$f0, $f0, $f1
	lwr	$t8, 0($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fsqr
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	l.sl	$f1, l.6608
	mul.s	$f1, $f0, $f1
	lwr	$v0, 12($sp)
	s.s	$f1, 4($v0)
	l.sl	$f1, l.6198
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6608
	mul.s	$f0, $f0, $f1
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.9025:
	li	$v1, 4
	bne	$a0, $v1, beq_else.9027
	lwr	$v1, 8($sp)
	l.sr	$f0, 0($v1)
	lwr	$a0, 16($sp)
	s.s	$f0, 68($sp)
	addi	$v0, $a0, 0
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	o_param_x.3181
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	l.sr	$f1, 68($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_a.3126
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_sqrt
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	l.sr	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	l.sr	$f1, 8($v0)
	lwr	$v1, 16($sp)
	s.s	$f0, 76($sp)
	s.s	$f1, 80($sp)
	addi	$v0, $v1, 0
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_param_z.3209
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	l.sr	$f1, 80($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 84($sp)
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	o_param_c.3154
	addi	$sp, $sp, -92
	lwr	$ra, 88($sp)
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	min_caml_sqrt
	addi	$sp, $sp, -92
	lwr	$ra, 88($sp)
	l.sr	$f1, 84($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 76($sp)
	s.s	$f0, 88($sp)
	mov.s	$f0, $f1
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	l.sr	$f1, 88($sp)
	s.s	$f0, 92($sp)
	mov.s	$f0, $f1
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_fsqr
	addi	$sp, $sp, -100
	lwr	$ra, 96($sp)
	l.sr	$f1, 92($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 76($sp)
	s.s	$f0, 96($sp)
	mov.s	$f0, $f1
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fabs
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	l.sl	$f1, l.6621
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fless
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9028
	l.sr	$f0, 88($sp)
	l.sr	$f1, 76($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fabs
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	atan.2626
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	l.sl	$f1, l.6622
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6616
	div.s	$f0, $f0, $f1
	j	beq_cont.9029
beq_else.9028:
	l.sl	$f0, l.6623
beq_cont.9029:
	s.s	$f0, 100($sp)
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	min_caml_floor
	addi	$sp, $sp, -108
	lwr	$ra, 104($sp)
	l.sr	$f1, 100($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	l.sr	$f1, 4($v0)
	lwr	$v0, 16($sp)
	s.s	$f0, 104($sp)
	s.s	$f1, 108($sp)
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	o_param_y.3195
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	l.sr	$f1, 108($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 112($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_param_b.3140
	addi	$sp, $sp, -120
	lwr	$ra, 116($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_sqrt
	addi	$sp, $sp, -120
	lwr	$ra, 116($sp)
	l.sr	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 96($sp)
	s.s	$f0, 116($sp)
	mov.s	$f0, $f1
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_fabs
	addi	$sp, $sp, -124
	lwr	$ra, 120($sp)
	l.sl	$f1, l.6621
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_fless
	addi	$sp, $sp, -124
	lwr	$ra, 120($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9030
	l.sr	$f0, 116($sp)
	l.sr	$f1, 96($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_fabs
	addi	$sp, $sp, -124
	lwr	$ra, 120($sp)
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	atan.2626
	addi	$sp, $sp, -124
	lwr	$ra, 120($sp)
	l.sl	$f1, l.6622
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6616
	div.s	$f0, $f0, $f1
	j	beq_cont.9031
beq_else.9030:
	l.sl	$f0, l.6623
beq_cont.9031:
	s.s	$f0, 120($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_floor
	addi	$sp, $sp, -128
	lwr	$ra, 124($sp)
	l.sr	$f1, 120($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6625
	l.sl	$f2, l.6626
	l.sr	$f3, 104($sp)
	sub.s	$f2, $f2, $f3
	s.s	$f0, 124($sp)
	s.s	$f1, 128($sp)
	mov.s	$f0, $f2
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_fsqr
	addi	$sp, $sp, -136
	lwr	$ra, 132($sp)
	l.sr	$f1, 128($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6626
	l.sr	$f2, 124($sp)
	sub.s	$f1, $f1, $f2
	s.s	$f0, 132($sp)
	mov.s	$f0, $f1
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	min_caml_fsqr
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	l.sr	$f1, 132($sp)
	sub.s	$f0, $f1, $f0
	s.s	$f0, 136($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_fisneg
	addi	$sp, $sp, -144
	lwr	$ra, 140($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9032
	l.sr	$f0, 136($sp)
	mov.s	$f0, $f0
	j	beq_cont.9033
beq_else.9032:
	l.sl	$f0, l.6199
beq_cont.9033:
	l.sl	$f1, l.6608
	mul.s	$f0, $f1, $f0
	l.sl	$f1, l.6627
	div.s	$f0, $f0, $f1
	lwr	$v0, 12($sp)
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.9027:
	jr	$ra
add_light.5229:
	lwr	$v0, 8($t8)
	lwr	$v1, 4($t8)
	s.s	$f2, 0($sp)
	s.s	$f1, 4($sp)
	s.s	$f0, 8($sp)
	sw	$v0, 12($sp)
	sw	$v1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fispos
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9036
	j	beq_cont.9037
beq_else.9036:
	lwr	$v0, 16($sp)
	lwr	$v1, 12($sp)
	l.sr	$f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	vecaccum.2961
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
beq_cont.9037:
	l.sr	$f0, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fispos
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9038
	jr	$ra
beq_else.9038:
	l.sr	$f0, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fsqr
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fsqr
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 0($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 16($sp)
	l.sr	$f1, 0($v0)
	add.s	$f1, $f1, $f0
	s.s	$f1, 0($v0)
	l.sr	$f1, 4($v0)
	add.s	$f1, $f1, $f0
	s.s	$f1, 4($v0)
	l.sr	$f1, 8($v0)
	add.s	$f0, $f1, $f0
	s.s	$f0, 8($v0)
	jr	$ra
trace_reflections.5255:
	lwr	$a0, 32($t8)
	lwr	$a1, 28($t8)
	lwr	$a2, 24($t8)
	lwr	$a3, 20($t8)
	lwr	$t0, 16($t8)
	lwr	$t1, 12($t8)
	lwr	$t2, 8($t8)
	lwr	$t3, 4($t8)
	li	$t4, 0
	bgt	$t4, $v0, ble_else.9041
	sll	$t4, $v0, 2
	add	$t9, $a1, $t4
	lwr	$a1, 0($t9)
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	s.s	$f1, 8($sp)
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
	jal	r_dvec.3454
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$t8, 48($sp)
	sw	$v0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9042
	j	beq_cont.9043
beq_else.9042:
	lwr	$v0, 44($sp)
	lwr	$v0, 0($v0)
	sll	$v0, $v0, 2
	lwr	$v1, 40($sp)
	lwr	$v1, 0($v1)
	add	$v0, $v0, $v1
	lwr	$v1, 36($sp)
	sw	$v0, 56($sp)
	addi	$v0, $v1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	r_surface_id.3449
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v1, 56($sp)
	bne	$v1, $v0, beq_else.9044
	li	$v0, 0
	lwr	$v1, 32($sp)
	lwr	$v1, 0($v1)
	lwr	$t8, 28($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9046
	lwr	$v0, 52($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_vec.3441
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veciprod.2927
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 36($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	r_bright.3459
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 20($sp)
	mul.s	$f2, $f0, $f1
	l.sr	$f3, 60($sp)
	mul.s	$f2, $f2, $f3
	lwr	$v0, 52($sp)
	s.s	$f2, 64($sp)
	s.s	$f0, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	d_vec.3441
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 16($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	veciprod.2927
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	l.sr	$f1, 68($sp)
	mul.s	$f1, $f1, $f0
	lwr	$t8, 12($sp)
	l.sr	$f0, 64($sp)
	l.sr	$f2, 8($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	j	beq_cont.9047
beq_else.9046:
beq_cont.9047:
	j	beq_cont.9045
beq_else.9044:
beq_cont.9045:
beq_cont.9043:
	lwr	$v0, 4($sp)
	addi	$v0, $v0, -1
	lwr	$t8, 0($sp)
	lwr	$v1, 16($sp)
	l.sr	$f0, 20($sp)
	l.sr	$f1, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9041:
	jr	$ra
trace_ray.5289:
	lwr	$a1, 80($t8)
	lwr	$a2, 76($t8)
	lwr	$a3, 72($t8)
	lwr	$t0, 68($t8)
	lwr	$t1, 64($t8)
	lwr	$t2, 60($t8)
	lwr	$t3, 56($t8)
	lwr	$t4, 52($t8)
	lwr	$t5, 48($t8)
	lwr	$t6, 44($t8)
	lwr	$t7, 40($t8)
	lwr	$s0, 36($t8)
	lwr	$s1, 32($t8)
	lwr	$s2, 28($t8)
	lwr	$s3, 24($t8)
	lwr	$s4, 20($t8)
	lwr	$s5, 16($t8)
	lwr	$s6, 12($t8)
	lwr	$s7, 8($t8)
	sw	$t8, 0($sp)
	lwr	$t8, 4($t8)
	sw	$a3, 4($sp)
	li	$a3, 4
	bgt	$v0, $a3, ble_else.9049
	s.s	$f1, 8($sp)
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
	jal	p_surface_ids.3368
	addi	$sp, $sp, -108
	lwr	$ra, 104($sp)
	lwr	$t8, 100($sp)
	lwr	$v1, 96($sp)
	sw	$v0, 104($sp)
	addi	$v0, $v1, 0
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9050
	li	$v0, -1
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 104($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	li	$v0, 0
	bne	$v1, $v0, beq_else.9051
	jr	$ra
beq_else.9051:
	lwr	$v0, 96($sp)
	lwr	$v1, 88($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	veciprod.2927
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	fneg.2539
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	s.s	$f0, 108($sp)
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_fispos
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9053
	jr	$ra
beq_else.9053:
	l.sr	$f0, 108($sp)
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_fsqr
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	l.sr	$f1, 108($sp)
	mul.s	$f0, $f0, $f1
	l.sr	$f1, 84($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 80($sp)
	l.sr	$f1, 0($v0)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 76($sp)
	l.sr	$f1, 0($v0)
	add.s	$f1, $f1, $f0
	s.s	$f1, 0($v0)
	l.sr	$f1, 4($v0)
	add.s	$f1, $f1, $f0
	s.s	$f1, 4($v0)
	l.sr	$f1, 8($v0)
	add.s	$f0, $f1, $f0
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.9050:
	lwr	$v0, 72($sp)
	lwr	$v0, 0($v0)
	sll	$v1, $v0, 2
	lwr	$a0, 68($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	sw	$v0, 112($sp)
	sw	$v1, 116($sp)
	addi	$v0, $v1, 0
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	o_reflectiontype.3087
	addi	$sp, $sp, -124
	lwr	$ra, 120($sp)
	lwr	$v1, 116($sp)
	sw	$v0, 120($sp)
	addi	$v0, $v1, 0
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	o_diffuse.3223
	addi	$sp, $sp, -128
	lwr	$ra, 124($sp)
	l.sr	$f1, 84($sp)
	mul.s	$f0, $f0, $f1
	lwr	$t8, 64($sp)
	lwr	$v0, 116($sp)
	lwr	$v1, 96($sp)
	s.s	$f0, 124($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	lwr	$v0, 60($sp)
	lwr	$v1, 56($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	veccpy.2878
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	lwr	$t8, 52($sp)
	lwr	$v0, 116($sp)
	lwr	$v1, 56($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	lwr	$v0, 112($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 48($sp)
	lwr	$v1, 0($v1)
	add	$v0, $v0, $v1
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 104($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	lwr	$v0, 44($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	p_intersection_points.3358
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lwr	$v0, 0($t9)
	lwr	$a0, 56($sp)
	addi	$v1, $a0, 0
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	veccpy.2878
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	lwr	$v0, 44($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	p_calc_diffuse.3378
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	lwr	$v1, 116($sp)
	sw	$v0, 128($sp)
	addi	$v0, $v1, 0
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	o_diffuse.3223
	addi	$sp, $sp, -136
	lwr	$ra, 132($sp)
	l.sl	$f1, l.6626
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_fless
	addi	$sp, $sp, -136
	lwr	$ra, 132($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9056
	li	$v0, 1
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 128($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	lwr	$v0, 44($sp)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	p_energy.3388
	addi	$sp, $sp, -136
	lwr	$ra, 132($sp)
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lwr	$a0, 0($t9)
	lwr	$a1, 40($sp)
	sw	$v0, 132($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	veccpy.2878
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	lwr	$v0, 92($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 132($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	l.sl	$f0, l.6655
	l.sr	$f1, 124($sp)
	mul.s	$f0, $f0, $f1
	addi	$v0, $v1, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	vecscale.3011
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	lwr	$v0, 44($sp)
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	p_nvectors.3431
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lwr	$v0, 0($t9)
	lwr	$a0, 36($sp)
	addi	$v1, $a0, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	veccpy.2878
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	j	beq_cont.9057
beq_else.9056:
	li	$v0, 0
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 128($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
beq_cont.9057:
	l.sl	$f0, l.6658
	lwr	$v0, 96($sp)
	lwr	$v1, 36($sp)
	s.s	$f0, 136($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	veciprod.2927
	addi	$sp, $sp, -144
	lwr	$ra, 140($sp)
	l.sr	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 96($sp)
	lwr	$v1, 36($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	vecaccum.2961
	addi	$sp, $sp, -144
	lwr	$ra, 140($sp)
	lwr	$v0, 116($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	o_hilight.3237
	addi	$sp, $sp, -144
	lwr	$ra, 140($sp)
	l.sr	$f1, 84($sp)
	mul.s	$f0, $f1, $f0
	li	$v0, 0
	lwr	$v1, 32($sp)
	lwr	$v1, 0($v1)
	lwr	$t8, 28($sp)
	s.s	$f0, 140($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -148
	lwr	$ra, 144($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9058
	lwr	$v0, 36($sp)
	lwr	$v1, 88($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	veciprod.2927
	addi	$sp, $sp, -148
	lwr	$ra, 144($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	fneg.2539
	addi	$sp, $sp, -148
	lwr	$ra, 144($sp)
	l.sr	$f1, 124($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 96($sp)
	lwr	$v1, 88($sp)
	s.s	$f0, 144($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	veciprod.2927
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	fneg.2539
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	mov.s	$f1, $f0
	lwr	$t8, 24($sp)
	l.sr	$f0, 144($sp)
	l.sr	$f2, 140($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	j	beq_cont.9059
beq_else.9058:
beq_cont.9059:
	lwr	$t8, 20($sp)
	lwr	$v0, 56($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	lwr	$v0, 16($sp)
	lwr	$v0, 0($v0)
	addi	$v0, $v0, -1
	lwr	$t8, 12($sp)
	lwr	$v1, 96($sp)
	l.sr	$f0, 124($sp)
	l.sr	$f1, 140($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	l.sl	$f0, l.6661
	l.sr	$f1, 84($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fless
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9060
	jr	$ra
beq_else.9060:
	li	$v0, 4
	lwr	$v1, 92($sp)
	bgt	$v0, $v1, ble_else.9062
	j	ble_cont.9063
ble_else.9062:
	addi	$v0, $v1, 1
	li	$a0, -1
	sll	$v0, $v0, 2
	lwr	$a1, 104($sp)
	add	$t9, $a1, $v0
	sw	$a0, 0($t9)
ble_cont.9063:
	li	$v0, 2
	lwr	$v1, 120($sp)
	bne	$v1, $v0, beq_else.9064
	l.sl	$f0, l.6198
	lwr	$v0, 116($sp)
	s.s	$f0, 148($sp)
	sw	$ra, 152($sp)
	addi	$sp, $sp, 156
	jal	o_diffuse.3223
	addi	$sp, $sp, -156
	lwr	$ra, 152($sp)
	l.sr	$f1, 148($sp)
	sub.s	$f0, $f1, $f0
	l.sr	$f1, 84($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 92($sp)
	addi	$v0, $v0, 1
	lwr	$v1, 4($sp)
	l.sr	$f1, 0($v1)
	l.sr	$f2, 8($sp)
	add.s	$f1, $f2, $f1
	lwr	$t8, 0($sp)
	lwr	$v1, 96($sp)
	lwr	$a0, 44($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.9064:
	jr	$ra
ble_else.9049:
	jr	$ra
trace_diffuse_ray.5407:
	lwr	$v1, 48($t8)
	lwr	$a0, 44($t8)
	lwr	$a1, 40($t8)
	lwr	$a2, 36($t8)
	lwr	$a3, 32($t8)
	lwr	$t0, 28($t8)
	lwr	$t1, 24($t8)
	lwr	$t2, 20($t8)
	lwr	$t3, 16($t8)
	lwr	$t4, 12($t8)
	lwr	$t5, 8($t8)
	lwr	$t6, 4($t8)
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
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9067
	jr	$ra
beq_else.9067:
	lwr	$v0, 48($sp)
	lwr	$v0, 0($v0)
	sll	$v0, $v0, 2
	lwr	$v1, 44($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	lwr	$v1, 40($sp)
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	d_vec.3441
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	addi	$v1, $v0, 0
	lwr	$t8, 36($sp)
	lwr	$v0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	lwr	$t8, 32($sp)
	lwr	$v0, 52($sp)
	lwr	$v1, 28($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	li	$v0, 0
	lwr	$v1, 24($sp)
	lwr	$v1, 0($v1)
	lwr	$t8, 20($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9069
	lwr	$v0, 16($sp)
	lwr	$v1, 12($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	veciprod.2927
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	fneg.2539
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fispos
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9070
	l.sl	$f0, l.6199
	j	beq_cont.9071
beq_else.9070:
	l.sr	$f0, 56($sp)
	mov.s	$f0, $f0
beq_cont.9071:
	l.sr	$f1, 8($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 52($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_diffuse.3223
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 60($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	lwr	$v1, 0($sp)
	j	vecaccum.2961
beq_else.9069:
	jr	$ra
iter_trace_diffuse_rays.5431:
	lwr	$a2, 4($t8)
	li	$a3, 0
	bgt	$a3, $a1, ble_else.9073
	sll	$a3, $a1, 2
	add	$t9, $v0, $a3
	lwr	$a3, 0($t9)
	sw	$a0, 0($sp)
	sw	$t8, 4($sp)
	sw	$a2, 8($sp)
	sw	$v0, 12($sp)
	sw	$a1, 16($sp)
	sw	$v1, 20($sp)
	addi	$v0, $a3, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	d_vec.3441
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	veciprod.2927
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fisneg
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9074
	lwr	$v0, 16($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 12($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	l.sl	$f0, l.6669
	l.sr	$f1, 24($sp)
	div.s	$f0, $f1, $f0
	lwr	$t8, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	j	beq_cont.9075
beq_else.9074:
	lwr	$v0, 16($sp)
	addi	$v1, $v0, 1
	sll	$v1, $v1, 2
	lwr	$a0, 12($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	l.sl	$f0, l.6671
	l.sr	$f1, 24($sp)
	div.s	$f0, $f1, $f0
	lwr	$t8, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
beq_cont.9075:
	lwr	$v0, 16($sp)
	addi	$a1, $v0, -2
	lwr	$t8, 4($sp)
	lwr	$v0, 12($sp)
	lwr	$v1, 20($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9073:
	jr	$ra
trace_diffuse_rays.5453:
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$v0, 8($sp)
	sw	$a2, 12($sp)
	addi	$v0, $a0, 0
	addi	$t8, $a1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$a1, 118
	lwr	$t8, 12($sp)
	lwr	$v0, 8($sp)
	lwr	$v1, 4($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
trace_diffuse_ray_80percent.5459:
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	li	$a3, 0
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$v0, 16($sp)
	bne	$v0, $a3, beq_else.9077
	j	beq_cont.9078
beq_else.9077:
	lwr	$a3, 0($a2)
	addi	$v0, $a3, 0
	addi	$t8, $a1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
beq_cont.9078:
	li	$v0, 1
	lwr	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9079
	j	beq_cont.9080
beq_else.9079:
	lwr	$v0, 12($sp)
	lwr	$a0, 4($v0)
	lwr	$t8, 8($sp)
	lwr	$a1, 4($sp)
	lwr	$a2, 0($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	addi	$a0, $a2, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
beq_cont.9080:
	li	$v0, 2
	lwr	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9081
	j	beq_cont.9082
beq_else.9081:
	lwr	$v0, 12($sp)
	lwr	$a0, 8($v0)
	lwr	$t8, 8($sp)
	lwr	$a1, 4($sp)
	lwr	$a2, 0($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	addi	$a0, $a2, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
beq_cont.9082:
	li	$v0, 3
	lwr	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9083
	j	beq_cont.9084
beq_else.9083:
	lwr	$v0, 12($sp)
	lwr	$a0, 12($v0)
	lwr	$t8, 8($sp)
	lwr	$a1, 4($sp)
	lwr	$a2, 0($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	addi	$a0, $a2, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
beq_cont.9084:
	li	$v0, 4
	lwr	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9085
	jr	$ra
beq_else.9085:
	lwr	$v0, 12($sp)
	lwr	$v0, 16($v0)
	lwr	$t8, 8($sp)
	lwr	$v1, 4($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
calc_diffuse_using_1point.5482:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	sw	$v1, 12($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	p_received_ray_20percent.3398
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v1, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_nvectors.3431
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 16($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_intersection_points.3358
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v1, 16($sp)
	sw	$v0, 28($sp)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_energy.3388
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v1, 12($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 20($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	lwr	$a1, 8($sp)
	sw	$v0, 32($sp)
	addi	$v1, $a0, 0
	addi	$v0, $a1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veccpy.2878
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 16($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_group_id.3408
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v1, 12($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 24($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	sll	$a1, $v1, 2
	lwr	$a2, 28($sp)
	add	$t9, $a2, $a1
	lwr	$a1, 0($t9)
	lwr	$t8, 4($sp)
	addi	$v1, $a0, 0
	addi	$a0, $a1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 12($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 32($sp)
	add	$t9, $v1, $v0
	lwr	$v1, 0($t9)
	lwr	$v0, 0($sp)
	lwr	$a0, 8($sp)
	j	vecaccumv.3028
calc_diffuse_using_5points.5496:
	lwr	$a3, 8($t8)
	lwr	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $v1, $t1
	lwr	$v1, 0($t9)
	sw	$a3, 0($sp)
	sw	$t0, 4($sp)
	sw	$a2, 8($sp)
	sw	$a1, 12($sp)
	sw	$a0, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_received_ray_20percent.3398
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	addi	$a0, $v1, -1
	sll	$a0, $a0, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	sw	$v0, 24($sp)
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_received_ray_20percent.3398
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v1, 20($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	sw	$v0, 28($sp)
	addi	$v0, $a0, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_received_ray_20percent.3398
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v1, 20($sp)
	addi	$a0, $v1, 1
	sll	$a0, $a0, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	sw	$v0, 32($sp)
	addi	$v0, $a0, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_received_ray_20percent.3398
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v1, 20($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 12($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	sw	$v0, 36($sp)
	addi	$v0, $a0, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	p_received_ray_20percent.3398
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$v1, 8($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 24($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	lwr	$a1, 4($sp)
	sw	$v0, 40($sp)
	addi	$v1, $a0, 0
	addi	$v0, $a1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veccpy.2878
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 8($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 28($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	lwr	$a0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.2988
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 8($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 32($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	lwr	$a0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.2988
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 8($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 36($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	lwr	$a0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.2988
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 8($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 40($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	lwr	$a0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.2988
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 20($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 16($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_energy.3388
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v1, 8($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lwr	$v1, 0($t9)
	lwr	$v0, 0($sp)
	lwr	$a0, 4($sp)
	j	vecaccumv.3028
do_without_neighbors.5529:
	lwr	$a0, 4($t8)
	li	$a1, 4
	bgt	$v1, $a1, ble_else.9087
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	sw	$v1, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	p_surface_ids.3368
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 0
	lwr	$a0, 12($sp)
	sll	$a1, $a0, 2
	add	$t9, $v0, $a1
	lwr	$v0, 0($t9)
	bgt	$v1, $v0, ble_else.9088
	lwr	$v0, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	p_calc_diffuse.3378
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v1, 12($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lwr	$v0, 0($t9)
	li	$a0, 0
	bne	$v0, $a0, beq_else.9089
	j	beq_cont.9090
beq_else.9089:
	lwr	$t8, 4($sp)
	lwr	$v0, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
beq_cont.9090:
	lwr	$v0, 12($sp)
	addi	$v1, $v0, 1
	lwr	$t8, 0($sp)
	lwr	$v0, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9088:
	jr	$ra
ble_else.9087:
	jr	$ra
neighbors_exist.5542:
	lwr	$a0, 4($t8)
	lwr	$a1, 4($a0)
	addi	$a2, $v1, 1
	bgt	$a1, $a2, ble_else.9093
	li	$v0, 0
	jr	$ra
ble_else.9093:
	li	$a1, 0
	bgt	$v1, $a1, ble_else.9094
	li	$v0, 0
	jr	$ra
ble_else.9094:
	lwr	$v1, 0($a0)
	addi	$a0, $v0, 1
	bgt	$v1, $a0, ble_else.9095
	li	$v0, 0
	jr	$ra
ble_else.9095:
	li	$v1, 0
	bgt	$v0, $v1, ble_else.9096
	li	$v0, 0
	jr	$ra
ble_else.9096:
	li	$v0, 1
	jr	$ra
get_surface_id.5556:
	sw	$v1, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	p_surface_ids.3368
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lwr	$v0, 0($t9)
	jr	$ra
neighbors_are_available.5560:
	sll	$a3, $v0, 2
	add	$t9, $a0, $a3
	lwr	$a3, 0($t9)
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$a2, 8($sp)
	sw	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v1, $a2, 0
	addi	$v0, $a3, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	get_surface_id.5556
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v1, 16($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 12($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	lwr	$a1, 8($sp)
	sw	$v0, 20($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5556
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9097
	lwr	$v0, 16($sp)
	sll	$a0, $v0, 2
	lwr	$a1, 4($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	lwr	$a1, 8($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5556
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9098
	lwr	$v0, 16($sp)
	addi	$a0, $v0, -1
	sll	$a0, $a0, 2
	lwr	$a1, 0($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	lwr	$a2, 8($sp)
	addi	$v1, $a2, 0
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5556
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9099
	lwr	$v0, 16($sp)
	addi	$v0, $v0, 1
	sll	$v0, $v0, 2
	lwr	$a0, 0($sp)
	add	$t9, $a0, $v0
	lwr	$v0, 0($t9)
	lwr	$a0, 8($sp)
	addi	$v1, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5556
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9100
	li	$v0, 1
	jr	$ra
beq_else.9100:
	li	$v0, 0
	jr	$ra
beq_else.9099:
	li	$v0, 0
	jr	$ra
beq_else.9098:
	li	$v0, 0
	jr	$ra
beq_else.9097:
	li	$v0, 0
	jr	$ra
try_exploit_neighbors.5580:
	lwr	$t0, 8($t8)
	lwr	$t1, 4($t8)
	sll	$t2, $v0, 2
	add	$t9, $a1, $t2
	lwr	$t2, 0($t9)
	li	$t3, 4
	bgt	$a3, $t3, ble_else.9101
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
	jal	get_surface_id.5556
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v1, 40($sp)
	bgt	$v1, $v0, ble_else.9102
	lwr	$v0, 36($sp)
	lwr	$v1, 32($sp)
	lwr	$a0, 28($sp)
	lwr	$a1, 24($sp)
	lwr	$a2, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	neighbors_are_available.5560
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9103
	lwr	$v0, 36($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 28($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	lwr	$t8, 16($sp)
	lwr	$v1, 20($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.9103:
	lwr	$v0, 12($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_calc_diffuse.3378
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$a2, 20($sp)
	sll	$v1, $a2, 2
	add	$t9, $v0, $v1
	lwr	$v0, 0($t9)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9104
	j	beq_cont.9105
beq_else.9104:
	lwr	$t8, 8($sp)
	lwr	$v0, 36($sp)
	lwr	$v1, 32($sp)
	lwr	$a0, 28($sp)
	lwr	$a1, 24($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
beq_cont.9105:
	lwr	$v0, 20($sp)
	addi	$a3, $v0, 1
	lwr	$t8, 4($sp)
	lwr	$v0, 36($sp)
	lwr	$v1, 0($sp)
	lwr	$a0, 32($sp)
	lwr	$a1, 28($sp)
	lwr	$a2, 24($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9102:
	jr	$ra
ble_else.9101:
	jr	$ra
write_ppm_header.5600:
	lwr	$v0, 4($t8)
	li	$v1, 80
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 51
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 10
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v0, 0($sp)
	lwr	$v1, 0($v0)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v0, 0($sp)
	lwr	$v0, 4($v0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 255
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 10
	j	min_caml_print_char
write_rgb_element.5623:
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_int_of_float
	addi	$sp, $sp, -4
	lwr	$ra, 0($sp)
	li	$v1, 255
	bgt	$v0, $v1, ble_else.9108
	li	$v1, 0
	bgt	$v1, $v0, ble_else.9110
	j	ble_cont.9111
ble_else.9110:
	li	$v0, 0
ble_cont.9111:
	j	ble_cont.9109
ble_else.9108:
	li	$v0, 255
ble_cont.9109:
	j	min_caml_print_int
write_rgb.5629:
	lwr	$v0, 4($t8)
	l.sr	$f0, 0($v0)
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.5623
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v0, 0($sp)
	l.sr	$f0, 4($v0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.5623
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v0, 0($sp)
	l.sr	$f0, 8($v0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.5623
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 10
	j	min_caml_print_char
pretrace_diffuse_rays.5645:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	li	$a3, 4
	bgt	$v1, $a3, ble_else.9112
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$v1, 16($sp)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5556
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bgt	$v1, $v0, ble_else.9113
	lwr	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_calc_diffuse.3378
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 16($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lwr	$v0, 0($t9)
	li	$a0, 0
	bne	$v0, $a0, beq_else.9114
	j	beq_cont.9115
beq_else.9114:
	lwr	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_group_id.3408
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 12($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	vecbzero.2875
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_nvectors.3431
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v1, 20($sp)
	sw	$v0, 28($sp)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_intersection_points.3358
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v1, 24($sp)
	sll	$v1, $v1, 2
	lwr	$a0, 8($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	lwr	$a0, 16($sp)
	sll	$a1, $a0, 2
	lwr	$a2, 28($sp)
	add	$t9, $a2, $a1
	lwr	$a1, 0($t9)
	sll	$a2, $a0, 2
	add	$t9, $v0, $a2
	lwr	$v0, 0($t9)
	lwr	$t8, 4($sp)
	addi	$a0, $v0, 0
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 20($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_received_ray_20percent.3398
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v1, 16($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lwr	$v0, 0($t9)
	lwr	$a0, 12($sp)
	addi	$v1, $a0, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	veccpy.2878
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
beq_cont.9115:
	lwr	$v0, 16($sp)
	addi	$v1, $v0, 1
	lwr	$t8, 0($sp)
	lwr	$v0, 20($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9113:
	jr	$ra
ble_else.9112:
	jr	$ra
pretrace_pixels.5667:
	lwr	$a1, 36($t8)
	lwr	$a2, 32($t8)
	lwr	$a3, 28($t8)
	lwr	$t0, 24($t8)
	lwr	$t1, 20($t8)
	lwr	$t2, 16($t8)
	lwr	$t3, 12($t8)
	lwr	$t4, 8($t8)
	lwr	$t5, 4($t8)
	li	$t6, 0
	bgt	$t6, $v1, ble_else.9118
	l.sr	$f3, 0($t1)
	lwr	$t1, 0($t5)
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
	s.s	$f2, 36($sp)
	s.s	$f1, 40($sp)
	sw	$t3, 44($sp)
	s.s	$f0, 48($sp)
	sw	$t0, 52($sp)
	s.s	$f3, 56($sp)
	addi	$v0, $t1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_float_of_int
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 52($sp)
	l.sr	$f1, 0($v0)
	mul.s	$f1, $f0, $f1
	l.sr	$f2, 48($sp)
	add.s	$f1, $f1, $f2
	lwr	$v1, 44($sp)
	s.s	$f1, 0($v1)
	l.sr	$f1, 4($v0)
	mul.s	$f1, $f0, $f1
	l.sr	$f3, 40($sp)
	add.s	$f1, $f1, $f3
	s.s	$f1, 4($v1)
	l.sr	$f1, 8($v0)
	mul.s	$f0, $f0, $f1
	l.sr	$f1, 36($sp)
	add.s	$f0, $f0, $f1
	s.s	$f0, 8($v1)
	li	$v0, 0
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	vecunit_sgn.2892
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	vecbzero.2875
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 28($sp)
	lwr	$v1, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veccpy.2878
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v0, 0
	l.sl	$f0, l.6198
	lwr	$v1, 20($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	l.sl	$f1, l.6199
	lwr	$t8, 12($sp)
	lwr	$a2, 44($sp)
	addi	$v1, $a2, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 20($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 16($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	addi	$v0, $v1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	p_rgb.3348
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v1, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veccpy.2878
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 20($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 16($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	lwr	$a1, 8($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	p_set_group_id.3419
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 20($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 16($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	li	$a1, 0
	lwr	$t8, 4($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 20($sp)
	addi	$v0, $v0, -1
	li	$v1, 1
	lwr	$a0, 8($sp)
	sw	$v0, 60($sp)
	addi	$v0, $a0, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	add_mod5.2851
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	addi	$a0, $v0, 0
	lwr	$t8, 0($sp)
	lwr	$v0, 16($sp)
	lwr	$v1, 60($sp)
	l.sr	$f0, 48($sp)
	l.sr	$f1, 40($sp)
	l.sr	$f2, 36($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9118:
	jr	$ra
pretrace_line.5721:
	lwr	$a1, 24($t8)
	lwr	$a2, 20($t8)
	lwr	$a3, 16($t8)
	lwr	$t0, 12($t8)
	lwr	$t1, 8($t8)
	lwr	$t2, 4($t8)
	l.sr	$f0, 0($a3)
	lwr	$a3, 4($t2)
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
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 20($sp)
	l.sr	$f1, 0($v0)
	mul.s	$f1, $f0, $f1
	lwr	$v1, 16($sp)
	l.sr	$f2, 0($v1)
	add.s	$f1, $f1, $f2
	l.sr	$f2, 4($v0)
	mul.s	$f2, $f0, $f2
	l.sr	$f3, 4($v1)
	add.s	$f2, $f2, $f3
	l.sr	$f3, 8($v0)
	mul.s	$f0, $f0, $f3
	l.sr	$f3, 8($v1)
	add.s	$f0, $f0, $f3
	lwr	$v0, 12($sp)
	lwr	$v0, 0($v0)
	addi	$v1, $v0, -1
	lwr	$t8, 8($sp)
	lwr	$v0, 4($sp)
	lwr	$a0, 0($sp)
	mov.s	$f31, $f2
	mov.s	$f2, $f0
	mov.s	$f0, $f1
	mov.s	$f1, $f31
	lwr	$s7, 0($t8)
	jr	$s7
scan_pixel.5754:
	lwr	$a3, 24($t8)
	lwr	$t0, 20($t8)
	lwr	$t1, 16($t8)
	lwr	$t2, 12($t8)
	lwr	$t3, 8($t8)
	lwr	$t4, 4($t8)
	lwr	$t3, 0($t3)
	bgt	$t3, $v0, ble_else.9120
	jr	$ra
ble_else.9120:
	sll	$t3, $v0, 2
	add	$t9, $a1, $t3
	lwr	$t3, 0($t9)
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
	jal	p_rgb.3348
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veccpy.2878
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$t8, 36($sp)
	lwr	$v0, 32($sp)
	lwr	$v1, 28($sp)
	lwr	$a0, 24($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9122
	lwr	$v0, 32($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 20($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	li	$a1, 0
	lwr	$t8, 16($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	j	beq_cont.9123
beq_else.9122:
	li	$a3, 0
	lwr	$t8, 12($sp)
	lwr	$v0, 32($sp)
	lwr	$v1, 28($sp)
	lwr	$a0, 8($sp)
	lwr	$a1, 20($sp)
	lwr	$a2, 24($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
beq_cont.9123:
	lwr	$t8, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 32($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 0($sp)
	lwr	$v1, 28($sp)
	lwr	$a0, 8($sp)
	lwr	$a1, 20($sp)
	lwr	$a2, 24($sp)
	lwr	$s7, 0($t8)
	jr	$s7
scan_line.5775:
	lwr	$a3, 12($t8)
	lwr	$t0, 8($t8)
	lwr	$t1, 4($t8)
	lwr	$t2, 4($t1)
	bgt	$t2, $v0, ble_else.9124
	jr	$ra
ble_else.9124:
	lwr	$t1, 4($t1)
	addi	$t1, $t1, -1
	sw	$t8, 0($sp)
	sw	$a2, 4($sp)
	sw	$a1, 8($sp)
	sw	$a0, 12($sp)
	sw	$v1, 16($sp)
	sw	$v0, 20($sp)
	sw	$a3, 24($sp)
	bgt	$t1, $v0, ble_else.9126
	j	ble_cont.9127
ble_else.9126:
	addi	$t1, $v0, 1
	addi	$a0, $a2, 0
	addi	$v1, $t1, 0
	addi	$v0, $a1, 0
	addi	$t8, $t0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
ble_cont.9127:
	li	$v0, 0
	lwr	$t8, 24($sp)
	lwr	$v1, 20($sp)
	lwr	$a0, 16($sp)
	lwr	$a1, 12($sp)
	lwr	$a2, 8($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 20($sp)
	addi	$v0, $v0, 1
	li	$v1, 2
	lwr	$a0, 4($sp)
	sw	$v0, 28($sp)
	addi	$v0, $a0, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	add_mod5.2851
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	addi	$a2, $v0, 0
	lwr	$t8, 0($sp)
	lwr	$v0, 28($sp)
	lwr	$v1, 12($sp)
	lwr	$a0, 8($sp)
	lwr	$a1, 16($sp)
	lwr	$s7, 0($t8)
	jr	$s7
create_float5x3array.5796:
	li	$v0, 3
	l.sl	$f0, l.6199
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_float_array
	addi	$sp, $sp, -4
	lwr	$ra, 0($sp)
	addi	$v1, $v0, 0
	li	$v0, 5
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_array
	addi	$sp, $sp, -4
	lwr	$ra, 0($sp)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 4($v1)
	li	$v0, 3
	l.sl	$f0, l.6199
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 8($v1)
	li	$v0, 3
	l.sl	$f0, l.6199
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 12($v1)
	li	$v0, 3
	l.sl	$f0, l.6199
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 16($v1)
	addi	$v0, $v1, 0
	jr	$ra
create_pixel.5823:
	li	$v0, 3
	l.sl	$f0, l.6199
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_float_array
	addi	$sp, $sp, -4
	lwr	$ra, 0($sp)
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	create_float5x3array.5796
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v1, 5
	li	$a0, 0
	sw	$v0, 4($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_array
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v1, 5
	li	$a0, 0
	sw	$v0, 8($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_array
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	create_float5x3array.5796
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	create_float5x3array.5796
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_create_array
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	sw	$v0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	create_float5x3array.5796
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 32
	sw	$v0, 28($v1)
	lwr	$v0, 24($sp)
	sw	$v0, 24($v1)
	lwr	$v0, 20($sp)
	sw	$v0, 20($v1)
	lwr	$v0, 16($sp)
	sw	$v0, 16($v1)
	lwr	$v0, 12($sp)
	sw	$v0, 12($v1)
	lwr	$v0, 8($sp)
	sw	$v0, 8($v1)
	lwr	$v0, 4($sp)
	sw	$v0, 4($v1)
	lwr	$v0, 0($sp)
	sw	$v0, 0($v1)
	addi	$v0, $v1, 0
	jr	$ra
init_line_elements.5845:
	li	$a0, 0
	bgt	$a0, $v1, ble_else.9128
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	create_pixel.5823
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 4($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 0($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	addi	$v1, $v1, -1
	addi	$v0, $a1, 0
	j	init_line_elements.5845
ble_else.9128:
	jr	$ra
create_pixelline.5854:
	lwr	$v0, 4($t8)
	lwr	$v1, 0($v0)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	create_pixel.5823
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_array
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 0($sp)
	lwr	$v1, 0($v1)
	addi	$v1, $v1, -2
	j	init_line_elements.5845
tan.5865:
	lwr	$v0, 8($t8)
	lwr	$v1, 4($t8)
	s.s	$f0, 0($sp)
	sw	$v1, 4($sp)
	addi	$t8, $v0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$t8, 4($sp)
	l.sr	$f1, 0($sp)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sr	$f1, 8($sp)
	div.s	$f0, $f1, $f0
	jr	$ra
adjust_position.5869:
	lwr	$v0, 4($t8)
	mul.s	$f0, $f0, $f0
	l.sl	$f2, l.6661
	add.s	$f0, $f0, $f2
	sw	$v0, 0($sp)
	s.s	$f1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_sqrt
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	l.sl	$f1, l.6198
	div.s	$f1, $f1, $f0
	s.s	$f0, 8($sp)
	mov.s	$f0, $f1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	atan.2626
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sr	$f1, 4($sp)
	mul.s	$f0, $f0, $f1
	lwr	$t8, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sr	$f1, 8($sp)
	mul.s	$f0, $f0, $f1
	jr	$ra
calc_dirvec.5881:
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	li	$a3, 5
	bgt	$a3, $v0, ble_else.9129
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$v1, 8($sp)
	s.s	$f0, 12($sp)
	s.s	$f1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fsqr
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	s.s	$f0, 20($sp)
	mov.s	$f0, $f1
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fsqr
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 20($sp)
	add.s	$f0, $f1, $f0
	l.sl	$f1, l.6198
	add.s	$f0, $f0, $f1
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_sqrt
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 12($sp)
	div.s	$f1, $f1, $f0
	l.sr	$f2, 16($sp)
	div.s	$f2, $f2, $f0
	l.sl	$f3, l.6198
	div.s	$f0, $f3, $f0
	lwr	$v0, 8($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 4($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	lwr	$v1, 0($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lwr	$a0, 0($t9)
	sw	$v0, 24($sp)
	s.s	$f0, 28($sp)
	s.s	$f2, 32($sp)
	s.s	$f1, 36($sp)
	addi	$v0, $a0, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	d_vec.3441
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f0, 36($sp)
	l.sr	$f1, 32($sp)
	l.sr	$f2, 28($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	vecset.2857
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$v0, 0($sp)
	addi	$v1, $v0, 40
	sll	$v1, $v1, 2
	lwr	$a0, 24($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	d_vec.3441
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f0, 32($sp)
	sw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	fneg.2539
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	mov.s	$f2, $f0
	lwr	$v0, 40($sp)
	l.sr	$f0, 36($sp)
	l.sr	$f1, 28($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecset.2857
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 0($sp)
	addi	$v1, $v0, 80
	sll	$v1, $v1, 2
	lwr	$a0, 24($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	d_vec.3441
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f0, 36($sp)
	sw	$v0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	fneg.2539
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 32($sp)
	s.s	$f0, 48($sp)
	mov.s	$f0, $f1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	fneg.2539
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	mov.s	$f2, $f0
	lwr	$v0, 44($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	vecset.2857
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$v0, 0($sp)
	addi	$v1, $v0, 1
	sll	$v1, $v1, 2
	lwr	$a0, 24($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	addi	$v0, $v1, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	d_vec.3441
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f0, 36($sp)
	sw	$v0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	fneg.2539
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 32($sp)
	s.s	$f0, 56($sp)
	mov.s	$f0, $f1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	fneg.2539
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 28($sp)
	s.s	$f0, 60($sp)
	mov.s	$f0, $f1
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	fneg.2539
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	mov.s	$f2, $f0
	lwr	$v0, 52($sp)
	l.sr	$f0, 56($sp)
	l.sr	$f1, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	vecset.2857
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	lwr	$v0, 0($sp)
	addi	$v1, $v0, 41
	sll	$v1, $v1, 2
	lwr	$a0, 24($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	addi	$v0, $v1, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	d_vec.3441
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f0, 36($sp)
	sw	$v0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	fneg.2539
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	l.sr	$f1, 28($sp)
	s.s	$f0, 68($sp)
	mov.s	$f0, $f1
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	fneg.2539
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	mov.s	$f1, $f0
	lwr	$v0, 64($sp)
	l.sr	$f0, 68($sp)
	l.sr	$f2, 32($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	vecset.2857
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	lwr	$v0, 0($sp)
	addi	$v0, $v0, 81
	sll	$v0, $v0, 2
	lwr	$v1, 24($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	d_vec.3441
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	l.sr	$f0, 28($sp)
	sw	$v0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	fneg.2539
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	lwr	$v0, 72($sp)
	l.sr	$f1, 36($sp)
	l.sr	$f2, 32($sp)
	j	vecset.2857
ble_else.9129:
	s.s	$f2, 76($sp)
	sw	$a0, 0($sp)
	sw	$v1, 8($sp)
	sw	$t8, 80($sp)
	s.s	$f3, 84($sp)
	sw	$a2, 88($sp)
	sw	$v0, 92($sp)
	addi	$t8, $a2, 0
	mov.s	$f0, $f1
	mov.s	$f1, $f2
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -100
	lwr	$ra, 96($sp)
	lwr	$v0, 92($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 88($sp)
	l.sr	$f1, 84($sp)
	s.s	$f0, 96($sp)
	sw	$v0, 100($sp)
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -108
	lwr	$ra, 104($sp)
	mov.s	$f1, $f0
	lwr	$t8, 80($sp)
	lwr	$v0, 100($sp)
	lwr	$v1, 8($sp)
	lwr	$a0, 0($sp)
	l.sr	$f0, 96($sp)
	l.sr	$f2, 76($sp)
	l.sr	$f3, 84($sp)
	lwr	$s7, 0($t8)
	jr	$s7
calc_dirvecs.5941:
	lwr	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9130
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
	lwr	$ra, 24($sp)
	l.sl	$f1, l.6765
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6766
	sub.s	$f2, $f0, $f1
	li	$v0, 0
	l.sl	$f0, l.6199
	l.sl	$f1, l.6199
	lwr	$t8, 20($sp)
	lwr	$v1, 16($sp)
	lwr	$a0, 12($sp)
	l.sr	$f3, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v0, 4($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_float_of_int
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sl	$f1, l.6765
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6661
	add.s	$f2, $f0, $f1
	li	$v0, 0
	l.sl	$f0, l.6199
	l.sl	$f1, l.6199
	lwr	$v1, 12($sp)
	addi	$a0, $v1, 2
	lwr	$t8, 20($sp)
	lwr	$a1, 16($sp)
	l.sr	$f3, 8($sp)
	addi	$v1, $a1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v0, 4($sp)
	addi	$v0, $v0, -1
	li	$v1, 1
	lwr	$a0, 16($sp)
	sw	$v0, 24($sp)
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	add_mod5.2851
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	addi	$v1, $v0, 0
	lwr	$t8, 0($sp)
	lwr	$v0, 24($sp)
	lwr	$a0, 12($sp)
	l.sr	$f0, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9130:
	jr	$ra
calc_dirvec_rows.5971:
	lwr	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9132
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	sw	$v1, 12($sp)
	sw	$a1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_float_of_int
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sl	$f1, l.6765
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6766
	sub.s	$f0, $f0, $f1
	li	$v0, 4
	lwr	$t8, 16($sp)
	lwr	$v1, 12($sp)
	lwr	$a0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 4($sp)
	addi	$v0, $v0, -1
	li	$v1, 2
	lwr	$a0, 12($sp)
	sw	$v0, 20($sp)
	addi	$v0, $a0, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	add_mod5.2851
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 8($sp)
	addi	$a0, $v0, 4
	lwr	$t8, 0($sp)
	lwr	$v0, 20($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9132:
	jr	$ra
create_dirvec.5989:
	lwr	$v0, 4($t8)
	li	$v1, 3
	l.sl	$f0, l.6199
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 0($sp)
	lwr	$v0, 0($v0)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_array
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($v1)
	lwr	$v0, 4($sp)
	sw	$v0, 0($v1)
	addi	$v0, $v1, 0
	jr	$ra
create_dirvec_elements.5997:
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.9134
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	sw	$v1, 8($sp)
	addi	$t8, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v1, 8($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 4($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	addi	$v1, $v1, -1
	lwr	$t8, 0($sp)
	addi	$v0, $a1, 0
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9134:
	jr	$ra
create_dirvecs.6006:
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9136
	li	$a2, 120
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$v1, 8($sp)
	sw	$v0, 12($sp)
	sw	$a2, 16($sp)
	addi	$t8, $a1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_create_array
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v1, 12($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 8($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	sll	$v0, $v1, 2
	add	$t9, $a1, $v0
	lwr	$v0, 0($t9)
	li	$a0, 118
	lwr	$t8, 4($sp)
	addi	$v1, $a0, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 12($sp)
	addi	$v0, $v0, -1
	lwr	$t8, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9136:
	jr	$ra
init_dirvec_constants.6019:
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.9138
	sll	$a1, $v1, 2
	add	$t9, $v0, $a1
	lwr	$a1, 0($t9)
	sw	$v0, 0($sp)
	sw	$t8, 4($sp)
	sw	$v1, 8($sp)
	addi	$v0, $a1, 0
	addi	$t8, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v0, 8($sp)
	addi	$v1, $v0, -1
	lwr	$t8, 4($sp)
	lwr	$v0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9138:
	jr	$ra
init_vecset_constants.6027:
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v0, ble_else.9140
	sll	$a1, $v0, 2
	add	$t9, $a0, $a1
	lwr	$a0, 0($t9)
	li	$a1, 119
	sw	$t8, 0($sp)
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	addi	$t8, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	addi	$v0, $v0, -1
	lwr	$t8, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.9140:
	jr	$ra
init_dirvecs.6035:
	lwr	$v0, 12($t8)
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	li	$a1, 4
	sw	$v0, 0($sp)
	sw	$a0, 4($sp)
	addi	$v0, $a1, 0
	addi	$t8, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v0, 9
	li	$v1, 0
	li	$a0, 0
	lwr	$t8, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v0, 4
	lwr	$t8, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
add_reflection.6044:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$t8, 4($t8)
	sw	$a1, 0($sp)
	sw	$v0, 4($sp)
	sw	$v1, 8($sp)
	s.s	$f0, 12($sp)
	sw	$a0, 16($sp)
	s.s	$f3, 20($sp)
	s.s	$f2, 24($sp)
	s.s	$f1, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	sw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	d_vec.3441
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 24($sp)
	l.sr	$f2, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	vecset.2857
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$t8, 16($sp)
	lwr	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	addi	$v0, $gp, 0
	addi	$gp, $gp, 12
	l.sr	$f0, 12($sp)
	s.s	$f0, 8($v0)
	lwr	$v1, 32($sp)
	sw	$v1, 4($v0)
	lwr	$v1, 8($sp)
	sw	$v1, 0($v0)
	lwr	$v1, 4($sp)
	sll	$v1, $v1, 2
	lwr	$a0, 0($sp)
	add	$t9, $a0, $v1
	sw	$v0, 0($t9)
	jr	$ra
setup_rect_reflection.6057:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sll	$v0, $v0, 2
	lwr	$a3, 0($a0)
	l.sl	$f0, l.6198
	sw	$a0, 0($sp)
	sw	$a3, 4($sp)
	sw	$a2, 8($sp)
	sw	$v0, 12($sp)
	sw	$a1, 16($sp)
	s.s	$f0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_diffuse.3223
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 20($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	l.sr	$f1, 0($v0)
	s.s	$f0, 24($sp)
	mov.s	$f0, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	fneg.2539
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 16($sp)
	l.sr	$f1, 4($v0)
	s.s	$f0, 28($sp)
	mov.s	$f0, $f1
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	fneg.2539
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 16($sp)
	l.sr	$f1, 8($v0)
	s.s	$f0, 32($sp)
	mov.s	$f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg.2539
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	mov.s	$f3, $f0
	lwr	$v0, 12($sp)
	addi	$v1, $v0, 1
	lwr	$a0, 16($sp)
	l.sr	$f1, 0($a0)
	lwr	$t8, 8($sp)
	lwr	$a1, 4($sp)
	l.sr	$f0, 24($sp)
	l.sr	$f2, 32($sp)
	s.s	$f3, 36($sp)
	addi	$v0, $a1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$v0, 4($sp)
	addi	$v1, $v0, 1
	lwr	$a0, 12($sp)
	addi	$a1, $a0, 2
	lwr	$a2, 16($sp)
	l.sr	$f2, 4($a2)
	lwr	$t8, 8($sp)
	l.sr	$f0, 24($sp)
	l.sr	$f1, 28($sp)
	l.sr	$f3, 36($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$v0, 4($sp)
	addi	$v1, $v0, 2
	lwr	$a0, 12($sp)
	addi	$a0, $a0, 3
	lwr	$a1, 16($sp)
	l.sr	$f3, 8($a1)
	lwr	$t8, 8($sp)
	l.sr	$f0, 24($sp)
	l.sr	$f1, 28($sp)
	l.sr	$f2, 32($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$v0, 4($sp)
	addi	$v0, $v0, 3
	lwr	$v1, 0($sp)
	sw	$v0, 0($v1)
	jr	$ra
setup_surface_reflection.6098:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sll	$v0, $v0, 2
	addi	$v0, $v0, 1
	lwr	$a3, 0($a0)
	l.sl	$f0, l.6198
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
	jal	o_diffuse.3223
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 20($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_abc.3168
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 16($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	veciprod.2927
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sl	$f1, l.6207
	lwr	$v0, 20($sp)
	s.s	$f0, 32($sp)
	s.s	$f1, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_a.3126
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 36($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 16($sp)
	l.sr	$f2, 0($v0)
	sub.s	$f0, $f0, $f2
	l.sl	$f2, l.6207
	lwr	$v1, 20($sp)
	s.s	$f0, 40($sp)
	s.s	$f2, 44($sp)
	addi	$v0, $v1, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_b.3140
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 44($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 16($sp)
	l.sr	$f2, 4($v0)
	sub.s	$f0, $f0, $f2
	l.sl	$f2, l.6207
	lwr	$v1, 20($sp)
	s.s	$f0, 48($sp)
	s.s	$f2, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_c.3154
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 52($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 16($sp)
	l.sr	$f1, 8($v0)
	sub.s	$f3, $f0, $f1
	lwr	$t8, 12($sp)
	lwr	$v0, 8($sp)
	lwr	$v1, 4($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 40($sp)
	l.sr	$f2, 48($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	lwr	$v0, 8($sp)
	addi	$v0, $v0, 1
	lwr	$v1, 0($sp)
	sw	$v0, 0($v1)
	jr	$ra
setup_reflections.6137:
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9145
	sll	$a2, $v0, 2
	add	$t9, $a1, $a2
	lwr	$a1, 0($t9)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	sw	$a1, 12($sp)
	addi	$v0, $a1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_reflectiontype.3087
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 2
	bne	$v0, $v1, beq_else.9146
	lwr	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_diffuse.3223
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sl	$f1, l.6198
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fless
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9147
	jr	$ra
beq_else.9147:
	lwr	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_form.3074
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9149
	lwr	$t8, 8($sp)
	lwr	$v0, 4($sp)
	lwr	$v1, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.9149:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9150
	lwr	$t8, 0($sp)
	lwr	$v0, 4($sp)
	lwr	$v1, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.9150:
	jr	$ra
beq_else.9146:
	jr	$ra
ble_else.9145:
	jr	$ra
rt.6150:
	lwr	$a0, 56($t8)
	lwr	$a1, 52($t8)
	lwr	$a2, 48($t8)
	lwr	$a3, 44($t8)
	lwr	$t0, 40($t8)
	lwr	$t1, 36($t8)
	lwr	$t2, 32($t8)
	lwr	$t3, 28($t8)
	lwr	$t4, 24($t8)
	lwr	$t5, 20($t8)
	lwr	$t6, 16($t8)
	lwr	$t7, 12($t8)
	lwr	$s0, 8($t8)
	lwr	$s1, 4($t8)
	sw	$v0, 0($t7)
	sw	$v1, 4($t7)
	srl	$t7, $v0, 1
	sw	$t7, 0($s0)
	srl	$v1, $v1, 1
	sw	$v1, 4($s0)
	l.sl	$f0, l.6799
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
	lwr	$ra, 52($sp)
	l.sr	$f1, 48($sp)
	div.s	$f0, $f1, $f0
	lwr	$v0, 44($sp)
	s.s	$f0, 0($v0)
	lwr	$t8, 40($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$t8, 40($sp)
	sw	$v0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	lwr	$t8, 40($sp)
	sw	$v0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$t8, 36($sp)
	sw	$v0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	lwr	$t8, 32($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	lwr	$t8, 28($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	lwr	$v0, 24($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	d_vec.3441
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	lwr	$v1, 20($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	veccpy.2878
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	lwr	$t8, 16($sp)
	lwr	$v0, 24($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	lwr	$v0, 12($sp)
	lwr	$v0, 0($v0)
	addi	$v0, $v0, -1
	lwr	$t8, 8($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	li	$v1, 0
	li	$a0, 0
	lwr	$t8, 4($sp)
	lwr	$v0, 56($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	li	$v0, 0
	li	$a2, 2
	lwr	$t8, 0($sp)
	lwr	$v1, 52($sp)
	lwr	$a0, 56($sp)
	lwr	$a1, 60($sp)
	lwr	$s7, 0($t8)
	jr	$s7

##################
## libmincaml.s ##
##################

min_caml_print_newline:
	li	$v0, 10
	print_c	$v0
	jr	$ra

min_caml_print_int: # $v0
	print_i	$v0
	jr	$ra

min_caml_print_char: # $v0
	print_c	$v0
	jr	$ra

min_caml_print_float:
	print_f	$f0
	jr	$ra

min_caml_read_int:
	read_i	$v0
	jr	$ra

min_caml_read_float:
	read_f	$f0
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
	sw	$v1, 0($gp)
	addi	$a0, $a0, -1
	addi	$gp, $gp, 4
	j	create_array_loop
#
min_caml_create_float_array: # array of length $v0, initialized by $f0
	move	$a0, $v0
	move	$v0, $gp
create_float_array_loop:
	li	$a2, 0
	bne	$a0, $a2, create_float_array_cont
create_float_array_exit:
	jr	$ra
create_float_array_cont:
	s.s	$f0, 0($gp)
	addi	$a0, $a0, -1
	addi	$gp, $gp, 4
	j	create_float_array_loop

min_caml_truncate:
	j	min_caml_int_of_float
min_caml_int_of_float: # f0 -> v0
	ftoi	$v0, $f0
	jr	$ra

min_caml_float_of_int: # v0 -> f0
	itof	$f0, $v0
	jr	$ra

min_caml_floor: # f0 -> f0
	floor $f0, $f0
	jr	$ra

min_caml_sqrt: # f0 -> f0
	sqrt	$f0, $f0
	jr	$ra

min_caml_fiszero: # f0 -> v0
	l.sl	$f1, const_f_zero
	c.eq.s	$f0, $f1, min_caml_fiszero_t
	l.sl	$f1, const_f_zero_neg
	c.eq.s	$f0, $f1, min_caml_fiszero_t
	li	$v0, 0 # false
	jr	$ra
min_caml_fiszero_t:
	li	$v0, 1 # true
	jr	$ra

min_caml_fispos: # f0 -> v0
	l.sl	$f1, const_f_zero
	c.lt.s	$f1, $f0, min_caml_fispos_t
	li	$v0, 0 # false
	jr	$ra
min_caml_fispos_t:
	li	$v0, 1 # true
	jr	$ra

min_caml_fisneg: # f0 -> v0
	l.sl	$f1, const_f_zero
	c.lt.s	$f0, $f1, min_caml_fispos_t
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
	c.lt.s	$f0, $f1, min_caml_fless_true
	li	$v0, 0
	jr	$ra
min_caml_fless_true:
	li	$v0, 1
	jr	$ra

min_caml_fneg: # f0 -> f0
	l.sl	$f1, const_f_zero
	sub.s	$f0, $f1, $f0
	jr	$ra

min_caml_fabs: # f0 -> f0
	l.sl	$f1, const_f_zero
	c.lt.s	$f0, $f1, min_caml_fneg
	jr	$ra

min_caml_fsqr: # f0 -> f0
	mul.s	$f0, $f0, $f0
	jr	$ra

min_caml_fhalf: # f0 -> f0
	l.sl	$f1, const_f_half
	mul.s	$f0, $f0, $f1
	jr	$ra

###############
### sin, cos ##
###############

min_caml_sin:
	sin	$f0, $f0
	jr	$ra
min_caml_cos:
	cos	$f0, $f0
	jr	$ra
min_caml_atan:
	atan	$f0, $f0
	jr	$ra




