----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2019 04:43:18 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
Port(
in1, in2: in std_logic_vector(15 downto 0);
mode: in std_logic_vector(2 downto 0);
clk, rst: in std_logic;

result: out std_logic_vector(15 downto 0);
z, n: out std_logic
);
end alu;

architecture Behavioral of alu is

component barrallel_shift_right port(
    input : in std_logic_vector(15 downto 0);
    shiftBy : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(15 downto 0)   
);
end component;
component barallelShiftLeft port(
    input : in std_logic_vector(15 downto 0);
    shiftBy : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(15 downto 0)   
);
end component;

signal barallelShiftRightOutput : std_logic_vector(15 downto 0);
signal barallelShiftLeftOutput  : std_logic_vector(15 downto 0);

begin

u0 : barrallel_shift_right port map(input=>in1, shiftBy=>in2(3 downto 0), output=>barallelShiftRightOutput);
u1 : barallelShiftLeft port map(input=>in1, shiftBy=>in2(3 downto 0), output=>barallelShiftLeftOutput);

process(clk)
begin
    if(clk = '0' and clk'event) then
        case mode(2 downto 0) is
        when "000" => result <= X"0000";
        when "001" => result <= (in1 + in2);
        when "010" => result <= (in1 - in2);
        when "100" => result <= (in1 nand in2);
        when "101" => result  <= barallelShiftLeftOutput;
        when "110" => result  <= barallelShiftRightOutput;
        when others => result <= X"0101"; 
        end case;
    end if;

end process;


end Behavioral;
