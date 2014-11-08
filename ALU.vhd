----------------------------------------------------------------------------------
-- Company: NUS
-- Engineer: Rajesh Panicker
-- 
-- Create Date:   21:06:18 14/10/2014
-- Design Name: 	ALU
-- Target Devices: Nexys 4 (Artix 7 100T)
-- Tool versions: ISE 14.7
-- Description: Simple ALU for the basic MIPS processor
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: The interface (entity) as well as implementation (architecture) can be modified
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ALU is
    Port (
			Clk			: in	STD_LOGIC;
			Operand1 		: in  STD_LOGIC_VECTOR (31 downto 0);				
			Operand2 		: in  STD_LOGIC_VECTOR (31 downto 0);
			Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
			Result2		: out	STD_LOGIC_VECTOR (31 downto 0);
			Status		: out	STD_LOGIC_VECTOR (2 downto 0);
			ALU_Control	: in  STD_LOGIC_VECTOR (5 downto 0));
end ALU;


architecture arch_ALU of ALU is


type states is (COMBINATIONAL, MULTI_CYCLE);
signal state, n_state 	: states := COMBINATIONAL;


----------------------------------------------------------------------------
-- Adder instantiation
----------------------------------------------------------------------------
component adder is
port (A 		: in 	std_logic_vector(32-1 downto 0);
		B 		: in 	std_logic_vector(32-1 downto 0);
		C_in 	: in 	std_logic;
		S 		: out std_logic_vector(32-1 downto 0);
		C_out	: out std_logic);
end component adder;

----------------------------------------------------------------------------
-- Adder signals
----------------------------------------------------------------------------
signal B 		: std_logic_vector(32-1 downto 0) := (others => '0'); 
signal C_in 	: std_logic := '0';
signal S 		: std_logic_vector(32-1 downto 0) := (others => '0'); 
signal C_out	: std_logic := '0'; --not used

----------------------------------------------------------------------------
-- BOOTH_MULT instantiation
----------------------------------------------------------------------------
component BOOTH_MULT is
Port ( EnableB : in STD_LOGIC := '0';
		 LowerB : out  STD_LOGIC_VECTOR (32-1 downto 0);
       UpperB : out  STD_LOGIC_VECTOR (32-1 downto 0);
       Operand1 : in  STD_LOGIC_VECTOR (32-1 downto 0);
       Operand2 : in  STD_LOGIC_VECTOR (32-1 downto 0);
       Clk : in STD_LOGIC);
end component BOOTH_MULT;

----------------------------------------------------------------------------
-- BOOTH_MULT signals
----------------------------------------------------------------------------

signal EnableB : STD_LOGIC := '0';
signal LowerB : STD_LOGIC_VECTOR (32-1 downto 0);
signal UpperB : STD_LOGIC_VECTOR (32-1 downto 0);



----------------------------------------------------------------------------
-- MULTU instantiation
----------------------------------------------------------------------------
component MULTU is
Port ( EnableU : in STD_LOGIC := '0';
		 LowerU : out  STD_LOGIC_VECTOR (32-1 downto 0);
       UpperU : out  STD_LOGIC_VECTOR (32-1 downto 0);
       Operand1 : in  STD_LOGIC_VECTOR (32-1 downto 0);
       Operand2 : in  STD_LOGIC_VECTOR (32-1 downto 0);
       Clk : in STD_LOGIC);
end component MULTU;

----------------------------------------------------------------------------
-- MULTU signals
----------------------------------------------------------------------------

signal EnableU : STD_LOGIC;
signal LowerU : STD_LOGIC_VECTOR (32-1 downto 0);
signal UpperU : STD_LOGIC_VECTOR (32-1 downto 0);

----------------------------------------------------------------------------
-- DIVU instantiation
----------------------------------------------------------------------------
component DIVU is
Port ( EnableDU : in  STD_LOGIC;
		  Clk : in  STD_LOGIC;
		  Operand1 : in  STD_LOGIC_VECTOR (32-1 downto 0);
		  Operand2 : in  STD_LOGIC_VECTOR (32-1 downto 0);
		  QuotientDU : out  STD_LOGIC_VECTOR (32-1 downto 0);
		  RemainderDU : out  STD_LOGIC_VECTOR (32-1 downto 0));
end component DIVU;

----------------------------------------------------------------------------
-- DIVU signals
----------------------------------------------------------------------------

