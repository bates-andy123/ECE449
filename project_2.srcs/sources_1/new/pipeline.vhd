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
    clk, rst, rstLoad, display_clock : in  STD_LOGIC;
    input, switchInput : in std_logic_vector(15 downto 0);
    SSEG : out std_logic_vector(6 downto 0);
    AN : out std_logic_vector(3 downto 0);
    
--    modeIO_stat, useIO_stat, useLS_stat, useALU_stat, useBranch_stat, destRegDoWritebackExecute_stat, doOutputUpdateOutMemoryStage_stat : out std_logic;
--    destRegDoWritebackDecode_stat, doBranchResetWritebackStage_stat, doOutputUpdateOutExecuteStage_stat : out std_logic;
--    executeStageResult_stat : out std_logic_vector(15 downto 0);
--    destRegOutExecute_state, destRegOutDecode_state, modeALU_stat : out std_logic_vector(2 downto 0);
    
    output : out std_logic_vector(15 downto 0) := X"0000"
);
end pipeline;

architecture Behavioral of pipeline is

component fetchStage port(
    clk, rst, rstLoad, halt : in std_logic;
    instruction_out, PC_out: out std_logic_vector(15 downto 0);
    inputIn, instruction_in: in std_logic_vector(15 downto 0);
    InputOut, fetchAddress: out std_logic_vector(15 downto 0);
    PC_set : in std_logic_vector(15 downto 0);
    PC_doJump : in std_logic
);
end component;

component decodeStage port(
    clk, rst, addNOP, overflowInFromWriteback : in std_logic;
    instruction_in, PC_in : in std_logic_vector(15 downto 0);
    useALU, useBranch, overflowOut : out std_logic;
    useIO, useLS, useCustomTest : out std_logic;
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
    clk, rst, overflowInMemoryStage, overflowInWritebackStage : in std_logic;
    useALU, useBranch, useCustomTest : in std_logic;
    useIO, useLS, operand2Passthrough : in std_logic;
    modeALU : in std_logic_vector(2 downto 0);
    readReg1, readReg2,  memoryDestReg, writebackDestReg : in std_logic_vector(2 downto 0);
    modeIO, useMemoryDestValue, useWritebackDestValue : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut, readReg1Out : out std_logic_vector(2 downto 0);
    doWriteBackIn, overflowStatusIn : in std_logic;
    doWriteBackOut, doPCWriteBack, doMemoryAccess, doOutputUpdateOut, overflowOut : out std_logic;
    result, memoryAddress : out std_logic_vector(15 downto 0);
    outputCPU : out std_logic_vector(15 downto 0);
    modeMemory : out std_logic_vector(1 downto 0);
    PC_in, memoryDestValue, writebackDestValue : in std_logic_vector(15 downto 0);
    PC_out : out std_logic_vector(15 downto 0)
);
end component;

component memoryStage Port (
    clk, rst, doMemoryAccess, overflowIn, doWriteBackOutBackIn : in std_logic;
    destRegIn, regUsedIn, destRegOutBackIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0);
    doWriteBackIn, doPCWriteBackIn, doOutputUpdateIn : in std_logic;
    doWriteBackOut, doPCWriteBackOut, doOutputUpdateOut : out std_logic;
    modeMemory : in std_logic_vector(1 downto 0);
    memoryAddress, memoryWriteValue, CPUoutput : out std_logic_vector(15 downto 0);
    memoryRW, overflowOut : out std_logic;
    memoryReadValue, CPUinput : in std_logic_vector(15 downto 0);
    PC_In : in std_logic_vector(15 downto 0);
    input, memoryAddressFromExecuteStage, outputBackIn : in std_logic_vector(15 downto 0);
    output, PC_out : out std_logic_vector(15 downto 0)
);
end component;

