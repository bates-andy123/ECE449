----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2019 04:22:44 PM
-- Design Name: 
-- Module Name: dataForwarder - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dataForwarder is Port (
    doExecuteWriteback, doMemoryWriteback, doWritebackWriteback, operand1Passthrough, operand2Passthrough : in std_logic;
    overflowExecuteStage, overflowInMemoryStage, overflowInWritebackStage, overflowIn: in std_logic;
    overflowOut : out std_logic;
    readReg1, readReg2, executeWritebackDest, memoryWritebackDest, writebackWritebackDest : in std_logic_vector(2 downto 0);
    operand1DecodeStage, operand2DecodeStage, executeWritebackValue, memoryWritebackValue, writebackWritebackValue : in std_logic_vector(15 downto 0);
    operand1, operand2 : out std_logic_vector(15 downto 0)
);
end dataForwarder;

architecture Behavioral of dataForwarder is

signal operand1Selector, operand2Selector : std_logic_vector(3 downto 0); -- For the three stages and if it's a passthrough 

-- Are the signals actually writbacking or just floating at unused value
signal operand1UseExecuteWB, operand2UseExecuteWB : std_logic;
signal operand1UseMemoryWB, operand2UseMemoryWB : std_logic;
signal operand1UseWritebackWB, operand2UseWritebackWB : std_logic;

-- Did the destinations match
signal operand1ExecuteDestMatch, operand2ExecuteDestMatch : std_logic;
signal operand1MemoryDestMatch, operand2MemoryDestMatch : std_logic;
signal operand1WritebackDestMatch, operand2WritebackDestMatch : std_logic;

begin

operand1ExecuteDestMatch <= '1' when readReg1 = executeWritebackDest else '0'; -- Does readReg2 match output execute dest stage
operand1MemoryDestMatch <= '1' when readReg1 = memoryWritebackDest else '0'; -- Does readReg2 match output memory dest stage
operand1WritebackDestMatch <= '1' when readReg1 = writebackWritebackDest else '0'; -- Does readReg2 match output memory dest stage

operand1UseExecuteWB <= (operand1ExecuteDestMatch and doExecuteWriteback); -- Check to make sure a writeback was actually happening
operand1UseMemoryWB <= (operand1MemoryDestMatch and doMemoryWriteback); -- Check to make sure a writeback was actually happening
operand1UseWritebackWB <= (operand1WritebackDestMatch and doWritebackWriteback); -- Check to make sure a writeback was actually happening

operand1Selector <= operand1Passthrough & operand1UseExecuteWB & operand1UseMemoryWB & operand1UseWritebackWB; -- Formulate into signal for selector

with operand1Selector select
    operand1 <=
        operand1DecodeStage when "1000" | "1001" | "1010" | "1011" | "1100" | "1101" | "1110" | "1111" | "0000", -- If operand2Passthrough do that
        executeWritebackValue when "0100" | "0101" | "0110" | "0111", -- If not operand2Passthrough and if useExecuteWB
        memoryWritebackValue when "0010" | "0011", -- If not (operand2Passthrough and useExecuteWB) and if useMemoryWB 
        writebackWritebackValue when "0001", -- If not (operand2Passthrough and useExecuteWB and useMemoryWB) and if use useWritebackWB
        operand1DecodeStage when others; -- Should never happen


operand2ExecuteDestMatch <= '1' when readReg2 = executeWritebackDest else '0'; -- Does readReg2 match output execute dest stage
operand2MemoryDestMatch <= '1' when readReg2 = memoryWritebackDest else '0'; -- Does readReg2 match output memory dest stage
operand2WritebackDestMatch <= '1' when readReg2 = writebackWritebackDest else '0'; -- Does readReg2 match writeback execute dest stage

operand2UseExecuteWB <= (operand2ExecuteDestMatch and doExecuteWriteback); -- Check to make sure a writeback was actually happening
operand2UseMemoryWB <= (operand2MemoryDestMatch and doMemoryWriteback); -- Check to make sure a writeback was actually happening
operand2UseWritebackWB <= (operand2WritebackDestMatch and doWritebackWriteback); -- Check to make sure a writeback was actually happening

operand2Selector <= operand2Passthrough & operand2UseExecuteWB & operand2UseMemoryWB & operand2UseWritebackWB; -- Formulate into signal for selector

with operand2Selector select
    operand2 <=
        operand2DecodeStage when "1000" | "1001" | "1010" | "1011" | "1100" | "1101" | "1110" | "1111" | "0000", -- If operand2Passthrough do that
        executeWritebackValue when "0100" | "0101" | "0110" | "0111", -- If not operand2Passthrough and if useExecuteWB
        memoryWritebackValue when "0010" | "0011", -- If not (operand2Passthrough and useExecuteWB) and if useMemoryWB
        writebackWritebackValue when "0001", -- If not (operand2Passthrough and useExecuteWB and useMemoryWB) and if use useWritebackWB
        operand2DecodeStage when others; -- Should never happen

with operand1Selector select
    overflowOut <=
        overflowIn when "1000" | "1001" | "1010" | "1011" | "1100" | "1101" | "1110" | "1111" | "0000", -- If operand2Passthrough do that
        overflowExecuteStage when "0100" | "0101" | "0110" | "0111", -- If not operand2Passthrough and if useExecuteWB
        overflowInMemoryStage when "0010" | "0011", -- If not (operand2Passthrough and useExecuteWB and useMemoryWB) and if use useWritebackWB
        overflowInWritebackStage when "0001", -- Should never happen
        overflowIn when others;

end Behavioral;
