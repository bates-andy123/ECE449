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
    clk, rst : in  STD_LOGIC;
    input : in std_logic_vector(15 downto 0);
    output : out std_logic_vector(15 downto 0) 
);
end pipeline;

architecture Behavioral of pipeline is

component fetchStage port(
    clk, rst, halt : in std_logic;
    instruction, PC_out: out std_logic_vector(15 downto 0);
    inputIn: in std_logic_vector(15 downto 0);
    InputOut: out std_logic_vector(15 downto 0);
    PC_offset : in std_logic_vector(15 downto 0);
    PC_set : in std_logic_vector(15 downto 0);
    PC_mode : in std_logic
);
end component;

component decodeStage port(
    clk, rst : in std_logic;
    instruction, PC_in : in std_logic_vector(15 downto 0);
    useALU, useBranch : out std_logic;
    useIO : out std_logic;
    modeALU : out std_logic_vector(2 downto 0);
    modeIO : out std_logic;
    operand1, operand2 : out std_logic_vector(15 downto 0);
    destReg : out std_logic_vector(2 downto 0);
    doWriteBack : out std_logic;
    regWriteEnable : in std_logic;
    regWriteAddress : in std_logic_vector(2 downto 0);
    writeBackValue : in std_logic_vector(15 downto 0);
    inputIn : in std_logic_vector(15 downto 0);
    halt : out std_logic;
    PC_out : out std_logic_vector(15 downto 0)
);
end component;

component executeStage port(
    clk, rst : in std_logic;
    useALU, useBranch : in std_logic;
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
    PC_in : in std_logic_vector(15 downto 0);
    PC_out : out std_logic_vector(15 downto 0)
);
end component;

component memoryStage Port (
    clk, rst : in std_logic;
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0);
    doWriteBackIn : in std_logic;
    doWriteBackOut : out std_logic;
    modeMemory : in std_logic_vector(1 downto 0);
    memoryAddress, memoryWriteValue : out std_logic_vector(15 downto 0);
    memoryRW : out std_logic;
    memoryReadValue : in std_logic_vector(15 downto 0);
    input : in std_logic_vector(15 downto 0);
    output : out std_logic_vector(15 downto 0)
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
signal inputOutputFetchStage : std_logic_vector(15 downto 0);
signal PC_outFetchStage : std_logic_vector(15 downto 0);

signal doWriteBack : std_logic;
signal useALU, useBranch : std_logic := '0';
signal useIO : std_logic := '0';
signal modeALU : std_logic_vector(2 downto 0) := "000";
signal modeIO : std_logic := '0';
signal operand1, operand2 : std_logic_vector(15 downto 0);
signal regWriteEnable : std_logic;
signal regWriteAddress : std_logic_vector(2 downto 0);
signal writeBackValue : std_logic_vector(15 downto 0);
signal doWriteBackOutputDecodeStage : std_logic := '0';
signal writeBackRegOutputDecodeStage : std_logic_vector(2 downto 0) := "000";
signal haltSig : std_logic := '0';
signal PC_outDecodeStage : std_logic_vector(15 downto 0);

signal doWriteBackOutputExecuteStage : std_logic;
signal writeBackRegOutputExecuteStage : std_logic_vector(2 downto 0);
signal resultExecuteStage : std_logic_vector(15 downto 0);
signal PC_outExecuteStage : std_logic_vector(15 downto 0);

signal doWriteBackOutputMemoryStage : std_logic := '0';
signal writeBackRegOutputMemoryStage : std_logic_vector(2 downto 0);
signal resultMemoryStage : std_logic_vector(15 downto 0);
signal PC_outMemoryStage : std_logic_vector(15 downto 0);

begin

fetch : fetchStage port map(
    clk=>clk,
    PC_out=>PC_outFetchStage,
    halt=>haltSig,
    rst=>rst,
    instruction=>fetchedInstruction,
    inputIn=>input,
    inputOut=>inputOutputFetchStage,
    PC_offset => X"0000",
    PC_set => X"0000",
    PC_mode => '0'
);

decode : decodeStage port map(
    clk => clk,
    rst => rst,
    halt=>haltSig,
    PC_in=>PC_outFetchStage,
    PC_out=>PC_outDecodeStage,
    instruction => fetchedInstruction,
    useALU => useALU,
    useBranch=>useBranch,
    useIO=>useIO,
    modeALU => modeALU,
    modeIO=>modeIO,
    operand1 => operand1,
    operand2 => operand2,
    destReg => writeBackRegOutputDecodeStage,
    doWriteBack=>doWriteBackOutputDecodeStage,
    regWriteEnable=>regWriteEnable,
    regWriteAddress=>regWriteAddress,
    writeBackValue=>writeBackValue,
    inputIn=>inputOutputFetchStage
);

execute : executeStage port map(
    clk=>clk,
    rst=>rst,
    useALU=>useALU,
    useBranch=>useBranch,
    useIO=>useIO,
    modeALU=>modeALU,
    modeIO=>modeIO,
    operand1=>operand1, 
    operand2=>operand2,
    destRegIn => writeBackRegOutputDecodeStage,
    destRegOut => writeBackRegOutputExecuteStage,
    doWriteBackIn=>doWriteBackOutputDecodeStage,
    doWriteBackOut=>doWriteBackOutputExecuteStage,
    result=>resultExecuteStage,
    outputCPU=>output,
    PC_in => PC_outDecodeStage,
    PC_out => PC_outExecuteStage
);

memory : memoryStage Port map(
    clk=>clk, 
    rst=>rst,
    destRegIn=>writeBackRegOutputExecuteStage,
    destRegOut=>writeBackRegOutputMemoryStage,
    doWriteBackIn=>doWriteBackOutputExecuteStage,
    doWriteBackOut=>doWriteBackOutputMemoryStage,
    modeMemory=>"00",
    --memoryAddress, 
    --memoryWriteValue ,
    --memoryRW ,
    memoryReadValue=>X"0000",
    input=>resultExecuteStage,
    output=>resultMemoryStage
);

writeback : writeBackStage port map( 
    clk=>clk,
    inDoWriteBack =>doWriteBackOutputMemoryStage,
    inDestRegister =>writeBackRegOutputMemoryStage,
    inWriteBackValue =>resultMemoryStage,
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
