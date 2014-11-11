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
			PC_Enable   : in STD_LOGIC;
			CLK		: in STD_LOGIC);
end component;

----------------------------------------------------------------
-- ALU_WRAPPER
----------------------------------------------------------------
component ALU_WRAPPER is
     Port (clk : in std_logic; 
			  RST : in  STD_LOGIC;
			  ALU_InA 		: in  STD_LOGIC_VECTOR (31 downto 0);				
			  ALU_InB 		: in  STD_LOGIC_VECTOR (31 downto 0);
           Control_In : in  STD_LOGIC_VECTOR (7 downto 0);
			  Result1		: out STD_LOGIC_VECTOR (31 downto 0);
			  Result2		: out STD_LOGIC_VECTOR (31 downto 0);
			  Status		: out	STD_LOGIC_VECTOR (2 downto 0);
			  ALU_zero		: out STD_LOGIC);
end component;

----------------------------------------------------------------
-- Control Unit
----------------------------------------------------------------
component ControlUnit is
    Port ( 	
			instr 		: in  STD_LOGIC_VECTOR (31 downto 0);
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
			RegDst		: out  STD_LOGIC;
			HI_Read     : out STD_LOGIC;
			LO_Read     : out STD_LOGIC;
			HL_write    : out STD_LOGIC;
			JR          : out STD_LOGIC;
			LINK_DEST   : out STD_LOGIC;
			BGEZ : out STD_LOGIC;
			Shift : out STD_LOGIC;			
			SLLV: out STD_LOGIC);   
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
	signal 	PC_Enable   : STD_LOGIC;

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

----------------------------------------------------------------
-- Control Unit Signals
----------------------------------------------------------------				
	signal	ALUOp 		:  STD_LOGIC_VECTOR (1 downto 0);
	signal	Branch 		:  STD_LOGIC;
	signal	Jump	 		:  STD_LOGIC;	
	signal	MemtoReg 	:  STD_LOGIC;
	signal 	InstrtoReg	: 	STD_LOGIC;		
	signal	ALUSrc 		:  STD_LOGIC;	
	signal	SignExtend 	: 	STD_LOGIC;
	signal	RegWrite		: 	STD_LOGIC;	
	signal	RegDst		:  STD_LOGIC;
	signal   HI_Read     :  STD_LOGIC;
	signal   HL_Write    :  STD_LOGIC;
	signal   LO_Read     :  STD_LOGIC;
	signal   JR     :  STD_LOGIC;
	signal   LINK_DEST   : STD_LOGIC;
	signal   BGEZ   		: STD_LOGIC;
	signal 	Shift			: STD_LOGIC;
	signal SLLV:  STD_LOGIC;

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
	signal  PCBGEZ	:  STD_LOGIC;	

	--Other Signals ---
	signal HIGH : STD_LOGIC_VECTOR(31 downto 0);
	signal LOW : STD_LOGIC_VECTOR(31 downto 0);


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
						PC_Enable => PC_Enable,
						CLK 		=> CLK
						);
						
----------------------------------------------------------------
-- ALU_WRAPPER port map
----------------------------------------------------------------
ALU_WRAPPER1 				: ALU_WRAPPER port map
						(
							clk=>clk,
						RST => RESET,	
						ALU_InA 		=> ALU_InA, 
						ALU_InB 		=> ALU_InB, 
						Result1 		=> Result1,
						Result2 		=> Result2,						
						Control_In  => ALU_Control, 
						ALU_zero  	=> ALU_zero,
						Status		=> Status
						);
						
----------------------------------------------------------------
-- Control port map
----------------------------------------------------------------
ControlUnit1 	: ControlUnit port map
						(
						instr		=> instr, 
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
						RegDst 		=> RegDst,
						HI_Read     => HI_Read,
						LO_Read     => LO_Read,
						HL_Write    => HL_Write,
						JR 			=> JR,
						LINK_DEST 	=> LINK_DEST,
						BGEZ 			=> BGEZ,
						Shift			=> Shift,
						SLLV			=>SLLV
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
								SignExtend_Out, RegDst, ReadData1_Reg, ReadData2_Reg, Result1, PC_out, ALU_zero, status,
								bgez, jr, pcbgez, link_dest, hi_read, lo_read, high, low)

begin
--fetch--
--pc stalling--
PC_Enable <= (NOT Status(2));
--/pcstalling--

PCPlusFour <= PC_out + "100";
PCSrc <= Branch and ALU_zero;

if ((ReadData1_Reg >= 0) and BGEZ = '1') then
	PCBGEZ <= '1';
else
	PCBGEZ <= '0'; 
end if ;

if Jump = '1' then
	if JR = '1' then
		PC_in <= ReadData1_Reg;
	else 
		PC_in <= PCPlusFour(31 downto 28) & Instr(25 downto 0) & "00";
	end if;	
else
	if (PCBGEZ='1' or PCSrc='1') then
		PC_in <= PCPlusFour + (SignExtend_Out(29 downto 0) & "00");
	else
		PC_in <= PCPlusFour;
	end if;
end if;
Addr_Instr <= PC_out;
--/fetch--

--decode--
ReadAddr1_Reg <= Instr(25 downto 21);
ReadAddr2_Reg <= Instr(20 downto 16);
SignExtend_In <= Instr(15 downto 0);
--/decode

--execute--
ALU_Control(7 downto 6) <= ALUOp(1 downto 0);
ALU_Control(5 downto 0) <= Instr(5 downto 0);
if (Shift = '1' or SLLV = '1') then
	ALU_InA <= ReadData2_Reg;
else
	ALU_InA <= ReadData1_Reg;
end if;
if (Shift = '1') then
	ALU_InB <= "000000000000000000000000000" & Instr(10 downto 6);
else
	if (SLLV = '1') then
		ALU_InB <= ReadData1_Reg;
	else
		if ALUSrc = '1' then
			ALU_InB <= SignExtend_Out;
		else
			ALU_InB <= ReadData2_Reg;
		end if;
	end if;
end if;
--/execute--

--mem--
Addr_Data <= Result1;
Data_Out <= ReadData2_Reg;
--/mem--

--writeBack--
--address--
if (LINK_DEST = '1') then 
	WriteAddr_Reg  <= "11111";
else 	
	if RegDst = '1' then
		WriteAddr_Reg <= Instr(15 downto 11);
	else
		WriteAddr_Reg <= Instr(20 downto 16);
	end if;
end if;	
--/address--

--data--
if (LINK_DEST = '1') then
	WriteData_Reg <= PCPlusFour;
else
	if (HI_Read = '1') then
		WriteData_Reg <= HIGH;
	else
		if (LO_Read = '1') then
		WriteData_Reg <= LOW;
		else
			if InstrtoReg = '1' then
				WriteData_Reg <= Instr(15 downto 0) & x"0000";
			else
				if MemtoReg = '1' then
					WriteData_Reg <= Data_In;
				else
					WriteData_Reg <= Result1;
				end if;
			end if;
		end if;
	end if;
end if;
--/data--

--/writeBack--

end process;

mfhi : process(Clk)
begin
if (clk'event and clk='1') then

	if(HL_Write = '1') then
		LOW <= Result1;
		HIGH <= Result2;
	else
		null;
	end if;	

end if;
end process;

end arch_MIPS;

----------------------------------------------------------------	
----------------------------------------------------------------
-- </MIPS architecture>
----------------------------------------------------------------
----------------------------------------------------------------	
