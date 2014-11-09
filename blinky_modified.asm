ori $t1, 0x0001 # constant 1
#lui $t0, 0x1001 # DIP pointer, for MIPS simulation
lui $t0, 0x1003 # DIP pointer, for VHDL
lw  $t4, 0($t0)
lui $t0, 0x1002 # LED pointer, for VHDL
loop:
lui $t2, 0x0000
ori $t2, 0x0004 # delay counter (n). Change according to the clock

ori $t5, 0x0004 # register to demonstrate AND
and $t2, $t2, $t5 # $2 value should stay the same after this line
or $t2, $t2, $t1  # $2 should be 0x0005 after this line
add $t2, $t2, $t1 # $2 should be 0x0006 after this line
addi $t2, $t2, 1
multu $t2, $t2
mflo $t2
sub $t2, $t2, $t1

sllv $t1, $t1, $t1
srav $t1, $t1, $t1
sll $t1, $t1, 3



div $t2, $t1
mfhi $t2








delay:
sub $t2, $t2, $t1
slt $t3, $t2, $t1
beq $t3, $zero, delay
sw  $t4, 0($t0)
nor $t4, $t4, $zero
j loop
 #n*3 (delay instructions) + 5 (non-delay instructions)
 