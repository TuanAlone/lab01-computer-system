#Listing 7 (data section)
.data
prompt: .asciiz "Enter reading (kWh): "
m1:     .asciiz "Month 1: "
m2:     .asciiz "Month 2: "
m3:     .asciiz "Month 3: "
tot:    .asciiz "Total:   "
nl:     .asciiz "\n"

.text
.globl main
main:
	#enter reading0
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	
	add $s0, $v0, $zero	#store start value of month 1
	
	#enter reading1
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	
	add $s1, $v0, $zero	#store start value of month 2
	
	#enter reading2
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	
	add $s2, $v0, $zero	#store start value of month 3
	
	#enter reading3
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	
	add $s3, $v0, $zero	#store end value of month 3
	
	#calculate month 1
	li $v0, 4
	la $a0, m1
	syscall
	
	sub $t1, $s1, $s0	#energy used in month 1
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	#calculate month 2
	li $v0, 4
	la $a0, m2
	syscall
	
	sub $t2, $s2, $s1	#energy used in month 2
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	#calculate month 3
	li $v0, 4
	la $a0, m3
	syscall

	sub $t3, $s3, $s2	#energy used in month 3
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	#calculate total usage
	li $v0, 4
	la $a0, tot
	syscall
	
	add $t0, $t1, $t2	#total usage of month 1 and month 2
	add $t0, $t0, $t3	#total usage of three months
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	#end
	li $v0, 10
	syscall