component writeBackStage port ( 
    clk, rst, pipelineReset, overflowIn : in std_logic;
    inDoWriteBack, doPCWriteBackIn, doOutputUpdateIn : in std_logic;
    inDestRegister : in std_logic_vector(2 downto 0);
    inWriteBackValue, PC_in, CPUinput : in std_logic_vector(15 downto 0);
    outDoWriteBack, doPCWriteBackOut, doBranchReset, overflowOut : out std_logic;
    outDestRegister : out std_logic_vector(2 downto 0);
    outWriteBackValue, PC_out, CPUoutput : out std_logic_vector(15 downto 0)
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
    rstaRAM, rst : in std_logic; -- Reset signal for port A in RAM
    rstbRAM : in std_logic; -- Reset signal for port B in RAM
    regceaRAM : in std_logic; -- Clock enable for last register stage on output data path
    
    -- Port information relating to ROM controller
    rstaROM : in std_logic;
    hexDigitsOut : out std_logic_vector(15 downto 0);
    inputIn : in std_logic_vector(15 downto 0)
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
signal resetDecodeStage, useCustomTest : std_logic;
signal operand2PassthroughDecodeStage : std_logic;
signal overflowOutDecodeStage : std_logic;

signal doWriteBackOutputExecuteStage : std_logic;
signal writeBackRegOutputExecuteStage : std_logic_vector(2 downto 0);
signal readReg1OutExecuteStage : std_logic_vector(2 downto 0);
signal resultExecuteStage : std_logic_vector(15 downto 0);
signal PC_outExecuteStage : std_logic_vector(15 downto 0);
signal doPCWriteBackExecuteStage : std_logic;
signal modeMemoryExecuteStage : std_logic_vector(1 downto 0);
signal resetExecuteStage, doMemoryAccessExecuteStage : std_logic;
signal memoryAddress, memoryWriteValue, memoryAddressExecuteStage :  std_logic_vector(15 downto 0);
signal memoryRW : std_logic;
signal memoryReadValue : std_logic_vector(15 downto 0);
signal CPUoutputExecuteStage : std_logic_vector(15 downto 0);
signal doOutputUpdateOutExecuteStage : std_logic;
signal overflowOutExecuteStage : std_logic;

signal doWriteBackOutputMemoryStage : std_logic := '0';
signal writeBackRegOutputMemoryStage : std_logic_vector(2 downto 0);
signal resultMemoryStage : std_logic_vector(15 downto 0);
signal PC_outMemoryStage : std_logic_vector(15 downto 0);
signal doPCWriteBackMemoryStage : std_logic; 
signal resetMemoryStage : std_logic;
signal doOutputUpdateOutMemoryStage : std_logic;
signal CPUoutputMemoryStage : std_logic_vector(15 downto 0);
signal overflowOutMemoryStage : std_logic;

signal doBranchResetWritebackStage : std_logic;
signal doPCWriteBackOutWritebackStage : std_logic;
signal PC_outWritebackStage : std_logic_vector(15 downto 0);
signal resetWritebackStage : std_logic;
signal doOutputUpdateOutWritebackStage : std_logic;
signal CPUoutputWritebackStage : std_logic_vector(15 downto 0);
signal overflowOutWritebackStage : std_logic;
signal writebackPipelineReset : std_logic;

signal hexDigitsOut : std_logic_vector(15 downto 0);

begin

fetch : fetchStage port map(
    clk=>clk,
    PC_out=>PC_outFetchStage,
    halt=>doBranchResetWritebackStage,
    rst=>rst,
    rstLoad=>rstLoad,
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

resetDecodeStage <= (rst or rstLoad);

decode : decodeStage port map(
    clk => clk,
    rst => resetDecodeStage,
    addNOP => doBranchResetWritebackStage,
    overflowInFromWriteback=>overflowOutWritebackStage,
    overflowOut=>overflowOutDecodeStage,
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
    useCustomTest=>useCustomTest,
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

resetExecuteStage <= (rst or doBranchResetWritebackStage or rstLoad);

--modeALU_stat <= modeALU;
--destRegOutDecode_state <= writeBackRegOutputDecodeStage;
--destRegDoWritebackDecode_stat <= doWriteBackOutputDecodeStage;

execute : executeStage port map(
    clk=>clk,
    rst=>resetExecuteStage,
    overflowInMemoryStage=>overflowOutExecuteStage, 
    overflowInWritebackStage=>overflowOutMemoryStage,
    useALU=>useALU,
    useCustomTest=>useCustomTest,
    useBranch=>useBranch,
    useIO=>useIO,
    useLS=>useLS,
    overflowStatusIn=>overflowOutDecodeStage,
    operand2Passthrough=>operand2PassthroughDecodeStage,
    modeALU=>modeALU,
    readReg1 => readReg1DecodeStage,
    readReg2 => readReg2DecodeStage,
    readReg1Out => readReg1OutExecuteStage,
    modeIO=>modeIO,
    operand1=>operand1, 
    operand2=>operand2,
    doOutputUpdateOut=>doOutputUpdateOutExecuteStage,
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
    overflowOut=>overflowOutExecuteStage,
    modeMemory=>modeMemoryExecuteStage,
    memoryAddress=>memoryAddressExecuteStage,
    outputCPU=>CPUoutputExecuteStage,
    doPCWriteBack=>doPCWriteBackExecuteStage,
    PC_in => PC_outDecodeStage,
    PC_out => PC_outExecuteStage
);

--modeIO_stat <= modeIO;
--useIO_stat <= useIO;
--useALU_stat <= useALU;
--useBranch_stat <= useBranch;
--useLS_stat <= useLS;
--destRegDoWritebackExecute_stat <= doWriteBackOutputExecuteStage;
--destRegOutExecute_state <= writeBackRegOutputExecuteStage;
--executeStageResult_stat <= resultExecuteStage;
--doOutputUpdateOutExecuteStage_stat<=doOutputUpdateOutExecuteStage;

output <= CPUoutputWritebackStage;
resetMemoryStage <= (doBranchResetWritebackStage or rst or rstLoad);

memory : memoryStage Port map(
    clk=>clk, 
    rst=>resetMemoryStage,
    regUsedIn=>readReg1OutExecuteStage,
    doMemoryAccess=>doMemoryAccessExecuteStage,
    destRegIn=>writeBackRegOutputExecuteStage,
    destRegOut=>writeBackRegOutputMemoryStage,
    doWriteBackIn=>doWriteBackOutputExecuteStage,
    doWriteBackOut=>doWriteBackOutputMemoryStage,
    doPCWriteBackIn=>doPCWriteBackExecuteStage,
    doPCWriteBackOut=>doPCWriteBackMemoryStage,
    doOutputUpdateIn=>doOutputUpdateOutExecuteStage,
    doOutputUpdateOut=>doOutputUpdateOutMemoryStage,
    CPUinput=>CPUoutputExecuteStage,
    CPUoutput=>CPUoutputMemoryStage,
    PC_In=>PC_outExecuteStage,
    PC_out=>PC_outMemoryStage,
    memoryAddressFromExecuteStage=>memoryAddressExecuteStage,
    modeMemory=>modeMemoryExecuteStage,
    memoryAddress=>memoryAddress, 
    memoryWriteValue=>memoryWriteValue,
    memoryRW=>memoryRW,
    memoryReadValue=>memoryReadValue,
    input=>resultExecuteStage,
    overflowIn=>overflowOutExecuteStage,
    overflowOut=>overflowOutMemoryStage,
    doWriteBackOutBackIn=>doWriteBackOutputMemoryStage,
    destRegOutBackIn=>writeBackRegOutputMemoryStage,
    outputBackIn=>resultMemoryStage,
    output=>resultMemoryStage
);

--doBranchResetWritebackStage_stat <= doBranchResetWritebackStage;
--doOutputUpdateOutMemoryStage_stat <= doOutputUpdateOutMemoryStage;

writebackPipelineReset <= (rst or rstLoad);

writeback : writeBackStage port map( 
    clk=>clk,
    overflowIn=>overflowOutMemoryStage,
    overflowOut=>overflowOutWritebackStage,
    rst=>doBranchResetWritebackStage,
    pipelineReset=>writebackPipelineReset,
    doOutputUpdateIn=>doOutputUpdateOutMemoryStage,
    CPUinput=>CPUoutputMemoryStage,
    CPUoutput=>CPUoutputWritebackStage,
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
    rst=>resetDecodeStage,
    readOnlyAddress=>fetchAddressFetchStage,
    outputOnReadOnlyChannel=>instruction_inFetchStage,
    addressARAM=>memoryAddress,
    writeContentRAM=>memoryWriteValue,
    outaContentRAM=>memoryReadValue,
    weaRAM=>memoryRW,
    rstaRAM=>'0',
    rstbRAM=>'0',
    regceaRAM=>'1',
    rstaROM=>'0',
    hexDigitsOut=>hexDigitsOut,
    InputIn=>switchInput
);

display : display_controller port map(
    clk=>display_clock, 
    reset=>resetDecodeStage,
    hex3=>hexDigitsOut(15 downto 12), 
    hex2=>hexDigitsOut(11 downto 8), 
    hex1=>hexDigitsOut(7 downto 4),  
    hex0=>hexDigitsOut(3 downto 0),
    an=>an,
    sseg=>sseg
);

end Behavioral;
