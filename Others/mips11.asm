.data
	newline: .asciiz "\n"
.text
	li 	$s0, 0xa
	li	$s1, 0x01020304
	li	$s2, 0xfcd987ab

outerloop:
	li	$t7, 8
	li	$t2, 0
loop:
