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

signal clka, ena, injectdbiterra, injectsbiterra, regcea, rsta, sleep : std_logic;
signal addra : std_logic_vector (7 downto 0);
signal douta : std_logic_vector (15 downto 0);
signal dbiterra, sbiterra : std_logic;

begin

u0 : ROMController port map(
    clka=>clka,
    ena=>ena, 
    injectdbiterra=>injectdbiterra, 
    injectsbiterra=>injectsbiterra, 
    regcea=>regcea, 
    rsta=>rsta, 
    sleep=>sleep,
    addra=>addra,
    douta=>douta,
    dbiterra=>dbiterra,
    sbiterra=>sbiterra
);

process begin
clka <= '0';
ena <= '1';
injectdbiterra <= '0';
injectsbiterra <= '0';
regcea <= '1';
rsta <= '0';
sleep <= '0';
addra <= X"00";
wait for 10us;
clka <= '1';
wait for 10us;
clka <= '0';
wait for 10us;
clka <= '1';
wait for 10us;
clka <= '0';
wait for 10us;
clka <= '1';
wait;

end process;

end Behavioral;
