# Prints the char == int entered in console  	
# from a string stored in memory. 
	
	.text
	.globl main

main:
	#print initial string
	la $a0,string1
	li $v0,4
	syscall

	#print endl string 
	la $a0,endl
	li $v0,4
	syscall

loop:
	#print prompt string
	la $a0,prompt
	li $v0,4
	syscall

	#print endl string 
	la $a0,endl
	li $v0,4
	syscall

	#read integer
	li $v0,5
	syscall
	move $s0,$v0

	#print endl string 
	la $a0,endl
	li $v0,4
	syscall
	
	lbu $t1,string1($s0)
	
	move $a0,$t1
	li $v0,11
	syscall
	
	la $a0,endl
	li $v0,4
	syscall

	j loop
	
exit:	
	la $a0,end_msg
	li $v0,4
	syscall
	
	#exit program
	li $v0,10
	syscall
	

	.data
prompt:	.asciiz "Enter a number between 0-19:"
endl: 	.asciiz	"\n"
end_msg: .asciiz "The program terminated."
string1: .asciiz "0123456789abcdefgtwz"