.text
	# assign a 32-bit number to $s0
	li $s0, 0x12345678
	
	# extract the MSB of $s0
	andi $t0, $s0, 0xff000000 
	
	# Clear the LSB of $s0
	andi $t1, $s0, 0xffffff00
	
	# Set the LSB of $s0 (all bits are set to 1)
	ori $t2, $s0, 0x000000ff
	
	# Clear register $s0 ($s0=0)
	andi $t3, $s0, 0x00000000
	
	# exchange the MSB of $s0 with the LSB
	andi $t4, $s0, 0x00ffff00
	
	srl $t5, $s0, 24
	or $t4, $t4, $t5
	
	sll $t5, $s0, 24
	or $t4, $t4, $t5
	
	