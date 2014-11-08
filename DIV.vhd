----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:22:51 09/28/2014 
-- Design Name: 
-- Module Name:    DIV - DIV_ARCH 
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

entity DIV is
generic (width : integer := 32);
    Port ( EnableD : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Operand1 : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Operand2 : in  STD_LOGIC_VECTOR (width-1 downto 0);
           QuotientD : out  STD_LOGIC_VECTOR (width-1 downto 0);
           RemainderD : out  STD_LOGIC_VECTOR (width-1 downto 0));
end DIV;

architecture DIV_ARCH of DIV is

signal sign : std_logic := '0';
signal UOP1 :STD_LOGIC_VECTOR (width-1 downto 0);
signal UOP2 :STD_LOGIC_VECTOR (width-1 downto 0);
signal rem_divS :std_logic_vector(width*2 downto 0) := (others => '0'); --only using single 65 bit reg

begin

process(Operand1, Operand2, sign, rem_divS)
begin
	sign <= Operand1(width-1) xor Operand2(width-1);
	if Operand1(width-1) = '1' then
		UOP1 <= (not(Operand1)) + 1;
	else 
		UOP1 <= Operand1;
	end if;
	if Operand2(width-1) = '1' then
		UOP2 <= (not(Operand2)) + 1;
	else 
		UOP2 <= Operand2;
	end if;
	if sign = '1' then
		QuotientD <=  not(rem_divS(width-1 downto 0))+1;
		RemainderD <= not(rem_divS(width*2 downto width+1))+1;
		else
		QuotientD <=  rem_divS(width-1 downto 0);
		RemainderD <= rem_divS(width*2 downto width+1);
	end if;

end process;

process (clk, EnableD) -- takes 32 cycles

variable rem_div :std_logic_vector(width*2 downto 0) := (others => '0'); --only using single 65 bit reg

begin

if(clk'event and clk = '1') then
	if enableD = '1' then
			rem_div (width*2-1 downto width) := rem_div (width*2-1 downto width) - UOP2;
		if rem_div (width*2-1) = '1' then
			rem_div (width*2-1 downto width) := rem_div (width*2-1 downto width) + UOP2;
			rem_div := rem_div(width*2-1 downto 0) & '0'; --shift left and add 0
		else
			rem_div := rem_div(width*2-1 downto 0) & '1'; --shift left and add 1
		end if;
	else		
		rem_div(width downto 1) := UOP1;
		rem_div(width*2 downto width) := (others => '0');
	end if;
	rem_divS <= rem_div;
end if;

end process;

end DIV_ARCH;

