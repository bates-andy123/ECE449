----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 01:06:50 PM
-- Design Name: 
-- Module Name: fetchStage - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fetchStage is Port (
    clk : in std_logic;
    instruction: out std_logic_vector(15 downto 0)
);
end fetchStage;

architecture Behavioral of fetchStage is

component ROMController port(
    clka, ena, injectdbiterra, injectsbiterra, regcea, rsta, sleep : in std_logic;
    addra : in std_logic_vector (7 downto 0);
    douta : out std_logic_vector (15 downto 0);
    dbiterra, sbiterra : out std_logic
);
end component;

signal addrROM : std_logic_vector (7 downto 0) := X"00";
signal doutROM : std_logic_vector (15 downto 0);

signal PC : std_logic_vector(7 downto 0) := X"00";

begin

u0 : ROMController port map(
    clka=>clk,
    ena=>'1', 
    injectdbiterra=>'0', 
    injectsbiterra=>'0', 
    regcea=>'1', 
    rsta=>'0', 
    sleep=>'0',
    addra=>addrROM,
    douta=>doutROM
);

process(clk)
begin

    if rising_edge(clk) then
        instruction <= doutROM;
        PC <= std_logic_vector(unsigned(PC) + 1);
    elsif falling_edge(clk) then 
        addrROM <= PC;
    end if;

end process;

end Behavioral;
