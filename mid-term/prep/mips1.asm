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
	li	$v0, 6
	syscall
	mov.s	$f6, $f0
	
	# y = ax + b
	mul.s	$f8, $f2, $f6	# a*x
	add.s	$f8, $f8, $f4	# a*x + b
	
	# print a
	mov.d	$f12, $f2
	li	$v0, 2
	syscall	
	li	$v0, 4
	la	$a0, newline
	syscall
	
	# print b
	mov.d	$f12, $f4
	li	$v0, 2
	syscall	
	li	$v0, 4
	la	$a0, newline
	syscall
	
	# print (ax + b)
	mov.d	$f12, $f8
	li	$v0, 2
	syscall	
	li	$v0, 4
	la	$a0, newline
	syscall
	