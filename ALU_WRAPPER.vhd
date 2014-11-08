----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:03 11/08/2014 
-- Design Name: 
-- Module Name:    ALU_WRAPPER - ALU_WRAPPER_ARCHI 
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

entity ALU_WRAPPER is
    Port ( RST : in  STD_LOGIC;
			  Clk			: in	STD_LOGIC;
			  ALU_InA 		: in  STD_LOGIC_VECTOR (31 downto 0);				
			  ALU_InB 		: in  STD_LOGIC_VECTOR (31 downto 0);
           Control_In : in  STD_LOGIC_VECTOR (7 downto 0);
			  Result1		: out STD_LOGIC_VECTOR (31 downto 0);
			  Result2		: out STD_LOGIC_VECTOR (31 downto 0);
			  Status		: out	STD_LOGIC_VECTOR (2 downto 0);
			  ALU_zero		: out STD_LOGIC;
			  ALU_greater	: out STD_LOGIC);
end ALU_WRAPPER;

architecture ALU_WRAPPER_ARCHI of ALU_WRAPPER is



----------------------------------------------------------------
-- ALU
----------------------------------------------------------------
component ALU is
    Port (
			Clk			: in	STD_LOGIC;
			Operand1 		: in  STD_LOGIC_VECTOR (31 downto 0);				
			Operand2 		: in  STD_LOGIC_VECTOR (31 downto 0);
			Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
			Result2		: out	STD_LOGIC_VECTOR (31 downto 0);
			Status		: out	STD_LOGIC_VECTOR (2 downto 0);
			ALU_Control	: in  STD_LOGIC_VECTOR (5 downto 0);
			ALU_zero		: out STD_LOGIC;
			ALU_greater	: out STD_LOGIC);
end component;


----------------------------------------------------------------
-- ALU Signals
----------------------------------------------------------------
	signal	ALU_Control	:  STD_LOGIC_VECTOR (5 downto 0);		

begin

----------------------------------------------------------------
-- ALU port map
----------------------------------------------------------------
ALU1 				: ALU port map
						(
						Clk			=> Clk,
						Operand1 	=> ALU_InA, 
						Operand2 	=> ALU_InB, 
						Result1     => Result1,
						Result2     => Result2,
						Status      => Status,
						ALU_zero  	=> ALU_zero,
						ALU_Control => ALU_Control,
						ALU_greater => ALU_greater
						);
					

process(RST, control_in)
begin

ALU_Control(5) <= RST;

case control_in(7 downto 6) is
	when "00" =>
		ALU_Control(4 downto 0) <= "10000"; --lw,sw,addi do add
	
	when "01" =>
		ALU_Control(4 downto 0) <= "10001"; --beq,bgez,bgezal  do sub
	
	when "10" =>
		if(control_in(5 downto 0) = "100000") then --add
			ALU_Control(4 downto 0) <= "10000"; -- do add 
			
		elsif (control_in(5 downto 0) = "100010") then --sub
			ALU_Control(4 downto 0) <= "10001";  --do sub
			
		elsif (control_in(5 downto 0) = "100100") then 
			ALU_Control(4 downto 0) <= "10010";  --and
			
		elsif (control_in(5 downto 0) = "100111") then 
			ALU_Control(4 downto 0) <= "10011";  --nor
			
		elsif (control_in(5 downto 0) = "100101") then 
			ALU_Control(4 downto 0) <= "10100";  --or
		
		elsif (control_in(5 downto 0) = "101010") then 
			ALU_Control(4 downto 0) <= "10101";  --slt
		
		elsif (control_in(5 downto 0) = "101011") then 
			ALU_Control(4 downto 0) <= "10110";  --sltu
			
			--extra--
		elsif (control_in(5 downto 0) = "100110") then 
			ALU_Control(4 downto 0) <= "11000";  --xor	
			
			------------multi cycle -----------------
			
		elsif (control_in(5 downto 0) = "011000") then 
			ALU_Control(4 downto 0) <= "00000";  --mult	

		elsif (control_in(5 downto 0) = "011001") then 
			ALU_Control(4 downto 0) <= "00001";  --multu		
		
		elsif (control_in(5 downto 0) = "000000") then 
			ALU_Control(4 downto 0) <= "00010";  --sll

		elsif (control_in(5 downto 0) = "000010") then 
			ALU_Control(4 downto 0) <= "00011";  --srl

		elsif (control_in(5 downto 0) = "000011") then 
			ALU_Control(4 downto 0) <= "00100";  --sra	

		elsif (control_in(5 downto 0) = "000100") then 
			ALU_Control(4 downto 0) <= "00101";  --sllv
			
			------extra-----
		elsif (control_in(5 downto 0) = "011010") then 
			ALU_Control(4 downto 0) <= "00110";  --div
			
		elsif (control_in(5 downto 0) = "011011") then 
			ALU_Control(4 downto 0) <= "00111";  --divu	
		
		else
			ALU_Control(4 downto 0) <= "11111"; --lol
			
		end if;			
	
	when "11" =>
		ALU_Control(4 downto 0) <= "10111";  --ori
	when others =>
		null;
	
end case;	


end process;

end ALU_WRAPPER_ARCHI;

