----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:18:20 10/26/2014 
-- Design Name: 
-- Module Name:    SignExtend - SignExtend_arch 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SignExtend is
    Port ( SignExtend_In : in  STD_LOGIC_VECTOR (15 downto 0);
           SignExtend_Out : out  STD_LOGIC_VECTOR (31 downto 0);
           Enable : in  STD_LOGIC);
end SignExtend;

architecture SignExtend_arch of SignExtend is
signal output : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
begin

process(SignExtend_In, Enable)
begin

if (Enable = '1') then
SignExtend_Out (31 downto 16) <= (others => SignExtend_In(15));
SignExtend_Out(15 downto 0) <= SignExtend_In;
else
SignExtend_Out (31 downto 0) <= (others => '0');
end if;

end process;


end SignExtend_arch;

