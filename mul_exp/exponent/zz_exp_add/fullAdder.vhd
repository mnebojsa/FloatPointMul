----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:09:23 11/28/2018 
-- Design Name: 
-- Module Name:    fullAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fullAdder is
    port( iA   : in  std_logic;
	       iB   : in  std_logic;
			 iC   : in  std_logic;
			 oFnc : out std_logic;
			 oC   : out std_logic );
end fullAdder;

architecture dataFlow of fullAdder is

begin

    oFnc <= iA xor iB xor iC;
	 oC   <=(iA and iB) or (iA  and iC) or (iB and iC);
	 
end dataFlow;

