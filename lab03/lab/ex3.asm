# Assignment 2
# a) i <= n

	.data
array:	.word -36, -23, -19, 9, 11, 14, 26, 33, 41, 56
size:	.word 10
output1: .asciiz "\n1st abs largest value: "
output2: .asciiz "\n2nd abs largest value: "
output3: .asciiz "\n3rd abs largest value: "

	.text
main:
	la	$t0, array
	# initialize 3 largest value to 0
	li	$t1, 0		# 1st
	li	$t2, 0		# 2nd
	li	$t3, 0		# 3rd
	li	$t4, 0		# i = 0
	lw	$t8, size

loop:
	# condition of loop
	slt	$t9, $t4, $t8	# i < n ?
	beq	$t9, $zero, end	
	
	# load array element to $t5 and store its abs value to $t6
	lw	$t5, ($t0)
	abs	$t6, $t5
	
	# Compare A[i] to 3 current largest values	
	abs	$t7, $t1
	slt	$t9, $t7, $t6
	bne	$t9, $zero, max1
	abs	$t7, $t2
	slt	$t9, $t7, $t6
	bne	$t9, $zero, max2
	abs	$t7, $t3
	slt	$t9, $t7, $t6
	bne	$t9, $zero, max3
	j	increment
	
max1:
	add	$t3, $t2, $zero
	add	$t2, $t1, $zero
	add	$t1, $t5, $zero
	j	increment
max2:
	add	$t3, $t2, $zero
	add	$t2, $t5, $zero
	j	increment
max3:
	add	$t3, $t5, $zero	
	j	increment
	
increment:	
	# move $t0 to the next element in array
	addi	$t0, $t0, 4
	
	# i++
	addi	$t4, $t4, 1
	j loop
end:


# print string
la	$a0, output1
li	$v0, 4
syscall

#print 1st largest value
add	$a0, $zero, $t1
li	  $v0, 1
syscall

# print string
la	$a0, output2
li	$v0, 4
syscall

#print 2nd largest value
add	$a0, $zero, $t2
li	  $v0, 1
syscall

# print string
la	$a0, output3
li	$v0, 4
syscall

#print 3rd largest value
addu	$a0, $0, $t3
li	  $v0, 1
syscall
