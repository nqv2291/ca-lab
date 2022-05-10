.data
	string: .asciiz "Hello, world!"

.text
	li	$v0, 4
	la	$a0, string
	syscall