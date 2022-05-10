.data
	message1: .asciiz "True\n"
	message2: .asciiz "False\n"
	number1: .float 10.6
	number2: .float 10.6
.text
	lwc1 $f2, number1
	lwc1 $f4, number2
	
	# condition check
	c.eq.s $f2, $f4
	bc1t exit
	
	li	$v0, 4
	la	$a0, message2
	syscall
	
	j endif
exit:
	li	$v0, 4
	la	$a0, message1
	syscall
endif: