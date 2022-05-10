.data
	# Message is the address of the string
	Message: .asciiz "So nguyen la: "
.text
	li	$v0, 56
	la	$a0, Message
	li	$a1, 12		# ??? How to print dialog without this number!
	syscall