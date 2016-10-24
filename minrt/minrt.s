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
l.6437:	# 128.000000
	.word	0x43000000
l.6404:	# 0.900000
	.word	0x3f666666
l.6403:	# 0.200000
	.word	0x3e4ccccd
l.6309:	# -150.000000
	.word	0xc3160000
l.6307:	# 150.000000
	.word	0x43160000
l.6299:	# 0.100000
	.word	0x3dcccccd
l.6296:	# -2.000000
	.word	0xc0000000
l.6293:	# 0.003906
	.word	0x3b800000
l.6265:	# 0.300000
	.word	0x3e99999a
l.6264:	# 0.500000
	.word	0x3f000000
l.6263:	# 0.150000
	.word	0x3e19999a
l.6261:	# 15.000000
	.word	0x41700000
l.6260:	# 30.000000
	.word	0x41f00000
l.6259:	# 0.000100
	.word	0x38d1b717
l.6254:	# 3.141593
	.word	0x40490fdb
l.6249:	# 0.250000
	.word	0x3e800000
l.6246:	# 255.000000
	.word	0x437f0000
l.6244:	# 10.000000
	.word	0x41200000
l.6243:	# 20.000000
	.word	0x41a00000
l.6242:	# 0.050000
	.word	0x3d4ccccd
l.6200:	# 100000000.000000
	.word	0x4cbebc20
l.6196:	# 1000000000.000000
	.word	0x4e6e6b28
l.6176:	# -0.100000
	.word	0xbdcccccd
l.6164:	# 0.010000
	.word	0x3c23d70a
l.6162:	# -0.200000
	.word	0xbe4ccccd
l.5971:	# 2.000000
	.word	0x40000000
l.5937:	# -200.000000
	.word	0xc3480000
l.5935:	# 200.000000
	.word	0x43480000
l.5931:	# 0.017453
	.word	0x3c8efa35
l.5848:	# 0.000000
	.word	0x00000000
l.5847:	# 1.000000
	.word	0x3f800000
l.5846:	# -1.000000
	.word	0xbf800000
