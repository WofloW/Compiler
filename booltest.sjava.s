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
PrintBoolean1:
	sw $sp, 0($sp)
	sw $fp, -4($sp)
	sw $ra, -8($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -12
	addi $sp, $t0, 0
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	bgtz $t0, iftrue1
	addi $t0, $zero, 0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Print
	addi $sp, $sp, 4
	j ifend1
iftrue1:
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Print
	addi $sp, $sp, 4
ifend1:
PrintBooleanend1:
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
MakeBool1:
	sw $sp, 0($sp)
	sw $fp, -4($sp)
	sw $ra, -8($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -12
	addi $sp, $t0, 0
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	bne $t2, $t0, truelab1
	addi $t0, $zero, 0
	j endlab1
truelab1:
	addi $t0, $zero, 1
endlab1:
	addi $v0, $t0, 0
	j MakeBoolend1
MakeBoolend1:
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
main1:
	sw $sp, -16($sp)
	sw $fp, -20($sp)
	sw $ra, -24($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -28
	addi $sp, $t0, 0
	j whiletest1
whilestart1:
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t0, $t0, 1
	slt $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t0, $t2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab2
	addi $t0, $zero, 0
	j endlab2
truelab2:
	addi $t0, $zero, 1
endlab2:
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	bne $t2, $t0, truelab3
	addi $t0, $zero, 0
	j endlab3
truelab3:
	addi $t0, $zero, 1
endlab3:
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	jal Println
	addi $sp, $sp, 0
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal MakeBool1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -8($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal MakeBool1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -12($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t0, $zero, 1
	slt $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t0, $zero, 1
	slt $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoolean1
	addi $sp, $sp, 4
	jal Println
	addi $sp, $sp, 0
whiletest1:
	addi $t0, $zero, 1
	bgtz $t0, whilestart1
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
