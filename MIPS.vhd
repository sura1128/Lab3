----------------------------------------------------------------------------------
-- Company: NUS
-- Engineer: Rajesh Panicker
-- 
-- Create Date:   21:06:18 14/10/2014
-- Design Name: 	MIPS
-- Target Devices: Nexys 4 (Artix 7 100T)
-- Tool versions: ISE 14.7
-- Description: MIPS processor
--
-- Dependencies: PC, ALU, ControlUnit, RegFile
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: DO NOT modify the interface (entity). Implementation (architecture) can be modified.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity MIPS is -- DO NOT modify the interface (entity)
    Port ( 	
			Addr_Instr 		: out STD_LOGIC_VECTOR (31 downto 0);
			Instr 			: in STD_LOGIC_VECTOR (31 downto 0);
			Addr_Data		: out STD_LOGIC_VECTOR (31 downto 0);
			Data_In			: in STD_LOGIC_VECTOR (31 downto 0);
			Data_Out			: out  STD_LOGIC_VECTOR (31 downto 0);
			MemRead 			: out STD_LOGIC; 
			MemWrite 		: out STD_LOGIC; 
			RESET				: in STD_LOGIC;
			CLK				: in STD_LOGIC
			);
end MIPS;


architecture arch_MIPS of MIPS is

----------------------------------------------------------------
-- Program Counter
----------------------------------------------------------------
component PC is
	Port(	
			PC_in 	: in STD_LOGIC_VECTOR (31 downto 0);
			PC_out 	: out STD_LOGIC_VECTOR (31 downto 0);
			RESET		: in STD_LOGIC;
			CLK		: in STD_LOGIC);
end component;

----------------------------------------------------------------
-- ALU_WRAPPER
----------------------------------------------------------------
component ALU_WRAPPER is
     Port ( RST : in  STD_LOGIC;
			  ALU_InA 		: in  STD_LOGIC_VECTOR (31 downto 0);				
			  ALU_InB 		: in  STD_LOGIC_VECTOR (31 downto 0);
           Control_In : in  STD_LOGIC_VECTOR (7 downto 0);
			  Result1		: out STD_LOGIC_VECTOR (31 downto 0);
			  Result2		: out STD_LOGIC_VECTOR (31 downto 0);
			  Status		: out	STD_LOGIC_VECTOR (2 downto 0);
			  ALU_zero		: out STD_LOGIC;
			  ALU_greater	: out STD_LOGIC);
end component;

----------------------------------------------------------------
-- Control Unit
----------------------------------------------------------------
component ControlUnit is
    Port ( 	
			opcode 		: in   STD_LOGIC_VECTOR (5 downto 0);
			ALUOp 		: out  STD_LOGIC_VECTOR (1 downto 0);
			Branch 		: out  STD_LOGIC;
			Jump	 		: out  STD_LOGIC;				
			MemRead 		: out  STD_LOGIC;	
			MemtoReg 	: out  STD_LOGIC;	
			InstrtoReg	: out  STD_LOGIC; -- true for LUI. When true, Instr(15 downto 0)&x"0000" is written to rt
			MemWrite		: out  STD_LOGIC;	
			ALUSrc 		: out  STD_LOGIC;	
			SignExtend 	: out  STD_LOGIC; -- false for ORI 
			RegWrite		: out  STD_LOGIC;	
			RegDst		: out  STD_LOGIC);
end component;

----------------------------------------------------------------
-- Register File
----------------------------------------------------------------
component RegFile is
    Port ( 	
			ReadAddr1_Reg 	: in  STD_LOGIC_VECTOR (4 downto 0);
			ReadAddr2_Reg 	: in  STD_LOGIC_VECTOR (4 downto 0);
			ReadData1_Reg 	: out STD_LOGIC_VECTOR (31 downto 0);
			ReadData2_Reg 	: out STD_LOGIC_VECTOR (31 downto 0);				
			WriteAddr_Reg	: in  STD_LOGIC_VECTOR (4 downto 0); 
			WriteData_Reg 	: in STD_LOGIC_VECTOR (31 downto 0);
			RegWrite 		: in STD_LOGIC; 
			CLK 				: in  STD_LOGIC);
