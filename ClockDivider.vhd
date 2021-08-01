----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.07.2021 21:58:03
-- Design Name: 
-- Module Name: ClockDivider - Behavioral
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
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ClockDivider is
--  Port ( );
port (
        clk : in std_logic;
        reset : in std_logic;
        clk_out : out std_logic;
        count_out : out std_logic_vector(3 downto 0)
     );
end ClockDivider;

architecture Behavioral of ClockDivider is
    signal divider : std_logic_vector(3 downto 0); -- we wish to divide the clock by 16 so we'd need 4 bits
    signal count : std_logic_vector(3 downto 0);
begin
    process(clk, reset)
        begin 
            if reset='1' then
                divider <= "0000";
            elsif rising_edge(clk) then
                divider <= divider + '1';
            end if;
        end process;
        
        clk_out <= divider(3);
    
    process(divider(3),reset)
        begin
            if reset='1' or count="1010" then
                count <= "0000";
            elsif rising_edge(divider(3)) then
                count <= count + '1';
            end if;
        end process;
        
        count_out <= count;
        

end Behavioral;
