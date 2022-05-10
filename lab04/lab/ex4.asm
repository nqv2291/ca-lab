# n = 0000 1010 1111 1011 0100 1000 0000 0000 
#   = 0x0afb4800

.text
	li $s0, 0x0afb4800	# init the number contains ABCDE(10)
	li $s1, 32		# store int 32 to $s1
	li $t1, 0		# check if ABCDE is found

loop:
	# end loop if the number ABCDE is found at the most left
	andi $t0, $s0, 0x80000000
	bltz $t0, endloop
	
	# shift the number to the left by 1 bit
	sll $s0, $s0, 1
	j loop

endloop:
	li $t1, 1		# $t1 = 1 means the sequence is found
	srl $s0, $s0, 15	# Remove all redundant zero at the right
				# of 17-bit number ABCDE
	
	# Multiply the number with 32, then store in $s0
	mult $s0, $s1
	mflo $s0