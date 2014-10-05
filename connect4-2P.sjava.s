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
	sw $sp, -28($sp)
	sw $fp, -32($sp)
	sw $ra, -36($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -40
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, -8($fp)
	addi $t0, $zero, 1
	sw $t0, -12($fp)
	addi $t0, $zero, 0
	sw $t0, -20($fp)
	addi $t0, $zero, 0
	sw $t0, -24($fp)
	addi $t0, $zero, 10
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
	sw $t0, 0($fp)
	addi $t0, $zero, 0
	sw $t0, -4($fp)
	j fortest1
forstart1:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
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
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
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
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart1
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal ClearBoard1
	addi $sp, $sp, 4
	j whiletest1
whilestart2:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoard1
	addi $sp, $sp, 4
whilestart1:
	jal Read
	addi $sp, $sp, 0
	addi $t0, $v0, 0
	sw $t0, -16($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal legal1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t0, $zero, 1
	slt $t0, $t2, $t0
	bgtz $t0, whilestart1
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal DoMove1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, -20
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -20($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal win1
	addi $sp, $sp, 8
	addi $t0, $v0, 0
	bgtz $t0, iftrue1
	j ifend1
iftrue1:
	addi $t0, $zero, 1
	sw $t0, -8($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, -24($fp)
ifend1:
	add $t0, $fp, $zero
	addi $t0, $t0, -20
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 100
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue2
	j ifend2
iftrue2:
	addi $t0, $zero, 1
	sw $t0, -8($fp)
	addi $t0, $zero, 0
	sw $t0, -24($fp)
ifend2:
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -12($fp)
whiletest1:
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
	bgtz $t0, whilestart2
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoard1
	addi $sp, $sp, 4
	jal Println
	addi $sp, $sp, 0
	jal Println
	addi $sp, $sp, 0
	add $t0, $fp, $zero
	addi $t0, $t0, -24
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
legal1:
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
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 9
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t0, $t2
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	bgtz $t0, iftrue3
	j ifend3
iftrue3:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j legalend1
ifend3:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
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
	addi $t0, $t0, 4
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
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	bne $t2, $t0, truelab1
	addi $t0, $zero, 0
	j endlab1
truelab1:
	addi $t0, $zero, 1
endlab1:
	bgtz $t0, iftrue4
	j ifend4
iftrue4:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j legalend1
ifend4:
	addi $t0, $zero, 1
	addi $v0, $t0, 0
	j legalend1
legalend1:
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
ClearBoard1:
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
	j fortest2
forstart2:
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
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
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart2
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
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart3
ClearBoardend1:
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
	j fortest5
forstart5:
	addi $t0, $zero, 0
	sw $t0, -4($fp)
	j fortest4
forstart4:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Print
	addi $sp, $sp, 4
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
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart4
	jal Println
	addi $sp, $sp, 0
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
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart5
	jal Println
	addi $sp, $sp, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
	j fortest6
forstart6:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal Print
	addi $sp, $sp, 4
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
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart6
	jal Println
	addi $sp, $sp, 0
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
swap1:
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
	addi $t0, $zero, 1
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue5
	addi $t0, $zero, 1
	addi $v0, $t0, 0
	j swapend1
	j ifend5
iftrue5:
	addi $t0, $zero, 2
	addi $v0, $t0, 0
	j swapend1
ifend5:
swapend1:
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
DoMove1:
	sw $sp, -4($sp)
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -16
	addi $sp, $t0, 0
	addi $t0, $zero, 1
	sw $t0, 0($fp)
	j fortest7
forstart7:
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
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
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	bne $t2, $t0, truelab2
	addi $t0, $zero, 0
	j endlab2
truelab2:
	addi $t0, $zero, 1
endlab2:
	bgtz $t0, iftrue6
	j ifend6
iftrue6:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
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
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j DoMoveend1
ifend6:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest7:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart7
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 9
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
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
DoMoveend1:
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
win1:
	sw $sp, -16($sp)
	sw $fp, -20($sp)
	sw $ra, -24($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -28
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
	j fortest8
forstart8:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest8:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab3
	addi $t0, $zero, 0
	j endlab3
truelab3:
	addi $t0, $zero, 1
endlab3:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, forstart8
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue7
	j ifend7
iftrue7:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j winend1
ifend7:
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
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
	sw $t0, -8($fp)
	addi $t0, $zero, 0
	sw $t0, -4($fp)
	addi $t0, $zero, 0
	sw $t0, -12($fp)
	j whiletest2
whilestart3:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest2:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab4
	addi $t0, $zero, 0
	j endlab4
truelab4:
	addi $t0, $zero, 1
endlab4:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, whilestart3
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	bgtz $t0, iftrue8
	j ifend8
iftrue8:
	addi $t0, $zero, 1
	addi $v0, $t0, 0
	j winend1
ifend8:
	addi $t0, $zero, 0
	sw $t0, -4($fp)
	addi $t0, $zero, 0
	sw $t0, -12($fp)
	j whiletest3
whilestart4:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest3:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
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
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab5
	addi $t0, $zero, 0
	j endlab5
truelab5:
	addi $t0, $zero, 1
endlab5:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, whilestart4
	addi $t0, $zero, 1
	sw $t0, -12($fp)
	j whiletest4
whilestart5:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest4:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab6
	addi $t0, $zero, 0
	j endlab6
truelab6:
	addi $t0, $zero, 1
endlab6:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, whilestart5
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	bgtz $t0, iftrue9
	j ifend9
iftrue9:
	addi $t0, $zero, 1
	addi $v0, $t0, 0
	j winend1
ifend9:
	addi $t0, $zero, 0
	sw $t0, -12($fp)
	addi $t0, $zero, 0
	sw $t0, -4($fp)
	j whiletest5
whilestart6:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest5:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
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
	add $t0, $fp, $zero
	addi $t0, $t0, 0
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab7
	addi $t0, $zero, 0
	j endlab7
truelab7:
	addi $t0, $zero, 1
endlab7:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, whilestart6
	addi $t0, $zero, 1
	sw $t0, -12($fp)
	j whiletest6
whilestart7:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest6:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab8
	addi $t0, $zero, 0
	j endlab8
truelab8:
	addi $t0, $zero, 1
endlab8:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, whilestart7
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	bgtz $t0, iftrue10
	j ifend10
iftrue10:
	addi $t0, $zero, 1
	addi $v0, $t0, 0
	j winend1
ifend10:
	addi $t0, $zero, 0
	sw $t0, -12($fp)
	addi $t0, $zero, 0
	sw $t0, -4($fp)
	j whiletest7
whilestart8:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest7:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab9
	addi $t0, $zero, 0
	j endlab9
truelab9:
	addi $t0, $zero, 1
endlab9:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, whilestart8
	addi $t0, $zero, 1
	sw $t0, -12($fp)
	j whiletest8
whilestart9:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -12($fp)
whiletest8:
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
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
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab10
	addi $t0, $zero, 0
	j endlab10
truelab10:
	addi $t0, $zero, 1
endlab10:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, whilestart9
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 4
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	addi $t2, $t2, 1
	slt $t0, $t0, $t2
	bgtz $t0, iftrue11
	j ifend11
iftrue11:
	addi $t0, $zero, 1
	addi $v0, $t0, 0
	j winend1
ifend11:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j winend1
winend1:
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
GetBoard1:
	sw $sp, 0($sp)
	sw $fp, -4($sp)
	sw $ra, -8($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -12
	addi $sp, $t0, 0
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 9
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t0, $t2
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 9
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t0, $t2
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	bgtz $t0, iftrue12
	j ifend12
iftrue12:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j GetBoardend1
ifend12:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
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
	addi $t0, $t0, 12
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
	addi $v0, $t0, 0
	j GetBoardend1
GetBoardend1:
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
