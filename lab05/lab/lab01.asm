# Write an assembly program to print out the sum of two register $s0 and $s1
# according to the following format:
# “The sum of (content of $s0) and (content of $s1) is (result)”.

.data
	str1:	.asciiz	"The sum of "
	str2:	.asciiz " and "
	str3:	.asciiz " is "
	
.text
	# create s0, s1 and their sum s2
	li	$s0, 9
	li	$s1, 1
	add	$s2, $s0, $s1
	
	# print result
	li	$v0, 4
	la	$a0, str1
	syscall
	
	li	$v0, 1
	add	$a0, $zero, $s0
	syscall
	
	li	$v0, 4
	la	$a0, str2
	syscall
	
	li	$v0, 1
	add	$a0, $zero, $s1
	syscall
	
	li	$v0, 4
	la	$a0, str3
	syscall
	
	li	$v0, 1
	add	$a0, $zero, $s2
	syscall