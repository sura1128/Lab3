----------------------------------------------------------------------------------
-- Company: NUS
-- Engineer: Rajesh Panicker
-- 
-- Create Date:   21:06:18 14/10/2014
-- Design Name: 	ControlUnit
-- Target Devices: Nexys 4 (Artix 7 100T)
-- Tool versions: ISE 14.7
-- Description: Control Unit for the basic MIPS processor
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: The interface (entity) as well as implementation (architecture) can be modified
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ControlUnit is
    Port ( 	instr 		: in  STD_LOGIC_VECTOR (31 downto 0);
				ALUOp 		: out  STD_LOGIC_VECTOR (1 downto 0);
				Branch 		: out  STD_LOGIC;		
				Jump	 		: out  STD_LOGIC;	
				MemRead 		: out  STD_LOGIC;	
				MemtoReg 	: out  STD_LOGIC;	
				InstrtoReg	: out STD_LOGIC;
				MemWrite		: out  STD_LOGIC;	
				ALUSrc 		: out  STD_LOGIC;	
				SignExtend 	: out  STD_LOGIC;
				RegWrite		: out  STD_LOGIC;	
				RegDst		: out  STD_LOGIC;
				
				HL_Read     : out STD_LOGIC;
				HL_write    : out STD_LOGIC);  
end ControlUnit;


architecture arch_ControlUnit of ControlUnit is
begin
--
--<implement control unit here>
process (instr)
begin

case instr(31 downto 30) is

when "10" => -- I-type

	if instr(29 downto 26) = "0011" then -- lw
	
	ALUOp <= "00";
	Branch <= '0';
	Jump <= '0';
	MemRead <= '1';
	MemtoReg <= '1';
	InstrtoReg <= '0';
	MemWrite <= '0';
	ALUSrc <= '1';
	SignExtend <= '1';
	RegWrite <= '1';
	RegDst <= '0';
	HL_Read <= '0';
	HL_Write <= '0';		

	
	elsif instr(29 downto 26) = "1011" then --sw
	
	ALUOp <= "00";
	Branch <= '0';
	Jump <= '0';
	MemRead <= '0';
	MemtoReg <= '0';
	InstrtoReg <= '0';
	MemWrite <= '1';
	ALUSrc <= '1';
	SignExtend <= '1';
	RegWrite <= '0';
	RegDst <= '0';
	HL_Read <= '0';
	HL_Write <= '0';		

	
	else
		ALUOp <= "00";
		Branch <= '0';
		Jump <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '0';
		SignExtend <= '0';
		RegWrite <= '0';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';		

	end if;
	
when "00" => 

	if instr(29 downto 26) = "0000" then --R-type
		ALUOp <= "10";
		Branch <= '0';
		Jump <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '0';
		SignExtend <= '0';
		RegWrite <= '1';
		RegDst <= '1';
		if (instr(5 downto 0) = "011000" || instr(5 downto 0) = "011001" || instr(5 downto 0) = "011010" ||instr(5 downto 0) = "011011") then
			HL_Write <= '1';
			HL_Read <= '0';
		elsif (instr(5 downto 0) = "010000" || instr(5 downto 0) = "010010") then
			HL_Read <= '1';
			HL_Write <= '0';
		else
			HL_Read <= '0';
			HL_Write <= '0';			
		end if;	
		
	elsif instr(29 downto 26) = "1000" then --ADDI
		ALUOp <= "00";
		Branch <= '0';
		Jump <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '1';
		SignExtend <= '1';
		RegWrite <= '1';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';
	
	elsif instr(29 downto 26) = "0100" then --BEQ
		--<output>
		ALUOp <= "01";
		Branch <= '1';
		Jump <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '0';
		SignExtend <= '1';
		RegWrite <= '0';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';		
	
	elsif instr(29 downto 26) = "0001" then --BGEZ, BGEZAL
		--<output>
		ALUOp <= "01";
		Branch <= '1';
		Jump <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '0';
		SignExtend <= '1';
		RegWrite <= '0';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';		


	elsif instr(29 downto 26) = "0010" then --J
		--<output>
		ALUOp <= "01";
		Branch <= '0';
		Jump <= '1';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '0';
		SignExtend <= '0';
		RegWrite <= '0';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';		

		
	elsif instr(29 downto 26) = "0011" then --JAL
		--<output>
		ALUOp <= "01";
		Branch <= '0';
		Jump <= '1';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '0';
		SignExtend <= '0';
		RegWrite <= '0';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';		

	
	elsif instr(29 downto 26) = "1101" then --ori
		ALUOp <= "11";
		Branch <= '0';
		Jump <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '1';
		SignExtend <= '0';
		RegWrite <= '1';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';		

		
	elsif instr(29 downto 26) = "1111" then --lui
		ALUOp <= "00";
		Branch <= '0';
		Jump <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '1';
		MemWrite <= '0';
		ALUSrc <= '0';
		SignExtend <= '0';
		RegWrite <= '1';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';		

		
	else
		ALUOp <= "00";
		Branch <= '0';
		Jump <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '0';
		SignExtend <= '0';
		RegWrite <= '0';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';		

	end if;
 	
when others =>
		ALUOp <= "00";
		Branch <= '0';
		Jump <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		InstrtoReg <= '0';
		MemWrite <= '0';
		ALUSrc <= '0';
		SignExtend <= '0';
		RegWrite <= '0';
		RegDst <= '0';
		HL_Read <= '0';
		HL_Write <= '0';		

end case;

end process;

end arch_ControlUnit;
