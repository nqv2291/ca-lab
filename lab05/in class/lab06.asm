.data
	string: .asciiz "Enter a number"

.text
	li	$v0, 51
	la	$a0, string
	syscall