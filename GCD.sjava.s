	.globl main
main:
	addi $t1, $sp,0
	addi $sp, $sp, -4000
	addi $t2, $sp,0
	addi $t2, $t2, -4000
	la $t3, HEAPPTR
	sw $t2,0($t3)
	sw $ra, 4($sp)
	jal main1
	li $v0, 10
	syscall
main1:
	sw $sp, -12($sp)
	sw $fp, -16($sp)
	sw $ra, -20($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -24
	addi $sp, $t0, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GCD1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	sw $t0, -8($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Print
	addi $sp, $sp, 4
	jal Println
	addi $sp, $sp, 0
mainend1:
	add $t0, $sp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $ra, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $sp, $t0, 0
	jr $ra
mod1:
	sw $sp, 0($sp)
	sw $fp, -4($sp)
	sw $ra, -8($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -12
	addi $sp, $t0, 0
	j whiletest1
whilestart1:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 4($fp)
whiletest1:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	bgtz $t0, whilestart1
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j modend1
modend1:
	add $t0, $sp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $ra, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $sp, $t0, 0
	jr $ra
GCD1:
	sw $sp, -4($sp)
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -16
	addi $sp, $t0, 0
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, iftrue1
	j ifend1
iftrue1:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 8($fp)
ifend1:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue2
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal mod1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GCD1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	addi $v0, $t0, 0
	j GCDend1
	j ifend2
iftrue2:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j GCDend1
ifend2:
GCDend1:
	add $t0, $sp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $ra, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $sp, $t0, 0
	jr $ra
Print:
	lw $a0, 4($sp)
	li $v0, 1
	syscall
	li $v0,4
	la $a0, sp
	syscall
	jr $ra
Println:
	li $v0,4
	la $a0, cr
	syscall
	jr $ra
Read:
	li $v0,5
	syscall
	jr $ra
allocate:
	la $t2, HEAPPTR
	lw $v0,0($t2)
	lw $t3, 4($sp)
	sub $t3, $v0, $t3
	sw $t3,0($t2)
	jr $ra
	.data
cr:
	.asciiz "\n"
sp:
	.asciiz " "
HEAPPTR:
	.word 0
