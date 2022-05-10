 .text
 	# load 2 numbers having the same sign
	li $s1, 0xffffffff
	li $s2, 0xffffffff
start:
	li $t0, 0		# No overflow is set as default status
	addu $s3, $s1, $s2 	# s3 = s1 + s2 (without overflow)
	xor $t1, $s1, $s3 	# Check if $s1 and the sum $s3 have the same sign?
				# $t1 > 0 if same sign, $t1 < 0 otherwise

	bltz $t1, OVERFLOW 	# Exit if NOT same sign (doesn't occur overflow)
	j EXIT
OVERFLOW:
	li $t0,1 		# The result overflows ($t0 = 1 if overflows)
EXIT:
