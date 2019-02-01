----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:28 11/29/2018 
-- Design Name: 
-- Module Name:    nBitAdder - Behavioral 
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

entity nBitAdder is
    generic ( BitNuma : integer);
    port    ( iA     : in  std_logic_vector(BitNuma-1 downto 0);
	           iB     : in  std_logic_vector(BitNuma-1 downto 0);
	           iCarry : in  std_logic;
              oRes   : out std_logic_vector(BitNuma-1 downto 0);
              oCarry : out std_logic	);
end nBitAdder;

architecture RTL of nBitAdder is
    component fullAdder
	     port( iA   : in  std_logic;
		        iB   : in  std_logic;
		        iC   : in  std_logic;          
		        oFnc : out std_logic;
		        oC   : out std_logic );
    end component;
		
	 signal sCarry: std_logic_vector(BitNuma downto 0);
begin
	
	 sCarry(0) <= iCarry;
	 
GEN_ADD: 
    for I in 0 to BitNuma -1 generate
        ADDX : fullAdder
		  port map(iA   => iA(I),
		           iB   => iB(I),
		           iC   => sCarry(I),
		           oFnc => oRes(I),
		           oC   => sCarry(I+1) );
        end generate GEN_ADD;

    oCarry <= sCarry(BitNuma); 
	 
end RTL;

