----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 01:26:38 PM
-- Design Name: 
-- Module Name: ROMController_TB - Behavioral
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

entity ROMController_TB is end ROMController_TB;

architecture Behavioral of ROMController_TB is

component ROMController port(
    clka, ena, injectdbiterra, injectsbiterra, regcea, rsta, sleep : in std_logic;
    addra : in std_logic_vector (7 downto 0);
    douta : out std_logic_vector (15 downto 0);
    dbiterra, sbiterra : out std_logic
);
end component;

signal clk : std_logic;
signal addrROM : std_logic_vector (7 downto 0);
signal doutROM : std_logic_vector (15 downto 0);

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

process begin
    wait for 10us;
        clk <= '0';
    wait for 10us;
        clk <= '1';

end process;

p1 : process(clk)
    variable addr : integer range 0 to 15 := 0; 
begin 
    if falling_edge(clk) then
        addr := addr + 1;
        addrROM <= std_logic_vector(to_unsigned(addr, addrROM'length));
    end if;

end process;

end Behavioral;
