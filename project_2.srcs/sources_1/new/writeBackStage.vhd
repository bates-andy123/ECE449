----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 07:21:21 PM
-- Design Name: 
-- Module Name: writeBackStage - Behavioral
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

entity writeBackStage is Port ( 
    clk, rst, pipelineReset, overflowIn : in std_logic;
    inDoWriteBack, doPCWriteBackIn, doOutputUpdateIn : in std_logic;
    inDestRegister : in std_logic_vector(2 downto 0);
    inWriteBackValue, PC_in, CPUinput : in std_logic_vector(15 downto 0);
    outDoWriteBack, doPCWriteBackOut, doBranchReset, overflowOut : out std_logic := '0';
    outDestRegister : out std_logic_vector(2 downto 0) := "000";
    outWriteBackValue, PC_out, CPUoutput : out std_logic_vector(15 downto 0) := X"0000"
);
end writeBackStage;

architecture Behavioral of writeBackStage is

signal inDoWriteBackBuffer : std_logic;
signal inDestRegisterBuffer : std_logic_vector(2 downto 0);
signal inWriteBackValueBuffer : std_logic_vector(15 downto 0);
    

begin

process(clk) begin
    if (pipelineReset='0') then
        if (clk='0') then
            if doOutputUpdateIn = '1' then
                CPUoutput <= CPUinput;
--            else
--                CPUoutput <= X"0000";
            end if;
        end if;
    else
        CPUoutput <= X"0000";
    end if;
end process;

process(clk) begin
    if falling_edge(clk) then
        if (rst = '0' and pipelineReset='0') then 
            outDoWriteBack<=inDoWriteBack;
            outDestRegister<=inDestRegister;
            outWriteBackValue<=inWriteBackValue;
            PC_out<=PC_in;
            overflowOut<=overflowIn;
            doPCWriteBackOut<=doPCWriteBackIn;
            doBranchReset<=doPCWriteBackIn;
            
        else
            overflowOut<='0';
            outDoWriteBack<='0';
            outDestRegister<="000";
            outWriteBackValue<=X"0000";
            PC_out<=X"0000";
            doPCWriteBackOut<='0';
            doBranchReset<='0';
        end if;
    end if;
end process;

end Behavioral;