end component;

----------------------------------------------------------------
-- Sign Extend
----------------------------------------------------------------
component SignExtention is
	Port ( SignExtend_In : in  STD_LOGIC_VECTOR (15 downto 0);
           SignExtend_Out : out  STD_LOGIC_VECTOR (31 downto 0);
           Enable : in  STD_LOGIC);
end component;			  
			
----------------------------------------------------------------
-- PC Signals
----------------------------------------------------------------
	signal	PC_in 		:  STD_LOGIC_VECTOR (31 downto 0);
	signal	PC_out 		:  STD_LOGIC_VECTOR (31 downto 0);

----------------------------------------------------------------
-- ALU_WRAPPER Signals
----------------------------------------------------------------


	signal	  Result1		:  STD_LOGIC_VECTOR (31 downto 0);
	signal	  Result2		:  STD_LOGIC_VECTOR (31 downto 0);
	signal	  Status		: 	STD_LOGIC_VECTOR (2 downto 0);
	signal	  ALU_InA 		:  STD_LOGIC_VECTOR (31 downto 0);
	signal	  ALU_InB 		:  STD_LOGIC_VECTOR (31 downto 0);
	signal	  ALU_Control	:  STD_LOGIC_VECTOR (7 downto 0);
	signal	  ALU_zero		:  STD_LOGIC;		
	signal	  ALU_greater	:  STD_LOGIC;	

----------------------------------------------------------------
-- Control Unit Signals
----------------------------------------------------------------				
 	signal	opcode 		:  STD_LOGIC_VECTOR (5 downto 0);
	signal	ALUOp 		:  STD_LOGIC_VECTOR (1 downto 0);
	signal	Branch 		:  STD_LOGIC;
	signal	Jump	 		:  STD_LOGIC;	
	signal	MemtoReg 	:  STD_LOGIC;
	signal 	InstrtoReg	: 	STD_LOGIC;		
	signal	ALUSrc 		:  STD_LOGIC;	
	signal	SignExtend 	: 	STD_LOGIC;
	signal	RegWrite		: 	STD_LOGIC;	
	signal	RegDst		:  STD_LOGIC;

----------------------------------------------------------------
-- Register File Signals
----------------------------------------------------------------
 	signal	ReadAddr1_Reg 	:  STD_LOGIC_VECTOR (4 downto 0);
	signal	ReadAddr2_Reg 	:  STD_LOGIC_VECTOR (4 downto 0);
	signal	ReadData1_Reg 	:  STD_LOGIC_VECTOR (31 downto 0);
	signal	ReadData2_Reg 	:  STD_LOGIC_VECTOR (31 downto 0);
	signal	WriteAddr_Reg	:  STD_LOGIC_VECTOR (4 downto 0); 
	signal	WriteData_Reg 	:  STD_LOGIC_VECTOR (31 downto 0);
	
----------------------------------------------------------------
-- Sign Extend Signals
----------------------------------------------------------------	

	signal 	SignExtend_In	: STD_LOGIC_VECTOR (15 downto 0);
	signal 	SignExtend_Out	: STD_LOGIC_VECTOR (31 downto 0);

----------------------------------------------------------------
-- Other Signals
----------------------------------------------------------------
	--<any other signals used goes here>
		
	signal	PCPlusFour : STD_LOGIC_VECTOR (31 downto 0);
	signal	PCSrc	:  STD_LOGIC;


----------------------------------------------------------------	
----------------------------------------------------------------
-- <MIPS architecture>
----------------------------------------------------------------
----------------------------------------------------------------
begin

----------------------------------------------------------------
-- PC port map
----------------------------------------------------------------
PC1				: PC port map
						(
						PC_in 	=> PC_in, 
						PC_out 	=> PC_out, 
						RESET 	=> RESET,
						CLK 		=> CLK
						);
						
----------------------------------------------------------------
-- ALU_WRAPPER port map
----------------------------------------------------------------
ALU_WRAPPER1 				: ALU_WRAPPER port map
						(
						RST => RESET,	
						ALU_InA 		=> ALU_InA, 
						ALU_InB 		=> ALU_InB, 
						Result1 		=> Result1,
						Result2 		=> Result2,						
						Control_In  => ALU_Control, 
						ALU_zero  	=> ALU_zero,
						Status		=> Status,
						ALU_greater	=> ALU_greater
						);
						
