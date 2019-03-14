----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 03:52:07 PM
-- Design Name: 
-- Module Name: fetchStage_TB - Behavioral
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

entity fetchStage_TB is end fetchStage_TB;

architecture Behavioral of fetchStage_TB is

component fetchStage Port (
    clk, rst, halt : in std_logic;
    instruction, PC_out: out std_logic_vector(15 downto 0) := X"0000";
    inputIn : in std_logic_vector(15 downto 0);
    inputOut : out std_logic_vector(15 downto 0) := X"0000";
    PC_set : in std_logic_vector(15 downto 0);
    PC_doJump : in std_logic
);
end component;

signal clk : std_logic;
signal instruction: std_logic_vector(15 downto 0);

begin

fetch : fetchStage port map(
    clk=>clk,
    rst=>'0',
    halt=>'0',
    instruction=>instruction,
    inputIn=>X"0000",
    PC_set=>X"0000",
    PC_doJump=>'0'
);

process begin
    clk <= '0';
    wait for 5 us;
    clk <= '1';
    wait for 5 us;
end process;

end Behavioral;
