# Assignment 1
# a) i <= j

	.data
true_statement:		.asciiz 	"i <= j is True\n"
false_statement:	.asciiz		"i <= j is False\n"
	.text

start:
	li	$s1, 4		# i
	li	$s2, 4		# j

	slt	$t0, $s2, $s1	# j < i ?
	beq	$t0, $zero, true
	# print false
	li	$v0, 4
	la	$a0, false_statement
	syscall
	j	endif
true:
	# print true
	li	$v0, 4
	la	$a0, true_statement
	syscall
endif:
