--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:19:13 10/28/2014
-- Design Name:   
-- Module Name:   C:/CG3207/Lab3/ALU_TEST.vhd
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
 
ENTITY ALU_TEST IS
END ALU_TEST;
 
ARCHITECTURE behavior OF ALU_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         ALU_InA : IN  std_logic_vector(31 downto 0);
         ALU_InB : IN  std_logic_vector(31 downto 0);
         ALU_Out : OUT  std_logic_vector(31 downto 0);
         ALU_Control : IN  std_logic_vector(7 downto 0);
         ALU_zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ALU_InA : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_InB : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Control : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal ALU_Out : std_logic_vector(31 downto 0);
   signal ALU_zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          ALU_InA => ALU_InA,
          ALU_InB => ALU_InB,
          ALU_Out => ALU_Out,
          ALU_Control => ALU_Control,
          ALU_zero => ALU_zero
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		wait for 100 ns;	
	
		ALU_InA <= x"00000001";
      ALU_InB <= x"00000000";
		ALU_Control <= "00000000"; --lw, sw
		
		wait for 100 ns;	
	
		ALU_InA <= x"00000001";
      ALU_InB <= x"00000000";
		ALU_Control <= "01000000"; --beq
		
      wait for 100 ns;	
	
		ALU_InA <= x"00000001";
      ALU_InB <= x"00000000";
		ALU_Control <= "10100000"; --add
		
		wait for 100 ns;
		
		ALU_InA <= x"00000001";
      ALU_InB <= x"00000000";
		ALU_Control <= "10100010"; --sub
		
		wait for 100 ns;
		
		ALU_InA <= x"00000001";
      ALU_InB <= x"00000000";
		ALU_Control <= "10100100"; --and
		
		wait for 100 ns;
		
		ALU_InA <= x"00000001";
      ALU_InB <= x"00000000";
		ALU_Control <= "10100101"; --or
	
		wait for 100 ns;
		
		ALU_InA <= x"00000001";
      ALU_InB <= x"00000000";
		ALU_Control <= "10100111"; --nor
		
		wait for 100 ns;
		
		ALU_InA <= x"00000001";
      ALU_InB <= x"00000000";
		ALU_Control <= "10101010"; --slt
		
		wait for 100 ns;
		
		ALU_InA <= x"00000001";
      ALU_InB <= x"00000000";
		ALU_Control <= "11001101"; --ori	
		

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
