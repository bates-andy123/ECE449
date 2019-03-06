----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 11:24:07 AM
-- Design Name: 
-- Module Name: dataHazardPredictor - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dataHazardPredictor is Port(
    halt : out std_logic := '0';
    writeReg, readReg1, readReg2 : in std_logic_vector(2 downto 0);
    clk, rst, isWriteInstruction : in std_logic
);
end dataHazardPredictor;

architecture Behavioral of dataHazardPredictor is

-- 3 leftmost digits are used for register specification, rightmost digit is used to indicate write register used in that stage
signal writeRegInExecute, writeRegInMemory, writeRegInWriteBack : std_logic_vector(3 downto 0) := "1000";

begin
    --halt <= isHalted;

    process(clk) 
        variable isHalted : boolean := false;
        begin
        if (rst = '0') then 
            if falling_edge(clk) then 
                if(
                    (writeRegInExecute = ("0" & readReg1)) or (writeRegInExecute = ("0" & readReg2)) or
                    (writeRegInMemory = ("0" & readReg1)) or (writeRegInMemory = ("0" & readReg2)) or 
                    (writeRegInWriteBack = ("0" & readReg1)) or (writeRegInWriteBack = ("0" & readReg2))
                ) then 
                    isHalted := true;
                else
                    isHalted := false;
                end if;
                
                writeRegInWriteBack <= writeRegInMemory;
                writeRegInMemory <= writeRegInExecute;
                if (isWriteInstruction = '1' and isHalted = false) then 
                    writeRegInExecute <= ("0" & writeReg);
                else
                    writeRegInExecute <= "1000"; -- The leading one indicates that it is not used
                end if;
                if(isHalted) then 
                    halt<='1';
                else
                    halt<='0';
                end if;
            end if;
         else --rst is active 
            isHalted := false;
            writeRegInExecute, writeRegInMemory, writeRegInWriteBack <= "1000";
            halt <= '0';
         end if;        
    end process;
    
end Behavioral;
