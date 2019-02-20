----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 03:52:07 PM
-- Design Name: 
-- Module Name: fetchStage_TB - Behavioral
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

entity fetchStage_TB is end fetchStage_TB;

architecture Behavioral of fetchStage_TB is

component fetchStage port(
    clk : in std_logic;
    instruction: out std_logic_vector(15 downto 0)
);
end component;

signal clk : std_logic;
signal instruction: std_logic_vector(15 downto 0);

begin

u0 : fetchStage port map(
    clk=>clk,
    instruction=>instruction
);

process begin
    clk <= '0';
    wait for 10 us;
    clk <= '1';
    wait for 10us;
end process;

end Behavioral;
