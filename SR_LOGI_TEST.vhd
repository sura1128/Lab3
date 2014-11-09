--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:11:38 10/01/2014
-- Design Name:   
-- Module Name:   C:/CG3207/Lab2/SR_LOGI_TEST.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SR_LOGI
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SR_LOGI_TEST IS
END SR_LOGI_TEST;
 
ARCHITECTURE behavior OF SR_LOGI_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SR_LOGI
    PORT(
         Operand1 : IN  std_logic_vector(31 downto 0);
         Operand2 : IN  std_logic_vector(31 downto 0);
         Control_SRL : IN  std_logic;
         Output_SRL : OUT  std_logic_vector(31 downto 0);
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Operand2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Control_SRL : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Output_SRL : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SR_LOGI PORT MAP (
          Operand1 => Operand1,
          Operand2 => Operand2,
          Control_SRL => Control_SRL,
          Output_SRL => Output_SRL,
          Clk => Clk
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
      wait for 100 ns;	
		
		Operand1 <= "00000000000000000000000000000111";
		Operand2 <= "00000000000000000000000000000011";
		Control_SRL <= '1';	

      --wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
