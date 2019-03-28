----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 10:55:58 AM
-- Design Name: 
-- Module Name: memoryStage - Behavioral
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

entity memoryStage is Port (
    clk, rst, doMemoryAccess, overflowIn : in std_logic;
    destRegIn, regUsedIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0) := "000";
    doWriteBackIn, doPCWriteBackIn, doOutputUpdateIn : in std_logic;
    doWriteBackOut, doPCWriteBackOut, doOutputUpdateOut, overflowOut : out std_logic := '0';  
    modeMemory : in std_logic_vector(1 downto 0);
    memoryAddress, memoryWriteValue, CPUoutput : out std_logic_vector(15 downto 0);
    memoryRW : out std_logic;
    memoryReadValue, CPUinput : in std_logic_vector(15 downto 0);
    PC_In, memoryAddressFromExecuteStage : in std_logic_vector(15 downto 0);
    input : in std_logic_vector(15 downto 0);
    output, PC_out : out std_logic_vector(15 downto 0)
);
end memoryStage;

architecture Behavioral of memoryStage is

signal PC_WritebackSet : std_logic := '0';

signal outputBuffer : std_logic_vector(15 downto 0);
signal doWriteBackOutBuffer : std_logic;
signal destRegOutBuffer : std_logic_vector(2 downto 0);
signal memoryModeIsStore : std_logic;

signal destRegOutMatchIn : std_logic;

signal dataForwardNeeded : std_logic;

begin

process(rst, clk) begin
    if rst='1' then 
        doPCWriteBackOut <= '0';
        PC_out <= X"0000";
        doOutputUpdateOut<='0';
        CPUoutput <= X"0000";
    elsif rising_edge(clk) then
        doOutputUpdateOut <= doOutputUpdateIn;
        PC_out <= PC_in;
        doPCWriteBackOut <= doPCWriteBackIn;
        CPUoutput <= CPUinput;
    end if;
end process;

--    with instruction(15 downto 9) select
--        useALU <= 
--            '1' when nop_op | add_op | sub_op | mul_op | nand_op | shl_op | shr_op | test_op,
--            '0' when others;
            
            
    memoryModeIsStore <= '1' when modeMemory = "01" else '0';
    destRegOutMatchIn <= '1' when destRegOutBuffer = regUsedIn else '0';
    
    dataForwardNeeded <= doWriteBackOutBuffer and destRegOutMatchIn and memoryModeIsStore;
    
    with dataForwardNeeded select
        memoryWriteValue <= 
            outputBuffer when '1',
            input when others;   

    memoryAddress <= memoryAddressFromExecuteStage;
    --memoryWriteValue <= input;
    
    with modeMemory select
        memoryRW <= 
            '1' when "01",
            '0' when others;

process(clk) begin
    if(rst = '0') then
        if (clk='0') then
            
            output <= input;
            destRegOut <= destRegIn;
            overflowOut <= overflowIn;
            doWriteBackOut <= doWriteBackIn;
            
            doWriteBackOutBuffer <= doWriteBackIn;
            destRegOutBuffer <= destRegIn;
            outputBuffer <= input;
            
            if(PC_WritebackSet = '0' and doPCWriteBackIn = '0') then
                
                if(doMemoryAccess = '1') then
                    if(modeMemory = "00") then
                        output <=  memoryReadValue;
                        outputBuffer <= memoryReadValue;
                    end if;
                else 

                end if;
            else
                PC_WritebackSet <= '1'; -- If the condition did not pass either of:
                                        --doPCWriteBackIn exclusively equals 1 thus set PC_WritebackSet <= '1'
                                        --or PC_WritebackSet='1' and PC_WritebackSet <='1' has no effect
            end if;
         else
            
        end if;
    else -- rst is currently active
        overflowOut<='0';
        PC_WritebackSet <= '0';
        output <= X"0000";
        doWriteBackOut <= '0';
        destRegOut <= "000";

    end if;
end process;

end Behavioral;
