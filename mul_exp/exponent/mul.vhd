----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:27:38 02/01/2019
-- Design Name:
-- Module Name:    mul - Behavioral
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

entity mul is
    port( iA     : in  std_logic_vector(7 downto 0);
          iB     : in  std_logic_vector(7 downto 0);
          oInf_n : out std_logic;
          oInf_p : out std_logic;
          oZ     : out std_logic_vector(9 downto 0) );
end mul;

architecture Behavioral of mul is

    component nBitAdder
        generic ( BitNuma : integer := 10);
        port    ( iA     : in  std_logic_vector(BitNuma-1 downto 0);
                  iB     : in  std_logic_vector(BitNuma-1 downto 0);
                  iCarry : in  std_logic;
                  oRes   : out std_logic_vector(BitNuma-1 downto 0);
                  oCarry : out std_logic);
    end component;

    signal sAddE1E2  : std_logic_vector( 9 downto 0);
    signal sOwerflow : std_logic;
    signal sDummy    : std_logic;

    signal siA       : std_logic_vector( 9 downto 0);
    signal siB       : std_logic_vector( 9 downto 0);
    signal soZ       : std_logic_vector( 9 downto 0);
begin

-- multiply fractions
--   sign <= iA(15) xor iB(15);
--

   siA <= "00" & iA;
   siB <= "00" & iB;

--add exponents
Inst_nBitAdder0:
    nBitAdder
    port map( iA     => siA,
              iB     => siB,
              iCarry => '0',
              oRes   => sAddE1E2,
              oCarry => sOwerflow);

--"10000001" = 2nd complement(127)
-- iA + iB -127
Inst_nBitAdder1:
    nBitAdder
    port map( iA     => sAddE1E2,
              iB     => "1110000001",
              iCarry => sOwerflow,
              oRes   => soZ,
              oCarry => sDummy);

    oInf_n <=      soZ(9)  and     soZ(8);
    oInf_p <= (    soZ(9)  and not(soZ(8))) or
              (not(soZ(9)) and     soZ(8) ) or
              (not(soZ(9)) and not(soZ(8)) and soZ(7) and soZ(6) and soZ(5) and soZ(4) and soZ(3) and soZ(2) and soZ(1) and soZ(0));

    oZ <= soZ;

end Behavioral;

