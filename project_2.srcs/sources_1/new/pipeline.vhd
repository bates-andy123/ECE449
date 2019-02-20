----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 01:05:40 PM
-- Design Name: 
-- Module Name: pipeline - Behavioral
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

entity pipeline is Port (
    clk : in  STD_LOGIC;
    input : in std_logic_vector(15 downto 0);
    output : out std_logic_vector(15 downto 0) 
);
end pipeline;

architecture Behavioral of pipeline is

component fetchStage port(
    clk : in std_logic;
    instruction: out std_logic_vector(15 downto 0)
);
end component;

signal fetchedInstruction: std_logic_vector(15 downto 0);
signal fetchedInstructionBuffer: std_logic_vector(15 downto 0);

begin

u0 : fetchStage port map(
    clk=>clk,
    instruction=>fetchedInstruction
);

process(clk)
begin

    if rising_edge(clk) then
        fetchedInstructionBuffer <= fetchedInstruction;
    end if;

end process;

end Behavioral;
