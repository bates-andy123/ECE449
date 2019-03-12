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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dataForwarder is Port (
    doMemoryWriteback, doWritebackWriteback : in std_logic;
    readReg1, readReg2, memoryWritebackDest, writebackWritebackDest : in std_logic_vector(2 downto 0);
    operand1DecodeStage, operand2DecodeStage, memoryWritebackValue, writebackWritebackValue : in std_logic_vector(15 downto 0);
    operand1, operand2 : out std_logic_vector(15 downto 0)
);
end dataForwarder;

architecture Behavioral of dataForwarder is

signal operand1Selector, operand2Selector : std_logic_vector(1 downto 0);

begin

--        with instruction(15 downto 9) select
--        rd_index1 <= 
--            instruction(5 downto 3) when add_op | sub_op | mul_op | nand_op,
--            instruction(8 downto 6) when shl_op | shr_op | test_op | out_op,
--            "000" when others;
        
        
process(readReg1, memoryWritebackDest, writebackWritebackDest) begin
    if(readReg1 = memoryWritebackDest) then 
        if(doMemoryWriteback = '1') then
            operand1 <= memoryWritebackValue;
        else
            operand1 <= operand1DecodeStage;
        end if;
    elsif(readReg1 = writebackWritebackDest) then
        if(doWritebackWriteback = '1') then
            operand1 <= writebackWritebackValue;
        else
            operand1 <= operand1DecodeStage;
        end if;
    else
        operand1 <= operand1DecodeStage;
    end if;
end process;

process(readReg2, memoryWritebackDest, writebackWritebackDest) begin
    if(readReg2 = memoryWritebackDest) then 
        if(doMemoryWriteback = '1') then
            operand2 <= memoryWritebackValue;
        else
            operand2 <= operand2DecodeStage;
        end if;
    elsif(readReg2 = writebackWritebackDest) then
        if(doWritebackWriteback = '1') then
            operand2 <= writebackWritebackValue;
        else
            operand2 <= operand2DecodeStage;
        end if;
    else
        operand2 <= operand2DecodeStage;
    end if;
end process;

end Behavioral;
