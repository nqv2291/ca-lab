# Assignment 2
# a) i <= n

	.data
array:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25
output: .asciiz "Sum array = "

	.text
main:
	la	$t0, array
	li	$t2, 0          # $t2 = i   = 0
	li	$t3, 0          # $t3 = sum = 0
	li	$t9, 5		# $t9 = n   = 5

loop:
	# condition of loop
	sle	$t7, $t2, $t9	# i < n ?
	beq	$t7, $zero, end
	
	# load array to $t4
	lw	$t4, ($t0)
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
