li $s1, -10

# 0000 0000 0000 0000 0000 0000 0000 1010
# 1111 1111 1111 1111 1111 1111 1111 0101 
# 0000 0000 0000 0000 0000 0000 0000 1010
# 1111 1111 1111 1111 1111 1111 1111 0101 

# 1111 1111 1111 1111 1111 1111 1111 0110
# 1111 1111 1111 1111 1111 1111 1111 1111
#xor
# 0000 0000 0000 0000 0000 0000 0000 1001
#addu 
abs $s0, $s1
