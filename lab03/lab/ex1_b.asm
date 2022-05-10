# Assignment 1
# b) i + j >= 0?

	.data
true_statement:		.asciiz 	"i + j >= 0 is True\n"
false_statement:	.asciiz		"i + j >= 0 is False\n"

	.text
start:
	li	$s1, -5		# i
	li	$s2, 3		# j

	add	$s3, $s1, $s2	# $s3 = i  + j
	slt	$t0, $s3, $zero	# $s3 < 0 ?
	beq	$t0, $zero, true# $t0 == 0 ?
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
