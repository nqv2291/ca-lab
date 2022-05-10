.data
	x: .word 0x7FFFFFFF
	y: .word 0x0000000F
	hexa_str: .space 17
	decimal_str: .space 21
	message: .asciiz "The multiplication of "
	word_link1: .asciiz " and "
	word_link2: .asciiz " is "
	char_dot: .asciiz "."
	hexa_sign: .asciiz "0x"
	newline: .asciiz "\n"

.text
	# Calculate x * y
	lw 	$s6, x
	lw 	$s7, y
	mult	$s6, $s7
	mfhi	$s1
	mflo	$s2
	
decimal:
	add	$s3, $zero, $s1			# copy value of HI register to s3
	add	$s4, $zero, $s2			# copy value of HI register to s4
	la	$s5, decimal_str
	sb	$zero, 20($s5)
	addi	$s5, $s5, 19 

LOOP_DECIMAL:
	# set t5 (remainder), t8 (64bit-upper quotient), t9 (64bit-lower quotient) to zero
	xor	$t5, $zero, $zero
	xor	$t8, $zero, $zero
	xor	$t9, $zero, $zero
	li	$t7, 8				# counter t = 8

DIVISION:
	srl	$t4, $s3, 28		# store most left digit of s3 in t4
	sll	$t5, $t5, 4
	or	$t5, $t5, $t4		# combine previous remainder with new digit t4
	div	$t6, $t5, 10		# divide by 10, set t6 = quotient
	mfhi	$t5			# set t5 = new remainder
	
	# store quotient to t8 (higher bits) and t9 (lower bits)
	srl	$t0, $t9, 28		# store most left digit of t9 
	sll	$t8, $t8, 4		# into most right digit of t8
	or	$t8, $t8, $t0
	
	sll	$t9, $t9, 4		# combine previous quotient 
	or	$t9, $t9, $t6		# with current quotient
	
	# shift s3 (current dividend) to the right until all digits are taken
	sll	$s3, $s3, 4		# shift left s3 to get new most left digit
	add	$t7, $t7, -1
	bnez	$t7, DIVISION		# loop condition for each register,
					# end loop if the counter = 0
	# if s3 (LO register) is finished, then transfer value in s4 to s3
	li	$t7, 8
	add	$s3, $zero, $s4		# copy value of LO register to s3
	xor	$s4, $zero, $zero
	bnez	$s3, DIVISION		# loop condition for both 2 register,
					# end loop if both 2 registers are used
	
	# run backward to store each decimal character bottom up into string.
	addi	$t5, $t5, 48
	sb	$t5, 0($s5)
	addi	$s5, $s5, -1
	
	# update s3 & s4, remainder = 0
	add	$s3, $zero, $t8
	add	$s4, $zero, $t9
	bnez	$t9, LOOP_DECIMAL
	

PRINT_DECIMAL:
	li	$v0, 4
	la	$a0, message		# "The multiplication of "
	syscall
	
	li	$v0, 1
	add	$a0, $zero, $s6
	syscall
	
	li	$v0, 4
	la	$a0, word_link1		# " and "
	syscall
	
	li	$v0, 1
	add	$a0, $zero, $s7
	syscall
	
	li	$v0, 4
	la	$a0, word_link2		# " is "
	syscall
	
	li	$v0, 4
	addi	$a0, $s5, 1
	syscall
	
	li	$v0, 4
	la	$a0, char_dot		# "."
	syscall	
	
	li	$v0, 4
	la	$a0, newline		# "\n"
	syscall



hexadecimal:
	addi	$t0, $zero, 0x20202020	# set all 4 characters in 1 register to empty space
					# (4 spaces for each memory segment)
	# store 16 empty spaces for representing 64 bits number in hexa
	la 	$s0, hexa_str		# s0 is pointer points to beginning of string
	sw 	$t0, 0($s0)
	sw 	$t0, 4($s0)
	sw 	$t0, 8($s0)
	sw 	$t0, 12($s0)
	
	li	$t7, 1			# boolean value = 0 if both upper and lower parts of 64 bits number are stored
	
	# number to be represented
HI:	add	$t1, $zero, $s1
	j LOOP_HEXA	
LO:	add	$t1, $zero, $s2
	li	$t7, 0
	
LOOP_HEXA:
	srl	$t2, $t1, 28		# get most left digit
	sll 	$t1, $t1, 4		# shift left to get new most left digit for next loop
	slti 	$t3, $t2, 10		# check if current digit is in range 0-9
	bne 	$t3, $zero, SKIP
        addi 	$t2, $t2, 39		# If digit is in range 10-15 (a-f) then add another 39
SKIP:
	addi	$t2, $t2, 48		# add 48 for representation of number in ASCII
	sb 	$t2, 0($s0)		# Store the digit.
	addi	$s0, $s0, 1		# Move string pointer to next one character.
        bne 	$t1, $0, LOOP_HEXA	# Continue if remaining bits are non-zero.
        
        bnez	$t7, LO			# check if LO register is stored
        sb 	$zero, 0($s0)		# null value at the end of string

PRINT_HEXA:
	li	$v0, 4
	la	$a0, message		# "The multiplication of "
	syscall
	
	li	$v0, 34
	add	$a0, $zero, $s6
	syscall
	
	li	$v0, 4
	la	$a0, word_link1		# " and "
	syscall
	
	li	$v0, 34
	add	$a0, $zero, $s7
	syscall
	
	li	$v0, 4
	la	$a0, word_link2		# " is "
	syscall
	
	li 	$v0, 4
	la	$a0, hexa_sign		# "0x"
	syscall
	
	li	$v0, 4
	la	$a0, hexa_str
	syscall
	
	li	$v0, 4
	la	$a0, char_dot		# "."
	syscall
