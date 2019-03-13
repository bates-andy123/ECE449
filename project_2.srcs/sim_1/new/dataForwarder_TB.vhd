----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2019 06:17:23 PM
-- Design Name: 
-- Module Name: dataForwarder_TB - Behavioral
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

entity dataForwarder_TB is
--  Port ( );
end dataForwarder_TB;

architecture Behavioral of dataForwarder_TB is

component dataForwarder Port (
    doMemoryWriteback, doWritebackWriteback, operand1Passthrough, operand2Passthrough : in std_logic;
    readReg1, readReg2, memoryWritebackDest, writebackWritebackDest : in std_logic_vector(2 downto 0);
    operand1DecodeStage, operand2DecodeStage, memoryWritebackValue, writebackWritebackValue : in std_logic_vector(15 downto 0);
    operand1, operand2 : out std_logic_vector(15 downto 0)
);
end component;

signal doMemoryWriteback, doWritebackWriteback, operand1Passthrough, operand2Passthrough : std_logic;
signal readReg1, readReg2, memoryWritebackDest, writebackWritebackDest : std_logic_vector(2 downto 0);
signal operand1DecodeStage, operand2DecodeStage, memoryWritebackValue, writebackWritebackValue : std_logic_vector(15 downto 0);
signal operand1, operand2 : std_logic_vector(15 downto 0);

begin

forwarder : dataForwarder port map(
    operand1Passthrough=>operand1Passthrough,
    operand2Passthrough=>operand2Passthrough,
    doMemoryWriteback=>doMemoryWriteback, 
    doWritebackWriteback=>doWritebackWriteback,
    readReg1=>readReg1, 
    readReg2=>readReg2, 
    memoryWritebackDest=>memoryWritebackDest, 
    writebackWritebackDest=>writebackWritebackDest,
    operand1DecodeStage=>operand1DecodeStage, 
    operand2DecodeStage=>operand2DecodeStage, 
    memoryWritebackValue=>memoryWritebackValue, 
    writebackWritebackValue=>writebackWritebackValue,
    operand1=>operand1,
    operand2=>operand2
);

process begin
    doMemoryWriteback <= '1';
    doWritebackWriteback <= '1';
    operand1DecodeStage <= X"A45B";
    memoryWritebackValue <= X"BBBB";
    writebackWritebackValue <= X"AAAA";
    operand1Passthrough<='0';
    readReg1<="010";
    memoryWritebackDest<="010";
    writebackWritebackDest<="010";
    
    wait for 10us;
    operand1DecodeStage <= X"5049";
    doMemoryWriteback <= '0';
    wait for 10us;
    operand1DecodeStage <= X"C7A1";
    doMemoryWriteback <= '0';
    wait for 10us;
    operand1DecodeStage <= X"9F48";
    operand1Passthrough <= '0';
    wait;
    
end process;


end Behavioral;
