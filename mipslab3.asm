# Lab Assignment 3
# Trang Hoang

# A program that accesses the first and last element of an array, storing the first and last elements in registers $t0 and $t1, respectively.
# Registers used: 
# t0 - used to hold the first element of the array. 
# t1 - used to hold the last element of the array.
# t2 - used to hold memory address of the current location in the array.
# t3 - used to hold the last index of the array.

	# All memory structures are placed after the
	# .data assembler directive
	.data
first: 	.asciiz   "\nFirst Element:\t"
last:	.asciiz	  "\nLast Element:\t"	

	# The .word assembler directive reserves space
	# in memory for a single 4-byte word (or multiple 4-byte words)
	# and assigns that memory location an initial value
	# (or a comma separated list of initial values)
a:	.word 5, 6, 7, 10, 14, 17, 21, 22, 25, 36	# an array of integers -- each integer is a word in length, 
                                                        # so each array element is 4 bytes away from each other
lst_idx:.word 9						# index of the last element of the array

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	li $t2, 0     		# Put 0 into register $t2 to indicate the element of a[0], which is the first element in the array
	lw $t3, lst_idx		# Load the word stored in index (see the .data section at the top)
	lw $t0, a($t2)   	# Put the value at the memory address of a[0], which is 0 bytes away from the address that the 
				# label a aliases, into the register $t0
	mul $t2, $t3, 4 	# $t3 = $t3 * 4 ($t3 = 36)	
	lw $t1, a($t2)	# Put the value at the memory address of a[9], which is 36 bytes away from the address that the
				# label a aliases, into the register $t1		
	# Remaining steps to print out results to check.
	li $v0, 4		# System call code for printing string. # put it into $v0
	la $a0, first		# Load address of string to be printed into $a0 by using the label for the string
	syscall             	# Call operating system to perform operation
	li $v0, 1           	# System call code for printing integer. # put it into $v0
        move $a0, $t0  		# Load address of integer at $t0 to be printed into $a0
        syscall             	# Call operating system to perform operation
	li $v0, 4		# System call code for printing string. # put it into $v0
	la $a0, last		# Load address of string to be printed into $a0 by using the label for the string
	syscall             	# Call operating system to perform operation        
        li $v0, 1           	# system call code for printing integer. # put it into $v0.
        move $a0, $t1  		# load address of integer at $t0 to be printed into $a0
        syscall             	# call operating system to perform operation
        li $v0, 10              # syscall code 10 is for exit. # put it into $v0.
        syscall                 # make the syscall.

# End of mipslab2.asm
