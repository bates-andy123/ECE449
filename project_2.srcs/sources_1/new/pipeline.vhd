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
    instruction: out std_logic_vector(15 downto 0);
    inputIn: in std_logic_vector(15 downto 0);
    InputOut: out std_logic_vector(15 downto 0)
);
end component;

component decodeStage port(
    clk : in std_logic;
    instruction : in std_logic_vector(15 downto 0);
    useALU : out std_logic;
    useIO : out std_logic;
    modeALU : out std_logic_vector(2 downto 0);
    modeIO : out std_logic;
    operand1, operand2 : out std_logic_vector(15 downto 0);
    destReg : out std_logic_vector(2 downto 0);
    doWriteBack : out std_logic;
    regWriteEnable : in std_logic;
    regWriteAddress : in std_logic_vector(2 downto 0);
    writeBackValue : in std_logic_vector(15 downto 0);
    inputIn : in std_logic_vector(15 downto 0)
);
end component;

component executeStage port(
    clk : in std_logic;
    useALU : in std_logic;
    useIO : in std_logic;
    modeALU : in std_logic_vector(2 downto 0);
    modeIO : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0);
    doWriteBackIn : in std_logic;
    doWriteBackOut : out std_logic;
    result : out std_logic_vector(15 downto 0);
    outputCPU : out std_logic_vector(15 downto 0);
    z, n: out std_logic;
    execFreezePipe : out std_logic
);
end component;

component writeBackStage port ( 
    clk : in std_logic;
    inDoWriteBack : in std_logic;
    inDestRegister : in std_logic_vector(2 downto 0);
    inWriteBackValue : in std_logic_vector(15 downto 0);
    outDoWriteBack : out std_logic;
    outDestRegister : out std_logic_vector(2 downto 0);
    outWriteBackValue : out std_logic_vector(15 downto 0)
);
end component;

signal fetchedInstruction: std_logic_vector(15 downto 0);

signal doWriteBack : std_logic;
signal useALU : std_logic := '0';
signal useIO : std_logic := '0';
signal modeALU : std_logic_vector(2 downto 0) := "000";
signal modeIO : std_logic := '0';
signal operand1, operand2 : std_logic_vector(15 downto 0);
signal writeBackReg : std_logic_vector(2 downto 0);
signal regWriteEnable : std_logic;
signal regWriteAddress : std_logic_vector(2 downto 0);
signal writeBackValue : std_logic_vector(15 downto 0);

signal execWriteBackReg : std_logic_vector(2 downto 0);
signal execDoWriteBack : std_logic;
signal result : std_logic_vector(15 downto 0);

signal fetchInputOut : std_logic_vector(15 downto 0);

begin

u0 : fetchStage port map(
    clk=>clk,
    instruction=>fetchedInstruction,
    inputIn=>input,
    inputOut=>fetchInputOut
);

u1 : decodeStage port map(
    clk => clk,
    instruction => fetchedInstruction,
    useALU => useALU,
    useIO=>useIO,
    modeALU => modeALU,
    modeIO=>modeIO,
    operand1 => operand1,
    operand2 => operand2,
    destReg => writeBackReg,
    doWriteBack=>doWriteBack,
    regWriteEnable=>regWriteEnable,
    regWriteAddress=>regWriteAddress,
    writeBackValue=>writeBackValue,
    inputIn=>fetchInputOut
);

u2 : executeStage port map(
    clk=>clk,
    useALU=>useALU,
    useIO=>useIO,
    modeALU=>modeALU,
    modeIO=>modeIO,
    operand1=>operand1, 
    operand2=>operand2,
    destRegIn => writeBackReg,
    destRegOut => execWriteBackReg,
    doWriteBackIn=>doWriteBack,
    doWriteBackOut=>execDoWriteBack,
    result=>result,
    outputCPU=>output
    --execFreezePipe
);

u3 : writeBackStage port map( 
    clk=>clk,
    inDoWriteBack =>execDoWriteBack,
    inDestRegister =>execWriteBackReg,
    inWriteBackValue =>result,
    outDoWriteBack=>regWriteEnable,
    outDestRegister=>regWriteAddress,
    outWriteBackValue=>writeBackValue
);

process(clk)
begin

    if rising_edge(clk) then

    end if;

end process;

end Behavioral;
