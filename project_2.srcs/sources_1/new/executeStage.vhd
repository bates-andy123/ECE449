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
    clk, rst : in std_logic;
    useALU, useBranch : in std_logic;
    useIO : in std_logic;
    modeALU : in std_logic_vector(2 downto 0);
    modeIO : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0) := "000";
    doWriteBackIn : in std_logic;
    doWriteBackOut : out std_logic := '0';
    doPCWriteBack : out std_logic := '0';
    result : out std_logic_vector(15 downto 0) := X"0000";
    outputCPU : out std_logic_vector(15 downto 0) := X"0000";
    PC_in : in std_logic_vector(15 downto 0);
    PC_out : out std_logic_vector(15 downto 0) := X"0000"
);
end executeStage;

architecture Behavioral of executeStage is

component alu port(
    in1, in2 : in std_logic_vector(15 downto 0); -- Input signals
    mode : in std_logic_vector(2 downto 0); -- ALU mode, see comments in process block for values associated to modes
    clk, rst : in std_logic; -- Clk and reset flags
    result : out std_logic_vector(15 downto 0); -- Result of ALU operation
    z, n : out std_logic
);
end component;

signal resultALU : std_logic_vector(15 downto 0);
signal operand1Buffer : std_logic_vector(15 downto 0) := X"0000";
signal z, n :  std_logic := '0';

constant mul_op : std_logic_vector(6 downto 0)  := "0000011";

begin

u1:alu port map(
    in1=>operand1, 
    in2=>operand2, 
    mode=>modeALU , 
    clk=>clk, 
    rst=>rst,
    result=>resultALU,
    n=>n, 
    z=>z
);



process(clk) begin
    if rst='0' then
        if falling_edge(clk) then
            if useBranch = '1' then
                case modeALU(2 downto 0) is
                    when "000" | "011" => doPCWriteBack <= '1'; -- NOP operation
                    when "001" | "100" => 
                        if(n='1') then
                            doPCWriteBack <= '1';
                        else
                            doPCWriteBack <= '0';
                        end if;
                    when "010" | "101" => 
                        if(z='1') then
                            doPCWriteBack <= '1';
                        else
                            doPCWriteBack <= '0';
                        end if;
                    when others => doPCWriteBack <= '0'; -- Temporary until all cases are completed 
                end case;
            else 
                doPCWriteBack <= '0';
            end if;
            if useALU = '1' then 
                result <= resultALU;
                
            elsif useIO = '1' then
                if modeIO = '1' then  -- Input, write the operand rand to memory
                    result <= operand1;
                else
                    outputCPU <= operand1;
                end if;
            else -- useBranch
                
            end if;
            destRegOut <= destRegIn;
            doWriteBackOut <= doWriteBackIn;
            operand1Buffer <= operand1;
        end if;
    else 
        destRegOut <= "000";
        doWriteBackOut <= '0';
        result <= X"0000";
        outputCPU <= X"0000";
    end if;
end process;

end Behavioral;
