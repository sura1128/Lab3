----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:05:45 10/01/2014 
-- Design Name: 
-- Module Name:    SR_LOGI - SR_LOGI 
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

entity SL_LOGI is
generic (width : integer := 32);
    Port ( Operand1 : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Operand2 : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Control_SLL : in  STD_LOGIC;
           Output_SLL : out  STD_LOGIC_VECTOR (width-1 downto 0);
			  Clk : in  STD_LOGIC);
end SL_LOGI;

architecture SL_LOGI of SL_LOGI is
signal flag : std_logic := '0';


begin

process(clk)
variable Y : STD_LOGIC_VECTOR(4 downto 0) := (others=>'0');
variable X : STD_LOGIC_VECTOR(width-1 downto 0) := (others => '0');

begin
if (clk'event and clk='1') then

	if flag = '0' then
		Y := operand2 (4 downto 0);
		X := operand1;
	end if; 

	if (control_SLL = '1') then
		
		if Y(0) = '1' then
			X := X(30 downto 0) & "0";
			Y(0) := '0';
		end if;

		if Y(1) = '1' then
			X := X(29 downto 0) & "00";
			Y(1) := '0';
		end if;
			
		if Y(2) = '1' then
			X := X(27 downto 0) & "0000";
			Y(2) := '0';
		end if;

		if Y(3) = '1' then
			X := X(23 downto 0) & "00000000";
			Y(3) := '0';
		end if;

		if Y(4) = '1' then
			X := X(15 downto 0) & "0000000000000000";
			Y(4) := '0';
		end if;		
		flag <= '1';
	else
		flag <= '0';
	end if;	
output_SLL <= X;
end if;
end process;

end SL_LOGI;

