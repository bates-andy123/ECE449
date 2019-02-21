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
    clk : in std_logic;
    inDoWriteBack : in std_logic;
    inDestRegister : in std_logic_vector(2 downto 0);
    inWriteBackValue : in std_logic_vector(15 downto 0);
    outDoWriteBack : out std_logic;
    outDestRegister : out std_logic_vector(2 downto 0);
    outWriteBackValue : out std_logic_vector(15 downto 0)
);
end writeBackStage;

architecture Behavioral of writeBackStage is

signal inDoWriteBackBuffer : std_logic;
signal inDestRegisterBuffer : std_logic_vector(2 downto 0);
signal inWriteBackValueBuffer : std_logic_vector(15 downto 0);
    

begin

process(clk) begin
    if rising_edge(clk) then
       inDoWriteBackBuffer<=inDoWriteBack;
       inDestRegisterBuffer<=inDestRegister;
       inWriteBackValueBuffer<=inWriteBackValue;
    elsif falling_edge(clk) then
        outDoWriteBack<=inDoWriteBackBuffer;
        outDestRegister<=inDestRegisterBuffer;
        outWriteBackValue<=inWriteBackValueBuffer;
    end if;
end process;

end Behavioral;
