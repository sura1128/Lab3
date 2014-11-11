--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:30:41 11/12/2014
-- Design Name:   
-- Module Name:   C:/Users/SIPL/Desktop/Lab3/alu_new_test.vhd
-- Project Name:  Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY alu_new_test IS
END alu_new_test;
 
ARCHITECTURE behavior OF alu_new_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Clk : IN  std_logic;
         Operand1 : IN  std_logic_vector(31 downto 0);
         Operand2 : IN  std_logic_vector(31 downto 0);
         Result1 : OUT  std_logic_vector(31 downto 0);
         Result2 : OUT  std_logic_vector(31 downto 0);
         Status : OUT  std_logic_vector(2 downto 0);
         ALU_Control : IN  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Operand2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Control : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Result1 : std_logic_vector(31 downto 0);
   signal Result2 : std_logic_vector(31 downto 0);
   signal Status : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Clk => Clk,
          Operand1 => Operand1,
          Operand2 => Operand2,
          Result1 => Result1,
          Result2 => Result2,
          Status => Status,
          ALU_Control => ALU_Control
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
		
		Operand1 <= x"00000007";
      Operand2 <= x"00000001";
		ALU_Control <= "000100"; --sra	 

      wait;
   end process;

END;
