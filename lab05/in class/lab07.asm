.data
	message: .space 10	# buffer 100 bytes reserved for string

.text
	li	$v0, 8
	la	$a0, message
	li	$a1, 10
	syscall