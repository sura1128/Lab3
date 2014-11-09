--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:53:12 10/01/2014
-- Design Name:   
-- Module Name:   C:/CG3207/Lab2/MULTU_TEST.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MULTU
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
 
ENTITY MULTU_TEST IS
END MULTU_TEST;
 
ARCHITECTURE behavior OF MULTU_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MULTU
    PORT(
         EnableU : IN  std_logic;
         LowerU : OUT  std_logic_vector(31 downto 0);
         UpperU : OUT  std_logic_vector(31 downto 0);
         Operand1 : IN  std_logic_vector(31 downto 0);
         Operand2 : IN  std_logic_vector(31 downto 0);
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal EnableU : std_logic := '0';
   signal Operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Operand2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal LowerU : std_logic_vector(31 downto 0);
   signal UpperU : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MULTU PORT MAP (
          EnableU => EnableU,
          LowerU => LowerU,
          UpperU => UpperU,
          Operand1 => Operand1,
          Operand2 => Operand2,
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

      --Operand1 <= not(x"00000009") + 1;
		Operand1 <= x"00000009";
		Operand2 <= x"00000007";
		
		wait for	100 ns ;
		EnableU <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
