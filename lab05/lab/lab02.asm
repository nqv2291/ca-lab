# Write an assembly program that gets a string from the input dialog and then print 
# out the string length to the message dialog.

.data
	input_message:	.asciiz "Enter a string"
	output_message:	.asciiz "Length of string is: "
	string:		.space	100
	
.text
	# read string from input dialog
	li	$v0, 54
	la	$a0, input_message
	la	$a1, string
	li	$a2, 100
	syscall
	
	# init i and address of string
	li	$s0, 0		# s0 = i = 0
	la	$a0, string

check_char:
	add	$t1, $a0, $s0	# address of current character: 
				# t1 = a0 + s0
				# addr (str[i]) = addr (str[0] + i)
	lb	$t2, 0($t1)	# character at addr t1 is stored in t2
	beq	$t2, 10, print_length	# check for string that is terminated early
	beq	$t2, $zero, print_length	# check for string that reach maximum length
	addi	$s0, $s0, 1	# t0 = i++
	j	check_char

print_length:
	li	$v0, 56
	la	$a0, output_message
	add	$a1, $zero, $s0
	syscall
				
