##############################################################################
#
# Test Code
#
#  The code below calls "itos", the routine that converts an unsigned
#  integer to hexadecimal. It calls itos several times, after each
#  call it displaces the results.

        .data
msg:
        .asciiz "The value of %/s4/5d = 0x%/s4/x is %/a1/s\n"
str:
        .align 4
        .space 12               # Storage for string.
values:                         # Table of test inputs.
        .word 1234              # First entry in table of test inputs.
        .word 0x1234
        .word 0xf00d
        .word -1


        .text
        .globl __start
__start:
        la $s2, values          # Address of table of test inputs.
        addi $s3, $0, -1       # Value that marks end of table.
MLOOP:
        lw $a0, 0($s2)          # Load a test input from the table.
        la $a1, str             # Set $a1 to address of storage for string.
        lui $t0, 0x2020         # Prepare an initial value for string.
        ori $t0, $t0, 0x2020    # t0 will contain four blanks.
        sw $t0, 0($a1)          # Write string with initial value (blanks).
        sw $t0, 4($a1)
        sw $t0, 8($a1)
        sb $0, 11($a1)
        jal itos
        addi $a2, $0, 10        # Set length of string.
        lw $s4, 0($s2)          # Load test input again.
        la $a1, str             # Address of string.
        la $a0, msg             # Address of message (printf-like format str)
        addi $v0, $0, 11        # Code indicating we want to run printf.
        syscall                 # Make a system call to do printf.
        addi $s2, $s2, 4        # Advance to next entry in table.
        bne $s4, $s3 MLOOP      # Continue if we are not at end of table.
        li $v0, 10              # Exit system call. (Not used if branch taken.)
        syscall
        nop


###############################################################################
#
# Unsigned Integer to Hexadecimal String
#

itos:
        ## Register Usage
        #
        # CALL VALUES:
        #  $a0: Integer to convert
        #  $a1: Address of storage.
        #       Initialized to null-terminated string of blanks.
        #  $a2: Length of storage.
        #
        # RETURN:
        #       There is no return register value ..
        #       .. instead write storage at $a1 with hex representation of $a0.
        #
        # NOTE: Registers $a0-$a4 and $t0-$t7 can be modified.
        # NOTE: 'a' = 97, 'z' = 122,  'a' - 'A' = 32
        # NOTE: '0' = 48 = 0x30

        ## Key Techniques
        #
        #  Extract hexadecimal digit. (Using andi).
        #
        #  Convert digit from an integer (0-15) to ASCII.
        #
        #  Write into storage right-to-left.

        add $t3, $a1, $a2     # Where string should end.

LOOP:
        andi $t0, $a0, 0xf    # Retrieve the least-significant hex digit.
        srl $a0, $a0, 4       # Shift over by one digit.
        slti $t2, $t0, 10     # Check if the digit is in range 0-9
        bne $t2, $0 SKIP      # If so, just add 48.
        addi $t1, $t0, 48     # Remember that delay slot always executed.
        addi $t1, $t1, 39     # If digit is in range 10-15 (a-f) add another 39.
SKIP:
        sb $t1, 0($t3)        # Store the digit.
        bne $a0, $0, LOOP     # Continue if remaining bits are non-zero.
        addi $t3, $t3, -1     # Move string pointer one character to the left.

DONE:
        jr $ra
        nop