signal EnableDU : STD_LOGIC;
signal QuotientDU		: STD_LOGIC_VECTOR (32-1 downto 0) := (others => '0'); 
signal RemainderDU		: STD_LOGIC_VECTOR (32-1 downto 0) := (others => '0');

----------------------------------------------------------------------------
-- DIV instantiation
----------------------------------------------------------------------------
component DIV is
Port ( EnableD : in  STD_LOGIC;
		  Clk : in  STD_LOGIC;
		  Operand1 : in  STD_LOGIC_VECTOR (32-1 downto 0);
		  Operand2 : in  STD_LOGIC_VECTOR (32-1 downto 0);
		  QuotientD : out  STD_LOGIC_VECTOR (32-1 downto 0);
		  RemainderD : out  STD_LOGIC_VECTOR (32-1 downto 0));
end component DIV;

----------------------------------------------------------------------------
-- DIV signals
----------------------------------------------------------------------------

signal EnableD : STD_LOGIC;
signal QuotientD : STD_LOGIC_VECTOR (32-1 downto 0) := (others => '0'); 
signal RemainderD	: STD_LOGIC_VECTOR (32-1 downto 0) := (others => '0');

----------------------------------------------------------------------------
-- SL_LOGI instantiation
----------------------------------------------------------------------------
component SL_LOGI is
    Port ( Operand1 : in  STD_LOGIC_VECTOR (32-1 downto 0);
           Operand2 : in  STD_LOGIC_VECTOR (32-1 downto 0);
           Control_SLL : in  STD_LOGIC;
           Output_SLL : out  STD_LOGIC_VECTOR (32-1 downto 0);
			  Clk : in  STD_LOGIC);
end component SL_LOGI;

----------------------------------------------------------------------------
-- SL_LOGI signals
----------------------------------------------------------------------------

signal Control_SLL : STD_LOGIC := '0';
signal Output_SLL		: STD_LOGIC_VECTOR (32-1 downto 0) := (others => '0');


----------------------------------------------------------------------------
-- SR_ARITH instantiation
----------------------------------------------------------------------------
component SR_ARITH is
    Port ( Operand1 : in  STD_LOGIC_VECTOR (32-1 downto 0);
           Operand2 : in  STD_LOGIC_VECTOR (32-1 downto 0);
           Control_SRA : in  STD_LOGIC;
           Output_SRA : out  STD_LOGIC_VECTOR (32-1 downto 0);
			  Clk : in  STD_LOGIC);
end component SR_ARITH;

----------------------------------------------------------------------------
-- SR_ARITH signals
----------------------------------------------------------------------------

signal Control_SRA : STD_LOGIC:= '0';
signal Output_SRA		: STD_LOGIC_VECTOR (32-1 downto 0) := (others => '0');

----------------------------------------------------------------------------
-- SR_LOGI instantiation
----------------------------------------------------------------------------
component SR_LOGI is
    Port ( Operand1 : in  STD_LOGIC_VECTOR (32-1 downto 0);
           Operand2 : in  STD_LOGIC_VECTOR (32-1 downto 0);
           Control_SRL : in  STD_LOGIC;
           Output_SRL : out  STD_LOGIC_VECTOR (32-1 downto 0);
			  Clk : in  STD_LOGIC);
end component SR_LOGI;

----------------------------------------------------------------------------
-- SR_LOGI signals
----------------------------------------------------------------------------

signal Control_SRL : STD_LOGIC := '0';
signal Output_SRL		: STD_LOGIC_VECTOR (32-1 downto 0) := (others => '0');

----------------------------------------------------------------------------
-- Signals for MULTI_CYCLE_PROCESS
----------------------------------------------------------------------------
signal Result1_multi		: STD_LOGIC_VECTOR (32-1 downto 0) := (others => '0'); 
signal Result2_multi		: STD_LOGIC_VECTOR (32-1 downto 0) := (others => '0');
signal done		 			: STD_LOGIC := '0';

begin

-- <port maps>

adder32 : adder port map (  
						A=>Operand1, 
						B=>B, 
						C_in=>C_in, 
						S=>S, 
						C_out=>C_out );


multb32 : BOOTH_MULT  port map ( 
						EnableB=> EnableB,
						LowerB=>LowerB, 
						UpperB=>UpperB, 
						Operand1=>Operand1,
						Operand2=>Operand2, 
						Clk=>Clk);
																
