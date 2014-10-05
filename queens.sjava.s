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
	sw $sp, -8($sp)
	sw $fp, -12($sp)
	sw $ra, -16($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -20
	addi $sp, $t0, 0
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Solve1
	addi $sp, $sp, 12
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
PrintBoard1:
	sw $sp, -8($sp)
	sw $fp, -12($sp)
	sw $ra, -16($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -20
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
	j fortest3
forstart3:
	addi $t0, $zero, 0
	sw $t0, -4($fp)
	j fortest1
forstart1:
	addi $t0, $zero, 0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Print
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
fortest1:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart1
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Print
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	j fortest2
forstart2:
	addi $t0, $zero, 0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Print
	addi $sp, $sp, 4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
fortest2:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart2
	jal Println
	addi $sp, $sp, 0
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest3:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart3
	jal Println
	addi $sp, $sp, 0
PrintBoardend1:
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
Abs1:
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
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	bgtz $t0, iftrue1
	addi $t0, $zero, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $v0, $t0, 0
	j Absend1
	j ifend1
iftrue1:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j Absend1
ifend1:
Absend1:
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
Legal1:
	sw $sp, -12($sp)
	sw $fp, -16($sp)
	sw $ra, -20($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -24
	addi $sp, $t0, 0
	addi $t0, $zero, 1
	sw $t0, -8($fp)
	addi $t0, $zero, 0
	sw $t0, 0($fp)
	j fortest5
forstart5:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	j fortest4
forstart4:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab1
	addi $t0, $zero, 0
	j endlab1
truelab1:
	addi $t0, $zero, 1
endlab1:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
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
	sub $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Abs1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Abs1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab2
	addi $t0, $zero, 0
	j endlab2
truelab2:
	addi $t0, $zero, 1
endlab2:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	bgtz $t0, iftrue2
	j ifend2
iftrue2:
	addi $t0, $zero, 0
	sw $t0, -8($fp)
ifend2:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
fortest4:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest5:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart5
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j Legalend1
Legalend1:
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
Solve1:
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
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t0, $t2
	bgtz $t0, iftrue4
	addi $t0, $zero, 0
	sw $t0, 0($fp)
	j fortest6
forstart6:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
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
	jal Legal1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	bgtz $t0, iftrue3
	j ifend3
iftrue3:
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Solve1
	addi $sp, $sp, 12
ifend3:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest6:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart6
	j ifend4
iftrue4:
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoard1
	addi $sp, $sp, 8
	jal Println
	addi $sp, $sp, 0
ifend4:
Solveend1:
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
