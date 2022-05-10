.data
	message: .asciiz "Ho va ten sinh vien"
	input:	 .space 9
.text
	li	$v0, 54
	la	$a0, message
	la	$a1, input
	li	$a2, 9
	syscall