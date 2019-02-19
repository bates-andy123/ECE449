library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity barallelShiftRight_TB is end barallelShiftRight_TB;

architecture Behavioral of barallelShiftRight_TB is

component barallelShiftLeft
 port(
    input : in std_logic_vector(15 downto 0);
    shiftBy : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(15 downto 0)   
);
end component;

signal input : std_logic_vector(15 downto 0);
signal shiftBy : std_logic_vector(3 downto 0);
signal output : std_logic_vector(15 downto 0);

begin

u0 : barallelShiftLeft port map(input=>input, shiftBy=>shiftBy, output=>output);

process begin

input <= X"AA88";
shiftBy <= "0000";
wait for 10us;
shiftBy <= "0001";
wait for 10us;
shiftBy <= "0010";
wait for 10us;
shiftBy <= "0100";
wait for 10us;
shiftBy <= "1000";
wait;

end process;

end Behavioral;
