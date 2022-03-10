# Lab Assignment 2 Part 2
# Trang Hoang

# A program that computes the sum of 10 numbers, leaving the result in register $t0
# Registers and labels used: 
# t0 - used to hold the result. 
# t1 - used to hold the label with current value.
# t2 - used to hold the cumulative result.

	# All memory structures are placed after the
	# .data assembler directive
	.data

	# The .word assembler directive reserves space
	# in memory for a single 4-byte word (or multiple 4-byte words)
	# and assigns that memory location an initial value
	# (or a comma separated list of initial values)
value1:	.word 2
value2:	.word 3
value3:	.word 5
value4:	.word 7
value5:	.word 11
value6:	.word 13
value7:	.word 17
value8:	.word 19
value9:	.word 23
value10:.word 29

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	lw $t1, value1		# Load the word stored in value1 (see the .data section at the top) 
	lw $t2, value2		# Load the word stored in value2 (see the .data section at the top)
	add $t2, $t2, $t1	# $t2 = $t2 + $t1 ($t2 = 5)
	lw $t1, value3		# Load the word stored in value3 (see the .data section at the top)
	add $t2, $t2, $t1	# $t2 = $t2 + $t1 ($t2 = 10)
	lw $t1, value4		# Load the word stored in value4 (see the .data section at the top)
	add $t2, $t2, $t1	# $t2 = $t2 + $t1 ($t2 = 17)	
	lw $t1, value5		# Load the word stored in value5 (see the .data section at the top)
	add $t2, $t2, $t1	# $t2 = $t2 + $t1 ($t2 = 28)	
	lw $t1, value6		# Load the word stored in value6 (see the .data section at the top)
	add $t2, $t2, $t1	# $t2 = $t2 + $t1 ($t2 = 41)	
	lw $t1, value7		# Load the word stored in value7 (see the .data section at the top)
	add $t2, $t2, $t1	# $t2 = $t2 + $t1 ($t2 = 58)	
	lw $t1, value8		# Load the word stored in value8 (see the .data section at the top)
	add $t2, $t2, $t1	# $t2 = $t2 + $t1 ($t2 = 77)	
	lw $t1, value9		# Load the word stored in value9 (see the .data section at the top)
	add $t2, $t2, $t1	# $t2 = $t2 + $t1 ($t2 = 100)	
	lw $t1, value10		# Load the word stored in value10 (see the .data section at the top)
	add $t0, $t2, $t1	# $t0 = $t2 + $t1 ($t0 = 129)
	# Remaining steps to print out results to check.
	li $v0, 1           	# system call code for printing integer. # put it into $v0.
        move $a0, $t0  		# load address of integer at $t0 to be printed into $a0
        syscall             	# call operating system to perform operation
        li $v0, 10              # syscall code 10 is for exit. # put it into $v0.
        syscall                 # make the syscall.

# End of mipslab2.asm
