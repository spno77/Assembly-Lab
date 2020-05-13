# Prints one char from the string stored in data
# when spacebar is pressed
		
	.text
	.globl main

main:
	#store the spacebar
	li $s3,32
	
	#counter 
	li $t0,0

	la $a0,prompt	
	li $v0,4
	syscall
	
	la $a0,endl
	li $v0,4
	syscall
	
		
loop: 	li $v0,12
	syscall
	move $s1,$v0
	
	bne $s1,$s3,loop
	
	lbu $t1,my_str($t0) 
	
	beq $t1,$zero,exit
	
	move $a0,$t1
	li $v0,11
	syscall
	
	addi $t0,$t0,1
	
	j loop	
	
		
exit:	
	la $a0,exit_msg
	li $v0,4
	syscall
	
	#exit program
	li $v0,10
	syscall
	

	.data
prompt: .asciiz "press space bar to print a char:"
my_str:	.asciiz "123456789"
endl: 	.asciiz	"\n"
exit_msg: .asciiz "The program terminated!"
