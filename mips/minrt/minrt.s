.data
const_f_zero:
	.word	0x00000000
const_f_zero_neg:
	.word	0x80000000
const_f_one:
	.word	0x3f800000
const_f_half:
	.word	0x3f000000
const_pi:
	.word	0x40490fdb
const_half_pi:
	.word	0x3fc90fdb
l.7004:	# 128.000000
	.word	0x43000000
l.6955:	# 0.900000
	.word	0x3f666666
l.6953:	# 0.200000
	.word	0x3e4ccccd
l.6846:	# -150.000000
	.word	0xc3160000
l.6843:	# 150.000000
	.word	0x43160000
l.6832:	# 0.100000
	.word	0x3dcccccd
l.6828:	# -2.000000
	.word	0xc0000000
l.6824:	# 0.003906
	.word	0x3b800000
l.6794:	# 0.300000
	.word	0x3e99999a
l.6789:	# 0.500000
	.word	0x3f000000
l.6787:	# 0.150000
	.word	0x3e19999a
l.6780:	# 15.000000
	.word	0x41700000
l.6777:	# 30.000000
	.word	0x41f00000
l.6775:	# 0.000100
	.word	0x38d1b717
l.6766:	# 3.141593
	.word	0x40490fdb
l.6756:	# 0.250000
	.word	0x3e800000
l.6749:	# 255.000000
	.word	0x437f0000
l.6743:	# 10.000000
	.word	0x41200000
l.6741:	# 20.000000
	.word	0x41a00000
l.6739:	# 0.050000
	.word	0x3d4ccccd
l.6691:	# 100000000.000000
	.word	0x4cbebc20
l.6685:	# 1000000000.000000
	.word	0x4e6e6b28
l.6662:	# -0.100000
	.word	0xbdcccccd
l.6649:	# 0.010000
	.word	0x3c23d70a
l.6646:	# -0.200000
	.word	0xbe4ccccd
l.6391:	# -200.000000
	.word	0xc3480000
l.6388:	# 200.000000
	.word	0x43480000
l.6383:	# 0.017453
	.word	0x3c8efa35
l.6293:	# -1.000000
	.word	0xbf800000
l.6280:	# 2.000000
	.word	0x40000000
l.6270:	# 1.570796
	.word	0x3fc90fdb
l.6268:	# 0.000000
	.word	0x0
l.6266:	# 1.000000
	.word	0x3f800000
