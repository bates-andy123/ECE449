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
component addSub port(
    in1 : in std_logic_vector(15 downto 0);
    in2 : in std_logic_vector(15 downto 0);
    operation : in std_logic_vector(2 downto 0);
    output : out std_logic_vector(15 downto 0);
    overflow : out std_logic);
end component;

signal regDispAdder, PC_CounterDispAdder : std_logic_vector(15 downto 0);
signal dispShifted : std_logic_vector(15 downto 0) := X"0000"; 

begin

    dispShifted <=  disp(14 downto 0) & "0"; -- This is the same as multiply by two, but alot less expensive

    adder1 : addSub port map(
        in1 => dispShifted, 
        in2 => reg, 
        operation => "001", 
        output => regDispAdder

    );
    adder2 : addSub port map(
            in1 => dispShifted, 
            in2 => PC_current, 
            operation => "001", 
            output => PC_CounterDispAdder
        );

    with modeBranch select
        calcedPC <=    
            (PC_CounterDispAdder) when "000" | "001" | "010", -- Add the PC counter and disp bits signed extended
            (regDispAdder) when "011" | "100" | "101" | "110", -- Add the reg plus and disp bits signed extended
            (reg) when "111", -- Just put out the register for return
            X"0000" when others; -- Shoul never use

end Behavioral;
