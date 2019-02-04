----------------------------------------------------------------------------------
-- Company    : 
-- Engineer   :  Nebojsa Markovic
-- 
-- Create Date:    14:27:38 02/01/2019 
-- Design Name: 
-- Module Name:    mul - Behavioral 

-- Description: 

-- Additional Comments: 
--
--  Special numbers in bfloat16 notation
--           val    s_exponent_signcnd
--           +inf = 0_11111111_0000000
--           -inf = 1_11111111_0000000

--              0 = 0 00000000 0000000
--             -0 = 1 00000000 0000000

--            non = x 11111111 xxxxxxx
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
<<<<<<< Updated upstream
    generic ( BitNum : integer := 16);
    port    ( iA : in  std_logic_vector(15 downto 0);
              iB : in  std_logic_vector(15 downto 0);
              oZ : out std_logic_vector(15 downto 0) );
=======
    port( iA : in  std_logic_vector(7 downto 0);
          iB : in  std_logic_vector(7 downto 0);
			 oRange : out std_logic;
          oZ : out std_logic_vector(7 downto 0) );
>>>>>>> Stashed changes
end mul;

architecture Behavioral of mul is

constant NULLs : std_logic_vector(BitNum -1 downto 0) := (others => '0');

    component nBitAdder
	 generic ( BitNuma : integer := 8);
    port( iA     : in  std_logic_vector(BitNuma-1 downto 0);
          iB     : in  std_logic_vector(BitNuma-1 downto 0);
          iCarry : in  std_logic;          
          oRes   : out std_logic_vector(BitNuma-1 downto 0);
          oCarry : out std_logic);
    end component;

-- Result num sign
    signal sSign     : std_logic;

-- Result Fraction part
    signal sFraction : std_logic_vector( 6 downto 0);
	 
--  nBitAdder signals (signals related to the exponent calc)
    signal sAddE1E2  : std_logic_vector( 7 downto 0);
    signal sOwerflow : std_logic;
    signal sDummy    : std_logic;
    signal sTempExp  : std_logic_vector( 7 downto 0);
    signal sExp      : std_logic_vector( 7 downto 0);    	 
begin

-- result sign is
   sSign <= iA(15) xor iB(15);

-- multiplay the fractions
--  sFraction <= iA(6 downto 0) * iB(6 downto 0)
    sFraction <= "0000000";

--add exponents
Inst_nBitAdder0:
    nBitAdder
	 port map( iA     => iA(14 downto 7),
              iB     => iB(14 downto 7),
              iCarry => '0',
              oRes   => sAddE1E2,
              oCarry => sOwerflow);

--"10000001" = 2nd complement(127)
-- iA + iB -127			  
Inst_nBitAdder1:
    nBitAdder
	 port map( iA     => sAddE1E2,
              iB     => "10000001",
              iCarry => '0',
<<<<<<< Updated upstream
              oRes   => sTempExp,
              oCarry => sDummy);	

    process(iA, iB, sTempExp)
    begin
        if iA = NULLs or iB = NULLs then
		      sExp <= (others => '0');
		  elsif (iA /= NULLs and iB(14 downto 7) = "11111111") or (iB /= NULLs and iA(14 downto 7) = "11111111") then
            sExp <= (others => '1');
        else
            sExp <= sTempExp;  
		  end if;
    end process;	 
    oZ <= sSign & sExp & sFraction;			  
-- scale the result
-- ....
=======
              oRes   => oZ,
              oCarry => oRange);	
>>>>>>> Stashed changes

--process(iA, iB, sDummy)
--begin
--
--end process;				  
--
end Behavioral;

