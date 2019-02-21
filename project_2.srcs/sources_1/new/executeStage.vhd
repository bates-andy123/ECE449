----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 01:56:39 PM
-- Design Name: 
-- Module Name: executeStage - Behavioral
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

entity executeStage is Port(
    clk : in std_logic;
    useALU : in std_logic;
    useIO : in std_logic;
    modeALU : in std_logic_vector(2 downto 0);
    modeIO : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    inputCPU : in std_logic_vector(15 downto 0);
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0);
    doWriteBackIn : in std_logic;
    doWriteBackOut : out std_logic;
    result : out std_logic_vector(15 downto 0) := X"0000";
    outputCPU : out std_logic_vector(15 downto 0);
    z, n: out std_logic;
    execFreezePipe : out std_logic
);
end executeStage;

architecture Behavioral of executeStage is

component alu port(
    in1, in2: in std_logic_vector(15 downto 0);
    mode: in std_logic_vector(2 downto 0);
    mulFlag : out std_logic; -- Flag to check if multiplication is ongoing
    clk, rst: in std_logic;
    result: out std_logic_vector(15 downto 0);
    z, n: out std_logic
);
end component;

signal rstALU : std_logic := '0';
signal resultALU : std_logic_vector(15 downto 0);

constant mul_op : std_logic_vector(6 downto 0)  := "0000011";

begin

u1:alu port map(
    in1=>operand1, 
    in2=>operand2, 
    mode=>modeALU , 
    clk=>clk, 
    rst=>rstALU,
    result=>resultALU,
    n=>n, 
    z=>z
);

destRegOut <= destRegIn;
doWriteBackOut <= doWriteBackIn;

process(clk) begin
    if rising_edge(clk) then
        if useALU = '1' then 
            rstALU <= '0';
            if (modeALU = "011") then --multiply
                execFreezePipe <= '1';
            end if;
        elsif useIO = '1' then
            if modeIO = '1' then  -- Input, write the operand rand to memory
                result <= inputCPU;
            else
                outputCPU <= operand1;
            end if;
        else

        end if;
    end if;
end process;

end Behavioral;
