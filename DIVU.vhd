----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:22:51 09/28/2014 
-- Design Name: 
-- Module Name:    DIVU - DIVU_ARCH 
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

entity DIVU is
generic (width : integer := 32);
    Port ( EnableDU : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Operand1 : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Operand2 : in  STD_LOGIC_VECTOR (width-1 downto 0);
           QuotientDU : out  STD_LOGIC_VECTOR (width-1 downto 0);
           RemainderDU : out  STD_LOGIC_VECTOR (width-1 downto 0));
end DIVU;

architecture DIVU_ARCH of DIVU is

begin

process (clk, EnableDU) -- will take 33 cycles to finish

variable rem_div :std_logic_vector(width*2 downto 0) := (others => '0'); --only using single 64 bit reg
variable temp :std_logic_vector(width downto 0) := (others => '0');

begin

if(clk'event and clk = '1') then
	if enableDU = '1' then
		--rem_div (width*2-1 downto width) := rem_div (width*2-1 downto width) - Operand2;
		temp := ('0' & rem_div (width*2-1 downto width)) - ('0' & Operand2);
		if temp(width) = '1' then --divisor is bigger
			--rem_div (width*2-1 downto width) := rem_div (width*2-1 downto width) + Operand2; --restoring original value
			rem_div := rem_div(width*2-1 downto 0) & '0'; --shift left and add 0
		else --divisor is smaller
			rem_div (width*2-1 downto width) := temp (width-1 downto 0); --subtract from the dividend!
			rem_div := rem_div(width*2-1 downto 0) & '1'; --shift left and add 1
		end if;
	else
		rem_div(width-1 downto 0) := Operand1;
		rem_div(width*2 downto width) := (others => '0');
	
	end if;
	QuotientDU <=  rem_div(width-1 downto 0);
	RemainderDU <= rem_div(width*2 downto width+1);
end if;

end process;


end DIVU_ARCH;

