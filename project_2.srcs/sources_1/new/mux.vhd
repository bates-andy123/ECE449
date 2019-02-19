----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/18/2019 02:49:14 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux2_8 is
Port (
    ch0, ch1 : in std_logic_vector(7 downto 0);
    sel : in std_logic;
    output : out std_logic_vector(7 downto 0)
);
end mux2_8;

architecture Behavioral of mux2_8 is
    
begin

with sel select
    output <=   ch0 when '0',
                ch1 when '1',
                X"00" when others;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_4 is
Port (
    ch0, ch1 : in std_logic_vector(3 downto 0);
    sel : in std_logic;
    output : out std_logic_vector(3 downto 0)
);
end mux2_4;

architecture Behavioral of mux2_4 is
    
begin

with sel select
    output <=   ch0 when '0',
                ch1 when '1',
                X"0" when others;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_2 is
Port (
    ch0, ch1 : in std_logic_vector(1 downto 0);
    sel : in std_logic;
    output : out std_logic_vector(1 downto 0)
);
end mux2_2;

architecture Behavioral of mux2_2 is
    
begin

with sel select
    output <=   ch0 when '0',
                ch1 when '1',
                "00" when others;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1 is
Port (
    ch0, ch1 : in std_logic;
    sel : in std_logic;
    output : out std_logic
);
end mux2_1;

architecture Behavioral of mux2_1 is
    
begin

with sel select
    output <=   ch0 when '0',
                ch1 when '1',
                '0' when others;

end Behavioral;