multu32 : MULTU  port map ( 
						EnableU=> EnableU, 
						LowerU=>LowerU, 
						UpperU=>UpperU, 
						Operand1=>Operand1, 
						Operand2=>Operand2, 
						Clk=>Clk);
						
divu32 : DIVU  port map ( 
						EnableDU=> EnableDU, 
						Clk=>Clk, 
						Operand1=>Operand1,
						Operand2=>Operand2, 
						QuotientDU=>QuotientDU, 
						RemainderDU=>RemainderDU);
						
div32 : DIV  port map ( 
						EnableD=> EnableD, 
						Clk=>Clk, 
						Operand1=>Operand1,
						Operand2=>Operand2, 
						QuotientD=>QuotientD, 
						RemainderD=>RemainderD);
						
sll32 : SL_LOGI port map (
						Operand1=>Operand1,
						Operand2=>Operand2, 
						Control_SLL=>Control_SLL, 
						Output_SLL=>Output_SLL, 
						clk=>clk);
						
sra32 : SR_ARITH  port map (
						Operand1=>Operand1,
						Operand2=>Operand2, 
						Control_SRA=>Control_SRA, 
						Output_SRA=>Output_SRA, 
						clk=>clk);
						
srl32 : SR_LOGI  port map (
						Operand1=>Operand1,
						Operand2=>Operand2, 
						Control_SRL=>Control_SRL, 
						Output_SRL=>Output_SRL, 
						clk=>clk);


----------------------------------------------------------------------------
-- COMBINATIONAL PROCESS
----------------------------------------------------------------------------
COMBINATIONAL_PROCESS : process (
											ALU_Control, Operand1, Operand2, state, -- external inputs
											S, c_out, -- ouput from the adder (or other components)
											Result1_multi, Result2_multi, done -- from multi-cycle process(es)
											)
begin

-- <default outputs>
Status(2 downto 0) <= "000"; -- both statuses '0' by default 
Result1 <= (others=>'0');
Result2 <= (others=>'0');

n_state <= state;

B <= Operand2;
C_in <= '0';
-- </default outputs>

--reset
if ALU_Control(5) = '1' then
	n_state <= COMBINATIONAL;
else

case state is
	when COMBINATIONAL =>	
		case ALU_Control(4 downto 0) is
		--and
		when "10010" => 
			Result1 <= Operand1 and Operand2;
		--or
		when "10100" =>
			Result1 <= Operand1 or Operand2;
		--nor
		when "10011" => 
			Result1 <= Operand1 nor Operand2;
		when "11000" =>
			Result1 <= Operand1 xor Operand2;
		--add
		when "10000" =>
			Result1 <= S;
			-- overflow
			Status(1) <= ( Operand1(32-1) xnor  Operand2(32-1) )  and ( Operand2(32-1) xor S(32-1) );
		--sub
		when "10001" =>
			B <= not(Operand2);
			C_in <= '1';
			Result1 <= S;
			
			-- overflow
			Status(1) <= not(c_out xor (((Operand1(32-1) xor Operand2(32-1)) and (not s(32-1))) or ((Operand1(32-1) xnor Operand2(32-1)) and s(32-1))));
	
			--zero
			if S = x"00000000" then 
				Status(0) <= '1'; 
			else
				Status(0) <= '0';
			end if;

		--slt
		when "10101" =>
			B <= not(Operand2);
			C_in <= '1';
			if S(31) = '1' then 
			result1 <= x"00000001";
			else 
			result1 <= x"00000000";
			end if;
			
		--sltu
		when 	"10110" =>
			B <= not(Operand2);
			C_in <= '1';
			if C_out = '1' then 
			result1 <= x"00000000";
			else 
			result1 <= x"00000001";
			end if;
			
		-- multi-cycle operations
		when    "00000" -- mult
				| "00001" --multu
				| "00010" --sll
				| "00011" --srl
				| "00100" --sra
				| "00101" --sllv
				| "00110" --div
				| "00111" => --divu
			n_state <= MULTI_CYCLE;
			Status(2) <= '1';
		-- default cases (already covered)
		when others=> null;
		end case;
	when MULTI_CYCLE => 
		if done = '1' then
			Result1 <= Result1_multi;
			Result2 <= Result2_multi;
			n_state <= COMBINATIONAL;
			Status(2) <= '0';
		else
			Status(2) <= '1';
			n_state <= MULTI_CYCLE;
		end if;
	end case;
end if;	
end process;


----------------------------------------------------------------------------
-- STATE UPDATE PROCESS
----------------------------------------------------------------------------

