	li	$v0, 1		# service 1 is print integer
	li	$a0, 0x11	# the integer to be printed is 17
	syscall			# execute