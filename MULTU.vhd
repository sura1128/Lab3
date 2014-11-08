----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:32 09/26/2014 
-- Design Name: 
-- Module Name:    MULTU - MULTU_ARCH 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MULTU is
generic (width : integer := 32);
    Port ( EnableU : in STD_LOGIC := '0';
			 LowerU : out  STD_LOGIC_VECTOR (width-1 downto 0);
			 UpperU : out  STD_LOGIC_VECTOR (width-1 downto 0);
			 Operand1 : in  STD_LOGIC_VECTOR (width-1 downto 0);
			 Operand2 : in  STD_LOGIC_VECTOR (width-1 downto 0);
			 Clk : in STD_LOGIC);
end MULTU;

architecture MULTU_ARCH of MULTU is

begin

process (Clk, EnableU) --takes 32 cycles

variable result : std_logic_vector(width downto 0) := (others => '0');
variable temp_sum : std_logic_vector(width*2 downto 0) := (others => '0');

begin

if clk'event and clk = '1' then
	if EnableU = '1' then
		result := temp_sum(2*width downto width) + Operand1; 
		if (temp_sum(0) = '1') then
		 temp_sum(width*2 downto width) := result;
		end if;
		temp_sum := '0' & temp_sum(width*2 downto 1); 
	else
		temp_sum (2*width downto width) := (others => '0');
		temp_sum (width-1 downto 0) := Operand2;
	end if;
	UpperU <= temp_sum(2*width-1 downto width);
	LowerU <= temp_sum (width-1 downto 0);
end if;

end process;

end MULTU_ARCH;