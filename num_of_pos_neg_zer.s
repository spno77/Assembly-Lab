# counts the positive,negative and zeroes
# entered by the user. Terminates when 44 is entered. 
	
	.text
	.globl main

main:	
	#counters
	li $t0,0	#zeros
	li $t1,0	#negative 
	li $t2,0	#positive
	
	#load 44 for the comparison 	
	li $t3,44
	
	#print prompt string
	la $a0,prompt
	li $v0,4
	syscall

	#print endl string
	la $a0,endl
	li $v0,4
	syscall
	
loop:	
	#read integer
	li $v0,5
	syscall
	move $s0,$v0
	
	#compare with 44
	beq $s0,$t3,exit

	ble $s0,$zero,neg_or_zero

pos:	addi $t2,1
	j loop	

neg_or_zero:
	beq $s0,$zero,is_zero 
	addi $t1,1
	j loop

is_zero:
	addi $t0,1
	j loop
		
exit:	
	#print count of positive numbers
	la $a0,positive
	li $v0,4
	syscall

	move $a0,$t2
	li $v0,1
	syscall	
	
	#print endl string
	la $a0,endl
	li $v0,4
	syscall	

	#print the count of negative numbers
	la $a0,negative
	li $v0,4
	syscall
	
	move $a0,$t1
	li $v0,1
	syscall 	

	#print endl string
	la $a0,endl
	li $v0,4
	syscall

	la $a0,zeroes
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall 

	#print endl string
	la $a0,endl
	li $v0,4
	syscall	

	#print exit msg
	la $a0,exit_msg
	li $v0,4
	syscall
	
	#exit program
	li $v0,10
	syscall
	

	.data
prompt:	.asciiz "Enter integers (44 terminates the program):"
endl: 	.asciiz	"\n"
exit_msg: .asciiz "The program terminated!"
positive: .asciiz "Count of positive numbers is : "
negative: .asciiz "Count of negative numbers is : "	
zeroes:	  .asciiz "Count of zeroes: "