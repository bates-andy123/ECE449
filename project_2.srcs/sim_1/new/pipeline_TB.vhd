----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 01:43:13 PM
-- Design Name: 
-- Module Name: pipeline_TB - Behavioral
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

entity pipeline_TB is end pipeline_TB;

architecture Behavioral of pipeline_TB is

component pipeline Port (
    clk : in  STD_LOGIC;
    input : in std_logic_vector(15 downto 0);
    output : out std_logic_vector(15 downto 0) 
);
end component;

signal clk : std_logic;
signal output : std_logic_vector(15 downto 0);
signal input : std_logic_vector(15 downto 0) := X"C0A0";

begin

u0 : pipeline port map(
    clk => clk,
    input=>input,
    output => output
);

process begin
    input<=X"00A0";
    wait until falling_edge(clk);
    input<=X"00B0";
    wait until falling_edge(clk);
    input<=X"00C0";
    wait until falling_edge(clk);
    input<=X"00D0";
    wait;

end process;

process begin
    clk<='0';
    wait for 5us;
    clk<='1';
    wait for 5us;
end process;

end Behavioral;
