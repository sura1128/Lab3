ori $t1, 0x0001 # constant 1
#lui $t0, 0x1001 # DIP pointer, for MIPS simulation
lui $t0, 0x1003 # DIP pointer, for VHDL
lw  $t4, 0($t0)
lui $t0, 0x1002 # LED pointer, for VHDL
loop:
lui $t2, 0x0000
ori $t2, 0x0004 # delay counter (n). Change according to the clock

ori $t5, 0x0004 # register to demonstrate AND
ori $t3, 0x0007
and $t2, $t2, $t5 # $2 value should stay the same after this line
or $t2, $t2, $t1  # $2 should be 0x0005 after this line
add $t2, $t2, $t1 # $2 should be 0x0006 after this line

#instr for 3B
addi $t2, $t2, 1 # $2 should be 0x0007 after this line
srl $t4, $t2, 1 # 7 will become 3 after this line
sra $t2, $t4, 1 # 3 will become 1 after this line
sllv $t4, $t2, $t1 # 1 will become 2 after this line
sll $t2, $t4, 1 #2 will become 4 after this line

multu $t2, $t2 # HI register will become 0x0010
mflo $t2 # 0x0010 will be shifted back to $t2
sub $t2, $t2, $t1 #$t2 will become 000f
div $t2, $t5 #hi:3  lo:3
mfhi $t2 #$t2 will become 3
xor $t2, $t2, $t3 # $t2 will become 4 

delay:
sub $t2, $t2, $t1
slt $t3, $t2, $t1
beq $t3, $zero, delay
sw  $t4, 0($t0)
nor $t4, $t4, $zero
j loop
 #n*3 (delay instructions) + 5 (non-delay instructions)
 
