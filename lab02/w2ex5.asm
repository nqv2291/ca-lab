#Laboratory Exercise 2, Assignment 6
.data			# Declare variables
X :	.word	5
Y :	.word	-1
Z :	.word

.text			# Declare instructions
	# Load X, Y to registers
	la	$t8, X
	la	$t9, Y
	lw	$t1, 0($t8)
	lw	$t2, 0($t9)
	
	# Calculate the expression Z = 2X + Y with registers only
	add	$s0, $t1, $t1
	add	$s0, $s0, $t2
	
	# Store result from register to variable Z
	la	$t7, Z
	sw	$s0, 0($t7)
	