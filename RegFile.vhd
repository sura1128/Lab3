----------------------------------------------------------------------------------
-- Company: NUS
-- Engineer: Rajesh Panicker
-- 
-- Create Date:   21:06:18 14/10/2014
-- Design Name: 	RegFile
-- Target Devices: Nexys 4 (Artix 7 100T)
-- Tool versions: ISE 14.7
-- Description: Register File for the MIPS processor
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

entity RegFile is
    Port ( 	ReadAddr1_Reg 	: in  STD_LOGIC_VECTOR (4 downto 0);
				ReadAddr2_Reg 	: in  STD_LOGIC_VECTOR (4 downto 0);
				ReadData1_Reg 	: out STD_LOGIC_VECTOR (31 downto 0);
				ReadData2_Reg 	: out STD_LOGIC_VECTOR (31 downto 0);				
				WriteAddr_Reg	: in  STD_LOGIC_VECTOR (4 downto 0); 
				WriteData_Reg 	: in STD_LOGIC_VECTOR (31 downto 0);
				RegWrite 		: in STD_LOGIC; 
				CLK 				: in  STD_LOGIC);
end RegFile;


architecture arch_RegFile of RegFile is

type MEM_32x32 is array (0 to 31) of std_logic_vector (31 downto 0); -- 32 registers

-- Register File
signal REG_FILE : MEM_32x32 := (others=> x"00000000");

begin

--<Implement register file here >
--asynchronous so can read in the first half of the clock cycle
ReadData1_Reg <= REG_FILE(conv_integer(ReadAddr1_Reg));
ReadData2_Reg <= REG_FILE(conv_integer(ReadAddr2_Reg));

process (CLK)
begin
if (CLK'event and CLK='1') then
	if (RegWrite = '1') then
		if (WriteAddr_Reg /= "00000") then
			REG_FILE(conv_integer(WriteAddr_Reg)) <= WriteData_Reg;
		end if;
	end if;
end if;
end process;

end arch_RegFile;

