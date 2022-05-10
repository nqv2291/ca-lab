#Hello, world!
	.data
greeting:	.asciiz 	"Hello, "
name:		.asciiz		"Viet"

	.text
main:
	li	$t1, 8
	li	$t0, 2
	div	$t1, $t0
	syscall
