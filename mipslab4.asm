# Lab Assignment 4
# Trang Hoang

# A program that rearranges the elements of an array by utilizing branch instructions.
# Registers used: 
# t0 - used to hold an element of the array. 
# t1 - used to hold another element of the array.
# t2 - used to hold memory address of the array.

	# All memory structures are placed after the
	# .data assembler directive
	.data
first: 	.asciiz   "\nFirst Element:\t"
second:	.asciiz   "\nSecond Element:\t"
third:	.asciiz	  "\nThird Element:\t"	

	# The .word assembler directive reserves space
	# in memory for a single 4-byte word (or multiple 4-byte words)
	# and assigns that memory location an initial value
	# (or a comma separated list of initial values)
threeints: .word 5, 255, -5	# an array of integers -- each integer is a word in length, 
                                # so each array element is 4 bytes away from each other
                                # (Note: also tested with array of [5, 255, 10])

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	la $t2, threeints     	# Put the memory address of threeints[0], which is the memory address of the threeints array,
                 		# into the register $t1
       	lw $t0, 0($t2)   	# Put the value at the memory address of threeints[0] array, which is 0 bytes away from
                 		# the address that the label threeints aliases, into the register 
        lw $t1, 8($t2)   	# Put the value at the memory address of threeints[2] array, which is 8 bytes away from
                 		# the address that the label threeints aliases, into the register
        blt $t0, $t1, next	# If $t0 > $t1 (5 > - 5), then swap (or if $t0 < $t1, go to next)
        sw $t0, 8($t2)		# Store the value in register $t0 into threeints[2] array, which is 8 bytes away from
        			# the address that the label threeints aliases
        sw $t1, 0($t2)		# Store the value in register $t1 into threeints[0] array, which is 0 bytes away from
        			# the address that the label threeints aliases        			
next:                 		
	lw $t0, 4($t2)		# Put the value at the memory address of threeints[1] array, which is 4 bytes away from
                 		# the address that the label threeints aliases, into the register  
        lw $t1, 8($t2)   	# Put the value at the memory address of threeints[2] array, which is 8 bytes away from
                 		# the address that the label threeints aliases, into the register
        blt $t0, $t1, exit	# If $t0 > $t1 (255 > 5), then swap (or if $t0 < $t1, go to exit)
        sw $t0, 8($t2)		# Store the value in register $t0 into threeints[2] array, which is 8 bytes away from
        			# the address that the label threeints aliases
        sw $t1, 4($t2)		# Store the value in register $t1 into threeints[1] array, which is 4 bytes away from
        			# the address that the label threeints aliases                 		
exit:	
	# Remaining steps to print out results to check
	li $v0, 4		# System call code for printing string. # put it into $v0
	la $a0, first		# Load address of string to be printed into $a0 by using the label for the string
	syscall             	# Call operating system to perform operation
	li $v0, 1           	# System call code for printing integer. # put it into $v0
        lw $a0, 0($t2)  	# Load the value at the memory address of threeints[0] array to be printed into $a0
        syscall             	# Call operating system to perform operation
	li $v0, 4		# System call code for printing string. # put it into $v0
	la $a0, second		# Load address of string to be printed into $a0 by using the label for the string
	syscall             	# Call operating system to perform operation        
        li $v0, 1           	# System call code for printing integer. # put it into $v0.
        lw $a0, 4($t2)  	# Load the value at the memory adress of threeints[1] array to be printed into $a0
        syscall             	# Call operating system to perform operation        
	li $v0, 4		# System call code for printing string. # put it into $v0
	la $a0, third		# Load address of string to be printed into $a0 by using the label for the string
	syscall             	# Call operating system to perform operation        
        li $v0, 1           	# system call code for printing integer. # put it into $v0.
        lw $a0, 8($t2)  	# Load the value at the memory address of threeints[2] array to be printed into $a0
        syscall             	# Call operating system to perform operation
	# To exit the program        
        li $v0, 10              # Syscall code 10 is for exit. # put it into $v0.
        syscall                 # Make the syscall.

# End of mipslab4.asm
