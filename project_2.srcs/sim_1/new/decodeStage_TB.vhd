----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 06:53:49 PM
-- Design Name: 
-- Module Name: decodeStage_TB - Behavioral
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

entity decodeStage_TB is end decodeStage_TB;

architecture Behavioral of decodeStage_TB is

component decodeStage port(
    clk : in std_logic;
    instruction : in std_logic_vector(15 downto 0);
    useALU : out std_logic;
    modeALU : out std_logic_vector(2 downto 0);
    operand1, operand2 : out std_logic_vector(15 downto 0)
);
end component;

signal clk : std_logic := '0';
signal instruction : std_logic_vector(15 downto 0) := X"0000";
signal useALU : std_logic;
signal modeALU : std_logic_vector(2 downto 0);
signal operand1, operand2 : std_logic_vector(15 downto 0);

begin

u0 : decodeStage port map(
    clk => clk,
    instruction => instruction,
    useALU => useALU,
    modeALU => modeALU,
    operand1 => operand1,
    operand2 => operand2
);

end Behavioral;
