----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 05:10:59 PM
-- Design Name: 
-- Module Name: addSub - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addSub is
    Port (
        in1 : in std_logic_vector(15 downto 0);
        in2 : in std_logic_vector(15 downto 0);
        operation : in std_logic_vector(2 downto 0);
        output : out std_logic_vector(15 downto 0);
        overflow : out std_logic);
end addSub;

architecture Behavioral of addSub is

-- Signal declarations
signal resultTemp : std_logic_vector(15 downto 0); -- Temporary signal storage for decision making

begin
    -- Store results in temporary signal
    resultTemp <=
        (in1 + in2) when (operation = "001") -- Addition when mode was set to 001
        else (in1 - in2); -- Otherwise must have been subtraction operation

    -- Check for overflow
    overflow <=
        '1' when (operation = "001" and (in1(15) = in2(15)) and (resultTemp(15) /= in1(15))) -- Overflow when operation is addition and MSB mismatch
        or (operation = "010" and (in1(15) = in2(15)) and (resultTemp(15) /= in1(15))) -- Overflow when operation is subtraction and MSB mismatch
        else '0'; -- Otherwise no overflow

    output <= resultTemp; -- Output the result
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity unsignedAddition is
    Port (
        in1 : in std_logic_vector(31 downto 0);
        in2 : in std_logic_vector(31 downto 0);
        output : out std_logic_vector(31 downto 0));
end unsignedAddition;

architecture Behavioral of unsignedAddition is

begin
    output <= in1 + in2;
end Behavioral;