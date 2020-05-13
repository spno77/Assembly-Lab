# Prints the chars of a string stored in memory,
# in the following order: first--last,2--9 ...
	
	.text
	.globl main

main:
	#initialize counters
	li $t0,0
	li $t1,9

	#print initial string
	la $a0,string1
	li $v0,4
	syscall

	#print endl string 
	la $a0,endl
	li $v0,4
	syscall

loop:
	lbu $s0,string1($t0)
	lbu $s1,string1($t1)
	
	#print the 2 chars
	move $a0,$s0
	li $v0,11
	syscall	
	
	move $a0,$s1
	li $v0,11
	syscall
	
	la $a0,endl
	li $v0,4
	syscall	

	addi $t0,$t0,1 
	addi $t1,$t1,-1

	blt $t1,$zero,exit
		
	j loop
	
exit:	
	la $a0,end_msg
	li $v0,4
	syscall
	
	#exit program
	li $v0,10
	syscall
	

	.data
endl: 	.asciiz	"\n"
end_msg: .asciiz "The program terminated."
string1: .asciiz "0123456789"