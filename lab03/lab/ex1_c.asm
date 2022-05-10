# Assignment 1
# c) i + j > m + n?

	.data
true_statement:		.asciiz 	"i + j > m + n is True\n"
false_statement:	.asciiz		"i + j > m + n is False\n"

	.text
start:
	li	$s1, -5		# i
	li	$s2, 4		# j
	li	$s3, 0		# m
	li	$s4, -1		# n

	add	$s5, $s1, $s2	# $s5 = i  + j
	add	$s6, $s3, $s4	# $s6 = m + n
	slt	$t0, $s6, $s5	# $t0 = (m+n) < (i+j) ?
	bne	$t0, $zero, true# $t0 == 0 ?
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
