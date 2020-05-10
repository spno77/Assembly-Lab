# counts the integers entered by the user
# terminates when 0 is entered 
	
	.text
	.globl main

main:
	#initialize counter
	li $s0,0	

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
	move $t1,$v0
	
	beq $t1,$zero,print
	
	addi $s0,1
	
	j loop
	
print:  #print prompt string
	la $a0,msg
	li $v0,4
	syscall
	
	#print result 
	move $a0,$s0
	li $v0,1
	syscall

	la $a0,nums
	li $v0,4
	syscall
	
exit:	#exit program
	li $v0,10
	syscall
	

	.data
prompt:	.asciiz "Enter integers (0 terminates the program):"
endl: 	.asciiz	"\n"
msg:	.asciiz "You entered "
nums:	.asciiz " integers."