.text
.globl	main
main:
	addi	$sp, $sp, 24
	sw	$ra, -20($sp)
	sw	$fp, -16($sp)
	addi	$fp, $sp, 0
	la	$v0, l.6766
	l.s	$f0, 0($v0)
	addi	$v0, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, sin.2580
	sw	$v1, 0($v0)
	s.s	$f0, 4($v0)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	la	$a0, cos.2632
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
	la	$a0, l.6268
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
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_create_float_array
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_create_float_array
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_create_float_array
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 1
	la	$a0, l.6749
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
	la	$a0, l.6268
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
	la	$a0, l.6685
	l.s	$f0, 0($a0)
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_create_float_array
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	li	$v1, 3
	la	$a0, l.6268
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
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 64($sp)
	addi	$v0, $v1, 0
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_create_float_array
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 68($sp)
	addi	$v0, $v1, 0
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_create_float_array
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 72($sp)
	addi	$v0, $v1, 0
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_create_float_array
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	li	$v1, 3
	la	$a0, l.6268
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
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 88($sp)
	addi	$v0, $v1, 0
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_create_float_array
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 92($sp)
	addi	$v0, $v1, 0
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_create_float_array
	addi	$sp, $sp, -100
	lw	$ra, 96($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 96($sp)
	addi	$v0, $v1, 0
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_create_float_array
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 100($sp)
	addi	$v0, $v1, 0
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	min_caml_create_float_array
	addi	$sp, $sp, -108
	lw	$ra, 104($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 104($sp)
	addi	$v0, $v1, 0
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_create_float_array
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 108($sp)
	addi	$v0, $v1, 0
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_create_float_array
	addi	$sp, $sp, -116
	lw	$ra, 112($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 112($sp)
	addi	$v0, $v1, 0
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_float_array
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	li	$v1, 0
	la	$a0, l.6268
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
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 124($sp)
	addi	$v0, $v1, 0
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	min_caml_create_float_array
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	li	$v1, 3
	la	$a0, l.6268
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
	la	$a0, l.6268
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
	la	$a1, l.6268
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
	la	$a0, read_screen_settings.3535
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
	la	$t3, read_light.3612
	sw	$t3, 0($t2)
	sw	$a1, 16($t2)
	lw	$t3, 24($sp)
	sw	$t3, 12($t2)
	sw	$t1, 8($t2)
	lw	$t4, 28($sp)
	sw	$t4, 4($t2)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, rotate_quadratic_matrix.3638
	sw	$t6, 0($t5)
	sw	$a1, 8($t5)
	sw	$t1, 4($t5)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 12
	la	$t7, read_nth_object.3751
	sw	$t7, 0($t6)
	sw	$t5, 8($t6)
	lw	$t5, 12($sp)
	sw	$t5, 4($t6)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 12
	la	$s0, read_object.3881
	sw	$s0, 0($t7)
	sw	$t6, 8($t7)
	lw	$t6, 8($sp)
	sw	$t6, 4($t7)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, read_all_object.3889
	sw	$s1, 0($s0)
	sw	$t7, 4($s0)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, read_and_network.3920
	sw	$s1, 0($t7)
	lw	$s1, 36($sp)
	sw	$s1, 4($t7)
	addi	$s2, $gp, 0
	addi	$gp, $gp, 24
	la	$s3, read_parameter.3931
	sw	$s3, 0($s2)
	sw	$v1, 20($s2)
	sw	$t2, 16($s2)
	sw	$t7, 12($s2)
	sw	$s0, 8($s2)
	lw	$v1, 44($sp)
	sw	$v1, 4($s2)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$t7, solver_rect_surface.3944
	sw	$t7, 0($t2)
	lw	$t7, 48($sp)
	sw	$t7, 4($t2)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_rect.3982
	sw	$s3, 0($s0)
	sw	$t2, 4($s0)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_surface.4003
	sw	$s3, 0($t2)
	sw	$t7, 4($t2)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 8
	la	$s4, solver_second.4086
	sw	$s4, 0($s3)
	sw	$t7, 4($s3)
	addi	$s4, $gp, 0
	addi	$gp, $gp, 20
	la	$s5, solver.4126
	sw	$s5, 0($s4)
	sw	$t2, 16($s4)
	sw	$s3, 12($s4)
	sw	$s0, 8($s4)
	sw	$t5, 4($s4)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$s0, solver_rect_fast.4146
	sw	$s0, 0($t2)
	sw	$t7, 4($t2)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_surface_fast.4243
	sw	$s3, 0($s0)
	sw	$t7, 4($s0)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 8
	la	$s5, solver_second_fast.4266
	sw	$s5, 0($s3)
	sw	$t7, 4($s3)
	addi	$s5, $gp, 0
	addi	$gp, $gp, 20
	la	$s6, solver_fast.4312
	sw	$s6, 0($s5)
	sw	$s0, 16($s5)
	sw	$s3, 12($s5)
	sw	$t2, 8($s5)
	sw	$t5, 4($s5)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_surface_fast2.4335
	sw	$s3, 0($s0)
	sw	$t7, 4($s0)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 8
	la	$s6, solver_second_fast2.4353
	sw	$s6, 0($s3)
	sw	$t7, 4($s3)
	addi	$s6, $gp, 0
	addi	$gp, $gp, 20
	la	$s7, solver_fast2.4397
	sw	$s7, 0($s6)
	sw	$s0, 16($s6)
	sw	$s3, 12($s6)
	sw	$t2, 8($s6)
	sw	$t5, 4($s6)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$s0, iter_setup_dirvec_constants.4608
	sw	$s0, 0($t2)
	sw	$t5, 4($t2)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 12
	la	$s3, setup_dirvec_constants.4624
	sw	$s3, 0($s0)
	sw	$t6, 8($s0)
	sw	$t2, 4($s0)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, setup_startp_constants.4630
	sw	$s3, 0($t2)
	sw	$t5, 4($t2)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 16
	la	$s7, setup_startp.4680
	sw	$s7, 0($s3)
	lw	$s7, 100($sp)
	sw	$s7, 12($s3)
	sw	$t2, 8($s3)
	sw	$t6, 4($s3)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$t8, check_all_inside.4745
	sw	$t8, 0($t2)
	sw	$t5, 4($t2)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 32
	sw	$s2, 148($sp)
	la	$s2, shadow_check_and_group.4759
	sw	$s2, 0($t8)
	sw	$s5, 28($t8)
	sw	$t7, 24($t8)
	sw	$t5, 20($t8)
	lw	$s2, 136($sp)
	sw	$s2, 16($t8)
	sw	$t3, 12($t8)
	sw	$s0, 152($sp)
	lw	$s0, 60($sp)
	sw	$s0, 8($t8)
	sw	$t2, 4($t8)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 12
	la	$a3, shadow_check_one_or_group.4803
	sw	$a3, 0($t6)
	sw	$t8, 8($t6)
	sw	$s1, 4($t6)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 24
	la	$t8, shadow_check_one_or_matrix.4815
	sw	$t8, 0($a3)
	sw	$s5, 20($a3)
	sw	$t7, 16($a3)
	sw	$t6, 12($a3)
	sw	$s2, 8($a3)
	sw	$s0, 4($a3)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 40
	la	$s5, solve_each_element.4843
	sw	$s5, 0($t6)
	lw	$s5, 56($sp)
	sw	$s5, 36($t6)
	lw	$t8, 96($sp)
	sw	$t8, 32($t6)
	sw	$t7, 28($t6)
	sw	$s4, 24($t6)
	sw	$t5, 20($t6)
	lw	$s2, 52($sp)
	sw	$s2, 16($t6)
	sw	$s0, 12($t6)
	lw	$a2, 64($sp)
	sw	$a2, 8($t6)
	sw	$t2, 4($t6)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$a0, solve_one_or_network.4898
	sw	$a0, 0($t0)
	sw	$t6, 8($t0)
	sw	$s1, 4($t0)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 24
	la	$t6, trace_or_matrix.4910
	sw	$t6, 0($a0)
	sw	$s5, 20($a0)
	sw	$t8, 16($a0)
	sw	$t7, 12($a0)
	sw	$s4, 8($a0)
	sw	$t0, 4($a0)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 16
	la	$t6, judge_intersection.4933
	sw	$t6, 0($t0)
	sw	$a0, 12($t0)
	sw	$s5, 8($t0)
	sw	$v1, 4($t0)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 40
	la	$t6, solve_each_element_fast.4948
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
	la	$t6, solve_one_or_network_fast.5004
	sw	$t6, 0($t2)
	sw	$a0, 8($t2)
	sw	$s1, 4($t2)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 20
	la	$t6, trace_or_matrix_fast.5016
	sw	$t6, 0($a0)
	sw	$s5, 16($a0)
	sw	$s6, 12($a0)
	sw	$t7, 8($a0)
	sw	$t2, 4($a0)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 16
	la	$t6, judge_intersection_fast.5039
	sw	$t6, 0($t2)
	sw	$a0, 12($t2)
	sw	$s5, 8($t2)
	sw	$v1, 4($t2)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, get_nvector_rect.5054
	sw	$t6, 0($a0)
	lw	$t6, 68($sp)
	sw	$t6, 8($a0)
	sw	$s2, 4($a0)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, get_nvector_plane.5066
	sw	$s1, 0($t7)
	sw	$t6, 4($t7)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 12
	la	$s4, get_nvector_second.5079
	sw	$s4, 0($s1)
	sw	$t6, 8($s1)
	sw	$s0, 4($s1)
	addi	$s4, $gp, 0
	addi	$gp, $gp, 16
	la	$s6, get_nvector.5134
	sw	$s6, 0($s4)
	sw	$s1, 12($s4)
	sw	$a0, 8($s4)
	sw	$t7, 4($s4)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 16
	la	$t7, utexture.5140
	sw	$t7, 0($a0)
	lw	$t7, 72($sp)
	sw	$t7, 12($a0)
	sw	$a1, 8($a0)
	sw	$t1, 4($a0)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 12
	la	$s6, add_light.5297
	sw	$s6, 0($s1)
	sw	$t7, 8($s1)
	lw	$s6, 80($sp)
	sw	$s6, 4($s1)
	addi	$s7, $gp, 0
	addi	$gp, $gp, 36
	la	$t1, trace_reflections.5323
	sw	$t1, 0($s7)
	sw	$a3, 32($s7)
	lw	$t1, 144($sp)
	sw	$t1, 28($s7)
	sw	$v1, 24($s7)
	sw	$t6, 20($s7)
	sw	$t2, 16($s7)
	sw	$s2, 12($s7)
	sw	$a2, 8($s7)
	sw	$s1, 4($s7)
	addi	$t1, $gp, 0
	addi	$gp, $gp, 84
	la	$a1, trace_ray.5357
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
	la	$t0, trace_diffuse_ray.5475
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
	lw	$v1, 76($sp)
	sw	$v1, 4($a1)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 8
	la	$a2, iter_trace_diffuse_rays.5499
	sw	$a2, 0($a0)
	sw	$a1, 4($a0)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 12
	la	$a2, trace_diffuse_rays.5521
	sw	$a2, 0($a1)
	sw	$s3, 8($a1)
	sw	$a0, 4($a1)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$a2, trace_diffuse_ray_80percent.5527
	sw	$a2, 0($a0)
	sw	$a1, 8($a0)
	lw	$a2, 124($sp)
	sw	$a2, 4($a0)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 16
	la	$t0, calc_diffuse_using_1point.5550
	sw	$t0, 0($a3)
	sw	$a0, 12($a3)
	sw	$s6, 8($a3)
	sw	$v1, 4($a3)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$t0, calc_diffuse_using_5points.5564
	sw	$t0, 0($a0)
	sw	$s6, 8($a0)
	sw	$v1, 4($a0)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t2, do_without_neighbors.5597
	sw	$t2, 0($t0)
	sw	$a3, 4($t0)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 8
	la	$t2, neighbors_exist.5610
	sw	$t2, 0($a3)
	lw	$t2, 84($sp)
	sw	$t2, 4($a3)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, try_exploit_neighbors.5648
	sw	$t6, 0($t4)
	sw	$t0, 8($t4)
	sw	$a0, 4($t4)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, write_ppm_header.5668
	sw	$t6, 0($a0)
	sw	$t2, 4($a0)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 8
	la	$t7, write_rgb.5697
	sw	$t7, 0($t6)
	sw	$s6, 4($t6)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, pretrace_diffuse_rays.5713
	sw	$s0, 0($t7)
	sw	$a1, 12($t7)
	sw	$a2, 8($t7)
	sw	$v1, 4($t7)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 40
	la	$a1, pretrace_pixels.5735
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
	la	$s0, pretrace_line.5789
	sw	$s0, 0($t7)
	lw	$s0, 112($sp)
	sw	$s0, 24($t7)
	lw	$s0, 108($sp)
	sw	$s0, 20($t7)
	sw	$a1, 16($t7)
	sw	$v1, 12($t7)
	sw	$t2, 8($t7)
	sw	$t1, 4($t7)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 28
	la	$s0, scan_pixel.5822
	sw	$s0, 0($v1)
	sw	$t6, 24($v1)
	sw	$t4, 20($v1)
	sw	$s6, 16($v1)
	sw	$a3, 12($v1)
	sw	$t2, 8($v1)
	sw	$t0, 4($v1)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 16
	la	$t0, scan_line.5843
	sw	$t0, 0($a3)
	sw	$v1, 12($a3)
	sw	$t7, 8($a3)
	sw	$t2, 4($a3)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	la	$t0, create_pixelline.5922
	sw	$t0, 0($v1)
	sw	$t2, 4($v1)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$t4, tan.5933
	sw	$t4, 0($t0)
	lw	$t4, 4($sp)
	sw	$t4, 8($t0)
	lw	$t4, 0($sp)
	sw	$t4, 4($t0)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, adjust_position.5937
	sw	$t6, 0($t4)
	sw	$t0, 4($t4)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, calc_dirvec.5949
	sw	$t6, 0($t0)
	sw	$a2, 8($t0)
	sw	$t4, 4($t0)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, calc_dirvecs.6009
	sw	$t6, 0($t4)
	sw	$t0, 4($t4)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, calc_dirvec_rows.6039
	sw	$t6, 0($t0)
	sw	$t4, 4($t0)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, create_dirvec.6057
	sw	$t6, 0($t4)
	lw	$t6, 8($sp)
	sw	$t6, 4($t4)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, create_dirvec_elements.6065
	sw	$s1, 0($s0)
	sw	$t4, 4($s0)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 16
	la	$s2, create_dirvecs.6074
	sw	$s2, 0($s1)
	sw	$a2, 12($s1)
	sw	$s0, 8($s1)
	sw	$t4, 4($s1)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s2, init_dirvec_constants.6087
	sw	$s2, 0($s0)
	lw	$s2, 152($sp)
	sw	$s2, 4($s0)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 12
	la	$s4, init_vecset_constants.6095
	sw	$s4, 0($s3)
	sw	$s0, 8($s3)
	sw	$a2, 4($s3)
	addi	$a2, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, init_dirvecs.6103
	sw	$s0, 0($a2)
	sw	$s3, 12($a2)
	sw	$s1, 8($a2)
	sw	$t0, 4($a2)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, add_reflection.6112
	sw	$s0, 0($t0)
	sw	$s2, 12($t0)
	lw	$s0, 144($sp)
	sw	$s0, 8($t0)
	sw	$t4, 4($t0)
	addi	$t4, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, setup_rect_reflection.6125
	sw	$s0, 0($t4)
	sw	$v0, 12($t4)
	sw	$t3, 8($t4)
	sw	$t0, 4($t4)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 16
	la	$s1, setup_surface_reflection.6166
	sw	$s1, 0($s0)
	sw	$v0, 12($s0)
	sw	$t3, 8($s0)
	sw	$t0, 4($s0)
	addi	$v0, $gp, 0
	addi	$gp, $gp, 16
	la	$t0, setup_reflections.6205
	sw	$t0, 0($v0)
	sw	$s0, 12($v0)
	sw	$t4, 8($v0)
	sw	$t5, 4($v0)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 60
	la	$t0, rt.6218
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
	sw	$t2, 12($t8)
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
fact.2561:
	li	$v1, 2
	bgt	$v1, $v0, ble_else.9047
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	fact.2561
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	mult	$v1, $v0
	mflo	 $v0
	jr	$ra
ble_else.9047:
	li	$v0, 1
	jr	$ra
pow.2567:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9048
	la	$v0, l.6266
	l.s	$f0, 0($v0)
	jr	$ra
beq_else.9048:
	addi	$v0, $v0, -1
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	pow.2567
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	l.s	$f2, 0($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
even.2574:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9049
	li	$v0, 1
	jr	$ra
beq_else.9049:
	li	$v1, 1
	bne	$v0, $v1, beq_else.9050
	li	$v0, 0
	jr	$ra
beq_else.9050:
	addi	$v0, $v0, -2
	j	even.2574
g.2589:
	l.s	$f0, 4($t8)
	sll	$v1, $v0, 1
	addi	$v1, $v1, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	pow.2567
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	fact.2561
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
	jal	even.2574
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9051
	l.s	$f0, 12($sp)
	j	min_caml_fneg
beq_else.9051:
	l.s	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
sin.2580:
	l.s	$f2, 4($t8)
	la	$v0, l.6268
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
	bne	$v0, $v1, beq_else.9052
	la	$v0, l.6270
	l.s	$f0, 0($v0)
	l.s	$f2, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9053
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, g.2589
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
beq_else.9053:
	l.s	$f0, 4($sp)
	l.s	$f2, 8($sp)
	sub.s	$f0, $f0, $f2
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9052:
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
g.2641:
	l.s	$f0, 4($t8)
	sll	$v1, $v0, 1
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	pow.2567
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	fact.2561
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
	jal	even.2574
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9054
	l.s	$f0, 12($sp)
	j	min_caml_fneg
beq_else.9054:
	l.s	$f0, 12($sp)
	mov.s	$f0, $f0
	jr	$ra
cos.2632:
	l.s	$f2, 4($t8)
	la	$v0, l.6268
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
	bne	$v0, $v1, beq_else.9055
	la	$v0, l.6270
	l.s	$f0, 0($v0)
	l.s	$f2, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fless
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9056
	addi	$t8, $gp, 0
	addi	$gp, $gp, 8
	la	$v0, g.2641
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
beq_else.9056:
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
beq_else.9055:
	l.s	$f0, 8($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
g.2689:
	la	$v1, l.6280
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
	la	$v0, l.6280
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
	la	$v0, l.6266
	l.s	$f2, 0($v0)
	add.s	$f0, $f0, $f2
	l.s	$f2, 8($sp)
	div.s	$f0, $f2, $f0
	jr	$ra
hoge.2699:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9057
	la	$v0, l.6266
	l.s	$f0, 0($v0)
	jr	$ra
beq_else.9057:
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	hoge.2699
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	g.2689
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	l.s	$f2, 4($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
f.2687:
	l.s	$f0, 4($t8)
	sw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	hoge.2699
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v0, 2
	l.s	$f2, 4($sp)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	pow.2567
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	la	$v0, l.6266
	l.s	$f2, 0($v0)
	li	$v0, 2
	l.s	$f4, 4($sp)
	s.s	$f0, 12($sp)
	s.s	$f2, 16($sp)
	mov.s	$f0, $f4
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	pow.2567
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 16($sp)
	add.s	$f0, $f2, $f0
	l.s	$f2, 12($sp)
	div.s	$f0, $f2, $f0
	lw	$v0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	pow.2567
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 8($sp)
	mul.s	$f0, $f2, $f0
	jr	$ra
atan.2682:
	la	$v0, l.6266
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
	bne	$v0, $v1, beq_else.9058
	addi	$v0, $gp, 0
	addi	$gp, $gp, 8
	la	$v1, f.2687
	sw	$v1, 0($v0)
	l.s	$f0, 0($sp)
	s.s	$f0, 4($v0)
	la	$v1, l.6266
	l.s	$f2, 0($v1)
	li	$v1, 2
	sw	$v0, 4($sp)
	s.s	$f2, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	pow.2567
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
beq_else.9058:
	la	$v0, l.6270
	l.s	$f0, 0($v0)
	la	$v0, l.6266
	l.s	$f2, 0($v0)
	l.s	$f4, 0($sp)
	div.s	$f2, $f2, $f4
	s.s	$f0, 92($sp)
	mov.s	$f0, $f2
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	atan.2682
	addi	$sp, $sp, -100
	lw	$ra, 96($sp)
	l.s	$f2, 92($sp)
	sub.s	$f0, $f2, $f0
	jr	$ra
sgn.2909:
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fiszero
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9059
	l.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fispos
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9060
	la	$v0, l.6293
	l.s	$f0, 0($v0)
	jr	$ra
beq_else.9060:
	la	$v0, l.6266
	l.s	$f0, 0($v0)
	jr	$ra
beq_else.9059:
	la	$v0, l.6268
	l.s	$f0, 0($v0)
	jr	$ra
fneg_cond.2915:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9061
	j	min_caml_fneg
beq_else.9061:
	mov.s	$f0, $f0
	jr	$ra
add_mod5.2919:
	add	$v0, $v0, $v1
	li	$v1, 5
	bgt	$v1, $v0, ble_else.9062
	addi	$v0, $v0, -5
	jr	$ra
ble_else.9062:
	jr	$ra
vecset.2925:
	s.s	$f0, 0($v0)
	s.s	$f2, 4($v0)
	s.s	$f4, 8($v0)
	jr	$ra
vecfill.2935:
	s.s	$f0, 0($v0)
	s.s	$f0, 4($v0)
	s.s	$f0, 8($v0)
	jr	$ra
vecbzero.2943:
	la	$v1, l.6268
	l.s	$f0, 0($v1)
	j	vecfill.2935
veccpy.2946:
	l.s	$f0, 0($v1)
	s.s	$f0, 0($v0)
	l.s	$f0, 4($v1)
	s.s	$f0, 4($v0)
	l.s	$f0, 8($v1)
	s.s	$f0, 8($v0)
	jr	$ra
vecunit_sgn.2960:
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
	bne	$v0, $v1, beq_else.9066
	li	$v0, 0
	lw	$v1, 0($sp)
	bne	$v1, $v0, beq_else.9068
	la	$v0, l.6266
	l.s	$f0, 0($v0)
	l.s	$f2, 16($sp)
	div.s	$f0, $f0, $f2
	b	beq_cont.9069
beq_else.9068:
	la	$v0, l.6293
	l.s	$f0, 0($v0)
	l.s	$f2, 16($sp)
	div.s	$f0, $f0, $f2
beq_cont.9069:
	b	beq_cont.9067
beq_else.9066:
	la	$v0, l.6266
	l.s	$f0, 0($v0)
beq_cont.9067:
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
veciprod.2995:
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
veciprod2.3014:
	l.s	$f6, 0($v0)
	mul.s	$f0, $f6, $f0
	l.s	$f6, 4($v0)
	mul.s	$f2, $f6, $f2
	add.s	$f0, $f0, $f2
	l.s	$f2, 8($v0)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	jr	$ra
vecaccum.3029:
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
vecadd.3056:
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
vecscale.3079:
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
vecaccumv.3096:
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
o_texturetype.3129:
	lw	$v0, 0($v0)
	jr	$ra
o_form.3142:
	lw	$v0, 4($v0)
	jr	$ra
o_reflectiontype.3155:
	lw	$v0, 8($v0)
	jr	$ra
o_isinvert.3168:
	lw	$v0, 24($v0)
	jr	$ra
o_isrot.3181:
	lw	$v0, 12($v0)
	jr	$ra
o_param_a.3194:
	lw	$v0, 16($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_param_b.3208:
	lw	$v0, 16($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_param_c.3222:
	lw	$v0, 16($v0)
	l.s	$f0, 8($v0)
	jr	$ra
o_param_abc.3236:
	lw	$v0, 16($v0)
	jr	$ra
o_param_x.3249:
	lw	$v0, 20($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_param_y.3263:
	lw	$v0, 20($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_param_z.3277:
	lw	$v0, 20($v0)
	l.s	$f0, 8($v0)
	jr	$ra
o_diffuse.3291:
	lw	$v0, 28($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_hilight.3305:
	lw	$v0, 28($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_color_red.3319:
	lw	$v0, 32($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_color_green.3333:
	lw	$v0, 32($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_color_blue.3347:
	lw	$v0, 32($v0)
	l.s	$f0, 8($v0)
	jr	$ra
o_param_r1.3361:
	lw	$v0, 36($v0)
	l.s	$f0, 0($v0)
	jr	$ra
o_param_r2.3375:
	lw	$v0, 36($v0)
	l.s	$f0, 4($v0)
	jr	$ra
o_param_r3.3389:
	lw	$v0, 36($v0)
	l.s	$f0, 8($v0)
	jr	$ra
o_param_ctbl.3403:
	lw	$v0, 40($v0)
	jr	$ra
p_rgb.3416:
	lw	$v0, 0($v0)
	jr	$ra
p_intersection_points.3426:
	lw	$v0, 4($v0)
	jr	$ra
p_surface_ids.3436:
	lw	$v0, 8($v0)
	jr	$ra
p_calc_diffuse.3446:
	lw	$v0, 12($v0)
	jr	$ra
p_energy.3456:
	lw	$v0, 16($v0)
	jr	$ra
p_received_ray_20percent.3466:
	lw	$v0, 20($v0)
	jr	$ra
p_group_id.3476:
	lw	$v0, 24($v0)
	lw	$v0, 0($v0)
	jr	$ra
p_set_group_id.3487:
	lw	$v0, 24($v0)
	sw	$v1, 0($v0)
	jr	$ra
p_nvectors.3499:
	lw	$v0, 28($v0)
	jr	$ra
d_vec.3509:
	lw	$v0, 0($v0)
	jr	$ra
d_const.3513:
	lw	$v0, 4($v0)
	jr	$ra
r_surface_id.3517:
	lw	$v0, 0($v0)
	jr	$ra
r_dvec.3522:
	lw	$v0, 4($v0)
	jr	$ra
r_bright.3527:
	l.s	$f0, 8($v0)
	mov.s	$f0, $f0
	jr	$ra
rad.3532:
	la	$v0, l.6383
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	jr	$ra
read_screen_settings.3535:
	lw	$v0, 28($t8)
	lw	$v1, 24($t8)
	lw	$a0, 20($t8)
	lw	$a1, 16($t8)
	lw	$a2, 12($t8)
	lw	$a3, 8($t8)
	lw	$t0, 4($t8)
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
	lw	$ra, 28($sp)
	lw	$v0, 24($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 24($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 24($sp)
	s.s	$f0, 8($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	rad.3532
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$t8, 20($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$t8, 16($sp)
	l.s	$f2, 28($sp)
	s.s	$f0, 32($sp)
	mov.s	$f0, $f2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_read_float
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	rad.3532
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	lw	$t8, 20($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$t8, 16($sp)
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
	la	$v0, l.6388
	l.s	$f6, 0($v0)
	mul.s	$f4, $f4, $f6
	lw	$v0, 12($sp)
	s.s	$f4, 0($v0)
	la	$v1, l.6391
	l.s	$f4, 0($v1)
	l.s	$f6, 36($sp)
	mul.s	$f4, $f6, $f4
	s.s	$f4, 4($v0)
	l.s	$f4, 44($sp)
	mul.s	$f8, $f2, $f4
	la	$v1, l.6388
	l.s	$f10, 0($v1)
	mul.s	$f8, $f8, $f10
	s.s	$f8, 8($v0)
	lw	$v1, 8($sp)
	s.s	$f4, 0($v1)
	la	$a0, l.6268
	l.s	$f8, 0($a0)
	s.s	$f8, 4($v1)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 8($v0)
	l.s	$f0, 36($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 48($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 4($sp)
	s.s	$f0, 0($v0)
	l.s	$f0, 32($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v0, 4($sp)
	s.s	$f0, 4($v0)
	l.s	$f0, 36($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 44($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 4($sp)
	s.s	$f0, 8($v0)
	lw	$v0, 24($sp)
	l.s	$f0, 0($v0)
	lw	$v1, 12($sp)
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
read_light.3612:
	lw	$v0, 16($t8)
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$v1, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_read_int
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_read_float
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	rad.3532
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
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	rad.3532
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
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	jr	$ra
rotate_quadratic_matrix.3638:
	lw	$a0, 8($t8)
	lw	$t8, 4($t8)
	l.s	$f0, 0($v1)
	sw	$v0, 0($sp)
	sw	$t8, 4($sp)
	sw	$a0, 8($sp)
	sw	$v1, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v0, 12($sp)
	l.s	$f2, 0($v0)
	lw	$t8, 8($sp)
	s.s	$f0, 16($sp)
	mov.s	$f0, $f2
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 12($sp)
	l.s	$f2, 4($v0)
	lw	$t8, 4($sp)
	s.s	$f0, 20($sp)
	mov.s	$f0, $f2
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 12($sp)
	l.s	$f2, 4($v0)
	lw	$t8, 8($sp)
	s.s	$f0, 24($sp)
	mov.s	$f0, $f2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 12($sp)
	l.s	$f2, 8($v0)
	lw	$t8, 4($sp)
	s.s	$f0, 28($sp)
	mov.s	$f0, $f2
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 12($sp)
	l.s	$f2, 8($v0)
	lw	$t8, 8($sp)
	s.s	$f0, 32($sp)
	mov.s	$f0, $f2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 24($sp)
	l.s	$f4, 32($sp)
	mul.s	$f6, $f2, $f4
	l.s	$f8, 20($sp)
	l.s	$f10, 28($sp)
	mul.s	$f12, $f8, $f10
	mul.s	$f12, $f12, $f4
	l.s	$f14, 16($sp)
	mul.s	$f16, $f14, $f0
	sub.s	$f12, $f12, $f16
	mul.s	$f16, $f14, $f10
	mul.s	$f16, $f16, $f4
	mul.s	$f18, $f8, $f0
	add.s	$f16, $f16, $f18
	mul.s	$f18, $f2, $f0
	mul.s	$f20, $f8, $f10
	mul.s	$f20, $f20, $f0
	mul.s	$f22, $f14, $f4
	add.s	$f20, $f20, $f22
	mul.s	$f22, $f14, $f10
	mul.s	$f0, $f22, $f0
	mul.s	$f4, $f8, $f4
	sub.s	$f0, $f0, $f4
	s.s	$f0, 36($sp)
	s.s	$f16, 40($sp)
	s.s	$f20, 44($sp)
	s.s	$f12, 48($sp)
	s.s	$f18, 52($sp)
	s.s	$f6, 56($sp)
	mov.s	$f0, $f10
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fneg
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 20($sp)
	l.s	$f4, 24($sp)
	mul.s	$f2, $f2, $f4
	l.s	$f6, 16($sp)
	mul.s	$f4, $f6, $f4
	lw	$v0, 0($sp)
	l.s	$f6, 0($v0)
	l.s	$f8, 4($v0)
	l.s	$f10, 8($v0)
	l.s	$f12, 56($sp)
	s.s	$f4, 60($sp)
	s.s	$f2, 64($sp)
	s.s	$f10, 68($sp)
	s.s	$f0, 72($sp)
	s.s	$f8, 76($sp)
	s.s	$f6, 80($sp)
	mov.s	$f0, $f12
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fsqr
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	l.s	$f2, 80($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 52($sp)
	s.s	$f0, 84($sp)
	mov.s	$f0, $f4
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	min_caml_fsqr
	addi	$sp, $sp, -92
	lw	$ra, 88($sp)
	l.s	$f2, 76($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 84($sp)
	add.s	$f0, $f4, $f0
	l.s	$f4, 72($sp)
	s.s	$f0, 88($sp)
	mov.s	$f0, $f4
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	l.s	$f2, 68($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 88($sp)
	add.s	$f0, $f4, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	l.s	$f0, 48($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	l.s	$f2, 80($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 44($sp)
	s.s	$f0, 92($sp)
	mov.s	$f0, $f4
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_fsqr
	addi	$sp, $sp, -100
	lw	$ra, 96($sp)
	l.s	$f2, 76($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 92($sp)
	add.s	$f0, $f4, $f0
	l.s	$f4, 64($sp)
	s.s	$f0, 96($sp)
	mov.s	$f0, $f4
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fsqr
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	l.s	$f2, 68($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 96($sp)
	add.s	$f0, $f4, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 4($v0)
	l.s	$f0, 40($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fsqr
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	l.s	$f2, 80($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 36($sp)
	s.s	$f0, 100($sp)
	mov.s	$f0, $f4
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	min_caml_fsqr
	addi	$sp, $sp, -108
	lw	$ra, 104($sp)
	l.s	$f2, 76($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 100($sp)
	add.s	$f0, $f4, $f0
	l.s	$f4, 60($sp)
	s.s	$f0, 104($sp)
	mov.s	$f0, $f4
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_fsqr
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	l.s	$f2, 68($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f4, 104($sp)
	add.s	$f0, $f4, $f0
	lw	$v0, 0($sp)
	s.s	$f0, 8($v0)
	la	$v0, l.6280
	l.s	$f0, 0($v0)
	l.s	$f4, 80($sp)
	l.s	$f6, 48($sp)
	mul.s	$f8, $f4, $f6
	l.s	$f10, 40($sp)
	mul.s	$f8, $f8, $f10
	l.s	$f12, 76($sp)
	l.s	$f14, 44($sp)
	mul.s	$f16, $f12, $f14
	l.s	$f18, 36($sp)
	mul.s	$f16, $f16, $f18
	add.s	$f8, $f8, $f16
	l.s	$f16, 64($sp)
	mul.s	$f20, $f2, $f16
	l.s	$f22, 60($sp)
	mul.s	$f20, $f20, $f22
	add.s	$f8, $f8, $f20
	mul.s	$f0, $f0, $f8
	lw	$v0, 12($sp)
	s.s	$f0, 0($v0)
	la	$v1, l.6280
	l.s	$f0, 0($v1)
	l.s	$f8, 56($sp)
	mul.s	$f20, $f4, $f8
	mul.s	$f10, $f20, $f10
	l.s	$f20, 52($sp)
	mul.s	$f24, $f12, $f20
	mul.s	$f18, $f24, $f18
	add.s	$f10, $f10, $f18
	l.s	$f18, 72($sp)
	mul.s	$f24, $f2, $f18
	mul.s	$f22, $f24, $f22
	add.s	$f10, $f10, $f22
	mul.s	$f0, $f0, $f10
	s.s	$f0, 4($v0)
	la	$v1, l.6280
	l.s	$f0, 0($v1)
	mul.s	$f4, $f4, $f8
	mul.s	$f4, $f4, $f6
	mul.s	$f6, $f12, $f20
	mul.s	$f6, $f6, $f14
	add.s	$f4, $f4, $f6
	mul.s	$f2, $f2, $f18
	mul.s	$f2, $f2, $f16
	add.s	$f2, $f4, $f2
	mul.s	$f0, $f0, $f2
	s.s	$f0, 8($v0)
	jr	$ra
read_nth_object.3751:
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	sw	$v1, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_read_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, -1
	bne	$v0, $v1, beq_else.9079
	li	$v0, 0
	jr	$ra
beq_else.9079:
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_read_int
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_read_int
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_float_array
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	sw	$v0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_read_float
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 28($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_read_float
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 28($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_read_float
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 28($sp)
	s.s	$f0, 8($v0)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_create_float_array
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	sw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 32($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 32($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 32($sp)
	s.s	$f0, 8($v0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fisneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v1, 2
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_create_float_array
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	sw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 40($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 40($sp)
	s.s	$f0, 4($v0)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_float_array
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	sw	$v0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_read_float
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	lw	$v0, 44($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_read_float
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	lw	$v0, 44($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_read_float
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	lw	$v0, 44($sp)
	s.s	$f0, 8($v0)
	li	$v1, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	addi	$v0, $v1, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_create_float_array
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 0
	lw	$a0, 24($sp)
	sw	$v0, 48($sp)
	bne	$a0, $v1, beq_else.9080
	b	beq_cont.9081
beq_else.9080:
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.3532
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v0, 48($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.3532
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v0, 48($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.3532
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v0, 48($sp)
	s.s	$f0, 8($v0)
beq_cont.9081:
	li	$v0, 2
	lw	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9082
	li	$v0, 1
	b	beq_cont.9083
beq_else.9082:
	lw	$v0, 36($sp)
beq_cont.9083:
	li	$v1, 4
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_create_float_array
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 44
	sw	$v0, 40($v1)
	lw	$v0, 48($sp)
	sw	$v0, 36($v1)
	lw	$a0, 44($sp)
	sw	$a0, 32($v1)
	lw	$a0, 40($sp)
	sw	$a0, 28($v1)
	lw	$a0, 52($sp)
	sw	$a0, 24($v1)
	lw	$a0, 32($sp)
	sw	$a0, 20($v1)
	lw	$a0, 28($sp)
	sw	$a0, 16($v1)
	lw	$a1, 24($sp)
	sw	$a1, 12($v1)
	lw	$a2, 20($sp)
	sw	$a2, 8($v1)
	lw	$a2, 16($sp)
	sw	$a2, 4($v1)
	lw	$a3, 12($sp)
	sw	$a3, 0($v1)
	lw	$a3, 8($sp)
	sll	$a3, $a3, 2
	lw	$t0, 4($sp)
	add	$t9, $t0, $a3
	sw	$v1, ($t9)
	li	$v1, 3
	bne	$a2, $v1, beq_else.9084
	l.s	$f0, 0($a0)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fiszero
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9086
	l.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	sgn.2909
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
	div.s	$f0, $f2, $f0
	b	beq_cont.9087
beq_else.9086:
	la	$v0, l.6268
	l.s	$f0, 0($v0)
beq_cont.9087:
	lw	$v0, 28($sp)
	s.s	$f0, 0($v0)
	l.s	$f0, 4($v0)
	s.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fiszero
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9088
	l.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	sgn.2909
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	l.s	$f2, 64($sp)
	s.s	$f0, 68($sp)
	mov.s	$f0, $f2
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_fsqr
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f2, 68($sp)
	div.s	$f0, $f2, $f0
	b	beq_cont.9089
beq_else.9088:
	la	$v0, l.6268
	l.s	$f0, 0($v0)
beq_cont.9089:
	lw	$v0, 28($sp)
	s.s	$f0, 4($v0)
	l.s	$f0, 8($v0)
	s.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fiszero
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9090
	l.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	sgn.2909
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	l.s	$f2, 72($sp)
	s.s	$f0, 76($sp)
	mov.s	$f0, $f2
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	min_caml_fsqr
	addi	$sp, $sp, -84
	lw	$ra, 80($sp)
	l.s	$f2, 76($sp)
	div.s	$f0, $f2, $f0
	b	beq_cont.9091
beq_else.9090:
	la	$v0, l.6268
	l.s	$f0, 0($v0)
beq_cont.9091:
	lw	$v0, 28($sp)
	s.s	$f0, 8($v0)
	b	beq_cont.9085
beq_else.9084:
	li	$v1, 2
	bne	$a2, $v1, beq_else.9092
	li	$v1, 0
	lw	$a2, 36($sp)
	bne	$a2, $v1, beq_else.9094
	li	$v1, 1
	b	beq_cont.9095
beq_else.9094:
	li	$v1, 0
beq_cont.9095:
	lw	$v0, 28($sp)
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	vecunit_sgn.2960
	addi	$sp, $sp, -84
	lw	$ra, 80($sp)
	b	beq_cont.9093
beq_else.9092:
beq_cont.9093:
beq_cont.9085:
	li	$v0, 0
	lw	$v1, 24($sp)
	bne	$v1, $v0, beq_else.9096
	b	beq_cont.9097
beq_else.9096:
	lw	$t8, 0($sp)
	lw	$v0, 28($sp)
	lw	$v1, 48($sp)
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -84
	lw	$ra, 80($sp)
beq_cont.9097:
	li	$v0, 1
	jr	$ra
read_object.3881:
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	li	$a1, 60
	bgt	$a1, $v0, ble_else.9098
	jr	$ra
ble_else.9098:
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	addi	$t8, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9100
	lw	$v0, 8($sp)
	lw	$v1, 4($sp)
	sw	$v0, 0($v1)
	jr	$ra
beq_else.9100:
	lw	$v0, 8($sp)
	addi	$v0, $v0, 1
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
read_all_object.3889:
	lw	$t8, 4($t8)
	li	$v0, 0
	lw	$s7, ($t8)
	jr	$s7
read_net_item.3892:
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_read_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v1, -1
	bne	$v0, $v1, beq_else.9102
	lw	$v0, 0($sp)
	addi	$v0, $v0, 1
	li	$v1, -1
	j	min_caml_create_array
beq_else.9102:
	lw	$v1, 0($sp)
	addi	$a0, $v1, 1
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	read_net_item.3892
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 0($sp)
	sll	$v1, $v1, 2
	lw	$a0, 4($sp)
	add	$t9, $v0, $v1
	sw	$a0, ($t9)
	jr	$ra
read_or_network.3906:
	li	$v1, 0
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	read_net_item.3892
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$v1, $v0, 0
	lw	$v0, 0($v1)
	li	$a0, -1
	bne	$v0, $a0, beq_else.9103
	lw	$v0, 0($sp)
	addi	$v0, $v0, 1
	j	min_caml_create_array
beq_else.9103:
	lw	$v0, 0($sp)
	addi	$a0, $v0, 1
	sw	$v1, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	read_or_network.3906
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 0($sp)
	sll	$v1, $v1, 2
	lw	$a0, 4($sp)
	add	$t9, $v0, $v1
	sw	$a0, ($t9)
	jr	$ra
read_and_network.3920:
	lw	$v1, 4($t8)
	li	$a0, 0
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$v0, 8($sp)
	addi	$v0, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_net_item.3892
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v1, 0($v0)
	li	$a0, -1
	bne	$v1, $a0, beq_else.9104
	jr	$ra
beq_else.9104:
	lw	$v1, 8($sp)
	sll	$a0, $v1, 2
	lw	$a1, 4($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	addi	$v0, $v1, 1
	lw	$t8, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
read_parameter.3931:
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
	jal	read_or_network.3906
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v1, 0($sp)
	sw	$v0, 0($v1)
	jr	$ra
solver_rect_surface.3944:
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
	bne	$v0, $v1, beq_else.9107
	lw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.3236
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v1, 32($sp)
	sw	$v0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isinvert.3168
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
	jal	fneg_cond.2915
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
	bne	$v0, $v1, beq_else.9108
	li	$v0, 0
	jr	$ra
beq_else.9108:
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
	bne	$v0, $v1, beq_else.9109
	li	$v0, 0
	jr	$ra
beq_else.9109:
	l.s	$f0, 44($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
beq_else.9107:
	li	$v0, 0
	jr	$ra
solver_rect.3982:
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
	bne	$v0, $v1, beq_else.9110
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
	bne	$v0, $v1, beq_else.9111
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
	bne	$v0, $v1, beq_else.9112
	li	$v0, 0
	jr	$ra
beq_else.9112:
	li	$v0, 3
	jr	$ra
beq_else.9111:
	li	$v0, 2
	jr	$ra
beq_else.9110:
	li	$v0, 1
	jr	$ra
solver_surface.4003:
	lw	$a0, 4($t8)
	sw	$a0, 0($sp)
	s.s	$f4, 4($sp)
	s.s	$f2, 8($sp)
	s.s	$f0, 12($sp)
	sw	$v1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_abc.3236
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$v1, $v0, 0
	lw	$v0, 16($sp)
	sw	$v1, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	veciprod.2995
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fispos
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9113
	li	$v0, 0
	jr	$ra
beq_else.9113:
	lw	$v0, 20($sp)
	l.s	$f0, 12($sp)
	l.s	$f2, 8($sp)
	l.s	$f4, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	veciprod2.3014
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
quadratic.4018:
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
	jal	o_param_a.3194
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
	jal	o_param_b.3208
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
	jal	o_param_c.3222
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
	jal	o_isrot.3181
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9114
	l.s	$f0, 36($sp)
	mov.s	$f0, $f0
	jr	$ra
beq_else.9114:
	l.s	$f0, 8($sp)
	l.s	$f2, 4($sp)
	mul.s	$f4, $f0, $f2
	lw	$v0, 12($sp)
	s.s	$f4, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_r1.3361
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
	jal	o_param_r2.3375
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
	jal	o_param_r3.3389
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	l.s	$f2, 56($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 52($sp)
	add.s	$f0, $f2, $f0
	jr	$ra
bilinear.4047:
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
	jal	o_param_a.3194
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
	jal	o_param_b.3208
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
	jal	o_param_c.3222
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
	jal	o_isrot.3181
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9115
	l.s	$f0, 48($sp)
	mov.s	$f0, $f0
	jr	$ra
beq_else.9115:
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
	jal	o_param_r1.3361
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
	jal	o_param_r2.3375
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
	jal	o_param_r3.3389
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
solver_second.4086:
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
	jal	quadratic.4018
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9116
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
	jal	bilinear.4047
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
	jal	quadratic.4018
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 16($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_form.3142
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.9117
	la	$v0, l.6266
	l.s	$f0, 0($v0)
	l.s	$f2, 32($sp)
	sub.s	$f0, $f2, $f0
	b	beq_cont.9118
beq_else.9117:
	l.s	$f0, 32($sp)
	mov.s	$f0, $f0
beq_cont.9118:
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
	bne	$v0, $v1, beq_else.9119
	li	$v0, 0
	jr	$ra
beq_else.9119:
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
	jal	o_isinvert.3168
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9120
	l.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fneg
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	b	beq_cont.9121
beq_else.9120:
	l.s	$f0, 44($sp)
	mov.s	$f0, $f0
beq_cont.9121:
	l.s	$f2, 28($sp)
	sub.s	$f0, $f0, $f2
	l.s	$f2, 24($sp)
	div.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
beq_else.9116:
	li	$v0, 0
	jr	$ra
solver.4126:
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
	jal	o_param_x.3249
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
	jal	o_param_y.3263
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
	jal	o_param_z.3277
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 40($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_form.3142
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9122
	lw	$t8, 12($sp)
	lw	$v0, 16($sp)
	lw	$v1, 8($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 36($sp)
	l.s	$f4, 44($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9122:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9123
	lw	$t8, 4($sp)
	lw	$v0, 16($sp)
	lw	$v1, 8($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 36($sp)
	l.s	$f4, 44($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9123:
	lw	$t8, 0($sp)
	lw	$v0, 16($sp)
	lw	$v1, 8($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 36($sp)
	l.s	$f4, 44($sp)
	lw	$s7, ($t8)
	jr	$s7
solver_rect_fast.4146:
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
	jal	o_param_b.3208
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
	bne	$v0, $v1, beq_else.9124
	li	$v0, 0
	b	beq_cont.9125
beq_else.9124:
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
	jal	o_param_c.3222
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
	bne	$v0, $v1, beq_else.9126
	li	$v0, 0
	b	beq_cont.9127
beq_else.9126:
	lw	$v0, 12($sp)
	l.s	$f0, 4($v0)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fiszero
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9128
	li	$v0, 1
	b	beq_cont.9129
beq_else.9128:
	li	$v0, 0
beq_cont.9129:
beq_cont.9127:
beq_cont.9125:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9130
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
	jal	o_param_a.3194
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
	bne	$v0, $v1, beq_else.9131
	li	$v0, 0
	b	beq_cont.9132
beq_else.9131:
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
	jal	o_param_c.3222
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
	bne	$v0, $v1, beq_else.9133
	li	$v0, 0
	b	beq_cont.9134
beq_else.9133:
	lw	$v0, 12($sp)
	l.s	$f0, 12($v0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fiszero
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9135
	li	$v0, 1
	b	beq_cont.9136
beq_else.9135:
	li	$v0, 0
beq_cont.9136:
beq_cont.9134:
beq_cont.9132:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9137
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
	jal	o_param_a.3194
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
	bne	$v0, $v1, beq_else.9138
	li	$v0, 0
	b	beq_cont.9139
beq_else.9138:
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
	jal	o_param_b.3208
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
	bne	$v0, $v1, beq_else.9140
	li	$v0, 0
	b	beq_cont.9141
beq_else.9140:
	lw	$v0, 12($sp)
	l.s	$f0, 20($v0)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fiszero
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9142
	li	$v0, 1
	b	beq_cont.9143
beq_else.9142:
	li	$v0, 0
beq_cont.9143:
beq_cont.9141:
beq_cont.9139:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9144
	li	$v0, 0
	jr	$ra
beq_else.9144:
	l.s	$f0, 52($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 3
	jr	$ra
beq_else.9137:
	l.s	$f0, 40($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 2
	jr	$ra
beq_else.9130:
	l.s	$f0, 20($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_surface_fast.4243:
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
	bne	$v0, $v1, beq_else.9145
	li	$v0, 0
	jr	$ra
beq_else.9145:
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
solver_second_fast.4266:
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
	bne	$v0, $v1, beq_else.9146
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
	jal	quadratic.4018
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_form.3142
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.9147
	la	$v0, l.6266
	l.s	$f0, 0($v0)
	l.s	$f2, 32($sp)
	sub.s	$f0, $f2, $f0
	b	beq_cont.9148
beq_else.9147:
	l.s	$f0, 32($sp)
	mov.s	$f0, $f0
beq_cont.9148:
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
	bne	$v0, $v1, beq_else.9149
	li	$v0, 0
	jr	$ra
beq_else.9149:
	lw	$v0, 8($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.3168
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9150
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
	b	beq_cont.9151
beq_else.9150:
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
beq_cont.9151:
	li	$v0, 1
	jr	$ra
beq_else.9146:
	li	$v0, 0
	jr	$ra
solver_fast.4312:
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
	jal	o_param_x.3249
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
	jal	o_param_y.3263
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
	jal	o_param_z.3277
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	d_const.3513
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
	jal	o_form.3142
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9152
	lw	$v0, 16($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	d_vec.3509
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
beq_else.9152:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9153
	lw	$t8, 4($sp)
	lw	$v0, 20($sp)
	lw	$v1, 52($sp)
	l.s	$f0, 32($sp)
	l.s	$f2, 40($sp)
	l.s	$f4, 48($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9153:
	lw	$t8, 0($sp)
	lw	$v0, 20($sp)
	lw	$v1, 52($sp)
	l.s	$f0, 32($sp)
	l.s	$f2, 40($sp)
	l.s	$f4, 48($sp)
	lw	$s7, ($t8)
	jr	$s7
solver_surface_fast2.4335:
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
	bne	$v0, $v1, beq_else.9154
	li	$v0, 0
	jr	$ra
beq_else.9154:
	lw	$v0, 8($sp)
	l.s	$f0, 0($v0)
	lw	$v0, 4($sp)
	l.s	$f2, 12($v0)
	mul.s	$f0, $f0, $f2
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_second_fast2.4353:
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
	bne	$v0, $v1, beq_else.9155
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
	bne	$v0, $v1, beq_else.9156
	li	$v0, 0
	jr	$ra
beq_else.9156:
	lw	$v0, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.3168
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9157
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
	b	beq_cont.9158
beq_else.9157:
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
beq_cont.9158:
	li	$v0, 1
	jr	$ra
beq_else.9155:
	li	$v0, 0
	jr	$ra
solver_fast2.4397:
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
	jal	o_param_ctbl.3403
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
	jal	d_const.3513
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
	jal	o_form.3142
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9159
	lw	$v0, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	d_vec.3509
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
beq_else.9159:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9160
	lw	$t8, 4($sp)
	lw	$v0, 12($sp)
	lw	$v1, 40($sp)
	lw	$a0, 24($sp)
	l.s	$f0, 36($sp)
	l.s	$f2, 32($sp)
	l.s	$f4, 28($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9160:
	lw	$t8, 0($sp)
	lw	$v0, 12($sp)
	lw	$v1, 40($sp)
	lw	$a0, 24($sp)
	l.s	$f0, 36($sp)
	l.s	$f2, 32($sp)
	l.s	$f4, 28($sp)
	lw	$s7, ($t8)
	jr	$s7
setup_rect_table.4414:
	li	$a0, 6
	la	$a1, l.6268
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
	bne	$v0, $v1, beq_else.9161
	lw	$v0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.3168
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
	jal	o_param_a.3194
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	fneg_cond.2915
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 0($v0)
	la	$v1, l.6266
	l.s	$f0, 0($v1)
	lw	$v1, 4($sp)
	l.s	$f2, 0($v1)
	div.s	$f0, $f0, $f2
	s.s	$f0, 4($v0)
	b	beq_cont.9162
beq_else.9161:
	la	$v0, l.6268
	l.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	s.s	$f0, 4($v0)
beq_cont.9162:
	lw	$v0, 4($sp)
	l.s	$f0, 4($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fiszero
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9163
	lw	$v0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.3168
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
	jal	o_param_b.3208
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	fneg_cond.2915
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 8($v0)
	la	$v1, l.6266
	l.s	$f0, 0($v1)
	lw	$v1, 4($sp)
	l.s	$f2, 4($v1)
	div.s	$f0, $f0, $f2
	s.s	$f0, 12($v0)
	b	beq_cont.9164
beq_else.9163:
	la	$v0, l.6268
	l.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	s.s	$f0, 12($v0)
beq_cont.9164:
	lw	$v0, 4($sp)
	l.s	$f0, 8($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9165
	lw	$v0, 0($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_isinvert.3168
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
	jal	o_param_c.3222
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg_cond.2915
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 16($v0)
	la	$v1, l.6266
	l.s	$f0, 0($v1)
	lw	$v1, 4($sp)
	l.s	$f2, 8($v1)
	div.s	$f0, $f0, $f2
	s.s	$f0, 20($v0)
	b	beq_cont.9166
beq_else.9165:
	la	$v0, l.6268
	l.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	s.s	$f0, 20($v0)
beq_cont.9166:
	lw	$v0, 8($sp)
	jr	$ra
setup_surface_table.4483:
	li	$a0, 4
	la	$a1, l.6268
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
	jal	o_param_a.3194
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
	jal	o_param_b.3208
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
	jal	o_param_c.3222
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
	bne	$v0, $v1, beq_else.9167
	la	$v0, l.6268
	l.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	s.s	$f0, 0($v0)
	b	beq_cont.9168
beq_else.9167:
	la	$v0, l.6293
	l.s	$f0, 0($v0)
	l.s	$f2, 32($sp)
	div.s	$f0, $f0, $f2
	lw	$v0, 8($sp)
	s.s	$f0, 0($v0)
	lw	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.3194
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
	jal	o_param_b.3208
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
	jal	o_param_c.3222
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
beq_cont.9168:
	lw	$v0, 8($sp)
	jr	$ra
setup_second_table.4526:
	li	$a0, 5
	la	$a1, l.6268
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
	jal	quadratic.4018
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
	jal	o_param_a.3194
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
	jal	o_param_b.3208
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
	jal	o_param_c.3222
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
	jal	o_isrot.3181
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9169
	l.s	$f0, 20($sp)
	lw	$v0, 8($sp)
	s.s	$f0, 4($v0)
	l.s	$f0, 28($sp)
	s.s	$f0, 8($v0)
	l.s	$f0, 36($sp)
	s.s	$f0, 12($v0)
	b	beq_cont.9170
beq_else.9169:
	lw	$v0, 4($sp)
	l.s	$f0, 8($v0)
	lw	$v1, 0($sp)
	s.s	$f0, 40($sp)
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_r2.3375
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
	jal	o_param_r3.3389
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
	jal	o_param_r1.3361
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
	jal	o_param_r3.3389
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
	jal	o_param_r1.3361
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
	jal	o_param_r2.3375
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
beq_cont.9170:
	l.s	$f0, 12($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fiszero
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9171
	la	$v0, l.6266
	l.s	$f0, 0($v0)
	l.s	$f2, 12($sp)
	div.s	$f0, $f0, $f2
	lw	$v0, 8($sp)
	s.s	$f0, 16($v0)
	b	beq_cont.9172
beq_else.9171:
beq_cont.9172:
	lw	$v0, 8($sp)
	jr	$ra
iter_setup_dirvec_constants.4608:
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.9173
	sll	$a1, $v1, 2
	add	$t9, $a0, $a1
	lw	$a0, ($t9)
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$a0, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	d_const.3513
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	d_vec.3509
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 8($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_form.3142
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9174
	lw	$v0, 20($sp)
	lw	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_rect_table.4414
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 4($sp)
	sll	$a0, $v1, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	b	beq_cont.9175
beq_else.9174:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9176
	lw	$v0, 20($sp)
	lw	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_surface_table.4483
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 4($sp)
	sll	$a0, $v1, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	b	beq_cont.9177
beq_else.9176:
	lw	$v0, 20($sp)
	lw	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_second_table.4526
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 4($sp)
	sll	$a0, $v1, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
beq_cont.9177:
beq_cont.9175:
	lw	$v0, 4($sp)
	addi	$v1, $v0, -1
	lw	$t8, 0($sp)
	lw	$v0, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9173:
	jr	$ra
setup_dirvec_constants.4624:
	lw	$v1, 8($t8)
	lw	$t8, 4($t8)
	lw	$v1, 0($v1)
	addi	$v1, $v1, -1
	lw	$s7, ($t8)
	jr	$s7
setup_startp_constants.4630:
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.9179
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
	jal	o_param_ctbl.3403
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.3142
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
	jal	o_param_x.3249
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
	jal	o_param_y.3263
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
	jal	o_param_z.3277
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 32($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 8($v0)
	li	$v1, 2
	lw	$a0, 20($sp)
	bne	$a0, $v1, beq_else.9180
	lw	$v1, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.3236
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v1, 16($sp)
	l.s	$f0, 0($v1)
	l.s	$f2, 4($v1)
	l.s	$f4, 8($v1)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veciprod2.3014
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 16($sp)
	s.s	$f0, 12($v0)
	b	beq_cont.9181
beq_else.9180:
	li	$v1, 2
	bgt	$a0, $v1, ble_else.9182
	b	ble_cont.9183
ble_else.9182:
	l.s	$f0, 0($v0)
	l.s	$f2, 4($v0)
	l.s	$f4, 8($v0)
	lw	$v1, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	quadratic.4018
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	li	$v0, 3
	lw	$v1, 20($sp)
	bne	$v1, $v0, beq_else.9184
	la	$v0, l.6266
	l.s	$f2, 0($v0)
	sub.s	$f0, $f0, $f2
	b	beq_cont.9185
beq_else.9184:
	mov.s	$f0, $f0
beq_cont.9185:
	lw	$v0, 16($sp)
	s.s	$f0, 12($v0)
ble_cont.9183:
beq_cont.9181:
	lw	$v0, 4($sp)
	addi	$v1, $v0, -1
	lw	$t8, 0($sp)
	lw	$v0, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9179:
	jr	$ra
setup_startp.4680:
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
	jal	veccpy.2946
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 8($sp)
	lw	$v0, 0($v0)
	addi	$v1, $v0, -1
	lw	$t8, 4($sp)
	lw	$v0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
is_rect_outside.4687:
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
	jal	o_param_a.3194
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
	bne	$v0, $v1, beq_else.9187
	li	$v0, 0
	b	beq_cont.9188
beq_else.9187:
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
	jal	o_param_b.3208
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
	bne	$v0, $v1, beq_else.9189
	li	$v0, 0
	b	beq_cont.9190
beq_else.9189:
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
	jal	o_param_c.3222
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	mov.s	$f2, $f0
	l.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fless
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
beq_cont.9190:
beq_cont.9188:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9191
	lw	$v0, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_isinvert.3168
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9192
	li	$v0, 1
	jr	$ra
beq_else.9192:
	li	$v0, 0
	jr	$ra
beq_else.9191:
	lw	$v0, 8($sp)
	j	o_isinvert.3168
is_plane_outside.4706:
	sw	$v0, 0($sp)
	s.s	$f4, 4($sp)
	s.s	$f2, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_abc.3236
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f0, 12($sp)
	l.s	$f2, 8($sp)
	l.s	$f4, 4($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	veciprod2.3014
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.3168
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
	bne	$v0, $v1, beq_else.9193
	li	$v0, 1
	jr	$ra
beq_else.9193:
	li	$v0, 0
	jr	$ra
is_second_outside.4717:
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	quadratic.4018
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_form.3142
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.9194
	la	$v0, l.6266
	l.s	$f0, 0($v0)
	l.s	$f2, 4($sp)
	sub.s	$f0, $f2, $f0
	b	beq_cont.9195
beq_else.9194:
	l.s	$f0, 4($sp)
	mov.s	$f0, $f0
beq_cont.9195:
	lw	$v0, 0($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.3168
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
	bne	$v0, $v1, beq_else.9196
	li	$v0, 1
	jr	$ra
beq_else.9196:
	li	$v0, 0
	jr	$ra
is_outside.4731:
	s.s	$f4, 0($sp)
	s.s	$f2, 4($sp)
	sw	$v0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_x.3249
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	l.s	$f2, 12($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_y.3263
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	l.s	$f2, 4($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_z.3277
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	l.s	$f2, 0($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 8($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_form.3142
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9197
	lw	$v0, 8($sp)
	l.s	$f0, 16($sp)
	l.s	$f2, 20($sp)
	l.s	$f4, 24($sp)
	j	is_rect_outside.4687
beq_else.9197:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9198
	lw	$v0, 8($sp)
	l.s	$f0, 16($sp)
	l.s	$f2, 20($sp)
	l.s	$f4, 24($sp)
	j	is_plane_outside.4706
beq_else.9198:
	lw	$v0, 8($sp)
	l.s	$f0, 16($sp)
	l.s	$f2, 20($sp)
	l.s	$f4, 24($sp)
	j	is_second_outside.4717
check_all_inside.4745:
	lw	$a0, 4($t8)
	sll	$a1, $v0, 2
	add	$t9, $v1, $a1
	lw	$a1, ($t9)
	li	$a2, -1
	bne	$a1, $a2, beq_else.9199
	li	$v0, 1
	jr	$ra
beq_else.9199:
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
	jal	is_outside.4731
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9200
	lw	$v0, 20($sp)
	addi	$v0, $v0, 1
	lw	$t8, 16($sp)
	lw	$v1, 12($sp)
	l.s	$f0, 8($sp)
	l.s	$f2, 4($sp)
	l.s	$f4, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9200:
	li	$v0, 0
	jr	$ra
shadow_check_and_group.4759:
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
	bne	$t3, $t4, beq_else.9201
	li	$v0, 0
	jr	$ra
beq_else.9201:
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
	bne	$v0, $v1, beq_else.9202
	li	$v0, 0
	b	beq_cont.9203
beq_else.9202:
	la	$v0, l.6646
	l.s	$f2, 0($v0)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fless
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
beq_cont.9203:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9204
	lw	$v0, 28($sp)
	sll	$v0, $v0, 2
	lw	$v1, 24($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isinvert.3168
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9205
	li	$v0, 0
	jr	$ra
beq_else.9205:
	lw	$v0, 20($sp)
	addi	$v0, $v0, 1
	lw	$t8, 16($sp)
	lw	$v1, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9204:
	la	$v0, l.6649
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
	bne	$v0, $v1, beq_else.9206
	lw	$v0, 20($sp)
	addi	$v0, $v0, 1
	lw	$t8, 16($sp)
	lw	$v1, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9206:
	li	$v0, 1
	jr	$ra
shadow_check_one_or_group.4803:
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	sll	$a2, $v0, 2
	add	$t9, $v1, $a2
	lw	$a2, ($t9)
	li	$a3, -1
	bne	$a2, $a3, beq_else.9207
	li	$v0, 0
	jr	$ra
beq_else.9207:
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
	bne	$v0, $v1, beq_else.9208
	lw	$v0, 8($sp)
	addi	$v0, $v0, 1
	lw	$t8, 4($sp)
	lw	$v1, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9208:
	li	$v0, 1
	jr	$ra
shadow_check_one_or_matrix.4815:
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
	bne	$t2, $t3, beq_else.9209
	li	$v0, 0
	jr	$ra
beq_else.9209:
	li	$t3, 99
	sw	$t1, 0($sp)
	sw	$a2, 4($sp)
	sw	$v1, 8($sp)
	sw	$t8, 12($sp)
	sw	$v0, 16($sp)
	bne	$t2, $t3, beq_else.9210
	li	$v0, 1
	b	beq_cont.9211
beq_else.9210:
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
	bne	$v0, $v1, beq_else.9212
	li	$v0, 0
	b	beq_cont.9213
beq_else.9212:
	lw	$v0, 20($sp)
	l.s	$f0, 0($v0)
	la	$v0, l.6662
	l.s	$f2, 0($v0)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fless
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9214
	li	$v0, 0
	b	beq_cont.9215
beq_else.9214:
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
	bne	$v0, $v1, beq_else.9216
	li	$v0, 0
	b	beq_cont.9217
beq_else.9216:
	li	$v0, 1
beq_cont.9217:
beq_cont.9215:
beq_cont.9213:
beq_cont.9211:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9218
	lw	$v0, 16($sp)
	addi	$v0, $v0, 1
	lw	$t8, 12($sp)
	lw	$v1, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9218:
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
	bne	$v0, $v1, beq_else.9219
	lw	$v0, 16($sp)
	addi	$v0, $v0, 1
	lw	$t8, 12($sp)
	lw	$v1, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9219:
	li	$v0, 1
	jr	$ra
solve_each_element.4843:
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
	bne	$t6, $t7, beq_else.9220
	jr	$ra
beq_else.9220:
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
	bne	$v0, $v1, beq_else.9222
	lw	$v0, 48($sp)
	sll	$v0, $v0, 2
	lw	$v1, 44($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.3168
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9223
	jr	$ra
beq_else.9223:
	lw	$v0, 40($sp)
	addi	$v0, $v0, 1
	lw	$t8, 36($sp)
	lw	$v1, 32($sp)
	lw	$a0, 28($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9222:
	lw	$v1, 24($sp)
	l.s	$f2, 0($v1)
	la	$v1, l.6268
	l.s	$f0, 0($v1)
	sw	$v0, 52($sp)
	s.s	$f2, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9225
	b	beq_cont.9226
beq_else.9225:
	lw	$v0, 20($sp)
	l.s	$f2, 0($v0)
	l.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9227
	b	beq_cont.9228
beq_else.9227:
	la	$v0, l.6649
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
	bne	$v0, $v1, beq_else.9229
	b	beq_cont.9230
beq_else.9229:
	l.s	$f0, 72($sp)
	lw	$v0, 20($sp)
	s.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	l.s	$f0, 68($sp)
	l.s	$f2, 64($sp)
	l.s	$f4, 60($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	vecset.2925
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lw	$v0, 48($sp)
	lw	$v1, 4($sp)
	sw	$v0, 0($v1)
	lw	$v0, 52($sp)
	lw	$v1, 0($sp)
	sw	$v0, 0($v1)
beq_cont.9230:
beq_cont.9228:
beq_cont.9226:
	lw	$v0, 40($sp)
	addi	$v0, $v0, 1
	lw	$t8, 36($sp)
	lw	$v1, 32($sp)
	lw	$a0, 28($sp)
	lw	$s7, ($t8)
	jr	$s7
solve_one_or_network.4898:
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sll	$a3, $v0, 2
	add	$t9, $v1, $a3
	lw	$a3, ($t9)
	li	$t0, -1
	bne	$a3, $t0, beq_else.9231
	jr	$ra
beq_else.9231:
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
trace_or_matrix.4910:
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
	bne	$t3, $t4, beq_else.9233
	jr	$ra
beq_else.9233:
	li	$t4, 99
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	bne	$t3, $t4, beq_else.9235
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
	b	beq_cont.9236
beq_else.9235:
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
	bne	$v0, $v1, beq_else.9237
	b	beq_cont.9238
beq_else.9237:
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
	bne	$v0, $v1, beq_else.9239
	b	beq_cont.9240
beq_else.9239:
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
beq_cont.9240:
beq_cont.9238:
beq_cont.9236:
	lw	$v0, 12($sp)
	addi	$v0, $v0, 1
	lw	$t8, 8($sp)
	lw	$v1, 4($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
judge_intersection.4933:
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	la	$a2, l.6685
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
	la	$v0, l.6662
	l.s	$f0, 0($v0)
	s.s	$f2, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fless
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9241
	li	$v0, 0
	jr	$ra
beq_else.9241:
	la	$v0, l.6691
	l.s	$f2, 0($v0)
	l.s	$f0, 4($sp)
	j	min_caml_fless
solve_each_element_fast.4948:
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
	jal	d_vec.3509
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$v1, 48($sp)
	sll	$a0, $v1, 2
	lw	$a1, 44($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	li	$a2, -1
	bne	$a0, $a2, beq_else.9242
	jr	$ra
beq_else.9242:
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
	bne	$v0, $v1, beq_else.9244
	lw	$v0, 56($sp)
	sll	$v0, $v0, 2
	lw	$v1, 32($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.3168
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9245
	jr	$ra
beq_else.9245:
	lw	$v0, 48($sp)
	addi	$v0, $v0, 1
	lw	$t8, 28($sp)
	lw	$v1, 44($sp)
	lw	$a0, 36($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9244:
	lw	$v1, 24($sp)
	l.s	$f2, 0($v1)
	la	$v1, l.6268
	l.s	$f0, 0($v1)
	sw	$v0, 60($sp)
	s.s	$f2, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9247
	b	beq_cont.9248
beq_else.9247:
	lw	$v0, 20($sp)
	l.s	$f2, 0($v0)
	l.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9249
	b	beq_cont.9250
beq_else.9249:
	la	$v0, l.6649
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
	bne	$v0, $v1, beq_else.9251
	b	beq_cont.9252
beq_else.9251:
	l.s	$f0, 80($sp)
	lw	$v0, 20($sp)
	s.s	$f0, 0($v0)
	lw	$v0, 8($sp)
	l.s	$f0, 76($sp)
	l.s	$f2, 72($sp)
	l.s	$f4, 68($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	vecset.2925
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lw	$v0, 56($sp)
	lw	$v1, 4($sp)
	sw	$v0, 0($v1)
	lw	$v0, 60($sp)
	lw	$v1, 0($sp)
	sw	$v0, 0($v1)
beq_cont.9252:
beq_cont.9250:
beq_cont.9248:
	lw	$v0, 48($sp)
	addi	$v0, $v0, 1
	lw	$t8, 28($sp)
	lw	$v1, 44($sp)
	lw	$a0, 36($sp)
	lw	$s7, ($t8)
	jr	$s7
solve_one_or_network_fast.5004:
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sll	$a3, $v0, 2
	add	$t9, $v1, $a3
	lw	$a3, ($t9)
	li	$t0, -1
	bne	$a3, $t0, beq_else.9253
	jr	$ra
beq_else.9253:
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
trace_or_matrix_fast.5016:
	lw	$a1, 16($t8)
	lw	$a2, 12($t8)
	lw	$a3, 8($t8)
	lw	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $v1, $t1
	lw	$t1, ($t9)
	lw	$t2, 0($t1)
	li	$t3, -1
	bne	$t2, $t3, beq_else.9255
	jr	$ra
beq_else.9255:
	li	$t3, 99
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	bne	$t2, $t3, beq_else.9257
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
	b	beq_cont.9258
beq_else.9257:
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
	bne	$v0, $v1, beq_else.9259
	b	beq_cont.9260
beq_else.9259:
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
	bne	$v0, $v1, beq_else.9261
	b	beq_cont.9262
beq_else.9261:
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
beq_cont.9262:
beq_cont.9260:
beq_cont.9258:
	lw	$v0, 12($sp)
	addi	$v0, $v0, 1
	lw	$t8, 8($sp)
	lw	$v1, 4($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
judge_intersection_fast.5039:
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	la	$a2, l.6685
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
	la	$v0, l.6662
	l.s	$f0, 0($v0)
	s.s	$f2, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fless
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9263
	li	$v0, 0
	jr	$ra
beq_else.9263:
	la	$v0, l.6691
	l.s	$f2, 0($v0)
	l.s	$f0, 4($sp)
	j	min_caml_fless
get_nvector_rect.5054:
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	lw	$a0, 0($a0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	vecbzero.2943
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
	jal	sgn.2909
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
get_nvector_plane.5066:
	lw	$v1, 4($t8)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_a.3194
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
	jal	o_param_b.3208
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
	jal	o_param_c.3222
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
get_nvector_second.5079:
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	l.s	$f0, 0($a0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_x.3249
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
	jal	o_param_y.3263
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
	jal	o_param_z.3277
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	l.s	$f2, 28($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.3194
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f2, 16($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_b.3208
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_c.3222
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	l.s	$f2, 32($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_isrot.3181
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9266
	l.s	$f0, 36($sp)
	lw	$v0, 0($sp)
	s.s	$f0, 0($v0)
	l.s	$f0, 40($sp)
	s.s	$f0, 4($v0)
	l.s	$f0, 44($sp)
	s.s	$f0, 8($v0)
	b	beq_cont.9267
beq_else.9266:
	lw	$v0, 4($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_r3.3389
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 24($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r2.3375
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
	jal	o_param_r3.3389
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	l.s	$f2, 16($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r1.3361
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
	jal	o_param_r2.3375
	addi	$sp, $sp, -60
	lw	$ra, 56($sp)
	l.s	$f2, 16($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_r1.3361
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
beq_cont.9267:
	lw	$v0, 4($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.3168
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$v1, $v0, 0
	lw	$v0, 0($sp)
	j	vecunit_sgn.2960
get_nvector.5134:
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
	jal	o_form.3142
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9268
	lw	$t8, 16($sp)
	lw	$v0, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9268:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9269
	lw	$t8, 8($sp)
	lw	$v0, 4($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9269:
	lw	$t8, 0($sp)
	lw	$v0, 4($sp)
	lw	$s7, ($t8)
	jr	$s7
utexture.5140:
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
	jal	o_texturetype.3129
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_color_red.3319
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 0($v0)
	lw	$v1, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_color_green.3333
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 4($v0)
	lw	$v1, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_color_blue.3347
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v0, 12($sp)
	s.s	$f0, 8($v0)
	li	$v1, 1
	lw	$a0, 20($sp)
	bne	$a0, $v1, beq_else.9270
	lw	$v1, 8($sp)
	l.s	$f0, 0($v1)
	lw	$a0, 16($sp)
	s.s	$f0, 24($sp)
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.3249
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6739
	l.s	$f2, 0($v0)
	mul.s	$f2, $f0, $f2
	s.s	$f0, 28($sp)
	mov.s	$f0, $f2
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_floor
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	la	$v0, l.6741
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	l.s	$f2, 28($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6743
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
	jal	o_param_z.3277
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6739
	l.s	$f2, 0($v0)
	mul.s	$f2, $f0, $f2
	s.s	$f0, 40($sp)
	mov.s	$f0, $f2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_floor
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	la	$v0, l.6741
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	l.s	$f2, 40($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6743
	l.s	$f2, 0($v0)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fless
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	lw	$a0, 32($sp)
	bne	$a0, $v1, beq_else.9271
	li	$v1, 0
	bne	$v0, $v1, beq_else.9273
	la	$v0, l.6749
	l.s	$f0, 0($v0)
	b	beq_cont.9274
beq_else.9273:
	la	$v0, l.6268
	l.s	$f0, 0($v0)
beq_cont.9274:
	b	beq_cont.9272
beq_else.9271:
	li	$v1, 0
	bne	$v0, $v1, beq_else.9275
	la	$v0, l.6268
	l.s	$f0, 0($v0)
	b	beq_cont.9276
beq_else.9275:
	la	$v0, l.6749
	l.s	$f0, 0($v0)
beq_cont.9276:
beq_cont.9272:
	lw	$v0, 12($sp)
	s.s	$f0, 4($v0)
	jr	$ra
beq_else.9270:
	li	$v1, 2
	bne	$a0, $v1, beq_else.9278
	lw	$v1, 8($sp)
	l.s	$f0, 4($v1)
	la	$v1, l.6756
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
	la	$v0, l.6749
	l.s	$f2, 0($v0)
	mul.s	$f2, $f2, $f0
	lw	$v0, 12($sp)
	s.s	$f2, 0($v0)
	la	$v1, l.6749
	l.s	$f2, 0($v1)
	la	$v1, l.6266
	l.s	$f4, 0($v1)
	sub.s	$f0, $f4, $f0
	mul.s	$f0, $f2, $f0
	s.s	$f0, 4($v0)
	jr	$ra
beq_else.9278:
	li	$v1, 3
	bne	$a0, $v1, beq_else.9280
	lw	$v1, 8($sp)
	l.s	$f0, 0($v1)
	lw	$a0, 16($sp)
	s.s	$f0, 44($sp)
	addi	$v0, $a0, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_x.3249
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
	jal	o_param_z.3277
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
	la	$v0, l.6743
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
	la	$v0, l.6766
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
	la	$v0, l.6749
	l.s	$f2, 0($v0)
	mul.s	$f2, $f0, $f2
	lw	$v0, 12($sp)
	s.s	$f2, 4($v0)
	la	$v1, l.6266
	l.s	$f2, 0($v1)
	sub.s	$f0, $f2, $f0
	la	$v1, l.6749
	l.s	$f2, 0($v1)
	mul.s	$f0, $f0, $f2
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.9280:
	li	$v1, 4
	bne	$a0, $v1, beq_else.9282
	lw	$v1, 8($sp)
	l.s	$f0, 0($v1)
	lw	$a0, 16($sp)
	s.s	$f0, 68($sp)
	addi	$v0, $a0, 0
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	o_param_x.3249
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	l.s	$f2, 68($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_a.3194
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
	jal	o_param_z.3277
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	l.s	$f2, 80($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 84($sp)
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	o_param_c.3222
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
	la	$v0, l.6775
	l.s	$f2, 0($v0)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fless
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9283
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
	jal	atan.2682
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	la	$v0, l.6777
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6766
	l.s	$f2, 0($v0)
	div.s	$f0, $f0, $f2
	b	beq_cont.9284
beq_else.9283:
	la	$v0, l.6780
	l.s	$f0, 0($v0)
beq_cont.9284:
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
	jal	o_param_y.3263
	addi	$sp, $sp, -116
	lw	$ra, 112($sp)
	l.s	$f2, 108($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 16($sp)
	s.s	$f0, 112($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_param_b.3208
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
	la	$v0, l.6775
	l.s	$f2, 0($v0)
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_fless
	addi	$sp, $sp, -124
	lw	$ra, 120($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9285
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
	jal	atan.2682
	addi	$sp, $sp, -124
	lw	$ra, 120($sp)
	la	$v0, l.6777
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6766
	l.s	$f2, 0($v0)
	div.s	$f0, $f0, $f2
	b	beq_cont.9286
beq_else.9285:
	la	$v0, l.6780
	l.s	$f0, 0($v0)
beq_cont.9286:
	s.s	$f0, 120($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_floor
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	l.s	$f2, 120($sp)
	sub.s	$f0, $f2, $f0
	la	$v0, l.6787
	l.s	$f2, 0($v0)
	la	$v0, l.6789
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
	la	$v0, l.6789
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
	bne	$v0, $v1, beq_else.9287
	l.s	$f0, 136($sp)
	mov.s	$f0, $f0
	b	beq_cont.9288
beq_else.9287:
	la	$v0, l.6268
	l.s	$f0, 0($v0)
beq_cont.9288:
	la	$v0, l.6749
	l.s	$f2, 0($v0)
	mul.s	$f0, $f2, $f0
	la	$v0, l.6794
	l.s	$f2, 0($v0)
	div.s	$f0, $f0, $f2
	lw	$v0, 12($sp)
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.9282:
	jr	$ra
add_light.5297:
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
	bne	$v0, $v1, beq_else.9291
	b	beq_cont.9292
beq_else.9291:
	lw	$v0, 16($sp)
	lw	$v1, 12($sp)
	l.s	$f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	vecaccum.3029
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.9292:
	l.s	$f0, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fispos
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9293
	jr	$ra
beq_else.9293:
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
trace_reflections.5323:
	lw	$a0, 32($t8)
	lw	$a1, 28($t8)
	lw	$a2, 24($t8)
	lw	$a3, 20($t8)
	lw	$t0, 16($t8)
	lw	$t1, 12($t8)
	lw	$t2, 8($t8)
	lw	$t3, 4($t8)
	li	$t4, 0
	bgt	$t4, $v0, ble_else.9296
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
	jal	r_dvec.3522
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
	bne	$v0, $v1, beq_else.9297
	b	beq_cont.9298
beq_else.9297:
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
	jal	r_surface_id.3517
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v1, 56($sp)
	bne	$v1, $v0, beq_else.9299
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
	bne	$v0, $v1, beq_else.9301
	lw	$v0, 52($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_vec.3509
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$v1, $v0, 0
	lw	$v0, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veciprod.2995
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 36($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	r_bright.3527
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
	jal	d_vec.3509
	addi	$sp, $sp, -76
	lw	$ra, 72($sp)
	addi	$v1, $v0, 0
	lw	$v0, 16($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	veciprod.2995
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
	b	beq_cont.9302
beq_else.9301:
beq_cont.9302:
	b	beq_cont.9300
beq_else.9299:
beq_cont.9300:
beq_cont.9298:
	lw	$v0, 4($sp)
	addi	$v0, $v0, -1
	lw	$t8, 0($sp)
	lw	$v1, 16($sp)
	l.s	$f0, 20($sp)
	l.s	$f2, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9296:
	jr	$ra
trace_ray.5357:
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
	bgt	$v0, $a3, ble_else.9304
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
	jal	p_surface_ids.3436
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
	bne	$v0, $v1, beq_else.9305
	li	$v0, -1
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	lw	$a1, 104($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	li	$v0, 0
	bne	$v1, $v0, beq_else.9306
	jr	$ra
beq_else.9306:
	lw	$v0, 96($sp)
	lw	$v1, 88($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	veciprod.2995
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
	bne	$v0, $v1, beq_else.9308
	jr	$ra
beq_else.9308:
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
beq_else.9305:
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
	jal	o_reflectiontype.3155
	addi	$sp, $sp, -124
	lw	$ra, 120($sp)
	lw	$v1, 116($sp)
	sw	$v0, 120($sp)
	addi	$v0, $v1, 0
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	o_diffuse.3291
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
	jal	veccpy.2946
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
	jal	p_intersection_points.3426
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
	jal	veccpy.2946
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	lw	$v0, 44($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	p_calc_diffuse.3446
	addi	$sp, $sp, -132
	lw	$ra, 128($sp)
	lw	$v1, 116($sp)
	sw	$v0, 128($sp)
	addi	$v0, $v1, 0
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	o_diffuse.3291
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	la	$v0, l.6789
	l.s	$f2, 0($v0)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_fless
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9311
	li	$v0, 1
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	lw	$a1, 128($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	lw	$v0, 44($sp)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	p_energy.3456
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
	jal	veccpy.2946
	addi	$sp, $sp, -140
	lw	$ra, 136($sp)
	lw	$v0, 92($sp)
	sll	$v1, $v0, 2
	lw	$a0, 132($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	la	$a0, l.6824
	l.s	$f0, 0($a0)
	l.s	$f2, 124($sp)
	mul.s	$f0, $f0, $f2
	addi	$v0, $v1, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	vecscale.3079
	addi	$sp, $sp, -140
	lw	$ra, 136($sp)
	lw	$v0, 44($sp)
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	p_nvectors.3499
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
	jal	veccpy.2946
	addi	$sp, $sp, -140
	lw	$ra, 136($sp)
	b	beq_cont.9312
beq_else.9311:
	li	$v0, 0
	lw	$v1, 92($sp)
	sll	$a0, $v1, 2
	lw	$a1, 128($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
beq_cont.9312:
	la	$v0, l.6828
	l.s	$f0, 0($v0)
	lw	$v0, 96($sp)
	lw	$v1, 36($sp)
	s.s	$f0, 136($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	veciprod.2995
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	l.s	$f2, 136($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 96($sp)
	lw	$v1, 36($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	vecaccum.3029
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	lw	$v0, 116($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	o_hilight.3305
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
	bne	$v0, $v1, beq_else.9313
	lw	$v0, 36($sp)
	lw	$v1, 88($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	veciprod.2995
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
	jal	veciprod.2995
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
	b	beq_cont.9314
beq_else.9313:
beq_cont.9314:
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
	la	$v0, l.6832
	l.s	$f0, 0($v0)
	l.s	$f2, 84($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fless
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9315
	jr	$ra
beq_else.9315:
	li	$v0, 4
	lw	$v1, 92($sp)
	bgt	$v0, $v1, ble_else.9317
	b	ble_cont.9318
ble_else.9317:
	addi	$v0, $v1, 1
	li	$a0, -1
	sll	$v0, $v0, 2
	lw	$a1, 104($sp)
	add	$t9, $a1, $v0
	sw	$a0, ($t9)
ble_cont.9318:
	li	$v0, 2
	lw	$v1, 120($sp)
	bne	$v1, $v0, beq_else.9319
	la	$v0, l.6266
	l.s	$f0, 0($v0)
	lw	$v0, 116($sp)
	s.s	$f0, 148($sp)
	sw	$ra, 152($sp)
	addi	$sp, $sp, 156
	jal	o_diffuse.3291
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
beq_else.9319:
	jr	$ra
ble_else.9304:
	jr	$ra
trace_diffuse_ray.5475:
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
	bne	$v0, $v1, beq_else.9322
	jr	$ra
beq_else.9322:
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
	jal	d_vec.3509
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
	bne	$v0, $v1, beq_else.9324
	lw	$v0, 16($sp)
	lw	$v1, 12($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	veciprod.2995
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
	bne	$v0, $v1, beq_else.9325
	la	$v0, l.6268
	l.s	$f0, 0($v0)
	b	beq_cont.9326
beq_else.9325:
	l.s	$f0, 56($sp)
	mov.s	$f0, $f0
beq_cont.9326:
	l.s	$f2, 8($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 52($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_diffuse.3291
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	l.s	$f2, 60($sp)
	mul.s	$f0, $f2, $f0
	lw	$v0, 4($sp)
	lw	$v1, 0($sp)
	j	vecaccum.3029
beq_else.9324:
	jr	$ra
iter_trace_diffuse_rays.5499:
	lw	$a2, 4($t8)
	li	$a3, 0
	bgt	$a3, $a1, ble_else.9328
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
	jal	d_vec.3509
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	veciprod.2995
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fisneg
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9329
	lw	$v0, 16($sp)
	sll	$v1, $v0, 2
	lw	$a0, 12($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	la	$a1, l.6843
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
	b	beq_cont.9330
beq_else.9329:
	lw	$v0, 16($sp)
	addi	$v1, $v0, 1
	sll	$v1, $v1, 2
	lw	$a0, 12($sp)
	add	$t9, $a0, $v1
	lw	$v1, ($t9)
	la	$a1, l.6846
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
beq_cont.9330:
	lw	$v0, 16($sp)
	addi	$a1, $v0, -2
	lw	$t8, 4($sp)
	lw	$v0, 12($sp)
	lw	$v1, 20($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9328:
	jr	$ra
trace_diffuse_rays.5521:
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
trace_diffuse_ray_80percent.5527:
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	li	$a3, 0
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$v0, 16($sp)
	bne	$v0, $a3, beq_else.9332
	b	beq_cont.9333
beq_else.9332:
	lw	$a3, 0($a2)
	addi	$v0, $a3, 0
	addi	$t8, $a1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.9333:
	li	$v0, 1
	lw	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9334
	b	beq_cont.9335
beq_else.9334:
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
beq_cont.9335:
	li	$v0, 2
	lw	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9336
	b	beq_cont.9337
beq_else.9336:
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
beq_cont.9337:
	li	$v0, 3
	lw	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9338
	b	beq_cont.9339
beq_else.9338:
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
beq_cont.9339:
	li	$v0, 4
	lw	$v1, 16($sp)
	bne	$v1, $v0, beq_else.9340
	jr	$ra
beq_else.9340:
	lw	$v0, 12($sp)
	lw	$v0, 16($v0)
	lw	$t8, 8($sp)
	lw	$v1, 4($sp)
	lw	$a0, 0($sp)
	lw	$s7, ($t8)
	jr	$s7
calc_diffuse_using_1point.5550:
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
	jal	p_received_ray_20percent.3466
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$v1, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_nvectors.3499
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 16($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_intersection_points.3426
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v1, 16($sp)
	sw	$v0, 28($sp)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_energy.3456
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
	jal	veccpy.2946
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$v0, 16($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_group_id.3476
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
	j	vecaccumv.3096
calc_diffuse_using_5points.5564:
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
	jal	p_received_ray_20percent.3466
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
	jal	p_received_ray_20percent.3466
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
	jal	p_received_ray_20percent.3466
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
	jal	p_received_ray_20percent.3466
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
	jal	p_received_ray_20percent.3466
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
	jal	veccpy.2946
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
	jal	vecadd.3056
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
	jal	vecadd.3056
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
	jal	vecadd.3056
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
	jal	vecadd.3056
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v0, 20($sp)
	sll	$v0, $v0, 2
	lw	$v1, 16($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_energy.3456
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v1, 8($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lw	$v1, ($t9)
	lw	$v0, 0($sp)
	lw	$a0, 4($sp)
	j	vecaccumv.3096
do_without_neighbors.5597:
	lw	$a0, 4($t8)
	li	$a1, 4
	bgt	$v1, $a1, ble_else.9342
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	sw	$v1, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	p_surface_ids.3436
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	lw	$a0, 12($sp)
	sll	$a1, $a0, 2
	add	$t9, $v0, $a1
	lw	$v0, ($t9)
	bgt	$v1, $v0, ble_else.9343
	lw	$v0, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	p_calc_diffuse.3446
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	lw	$v1, 12($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lw	$v0, ($t9)
	li	$a0, 0
	bne	$v0, $a0, beq_else.9344
	b	beq_cont.9345
beq_else.9344:
	lw	$t8, 4($sp)
	lw	$v0, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lw	$s7, ($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
beq_cont.9345:
	lw	$v0, 12($sp)
	addi	$v1, $v0, 1
	lw	$t8, 0($sp)
	lw	$v0, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9343:
	jr	$ra
ble_else.9342:
	jr	$ra
neighbors_exist.5610:
	lw	$a0, 4($t8)
	lw	$a1, 4($a0)
	addi	$a2, $v1, 1
	bgt	$a1, $a2, ble_else.9348
	li	$v0, 0
	jr	$ra
ble_else.9348:
	li	$a1, 0
	bgt	$v1, $a1, ble_else.9349
	li	$v0, 0
	jr	$ra
ble_else.9349:
	lw	$v1, 0($a0)
	addi	$a0, $v0, 1
	bgt	$v1, $a0, ble_else.9350
	li	$v0, 0
	jr	$ra
ble_else.9350:
	li	$v1, 0
	bgt	$v0, $v1, ble_else.9351
	li	$v0, 0
	jr	$ra
ble_else.9351:
	li	$v0, 1
	jr	$ra
get_surface_id.5624:
	sw	$v1, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	p_surface_ids.3436
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lw	$v0, ($t9)
	jr	$ra
neighbors_are_available.5628:
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
	jal	get_surface_id.5624
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
	jal	get_surface_id.5624
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9352
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
	jal	get_surface_id.5624
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9353
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
	jal	get_surface_id.5624
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9354
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
	jal	get_surface_id.5624
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 20($sp)
	bne	$v0, $v1, beq_else.9355
	li	$v0, 1
	jr	$ra
beq_else.9355:
	li	$v0, 0
	jr	$ra
beq_else.9354:
	li	$v0, 0
	jr	$ra
beq_else.9353:
	li	$v0, 0
	jr	$ra
beq_else.9352:
	li	$v0, 0
	jr	$ra
try_exploit_neighbors.5648:
	lw	$t0, 8($t8)
	lw	$t1, 4($t8)
	sll	$t2, $v0, 2
	add	$t9, $a1, $t2
	lw	$t2, ($t9)
	li	$t3, 4
	bgt	$a3, $t3, ble_else.9356
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
	jal	get_surface_id.5624
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$v1, 40($sp)
	bgt	$v1, $v0, ble_else.9357
	lw	$v0, 36($sp)
	lw	$v1, 32($sp)
	lw	$a0, 28($sp)
	lw	$a1, 24($sp)
	lw	$a2, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	neighbors_are_available.5628
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9358
	lw	$v0, 36($sp)
	sll	$v0, $v0, 2
	lw	$v1, 28($sp)
	add	$t9, $v1, $v0
	lw	$v0, ($t9)
	lw	$t8, 16($sp)
	lw	$v1, 20($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9358:
	lw	$v0, 12($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_calc_diffuse.3446
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a2, 20($sp)
	sll	$v1, $a2, 2
	add	$t9, $v0, $v1
	lw	$v0, ($t9)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9359
	b	beq_cont.9360
beq_else.9359:
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
beq_cont.9360:
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
ble_else.9357:
	jr	$ra
ble_else.9356:
	jr	$ra
write_ppm_header.5668:
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
write_rgb_element.5691:
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_int_of_float
	addi	$sp, $sp, -4
	lw	$ra, 0($sp)
	li	$v1, 255
	bgt	$v0, $v1, ble_else.9363
	li	$v1, 0
	bgt	$v1, $v0, ble_else.9365
	b	ble_cont.9366
ble_else.9365:
	li	$v0, 0
ble_cont.9366:
	b	ble_cont.9364
ble_else.9363:
	li	$v0, 255
ble_cont.9364:
	j	min_caml_print_int
write_rgb.5697:
	lw	$v0, 4($t8)
	l.s	$f0, 0($v0)
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.5691
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
	jal	write_rgb_element.5691
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
	jal	write_rgb_element.5691
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	li	$v0, 10
	j	min_caml_print_char
pretrace_diffuse_rays.5713:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	li	$a3, 4
	bgt	$v1, $a3, ble_else.9367
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$v1, 16($sp)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5624
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	li	$v1, 0
	bgt	$v1, $v0, ble_else.9368
	lw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_calc_diffuse.3446
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 16($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lw	$v0, ($t9)
	li	$a0, 0
	bne	$v0, $a0, beq_else.9369
	b	beq_cont.9370
beq_else.9369:
	lw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_group_id.3476
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	lw	$v1, 12($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	vecbzero.2943
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_nvectors.3499
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$v1, 20($sp)
	sw	$v0, 28($sp)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_intersection_points.3426
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
	jal	p_received_ray_20percent.3466
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
	jal	veccpy.2946
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
beq_cont.9370:
	lw	$v0, 16($sp)
	addi	$v1, $v0, 1
	lw	$t8, 0($sp)
	lw	$v0, 20($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9368:
	jr	$ra
ble_else.9367:
	jr	$ra
pretrace_pixels.5735:
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
	bgt	$t6, $v1, ble_else.9373
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
	jal	vecunit_sgn.2960
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	vecbzero.2943
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v0, 28($sp)
	lw	$v1, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veccpy.2946
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	li	$v0, 0
	la	$v1, l.6266
	l.s	$f0, 0($v1)
	lw	$v1, 20($sp)
	sll	$a0, $v1, 2
	lw	$a1, 16($sp)
	add	$t9, $a1, $a0
	lw	$a0, ($t9)
	la	$a2, l.6268
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
	jal	p_rgb.3416
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$v1, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veccpy.2946
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
	jal	p_set_group_id.3487
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
	jal	add_mod5.2919
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
ble_else.9373:
	jr	$ra
pretrace_line.5789:
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
scan_pixel.5822:
	lw	$a3, 24($t8)
	lw	$t0, 20($t8)
	lw	$t1, 16($t8)
	lw	$t2, 12($t8)
	lw	$t3, 8($t8)
	lw	$t4, 4($t8)
	lw	$t3, 0($t3)
	bgt	$t3, $v0, ble_else.9375
	jr	$ra
ble_else.9375:
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
	jal	p_rgb.3416
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	addi	$v1, $v0, 0
	lw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veccpy.2946
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
	bne	$v0, $v1, beq_else.9377
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
	b	beq_cont.9378
beq_else.9377:
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
beq_cont.9378:
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
scan_line.5843:
	lw	$a3, 12($t8)
	lw	$t0, 8($t8)
	lw	$t1, 4($t8)
	lw	$t2, 4($t1)
	bgt	$t2, $v0, ble_else.9379
	jr	$ra
ble_else.9379:
	lw	$t1, 4($t1)
	addi	$t1, $t1, -1
	sw	$t8, 0($sp)
	sw	$a2, 4($sp)
	sw	$a1, 8($sp)
	sw	$a0, 12($sp)
	sw	$v1, 16($sp)
	sw	$v0, 20($sp)
	sw	$a3, 24($sp)
	bgt	$t1, $v0, ble_else.9381
	b	ble_cont.9382
ble_else.9381:
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
ble_cont.9382:
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
	jal	add_mod5.2919
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
create_float5x3array.5864:
	li	$v0, 3
	la	$v1, l.6268
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
	la	$a0, l.6268
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
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	sw	$v0, 8($v1)
	li	$v0, 3
	la	$a0, l.6268
	l.s	$f0, 0($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	sw	$v0, 12($v1)
	li	$v0, 3
	la	$a0, l.6268
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
create_pixel.5891:
	li	$v0, 3
	la	$v1, l.6268
	l.s	$f0, 0($v1)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_float_array
	addi	$sp, $sp, -4
	lw	$ra, 0($sp)
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	create_float5x3array.5864
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
	jal	create_float5x3array.5864
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	create_float5x3array.5864
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
	jal	create_float5x3array.5864
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
init_line_elements.5913:
	li	$a0, 0
	bgt	$a0, $v1, ble_else.9383
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	create_pixel.5891
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 4($sp)
	sll	$a0, $v1, 2
	lw	$a1, 0($sp)
	add	$t9, $a1, $a0
	sw	$v0, ($t9)
	addi	$v1, $v1, -1
	addi	$v0, $a1, 0
	j	init_line_elements.5913
ble_else.9383:
	jr	$ra
create_pixelline.5922:
	lw	$v0, 4($t8)
	lw	$v1, 0($v0)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	create_pixel.5891
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
	j	init_line_elements.5913
tan.5933:
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
adjust_position.5937:
	lw	$v0, 4($t8)
	mul.s	$f0, $f0, $f0
	la	$v1, l.6832
	l.s	$f4, 0($v1)
	add.s	$f0, $f0, $f4
	sw	$v0, 0($sp)
	s.s	$f2, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_sqrt
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	la	$v0, l.6266
	l.s	$f2, 0($v0)
	div.s	$f2, $f2, $f0
	s.s	$f0, 8($sp)
	mov.s	$f0, $f2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	atan.2682
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
calc_dirvec.5949:
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	li	$a3, 5
	bgt	$a3, $v0, ble_else.9384
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
	la	$v0, l.6266
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
	la	$v0, l.6266
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
	jal	d_vec.3509
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f0, 36($sp)
	l.s	$f2, 32($sp)
	l.s	$f4, 28($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	vecset.2925
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
	jal	d_vec.3509
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
	jal	vecset.2925
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
	jal	d_vec.3509
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
	jal	vecset.2925
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
	jal	d_vec.3509
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
	jal	vecset.2925
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
	jal	d_vec.3509
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
	jal	vecset.2925
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
	jal	d_vec.3509
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
	j	vecset.2925
ble_else.9384:
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
calc_dirvecs.6009:
	lw	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9385
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
	la	$v0, l.6953
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6955
	l.s	$f2, 0($v0)
	sub.s	$f4, $f0, $f2
	li	$v0, 0
	la	$v1, l.6268
	l.s	$f0, 0($v1)
	la	$v1, l.6268
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
	la	$v0, l.6953
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6832
	l.s	$f2, 0($v0)
	add.s	$f4, $f0, $f2
	li	$v0, 0
	la	$v1, l.6268
	l.s	$f0, 0($v1)
	la	$v1, l.6268
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
	jal	add_mod5.2919
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	addi	$v1, $v0, 0
	lw	$t8, 0($sp)
	lw	$v0, 24($sp)
	lw	$a0, 12($sp)
	l.s	$f0, 8($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9385:
	jr	$ra
calc_dirvec_rows.6039:
	lw	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9387
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
	la	$v0, l.6953
	l.s	$f2, 0($v0)
	mul.s	$f0, $f0, $f2
	la	$v0, l.6955
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
	jal	add_mod5.2919
	addi	$sp, $sp, -28
	lw	$ra, 24($sp)
	addi	$v1, $v0, 0
	lw	$v0, 8($sp)
	addi	$a0, $v0, 4
	lw	$t8, 0($sp)
	lw	$v0, 20($sp)
	lw	$s7, ($t8)
	jr	$s7
ble_else.9387:
	jr	$ra
create_dirvec.6057:
	lw	$v0, 4($t8)
	li	$v1, 3
	la	$a0, l.6268
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
create_dirvec_elements.6065:
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.9389
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
ble_else.9389:
	jr	$ra
create_dirvecs.6074:
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9391
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
ble_else.9391:
	jr	$ra
init_dirvec_constants.6087:
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.9393
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
ble_else.9393:
	jr	$ra
init_vecset_constants.6095:
	lw	$v1, 8($t8)
	lw	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v0, ble_else.9395
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
ble_else.9395:
	jr	$ra
init_dirvecs.6103:
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
add_reflection.6112:
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
	jal	d_vec.3509
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	l.s	$f0, 28($sp)
	l.s	$f2, 24($sp)
	l.s	$f4, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	vecset.2925
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
setup_rect_reflection.6125:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sll	$v0, $v0, 2
	lw	$a3, 0($a0)
	la	$t0, l.6266
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
	jal	o_diffuse.3291
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
setup_surface_reflection.6166:
	lw	$a0, 12($t8)
	lw	$a1, 8($t8)
	lw	$a2, 4($t8)
	sll	$v0, $v0, 2
	addi	$v0, $v0, 1
	lw	$a3, 0($a0)
	la	$t0, l.6266
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
	jal	o_diffuse.3291
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	l.s	$f2, 24($sp)
	sub.s	$f0, $f2, $f0
	lw	$v0, 20($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_abc.3236
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	addi	$v1, $v0, 0
	lw	$v0, 16($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	veciprod.2995
	addi	$sp, $sp, -36
	lw	$ra, 32($sp)
	la	$v0, l.6280
	l.s	$f2, 0($v0)
	lw	$v0, 20($sp)
	s.s	$f0, 32($sp)
	s.s	$f2, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_a.3194
	addi	$sp, $sp, -44
	lw	$ra, 40($sp)
	l.s	$f2, 36($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 32($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 16($sp)
	l.s	$f4, 0($v0)
	sub.s	$f0, $f0, $f4
	la	$v1, l.6280
	l.s	$f4, 0($v1)
	lw	$v1, 20($sp)
	s.s	$f0, 40($sp)
	s.s	$f4, 44($sp)
	addi	$v0, $v1, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_b.3208
	addi	$sp, $sp, -52
	lw	$ra, 48($sp)
	l.s	$f2, 44($sp)
	mul.s	$f0, $f2, $f0
	l.s	$f2, 32($sp)
	mul.s	$f0, $f0, $f2
	lw	$v0, 16($sp)
	l.s	$f4, 4($v0)
	sub.s	$f0, $f0, $f4
	la	$v1, l.6280
	l.s	$f4, 0($v1)
	lw	$v1, 20($sp)
	s.s	$f0, 48($sp)
	s.s	$f4, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_c.3222
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
setup_reflections.6205:
	lw	$v1, 12($t8)
	lw	$a0, 8($t8)
	lw	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.9400
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
	jal	o_reflectiontype.3155
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 2
	bne	$v0, $v1, beq_else.9401
	lw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_diffuse.3291
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	la	$v0, l.6266
	l.s	$f2, 0($v0)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fless
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.9402
	jr	$ra
beq_else.9402:
	lw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_form.3142
	addi	$sp, $sp, -20
	lw	$ra, 16($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.9404
	lw	$t8, 8($sp)
	lw	$v0, 4($sp)
	lw	$v1, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9404:
	li	$v1, 2
	bne	$v0, $v1, beq_else.9405
	lw	$t8, 0($sp)
	lw	$v0, 4($sp)
	lw	$v1, 12($sp)
	lw	$s7, ($t8)
	jr	$s7
beq_else.9405:
	jr	$ra
beq_else.9401:
	jr	$ra
ble_else.9400:
	jr	$ra
rt.6218:
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
	la	$v1, l.7004
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
	jal	d_vec.3509
	addi	$sp, $sp, -68
	lw	$ra, 64($sp)
	lw	$v1, 20($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	veccpy.2946
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
	mov.d	$f12, $f0
	li	$v0, 2
	syscall
	jr	$ra
min_caml_print_float:
	mov.d	$f12, $f0
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
	#align 8する必要はない
	#andi	$a1, $gp, 4
	#beq	$a1, $a2, create_array_exit
	#addi	$gp, $gp, 4
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
	#andi	$a1, $gp, 4
	#beq	$a1, $a2, create_float_array_exit
	#addi	$gp, $gp, 4
create_float_array_exit:
	jr	$ra
create_float_array_cont:
	s.s	$f0, ($gp) #ここがちがうだけ
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
	li	$v0, 6
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
	li	$v0, 7
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
	li	$v0, 8
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
	li	$v0, 9
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
	li	$v0, 6
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
	li	$v0, 7
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
	li	$v0, 8
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
	li	$v0, 9
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


