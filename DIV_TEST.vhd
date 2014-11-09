--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:07:05 10/01/2014
-- Design Name:   
-- Module Name:   F:/Documents/School/NUS/Sem 5/CG3207 Cg3207 Resources/Assignments/Lab2/DIV_TEST.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DIV
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DIV_TEST IS
END DIV_TEST;
 
ARCHITECTURE behavior OF DIV_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DIV
    PORT(
         EnableD : IN  std_logic;
         Clk : IN  std_logic;
         Operand1 : IN  std_logic_vector(31 downto 0);
         Operand2 : IN  std_logic_vector(31 downto 0);
         QuotientD : OUT  std_logic_vector(31 downto 0);
         RemainderD : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EnableD : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Operand2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal QuotientD : std_logic_vector(31 downto 0);
   signal RemainderD : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DIV PORT MAP (
          EnableD => EnableD,
          Clk => Clk,
          Operand1 => Operand1,
          Operand2 => Operand2,
          QuotientD => QuotientD,
          RemainderD => RemainderD
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
      -- hold reset state for 100 nsS
      wait for 100 ns;
 -- insert stimulus here		
		Operand1 <= x"000000ff";
		Operand2 <= x"ffffffff";
		
		wait for	100 ns ;
		EnableD <= '1';
		
		wait for 3500 ns;
		enableD <= '0';
		
		Operand1 <= x"ffffffff";
		Operand2 <= x"000000ff";
		
		wait for	100 ns ;
		EnableD <= '1';
		
		wait for 3500 ns;
		enableD <= '0';
		
		Operand1 <= x"000000ff";
		Operand2 <= x"000000ff";
		
		wait for	100 ns ;
		EnableD <= '1';
				
		wait for 3500 ns;
		enableD <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
