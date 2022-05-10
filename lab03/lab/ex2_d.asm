# Assignment 2
# d) sum >= 100 OR A[i] >= 50

	.data
array:	.word 0, 1, 2, 50, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
output: .asciiz "Sum array = "

	.text
main:
	la	$t0, array
	li	$t2, 0          # $t2 = i   = 0
	li	$t3, 0          # $t3 = sum = 0
	li	$t8, 50		# $t8 = end_value = 50
	li	$t9, 100	# $t9 = stop_sum = 100
	
loop:
	# load array to $t4
	lw	$t4, ($t0)
	
	# condition of loop
	slt	$t6, $t4, $t8	# A[i] < 50 ?
	seq	$t6, $t6, $zero # A[i] >= 50 ?
	
	slt	$t7, $t3, $t9	# sum < 100 ?
	seq	$t7, $t7, $zero	# sum >= 100 ?	
	
	or	$t7, $t7, $t6 # sum >= 100 OR A[i] >= 50
	bne	$t7, $zero, end	
	
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
