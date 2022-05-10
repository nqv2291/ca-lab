# Assignment 2
# c) A[i] % 2 = 0

	.data

array:	.word 1, 3, 5, 0, 7
output: .asciiz "Sum array = "

	.text
main:
	la	$t0, array
	li	$t2, 0          # $t2 = i   = 0
	li	$t3, 0          # $t3 = sum = 0
	li	$t9, 2		# $t9 = 2

loop:
	
	
	# load array to $t4
	lw	$t4, ($t0)
	
	# condition of loop
	div	$t4, $t9	# A[i]/2 then store remainder in HI
	mfhi	$t7
	beq	$t7, $zero, end	# end loop if hi != 0
	
	# Add $t4 to sum at $t3
	add	$t3, $t3, $t4
	
	# move $t0 to the next element in array
	addi	$t0, $t0, 4
	
	# i++
	addi	$t2, $t2, 1
	j loop
end:

# print string "sum"
la	$a0, output
li	$v0, 4
syscall

#print sum of array
addu	$a0, $0, $t3
li	  $v0, 1
syscall
