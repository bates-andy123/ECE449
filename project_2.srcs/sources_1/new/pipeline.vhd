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
    output : out std_logic_vector(15 downto 0);
    out1, out2, out3, out4 : out std_logic_vector(15 downto 0)
);
end pipeline;

architecture Behavioral of pipeline is

component fetchStage port(
    clk, rst, halt : in std_logic;
    instruction, PC_out: out std_logic_vector(15 downto 0);
    inputIn: in std_logic_vector(15 downto 0);
    InputOut: out std_logic_vector(15 downto 0);
    PC_set : in std_logic_vector(15 downto 0);
    PC_doJump : in std_logic
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
    destReg, readReg1, readReg2 : out std_logic_vector(2 downto 0);
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
    readReg1, readReg2, memoryDestReg, writebackDestReg : in std_logic_vector(2 downto 0);
    modeIO, useMemoryDestValue, useWritebackDestValue : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0);
    doWriteBackIn : in std_logic;
    doWriteBackOut, doPCWriteBack : out std_logic;
    result : out std_logic_vector(15 downto 0);
    outputCPU : out std_logic_vector(15 downto 0);
    PC_in, memoryDestValue, writebackDestValue : in std_logic_vector(15 downto 0);
    PC_out : out std_logic_vector(15 downto 0)
);
end component;

component memoryStage Port (
    clk, rst : in std_logic;
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0);
    doWriteBackIn, doPCWriteBackIn : in std_logic;
    doWriteBackOut, doPCWriteBackOut : out std_logic;
--    modeMemory : in std_logic_vector(1 downto 0);
--    memoryAddress, memoryWriteValue : out std_logic_vector(15 downto 0);
--    memoryRW : out std_logic;
--    memoryReadValue, 
    PC_In : in std_logic_vector(15 downto 0);
    input : in std_logic_vector(15 downto 0);
    output, PC_out : out std_logic_vector(15 downto 0)
);
end component;

component writeBackStage port ( 
    clk, rst : in std_logic;
    inDoWriteBack, doPCWriteBackIn : in std_logic;
    inDestRegister : in std_logic_vector(2 downto 0);
    inWriteBackValue, PC_in : in std_logic_vector(15 downto 0);
    outDoWriteBack, doPCWriteBackOut, requestReset : out std_logic;
    outDestRegister : out std_logic_vector(2 downto 0);
    outWriteBackValue, PC_out : out std_logic_vector(15 downto 0)
);
end component;

signal fetchedInstruction: std_logic_vector(15 downto 0);
signal inputOutputFetchStage : std_logic_vector(15 downto 0);
signal PC_outFetchStage : std_logic_vector(15 downto 0);
signal resetFetchStage : std_logic;

signal doWriteBack : std_logic;
signal useALU, useBranch : std_logic := '0';
signal useIO : std_logic := '0';
signal modeALU : std_logic_vector(2 downto 0) := "000";
signal modeIO : std_logic := '0';
signal operand1, operand2 : std_logic_vector(15 downto 0);
signal regWriteEnable : std_logic;
signal regWriteAddress : std_logic_vector(2 downto 0);
signal readReg1DecodeStage, readReg2DecodeStage : std_logic_vector(2 downto 0);
signal writeBackValue : std_logic_vector(15 downto 0);
signal doWriteBackOutputDecodeStage : std_logic := '0';
signal writeBackRegOutputDecodeStage : std_logic_vector(2 downto 0) := "000";
signal haltSig : std_logic := '0';
signal PC_outDecodeStage : std_logic_vector(15 downto 0);
signal resetDecodeStage : std_logic;

signal doWriteBackOutputExecuteStage : std_logic;
signal writeBackRegOutputExecuteStage : std_logic_vector(2 downto 0);
signal resultExecuteStage : std_logic_vector(15 downto 0);
signal PC_outExecuteStage : std_logic_vector(15 downto 0);
signal doPCWriteBackExecuteStage : std_logic;
signal resetExecuteStage : std_logic;

signal doWriteBackOutputMemoryStage : std_logic := '0';
signal writeBackRegOutputMemoryStage : std_logic_vector(2 downto 0);
signal resultMemoryStage : std_logic_vector(15 downto 0);
signal PC_outMemoryStage : std_logic_vector(15 downto 0);
signal doPCWriteBackMemoryStage : std_logic; 
signal resetMemoryStage : std_logic;

