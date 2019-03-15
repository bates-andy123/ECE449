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
    clk, rst, doMemoryAccess : in std_logic;
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0) := "000";
    doWriteBackIn, doPCWriteBackIn : in std_logic;
    doWriteBackOut, doPCWriteBackOut : out std_logic := '0';  
    modeMemory : in std_logic_vector(1 downto 0);
    memoryAddress, memoryWriteValue : out std_logic_vector(15 downto 0);
    memoryRW : out std_logic;
    memoryReadValue : in std_logic_vector(15 downto 0);
    PC_In, memoryAddressFromExecuteStage : in std_logic_vector(15 downto 0);
    input : in std_logic_vector(15 downto 0);
    output, PC_out : out std_logic_vector(15 downto 0)
);
end memoryStage;

architecture Behavioral of memoryStage is

begin

process(clk) begin
    if(rst = '0') then
        if (clk='0') then
            output <= input;
            destRegOut <= destRegIn;
            doWriteBackOut <= doWriteBackIn;
            PC_out <= PC_in;
            doPCWriteBackOut <= doPCWriteBackIn;
            
            if(doMemoryAccess = '1') then
                if(modeMemory = "00") then
                
                elsif(modeMemory = "01") then
                   memoryRW <= '1';
                   memoryAddress <= input;
                   memoryWriteValue <= input;
                end if;
            else 
                memoryRW <= '0'; 
            end if;
        end if;
    else -- rst is currently active
        output <= X"0000";
        doWriteBackOut <= '0';
        destRegOut <= "000";
--        memoryAddress <= X"0000"; 
--        memoryWriteValue <= X"0000";
        PC_out <= X"0000";
--        memoryRW <= '0';
        doPCWriteBackOut <= '0';
    end if;
end process;

end Behavioral;
