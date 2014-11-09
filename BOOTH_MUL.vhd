----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:03:07 09/26/2014 
-- Design Name: 
-- Module Name:    BOOTH_MUL - BOOTH_MUL_ARCH 
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

entity BOOTH_MULT is
generic (width : integer := 32);
    Port ( EnableB : in  STD_LOGIC;
           LowerB : out  STD_LOGIC_VECTOR (width-1 downto 0);
           UpperB : out  STD_LOGIC_VECTOR (width-1 downto 0);
           Operand1 : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Operand2 : in  STD_LOGIC_VECTOR (width-1 downto 0);
			  Clk : in  STD_LOGIC);
end BOOTH_MULT;

architecture BOOTH_MULT_ARCH of BOOTH_MULT is
signal A : std_logic_vector(width*2 downto 0) := (others => '0');
signal S : std_logic_vector(width*2 downto 0) := (others => '0');

signal sgn_P : std_logic_vector(width*2 downto 0) := (others => '0');


begin

process (Operand1, Operand2)

begin

A(width*2 downto width+1) <= Operand1;
S(width*2 downto width+1) <= (not (Operand1) + 1);

end process;


process (clk, EnableB)

variable P : std_logic_vector(width*2 downto 0) := (others => '0');
variable temp : std_logic_vector(width*2 downto 0) := (others => '0');

begin

if(clk'event and clk = '1') then
	if enableB = '1' then
		case P(1 downto 0) is
			when "01" =>
				temp := (P+A);
			when "10" =>
				temp := (P+S);
			when "11" | "00" =>
				temp := P;
			when others =>
				null;
		end case;
		P := temp(width*2) & temp(width*2 downto 1);
	else
		P(width downto 1) := Operand2;
		P(width*2 downto width+1) := (others => '0');
		P(0) := '0';
		temp := (others => '0');
	end if;
	
sgn_P <= P;		
UpperB <= P(width*2 downto width+1);
LowerB <= P(width downto 1);
	end if;
		
end process;

end BOOTH_MULT_ARCH;