----------------------------------------------------------------
-- PC port map
----------------------------------------------------------------
ControlUnit1 	: ControlUnit port map
						(
						opcode 		=> opcode, 
						ALUOp 		=> ALUOp, 
						Branch 		=> Branch, 
						Jump 			=> Jump, 
						MemRead 		=> MemRead, 
						MemtoReg 	=> MemtoReg, 
						InstrtoReg 	=> InstrtoReg, 
						MemWrite 	=> MemWrite, 
						ALUSrc 		=> ALUSrc, 
						SignExtend 	=> SignExtend, 
						RegWrite 	=> RegWrite, 
						RegDst 		=> RegDst
						);
						
----------------------------------------------------------------
-- Register file port map
----------------------------------------------------------------
RegFile1			: RegFile port map
						(
						ReadAddr1_Reg 	=>  ReadAddr1_Reg,
						ReadAddr2_Reg 	=>  ReadAddr2_Reg,
						ReadData1_Reg 	=>  ReadData1_Reg,
						ReadData2_Reg 	=>  ReadData2_Reg,
						WriteAddr_Reg 	=>  WriteAddr_Reg,
						WriteData_Reg 	=>  WriteData_Reg,
						RegWrite 		=> RegWrite,
						CLK 				=> CLK				
						);

----------------------------------------------------------------
-- Sign Extend port map
----------------------------------------------------------------
SignExtend1    : SignExtention port map
						(
						SignExtend_In => SignExtend_In,
						SignExtend_Out => SignExtend_Out,
						Enable => SignExtend
						);
			

----------------------------------------------------------------
-- Processor logic
----------------------------------------------------------------
--<Rest of the logic goes here>


combinational: process (Instr, Data_In, AluOp, Branch, Jump, MemtoReg, InstrtoReg, AluSrc, PCPlusFour, PCSrc,
								SignExtend_Out, RegDst, ReadData1_Reg, ReadData2_Reg, Alu_Out, PC_out, ALU_zero)

begin
--fetch--
PCPlusFour <= PC_out + "100";
PCSrc <= Branch and ALU_zero;
if Jump = '1' then
	PC_in <= PCPlusFour(31 downto 28) & Instr(25 downto 0) & "00";
else
	if PCSrc = '1' then	--if branch and branch is to be taken
		PC_in <= PCPlusFour + (SignExtend_Out(29 downto 0) & "00");
	else
		PC_in <= PCPlusFour;
	end if;
end if;
Addr_Instr <= PC_out;
--/fetch--

--decode--
opcode <= Instr;
ReadAddr1_Reg <= Instr(25 downto 21);
ReadAddr2_Reg <= Instr(20 downto 16);
SignExtend_In <= Instr(15 downto 0);
--/decode

--execute--
ALU_Control(7 downto 6) <= ALUOp(1 downto 0);
ALU_Control(5 downto 0) <= Instr(5 downto 0);
ALU_InA <= ReadData1_Reg;

if ALUSrc = '1' then
	ALU_InB <= SignExtend_Out;
else
	ALU_InB <= ReadData2_Reg;
end if;
--/execute--

--mem--
Addr_Data <= ALU_Out;
Data_Out <= ReadData2_Reg;
--/mem--

--writeBack--
if RegDst = '1' then
	WriteAddr_Reg <= Instr(15 downto 11);
else
	WriteAddr_Reg <= Instr(20 downto 16);
end if;

if InstrtoReg = '1' then
	WriteData_Reg <= Instr(15 downto 0) & x"0000";
else
	if MemtoReg = '1' then
		WriteData_Reg <= Data_In;
	else
		WriteData_Reg <= ALU_Out;
	end if;
end if;
--/writeBack--

end process;

end arch_MIPS;

----------------------------------------------------------------	
----------------------------------------------------------------
-- </MIPS architecture>
----------------------------------------------------------------
----------------------------------------------------------------	