signal requestResetWritebackStage : std_logic;
signal doPCWriteBackOutWritebackStage : std_logic;
signal PC_outWritebackStage : std_logic_vector(15 downto 0);
signal resetWritebackStage : std_logic;

begin

fetch : fetchStage port map(
    clk=>clk,
    PC_out=>PC_outFetchStage,
    halt=>haltSig,
    rst=>rst,
    instruction=>fetchedInstruction,
    --instruction=>output, Was only for testing purposes
    inputIn=>input,
    inputOut=>inputOutputFetchStage,
    PC_set => PC_outWritebackStage,
    PC_doJump => doPCWriteBackOutWritebackStage
);

out1 <= inputOutputFetchStage;

--resetDecodeStage <= (rst or requestResetWritebackStage);

decode : decodeStage port map(
    clk => clk,
    rst => rst,
    halt=>haltSig,
    PC_in=>PC_outFetchStage,
    PC_out=>PC_outDecodeStage,
    instruction => fetchedInstruction,
    useALU => useALU,
    readReg1 => readReg1DecodeStage,
    readReg2 => readReg2DecodeStage,
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

resetExecuteStage <= (rst or requestResetWritebackStage);

execute : executeStage port map(
    clk=>clk,
    rst=>resetExecuteStage,
    useALU=>useALU,
    useBranch=>useBranch,
    useIO=>useIO,
    modeALU=>modeALU,
    readReg1 => readReg1DecodeStage,
    readReg2 => readReg2DecodeStage,
    modeIO=>modeIO,
    operand1=>operand1, 
    operand2=>operand2,
    destRegIn => writeBackRegOutputDecodeStage,
    destRegOut => writeBackRegOutputExecuteStage,
    doWriteBackIn=>doWriteBackOutputDecodeStage,
    doWriteBackOut=>doWriteBackOutputExecuteStage,
    memoryDestReg=>writeBackRegOutputExecuteStage,
    writebackDestReg=>writeBackRegOutputMemoryStage,
    memoryDestValue=>resultExecuteStage,
    writebackDestValue=>resultMemoryStage,
    useMemoryDestValue=>doWriteBackOutputExecuteStage, 
    useWritebackDestValue=>doWriteBackOutputMemoryStage,
    result=>resultExecuteStage,
    --outputCPU=>output,
    doPCWriteBack=>doPCWriteBackExecuteStage,
    PC_in => PC_outDecodeStage,
    PC_out => PC_outExecuteStage
);

output <= operand1;

resetMemoryStage <= (requestResetWritebackStage or rst);

memory : memoryStage Port map(
    clk=>clk, 
    rst=>resetMemoryStage,
    destRegIn=>writeBackRegOutputExecuteStage,
    destRegOut=>writeBackRegOutputMemoryStage,
    doWriteBackIn=>doWriteBackOutputExecuteStage,
    doWriteBackOut=>doWriteBackOutputMemoryStage,
    doPCWriteBackIn=>doPCWriteBackExecuteStage,
    doPCWriteBackOut=>doPCWriteBackMemoryStage,
    PC_In=>PC_outExecuteStage,
    PC_out=>PC_outMemoryStage,
--    modeMemory=>"00",
    --memoryAddress, 
    --memoryWriteValue ,
    --memoryRW ,
--    memoryReadValue=>X"0000",
    input=>resultExecuteStage,
    output=>resultMemoryStage
);

resetWritebackStage <= (rst or requestResetWritebackStage);

writeback : writeBackStage port map( 
    clk=>clk,
    rst=>resetWritebackStage,
    inDoWriteBack =>doWriteBackOutputMemoryStage,
    inDestRegister =>writeBackRegOutputMemoryStage,
    inWriteBackValue =>resultMemoryStage,
    outDoWriteBack=>regWriteEnable,
    outDestRegister=>regWriteAddress,
    outWriteBackValue=>writeBackValue,
    PC_in => PC_outMemoryStage,
    PC_out => PC_outWritebackStage,
    doPCWriteBackIn => doPCWriteBackMemoryStage,
    doPCWriteBackOut => doPCWriteBackOutWritebackStage, 
    requestReset => requestResetWritebackStage
);

end Behavioral;
