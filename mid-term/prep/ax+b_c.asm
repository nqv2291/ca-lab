.data
	newline: .asciiz "\n"
.text
	# y = ax + b
	# a = ?
	li 	$v0, 6
	syscall
	mov.s 	$f1, $f0
	
	# b = ?
	li 	$v0, 6
	syscall
	mov.s	$f2, $f0
	
	# c = ?
	li	$v0, 6
	syscall
	mov.s	$f5, $f0
	
	# n = ?
	li	$v0, 5
    	syscall
    	move	$t1, $v0		# counter = n
	mtc1	$v0, $f6
	cvt.s.w	$f6, $f6
	# element length
	li	$t0, 0x40000000		# set t0 to hexa value for double number: 2.0
	mtc1	$t0, $f7		# f7 = 2.0
	mul.s	$f7, $f7, $f5		# f7 = 2*c
	div.s	$f7, $f7, $f6		# f7 = (2*c)/n
	
	mtc1	$t0, $f11		# $f11 = 2.0 (reserved for later use)
	mtc1	$zero, $f9		# x2 = 0
	sub.s	$f9, $f9, $f5		# x2 = 0 - c = -c
	mtc1	$zero, $f15		# final sum = 0
	
	# print sum
	mov.s	$f12, $f15
	li	$v0, 2
	syscall	
	li	$v0, 4
	la	$a0, newline
	syscall
loop:
	mov.s	$f8, $f9		# x1 = x2
	add.s	$f9, $f8, $f7		# x2 = x1 + c

	# $f13 = f(x1)
	mul.s	$f13, $f1, $f8
	add.s	$f13, $f13, $f2
	# $f14 = f(x2)
	mul.s	$f14, $f1, $f9
	add.s	$f14, $f14, $f2
	# calculate element area
	add.s	$f10, $f13, $f14		# area = f(x1) + f(x2)
	mul.s	$f10, $f10, $f7			# area = (f(x1) + f(x2)) * (element length)
	div.s	$f10, $f10, $f11		# area = (f(x1) + f(x2)) * (element length) / 2
	# add to total sum
	add.s	$f15, $f15, $f10
	
	# print sum
	mov.s	$f12, $f15
	li	$v0, 2
	syscall	
	li	$v0, 4
	la	$a0, newline
	syscall
	
	# loop condition
	addi	$t1, $t1, -1
	bnez	$t1, loop

	
	
