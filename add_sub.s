# adds and subs two integers given by the user
# prints the result in the console

	.text
	.globl main
main:
	#print msg1 string
	la $a0,msg1
	li $v0,4
	syscall

	#print endl string 
	la $a0,endl
	li $v0,4
	syscall
		
	#read first integer
	li $v0,5
	syscall
	move $t1,$v0
	
	#print msg2 string
	la $a0,msg2
	li $v0,4
	syscall
	
	#print endl string 
	la $a0,endl
	li $v0,4
	syscall
	
	#read second integer
	li $v0,5
	syscall
	move $t2,$v0


	add $s0,$t1,$t2
	
	#print sum string 
	la $a0,sum
	li $v0,4
	syscall
	
	#print result 
	move $a0,$s0
	li $v0,1
	syscall

	#print endl string 
	la $a0,endl
	li $v0,4
	syscall

	sub $s1,$t1,$t2

	#print diff string
	la $a0,diff
	li $v0,4
	syscall
	
	#print the difference
	move $a0,$s1
	li $v0,1
	syscall
	
	#exit program
	li $v0,10
	syscall


	.data
msg1:	.asciiz "Enter the first integer:"
msg2:	.asciiz "Enter the second integer:"
sum:	.asciiz "The sum is:  "
diff:	.asciiz "The difference is:  "
endl:	.asciiz "\n"