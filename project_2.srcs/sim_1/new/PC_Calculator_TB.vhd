----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 04:36:30 PM
-- Design Name: 
-- Module Name: PC_Calculator_TB - Behavioral
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

entity PC_Calculator_TB is
--  Port ( );
end PC_Calculator_TB;

architecture Behavioral of PC_Calculator_TB is

component PC_calculator is Port (
    disp, reg, PC_current: in std_logic_vector(15 downto 0);
    modeBranch : in std_logic_vector(2 downto 0);
    calcedPC : out std_logic_vector(15 downto 0)
);
end component;

signal operand1, operand2, PC_in : std_logic_vector(15 downto 0) := X"0000";
signal modeALU : std_logic_vector(2 downto 0) := "000";
signal resultCalcedPC : std_logic_vector(15 downto 0);

begin

u2 : PC_calculator Port map(
    disp=>operand1, 
    reg=>operand2, 
    PC_current=>PC_in,
    modeBranch=>modeALU,
    calcedPC=>resultCalcedPC
);

process begin 

    wait for 10us;
    operand1 <= X"0002";
    operand2 <= X"0003";
    PC_in <= X"0100";
    modeALU <= "000";
    
    wait for 10us;
    modeALU <= "001";
    wait for 10us;
    modeALU <= "010";
    wait for 10us;
    modeALU <= "011";
    wait for 10us;
    modeALU <= "100";
    wait for 10us;
    modeALU <= "101";
    wait for 10us;
    modeALU <= "110";
    wait for 10us;
    modeALU <= "111";
    wait for 10us;
    
    operand1 <= X"FFFE";
    operand2 <= X"0003";
    
    wait for 10us;
    modeALU <= "001";
    wait for 10us;
    modeALU <= "010";
    wait for 10us;
    modeALU <= "011";
    wait for 10us;
    modeALU <= "100";
    wait for 10us;
    modeALU <= "101";
    wait for 10us;
    modeALU <= "110";
    wait for 10us;
    modeALU <= "111";
    wait;

end process;

end Behavioral;
