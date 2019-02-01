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
--USE ieee.numeric_std.ALL;
 
ENTITY exp_tb IS
END exp_tb;
 
ARCHITECTURE behavior OF exp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mul
    PORT(
         iA : IN  std_logic_vector(7 downto 0);
         iB : IN  std_logic_vector(7 downto 0);
         oZ : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iA : std_logic_vector(7 downto 0) := (others => '0');
   signal iB : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal oZ : std_logic_vector(7 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mul PORT MAP (
          iA => iA,
          iB => iB,
          oZ => oZ
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
      iA <= "00000111";
      iB <= "11100000";		
      wait;
   end process;

END;
