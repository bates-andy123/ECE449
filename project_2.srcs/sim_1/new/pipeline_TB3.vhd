----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 01:43:13 PM
-- Design Name: 
-- Module Name: pipeline_TB2 - Behavioral
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

entity pipeline_TB3 is end pipeline_TB3;

architecture Behavioral of pipeline_TB3 is

component pipeline Port (
    clk, rst : in  STD_LOGIC;
    input : in std_logic_vector(15 downto 0);
    output : out std_logic_vector(15 downto 0) 
);
end component;

signal clk, rst : std_logic := '0';
signal output : std_logic_vector(15 downto 0);
signal input : std_logic_vector(15 downto 0) := X"C0A0";

begin

u0 : pipeline port map(
    clk => clk,
    rst => rst,
    input=>input,
    output => output
);

process begin
    input<=X"0001";
    wait until falling_edge(clk);
    input<=X"0003";
    wait until falling_edge(clk);
    input<=X"0001";
    wait until falling_edge(clk);
    input<=X"0005";
    wait until falling_edge(clk);
    input<=X"0008";
    wait until falling_edge(clk);
    input<=X"0001";
    wait until falling_edge(clk);
    input<=X"0005";
    wait until falling_edge(clk);
    input<=X"0000";
    wait;

end process;

--process(clk) 
--variable count : integer range 0 to 30 := 0;
--begin
--    if falling_edge(clk) then
--        count := count + 1;
--        if count > 34 then 
--            count := 0;
--            rst <= '0';
--        elsif count > 29 then 
--            rst <= '1';
--        else
--        end if;
--    end if;
--end process;


process begin
    clk<='0';
    wait for 5us;
    clk<='1';
    wait for 5us;
end process;

end Behavioral;
