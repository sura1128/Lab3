--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:33:24 09/28/2014
-- Design Name:   
-- Module Name:   C:/CG3207/Lab2/BOOTH_MULT_TEST.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BOOTH_MULT
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BOOTH_MULT_TEST IS
END BOOTH_MULT_TEST;
 
ARCHITECTURE behavior OF BOOTH_MULT_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BOOTH_MULT
    PORT(
         EnableB : IN  std_logic;
         LowerB : OUT  std_logic_vector(31 downto 0);
         UpperB : OUT  std_logic_vector(31 downto 0);
         Clk : IN  std_logic;
         Operand1 : IN  std_logic_vector(31 downto 0);
         Operand2 : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EnableB : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Operand2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal LowerB : std_logic_vector(31 downto 0);
   signal UpperB : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BOOTH_MULT PORT MAP (
          EnableB => EnableB,
          LowerB => LowerB,
          UpperB => UpperB,
          Clk => Clk,
          Operand1 => Operand1,
          Operand2 => Operand2
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--		wait for 100 ns;	
--		EnableB <= '0';
--		Operand2 <= "00000000000000000000000000000101";
--      Operand1 <= "00000000000000000000000000000111";
--		
		
		wait for 100 ns;
		Operand1 <= x"00000006";
		Operand2 <= x"00000006";
		
      wait for 100 ns;		
		EnableB <= '1';
		
		wait for 3500 ns;	
		EnableB <= '0';
		
--      wait for 00 ns;	
--		Operand1 <= x"FFFFFFFF";
--		Operand2 <= x"0FFFFFFF";
--		
--		Operand2 <= not("00000000000000000000000000001001") + 1;
--      Operand1 <= "00000000000000000000000000000101";
--		
		wait for 100 ns;
		EnableB <= '1';
		
		wait for 3500 ns;	
		EnableB <= '0';
		
			
      --wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