STATE_UPDATE_PROCESS : process (Clk) -- state updating
begin  
   if (Clk'event and Clk = '1') then
		state <= n_state;
   end if;
end process;

----------------------------------------------------------------------------
-- MULTI CYCLE PROCESS
----------------------------------------------------------------------------


MULTI_CYCLE_PROCESS : process (Clk) -- multi-cycle operations done here
-- assume that Operand1 and Operand 2 do not change while multi-cycle operations are being performed
variable count : std_logic_vector(7 downto 0) := (others => '0');
variable temp_sum : std_logic_vector(32-1 downto 0) := (others => '0');
begin  
   if (Clk'event and Clk = '1') then 
	done <= '0';
		if n_state = MULTI_CYCLE then
			case ALU_Control(4 downto 0) is
			when "00000" =>  -- MULT(BOOTH)
				if state = COMBINATIONAL then  -- n_state = MULTI_CYCLE and state = COMBINATIONAL implies we are just transitioning into MULTI_CYCLE
					count := (others => '0');
					EnableB <= '1'; 
				end if;												
				
				if count=x"21" then
					EnableB <= '0';
					Result1_multi <= LowerB;
					Result2_multi <= UpperB;
					done <= '1';	
				end if;				
				count := count+1;
			-- -------------------------------------------------------------- ---	
				
			when "00001" => -- MULTU
				if state = COMBINATIONAL then  -- n_state = MULTI_CYCLE and state = COMBINATIONAL implies we are just transitioning into MULTI_CYCLE
					count := (others => '0');
					EnableU <= '1';
				end if;							
				
				if count=x"21" then
					EnableU <= '0';
					Result1_multi <= LowerU;
					Result2_multi <= UpperU;
					done <= '1';	
				end if;
				count := count+1;	
			
			when "00111" => -- DIVU
				if state = COMBINATIONAL then
					count := (others => '0');
					EnableDU <= '1'; 
				end if;												
				
				if count=x"22" then
					EnableDU <= '0';
					Result1_multi <= QuotientDU;
					Result2_multi <= RemainderDU;
					done <= '1';	
				end if;				
				count := count+1;
			
			when "00110" => -- DIV
				if state = COMBINATIONAL then
					count := (others => '0');
					EnableD <= '1'; 
				end if;												
				
				if count=x"21" then
					EnableD <= '0';
					Result1_multi <= QuotientD;
					Result2_multi <= RemainderD;
					done <= '1';	
				end if;				
				count := count+1;	
				
			when "00010" => -- SLL (SHIFT LEFT LOGICAL)
				if state = COMBINATIONAL then
					count := (others => '0');
					Control_SLL <= '1'; 
				end if;												
				
				if count="10" then
					Control_SLL <= '0';
					Result1_multi <= Output_SLL;
					done <= '1';	
				end if;				
				count := count+1;
				
				
			when "00100" => -- SRA (SHIFT RIGHT ARITHMETIC)
				if state = COMBINATIONAL then
					count := (others => '0');
					Control_SRA <= '1'; 
				end if;	
				
				
				if count="10" then
					Control_SRA <= '0';
					Result1_multi <= Output_SRA;
					done <= '1';	
				end if;				
				count := count+1;	
				
				
			when "00011" => -- SRL (SHIFT RIGHT LOGICAL)
				if state = COMBINATIONAL then
					count := (others => '0');
					Control_SRL <= '1'; 
				end if;												
				
				if count="10" then
					Control_SRL <= '0';
					Result1_multi <= Output_SRL;
					done <= '1';	
				end if;				
				count := count+1;	
			
				
			when others=> null;
				
			end case;
		
		end if;
	end if;
end process;

end arch_ALU;

------------------------------------------------------------------
-- Adder Entity
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder is
port (A 		: in std_logic_vector(32-1 downto 0);
		B 		: in std_logic_vector(32-1 downto 0);
		C_in 	: in std_logic;
		S 		: out std_logic_vector(32-1 downto 0);
		C_out	: out std_logic);
end adder;

------------------------------------------------------------------
-- Adder Architecture
------------------------------------------------------------------

architecture adder_arch of adder is
signal S_wider : std_logic_vector(32 downto 0);
begin
	S_wider <= ('0'& A) + ('0'& B) + C_in;
	S <= S_wider(32-1 downto 0);
	C_out <= S_wider(32);
end adder_arch;