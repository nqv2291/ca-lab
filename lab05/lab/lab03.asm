.data
	string:	.space 16
	inp_str: .asciiz "Enter a number: "
	out_str: .asciiz "\nReversed string: "

.text
	# print input text
	li	$v0, 4
	la	$a0, inp_str
	syscall
	
	# read string
	li	$v0, 8
	la	$a0, string
	li	$a1, 16
	syscall
	
	# load string
	la	$a1, string	# a1 = addr(string)
	li	$s0, 0		# s0 = i = 0
	
count_len:
	add	$t1, $a1, $s0	# addr(str[i]) = addr(str[0]) + i
	lb	$t2, 0($t1)	# t2 = value at address stored in t1
	beq	$t2, $zero, end_count	# end if str is terminated by Enter
	beq	$t2, 10, end_count	# end if str is terminated when reach 15 character
	addi	$s0, $s0, 1
	j	count_len

end_count:
	# print output text
	li	$v0, 4
	la	$a0, out_str
	syscall

print_reverse:
	li	$v0, 11
	add	$a0, $zero, $t2
	syscall
	addi	$s0, $s0, -1	# i--
	add	$t1, $a1, $s0	# addr(str[i]) = addr(str[0]) + i
	lb	$t2, 0($t1)	# t2 = value at address stored in t1
	blt	$s0, $zero, end
	j	print_reverse
	
end:


