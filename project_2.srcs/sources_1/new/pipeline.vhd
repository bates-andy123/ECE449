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
    clk, rst, display_clock : in  STD_LOGIC;
    input : in std_logic_vector(15 downto 0);
    output : out std_logic_vector(15 downto 0)
    --out1, out2, out3, out4 : out std_logic_vector(15 downto 0)
);
end pipeline;

architecture Behavioral of pipeline is

component fetchStage port(
    clk, rst, halt : in std_logic;
    instruction_out, PC_out: out std_logic_vector(15 downto 0);
    inputIn, instruction_in: in std_logic_vector(15 downto 0);
    InputOut, fetchAddress: out std_logic_vector(15 downto 0);
    PC_set : in std_logic_vector(15 downto 0);
    PC_doJump : in std_logic
);
end component;

component decodeStage port(
    clk, rst, addNOP : in std_logic;
    instruction_in, PC_in : in std_logic_vector(15 downto 0);
    useALU, useBranch : out std_logic;
    useIO, useLS : out std_logic;
    modeALU : out std_logic_vector(2 downto 0);
    modeIO, operand2Passthrough : out std_logic;
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
    useIO, useLS, operand2Passthrough : in std_logic;
    modeALU : in std_logic_vector(2 downto 0);
    readReg1, readReg2, memoryDestReg, writebackDestReg : in std_logic_vector(2 downto 0);
    modeIO, useMemoryDestValue, useWritebackDestValue : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0);
    doWriteBackIn : in std_logic;
    doWriteBackOut, doPCWriteBack, doMemoryAccess : out std_logic;
    result, memoryAddress : out std_logic_vector(15 downto 0);
    outputCPU : out std_logic_vector(15 downto 0);
    modeMemory : out std_logic_vector(1 downto 0);
    PC_in, memoryDestValue, writebackDestValue : in std_logic_vector(15 downto 0);
    PC_out : out std_logic_vector(15 downto 0)
);
end component;

component memoryStage Port (
    clk, rst, doMemoryAccess : in std_logic;
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0);
    doWriteBackIn, doPCWriteBackIn : in std_logic;
    doWriteBackOut, doPCWriteBackOut : out std_logic;
    modeMemory : in std_logic_vector(1 downto 0);
    memoryAddress, memoryWriteValue : out std_logic_vector(15 downto 0);
    memoryRW : out std_logic;
    memoryReadValue : in std_logic_vector(15 downto 0);
    PC_In : in std_logic_vector(15 downto 0);
    input, memoryAddressFromExecuteStage : in std_logic_vector(15 downto 0);
    output, PC_out : out std_logic_vector(15 downto 0)
);
end component;

component writeBackStage port ( 
    clk, rst : in std_logic;
    inDoWriteBack, doPCWriteBackIn : in std_logic;
    inDestRegister : in std_logic_vector(2 downto 0);
    inWriteBackValue, PC_in : in std_logic_vector(15 downto 0);
    outDoWriteBack, doPCWriteBackOut, doBranchReset : out std_logic;
    outDestRegister : out std_logic_vector(2 downto 0);
    outWriteBackValue, PC_out : out std_logic_vector(15 downto 0)
);
end component;

component memoryController Port (
    -- Clock flag
    clk : in std_logic; -- Clk flag
    
    -- Port information shared between RAM and ROM
    readOnlyAddress : in std_logic_vector(15 downto 0); -- Address to either read from RAM port B or ROM
    outputOnReadOnlyChannel : out std_logic_vector(15 downto 0) := X"0000";
    
    -- Port information relating to RAM controller
    addressARAM : in std_logic_vector(15 downto 0); -- Address to read/write from in RAM port A
    writeContentRAM : in std_logic_vector(15 downto 0); -- Content to write to RAM port A
    outaContentRAM : out std_logic_vector(15 downto 0); -- Content read from port A of RAM
    weaRAM : in std_logic; -- Write enable vector for port A in RAM
    rstaRAM : in std_logic; -- Reset signal for port A in RAM
    rstbRAM : in std_logic; -- Reset signal for port B in RAM
    regceaRAM : in std_logic; -- Clock enable for last register stage on output data path
    
    -- Port information relating to ROM controller
    rstaROM : in std_logic
);
end component;

component display_controller port(
    clk, reset: in std_logic;
    hex3, hex2, hex1, hex0: in std_logic_vector(3 downto 0);
    an: out std_logic_vector(3 downto 0);
    sseg: out std_logic_vector(6 downto 0)
);
end component;

signal fetchedInstruction: std_logic_vector(15 downto 0);
signal inputOutputFetchStage : std_logic_vector(15 downto 0);
signal PC_outFetchStage : std_logic_vector(15 downto 0);
signal fetchAddressFetchStage : std_logic_vector(15 downto 0);
signal resetFetchStage : std_logic;
signal instruction_inFetchStage : std_logic_vector(15 downto 0);

signal doWriteBack : std_logic;
signal useALU, useBranch : std_logic := '0';
signal useIO, useLS : std_logic := '0';
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
signal operand2PassthroughDecodeStage : std_logic;

signal doWriteBackOutputExecuteStage : std_logic;
signal writeBackRegOutputExecuteStage : std_logic_vector(2 downto 0);
signal resultExecuteStage : std_logic_vector(15 downto 0);
signal PC_outExecuteStage : std_logic_vector(15 downto 0);
signal doPCWriteBackExecuteStage : std_logic;
signal modeMemoryExecuteStage : std_logic_vector(1 downto 0);
signal resetExecuteStage, doMemoryAccessExecuteStage : std_logic;
signal memoryAddress, memoryWriteValue, memoryAddressExecuteStage :  std_logic_vector(15 downto 0);
signal memoryRW : std_logic;
signal memoryReadValue : std_logic_vector(15 downto 0);
signal CPUoutputExecuteStage : std_logic_vector(15 downto 0);

signal doWriteBackOutputMemoryStage : std_logic := '0';
signal writeBackRegOutputMemoryStage : std_logic_vector(2 downto 0);
signal resultMemoryStage : std_logic_vector(15 downto 0);
signal PC_outMemoryStage : std_logic_vector(15 downto 0);
signal doPCWriteBackMemoryStage : std_logic; 
signal resetMemoryStage : std_logic;

signal doBranchResetWritebackStage : std_logic;
signal doPCWriteBackOutWritebackStage : std_logic;
signal PC_outWritebackStage : std_logic_vector(15 downto 0);
signal resetWritebackStage : std_logic;



begin

fetch : fetchStage port map(
    clk=>clk,
    PC_out=>PC_outFetchStage,
    halt=>doBranchResetWritebackStage,
    rst=>rst,
    fetchAddress=>fetchAddressFetchStage,
    instruction_in=>instruction_inFetchStage,
    instruction_out=>fetchedInstruction,
    --instruction=>output, Was only for testing purposes
    inputIn=>input,
    inputOut=>inputOutputFetchStage,
    PC_set => PC_outWritebackStage,
    PC_doJump => doPCWriteBackOutWritebackStage
);

--out2 <= (X"000" & modeIO & doPCWriteBackOutWritebackStage & doBranchResetWritebackStage & rst);
--out3 <= PC_outFetchStage;
--out4 <= X"000" & "000" & doWriteBackOutputExecuteStage;

--resetDecodeStage <= (rst or requestResetWritebackStage);

decode : decodeStage port map(
    clk => clk,
    rst => rst,
    addNOP => doBranchResetWritebackStage,
    halt=>haltSig,
    PC_in=>PC_outFetchStage,
    PC_out=>PC_outDecodeStage,
    instruction_in => fetchedInstruction,
    useALU => useALU,
    readReg1 => readReg1DecodeStage,
    readReg2 => readReg2DecodeStage,
    useBranch=>useBranch,
    useIO=>useIO,
    useLS=>useLS,
    operand2Passthrough=>operand2PassthroughDecodeStage,
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

--out6 <= ("0" & writeBackRegOutputExecuteStage & "0" & writeBackRegOutputDecodeStage & "0" & modeALU & useBranch & useLS & useIO & useALU);
resetExecuteStage <= (rst or doBranchResetWritebackStage);


execute : executeStage port map(
    clk=>clk,
    rst=>resetExecuteStage,
    useALU=>useALU,
    useBranch=>useBranch,
    useIO=>useIO,
    useLS=>useLS,
    operand2Passthrough=>operand2PassthroughDecodeStage,
    modeALU=>modeALU,
    readReg1 => readReg1DecodeStage,
    readReg2 => readReg2DecodeStage,
    modeIO=>modeIO,
    operand1=>operand1, 
    operand2=>operand2,
    doMemoryAccess=>doMemoryAccessExecuteStage,
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
    modeMemory=>modeMemoryExecuteStage,
    memoryAddress=>memoryAddressExecuteStage,
    outputCPU=>CPUoutputExecuteStage,
    doPCWriteBack=>doPCWriteBackExecuteStage,
    PC_in => PC_outDecodeStage,
    PC_out => PC_outExecuteStage
);

output <= CPUoutputExecuteStage;
--out2 <= PC_outExecuteStage;
resetMemoryStage <= (doBranchResetWritebackStage or rst);

memory : memoryStage Port map(
    clk=>clk, 
    rst=>resetMemoryStage,
    doMemoryAccess=>doMemoryAccessExecuteStage,
    destRegIn=>writeBackRegOutputExecuteStage,
    destRegOut=>writeBackRegOutputMemoryStage,
    doWriteBackIn=>doWriteBackOutputExecuteStage,
    doWriteBackOut=>doWriteBackOutputMemoryStage,
    doPCWriteBackIn=>doPCWriteBackExecuteStage,
    doPCWriteBackOut=>doPCWriteBackMemoryStage,
    PC_In=>PC_outExecuteStage,
    PC_out=>PC_outMemoryStage,
    memoryAddressFromExecuteStage=>memoryAddressExecuteStage,
    modeMemory=>modeMemoryExecuteStage,
    memoryAddress=>memoryAddress, 
    memoryWriteValue=>memoryWriteValue,
    memoryRW=>memoryRW,
    memoryReadValue=>memoryReadValue,
    input=>resultExecuteStage,
    output=>resultMemoryStage
);

resetWritebackStage <= (rst or doBranchResetWritebackStage);

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
    doBranchReset => doBranchResetWritebackStage
);

memCtrl : memoryController port map(
    clk=>clk,
    readOnlyAddress=>fetchAddressFetchStage,
    outputOnReadOnlyChannel=>instruction_inFetchStage,
    addressARAM=>memoryAddress,
    writeContentRAM=>memoryWriteValue,
    outaContentRAM=>memoryReadValue,
    weaRAM=>memoryRW,
    rstaRAM=>'0',
    rstbRAM=>'0',
    regceaRAM=>'1',
    rstaROM=>'0'
);

display : display_controller port map(
    clk=>display_clock, 
    reset=>rst,
    hex3=>CPUoutputExecuteStage(15 downto 12), 
    hex2=>CPUoutputExecuteStage(11 downto 8), 
    hex1=>CPUoutputExecuteStage(7 downto 4),  
    hex0=>CPUoutputExecuteStage(3 downto 0)
    --an,
    --sseg,
);

--out1 <= X"0" & "000" & doPCWriteBackExecuteStage & "000" & doPCWriteBackMemoryStage & "000" & doPCWriteBackOutWritebackStage;
--out4 <= PC_outWritebackStage;

end Behavioral;
