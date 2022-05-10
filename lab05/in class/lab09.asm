.data
	char: .byte 'v'

.text
	li 	$v0, 11
	la	$t0, char
	lw	$a0, 0($t0)
	syscall