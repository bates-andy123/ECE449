----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 03:12:22 PM
-- Design Name: 
-- Module Name: executeStage_TB - Behavioral
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

entity executeStage_TB is end executeStage_TB;

architecture Behavioral of executeStage_TB is

component executeStage port(
    clk : in std_logic;
    useALU : in std_logic;
    useIO : in std_logic;
    modeALU : in std_logic_vector(2 downto 0);
    modeIO : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    inputCPU : in std_logic_vector(15 downto 0);
    outputRegIn : in std_logic_vector(2 downto 0);
    outputRegOut : out std_logic_vector(2 downto 0);
    result : out std_logic_vector(15 downto 0);
    outputCPU : out std_logic_vector(15 downto 0);
    execFreezePipe : out std_logic
);
end component;

signal clk : std_logic := '0';
signal useALU : std_logic;
signal useIO : std_logic;
signal modeALU : std_logic_vector(2 downto 0);
signal modeIO : std_logic;
signal operand1, operand2 : std_logic_vector(15 downto 0);
signal inputCPU : std_logic_vector(15 downto 0);
signal outputRegIn : std_logic_vector(2 downto 0);
signal outputRegOut : std_logic_vector(2 downto 0);
signal result : std_logic_vector(15 downto 0);
signal outputCPU : std_logic_vector(15 downto 0);
signal execFreezePipe : std_logic;

begin

u2 : executeStage port map(
    clk=>clk,
    useALU=>useALU,
    useIO=>useIO,
    modeALU=>modeALU,
    modeIO=>modeIO,
    operand1=>operand1, 
    operand2=>operand2,
    inputCPU => inputCPU,
    outputRegIn => outputRegIn,
    outputRegOut => outputRegOut,
    result=>result,
    outputCPU=>outputCPU,
    execFreezePipe=>execFreezePipe
);

end Behavioral;
