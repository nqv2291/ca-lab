	li $s1, 0x00001234
	li $s1, 10

abs:
	sra $t0, $s1, 31
	xor $s1, $s1, $t0
	subu $s1, $s1, $t0	

move:
	addu $s0, $zero, $s1

not:
	nor $s0, $zero, $s1

ble:
	slt $t1, $s2, $s1
	beq $t1, $zero, Exit

Exit: