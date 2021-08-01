----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.07.2021 19:59:21
-- Design Name: 
-- Module Name: FullAdder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdder is
--  Port ( );
port (
        A : in std_logic;
        B : in std_logic;
        C : in std_logic;
        SUM : out std_logic;
        CARRY : out std_logic
     );
end FullAdder;

architecture Behavioral of FullAdder is

    signal sum1, sum2, carry1, carry2 : std_logic;
    
    
    component HalfAdder is      -- component declaration
        port (
            A : in std_logic;
            B : in std_logic;
            SUM : out std_logic;
            CARRY: out std_logic
        );
    end component;

begin

    HA1 : HalfAdder port map ( A => A, B => B, SUM => sum1, CARRY => carry1 );
    HA2 : HalfAdder port map ( A => sum1, B => C, SUM => sum2, CARRY => carry2 );
    
    SUM <= sum2;
    CARRY <= carry1 or carry2;

end Behavioral;
