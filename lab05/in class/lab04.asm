.data
	Message: .asciiz "Bo mon Ky thuat May tinh"
	Address: .asciiz " - Dia chi: phong 502, B1"

.text
	li	$v0, 59
	la	$a0, Message
	la	$a1, Address
	syscall