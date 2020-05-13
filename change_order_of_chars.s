# Changes the order of chars on a 20 char string
# stored in memory. 
	
	.text
	.globl main

main:
	#initialize counters
	li $t0,0
	li $t1,19

	#print initial string
	la $a0,STRING
	li $v0,4
	syscall

	#print endl string 
	la $a0,endl
	li $v0,4
	syscall
	
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

	#print endl string 
	la $a0,endl
	li $v0,4
	syscall
	
	lbu $s1,STRING($s0)

	sub $s4,$t1,$s0
	
	lbu $s5,STRING($s4)
	
	sb $s1,STRING($s4)
	sb $s5,STRING($s0)
	
	la $a0,STRING	
	li $v0,4
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
prompt:	.asciiz "Enter a number between 0-9:"
endl: 	.asciiz	"\n"
end_msg: .asciiz "The program terminated."
STRING: .asciiz "0123456789abcdefgtwz"