# Assignment 1
# d) (i <= j) AND (i+j >= 0)

	.data
true_statement:		.asciiz 	"(i <= j) AND (i+j >= 0) is True\n"
false_statement:	.asciiz		"(i <= j) AND (i+j >= 0) is False\n"

	.text
start:
	li	$s1, -3		# i
	li	$s2, 5		# j

	slt	$t0, $s2, $s1	# j < i ?
	seq	$t0, $t0, $zero # i <= j ?
	
	add	$s3, $s1, $s2	# $s3 = i + j
	slt	$t1, $s3, $zero	# (i + j) < 0?
	seq	$t1, $t1, $zero	# (i + j) >= 0?
	
	and	$t2, $t0, $t1	# (i <= j) AND (i+j >= 0) ?	
	bne	$t2, $zero, true
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
