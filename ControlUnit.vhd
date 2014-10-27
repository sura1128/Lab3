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
    Port ( 	opcode 		: in  STD_LOGIC_VECTOR (5 downto 0);
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
				RegDst		: out  STD_LOGIC);
end ControlUnit;


--architecture arch_ControlUnit of ControlUnit is  
--begin   
--
--<implement control unit here>
--
--
--case opcode(5 downto 4) is
--when "10" => -- I-type
--	ALUOp <= '00';
--	Branch <= '0';
--	Jump <= '0';
--	MemRead <= '1';
--	MemtoReg <= '1';
--	InstrtoReg <= '0';
--	MemWrite <= '0';
--	ALUSrc <= '1';
--	SignExtend <= '0';
--	RegWrite <= '1';
--	RegDst <= '0';
--
--
--when "00" => -- R-type or J-type
--	
--	if opcode(3 downto 0) = '0100' then --BEQ
--		<output>
--		ALUOp <= '01';
--		Branch <= '1';
--		Jump <= '';
--		MemRead <= '0';
--		MemtoReg <= '';
--		InstrtoReg <= '';
--		MemWrite <= '';
--		ALUSrc <= '0';
--		SignExtend <= '';
--		RegWrite <= '';
--		RegDst <= '';
--
--
--	elsif opcode(3 downto 0) = '0010' then --J
--		<output>
--		ALUOp <= '01';
--		Branch <= '';
--		Jump <= '';
--		MemRead <= '';
--		MemtoReg <= '';
--		InstrtoReg <= '';
--		MemWrite <= '';
--		ALUSrc <= '';
--		SignExtend <= '';
--		RegWrite <= '';
--		RegDst <= '';
--
--	else --R-type
--		ALUOp <= '10';
--		Branch <= '0';
--		Jump <= '0';
--		MemRead <= '';
--		MemtoReg <= '';
--		InstrtoReg <= '';
--		MemWrite <= '';
--		ALUSrc <= '0';
--		SignExtend <= '';
--		RegWrite <= '1';
--		RegDst <= '1';
--
--	end if
--		<ORI to be added>
--
--
--end case;
--
--end arch_ControlUnit;
