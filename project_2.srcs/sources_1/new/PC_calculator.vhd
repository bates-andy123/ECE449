----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 04:35:54 PM
-- Design Name: 
-- Module Name: PC_calculator - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_calculator is Port (
    disp, reg, PC_current: in std_logic_vector(15 downto 0);
    modeBranch : in std_logic_vector(2 downto 0);
    calcedPC : out std_logic_vector(15 downto 0)
);
end PC_calculator;

architecture Behavioral of PC_calculator is

-- Component declaration for unary operator
component unary port(
    in1 : in std_logic_vector(15 downto 0);
    in2 : in std_logic_vector(15 downto 0);
    operation : in std_logic_vector(2 downto 0);
    output : out std_logic_vector(15 downto 0);
    overflow : out std_logic);
end component;

signal regDispAdder, PC_CounterDispAdder : std_logic_vector(15 downto 0);

begin

    adder1 : unary port map(
        in1 => disp, 
        in2 => reg, 
        operation => "001", 
        output => regDispAdder
        --overflow => unaryOverflow
    );
    adder2 : unary port map(
            in1 => disp, 
            in2 => PC_current, 
            operation => "001", 
            output => PC_CounterDispAdder
            --overflow => unaryOverflow
        );

    with modeBranch select
        calcedPC <=    
            (PC_CounterDispAdder) when "000" | "001" | "010",
            (regDispAdder) when "011" | "100" | "101" | "110",
            (reg) when "111",
            X"0000" when others;

end Behavioral;
