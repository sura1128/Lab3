--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:54:00 10/01/2014
-- Design Name:   
-- Module Name:   C:/CG3207/Lab2/DIVU_TEST.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DIVU
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
 
ENTITY DIVU_TEST IS
END DIVU_TEST;
 
ARCHITECTURE behavior OF DIVU_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DIVU
    PORT(
         EnableDU : IN  std_logic;
         Clk : IN  std_logic;
         Operand1 : IN  std_logic_vector(31 downto 0);
         Operand2 : IN  std_logic_vector(31 downto 0);
         QuotientDU : OUT  std_logic_vector(31 downto 0);
         RemainderDU : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EnableDU : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Operand2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal QuotientDU : std_logic_vector(31 downto 0);
   signal RemainderDU : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DIVU PORT MAP (
          EnableDU => EnableDU,
          Clk => Clk,
          Operand1 => Operand1,
          Operand2 => Operand2,
          QuotientDU => QuotientDU,
          RemainderDU => RemainderDU
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
		Operand1 <= x"000000ff";
		Operand2 <= x"ffffffff";
		
		wait for	100 ns ;
		
		EnableDU <= '1';
		
		wait for	3500 ns ;
		
		EnableDU <= '0';
		Operand1 <= x"ffffffff";
		Operand2 <= x"000000ff";
		
		wait for 100 ns;
		
		EnableDU <= '1';
		
		wait for	3500 ns ;
		
		EnableDU <= '0';
		Operand1 <= x"000000ff";
		Operand2 <= x"000000ff";
		
		wait for	100 ns ;
		EnableDU <= '1';
		

      wait;
   end process;

END;
