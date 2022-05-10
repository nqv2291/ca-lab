.data
	str: .asciiz "\n"
.text
	li 	$s0, 0xa110
	li	$s1, 0xa
	

outerloop:
	li	$t9, 8
	li	$t2, 0
loop:
	andi	$t1, $s0, 0xf0000000
	srl	$t1, $t1, 28
	or	$t2, $t2, $t1
	sll	$s0, $s0, 4
	
	# division
	div	$t0, $t2, 10
	mfhi	$t3
	sll	$t2, $t3, 4
	
	# store quotient
	sll	$t8, $t8, 4
	or	$t8, $t8, $t0
		
	addi	$t9, $t9, -1
	bnez	$t9, loop

print:
	# print --------------------------------
	li	$v0, 34
	add	$a0, $zero, $t8
	syscall
	
	li	$v0, 4
	la	$a0, str
	syscall
	
	li	$v0, 1
	add	$a0, $zero, $t3
	syscall
	
	li	$v0, 4
	la	$a0, str
	syscall

# repeat outer loop
	add	$s0, $zero, $t8
	bnez	$s0, outerloop


	sll	$s3, $s3, 4
	andi	$t4, $s4, 0xf0000000
	srl	$t4, $t4, 28
	sll	$s4, $s4, 4
	or	$s3, $s3, $t4
	
	add	$t9, $t9, -1
	bne	$t9, $zero, LOOP_DECIMAL
