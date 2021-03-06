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
        in1, in2 : in std_logic_vector(15 downto 0); -- Input signals
        mode : in std_logic_vector(2 downto 0); -- ALU mode, see comments in process block for values associated to modes
        clk, enable : in std_logic; -- Clk and reset flags
        result : out std_logic_vector(15 downto 0); -- Result of ALU operation
        z, n, overflow, lastInstructionOverflow : out std_logic := '0'
    ); -- zero and negative flag from addition/subtraction operation
end alu;

architecture Behavioral of alu is

-- Component declaration for barrel shifting right
component barrelShiftRight port(
    input : in std_logic_vector(15 downto 0);
    shiftBy : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(15 downto 0));
end component;

-- Component declaration for barrel shifting left
component barrelShiftLeft port(
    input : in std_logic_vector(15 downto 0);
    shiftBy : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(15 downto 0));
end component;

-- Component declaration for addSub operator
component addSub port(
    in1 : in std_logic_vector(15 downto 0);
    in2 : in std_logic_vector(15 downto 0);
    operation : in std_logic_vector(2 downto 0);
    output : out std_logic_vector(15 downto 0);
    overflow : out std_logic);
end component;

-- Component declaration for multiplication operator
component multiplier port(
    multiplicand : in std_logic_vector(15 downto 0);
    multiplier : in std_logic_vector(15 downto 0);
    overflow : out std_logic;
    product : out std_logic_vector(15 downto 0));
end component;

-- Internal signals
signal barrelShiftRightOutput : std_logic_vector(15 downto 0); -- Signal for the output from the right shift operation
signal barrelShiftLeftOutput  : std_logic_vector(15 downto 0); -- Signal for the output from the left shift operation
signal addSubOutput : std_logic_vector(15 downto 0); -- Signal for the output from the add/subtract operation
signal multiplierOutput : std_logic_vector(15 downto 0); -- Signal for the output from the multiply operation
signal addSubOverflow : std_logic; -- Overflow flag for add/subtract operation, 0 = no overflow, 1 = overflow
signal multiplierOverflow : std_logic; -- Overflow flag for multiplier operation

signal overflowCurrent : std_logic := '0'; 


begin

-- Component instantiations
u0 : barrelShiftRight port map(input => in1, shiftBy => in2(3 downto 0), output => barrelShiftRightOutput);
u1 : barrelShiftLeft port map(input => in1, shiftBy => in2(3 downto 0), output => barrelShiftLeftOutput);
u2 : addSub port map(in1 => in1, in2 => in2, operation => mode, output => addSubOutput, overflow => addSubOverflow);
u3 : multiplier port map(multiplicand => in1, multiplier => in2, overflow => multiplierOverflow, product => multiplierOutput);

overflow <= multiplierOverflow or addSubOverflow;

process(clk)
begin
    if rising_edge(clk) then
        -- Determine ALU mode and perform appropriate action
        
        lastInstructionOverflow <= overflowCurrent;
        overflowCurrent <= '0';
        
        case mode(2 downto 0) is
            when "000" => null; -- NOP operation
            when "001" => 
                result <= addSubOutput; -- ADD operation
                overflowCurrent <= addSubOverflow;
            when "010" => 
                result <= addSubOutput; -- SUB operation
                overflowCurrent <= addSubOverflow;
            when "011" => 
                result <= multiplierOutput;-- MUL operation
                overflowCurrent <= multiplierOverflow;
            when "100" => result <= (in1 nand in2); -- NAND operation
            when "101" => result <= barrelShiftLeftOutput; -- SHL operation
            when "110" => result <= barrelShiftRightOutput; -- SHR operation
            when "111" => -- Test operation, test if result is negative or zero
                if (in1 = X"0000") then
                    n <= '0'; -- Not negative
                    z <= '1'; -- Is zero
                elsif (in1(15) = '1') then
                    n <= '1'; -- Is ngative
                    z <= '0'; -- Not zero
                else
                    n <= '0'; -- Not negative
                    z <= '0'; -- Not zero
                end if;
            when others => result <= X"0101"; -- Temporary until all cases are completed 
        end case;
    end if;
end process;

end Behavioral;