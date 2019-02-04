--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:18:45 02/01/2019
-- Design Name:   
-- Module Name:   D:/MULTIPLAYER_PRACTICE/exponent/zzz/exp_tb.vhd
-- Project Name:  zzz
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mul
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
USE ieee.numeric_std.ALL;
 
ENTITY exp_tb IS
END exp_tb;
 
ARCHITECTURE behavior OF exp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mul
    PORT(
<<<<<<< Updated upstream
         iA : IN  std_logic_vector(15 downto 0);
         iB : IN  std_logic_vector(15 downto 0);
         oZ : OUT  std_logic_vector(15 downto 0)
=======
         iA : IN  std_logic_vector(7 downto 0);
         iB : IN  std_logic_vector(7 downto 0);
			oRange : out std_logic;
         oZ : OUT  std_logic_vector(7 downto 0)
>>>>>>> Stashed changes
        );
    END COMPONENT;
    

   --Inputs
   signal iA : std_logic_vector(15 downto 0) := (others => '0');
   signal iB : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
<<<<<<< Updated upstream
   signal oZ : std_logic_vector(15 downto 0);
=======
   signal oZ : std_logic_vector(7 downto 0);
   signal oRange : std_logic;
	-- Helper signals
   signal oZ_check : unsigned(9 downto 0) := (others => '0');
>>>>>>> Stashed changes
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mul PORT MAP (
          iA => iA,
          iB => iB,
			 oRange => oRange,
          oZ => oZ
        );


   -- Stimulus process
   stim_proc: process
	    variable iA_check : unsigned(9 downto 0) := (others => '0');
	    variable iB_check : unsigned(9 downto 0) := (others => '0');
       variable voZ_check: unsigned(9 downto 0) := (others => '0');			 
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
<<<<<<< Updated upstream
          iA <= "1000001110101000";
          iB <= "1110000010101110";

      wait for 100 ns;	
          iA <= "0000000000000000";
          iB <= "1110000010101110";

      wait for 100 ns;	
          iA <= "1000001110101000";
          iB <= "0000000000000000";

      wait for 100 ns;	
          iA <= "1000001110101000";
          iB <= "0111111110000000";

      wait for 100 ns;	
          iA <= "0111111110000000";
          iB <= "1111111110000000";
			 
      wait for 100 ns;	
          iA <= "1111111110000000";
          iB <= "1111111110000000";	

=======
	
      for ii in 1 to 255 loop
		    for jj in ii to 255 loop
			   -- refresh input signals
			     iA <= std_logic_vector(to_unsigned(ii,8));
				  iB <= std_logic_vector(to_unsigned(jj,8));
				  
				-- refresh check signals
              iA_check := to_unsigned(ii,10);
				  iB_check := to_unsigned(jj,10);
				  voZ_check := iA_check + iB_check - to_unsigned(127,10);
				  oZ_check <= voZ_check;

           -- assert if denormalized input
              assert iA(7 downto 0) /= "00000000"
				  report " denormalized input"
              severity WARNING;

           -- assert if denormalized input
              assert iB(7 downto 0) /= "00000000"
				  report " denormalized input"
              severity WARNING;
				  
           -- FAILURE if check value and output value are different				  
              assert std_logic_vector(voZ_check(7 downto 0)) /= oZ
              report "--------------- different calculus value ------------------iA = " & integer'image(to_integer(unsigned(iA))) & "  iB = " & integer'image(to_integer(unsigned(iB)))
              severity ERROR;

           -- assert if result is -infinity
              assert oZ_check(9 downto 8) /= "11"
				  report " - infinity. iA = " & integer'image(to_integer(unsigned(iA))) & "  iB = " & integer'image(to_integer(unsigned(iB)))
              severity WARNING;

           -- assert if result is +infinity				  
              assert oZ_check(9 downto 0) /= "0011111111"
				  report " (0011111111) + infinity. iA = " & integer'image(to_integer(unsigned(iA))) & "  iB = " & integer'image(to_integer(unsigned(iB)))
              severity WARNING;

           -- assert if result is +infinity				  
              assert oZ_check(9 downto 8) /= "01"
				  report " (01) + infinity. iA = " & integer'image(to_integer(unsigned(iA))) & "  iB = " & integer'image(to_integer(unsigned(iB)))
              severity WARNING;
				  
           -- assert if result is +infinity				  
              assert oZ_check(9 downto 8) /= "10"
				  report " (10) + infinity . iA = " & integer'image(to_integer(unsigned(iA))) & "  iB = " & integer'image(to_integer(unsigned(iB)))
              severity WARNING;				  
				  
              wait for 20 ns; 				
			 end loop;
			 wait for 20 ns;
		end loop;
    		 
>>>>>>> Stashed changes
      wait;
   end process;

END;
