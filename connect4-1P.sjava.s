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
	sw $sp, -32($sp)
	sw $fp, -36($sp)
	sw $ra, -40($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -44
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, -8($fp)
	addi $t0, $zero, 1
	sw $t0, -12($fp)
	addi $t0, $zero, 0
	sw $t0, -20($fp)
	addi $t0, $zero, 0
	sw $t0, -24($fp)
	addi $t0, $zero, 8
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal allocate
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -28($fp)
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
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoard1
	addi $sp, $sp, 4
	j whiletest1
whilestart2:
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 1
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue1
	add $t0, $fp, $zero
	addi $t0, $t0, -28
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal min1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, -28
	lw $t0, 0($t0)
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, -16($fp)
	j ifend1
iftrue1:
	jal Println
	addi $sp, $sp, 0
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
ifend1:
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
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal PrintBoard1
	addi $sp, $sp, 4
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
	bgtz $t0, iftrue2
	j ifend2
iftrue2:
	addi $t0, $zero, 1
	sw $t0, -8($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, -24($fp)
ifend2:
	add $t0, $fp, $zero
	addi $t0, $t0, -20
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 100
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue3
	j ifend3
iftrue3:
	addi $t0, $zero, 1
	sw $t0, -8($fp)
	addi $t0, $zero, 0
	sw $t0, -24($fp)
ifend3:
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
value1:
	sw $sp, -56($sp)
	sw $fp, -60($sp)
	sw $ra, -64($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -68
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, -8($fp)
	addi $t0, $zero, 0
	sw $t0, -12($fp)
	addi $t0, $zero, 0
	sw $t0, -16($fp)
	addi $t0, $zero, 0
	sw $t0, -20($fp)
	addi $t0, $zero, 0
	sw $t0, -24($fp)
	addi $t0, $zero, 0
	sw $t0, -28($fp)
	addi $t0, $zero, 0
	sw $t0, -32($fp)
	addi $t0, $zero, 0
	sw $t0, -36($fp)
	addi $t0, $zero, 0
	sw $t0, -40($fp)
	addi $t0, $zero, 0
	sw $t0, -44($fp)
	addi $t0, $zero, 0
	sw $t0, -48($fp)
	addi $t0, $zero, 0
	sw $t0, -52($fp)
	addi $t0, $zero, 0
	sw $t0, 0($fp)
	j fortest3
forstart3:
	addi $t0, $zero, 0
	sw $t0, -4($fp)
	j fortest2
forstart2:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal open11
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -8($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal open11
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -12($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -16
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal half_open21
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -16($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -20
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal half_open21
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -20($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -24
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal open21
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -24($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -28
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal open21
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -28($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -32
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal half_open31
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -32($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -36
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal half_open31
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -36($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -40
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal open31
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -40($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -44
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal open31
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -44($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -48
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal four1
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -48($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -52
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
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
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal four1
	addi $sp, $sp, 16
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, -52($fp)
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
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -16
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -24
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 9
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -32
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 20
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -40
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 500
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -48
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 3000
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -20
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -28
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 9
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -36
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 20
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -44
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 500
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -52
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 3000
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sub $t0, $t2, $t0
	addi $v0, $t0, 0
	j valueend1
valueend1:
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
	bgtz $t0, iftrue4
	j ifend4
iftrue4:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j legalend1
ifend4:
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
	bgtz $t0, iftrue5
	j ifend5
iftrue5:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j legalend1
ifend5:
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
	j fortest7
forstart7:
	addi $t0, $zero, 0
	sw $t0, -4($fp)
	j fortest6
forstart6:
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
fortest6:
	add $t0, $fp, $zero
	addi $t0, $t0, -4
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
	jal Println
	addi $sp, $sp, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
	j fortest8
forstart8:
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
	bgtz $t0, forstart8
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
	beq $t2, $t0, iftrue6
	addi $t0, $zero, 1
	addi $v0, $t0, 0
	j swapend1
	j ifend6
iftrue6:
	addi $t0, $zero, 2
	addi $v0, $t0, 0
	j swapend1
ifend6:
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
	j fortest9
forstart9:
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
	bgtz $t0, iftrue7
	j ifend7
iftrue7:
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
ifend7:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest9:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart9
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
UndoMove1:
	sw $sp, -4($sp)
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -16
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
	j fortest10
forstart10:
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
	bne $t2, $t0, truelab3
	addi $t0, $zero, 0
	j endlab3
truelab3:
	addi $t0, $zero, 1
endlab3:
	bgtz $t0, iftrue8
	j ifend8
iftrue8:
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j UndoMoveend1
ifend8:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest10:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart10
UndoMoveend1:
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
	j fortest11
forstart11:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
fortest11:
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
	bgtz $t0, forstart11
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
	beq $t2, $t0, iftrue9
	j ifend9
iftrue9:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j winend1
ifend9:
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
	beq $t2, $t0, whilestart3
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
	beq $t2, $t0, whilestart4
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
	beq $t2, $t0, whilestart5
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
	beq $t2, $t0, whilestart6
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
	beq $t2, $t0, whilestart7
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
	bgtz $t0, iftrue12
	j ifend12
iftrue12:
	addi $t0, $zero, 1
	addi $v0, $t0, 0
	j winend1
ifend12:
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
	beq $t2, $t0, whilestart8
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
	beq $t2, $t0, whilestart9
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
	bgtz $t0, iftrue13
	j ifend13
iftrue13:
	addi $t0, $zero, 1
	addi $v0, $t0, 0
	j winend1
ifend13:
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
	bgtz $t0, iftrue14
	j ifend14
iftrue14:
	addi $t0, $zero, 3
	addi $v0, $t0, 0
	j GetBoardend1
ifend14:
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
open11:
	sw $sp, -4($sp)
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -16
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue15
	j ifend15
iftrue15:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j open1end1
ifend15:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab5
	addi $t0, $zero, 0
	j endlab5
truelab5:
	addi $t0, $zero, 1
endlab5:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	bgtz $t0, iftrue16
	j ifend16
iftrue16:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend16:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab8
	addi $t0, $zero, 0
	j endlab8
truelab8:
	addi $t0, $zero, 1
endlab8:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	bgtz $t0, iftrue17
	j ifend17
iftrue17:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend17:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab11
	addi $t0, $zero, 0
	j endlab11
truelab11:
	addi $t0, $zero, 1
endlab11:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab12
	addi $t0, $zero, 0
	j endlab12
truelab12:
	addi $t0, $zero, 1
endlab12:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	beq $t2, $t0, truelab13
	addi $t0, $zero, 0
	j endlab13
truelab13:
	addi $t0, $zero, 1
endlab13:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue18
	j ifend18
iftrue18:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend18:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab14
	addi $t0, $zero, 0
	j endlab14
truelab14:
	addi $t0, $zero, 1
endlab14:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab15
	addi $t0, $zero, 0
	j endlab15
truelab15:
	addi $t0, $zero, 1
endlab15:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	beq $t2, $t0, truelab16
	addi $t0, $zero, 0
	j endlab16
truelab16:
	addi $t0, $zero, 1
endlab16:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue19
	j ifend19
iftrue19:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend19:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j open1end1
open1end1:
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
half_open21:
	sw $sp, -4($sp)
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -16
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue20
	j ifend20
iftrue20:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j half_open2end1
ifend20:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab17
	addi $t0, $zero, 0
	j endlab17
truelab17:
	addi $t0, $zero, 1
endlab17:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab18
	addi $t0, $zero, 0
	j endlab18
truelab18:
	addi $t0, $zero, 1
endlab18:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab19
	addi $t0, $zero, 0
	j endlab19
truelab19:
	addi $t0, $zero, 1
endlab19:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab20
	addi $t0, $zero, 0
	j endlab20
truelab20:
	addi $t0, $zero, 1
endlab20:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	beq $t2, $t0, truelab21
	addi $t0, $zero, 0
	j endlab21
truelab21:
	addi $t0, $zero, 1
endlab21:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue21
	j ifend21
iftrue21:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend21:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab22
	addi $t0, $zero, 0
	j endlab22
truelab22:
	addi $t0, $zero, 1
endlab22:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab23
	addi $t0, $zero, 0
	j endlab23
truelab23:
	addi $t0, $zero, 1
endlab23:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab24
	addi $t0, $zero, 0
	j endlab24
truelab24:
	addi $t0, $zero, 1
endlab24:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab25
	addi $t0, $zero, 0
	j endlab25
truelab25:
	addi $t0, $zero, 1
endlab25:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	beq $t2, $t0, truelab26
	addi $t0, $zero, 0
	j endlab26
truelab26:
	addi $t0, $zero, 1
endlab26:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue22
	j ifend22
iftrue22:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend22:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab27
	addi $t0, $zero, 0
	j endlab27
truelab27:
	addi $t0, $zero, 1
endlab27:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab28
	addi $t0, $zero, 0
	j endlab28
truelab28:
	addi $t0, $zero, 1
endlab28:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab29
	addi $t0, $zero, 0
	j endlab29
truelab29:
	addi $t0, $zero, 1
endlab29:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab30
	addi $t0, $zero, 0
	j endlab30
truelab30:
	addi $t0, $zero, 1
endlab30:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	beq $t2, $t0, truelab31
	addi $t0, $zero, 0
	j endlab31
truelab31:
	addi $t0, $zero, 1
endlab31:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue23
	j ifend23
iftrue23:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend23:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab32
	addi $t0, $zero, 0
	j endlab32
truelab32:
	addi $t0, $zero, 1
endlab32:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab33
	addi $t0, $zero, 0
	j endlab33
truelab33:
	addi $t0, $zero, 1
endlab33:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab34
	addi $t0, $zero, 0
	j endlab34
truelab34:
	addi $t0, $zero, 1
endlab34:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab35
	addi $t0, $zero, 0
	j endlab35
truelab35:
	addi $t0, $zero, 1
endlab35:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	beq $t2, $t0, truelab36
	addi $t0, $zero, 0
	j endlab36
truelab36:
	addi $t0, $zero, 1
endlab36:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue24
	j ifend24
iftrue24:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend24:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab37
	addi $t0, $zero, 0
	j endlab37
truelab37:
	addi $t0, $zero, 1
endlab37:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab38
	addi $t0, $zero, 0
	j endlab38
truelab38:
	addi $t0, $zero, 1
endlab38:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab39
	addi $t0, $zero, 0
	j endlab39
truelab39:
	addi $t0, $zero, 1
endlab39:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab40
	addi $t0, $zero, 0
	j endlab40
truelab40:
	addi $t0, $zero, 1
endlab40:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab41
	addi $t0, $zero, 0
	j endlab41
truelab41:
	addi $t0, $zero, 1
endlab41:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue25
	j ifend25
iftrue25:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend25:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab42
	addi $t0, $zero, 0
	j endlab42
truelab42:
	addi $t0, $zero, 1
endlab42:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab43
	addi $t0, $zero, 0
	j endlab43
truelab43:
	addi $t0, $zero, 1
endlab43:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab44
	addi $t0, $zero, 0
	j endlab44
truelab44:
	addi $t0, $zero, 1
endlab44:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab45
	addi $t0, $zero, 0
	j endlab45
truelab45:
	addi $t0, $zero, 1
endlab45:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab46
	addi $t0, $zero, 0
	j endlab46
truelab46:
	addi $t0, $zero, 1
endlab46:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue26
	j ifend26
iftrue26:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend26:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab47
	addi $t0, $zero, 0
	j endlab47
truelab47:
	addi $t0, $zero, 1
endlab47:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab48
	addi $t0, $zero, 0
	j endlab48
truelab48:
	addi $t0, $zero, 1
endlab48:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab49
	addi $t0, $zero, 0
	j endlab49
truelab49:
	addi $t0, $zero, 1
endlab49:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab50
	addi $t0, $zero, 0
	j endlab50
truelab50:
	addi $t0, $zero, 1
endlab50:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab51
	addi $t0, $zero, 0
	j endlab51
truelab51:
	addi $t0, $zero, 1
endlab51:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue27
	j ifend27
iftrue27:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend27:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab52
	addi $t0, $zero, 0
	j endlab52
truelab52:
	addi $t0, $zero, 1
endlab52:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab53
	addi $t0, $zero, 0
	j endlab53
truelab53:
	addi $t0, $zero, 1
endlab53:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab54
	addi $t0, $zero, 0
	j endlab54
truelab54:
	addi $t0, $zero, 1
endlab54:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab55
	addi $t0, $zero, 0
	j endlab55
truelab55:
	addi $t0, $zero, 1
endlab55:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab56
	addi $t0, $zero, 0
	j endlab56
truelab56:
	addi $t0, $zero, 1
endlab56:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue28
	j ifend28
iftrue28:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend28:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j half_open2end1
half_open2end1:
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
open21:
	sw $sp, -4($sp)
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -16
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue29
	j ifend29
iftrue29:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j open2end1
ifend29:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab57
	addi $t0, $zero, 0
	j endlab57
truelab57:
	addi $t0, $zero, 1
endlab57:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab58
	addi $t0, $zero, 0
	j endlab58
truelab58:
	addi $t0, $zero, 1
endlab58:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab59
	addi $t0, $zero, 0
	j endlab59
truelab59:
	addi $t0, $zero, 1
endlab59:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	beq $t2, $t0, truelab60
	addi $t0, $zero, 0
	j endlab60
truelab60:
	addi $t0, $zero, 1
endlab60:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue30
	j ifend30
iftrue30:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend30:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab61
	addi $t0, $zero, 0
	j endlab61
truelab61:
	addi $t0, $zero, 1
endlab61:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab62
	addi $t0, $zero, 0
	j endlab62
truelab62:
	addi $t0, $zero, 1
endlab62:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab63
	addi $t0, $zero, 0
	j endlab63
truelab63:
	addi $t0, $zero, 1
endlab63:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	beq $t2, $t0, truelab64
	addi $t0, $zero, 0
	j endlab64
truelab64:
	addi $t0, $zero, 1
endlab64:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue31
	j ifend31
iftrue31:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend31:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab65
	addi $t0, $zero, 0
	j endlab65
truelab65:
	addi $t0, $zero, 1
endlab65:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab66
	addi $t0, $zero, 0
	j endlab66
truelab66:
	addi $t0, $zero, 1
endlab66:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab67
	addi $t0, $zero, 0
	j endlab67
truelab67:
	addi $t0, $zero, 1
endlab67:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	beq $t2, $t0, truelab68
	addi $t0, $zero, 0
	j endlab68
truelab68:
	addi $t0, $zero, 1
endlab68:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue32
	j ifend32
iftrue32:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend32:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab69
	addi $t0, $zero, 0
	j endlab69
truelab69:
	addi $t0, $zero, 1
endlab69:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab70
	addi $t0, $zero, 0
	j endlab70
truelab70:
	addi $t0, $zero, 1
endlab70:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab71
	addi $t0, $zero, 0
	j endlab71
truelab71:
	addi $t0, $zero, 1
endlab71:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	beq $t2, $t0, truelab72
	addi $t0, $zero, 0
	j endlab72
truelab72:
	addi $t0, $zero, 1
endlab72:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue33
	j ifend33
iftrue33:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend33:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j open2end1
open2end1:
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
half_open31:
	sw $sp, -4($sp)
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -16
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue34
	j ifend34
iftrue34:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j half_open3end1
ifend34:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab73
	addi $t0, $zero, 0
	j endlab73
truelab73:
	addi $t0, $zero, 1
endlab73:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab74
	addi $t0, $zero, 0
	j endlab74
truelab74:
	addi $t0, $zero, 1
endlab74:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab75
	addi $t0, $zero, 0
	j endlab75
truelab75:
	addi $t0, $zero, 1
endlab75:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab76
	addi $t0, $zero, 0
	j endlab76
truelab76:
	addi $t0, $zero, 1
endlab76:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab77
	addi $t0, $zero, 0
	j endlab77
truelab77:
	addi $t0, $zero, 1
endlab77:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	beq $t2, $t0, truelab78
	addi $t0, $zero, 0
	j endlab78
truelab78:
	addi $t0, $zero, 1
endlab78:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue35
	j ifend35
iftrue35:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend35:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab79
	addi $t0, $zero, 0
	j endlab79
truelab79:
	addi $t0, $zero, 1
endlab79:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab80
	addi $t0, $zero, 0
	j endlab80
truelab80:
	addi $t0, $zero, 1
endlab80:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab81
	addi $t0, $zero, 0
	j endlab81
truelab81:
	addi $t0, $zero, 1
endlab81:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab82
	addi $t0, $zero, 0
	j endlab82
truelab82:
	addi $t0, $zero, 1
endlab82:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab83
	addi $t0, $zero, 0
	j endlab83
truelab83:
	addi $t0, $zero, 1
endlab83:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	beq $t2, $t0, truelab84
	addi $t0, $zero, 0
	j endlab84
truelab84:
	addi $t0, $zero, 1
endlab84:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue36
	j ifend36
iftrue36:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend36:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab85
	addi $t0, $zero, 0
	j endlab85
truelab85:
	addi $t0, $zero, 1
endlab85:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab86
	addi $t0, $zero, 0
	j endlab86
truelab86:
	addi $t0, $zero, 1
endlab86:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab87
	addi $t0, $zero, 0
	j endlab87
truelab87:
	addi $t0, $zero, 1
endlab87:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab88
	addi $t0, $zero, 0
	j endlab88
truelab88:
	addi $t0, $zero, 1
endlab88:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab89
	addi $t0, $zero, 0
	j endlab89
truelab89:
	addi $t0, $zero, 1
endlab89:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	beq $t2, $t0, truelab90
	addi $t0, $zero, 0
	j endlab90
truelab90:
	addi $t0, $zero, 1
endlab90:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue37
	j ifend37
iftrue37:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend37:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab91
	addi $t0, $zero, 0
	j endlab91
truelab91:
	addi $t0, $zero, 1
endlab91:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab92
	addi $t0, $zero, 0
	j endlab92
truelab92:
	addi $t0, $zero, 1
endlab92:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab93
	addi $t0, $zero, 0
	j endlab93
truelab93:
	addi $t0, $zero, 1
endlab93:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab94
	addi $t0, $zero, 0
	j endlab94
truelab94:
	addi $t0, $zero, 1
endlab94:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab95
	addi $t0, $zero, 0
	j endlab95
truelab95:
	addi $t0, $zero, 1
endlab95:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	beq $t2, $t0, truelab96
	addi $t0, $zero, 0
	j endlab96
truelab96:
	addi $t0, $zero, 1
endlab96:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue38
	j ifend38
iftrue38:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend38:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab97
	addi $t0, $zero, 0
	j endlab97
truelab97:
	addi $t0, $zero, 1
endlab97:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab98
	addi $t0, $zero, 0
	j endlab98
truelab98:
	addi $t0, $zero, 1
endlab98:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab99
	addi $t0, $zero, 0
	j endlab99
truelab99:
	addi $t0, $zero, 1
endlab99:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab100
	addi $t0, $zero, 0
	j endlab100
truelab100:
	addi $t0, $zero, 1
endlab100:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab101
	addi $t0, $zero, 0
	j endlab101
truelab101:
	addi $t0, $zero, 1
endlab101:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab102
	addi $t0, $zero, 0
	j endlab102
truelab102:
	addi $t0, $zero, 1
endlab102:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue39
	j ifend39
iftrue39:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend39:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab103
	addi $t0, $zero, 0
	j endlab103
truelab103:
	addi $t0, $zero, 1
endlab103:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab104
	addi $t0, $zero, 0
	j endlab104
truelab104:
	addi $t0, $zero, 1
endlab104:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab105
	addi $t0, $zero, 0
	j endlab105
truelab105:
	addi $t0, $zero, 1
endlab105:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab106
	addi $t0, $zero, 0
	j endlab106
truelab106:
	addi $t0, $zero, 1
endlab106:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab107
	addi $t0, $zero, 0
	j endlab107
truelab107:
	addi $t0, $zero, 1
endlab107:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab108
	addi $t0, $zero, 0
	j endlab108
truelab108:
	addi $t0, $zero, 1
endlab108:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue40
	j ifend40
iftrue40:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend40:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab109
	addi $t0, $zero, 0
	j endlab109
truelab109:
	addi $t0, $zero, 1
endlab109:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab110
	addi $t0, $zero, 0
	j endlab110
truelab110:
	addi $t0, $zero, 1
endlab110:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab111
	addi $t0, $zero, 0
	j endlab111
truelab111:
	addi $t0, $zero, 1
endlab111:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab112
	addi $t0, $zero, 0
	j endlab112
truelab112:
	addi $t0, $zero, 1
endlab112:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab113
	addi $t0, $zero, 0
	j endlab113
truelab113:
	addi $t0, $zero, 1
endlab113:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab114
	addi $t0, $zero, 0
	j endlab114
truelab114:
	addi $t0, $zero, 1
endlab114:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue41
	j ifend41
iftrue41:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend41:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab115
	addi $t0, $zero, 0
	j endlab115
truelab115:
	addi $t0, $zero, 1
endlab115:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab116
	addi $t0, $zero, 0
	j endlab116
truelab116:
	addi $t0, $zero, 1
endlab116:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab117
	addi $t0, $zero, 0
	j endlab117
truelab117:
	addi $t0, $zero, 1
endlab117:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab118
	addi $t0, $zero, 0
	j endlab118
truelab118:
	addi $t0, $zero, 1
endlab118:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal swap1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab119
	addi $t0, $zero, 0
	j endlab119
truelab119:
	addi $t0, $zero, 1
endlab119:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	addi $t0, $zero, 3
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab120
	addi $t0, $zero, 0
	j endlab120
truelab120:
	addi $t0, $zero, 1
endlab120:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	add $t0, $t2, $t0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue42
	j ifend42
iftrue42:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend42:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j half_open3end1
half_open3end1:
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
open31:
	sw $sp, -4($sp)
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -16
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue43
	j ifend43
iftrue43:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j open3end1
ifend43:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab121
	addi $t0, $zero, 0
	j endlab121
truelab121:
	addi $t0, $zero, 1
endlab121:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab122
	addi $t0, $zero, 0
	j endlab122
truelab122:
	addi $t0, $zero, 1
endlab122:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab123
	addi $t0, $zero, 0
	j endlab123
truelab123:
	addi $t0, $zero, 1
endlab123:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab124
	addi $t0, $zero, 0
	j endlab124
truelab124:
	addi $t0, $zero, 1
endlab124:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	beq $t2, $t0, truelab125
	addi $t0, $zero, 0
	j endlab125
truelab125:
	addi $t0, $zero, 1
endlab125:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue44
	j ifend44
iftrue44:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend44:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab126
	addi $t0, $zero, 0
	j endlab126
truelab126:
	addi $t0, $zero, 1
endlab126:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab127
	addi $t0, $zero, 0
	j endlab127
truelab127:
	addi $t0, $zero, 1
endlab127:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab128
	addi $t0, $zero, 0
	j endlab128
truelab128:
	addi $t0, $zero, 1
endlab128:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab129
	addi $t0, $zero, 0
	j endlab129
truelab129:
	addi $t0, $zero, 1
endlab129:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	beq $t2, $t0, truelab130
	addi $t0, $zero, 0
	j endlab130
truelab130:
	addi $t0, $zero, 1
endlab130:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue45
	j ifend45
iftrue45:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend45:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab131
	addi $t0, $zero, 0
	j endlab131
truelab131:
	addi $t0, $zero, 1
endlab131:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab132
	addi $t0, $zero, 0
	j endlab132
truelab132:
	addi $t0, $zero, 1
endlab132:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab133
	addi $t0, $zero, 0
	j endlab133
truelab133:
	addi $t0, $zero, 1
endlab133:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab134
	addi $t0, $zero, 0
	j endlab134
truelab134:
	addi $t0, $zero, 1
endlab134:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	beq $t2, $t0, truelab135
	addi $t0, $zero, 0
	j endlab135
truelab135:
	addi $t0, $zero, 1
endlab135:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue46
	j ifend46
iftrue46:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend46:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab136
	addi $t0, $zero, 0
	j endlab136
truelab136:
	addi $t0, $zero, 1
endlab136:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
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
	beq $t2, $t0, truelab137
	addi $t0, $zero, 0
	j endlab137
truelab137:
	addi $t0, $zero, 1
endlab137:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab138
	addi $t0, $zero, 0
	j endlab138
truelab138:
	addi $t0, $zero, 1
endlab138:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab139
	addi $t0, $zero, 0
	j endlab139
truelab139:
	addi $t0, $zero, 1
endlab139:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	beq $t2, $t0, truelab140
	addi $t0, $zero, 0
	j endlab140
truelab140:
	addi $t0, $zero, 1
endlab140:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue47
	j ifend47
iftrue47:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend47:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j open3end1
open3end1:
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
four1:
	sw $sp, -4($sp)
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -16
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, 0($fp)
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
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue48
	j ifend48
iftrue48:
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j fourend1
ifend48:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab141
	addi $t0, $zero, 0
	j endlab141
truelab141:
	addi $t0, $zero, 1
endlab141:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab142
	addi $t0, $zero, 0
	j endlab142
truelab142:
	addi $t0, $zero, 1
endlab142:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab143
	addi $t0, $zero, 0
	j endlab143
truelab143:
	addi $t0, $zero, 1
endlab143:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab144
	addi $t0, $zero, 0
	j endlab144
truelab144:
	addi $t0, $zero, 1
endlab144:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue49
	j ifend49
iftrue49:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend49:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab145
	addi $t0, $zero, 0
	j endlab145
truelab145:
	addi $t0, $zero, 1
endlab145:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab146
	addi $t0, $zero, 0
	j endlab146
truelab146:
	addi $t0, $zero, 1
endlab146:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab147
	addi $t0, $zero, 0
	j endlab147
truelab147:
	addi $t0, $zero, 1
endlab147:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab148
	addi $t0, $zero, 0
	j endlab148
truelab148:
	addi $t0, $zero, 1
endlab148:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue50
	j ifend50
iftrue50:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend50:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab149
	addi $t0, $zero, 0
	j endlab149
truelab149:
	addi $t0, $zero, 1
endlab149:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab150
	addi $t0, $zero, 0
	j endlab150
truelab150:
	addi $t0, $zero, 1
endlab150:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab151
	addi $t0, $zero, 0
	j endlab151
truelab151:
	addi $t0, $zero, 1
endlab151:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, 3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab152
	addi $t0, $zero, 0
	j endlab152
truelab152:
	addi $t0, $zero, 1
endlab152:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue51
	j ifend51
iftrue51:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend51:
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
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal GetBoard1
	addi $sp, $sp, 12
	addi $t0, $v0, 0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab153
	addi $t0, $zero, 0
	j endlab153
truelab153:
	addi $t0, $zero, 1
endlab153:
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 2
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab154
	addi $t0, $zero, 0
	j endlab154
truelab154:
	addi $t0, $zero, 1
endlab154:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -3
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 3
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab155
	addi $t0, $zero, 0
	j endlab155
truelab155:
	addi $t0, $zero, 1
endlab155:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, 4
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
	addi $t0, $t0, 16
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, truelab156
	addi $t0, $zero, 0
	j endlab156
truelab156:
	addi $t0, $zero, 1
endlab156:
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	mult $t2, $t0
	mflo $t0
	bgtz $t0, iftrue52
	j ifend52
iftrue52:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, 0($fp)
ifend52:
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j fourend1
fourend1:
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
GetComputerMove1:
	sw $sp, -16($sp)
	sw $fp, -20($sp)
	sw $ra, -24($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -28
	addi $sp, $t0, 0
	addi $t0, $zero, 0
	sw $t0, -8($fp)
	j fortest12
forstart12:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest12:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
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
	bgtz $t0, forstart12
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal DoMove1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal value1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, 0($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal UndoMove1
	addi $sp, $sp, 8
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
	j fortest13
forstart13:
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal DoMove1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal value1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	sw $t0, -12($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, iftrue53
	j ifend53
iftrue53:
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, -4($fp)
ifend53:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal UndoMove1
	addi $sp, $sp, 8
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest13:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart13
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $v0, $t0, 0
	j GetComputerMoveend1
GetComputerMoveend1:
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
min1:
	sw $sp, -16($sp)
	sw $fp, -20($sp)
	sw $ra, -24($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -28
	addi $sp, $t0, 0
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue54
	j ifend54
iftrue54:
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal value1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, -4($t2)
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t0, $t0, -1
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j minend1
ifend54:
	addi $t0, $zero, 0
	sw $t0, -8($fp)
	j fortest14
forstart14:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest14:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
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
	bgtz $t0, forstart14
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal DoMove1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal max1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal UndoMove1
	addi $sp, $sp, 8
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
	j fortest15
forstart15:
	addi $t0, $zero, 2
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal DoMove1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal max1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, -12($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, iftrue55
	j ifend55
iftrue55:
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, -4($fp)
ifend55:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal UndoMove1
	addi $sp, $sp, 8
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest15:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart15
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, -4($t2)
minend1:
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
max1:
	sw $sp, -16($sp)
	sw $fp, -20($sp)
	sw $ra, -24($sp)
	add $t0, $sp, $zero
	addi $fp, $t0, 0
	add $t0, $sp, $zero
	addi $t0, $t0, -28
	addi $sp, $t0, 0
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	beq $t2, $t0, iftrue56
	j ifend56
iftrue56:
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal value1
	addi $sp, $sp, 4
	addi $t0, $v0, 0
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, -4($t2)
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 0
	addi $t0, $t0, -1
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
	addi $t0, $zero, 0
	addi $v0, $t0, 0
	j maxend1
ifend56:
	addi $t0, $zero, 0
	sw $t0, -8($fp)
	j fortest16
forstart16:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest16:
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
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
	bgtz $t0, forstart16
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal DoMove1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, -4($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal min1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, 0($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal UndoMove1
	addi $sp, $sp, 8
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
	j fortest17
forstart17:
	addi $t0, $zero, 1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal DoMove1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 8
	lw $t0, 0($t0)
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal min1
	addi $sp, $sp, 12
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	sw $t0, -12($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t0, $t2
	bgtz $t0, iftrue57
	j ifend57
iftrue57:
	add $t0, $fp, $zero
	addi $t0, $t0, -12
	lw $t0, 0($t0)
	sw $t0, 0($fp)
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, -4($fp)
ifend57:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 4
	lw $t0, 0($t0)
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	jal UndoMove1
	addi $sp, $sp, 8
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	addi $t0, $t0, 1
	sw $t0, -8($fp)
fortest17:
	add $t0, $fp, $zero
	addi $t0, $t0, -8
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	addi $t0, $zero, 10
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	slt $t0, $t2, $t0
	bgtz $t0, forstart17
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, -4
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, 0($t2)
	add $t0, $fp, $zero
	addi $t0, $t0, 12
	lw $t0, 0($t0)
	sw $t0, 0($t1)
	addi $t1, $t1, -4
	add $t0, $fp, $zero
	addi $t0, $t0, 0
	lw $t0, 0($t0)
	addi $t1, $t1, 4
	lw $t2, 0($t1)
	sw $t0, -4($t2)
maxend1:
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
