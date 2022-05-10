#Laboratory Exercise 5, Sample Code 3
.data
	string:	.space 10
	Message1: .asciiz "Nhap xau:"
	Message2: .asciiz "Do dai la "

.text
main:
get_string:
	li	$v0, 8
	la	$a0, string
	li	$a1, 5
	syscall
 
get_length: 
	la 	$a0, string 		# a0 = Address(string[0])
 	xor 	$t0, $zero, $zero 	#?li t0 = i = 0		
check_char: 
	add	$t1, $a0, $t0 		# t1 = a0 + t0 
 					#    = Address(string[0]+i) 
 	lb 	$t2, 0($t1) 		# t2 = string[i]
 	beq 	$t2,$zero,end_of_str 	# Is null char? 
 	addi	$t0, $t0, 1		#? t0=t0+1->i = i + 1
 	j 	check_char
end_of_str: 
end_of_get_length:
print_length:
	li	$v0, 1
	addi	$a0, $t0, 0
	syscall
