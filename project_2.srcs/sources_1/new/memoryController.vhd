----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 10:28:20 AM
-- Design Name: 
-- Module Name: memoryController - Behavioral
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

entity memoryController is
Port(

);
end memoryController;

architecture Behavioral of memoryController is

component ROMController port(
    clka, ena, injectdbiterra, injectsbiterra, regcea, rsta, sleep : in std_logic;
    addra : in std_logic_vector (7 downto 0);
    douta : out std_logic_vector (15 downto 0);
    dbiterra, sbiterra : out std_logic
);
end component;

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

end Behavioral;