.text
.globl	main
main:
	sw	$ra, 4($sp)
	sw	$fp, 8($sp)
	addi	$sp, $sp, 24
	addi	$fp, $sp, 0
	li	$v0, 1
	li	$v1, 0
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_array
	addi	$sp, $sp, -4
	lwr	$ra, 0($sp)
	li	$v1, 0
	l.sl	$f0, l.5848
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
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
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_create_float_array
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_create_float_array
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 1
	l.sl	$f0, l.6246
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_create_float_array
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 50
	li	$a0, 1
	li	$a1, -1
	sw	$v0, 20($sp)
	sw	$v1, 24($sp)
	addi	$v1, $a1, 0
	addi	$v0, $a0, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_array
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_array
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 1
	li	$a0, 1
	lwr	$a1, 0($v0)
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
	l.sl	$f0, l.5848
	sw	$v0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_create_float_array
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 40($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_array
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 1
	l.sl	$f0, l.6196
	sw	$v0, 44($sp)
	addi	$v0, $v1, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_create_float_array
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 48($sp)
	addi	$v0, $v1, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_create_float_array
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 52($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_create_array
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 56($sp)
	addi	$v0, $v1, 0
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_create_float_array
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 60($sp)
	addi	$v0, $v1, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_create_float_array
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 64($sp)
	addi	$v0, $v1, 0
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_create_float_array
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 68($sp)
	addi	$v0, $v1, 0
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_create_float_array
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	li	$v1, 2
	li	$a0, 0
	sw	$v0, 72($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_create_array
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	li	$v1, 2
	li	$a0, 0
	sw	$v0, 76($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	min_caml_create_array
	addi	$sp, $sp, -84
	lwr	$ra, 80($sp)
	li	$v1, 1
	l.sl	$f0, l.5848
	sw	$v0, 80($sp)
	addi	$v0, $v1, 0
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_create_float_array
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 84($sp)
	addi	$v0, $v1, 0
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	min_caml_create_float_array
	addi	$sp, $sp, -92
	lwr	$ra, 88($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 88($sp)
	addi	$v0, $v1, 0
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_create_float_array
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 92($sp)
	addi	$v0, $v1, 0
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_create_float_array
	addi	$sp, $sp, -100
	lwr	$ra, 96($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 96($sp)
	addi	$v0, $v1, 0
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_create_float_array
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 100($sp)
	addi	$v0, $v1, 0
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	min_caml_create_float_array
	addi	$sp, $sp, -108
	lwr	$ra, 104($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 104($sp)
	addi	$v0, $v1, 0
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_create_float_array
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	li	$v1, 0
	l.sl	$f0, l.5848
	sw	$v0, 108($sp)
	addi	$v0, $v1, 0
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_create_float_array
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	addi	$v1, $v0, 0
	li	$v0, 0
	sw	$v1, 112($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_array
	addi	$sp, $sp, -120
	lwr	$ra, 116($sp)
	li	$v1, 0
	addi	$a0, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($a0)
	lwr	$v0, 112($sp)
	sw	$v0, 0($a0)
	addi	$v0, $a0, 0
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_array
	addi	$sp, $sp, -120
	lwr	$ra, 116($sp)
	addi	$v1, $v0, 0
	li	$v0, 5
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_array
	addi	$sp, $sp, -120
	lwr	$ra, 116($sp)
	li	$v1, 0
	l.sl	$f0, l.5848
	sw	$v0, 116($sp)
	addi	$v0, $v1, 0
	sw	$ra, 120($sp)
	addi	$sp, $sp, 124
	jal	min_caml_create_float_array
	addi	$sp, $sp, -124
	lwr	$ra, 120($sp)
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 120($sp)
	addi	$v0, $v1, 0
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_create_float_array
	addi	$sp, $sp, -128
	lwr	$ra, 124($sp)
	li	$v1, 60
	lwr	$a0, 120($sp)
	sw	$v0, 124($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	min_caml_create_array
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	sw	$v0, 4($v1)
	lwr	$v0, 124($sp)
	sw	$v0, 0($v1)
	addi	$v0, $v1, 0
	li	$v1, 0
	l.sl	$f0, l.5848
	sw	$v0, 128($sp)
	addi	$v0, $v1, 0
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_create_float_array
	addi	$sp, $sp, -136
	lwr	$ra, 132($sp)
	addi	$v1, $v0, 0
	li	$v0, 0
	sw	$v1, 132($sp)
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
	li	$v1, 180
	li	$a0, 0
	l.sl	$f0, l.5848
	addi	$a1, $gp, 0
	addi	$gp, $gp, 12
	s.s	$f0, 8($a1)
	sw	$v0, 4($a1)
	sw	$a0, 0($a1)
	addi	$v0, $a1, 0
	addi	$s7, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $s7, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	min_caml_create_array
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	li	$v1, 1
	li	$a0, 0
	sw	$v0, 136($sp)
	addi	$v0, $v1, 0
	addi	$v1, $a0, 0
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_create_array
	addi	$sp, $sp, -144
	lwr	$ra, 140($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 24
	la	$a0, read_screen_settings.3115
	sw	$a0, 0($v1)
	lwr	$a0, 12($sp)
	sw	$a0, 20($v1)
	lwr	$a1, 104($sp)
	sw	$a1, 16($v1)
	lwr	$a2, 100($sp)
	sw	$a2, 12($v1)
	lwr	$a3, 96($sp)
	sw	$a3, 8($v1)
	lwr	$t0, 8($sp)
	sw	$t0, 4($v1)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$t1, read_light.3192
	sw	$t1, 0($t0)
	lwr	$t1, 16($sp)
	sw	$t1, 8($t0)
	lwr	$t2, 20($sp)
	sw	$t2, 4($t0)
	addi	$t3, $gp, 0
	addi	$gp, $gp, 8
	la	$t4, read_nth_object.3331
	sw	$t4, 0($t3)
	lwr	$t4, 4($sp)
	sw	$t4, 4($t3)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, read_object.3461
	sw	$t6, 0($t5)
	sw	$t3, 8($t5)
	lwr	$t3, 0($sp)
	sw	$t3, 4($t5)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 8
	la	$t7, read_all_object.3469
	sw	$t7, 0($t6)
	sw	$t5, 4($t6)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 8
	la	$t7, read_and_network.3500
	sw	$t7, 0($t5)
	lwr	$t7, 28($sp)
	sw	$t7, 4($t5)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 24
	la	$s1, read_parameter.3511
	sw	$s1, 0($s0)
	sw	$v1, 20($s0)
	sw	$t0, 16($s0)
	sw	$t5, 12($s0)
	sw	$t6, 8($s0)
	lwr	$v1, 36($sp)
	sw	$v1, 4($s0)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t5, solver_rect_surface.3524
	sw	$t5, 0($t0)
	lwr	$t5, 40($sp)
	sw	$t5, 4($t0)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, solver_rect.3562
	sw	$s1, 0($t6)
	sw	$t0, 4($t6)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, solver_surface.3583
	sw	$s1, 0($t0)
	sw	$t5, 4($t0)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 8
	la	$s2, solver_second.3666
	sw	$s2, 0($s1)
	sw	$t5, 4($s1)
	addi	$s2, $gp, 0
	addi	$gp, $gp, 20
	la	$s3, solver.3706
	sw	$s3, 0($s2)
	sw	$t0, 16($s2)
	sw	$s1, 12($s2)
	sw	$t6, 8($s2)
	sw	$t4, 4($s2)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, solver_rect_fast.3726
	sw	$t6, 0($t0)
	sw	$t5, 4($t0)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, solver_surface_fast.3823
	sw	$s1, 0($t6)
	sw	$t5, 4($t6)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 8
	la	$s3, solver_second_fast.3846
	sw	$s3, 0($s1)
	sw	$t5, 4($s1)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 20
	la	$s4, solver_fast.3892
	sw	$s4, 0($s3)
	sw	$t6, 16($s3)
	sw	$s1, 12($s3)
	sw	$t0, 8($s3)
	sw	$t4, 4($s3)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, solver_surface_fast2.3915
	sw	$s1, 0($t6)
	sw	$t5, 4($t6)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 8
	la	$s4, solver_second_fast2.3933
	sw	$s4, 0($s1)
	sw	$t5, 4($s1)
	addi	$s4, $gp, 0
	addi	$gp, $gp, 20
	la	$s5, solver_fast2.3977
	sw	$s5, 0($s4)
	sw	$t6, 16($s4)
	sw	$s1, 12($s4)
	sw	$t0, 8($s4)
	sw	$t4, 4($s4)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, iter_setup_dirvec_constants.4188
	sw	$t6, 0($t0)
	sw	$t4, 4($t0)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 12
	la	$s1, setup_dirvec_constants.4204
	sw	$s1, 0($t6)
	sw	$t3, 8($t6)
	sw	$t0, 4($t6)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, setup_startp_constants.4210
	sw	$s1, 0($t0)
	sw	$t4, 4($t0)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 16
	la	$s5, setup_startp.4260
	sw	$s5, 0($s1)
	lwr	$s5, 92($sp)
	sw	$s5, 12($s1)
	sw	$t0, 8($s1)
	sw	$t3, 4($s1)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$s6, check_all_inside.4325
	sw	$s6, 0($t0)
	sw	$t4, 4($t0)
	addi	$s6, $gp, 0
	addi	$gp, $gp, 32
	la	$s7, shadow_check_and_group.4339
	sw	$s7, 0($s6)
	sw	$s3, 28($s6)
	sw	$t5, 24($s6)
	sw	$t4, 20($s6)
	lwr	$s7, 128($sp)
	sw	$s7, 16($s6)
	sw	$t1, 12($s6)
	lwr	$t8, 52($sp)
	sw	$t8, 8($s6)
	sw	$t0, 4($s6)
	sw	$s0, 140($sp)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 12
	sw	$t6, 144($sp)
	la	$t6, shadow_check_one_or_group.4383
	sw	$t6, 0($s0)
	sw	$s6, 8($s0)
	sw	$t7, 4($s0)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 24
	la	$s6, shadow_check_one_or_matrix.4395
	sw	$s6, 0($t6)
	sw	$s3, 20($t6)
	sw	$t5, 16($t6)
	sw	$s0, 12($t6)
	sw	$s7, 8($t6)
	sw	$t8, 4($t6)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 40
	la	$s3, solve_each_element.4423
	sw	$s3, 0($s0)
	lwr	$s3, 48($sp)
	sw	$s3, 36($s0)
	lwr	$s6, 88($sp)
	sw	$s6, 32($s0)
	sw	$t5, 28($s0)
	sw	$s2, 24($s0)
	sw	$t4, 20($s0)
	lwr	$s7, 44($sp)
	sw	$s7, 16($s0)
	sw	$t8, 12($s0)
	lwr	$t3, 56($sp)
	sw	$t3, 8($s0)
	sw	$t0, 4($s0)
	addi	$a2, $gp, 0
	addi	$gp, $gp, 12
	la	$a1, solve_one_or_network.4478
	sw	$a1, 0($a2)
	sw	$s0, 8($a2)
	sw	$t7, 4($a2)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 24
	la	$s0, trace_or_matrix.4490
	sw	$s0, 0($a1)
	sw	$s3, 20($a1)
	sw	$s6, 16($a1)
	sw	$t5, 12($a1)
	sw	$s2, 8($a1)
	sw	$a2, 4($a1)
	addi	$a2, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, judge_intersection.4513
	sw	$s0, 0($a2)
	sw	$a1, 12($a2)
	sw	$s3, 8($a2)
	sw	$v1, 4($a2)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 40
	la	$s0, solve_each_element_fast.4528
	sw	$s0, 0($a1)
	sw	$s3, 36($a1)
	sw	$s5, 32($a1)
	sw	$s4, 28($a1)
	sw	$t5, 24($a1)
	sw	$t4, 20($a1)
	sw	$s7, 16($a1)
	sw	$t8, 12($a1)
	sw	$t3, 8($a1)
	sw	$t0, 4($a1)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 12
	la	$s0, solve_one_or_network_fast.4584
	sw	$s0, 0($t0)
	sw	$a1, 8($t0)
	sw	$t7, 4($t0)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 20
	la	$t7, trace_or_matrix_fast.4596
	sw	$t7, 0($a1)
	sw	$s3, 16($a1)
	sw	$s4, 12($a1)
	sw	$t5, 8($a1)
	sw	$t0, 4($a1)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 16
	la	$t5, judge_intersection_fast.4619
	sw	$t5, 0($t0)
	sw	$a1, 12($t0)
	sw	$s3, 8($t0)
	sw	$v1, 4($t0)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 12
	la	$t5, get_nvector_rect.4634
	sw	$t5, 0($a1)
	lwr	$t5, 60($sp)
	sw	$t5, 8($a1)
	sw	$s7, 4($a1)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 8
	la	$s0, get_nvector_plane.4646
	sw	$s0, 0($t7)
	sw	$t5, 4($t7)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 12
	la	$s2, get_nvector_second.4659
	sw	$s2, 0($s0)
	sw	$t5, 8($s0)
	sw	$t8, 4($s0)
	addi	$s2, $gp, 0
	addi	$gp, $gp, 16
	la	$s4, get_nvector.4714
	sw	$s4, 0($s2)
	sw	$s0, 12($s2)
	sw	$a1, 8($s2)
	sw	$t7, 4($s2)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 8
	la	$t7, utexture.4720
	sw	$t7, 0($a1)
	lwr	$t7, 64($sp)
	sw	$t7, 4($a1)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 12
	la	$s4, add_light.4877
	sw	$s4, 0($s0)
	sw	$t7, 8($s0)
	lwr	$s4, 72($sp)
	sw	$s4, 4($s0)
	addi	$s5, $gp, 0
	addi	$gp, $gp, 36
	la	$a3, trace_reflections.4903
	sw	$a3, 0($s5)
	sw	$t6, 32($s5)
	lwr	$a3, 136($sp)
	sw	$a3, 28($s5)
	sw	$v1, 24($s5)
	sw	$t5, 20($s5)
	sw	$t0, 16($s5)
	sw	$s7, 12($s5)
	sw	$t3, 8($s5)
	sw	$s0, 4($s5)
	addi	$a3, $gp, 0
	addi	$gp, $gp, 84
	la	$a0, trace_ray.4937
	sw	$a0, 0($a3)
	sw	$a1, 80($a3)
	sw	$s5, 76($a3)
	sw	$s3, 72($a3)
	sw	$t7, 68($a3)
	sw	$s6, 64($a3)
	sw	$t6, 60($a3)
	sw	$s1, 56($a3)
	sw	$s4, 52($a3)
	sw	$v1, 48($a3)
	sw	$t4, 44($a3)
	sw	$t5, 40($a3)
	sw	$v0, 36($a3)
	sw	$t1, 32($a3)
	sw	$a2, 28($a3)
	sw	$s7, 24($a3)
	sw	$t8, 20($a3)
	sw	$t3, 16($a3)
	sw	$s2, 12($a3)
	sw	$t2, 8($a3)
	sw	$s0, 4($a3)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 52
	la	$a2, trace_diffuse_ray.5055
	sw	$a2, 0($a0)
	sw	$a1, 48($a0)
	sw	$t7, 44($a0)
	sw	$t6, 40($a0)
	sw	$v1, 36($a0)
	sw	$t4, 32($a0)
	sw	$t5, 28($a0)
	sw	$t1, 24($a0)
	sw	$t0, 20($a0)
	sw	$t8, 16($a0)
	sw	$t3, 12($a0)
	sw	$s2, 8($a0)
	lwr	$v1, 68($sp)
	sw	$v1, 4($a0)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 8
	la	$a2, iter_trace_diffuse_rays.5079
	sw	$a2, 0($a1)
	sw	$a0, 4($a1)
	addi	$a0, $gp, 0
	addi	$gp, $gp, 12
	la	$a2, trace_diffuse_rays.5101
	sw	$a2, 0($a0)
	sw	$s1, 8($a0)
	sw	$a1, 4($a0)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 12
	la	$a2, trace_diffuse_ray_80percent.5107
	sw	$a2, 0($a1)
	sw	$a0, 8($a1)
	lwr	$a2, 116($sp)
	sw	$a2, 4($a1)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 16
	la	$t2, calc_diffuse_using_1point.5130
	sw	$t2, 0($t0)
	sw	$a1, 12($t0)
	sw	$s4, 8($t0)
	sw	$v1, 4($t0)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 12
	la	$t2, calc_diffuse_using_5points.5144
	sw	$t2, 0($a1)
	sw	$s4, 8($a1)
	sw	$v1, 4($a1)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$t3, do_without_neighbors.5177
	sw	$t3, 0($t2)
	sw	$t0, 4($t2)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 8
	la	$t3, neighbors_exist.5190
	sw	$t3, 0($t0)
	lwr	$t3, 76($sp)
	sw	$t3, 4($t0)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 12
	la	$t6, try_exploit_neighbors.5228
	sw	$t6, 0($t5)
	sw	$t2, 8($t5)
	sw	$a1, 4($t5)
	addi	$a1, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, write_ppm_header.5248
	sw	$t6, 0($a1)
	sw	$t3, 4($a1)
	addi	$t6, $gp, 0
	addi	$gp, $gp, 8
	la	$t7, write_rgb.5277
	sw	$t7, 0($t6)
	sw	$s4, 4($t6)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, pretrace_diffuse_rays.5293
	sw	$s0, 0($t7)
	sw	$a0, 12($t7)
	sw	$a2, 8($t7)
	sw	$v1, 4($t7)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 40
	la	$a0, pretrace_pixels.5315
	sw	$a0, 0($v1)
	lwr	$a0, 12($sp)
	sw	$a0, 36($v1)
	sw	$a3, 32($v1)
	sw	$s6, 28($v1)
	lwr	$a0, 96($sp)
	sw	$a0, 24($v1)
	lwr	$a0, 84($sp)
	sw	$a0, 20($v1)
	sw	$s4, 16($v1)
	lwr	$a3, 108($sp)
	sw	$a3, 12($v1)
	sw	$t7, 8($v1)
	lwr	$a3, 80($sp)
	sw	$a3, 4($v1)
	addi	$t7, $gp, 0
	addi	$gp, $gp, 28
	la	$s0, pretrace_line.5369
	sw	$s0, 0($t7)
	lwr	$s0, 104($sp)
	sw	$s0, 24($t7)
	lwr	$s0, 100($sp)
	sw	$s0, 20($t7)
	sw	$a0, 16($t7)
	sw	$v1, 12($t7)
	sw	$t3, 8($t7)
	sw	$a3, 4($t7)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 28
	la	$s0, scan_pixel.5402
	sw	$s0, 0($v1)
	sw	$t6, 24($v1)
	sw	$t5, 20($v1)
	sw	$s4, 16($v1)
	sw	$t0, 12($v1)
	sw	$t3, 8($v1)
	sw	$t2, 4($v1)
	addi	$t0, $gp, 0
	addi	$gp, $gp, 16
	la	$t2, scan_line.5423
	sw	$t2, 0($t0)
	sw	$v1, 12($t0)
	sw	$t7, 8($t0)
	sw	$t3, 4($t0)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 8
	la	$t2, create_pixelline.5502
	sw	$t2, 0($v1)
	sw	$t3, 4($v1)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$t5, calc_dirvec.5529
	sw	$t5, 0($t2)
	sw	$a2, 4($t2)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, calc_dirvecs.5589
	sw	$t6, 0($t5)
	sw	$t2, 4($t5)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, calc_dirvec_rows.5619
	sw	$t6, 0($t2)
	sw	$t5, 4($t2)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 8
	la	$t6, create_dirvec.5637
	sw	$t6, 0($t5)
	lwr	$t6, 0($sp)
	sw	$t6, 4($t5)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s1, create_dirvec_elements.5645
	sw	$s1, 0($s0)
	sw	$t5, 4($s0)
	addi	$s1, $gp, 0
	addi	$gp, $gp, 16
	la	$s2, create_dirvecs.5654
	sw	$s2, 0($s1)
	sw	$a2, 12($s1)
	sw	$s0, 8($s1)
	sw	$t5, 4($s1)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 8
	la	$s2, init_dirvec_constants.5667
	sw	$s2, 0($s0)
	lwr	$s2, 144($sp)
	sw	$s2, 4($s0)
	addi	$s3, $gp, 0
	addi	$gp, $gp, 12
	la	$s4, init_vecset_constants.5675
	sw	$s4, 0($s3)
	sw	$s0, 8($s3)
	sw	$a2, 4($s3)
	addi	$a2, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, init_dirvecs.5683
	sw	$s0, 0($a2)
	sw	$s3, 12($a2)
	sw	$s1, 8($a2)
	sw	$t2, 4($a2)
	addi	$t2, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, add_reflection.5692
	sw	$s0, 0($t2)
	sw	$s2, 12($t2)
	lwr	$s0, 136($sp)
	sw	$s0, 8($t2)
	sw	$t5, 4($t2)
	addi	$t5, $gp, 0
	addi	$gp, $gp, 16
	la	$s0, setup_rect_reflection.5705
	sw	$s0, 0($t5)
	sw	$v0, 12($t5)
	sw	$t1, 8($t5)
	sw	$t2, 4($t5)
	addi	$s0, $gp, 0
	addi	$gp, $gp, 16
	la	$s1, setup_surface_reflection.5746
	sw	$s1, 0($s0)
	sw	$v0, 12($s0)
	sw	$t1, 8($s0)
	sw	$t2, 4($s0)
	addi	$v0, $gp, 0
	addi	$gp, $gp, 16
	la	$t2, setup_reflections.5785
	sw	$t2, 0($v0)
	sw	$s0, 12($v0)
	sw	$t5, 8($v0)
	sw	$t4, 4($v0)
	addi	$t8, $gp, 0
	addi	$gp, $gp, 60
	la	$t2, rt.5798
	sw	$t2, 0($t8)
	sw	$a1, 56($t8)
	sw	$v0, 52($t8)
	sw	$s2, 48($t8)
	sw	$a0, 44($t8)
	sw	$t0, 40($t8)
	lwr	$v0, 140($sp)
	sw	$v0, 36($t8)
	sw	$t7, 32($t8)
	sw	$t6, 28($t8)
	lwr	$v0, 128($sp)
	sw	$v0, 24($t8)
	sw	$t1, 20($t8)
	sw	$a2, 16($t8)
	sw	$t3, 12($t8)
	sw	$a3, 8($t8)
	sw	$v1, 4($t8)
	li	$v0, 512
	li	$v1, 512
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	move	$sp, $fp
	subi	$sp, $sp, 24
	lwr	$ra, 4($sp)
	lwr	$fp, 8($sp)
	li	$v0, 0
	exit
sgn.2489:
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fiszero
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8296
	l.sr	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_fispos
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8297
	l.sl	$f0, l.5846
	jr	$ra
beq_else.8297:
	l.sl	$f0, l.5847
	jr	$ra
beq_else.8296:
	l.sl	$f0, l.5848
	jr	$ra
fneg_cond.2495:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8298
	j	min_caml_fneg
beq_else.8298:
	mov.s	$f0, $f0
	jr	$ra
add_mod5.2499:
	add	$v0, $v0, $v1
	li	$v1, 5
	bgt	$v1, $v0, ble_else.8299
	addi	$v0, $v0, -5
	jr	$ra
ble_else.8299:
	jr	$ra
vecset.2505:
	s.s	$f0, 0($v0)
	s.s	$f1, 4($v0)
	s.s	$f2, 8($v0)
	jr	$ra
vecfill.2515:
	s.s	$f0, 0($v0)
	s.s	$f0, 4($v0)
	s.s	$f0, 8($v0)
	jr	$ra
vecbzero.2523:
	l.sl	$f0, l.5848
	j	vecfill.2515
veccpy.2526:
	l.sr	$f0, 0($v1)
	s.s	$f0, 0($v0)
	l.sr	$f0, 4($v1)
	s.s	$f0, 4($v0)
	l.sr	$f0, 8($v1)
	s.s	$f0, 8($v0)
	jr	$ra
vecunit_sgn.2540:
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
	bne	$v0, $v1, beq_else.8303
	li	$v0, 0
	lwr	$v1, 0($sp)
	bne	$v1, $v0, beq_else.8305
	l.sl	$f0, l.5847
	l.sr	$f1, 16($sp)
	div.s	$f0, $f0, $f1
	j	beq_cont.8306
beq_else.8305:
	l.sl	$f0, l.5846
	l.sr	$f1, 16($sp)
	div.s	$f0, $f0, $f1
beq_cont.8306:
	j	beq_cont.8304
beq_else.8303:
	l.sl	$f0, l.5847
beq_cont.8304:
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
veciprod.2575:
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
veciprod2.2594:
	l.sr	$f3, 0($v0)
	mul.s	$f0, $f3, $f0
	l.sr	$f3, 4($v0)
	mul.s	$f1, $f3, $f1
	add.s	$f0, $f0, $f1
	l.sr	$f1, 8($v0)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	jr	$ra
vecaccum.2609:
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
vecadd.2636:
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
vecscale.2659:
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
vecaccumv.2676:
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
o_texturetype.2709:
	lwr	$v0, 0($v0)
	jr	$ra
o_form.2722:
	lwr	$v0, 4($v0)
	jr	$ra
o_reflectiontype.2735:
	lwr	$v0, 8($v0)
	jr	$ra
o_isinvert.2748:
	lwr	$v0, 24($v0)
	jr	$ra
o_isrot.2761:
	lwr	$v0, 12($v0)
	jr	$ra
o_param_a.2774:
	lwr	$v0, 16($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_param_b.2788:
	lwr	$v0, 16($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_param_c.2802:
	lwr	$v0, 16($v0)
	l.sr	$f0, 8($v0)
	jr	$ra
o_param_abc.2816:
	lwr	$v0, 16($v0)
	jr	$ra
o_param_x.2829:
	lwr	$v0, 20($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_param_y.2843:
	lwr	$v0, 20($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_param_z.2857:
	lwr	$v0, 20($v0)
	l.sr	$f0, 8($v0)
	jr	$ra
o_diffuse.2871:
	lwr	$v0, 28($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_hilight.2885:
	lwr	$v0, 28($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_color_red.2899:
	lwr	$v0, 32($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_color_green.2913:
	lwr	$v0, 32($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_color_blue.2927:
	lwr	$v0, 32($v0)
	l.sr	$f0, 8($v0)
	jr	$ra
o_param_r1.2941:
	lwr	$v0, 36($v0)
	l.sr	$f0, 0($v0)
	jr	$ra
o_param_r2.2955:
	lwr	$v0, 36($v0)
	l.sr	$f0, 4($v0)
	jr	$ra
o_param_r3.2969:
	lwr	$v0, 36($v0)
	l.sr	$f0, 8($v0)
	jr	$ra
o_param_ctbl.2983:
	lwr	$v0, 40($v0)
	jr	$ra
p_rgb.2996:
	lwr	$v0, 0($v0)
	jr	$ra
p_intersection_points.3006:
	lwr	$v0, 4($v0)
	jr	$ra
p_surface_ids.3016:
	lwr	$v0, 8($v0)
	jr	$ra
p_calc_diffuse.3026:
	lwr	$v0, 12($v0)
	jr	$ra
p_energy.3036:
	lwr	$v0, 16($v0)
	jr	$ra
p_received_ray_20percent.3046:
	lwr	$v0, 20($v0)
	jr	$ra
p_group_id.3056:
	lwr	$v0, 24($v0)
	lwr	$v0, 0($v0)
	jr	$ra
p_set_group_id.3067:
	lwr	$v0, 24($v0)
	sw	$v1, 0($v0)
	jr	$ra
p_nvectors.3079:
	lwr	$v0, 28($v0)
	jr	$ra
d_vec.3089:
	lwr	$v0, 0($v0)
	jr	$ra
d_const.3093:
	lwr	$v0, 4($v0)
	jr	$ra
r_surface_id.3097:
	lwr	$v0, 0($v0)
	jr	$ra
r_dvec.3102:
	lwr	$v0, 4($v0)
	jr	$ra
r_bright.3107:
	l.sr	$f0, 8($v0)
	mov.s	$f0, $f0
	jr	$ra
rad.3112:
	l.sl	$f1, l.5931
	mul.s	$f0, $f0, $f1
	jr	$ra
read_screen_settings.3115:
	lwr	$v0, 20($t8)
	lwr	$v1, 16($t8)
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sw	$v0, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	sw	$v1, 12($sp)
	sw	$a2, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 16($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 16($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 16($sp)
	s.s	$f0, 8($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	rad.3112
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_cos
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 20($sp)
	s.s	$f0, 24($sp)
	mov.s	$f0, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_sin
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_read_float
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	rad.3112
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_cos
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	s.s	$f0, 36($sp)
	mov.s	$f0, $f1
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_sin
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f2, $f1, $f0
	l.sl	$f3, l.5935
	mul.s	$f2, $f2, $f3
	lwr	$v0, 12($sp)
	s.s	$f2, 0($v0)
	l.sl	$f2, l.5937
	l.sr	$f3, 28($sp)
	mul.s	$f2, $f3, $f2
	s.s	$f2, 4($v0)
	l.sr	$f2, 36($sp)
	mul.s	$f4, $f1, $f2
	l.sl	$f5, l.5935
	mul.s	$f4, $f4, $f5
	s.s	$f4, 8($v0)
	lwr	$v1, 8($sp)
	s.s	$f2, 0($v1)
	l.sl	$f4, l.5848
	s.s	$f4, 4($v1)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fneg
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 8($v0)
	l.sr	$f0, 28($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fneg
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 4($sp)
	s.s	$f0, 0($v0)
	l.sr	$f0, 24($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fneg
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 28($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fneg
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 36($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 4($sp)
	s.s	$f0, 8($v0)
	lwr	$v0, 16($sp)
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
read_light.3192:
	lwr	$v0, 8($t8)
	lwr	$v1, 4($t8)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_read_int
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_read_float
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	rad.3112
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_sin
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fneg
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_read_float
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	rad.3112
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	l.sr	$f1, 8($sp)
	s.s	$f0, 12($sp)
	mov.s	$f0, $f1
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_cos
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sr	$f1, 12($sp)
	s.s	$f0, 16($sp)
	mov.s	$f0, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_sin
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 0($v0)
	l.sr	$f0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_cos
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 8($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	jr	$ra
rotate_quadratic_matrix.3218:
	l.sr	$f0, 0($v1)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_cos
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	l.sr	$f1, 0($v0)
	s.s	$f0, 8($sp)
	mov.s	$f0, $f1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_sin
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v0, 4($sp)
	l.sr	$f1, 4($v0)
	s.s	$f0, 12($sp)
	mov.s	$f0, $f1
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_cos
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 4($sp)
	l.sr	$f1, 4($v0)
	s.s	$f0, 16($sp)
	mov.s	$f0, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_sin
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 4($sp)
	l.sr	$f1, 8($v0)
	s.s	$f0, 20($sp)
	mov.s	$f0, $f1
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_cos
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v0, 4($sp)
	l.sr	$f1, 8($v0)
	s.s	$f0, 24($sp)
	mov.s	$f0, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_sin
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 16($sp)
	l.sr	$f2, 24($sp)
	mul.s	$f3, $f1, $f2
	l.sr	$f4, 12($sp)
	l.sr	$f5, 20($sp)
	mul.s	$f6, $f4, $f5
	mul.s	$f6, $f6, $f2
	l.sr	$f7, 8($sp)
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
	s.s	$f0, 28($sp)
	s.s	$f8, 32($sp)
	s.s	$f10, 36($sp)
	s.s	$f6, 40($sp)
	s.s	$f9, 44($sp)
	s.s	$f3, 48($sp)
	mov.s	$f0, $f5
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 12($sp)
	l.sr	$f2, 16($sp)
	mul.s	$f1, $f1, $f2
	l.sr	$f3, 8($sp)
	mul.s	$f2, $f3, $f2
	lwr	$v0, 0($sp)
	l.sr	$f3, 0($v0)
	l.sr	$f4, 4($v0)
	l.sr	$f5, 8($v0)
	l.sr	$f6, 48($sp)
	s.s	$f2, 52($sp)
	s.s	$f1, 56($sp)
	s.s	$f5, 60($sp)
	s.s	$f0, 64($sp)
	s.s	$f4, 68($sp)
	s.s	$f3, 72($sp)
	mov.s	$f0, $f6
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fsqr
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	l.sr	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 44($sp)
	s.s	$f0, 76($sp)
	mov.s	$f0, $f2
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	min_caml_fsqr
	addi	$sp, $sp, -84
	lwr	$ra, 80($sp)
	l.sr	$f1, 68($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 76($sp)
	add.s	$f0, $f2, $f0
	l.sr	$f2, 64($sp)
	s.s	$f0, 80($sp)
	mov.s	$f0, $f2
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fsqr
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	l.sr	$f1, 60($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 80($sp)
	add.s	$f0, $f2, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	l.sr	$f0, 40($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fsqr
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	l.sr	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 36($sp)
	s.s	$f0, 84($sp)
	mov.s	$f0, $f2
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	min_caml_fsqr
	addi	$sp, $sp, -92
	lwr	$ra, 88($sp)
	l.sr	$f1, 68($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 84($sp)
	add.s	$f0, $f2, $f0
	l.sr	$f2, 56($sp)
	s.s	$f0, 88($sp)
	mov.s	$f0, $f2
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	l.sr	$f1, 60($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 88($sp)
	add.s	$f0, $f2, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 32($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	l.sr	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 28($sp)
	s.s	$f0, 92($sp)
	mov.s	$f0, $f2
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_fsqr
	addi	$sp, $sp, -100
	lwr	$ra, 96($sp)
	l.sr	$f1, 68($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 92($sp)
	add.s	$f0, $f2, $f0
	l.sr	$f2, 52($sp)
	s.s	$f0, 96($sp)
	mov.s	$f0, $f2
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fsqr
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	l.sr	$f1, 60($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f2, 96($sp)
	add.s	$f0, $f2, $f0
	lwr	$v0, 0($sp)
	s.s	$f0, 8($v0)
	l.sl	$f0, l.5971
	l.sr	$f2, 72($sp)
	l.sr	$f3, 40($sp)
	mul.s	$f4, $f2, $f3
	l.sr	$f5, 32($sp)
	mul.s	$f4, $f4, $f5
	l.sr	$f6, 68($sp)
	l.sr	$f7, 36($sp)
	mul.s	$f8, $f6, $f7
	l.sr	$f9, 28($sp)
	mul.s	$f8, $f8, $f9
	add.s	$f4, $f4, $f8
	l.sr	$f8, 56($sp)
	mul.s	$f10, $f1, $f8
	l.sr	$f11, 52($sp)
	mul.s	$f10, $f10, $f11
	add.s	$f4, $f4, $f10
	mul.s	$f0, $f0, $f4
	lwr	$v0, 4($sp)
	s.s	$f0, 0($v0)
	l.sl	$f0, l.5971
	l.sr	$f4, 48($sp)
	mul.s	$f10, $f2, $f4
	mul.s	$f5, $f10, $f5
	l.sr	$f10, 44($sp)
	mul.s	$f12, $f6, $f10
	mul.s	$f9, $f12, $f9
	add.s	$f5, $f5, $f9
	l.sr	$f9, 64($sp)
	mul.s	$f12, $f1, $f9
	mul.s	$f11, $f12, $f11
	add.s	$f5, $f5, $f11
	mul.s	$f0, $f0, $f5
	s.s	$f0, 4($v0)
	l.sl	$f0, l.5971
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
read_nth_object.3331:
	lwr	$v1, 4($t8)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_read_int
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v1, -1
	bne	$v0, $v1, beq_else.8316
	li	$v0, 0
	jr	$ra
beq_else.8316:
	sw	$v0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_read_int
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
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
	li	$v1, 3
	l.sl	$f0, l.5848
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_create_float_array
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	sw	$v0, 24($sp)
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
	li	$v1, 3
	l.sl	$f0, l.5848
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
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_read_float
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fisneg
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	li	$v1, 2
	l.sl	$f0, l.5848
	sw	$v0, 32($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_create_float_array
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	sw	$v0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_read_float
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$v0, 36($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_read_float
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	lwr	$v0, 36($sp)
	s.s	$f0, 4($v0)
	li	$v1, 3
	l.sl	$f0, l.5848
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
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 40($sp)
	s.s	$f0, 8($v0)
	li	$v1, 3
	l.sl	$f0, l.5848
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_float_array
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	lwr	$a0, 20($sp)
	sw	$v0, 44($sp)
	bne	$a0, $v1, beq_else.8317
	j	beq_cont.8318
beq_else.8317:
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_read_float
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	rad.3112
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	lwr	$v0, 44($sp)
	s.s	$f0, 0($v0)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_read_float
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	rad.3112
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	lwr	$v0, 44($sp)
	s.s	$f0, 4($v0)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_read_float
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	rad.3112
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	lwr	$v0, 44($sp)
	s.s	$f0, 8($v0)
beq_cont.8318:
	li	$v0, 2
	lwr	$v1, 12($sp)
	bne	$v1, $v0, beq_else.8319
	li	$v0, 1
	j	beq_cont.8320
beq_else.8319:
	lwr	$v0, 32($sp)
beq_cont.8320:
	li	$v1, 4
	l.sl	$f0, l.5848
	sw	$v0, 48($sp)
	addi	$v0, $v1, 0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_create_float_array
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	addi	$v1, $gp, 0
	addi	$gp, $gp, 44
	sw	$v0, 40($v1)
	lwr	$v0, 44($sp)
	sw	$v0, 36($v1)
	lwr	$a0, 40($sp)
	sw	$a0, 32($v1)
	lwr	$a0, 36($sp)
	sw	$a0, 28($v1)
	lwr	$a0, 48($sp)
	sw	$a0, 24($v1)
	lwr	$a0, 28($sp)
	sw	$a0, 20($v1)
	lwr	$a0, 24($sp)
	sw	$a0, 16($v1)
	lwr	$a1, 20($sp)
	sw	$a1, 12($v1)
	lwr	$a2, 16($sp)
	sw	$a2, 8($v1)
	lwr	$a2, 12($sp)
	sw	$a2, 4($v1)
	lwr	$a3, 8($sp)
	sw	$a3, 0($v1)
	lwr	$a3, 4($sp)
	sll	$a3, $a3, 2
	lwr	$t0, 0($sp)
	add	$t9, $t0, $a3
	sw	$v1, 0($t9)
	li	$v1, 3
	bne	$a2, $v1, beq_else.8321
	l.sr	$f0, 0($a0)
	s.s	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fiszero
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8323
	l.sr	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	sgn.2489
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 52($sp)
	s.s	$f0, 56($sp)
	mov.s	$f0, $f1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fsqr
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 56($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8324
beq_else.8323:
	l.sl	$f0, l.5848
beq_cont.8324:
	lwr	$v0, 24($sp)
	s.s	$f0, 0($v0)
	l.sr	$f0, 4($v0)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fiszero
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8325
	l.sr	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	sgn.2489
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 60($sp)
	s.s	$f0, 64($sp)
	mov.s	$f0, $f1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fsqr
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	l.sr	$f1, 64($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8326
beq_else.8325:
	l.sl	$f0, l.5848
beq_cont.8326:
	lwr	$v0, 24($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 8($v0)
	s.s	$f0, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_fiszero
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8327
	l.sr	$f0, 68($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	sgn.2489
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	l.sr	$f1, 68($sp)
	s.s	$f0, 72($sp)
	mov.s	$f0, $f1
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fsqr
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	l.sr	$f1, 72($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8328
beq_else.8327:
	l.sl	$f0, l.5848
beq_cont.8328:
	lwr	$v0, 24($sp)
	s.s	$f0, 8($v0)
	j	beq_cont.8322
beq_else.8321:
	li	$v1, 2
	bne	$a2, $v1, beq_else.8329
	li	$v1, 0
	lwr	$a2, 32($sp)
	bne	$a2, $v1, beq_else.8331
	li	$v1, 1
	j	beq_cont.8332
beq_else.8331:
	li	$v1, 0
beq_cont.8332:
	lwr	$v0, 24($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	vecunit_sgn.2540
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	j	beq_cont.8330
beq_else.8329:
beq_cont.8330:
beq_cont.8322:
	li	$v0, 0
	lwr	$v1, 20($sp)
	bne	$v1, $v0, beq_else.8333
	j	beq_cont.8334
beq_else.8333:
	lwr	$v0, 24($sp)
	lwr	$v1, 44($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	rotate_quadratic_matrix.3218
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
beq_cont.8334:
	li	$v0, 1
	jr	$ra
read_object.3461:
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	li	$a1, 60
	bgt	$a1, $v0, ble_else.8335
	jr	$ra
ble_else.8335:
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
	bne	$v0, $v1, beq_else.8337
	lwr	$v0, 8($sp)
	lwr	$v1, 4($sp)
	sw	$v0, 0($v1)
	jr	$ra
beq_else.8337:
	lwr	$v0, 8($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
read_all_object.3469:
	lwr	$t8, 4($t8)
	li	$v0, 0
	lwr	$s7, 0($t8)
	jr	$s7
read_net_item.3472:
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_read_int
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v1, -1
	bne	$v0, $v1, beq_else.8339
	lwr	$v0, 0($sp)
	addi	$v0, $v0, 1
	li	$v1, -1
	j	min_caml_create_array
beq_else.8339:
	lwr	$v1, 0($sp)
	addi	$a0, $v1, 1
	sw	$v0, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	read_net_item.3472
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 0($sp)
	sll	$v1, $v1, 2
	lwr	$a0, 4($sp)
	add	$t9, $v0, $v1
	sw	$a0, 0($t9)
	jr	$ra
read_or_network.3486:
	li	$v1, 0
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	read_net_item.3472
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 0($v1)
	li	$a0, -1
	bne	$v0, $a0, beq_else.8340
	lwr	$v0, 0($sp)
	addi	$v0, $v0, 1
	j	min_caml_create_array
beq_else.8340:
	lwr	$v0, 0($sp)
	addi	$a0, $v0, 1
	sw	$v1, 4($sp)
	addi	$v0, $a0, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	read_or_network.3486
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 0($sp)
	sll	$v1, $v1, 2
	lwr	$a0, 4($sp)
	add	$t9, $v0, $v1
	sw	$a0, 0($t9)
	jr	$ra
read_and_network.3500:
	lwr	$v1, 4($t8)
	li	$a0, 0
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$v0, 8($sp)
	addi	$v0, $a0, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_net_item.3472
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v1, 0($v0)
	li	$a0, -1
	bne	$v1, $a0, beq_else.8341
	jr	$ra
beq_else.8341:
	lwr	$v1, 8($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 4($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	addi	$v0, $v1, 1
	lwr	$t8, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
read_parameter.3511:
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
	jal	read_or_network.3486
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 0($v1)
	jr	$ra
solver_rect_surface.3524:
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
	bne	$v0, $v1, beq_else.8344
	lwr	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.2816
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v1, 32($sp)
	sw	$v0, 36($sp)
	addi	$v0, $v1, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isinvert.2748
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
	jal	fneg_cond.2495
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
	bne	$v0, $v1, beq_else.8345
	li	$v0, 0
	jr	$ra
beq_else.8345:
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
	bne	$v0, $v1, beq_else.8346
	li	$v0, 0
	jr	$ra
beq_else.8346:
	l.sr	$f0, 44($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
beq_else.8344:
	li	$v0, 0
	jr	$ra
solver_rect.3562:
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
	bne	$v0, $v1, beq_else.8347
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
	bne	$v0, $v1, beq_else.8348
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
	bne	$v0, $v1, beq_else.8349
	li	$v0, 0
	jr	$ra
beq_else.8349:
	li	$v0, 3
	jr	$ra
beq_else.8348:
	li	$v0, 2
	jr	$ra
beq_else.8347:
	li	$v0, 1
	jr	$ra
solver_surface.3583:
	lwr	$a0, 4($t8)
	sw	$a0, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f1, 8($sp)
	s.s	$f0, 12($sp)
	sw	$v1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_abc.2816
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 16($sp)
	sw	$v1, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	veciprod.2575
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fispos
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8350
	li	$v0, 0
	jr	$ra
beq_else.8350:
	lwr	$v0, 20($sp)
	l.sr	$f0, 12($sp)
	l.sr	$f1, 8($sp)
	l.sr	$f2, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	veciprod2.2594
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fneg
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	div.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
quadratic.3598:
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
	jal	o_param_a.2774
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
	jal	o_param_b.2788
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
	jal	o_param_c.2802
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
	jal	o_isrot.2761
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8351
	l.sr	$f0, 36($sp)
	mov.s	$f0, $f0
	jr	$ra
beq_else.8351:
	l.sr	$f0, 8($sp)
	l.sr	$f1, 4($sp)
	mul.s	$f2, $f0, $f1
	lwr	$v0, 12($sp)
	s.s	$f2, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_r1.2941
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
	jal	o_param_r2.2955
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
	jal	o_param_r3.2969
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 52($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
bilinear.3627:
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
	jal	o_param_a.2774
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
	jal	o_param_b.2788
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
	jal	o_param_c.2802
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
	jal	o_isrot.2761
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8352
	l.sr	$f0, 48($sp)
	mov.s	$f0, $f0
	jr	$ra
beq_else.8352:
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
	jal	o_param_r1.2941
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
	jal	o_param_r2.2955
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
	jal	o_param_r3.2969
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
solver_second.3666:
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
	jal	quadratic.3598
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8353
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
	jal	bilinear.3627
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
	jal	quadratic.3598
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 16($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_form.2722
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.8354
	l.sl	$f0, l.5847
	l.sr	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8355
beq_else.8354:
	l.sr	$f0, 32($sp)
	mov.s	$f0, $f0
beq_cont.8355:
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
	bne	$v0, $v1, beq_else.8356
	li	$v0, 0
	jr	$ra
beq_else.8356:
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
	jal	o_isinvert.2748
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8357
	l.sr	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fneg
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	j	beq_cont.8358
beq_else.8357:
	l.sr	$f0, 44($sp)
	mov.s	$f0, $f0
beq_cont.8358:
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f0, $f1
	l.sr	$f1, 24($sp)
	div.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
beq_else.8353:
	li	$v0, 0
	jr	$ra
solver.3706:
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
	jal	o_param_x.2829
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
	jal	o_param_y.2843
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
	jal	o_param_z.2857
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 40($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_form.2722
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8359
	lwr	$t8, 12($sp)
	lwr	$v0, 16($sp)
	lwr	$v1, 8($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 36($sp)
	l.sr	$f2, 44($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8359:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8360
	lwr	$t8, 4($sp)
	lwr	$v0, 16($sp)
	lwr	$v1, 8($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 36($sp)
	l.sr	$f2, 44($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8360:
	lwr	$t8, 0($sp)
	lwr	$v0, 16($sp)
	lwr	$v1, 8($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 36($sp)
	l.sr	$f2, 44($sp)
	lwr	$s7, 0($t8)
	jr	$s7
solver_rect_fast.3726:
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
	jal	o_param_b.2788
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
	bne	$v0, $v1, beq_else.8361
	li	$v0, 0
	j	beq_cont.8362
beq_else.8361:
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
	jal	o_param_c.2802
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
	bne	$v0, $v1, beq_else.8363
	li	$v0, 0
	j	beq_cont.8364
beq_else.8363:
	lwr	$v0, 12($sp)
	l.sr	$f0, 4($v0)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fiszero
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8365
	li	$v0, 1
	j	beq_cont.8366
beq_else.8365:
	li	$v0, 0
beq_cont.8366:
beq_cont.8364:
beq_cont.8362:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8367
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
	jal	o_param_a.2774
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
	bne	$v0, $v1, beq_else.8368
	li	$v0, 0
	j	beq_cont.8369
beq_else.8368:
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
	jal	o_param_c.2802
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
	bne	$v0, $v1, beq_else.8370
	li	$v0, 0
	j	beq_cont.8371
beq_else.8370:
	lwr	$v0, 12($sp)
	l.sr	$f0, 12($v0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fiszero
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8372
	li	$v0, 1
	j	beq_cont.8373
beq_else.8372:
	li	$v0, 0
beq_cont.8373:
beq_cont.8371:
beq_cont.8369:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8374
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
	jal	o_param_a.2774
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
	bne	$v0, $v1, beq_else.8375
	li	$v0, 0
	j	beq_cont.8376
beq_else.8375:
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
	jal	o_param_b.2788
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
	bne	$v0, $v1, beq_else.8377
	li	$v0, 0
	j	beq_cont.8378
beq_else.8377:
	lwr	$v0, 12($sp)
	l.sr	$f0, 20($v0)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fiszero
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8379
	li	$v0, 1
	j	beq_cont.8380
beq_else.8379:
	li	$v0, 0
beq_cont.8380:
beq_cont.8378:
beq_cont.8376:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8381
	li	$v0, 0
	jr	$ra
beq_else.8381:
	l.sr	$f0, 52($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 3
	jr	$ra
beq_else.8374:
	l.sr	$f0, 40($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 2
	jr	$ra
beq_else.8367:
	l.sr	$f0, 20($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_surface_fast.3823:
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
	bne	$v0, $v1, beq_else.8382
	li	$v0, 0
	jr	$ra
beq_else.8382:
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
solver_second_fast.3846:
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
	bne	$v0, $v1, beq_else.8383
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
	jal	quadratic.3598
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_form.2722
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.8384
	l.sl	$f0, l.5847
	l.sr	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8385
beq_else.8384:
	l.sr	$f0, 32($sp)
	mov.s	$f0, $f0
beq_cont.8385:
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
	bne	$v0, $v1, beq_else.8386
	li	$v0, 0
	jr	$ra
beq_else.8386:
	lwr	$v0, 8($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.2748
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8387
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
	j	beq_cont.8388
beq_else.8387:
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
beq_cont.8388:
	li	$v0, 1
	jr	$ra
beq_else.8383:
	li	$v0, 0
	jr	$ra
solver_fast.3892:
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
	jal	o_param_x.2829
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
	jal	o_param_y.2843
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
	jal	o_param_z.2857
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 44($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	d_const.3093
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
	jal	o_form.2722
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8389
	lwr	$v0, 16($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	d_vec.3089
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
beq_else.8389:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8390
	lwr	$t8, 4($sp)
	lwr	$v0, 20($sp)
	lwr	$v1, 52($sp)
	l.sr	$f0, 32($sp)
	l.sr	$f1, 40($sp)
	l.sr	$f2, 48($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8390:
	lwr	$t8, 0($sp)
	lwr	$v0, 20($sp)
	lwr	$v1, 52($sp)
	l.sr	$f0, 32($sp)
	l.sr	$f1, 40($sp)
	l.sr	$f2, 48($sp)
	lwr	$s7, 0($t8)
	jr	$s7
solver_surface_fast2.3915:
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
	bne	$v0, $v1, beq_else.8391
	li	$v0, 0
	jr	$ra
beq_else.8391:
	lwr	$v0, 8($sp)
	l.sr	$f0, 0($v0)
	lwr	$v0, 4($sp)
	l.sr	$f1, 12($v0)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	li	$v0, 1
	jr	$ra
solver_second_fast2.3933:
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
	bne	$v0, $v1, beq_else.8392
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
	bne	$v0, $v1, beq_else.8393
	li	$v0, 0
	jr	$ra
beq_else.8393:
	lwr	$v0, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.2748
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8394
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
	j	beq_cont.8395
beq_else.8394:
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
beq_cont.8395:
	li	$v0, 1
	jr	$ra
beq_else.8392:
	li	$v0, 0
	jr	$ra
solver_fast2.3977:
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
	jal	o_param_ctbl.2983
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
	jal	d_const.3093
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
	jal	o_form.2722
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8396
	lwr	$v0, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	d_vec.3089
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
beq_else.8396:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8397
	lwr	$t8, 4($sp)
	lwr	$v0, 12($sp)
	lwr	$v1, 40($sp)
	lwr	$a0, 24($sp)
	l.sr	$f0, 36($sp)
	l.sr	$f1, 32($sp)
	l.sr	$f2, 28($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8397:
	lwr	$t8, 0($sp)
	lwr	$v0, 12($sp)
	lwr	$v1, 40($sp)
	lwr	$a0, 24($sp)
	l.sr	$f0, 36($sp)
	l.sr	$f1, 32($sp)
	l.sr	$f2, 28($sp)
	lwr	$s7, 0($t8)
	jr	$s7
setup_rect_table.3994:
	li	$a0, 6
	l.sl	$f0, l.5848
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
	bne	$v0, $v1, beq_else.8398
	lwr	$v0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.2748
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
	jal	o_param_a.2774
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	fneg_cond.2495
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 0($v0)
	l.sl	$f0, l.5847
	lwr	$v1, 4($sp)
	l.sr	$f1, 0($v1)
	div.s	$f0, $f0, $f1
	s.s	$f0, 4($v0)
	j	beq_cont.8399
beq_else.8398:
	l.sl	$f0, l.5848
	lwr	$v0, 8($sp)
	s.s	$f0, 4($v0)
beq_cont.8399:
	lwr	$v0, 4($sp)
	l.sr	$f0, 4($v0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fiszero
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8400
	lwr	$v0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.2748
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
	jal	o_param_b.2788
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	fneg_cond.2495
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 8($v0)
	l.sl	$f0, l.5847
	lwr	$v1, 4($sp)
	l.sr	$f1, 4($v1)
	div.s	$f0, $f0, $f1
	s.s	$f0, 12($v0)
	j	beq_cont.8401
beq_else.8400:
	l.sl	$f0, l.5848
	lwr	$v0, 8($sp)
	s.s	$f0, 12($v0)
beq_cont.8401:
	lwr	$v0, 4($sp)
	l.sr	$f0, 8($v0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8402
	lwr	$v0, 0($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_isinvert.2748
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
	jal	o_param_c.2802
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg_cond.2495
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 16($v0)
	l.sl	$f0, l.5847
	lwr	$v1, 4($sp)
	l.sr	$f1, 8($v1)
	div.s	$f0, $f0, $f1
	s.s	$f0, 20($v0)
	j	beq_cont.8403
beq_else.8402:
	l.sl	$f0, l.5848
	lwr	$v0, 8($sp)
	s.s	$f0, 20($v0)
beq_cont.8403:
	lwr	$v0, 8($sp)
	jr	$ra
setup_surface_table.4063:
	li	$a0, 4
	l.sl	$f0, l.5848
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
	jal	o_param_a.2774
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
	jal	o_param_b.2788
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
	jal	o_param_c.2802
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
	bne	$v0, $v1, beq_else.8404
	l.sl	$f0, l.5848
	lwr	$v0, 8($sp)
	s.s	$f0, 0($v0)
	j	beq_cont.8405
beq_else.8404:
	l.sl	$f0, l.5846
	l.sr	$f1, 32($sp)
	div.s	$f0, $f0, $f1
	lwr	$v0, 8($sp)
	s.s	$f0, 0($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.2774
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 4($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_b.2788
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 8($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.2802
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 12($v0)
beq_cont.8405:
	lwr	$v0, 8($sp)
	jr	$ra
setup_second_table.4106:
	li	$a0, 5
	l.sl	$f0, l.5848
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
	jal	quadratic.3598
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
	jal	o_param_a.2774
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fneg
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
	jal	o_param_b.2788
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fneg
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
	jal	o_param_c.2802
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
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
	jal	o_isrot.2761
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8406
	l.sr	$f0, 20($sp)
	lwr	$v0, 8($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 28($sp)
	s.s	$f0, 8($v0)
	l.sr	$f0, 36($sp)
	s.s	$f0, 12($v0)
	j	beq_cont.8407
beq_else.8406:
	lwr	$v0, 4($sp)
	l.sr	$f0, 8($v0)
	lwr	$v1, 0($sp)
	s.s	$f0, 40($sp)
	addi	$v0, $v1, 0
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_r2.2955
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
	jal	o_param_r3.2969
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
	jal	o_param_r1.2941
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
	jal	o_param_r3.2969
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
	jal	o_param_r1.2941
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
	jal	o_param_r2.2955
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
beq_cont.8407:
	l.sr	$f0, 12($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fiszero
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8408
	l.sl	$f0, l.5847
	l.sr	$f1, 12($sp)
	div.s	$f0, $f0, $f1
	lwr	$v0, 8($sp)
	s.s	$f0, 16($v0)
	j	beq_cont.8409
beq_else.8408:
beq_cont.8409:
	lwr	$v0, 8($sp)
	jr	$ra
iter_setup_dirvec_constants.4188:
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.8410
	sll	$a1, $v1, 2
	add	$t9, $a0, $a1
	lwr	$a0, 0($t9)
	sw	$t8, 0($sp)
	sw	$v1, 4($sp)
	sw	$a0, 8($sp)
	sw	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	d_const.3093
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	d_vec.3089
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v1, 8($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_form.2722
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8411
	lwr	$v0, 20($sp)
	lwr	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_rect_table.3994
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 4($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	j	beq_cont.8412
beq_else.8411:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8413
	lwr	$v0, 20($sp)
	lwr	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_surface_table.4063
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 4($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	j	beq_cont.8414
beq_else.8413:
	lwr	$v0, 20($sp)
	lwr	$v1, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	setup_second_table.4106
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 4($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
beq_cont.8414:
beq_cont.8412:
	lwr	$v0, 4($sp)
	addi	$v1, $v0, -1
	lwr	$t8, 0($sp)
	lwr	$v0, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8410:
	jr	$ra
setup_dirvec_constants.4204:
	lwr	$v1, 8($t8)
	lwr	$t8, 4($t8)
	lwr	$v1, 0($v1)
	addi	$v1, $v1, -1
	lwr	$s7, 0($t8)
	jr	$s7
setup_startp_constants.4210:
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.8416
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
	jal	o_param_ctbl.2983
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v1, 12($sp)
	sw	$v0, 16($sp)
	addi	$v0, $v1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.2722
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
	jal	o_param_x.2829
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
	jal	o_param_y.2843
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
	jal	o_param_z.2857
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 16($sp)
	s.s	$f0, 8($v0)
	li	$v1, 2
	lwr	$a0, 20($sp)
	bne	$a0, $v1, beq_else.8417
	lwr	$v1, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.2816
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v1, 16($sp)
	l.sr	$f0, 0($v1)
	l.sr	$f1, 4($v1)
	l.sr	$f2, 8($v1)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veciprod2.2594
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 16($sp)
	s.s	$f0, 12($v0)
	j	beq_cont.8418
beq_else.8417:
	li	$v1, 2
	bgt	$a0, $v1, ble_else.8419
	j	ble_cont.8420
ble_else.8419:
	l.sr	$f0, 0($v0)
	l.sr	$f1, 4($v0)
	l.sr	$f2, 8($v0)
	lwr	$v1, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	quadratic.3598
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v0, 3
	lwr	$v1, 20($sp)
	bne	$v1, $v0, beq_else.8421
	l.sl	$f1, l.5847
	sub.s	$f0, $f0, $f1
	j	beq_cont.8422
beq_else.8421:
	mov.s	$f0, $f0
beq_cont.8422:
	lwr	$v0, 16($sp)
	s.s	$f0, 12($v0)
ble_cont.8420:
beq_cont.8418:
	lwr	$v0, 4($sp)
	addi	$v1, $v0, -1
	lwr	$t8, 0($sp)
	lwr	$v0, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8416:
	jr	$ra
setup_startp.4260:
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
	jal	veccpy.2526
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v0, 8($sp)
	lwr	$v0, 0($v0)
	addi	$v1, $v0, -1
	lwr	$t8, 4($sp)
	lwr	$v0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
is_rect_outside.4267:
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
	jal	o_param_a.2774
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
	bne	$v0, $v1, beq_else.8424
	li	$v0, 0
	j	beq_cont.8425
beq_else.8424:
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
	jal	o_param_b.2788
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
	bne	$v0, $v1, beq_else.8426
	li	$v0, 0
	j	beq_cont.8427
beq_else.8426:
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
	jal	o_param_c.2802
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	mov.s	$f1, $f0
	l.sr	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fless
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
beq_cont.8427:
beq_cont.8425:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8428
	lwr	$v0, 8($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_isinvert.2748
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8429
	li	$v0, 1
	jr	$ra
beq_else.8429:
	li	$v0, 0
	jr	$ra
beq_else.8428:
	lwr	$v0, 8($sp)
	j	o_isinvert.2748
is_plane_outside.4286:
	sw	$v0, 0($sp)
	s.s	$f2, 4($sp)
	s.s	$f1, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_abc.2816
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sr	$f0, 12($sp)
	l.sr	$f1, 8($sp)
	l.sr	$f2, 4($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	veciprod2.2594
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.2748
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
	bne	$v0, $v1, beq_else.8430
	li	$v0, 1
	jr	$ra
beq_else.8430:
	li	$v0, 0
	jr	$ra
is_second_outside.4297:
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	quadratic.3598
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_form.2722
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v1, 3
	bne	$v0, $v1, beq_else.8431
	l.sl	$f0, l.5847
	l.sr	$f1, 4($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8432
beq_else.8431:
	l.sr	$f0, 4($sp)
	mov.s	$f0, $f0
beq_cont.8432:
	lwr	$v0, 0($sp)
	s.s	$f0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.2748
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
	bne	$v0, $v1, beq_else.8433
	li	$v0, 1
	jr	$ra
beq_else.8433:
	li	$v0, 0
	jr	$ra
is_outside.4311:
	s.s	$f2, 0($sp)
	s.s	$f1, 4($sp)
	sw	$v0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_x.2829
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sr	$f1, 12($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_y.2843
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 4($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_param_z.2857
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sr	$f1, 0($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_form.2722
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8434
	lwr	$v0, 8($sp)
	l.sr	$f0, 16($sp)
	l.sr	$f1, 20($sp)
	l.sr	$f2, 24($sp)
	j	is_rect_outside.4267
beq_else.8434:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8435
	lwr	$v0, 8($sp)
	l.sr	$f0, 16($sp)
	l.sr	$f1, 20($sp)
	l.sr	$f2, 24($sp)
	j	is_plane_outside.4286
beq_else.8435:
	lwr	$v0, 8($sp)
	l.sr	$f0, 16($sp)
	l.sr	$f1, 20($sp)
	l.sr	$f2, 24($sp)
	j	is_second_outside.4297
check_all_inside.4325:
	lwr	$a0, 4($t8)
	sll	$a1, $v0, 2
	add	$t9, $v1, $a1
	lwr	$a1, 0($t9)
	li	$a2, -1
	bne	$a1, $a2, beq_else.8436
	li	$v0, 1
	jr	$ra
beq_else.8436:
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
	jal	is_outside.4311
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8437
	lwr	$v0, 20($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 16($sp)
	lwr	$v1, 12($sp)
	l.sr	$f0, 8($sp)
	l.sr	$f1, 4($sp)
	l.sr	$f2, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8437:
	li	$v0, 0
	jr	$ra
shadow_check_and_group.4339:
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
	bne	$t3, $t4, beq_else.8438
	li	$v0, 0
	jr	$ra
beq_else.8438:
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
	bne	$v0, $v1, beq_else.8439
	li	$v0, 0
	j	beq_cont.8440
beq_else.8439:
	l.sl	$f1, l.6162
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	min_caml_fless
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
beq_cont.8440:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8441
	lwr	$v0, 28($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 24($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_isinvert.2748
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8442
	li	$v0, 0
	jr	$ra
beq_else.8442:
	lwr	$v0, 20($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 16($sp)
	lwr	$v1, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8441:
	l.sl	$f0, l.6164
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
	bne	$v0, $v1, beq_else.8443
	lwr	$v0, 20($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 16($sp)
	lwr	$v1, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8443:
	li	$v0, 1
	jr	$ra
shadow_check_one_or_group.4383:
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	sll	$a2, $v0, 2
	add	$t9, $v1, $a2
	lwr	$a2, 0($t9)
	li	$a3, -1
	bne	$a2, $a3, beq_else.8444
	li	$v0, 0
	jr	$ra
beq_else.8444:
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
	bne	$v0, $v1, beq_else.8445
	lwr	$v0, 8($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 4($sp)
	lwr	$v1, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8445:
	li	$v0, 1
	jr	$ra
shadow_check_one_or_matrix.4395:
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
	bne	$t2, $t3, beq_else.8446
	li	$v0, 0
	jr	$ra
beq_else.8446:
	li	$t3, 99
	sw	$t1, 0($sp)
	sw	$a2, 4($sp)
	sw	$v1, 8($sp)
	sw	$t8, 12($sp)
	sw	$v0, 16($sp)
	bne	$t2, $t3, beq_else.8447
	li	$v0, 1
	j	beq_cont.8448
beq_else.8447:
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
	bne	$v0, $v1, beq_else.8449
	li	$v0, 0
	j	beq_cont.8450
beq_else.8449:
	lwr	$v0, 20($sp)
	l.sr	$f0, 0($v0)
	l.sl	$f1, l.6176
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fless
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8451
	li	$v0, 0
	j	beq_cont.8452
beq_else.8451:
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
	bne	$v0, $v1, beq_else.8453
	li	$v0, 0
	j	beq_cont.8454
beq_else.8453:
	li	$v0, 1
beq_cont.8454:
beq_cont.8452:
beq_cont.8450:
beq_cont.8448:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8455
	lwr	$v0, 16($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 12($sp)
	lwr	$v1, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8455:
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
	bne	$v0, $v1, beq_else.8456
	lwr	$v0, 16($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 12($sp)
	lwr	$v1, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8456:
	li	$v0, 1
	jr	$ra
solve_each_element.4423:
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
	bne	$t6, $t7, beq_else.8457
	jr	$ra
beq_else.8457:
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
	bne	$v0, $v1, beq_else.8459
	lwr	$v0, 48($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 44($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.2748
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8460
	jr	$ra
beq_else.8460:
	lwr	$v0, 40($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 36($sp)
	lwr	$v1, 32($sp)
	lwr	$a0, 28($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8459:
	lwr	$v1, 24($sp)
	l.sr	$f1, 0($v1)
	l.sl	$f0, l.5848
	sw	$v0, 52($sp)
	s.s	$f1, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8462
	j	beq_cont.8463
beq_else.8462:
	lwr	$v0, 20($sp)
	l.sr	$f1, 0($v0)
	l.sr	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8464
	j	beq_cont.8465
beq_else.8464:
	l.sl	$f0, l.6164
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
	bne	$v0, $v1, beq_else.8466
	j	beq_cont.8467
beq_else.8466:
	l.sr	$f0, 72($sp)
	lwr	$v0, 20($sp)
	s.s	$f0, 0($v0)
	lwr	$v0, 8($sp)
	l.sr	$f0, 68($sp)
	l.sr	$f1, 64($sp)
	l.sr	$f2, 60($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	vecset.2505
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	lwr	$v0, 48($sp)
	lwr	$v1, 4($sp)
	sw	$v0, 0($v1)
	lwr	$v0, 52($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 0($v1)
beq_cont.8467:
beq_cont.8465:
beq_cont.8463:
	lwr	$v0, 40($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 36($sp)
	lwr	$v1, 32($sp)
	lwr	$a0, 28($sp)
	lwr	$s7, 0($t8)
	jr	$s7
solve_one_or_network.4478:
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sll	$a3, $v0, 2
	add	$t9, $v1, $a3
	lwr	$a3, 0($t9)
	li	$t0, -1
	bne	$a3, $t0, beq_else.8468
	jr	$ra
beq_else.8468:
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
trace_or_matrix.4490:
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
	bne	$t3, $t4, beq_else.8470
	jr	$ra
beq_else.8470:
	li	$t4, 99
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	bne	$t3, $t4, beq_else.8472
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
	j	beq_cont.8473
beq_else.8472:
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
	bne	$v0, $v1, beq_else.8474
	j	beq_cont.8475
beq_else.8474:
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
	bne	$v0, $v1, beq_else.8476
	j	beq_cont.8477
beq_else.8476:
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
beq_cont.8477:
beq_cont.8475:
beq_cont.8473:
	lwr	$v0, 12($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 8($sp)
	lwr	$v1, 4($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
judge_intersection.4513:
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	l.sl	$f0, l.6196
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
	l.sl	$f0, l.6176
	s.s	$f1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fless
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8478
	li	$v0, 0
	jr	$ra
beq_else.8478:
	l.sl	$f1, l.6200
	l.sr	$f0, 4($sp)
	j	min_caml_fless
solve_each_element_fast.4528:
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
	jal	d_vec.3089
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	lwr	$v1, 48($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 44($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	li	$a2, -1
	bne	$a0, $a2, beq_else.8479
	jr	$ra
beq_else.8479:
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
	bne	$v0, $v1, beq_else.8481
	lwr	$v0, 56($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 32($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.2748
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8482
	jr	$ra
beq_else.8482:
	lwr	$v0, 48($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 28($sp)
	lwr	$v1, 44($sp)
	lwr	$a0, 36($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8481:
	lwr	$v1, 24($sp)
	l.sr	$f1, 0($v1)
	l.sl	$f0, l.5848
	sw	$v0, 60($sp)
	s.s	$f1, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8484
	j	beq_cont.8485
beq_else.8484:
	lwr	$v0, 20($sp)
	l.sr	$f1, 0($v0)
	l.sr	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8486
	j	beq_cont.8487
beq_else.8486:
	l.sl	$f0, l.6164
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
	bne	$v0, $v1, beq_else.8488
	j	beq_cont.8489
beq_else.8488:
	l.sr	$f0, 80($sp)
	lwr	$v0, 20($sp)
	s.s	$f0, 0($v0)
	lwr	$v0, 8($sp)
	l.sr	$f0, 76($sp)
	l.sr	$f1, 72($sp)
	l.sr	$f2, 68($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	vecset.2505
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	lwr	$v0, 56($sp)
	lwr	$v1, 4($sp)
	sw	$v0, 0($v1)
	lwr	$v0, 60($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 0($v1)
beq_cont.8489:
beq_cont.8487:
beq_cont.8485:
	lwr	$v0, 48($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 28($sp)
	lwr	$v1, 44($sp)
	lwr	$a0, 36($sp)
	lwr	$s7, 0($t8)
	jr	$s7
solve_one_or_network_fast.4584:
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sll	$a3, $v0, 2
	add	$t9, $v1, $a3
	lwr	$a3, 0($t9)
	li	$t0, -1
	bne	$a3, $t0, beq_else.8490
	jr	$ra
beq_else.8490:
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
trace_or_matrix_fast.4596:
	lwr	$a1, 16($t8)
	lwr	$a2, 12($t8)
	lwr	$a3, 8($t8)
	lwr	$t0, 4($t8)
	sll	$t1, $v0, 2
	add	$t9, $v1, $t1
	lwr	$t1, 0($t9)
	lwr	$t2, 0($t1)
	li	$t3, -1
	bne	$t2, $t3, beq_else.8492
	jr	$ra
beq_else.8492:
	li	$t3, 99
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$t8, 8($sp)
	sw	$v0, 12($sp)
	bne	$t2, $t3, beq_else.8494
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
	j	beq_cont.8495
beq_else.8494:
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
	bne	$v0, $v1, beq_else.8496
	j	beq_cont.8497
beq_else.8496:
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
	bne	$v0, $v1, beq_else.8498
	j	beq_cont.8499
beq_else.8498:
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
beq_cont.8499:
beq_cont.8497:
beq_cont.8495:
	lwr	$v0, 12($sp)
	addi	$v0, $v0, 1
	lwr	$t8, 8($sp)
	lwr	$v1, 4($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
judge_intersection_fast.4619:
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	l.sl	$f0, l.6196
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
	l.sl	$f0, l.6176
	s.s	$f1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fless
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8500
	li	$v0, 0
	jr	$ra
beq_else.8500:
	l.sl	$f1, l.6200
	l.sr	$f0, 4($sp)
	j	min_caml_fless
get_nvector_rect.4634:
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	lwr	$a0, 0($a0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	vecbzero.2523
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
	jal	sgn.2489
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fneg
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 12($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 0($sp)
	add	$t9, $v1, $v0
	s.s	$f0, 0($t9)
	jr	$ra
get_nvector_plane.4646:
	lwr	$v1, 4($t8)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_a.2774
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fneg
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 0($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_b.2788
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fneg
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 4($v0)
	lwr	$v1, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	o_param_c.2802
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_fneg
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 8($v0)
	jr	$ra
get_nvector_second.4659:
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	l.sr	$f0, 0($a0)
	sw	$v1, 0($sp)
	sw	$v0, 4($sp)
	sw	$a0, 8($sp)
	s.s	$f0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_param_x.2829
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
	jal	o_param_y.2843
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
	jal	o_param_z.2857
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.2774
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_b.2788
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_c.2802
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_isrot.2761
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8503
	l.sr	$f0, 36($sp)
	lwr	$v0, 0($sp)
	s.s	$f0, 0($v0)
	l.sr	$f0, 40($sp)
	s.s	$f0, 4($v0)
	l.sr	$f0, 44($sp)
	s.s	$f0, 8($v0)
	j	beq_cont.8504
beq_else.8503:
	lwr	$v0, 4($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_r3.2969
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_r2.2955
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
	jal	o_param_r3.2969
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_r1.2941
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
	jal	o_param_r2.2955
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_r1.2941
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
beq_cont.8504:
	lwr	$v0, 4($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.2748
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 0($sp)
	j	vecunit_sgn.2540
get_nvector.4714:
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
	jal	o_form.2722
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8505
	lwr	$t8, 16($sp)
	lwr	$v0, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8505:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8506
	lwr	$t8, 8($sp)
	lwr	$v0, 4($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8506:
	lwr	$t8, 0($sp)
	lwr	$v0, 4($sp)
	lwr	$s7, 0($t8)
	jr	$s7
utexture.4720:
	lwr	$a0, 4($t8)
	sw	$v1, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_texturetype.2709
	addi	$sp, $sp, -16
	lwr	$ra, 12($sp)
	lwr	$v1, 8($sp)
	sw	$v0, 12($sp)
	addi	$v0, $v1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_color_red.2899
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 0($v0)
	lwr	$v1, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_color_green.2913
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 4($v0)
	lwr	$v1, 8($sp)
	addi	$v0, $v1, 0
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_color_blue.2927
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v0, 4($sp)
	s.s	$f0, 8($v0)
	li	$v1, 1
	lwr	$a0, 12($sp)
	bne	$a0, $v1, beq_else.8507
	lwr	$v1, 0($sp)
	l.sr	$f0, 0($v1)
	lwr	$a0, 8($sp)
	s.s	$f0, 16($sp)
	addi	$v0, $a0, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_x.2829
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	l.sr	$f1, 16($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6242
	mul.s	$f1, $f0, $f1
	s.s	$f0, 20($sp)
	mov.s	$f0, $f1
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_floor
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	l.sl	$f1, l.6243
	mul.s	$f0, $f0, $f1
	l.sr	$f1, 20($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6244
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	min_caml_fless
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 0($sp)
	l.sr	$f0, 8($v1)
	lwr	$v1, 8($sp)
	sw	$v0, 24($sp)
	s.s	$f0, 28($sp)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_z.2857
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sr	$f1, 28($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6242
	mul.s	$f1, $f0, $f1
	s.s	$f0, 32($sp)
	mov.s	$f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_floor
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sl	$f1, l.6243
	mul.s	$f0, $f0, $f1
	l.sr	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6244
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fless
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	li	$v1, 0
	lwr	$a0, 24($sp)
	bne	$a0, $v1, beq_else.8508
	li	$v1, 0
	bne	$v0, $v1, beq_else.8510
	l.sl	$f0, l.6246
	j	beq_cont.8511
beq_else.8510:
	l.sl	$f0, l.5848
beq_cont.8511:
	j	beq_cont.8509
beq_else.8508:
	li	$v1, 0
	bne	$v0, $v1, beq_else.8512
	l.sl	$f0, l.5848
	j	beq_cont.8513
beq_else.8512:
	l.sl	$f0, l.6246
beq_cont.8513:
beq_cont.8509:
	lwr	$v0, 4($sp)
	s.s	$f0, 4($v0)
	jr	$ra
beq_else.8507:
	li	$v1, 2
	bne	$a0, $v1, beq_else.8515
	lwr	$v1, 0($sp)
	l.sr	$f0, 4($v1)
	l.sl	$f1, l.6249
	mul.s	$f0, $f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_sin
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fsqr
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sl	$f1, l.6246
	mul.s	$f1, $f1, $f0
	lwr	$v0, 4($sp)
	s.s	$f1, 0($v0)
	l.sl	$f1, l.6246
	l.sl	$f2, l.5847
	sub.s	$f0, $f2, $f0
	mul.s	$f0, $f1, $f0
	s.s	$f0, 4($v0)
	jr	$ra
beq_else.8515:
	li	$v1, 3
	bne	$a0, $v1, beq_else.8517
	lwr	$v1, 0($sp)
	l.sr	$f0, 0($v1)
	lwr	$a0, 8($sp)
	s.s	$f0, 36($sp)
	addi	$v0, $a0, 0
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_x.2829
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 36($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 0($sp)
	l.sr	$f1, 8($v0)
	lwr	$v0, 8($sp)
	s.s	$f0, 40($sp)
	s.s	$f1, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_z.2857
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 44($sp)
	sub.s	$f0, $f1, $f0
	l.sr	$f1, 40($sp)
	s.s	$f0, 48($sp)
	mov.s	$f0, $f1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fsqr
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f1, 48($sp)
	s.s	$f0, 52($sp)
	mov.s	$f0, $f1
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fsqr
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 52($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_sqrt
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sl	$f1, l.6244
	div.s	$f0, $f0, $f1
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_floor
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6254
	mul.s	$f0, $f0, $f1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_cos
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fsqr
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sl	$f1, l.6246
	mul.s	$f1, $f0, $f1
	lwr	$v0, 4($sp)
	s.s	$f1, 4($v0)
	l.sl	$f1, l.5847
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6246
	mul.s	$f0, $f0, $f1
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.8517:
	li	$v1, 4
	bne	$a0, $v1, beq_else.8519
	lwr	$v1, 0($sp)
	l.sr	$f0, 0($v1)
	lwr	$a0, 8($sp)
	s.s	$f0, 60($sp)
	addi	$v0, $a0, 0
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_param_x.2829
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 60($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_a.2774
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_sqrt
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	l.sr	$f1, 64($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 0($sp)
	l.sr	$f1, 8($v0)
	lwr	$v1, 8($sp)
	s.s	$f0, 68($sp)
	s.s	$f1, 72($sp)
	addi	$v0, $v1, 0
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_z.2857
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	l.sr	$f1, 72($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 76($sp)
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	o_param_c.2802
	addi	$sp, $sp, -84
	lwr	$ra, 80($sp)
	sw	$ra, 80($sp)
	addi	$sp, $sp, 84
	jal	min_caml_sqrt
	addi	$sp, $sp, -84
	lwr	$ra, 80($sp)
	l.sr	$f1, 76($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 68($sp)
	s.s	$f0, 80($sp)
	mov.s	$f0, $f1
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fsqr
	addi	$sp, $sp, -88
	lwr	$ra, 84($sp)
	l.sr	$f1, 80($sp)
	s.s	$f0, 84($sp)
	mov.s	$f0, $f1
	sw	$ra, 88($sp)
	addi	$sp, $sp, 92
	jal	min_caml_fsqr
	addi	$sp, $sp, -92
	lwr	$ra, 88($sp)
	l.sr	$f1, 84($sp)
	add.s	$f0, $f1, $f0
	l.sr	$f1, 68($sp)
	s.s	$f0, 88($sp)
	mov.s	$f0, $f1
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fabs
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	l.sl	$f1, l.6259
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fless
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8520
	l.sr	$f0, 80($sp)
	l.sr	$f1, 68($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fabs
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_atan
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	l.sl	$f1, l.6260
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6254
	div.s	$f0, $f0, $f1
	j	beq_cont.8521
beq_else.8520:
	l.sl	$f0, l.6261
beq_cont.8521:
	s.s	$f0, 92($sp)
	sw	$ra, 96($sp)
	addi	$sp, $sp, 100
	jal	min_caml_floor
	addi	$sp, $sp, -100
	lwr	$ra, 96($sp)
	l.sr	$f1, 92($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 0($sp)
	l.sr	$f1, 4($v0)
	lwr	$v0, 8($sp)
	s.s	$f0, 96($sp)
	s.s	$f1, 100($sp)
	sw	$ra, 104($sp)
	addi	$sp, $sp, 108
	jal	o_param_y.2843
	addi	$sp, $sp, -108
	lwr	$ra, 104($sp)
	l.sr	$f1, 100($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 8($sp)
	s.s	$f0, 104($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	o_param_b.2788
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_sqrt
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	l.sr	$f1, 104($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 88($sp)
	s.s	$f0, 108($sp)
	mov.s	$f0, $f1
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_fabs
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	l.sl	$f1, l.6259
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_fless
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8522
	l.sr	$f0, 108($sp)
	l.sr	$f1, 88($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_fabs
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_atan
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	l.sl	$f1, l.6260
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6254
	div.s	$f0, $f0, $f1
	j	beq_cont.8523
beq_else.8522:
	l.sl	$f0, l.6261
beq_cont.8523:
	s.s	$f0, 112($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_floor
	addi	$sp, $sp, -120
	lwr	$ra, 116($sp)
	l.sr	$f1, 112($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6263
	l.sl	$f2, l.6264
	l.sr	$f3, 96($sp)
	sub.s	$f2, $f2, $f3
	s.s	$f0, 116($sp)
	s.s	$f1, 120($sp)
	mov.s	$f0, $f2
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_fsqr
	addi	$sp, $sp, -128
	lwr	$ra, 124($sp)
	l.sr	$f1, 120($sp)
	sub.s	$f0, $f1, $f0
	l.sl	$f1, l.6264
	l.sr	$f2, 116($sp)
	sub.s	$f1, $f1, $f2
	s.s	$f0, 124($sp)
	mov.s	$f0, $f1
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	min_caml_fsqr
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	l.sr	$f1, 124($sp)
	sub.s	$f0, $f1, $f0
	s.s	$f0, 128($sp)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_fisneg
	addi	$sp, $sp, -136
	lwr	$ra, 132($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8524
	l.sr	$f0, 128($sp)
	mov.s	$f0, $f0
	j	beq_cont.8525
beq_else.8524:
	l.sl	$f0, l.5848
beq_cont.8525:
	l.sl	$f1, l.6246
	mul.s	$f0, $f1, $f0
	l.sl	$f1, l.6265
	div.s	$f0, $f0, $f1
	lwr	$v0, 4($sp)
	s.s	$f0, 8($v0)
	jr	$ra
beq_else.8519:
	jr	$ra
add_light.4877:
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
	bne	$v0, $v1, beq_else.8528
	j	beq_cont.8529
beq_else.8528:
	lwr	$v0, 16($sp)
	lwr	$v1, 12($sp)
	l.sr	$f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	vecaccum.2609
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
beq_cont.8529:
	l.sr	$f0, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fispos
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8530
	jr	$ra
beq_else.8530:
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
trace_reflections.4903:
	lwr	$a0, 32($t8)
	lwr	$a1, 28($t8)
	lwr	$a2, 24($t8)
	lwr	$a3, 20($t8)
	lwr	$t0, 16($t8)
	lwr	$t1, 12($t8)
	lwr	$t2, 8($t8)
	lwr	$t3, 4($t8)
	li	$t4, 0
	bgt	$t4, $v0, ble_else.8533
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
	jal	r_dvec.3102
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
	bne	$v0, $v1, beq_else.8534
	j	beq_cont.8535
beq_else.8534:
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
	jal	r_surface_id.3097
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v1, 56($sp)
	bne	$v1, $v0, beq_else.8536
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
	bne	$v0, $v1, beq_else.8538
	lwr	$v0, 52($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_vec.3089
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veciprod.2575
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 36($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	r_bright.3107
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
	jal	d_vec.3089
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 16($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	veciprod.2575
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
	j	beq_cont.8539
beq_else.8538:
beq_cont.8539:
	j	beq_cont.8537
beq_else.8536:
beq_cont.8537:
beq_cont.8535:
	lwr	$v0, 4($sp)
	addi	$v0, $v0, -1
	lwr	$t8, 0($sp)
	lwr	$v1, 16($sp)
	l.sr	$f0, 20($sp)
	l.sr	$f1, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8533:
	jr	$ra
trace_ray.4937:
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
	bgt	$v0, $a3, ble_else.8541
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
	jal	p_surface_ids.3016
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
	bne	$v0, $v1, beq_else.8542
	li	$v0, -1
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 104($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	li	$v0, 0
	bne	$v1, $v0, beq_else.8543
	jr	$ra
beq_else.8543:
	lwr	$v0, 96($sp)
	lwr	$v1, 88($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	veciprod.2575
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_fneg
	addi	$sp, $sp, -112
	lwr	$ra, 108($sp)
	s.s	$f0, 108($sp)
	sw	$ra, 112($sp)
	addi	$sp, $sp, 116
	jal	min_caml_fispos
	addi	$sp, $sp, -116
	lwr	$ra, 112($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8545
	jr	$ra
beq_else.8545:
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
beq_else.8542:
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
	jal	o_reflectiontype.2735
	addi	$sp, $sp, -124
	lwr	$ra, 120($sp)
	lwr	$v1, 116($sp)
	sw	$v0, 120($sp)
	addi	$v0, $v1, 0
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	o_diffuse.2871
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
	jal	veccpy.2526
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
	jal	p_intersection_points.3006
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
	jal	veccpy.2526
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	lwr	$v0, 44($sp)
	sw	$ra, 128($sp)
	addi	$sp, $sp, 132
	jal	p_calc_diffuse.3026
	addi	$sp, $sp, -132
	lwr	$ra, 128($sp)
	lwr	$v1, 116($sp)
	sw	$v0, 128($sp)
	addi	$v0, $v1, 0
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	o_diffuse.2871
	addi	$sp, $sp, -136
	lwr	$ra, 132($sp)
	l.sl	$f1, l.6264
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_fless
	addi	$sp, $sp, -136
	lwr	$ra, 132($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8548
	li	$v0, 1
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 128($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	lwr	$v0, 44($sp)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	p_energy.3036
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
	jal	veccpy.2526
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	lwr	$v0, 92($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 132($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	l.sl	$f0, l.6293
	l.sr	$f1, 124($sp)
	mul.s	$f0, $f0, $f1
	addi	$v0, $v1, 0
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	vecscale.2659
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	lwr	$v0, 44($sp)
	sw	$ra, 136($sp)
	addi	$sp, $sp, 140
	jal	p_nvectors.3079
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
	jal	veccpy.2526
	addi	$sp, $sp, -140
	lwr	$ra, 136($sp)
	j	beq_cont.8549
beq_else.8548:
	li	$v0, 0
	lwr	$v1, 92($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 128($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
beq_cont.8549:
	l.sl	$f0, l.6296
	lwr	$v0, 96($sp)
	lwr	$v1, 36($sp)
	s.s	$f0, 136($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	veciprod.2575
	addi	$sp, $sp, -144
	lwr	$ra, 140($sp)
	l.sr	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 96($sp)
	lwr	$v1, 36($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	vecaccum.2609
	addi	$sp, $sp, -144
	lwr	$ra, 140($sp)
	lwr	$v0, 116($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	o_hilight.2885
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
	bne	$v0, $v1, beq_else.8550
	lwr	$v0, 36($sp)
	lwr	$v1, 88($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	veciprod.2575
	addi	$sp, $sp, -148
	lwr	$ra, 144($sp)
	sw	$ra, 144($sp)
	addi	$sp, $sp, 148
	jal	min_caml_fneg
	addi	$sp, $sp, -148
	lwr	$ra, 144($sp)
	l.sr	$f1, 124($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 96($sp)
	lwr	$v1, 88($sp)
	s.s	$f0, 144($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	veciprod.2575
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fneg
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
	j	beq_cont.8551
beq_else.8550:
beq_cont.8551:
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
	l.sl	$f0, l.6299
	l.sr	$f1, 84($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fless
	addi	$sp, $sp, -152
	lwr	$ra, 148($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8552
	jr	$ra
beq_else.8552:
	li	$v0, 4
	lwr	$v1, 92($sp)
	bgt	$v0, $v1, ble_else.8554
	j	ble_cont.8555
ble_else.8554:
	addi	$v0, $v1, 1
	li	$a0, -1
	sll	$v0, $v0, 2
	lwr	$a1, 104($sp)
	add	$t9, $a1, $v0
	sw	$a0, 0($t9)
ble_cont.8555:
	li	$v0, 2
	lwr	$v1, 120($sp)
	bne	$v1, $v0, beq_else.8556
	l.sl	$f0, l.5847
	lwr	$v0, 116($sp)
	s.s	$f0, 148($sp)
	sw	$ra, 152($sp)
	addi	$sp, $sp, 156
	jal	o_diffuse.2871
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
beq_else.8556:
	jr	$ra
ble_else.8541:
	jr	$ra
trace_diffuse_ray.5055:
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
	bne	$v0, $v1, beq_else.8559
	jr	$ra
beq_else.8559:
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
	jal	d_vec.3089
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
	bne	$v0, $v1, beq_else.8561
	lwr	$v0, 16($sp)
	lwr	$v1, 12($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	veciprod.2575
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fneg
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	s.s	$f0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fispos
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8562
	l.sl	$f0, l.5848
	j	beq_cont.8563
beq_else.8562:
	l.sr	$f0, 56($sp)
	mov.s	$f0, $f0
beq_cont.8563:
	l.sr	$f1, 8($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 52($sp)
	s.s	$f0, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	o_diffuse.2871
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f1, 60($sp)
	mul.s	$f0, $f1, $f0
	lwr	$v0, 4($sp)
	lwr	$v1, 0($sp)
	j	vecaccum.2609
beq_else.8561:
	jr	$ra
iter_trace_diffuse_rays.5079:
	lwr	$a2, 4($t8)
	li	$a3, 0
	bgt	$a3, $a1, ble_else.8565
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
	jal	d_vec.3089
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	veciprod.2575
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	s.s	$f0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fisneg
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8566
	lwr	$v0, 16($sp)
	sll	$v1, $v0, 2
	lwr	$a0, 12($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	l.sl	$f0, l.6307
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
	j	beq_cont.8567
beq_else.8566:
	lwr	$v0, 16($sp)
	addi	$v1, $v0, 1
	sll	$v1, $v1, 2
	lwr	$a0, 12($sp)
	add	$t9, $a0, $v1
	lwr	$v1, 0($t9)
	l.sl	$f0, l.6309
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
beq_cont.8567:
	lwr	$v0, 16($sp)
	addi	$a1, $v0, -2
	lwr	$t8, 4($sp)
	lwr	$v0, 12($sp)
	lwr	$v1, 20($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8565:
	jr	$ra
trace_diffuse_rays.5101:
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
trace_diffuse_ray_80percent.5107:
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	li	$a3, 0
	sw	$a0, 0($sp)
	sw	$v1, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$v0, 16($sp)
	bne	$v0, $a3, beq_else.8569
	j	beq_cont.8570
beq_else.8569:
	lwr	$a3, 0($a2)
	addi	$v0, $a3, 0
	addi	$t8, $a1, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
beq_cont.8570:
	li	$v0, 1
	lwr	$v1, 16($sp)
	bne	$v1, $v0, beq_else.8571
	j	beq_cont.8572
beq_else.8571:
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
beq_cont.8572:
	li	$v0, 2
	lwr	$v1, 16($sp)
	bne	$v1, $v0, beq_else.8573
	j	beq_cont.8574
beq_else.8573:
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
beq_cont.8574:
	li	$v0, 3
	lwr	$v1, 16($sp)
	bne	$v1, $v0, beq_else.8575
	j	beq_cont.8576
beq_else.8575:
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
beq_cont.8576:
	li	$v0, 4
	lwr	$v1, 16($sp)
	bne	$v1, $v0, beq_else.8577
	jr	$ra
beq_else.8577:
	lwr	$v0, 12($sp)
	lwr	$v0, 16($v0)
	lwr	$t8, 8($sp)
	lwr	$v1, 4($sp)
	lwr	$a0, 0($sp)
	lwr	$s7, 0($t8)
	jr	$s7
calc_diffuse_using_1point.5130:
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
	jal	p_received_ray_20percent.3046
	addi	$sp, $sp, -24
	lwr	$ra, 20($sp)
	lwr	$v1, 16($sp)
	sw	$v0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_nvectors.3079
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 16($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_intersection_points.3006
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v1, 16($sp)
	sw	$v0, 28($sp)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_energy.3036
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
	jal	veccpy.2526
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	lwr	$v0, 16($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_group_id.3056
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
	j	vecaccumv.2676
calc_diffuse_using_5points.5144:
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
	jal	p_received_ray_20percent.3046
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
	jal	p_received_ray_20percent.3046
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
	jal	p_received_ray_20percent.3046
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
	jal	p_received_ray_20percent.3046
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
	jal	p_received_ray_20percent.3046
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
	jal	veccpy.2526
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
	jal	vecadd.2636
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
	jal	vecadd.2636
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
	jal	vecadd.2636
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
	jal	vecadd.2636
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v0, 20($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 16($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_energy.3036
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v1, 8($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lwr	$v1, 0($t9)
	lwr	$v0, 0($sp)
	lwr	$a0, 4($sp)
	j	vecaccumv.2676
do_without_neighbors.5177:
	lwr	$a0, 4($t8)
	li	$a1, 4
	bgt	$v1, $a1, ble_else.8579
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$v0, 8($sp)
	sw	$v1, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	p_surface_ids.3016
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 0
	lwr	$a0, 12($sp)
	sll	$a1, $a0, 2
	add	$t9, $v0, $a1
	lwr	$v0, 0($t9)
	bgt	$v1, $v0, ble_else.8580
	lwr	$v0, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	p_calc_diffuse.3026
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	lwr	$v1, 12($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lwr	$v0, 0($t9)
	li	$a0, 0
	bne	$v0, $a0, beq_else.8581
	j	beq_cont.8582
beq_else.8581:
	lwr	$t8, 4($sp)
	lwr	$v0, 8($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	lwr	$s7, 0($t8)
	jalr	$s7
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
beq_cont.8582:
	lwr	$v0, 12($sp)
	addi	$v1, $v0, 1
	lwr	$t8, 0($sp)
	lwr	$v0, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8580:
	jr	$ra
ble_else.8579:
	jr	$ra
neighbors_exist.5190:
	lwr	$a0, 4($t8)
	lwr	$a1, 4($a0)
	addi	$a2, $v1, 1
	bgt	$a1, $a2, ble_else.8585
	li	$v0, 0
	jr	$ra
ble_else.8585:
	li	$a1, 0
	bgt	$v1, $a1, ble_else.8586
	li	$v0, 0
	jr	$ra
ble_else.8586:
	lwr	$v1, 0($a0)
	addi	$a0, $v0, 1
	bgt	$v1, $a0, ble_else.8587
	li	$v0, 0
	jr	$ra
ble_else.8587:
	li	$v1, 0
	bgt	$v0, $v1, ble_else.8588
	li	$v0, 0
	jr	$ra
ble_else.8588:
	li	$v0, 1
	jr	$ra
get_surface_id.5204:
	sw	$v1, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	p_surface_ids.3016
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	sll	$v1, $v1, 2
	add	$t9, $v0, $v1
	lwr	$v0, 0($t9)
	jr	$ra
neighbors_are_available.5208:
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
	jal	get_surface_id.5204
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
	jal	get_surface_id.5204
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	bne	$v0, $v1, beq_else.8589
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
	jal	get_surface_id.5204
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	bne	$v0, $v1, beq_else.8590
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
	jal	get_surface_id.5204
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	bne	$v0, $v1, beq_else.8591
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
	jal	get_surface_id.5204
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 20($sp)
	bne	$v0, $v1, beq_else.8592
	li	$v0, 1
	jr	$ra
beq_else.8592:
	li	$v0, 0
	jr	$ra
beq_else.8591:
	li	$v0, 0
	jr	$ra
beq_else.8590:
	li	$v0, 0
	jr	$ra
beq_else.8589:
	li	$v0, 0
	jr	$ra
try_exploit_neighbors.5228:
	lwr	$t0, 8($t8)
	lwr	$t1, 4($t8)
	sll	$t2, $v0, 2
	add	$t9, $a1, $t2
	lwr	$t2, 0($t9)
	li	$t3, 4
	bgt	$a3, $t3, ble_else.8593
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
	jal	get_surface_id.5204
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$v1, 40($sp)
	bgt	$v1, $v0, ble_else.8594
	lwr	$v0, 36($sp)
	lwr	$v1, 32($sp)
	lwr	$a0, 28($sp)
	lwr	$a1, 24($sp)
	lwr	$a2, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	neighbors_are_available.5208
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8595
	lwr	$v0, 36($sp)
	sll	$v0, $v0, 2
	lwr	$v1, 28($sp)
	add	$t9, $v1, $v0
	lwr	$v0, 0($t9)
	lwr	$t8, 16($sp)
	lwr	$v1, 20($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8595:
	lwr	$v0, 12($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_calc_diffuse.3026
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	lwr	$a2, 20($sp)
	sll	$v1, $a2, 2
	add	$t9, $v0, $v1
	lwr	$v0, 0($t9)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8596
	j	beq_cont.8597
beq_else.8596:
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
beq_cont.8597:
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
ble_else.8594:
	jr	$ra
ble_else.8593:
	jr	$ra
write_ppm_header.5248:
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
write_rgb_element.5271:
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_int_of_float
	addi	$sp, $sp, -4
	lwr	$ra, 0($sp)
	li	$v1, 255
	bgt	$v0, $v1, ble_else.8600
	li	$v1, 0
	bgt	$v1, $v0, ble_else.8602
	j	ble_cont.8603
ble_else.8602:
	li	$v0, 0
ble_cont.8603:
	j	ble_cont.8601
ble_else.8600:
	li	$v0, 255
ble_cont.8601:
	j	min_caml_print_int
write_rgb.5277:
	lwr	$v0, 4($t8)
	l.sr	$f0, 0($v0)
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.5271
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
	jal	write_rgb_element.5271
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
	jal	write_rgb_element.5271
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	li	$v0, 10
	j	min_caml_print_char
pretrace_diffuse_rays.5293:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	li	$a3, 4
	bgt	$v1, $a3, ble_else.8604
	sw	$t8, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$v1, 16($sp)
	sw	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	get_surface_id.5204
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	li	$v1, 0
	bgt	$v1, $v0, ble_else.8605
	lwr	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_calc_diffuse.3026
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 16($sp)
	sll	$a0, $v1, 2
	add	$t9, $v0, $a0
	lwr	$v0, 0($t9)
	li	$a0, 0
	bne	$v0, $a0, beq_else.8606
	j	beq_cont.8607
beq_else.8606:
	lwr	$v0, 20($sp)
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	p_group_id.3056
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	lwr	$v1, 12($sp)
	sw	$v0, 24($sp)
	addi	$v0, $v1, 0
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	vecbzero.2523
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_nvectors.3079
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v1, 20($sp)
	sw	$v0, 28($sp)
	addi	$v0, $v1, 0
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	p_intersection_points.3006
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
	jal	p_received_ray_20percent.3046
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
	jal	veccpy.2526
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
beq_cont.8607:
	lwr	$v0, 16($sp)
	addi	$v1, $v0, 1
	lwr	$t8, 0($sp)
	lwr	$v0, 20($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8605:
	jr	$ra
ble_else.8604:
	jr	$ra
pretrace_pixels.5315:
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
	bgt	$t6, $v1, ble_else.8610
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
	jal	vecunit_sgn.2540
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	vecbzero.2523
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v0, 28($sp)
	lwr	$v1, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veccpy.2526
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	li	$v0, 0
	l.sl	$f0, l.5847
	lwr	$v1, 20($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 16($sp)
	add	$t9, $a1, $a0
	lwr	$a0, 0($t9)
	l.sl	$f1, l.5848
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
	jal	p_rgb.2996
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	lwr	$v1, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veccpy.2526
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
	jal	p_set_group_id.3067
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
	jal	add_mod5.2499
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
ble_else.8610:
	jr	$ra
pretrace_line.5369:
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
scan_pixel.5402:
	lwr	$a3, 24($t8)
	lwr	$t0, 20($t8)
	lwr	$t1, 16($t8)
	lwr	$t2, 12($t8)
	lwr	$t3, 8($t8)
	lwr	$t4, 4($t8)
	lwr	$t3, 0($t3)
	bgt	$t3, $v0, ble_else.8612
	jr	$ra
ble_else.8612:
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
	jal	p_rgb.2996
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veccpy.2526
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
	bne	$v0, $v1, beq_else.8614
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
	j	beq_cont.8615
beq_else.8614:
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
beq_cont.8615:
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
scan_line.5423:
	lwr	$a3, 12($t8)
	lwr	$t0, 8($t8)
	lwr	$t1, 4($t8)
	lwr	$t2, 4($t1)
	bgt	$t2, $v0, ble_else.8616
	jr	$ra
ble_else.8616:
	lwr	$t1, 4($t1)
	addi	$t1, $t1, -1
	sw	$t8, 0($sp)
	sw	$a2, 4($sp)
	sw	$a1, 8($sp)
	sw	$a0, 12($sp)
	sw	$v1, 16($sp)
	sw	$v0, 20($sp)
	sw	$a3, 24($sp)
	bgt	$t1, $v0, ble_else.8618
	j	ble_cont.8619
ble_else.8618:
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
ble_cont.8619:
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
	jal	add_mod5.2499
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
create_float5x3array.5444:
	li	$v0, 3
	l.sl	$f0, l.5848
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
	l.sl	$f0, l.5848
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
	l.sl	$f0, l.5848
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 8($v1)
	li	$v0, 3
	l.sl	$f0, l.5848
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 12($v1)
	li	$v0, 3
	l.sl	$f0, l.5848
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	lwr	$v1, 0($sp)
	sw	$v0, 16($v1)
	addi	$v0, $v1, 0
	jr	$ra
create_pixel.5471:
	li	$v0, 3
	l.sl	$f0, l.5848
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	min_caml_create_float_array
	addi	$sp, $sp, -4
	lwr	$ra, 0($sp)
	sw	$v0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	create_float5x3array.5444
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
	jal	create_float5x3array.5444
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	sw	$v0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	create_float5x3array.5444
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
	jal	create_float5x3array.5444
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
init_line_elements.5493:
	li	$a0, 0
	bgt	$a0, $v1, ble_else.8620
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	create_pixel.5471
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	lwr	$v1, 4($sp)
	sll	$a0, $v1, 2
	lwr	$a1, 0($sp)
	add	$t9, $a1, $a0
	sw	$v0, 0($t9)
	addi	$v1, $v1, -1
	addi	$v0, $a1, 0
	j	init_line_elements.5493
ble_else.8620:
	jr	$ra
create_pixelline.5502:
	lwr	$v0, 4($t8)
	lwr	$v1, 0($v0)
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	create_pixel.5471
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
	j	init_line_elements.5493
tan.5513:
	s.s	$f0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_sin
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	l.sr	$f1, 0($sp)
	s.s	$f0, 4($sp)
	mov.s	$f0, $f1
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_cos
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	l.sr	$f1, 4($sp)
	div.s	$f0, $f1, $f0
	jr	$ra
adjust_position.5517:
	mul.s	$f0, $f0, $f0
	l.sl	$f2, l.6299
	add.s	$f0, $f0, $f2
	s.s	$f1, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_sqrt
	addi	$sp, $sp, -8
	lwr	$ra, 4($sp)
	l.sl	$f1, l.5847
	div.s	$f1, $f1, $f0
	s.s	$f0, 4($sp)
	mov.s	$f0, $f1
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	min_caml_atan
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	l.sr	$f1, 0($sp)
	mul.s	$f0, $f0, $f1
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	tan.5513
	addi	$sp, $sp, -12
	lwr	$ra, 8($sp)
	l.sr	$f1, 4($sp)
	mul.s	$f0, $f0, $f1
	jr	$ra
calc_dirvec.5529:
	lwr	$a1, 4($t8)
	li	$a2, 5
	bgt	$a2, $v0, ble_else.8621
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
	l.sl	$f1, l.5847
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
	l.sl	$f3, l.5847
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
	jal	d_vec.3089
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f0, 36($sp)
	l.sr	$f1, 32($sp)
	l.sr	$f2, 28($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	vecset.2505
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
	jal	d_vec.3089
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f0, 32($sp)
	sw	$v0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fneg
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	mov.s	$f2, $f0
	lwr	$v0, 40($sp)
	l.sr	$f0, 36($sp)
	l.sr	$f1, 28($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecset.2505
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
	jal	d_vec.3089
	addi	$sp, $sp, -48
	lwr	$ra, 44($sp)
	l.sr	$f0, 36($sp)
	sw	$v0, 44($sp)
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	min_caml_fneg
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 32($sp)
	s.s	$f0, 48($sp)
	mov.s	$f0, $f1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	mov.s	$f2, $f0
	lwr	$v0, 44($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	vecset.2505
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
	jal	d_vec.3089
	addi	$sp, $sp, -56
	lwr	$ra, 52($sp)
	l.sr	$f0, 36($sp)
	sw	$v0, 52($sp)
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	min_caml_fneg
	addi	$sp, $sp, -60
	lwr	$ra, 56($sp)
	l.sr	$f1, 32($sp)
	s.s	$f0, 56($sp)
	mov.s	$f0, $f1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fneg
	addi	$sp, $sp, -64
	lwr	$ra, 60($sp)
	l.sr	$f1, 28($sp)
	s.s	$f0, 60($sp)
	mov.s	$f0, $f1
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	min_caml_fneg
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	mov.s	$f2, $f0
	lwr	$v0, 52($sp)
	l.sr	$f0, 56($sp)
	l.sr	$f1, 60($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	vecset.2505
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
	jal	d_vec.3089
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	l.sr	$f0, 36($sp)
	sw	$v0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fneg
	addi	$sp, $sp, -72
	lwr	$ra, 68($sp)
	l.sr	$f1, 28($sp)
	s.s	$f0, 68($sp)
	mov.s	$f0, $f1
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	min_caml_fneg
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	mov.s	$f1, $f0
	lwr	$v0, 64($sp)
	l.sr	$f0, 68($sp)
	l.sr	$f2, 32($sp)
	sw	$ra, 72($sp)
	addi	$sp, $sp, 76
	jal	vecset.2505
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
	jal	d_vec.3089
	addi	$sp, $sp, -76
	lwr	$ra, 72($sp)
	l.sr	$f0, 28($sp)
	sw	$v0, 72($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fneg
	addi	$sp, $sp, -80
	lwr	$ra, 76($sp)
	lwr	$v0, 72($sp)
	l.sr	$f1, 36($sp)
	l.sr	$f2, 32($sp)
	j	vecset.2505
ble_else.8621:
	s.s	$f2, 76($sp)
	sw	$a0, 0($sp)
	sw	$v1, 8($sp)
	sw	$t8, 80($sp)
	s.s	$f3, 84($sp)
	sw	$v0, 88($sp)
	mov.s	$f0, $f1
	mov.s	$f1, $f2
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	adjust_position.5517
	addi	$sp, $sp, -96
	lwr	$ra, 92($sp)
	lwr	$v0, 88($sp)
	addi	$v0, $v0, 1
	l.sr	$f1, 84($sp)
	s.s	$f0, 92($sp)
	sw	$v0, 96($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	adjust_position.5517
	addi	$sp, $sp, -104
	lwr	$ra, 100($sp)
	mov.s	$f1, $f0
	lwr	$t8, 80($sp)
	lwr	$v0, 96($sp)
	lwr	$v1, 8($sp)
	lwr	$a0, 0($sp)
	l.sr	$f0, 92($sp)
	l.sr	$f2, 76($sp)
	l.sr	$f3, 84($sp)
	lwr	$s7, 0($t8)
	jr	$s7
calc_dirvecs.5589:
	lwr	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.8622
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
	l.sl	$f1, l.6403
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6404
	sub.s	$f2, $f0, $f1
	li	$v0, 0
	l.sl	$f0, l.5848
	l.sl	$f1, l.5848
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
	l.sl	$f1, l.6403
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6299
	add.s	$f2, $f0, $f1
	li	$v0, 0
	l.sl	$f0, l.5848
	l.sl	$f1, l.5848
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
	jal	add_mod5.2499
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	addi	$v1, $v0, 0
	lwr	$t8, 0($sp)
	lwr	$v0, 24($sp)
	lwr	$a0, 12($sp)
	l.sr	$f0, 8($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8622:
	jr	$ra
calc_dirvec_rows.5619:
	lwr	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.8624
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
	l.sl	$f1, l.6403
	mul.s	$f0, $f0, $f1
	l.sl	$f1, l.6404
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
	jal	add_mod5.2499
	addi	$sp, $sp, -28
	lwr	$ra, 24($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 8($sp)
	addi	$a0, $v0, 4
	lwr	$t8, 0($sp)
	lwr	$v0, 20($sp)
	lwr	$s7, 0($t8)
	jr	$s7
ble_else.8624:
	jr	$ra
create_dirvec.5637:
	lwr	$v0, 4($t8)
	li	$v1, 3
	l.sl	$f0, l.5848
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
create_dirvec_elements.5645:
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.8626
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
ble_else.8626:
	jr	$ra
create_dirvecs.5654:
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.8628
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
ble_else.8628:
	jr	$ra
init_dirvec_constants.5667:
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v1, ble_else.8630
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
ble_else.8630:
	jr	$ra
init_vecset_constants.5675:
	lwr	$v1, 8($t8)
	lwr	$a0, 4($t8)
	li	$a1, 0
	bgt	$a1, $v0, ble_else.8632
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
ble_else.8632:
	jr	$ra
init_dirvecs.5683:
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
add_reflection.5692:
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
	jal	d_vec.3089
	addi	$sp, $sp, -40
	lwr	$ra, 36($sp)
	l.sr	$f0, 28($sp)
	l.sr	$f1, 24($sp)
	l.sr	$f2, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	vecset.2505
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
setup_rect_reflection.5705:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sll	$v0, $v0, 2
	lwr	$a3, 0($a0)
	l.sl	$f0, l.5847
	sw	$a0, 0($sp)
	sw	$a3, 4($sp)
	sw	$a2, 8($sp)
	sw	$v0, 12($sp)
	sw	$a1, 16($sp)
	s.s	$f0, 20($sp)
	addi	$v0, $v1, 0
	sw	$ra, 24($sp)
	addi	$sp, $sp, 28
	jal	o_diffuse.2871
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
	jal	min_caml_fneg
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	lwr	$v0, 16($sp)
	l.sr	$f1, 4($v0)
	s.s	$f0, 28($sp)
	mov.s	$f0, $f1
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	min_caml_fneg
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	lwr	$v0, 16($sp)
	l.sr	$f1, 8($v0)
	s.s	$f0, 32($sp)
	mov.s	$f0, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
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
setup_surface_reflection.5746:
	lwr	$a0, 12($t8)
	lwr	$a1, 8($t8)
	lwr	$a2, 4($t8)
	sll	$v0, $v0, 2
	addi	$v0, $v0, 1
	lwr	$a3, 0($a0)
	l.sl	$f0, l.5847
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
	jal	o_diffuse.2871
	addi	$sp, $sp, -32
	lwr	$ra, 28($sp)
	l.sr	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lwr	$v0, 20($sp)
	s.s	$f0, 28($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	o_param_abc.2816
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	addi	$v1, $v0, 0
	lwr	$v0, 16($sp)
	sw	$ra, 32($sp)
	addi	$sp, $sp, 36
	jal	veciprod.2575
	addi	$sp, $sp, -36
	lwr	$ra, 32($sp)
	l.sl	$f1, l.5971
	lwr	$v0, 20($sp)
	s.s	$f0, 32($sp)
	s.s	$f1, 36($sp)
	sw	$ra, 40($sp)
	addi	$sp, $sp, 44
	jal	o_param_a.2774
	addi	$sp, $sp, -44
	lwr	$ra, 40($sp)
	l.sr	$f1, 36($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 16($sp)
	l.sr	$f2, 0($v0)
	sub.s	$f0, $f0, $f2
	l.sl	$f2, l.5971
	lwr	$v1, 20($sp)
	s.s	$f0, 40($sp)
	s.s	$f2, 44($sp)
	addi	$v0, $v1, 0
	sw	$ra, 48($sp)
	addi	$sp, $sp, 52
	jal	o_param_b.2788
	addi	$sp, $sp, -52
	lwr	$ra, 48($sp)
	l.sr	$f1, 44($sp)
	mul.s	$f0, $f1, $f0
	l.sr	$f1, 32($sp)
	mul.s	$f0, $f0, $f1
	lwr	$v0, 16($sp)
	l.sr	$f2, 4($v0)
	sub.s	$f0, $f0, $f2
	l.sl	$f2, l.5971
	lwr	$v1, 20($sp)
	s.s	$f0, 48($sp)
	s.s	$f2, 52($sp)
	addi	$v0, $v1, 0
	sw	$ra, 56($sp)
	addi	$sp, $sp, 60
	jal	o_param_c.2802
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
setup_reflections.5785:
	lwr	$v1, 12($t8)
	lwr	$a0, 8($t8)
	lwr	$a1, 4($t8)
	li	$a2, 0
	bgt	$a2, $v0, ble_else.8637
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
	jal	o_reflectiontype.2735
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 2
	bne	$v0, $v1, beq_else.8638
	lwr	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_diffuse.2871
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	l.sl	$f1, l.5847
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	min_caml_fless
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 0
	bne	$v0, $v1, beq_else.8639
	jr	$ra
beq_else.8639:
	lwr	$v0, 12($sp)
	sw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jal	o_form.2722
	addi	$sp, $sp, -20
	lwr	$ra, 16($sp)
	li	$v1, 1
	bne	$v0, $v1, beq_else.8641
	lwr	$t8, 8($sp)
	lwr	$v0, 4($sp)
	lwr	$v1, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8641:
	li	$v1, 2
	bne	$v0, $v1, beq_else.8642
	lwr	$t8, 0($sp)
	lwr	$v0, 4($sp)
	lwr	$v1, 12($sp)
	lwr	$s7, 0($t8)
	jr	$s7
beq_else.8642:
	jr	$ra
beq_else.8638:
	jr	$ra
ble_else.8637:
	jr	$ra
rt.5798:
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
	l.sl	$f0, l.6437
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
	jal	d_vec.3089
	addi	$sp, $sp, -68
	lwr	$ra, 64($sp)
	lwr	$v1, 20($sp)
	sw	$ra, 64($sp)
	addi	$sp, $sp, 68
	jal	veccpy.2526
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




