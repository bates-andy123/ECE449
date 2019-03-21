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
use ieee.numeric_std.all;

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
    useIO, useLS, operand2Passthrough : in std_logic;
    modeALU : in std_logic_vector(2 downto 0);
    readReg1, readReg2, memoryDestReg, writebackDestReg : in std_logic_vector(2 downto 0);
    modeIO : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut : out std_logic_vector(2 downto 0) := "000";
    doWriteBackIn, useMemoryDestValue, useWritebackDestValue : in std_logic;
    doWriteBackOut, doMemoryAccess, doOutputUpdateOut : out std_logic := '0';
    doPCWriteBack : out std_logic := '0';
    result : out std_logic_vector(15 downto 0) := X"0000";
    outputCPU : out std_logic_vector(15 downto 0) := X"0000";
    modeMemory : out std_logic_vector(1 downto 0) := "00";
    PC_in, memoryDestValue, writebackDestValue : in std_logic_vector(15 downto 0);
    PC_out, memoryAddress : out std_logic_vector(15 downto 0) := X"0000"
);
end executeStage;

architecture Behavioral of executeStage is

component dataForwarder Port (
    doMemoryWriteback, doWritebackWriteback, operand1Passthrough, operand2Passthrough : in std_logic;
    readReg1, readReg2, memoryWritebackDest, writebackWritebackDest : in std_logic_vector(2 downto 0);
    operand1DecodeStage, operand2DecodeStage, memoryWritebackValue, writebackWritebackValue : in std_logic_vector(15 downto 0);
    operand1, operand2 : out std_logic_vector(15 downto 0)
);
end component;

component alu port(
    in1, in2 : in std_logic_vector(15 downto 0); -- Input signals
    mode : in std_logic_vector(2 downto 0); -- ALU mode, see comments in process block for values associated to modes
    clk, enable : in std_logic; -- Clk and reset flags
    result : out std_logic_vector(15 downto 0); -- Result of ALU operation
    z, n : out std_logic
);
end component;

component PC_calculator is Port (
    disp, reg, PC_current: in std_logic_vector(15 downto 0);
    modeBranch : in std_logic_vector(2 downto 0);
    calcedPC : out std_logic_vector(15 downto 0)
);
end component;

signal resultALU : std_logic_vector(15 downto 0);
signal operand1Buffer, operand2Buffer : std_logic_vector(15 downto 0) := X"0000";
signal z, n :  std_logic := '0';

signal resultCalcedPC : std_logic_vector(15 downto 0);

constant mul_op : std_logic_vector(6 downto 0)  := "0000011";

begin

u1:alu port map(
    in1=>operand1Buffer, 
    in2=>operand2Buffer, 
    mode=>modeALU, 
    clk=>clk, 
    enable=>useALU,
    result=>resultALU,
    n=>n, 
    z=>z
);

u2 : PC_calculator Port map(
    disp=>operand1, 
    reg=>operand2, 
    PC_current=>PC_in,
    modeBranch=>modeALU,
    calcedPC=>resultCalcedPC
);

u3 : dataForwarder port map(
    doMemoryWriteback=>useMemoryDestValue, 
    doWritebackWriteback=>useWritebackDestValue, 
    operand1Passthrough=>'0', 
    operand2Passthrough=>operand2Passthrough,
    readReg1=>readReg1, 
    readReg2=>readReg2, 
    memoryWritebackDest=>memoryDestReg, 
    writebackWritebackDest=>writebackDestReg,
    operand1DecodeStage=>operand1, 
    operand2DecodeStage=>operand2, 
    memoryWritebackValue=>memoryDestValue, 
    writebackWritebackValue=>writebackDestValue,
    operand1=>operand1Buffer, 
    operand2=>operand2Buffer
);

modeMemory <= modeALU(1 downto 0);

process(rst, clk) begin --modeALU, useBranch, useIO, useLS, useBranch) begin
    if rst = '1' then
        destRegOut <= "000";
        doWriteBackOut <= '0';
    --elsif falling_edge(clk) then
    elsif falling_edge(clk) then
        doWriteBackOut <= '0';
    
        if useBranch = '1' then
            if modeALU = "110" then
                doWriteBackOut <= '1';
                destRegOut <= "111";
            end if;
        elsif useALU='1' then
            destRegOut <= destRegIn;
            doWriteBackOut <= doWriteBackIn;
        elsif useIO='1' then
            destRegOut <= destRegIn;
            doWriteBackOut <= doWriteBackIn;
        elsif useLS='1' then
            case modeALU(1 downto 0) is
                when "00" => -- load
                    destRegOut <= destRegIn;
                    doWriteBackOut <= '1';
                when "01" => -- store
                    destRegOut <= "000";
                    doWriteBackOut <= '1';
                when "10" => -- load_imm
                    destRegOut <= "111";
                    doWriteBackOut <= '1';
                when "11" => -- mov
                    destRegOut <= destRegIn;
                    doWriteBackOut <= '1';
                when others =>
                    destRegOut <= "000";
                    doWriteBackOut <= '0';
            end case;
        end if;
    end if;  
end process;

process(clk) begin
    if rst='0' then
        if falling_edge(clk) then
            doPCWriteBack <= '0';
            PC_out <= PC_in; 
            doMemoryAccess <= '0';
            doOutputUpdateOut <= '0';
            
            if useBranch = '1' then
                case modeALU(2 downto 0) is
                    when "000" | "011" => 
                        doPCWriteBack <= '1'; -- NOP operation
                        PC_out <= resultCalcedPC;
                    when "001" | "100" => 
                        if(n='1') then
                            doPCWriteBack <= '1';
                            PC_out <= resultCalcedPC;
                        else
                            doPCWriteBack <= '0';
                            PC_out <= PC_in;
                        end if;
                    when "010" | "101" => 
                        if(z='1') then
                            doPCWriteBack <= '1';
                            PC_out <= resultCalcedPC;
                        else
                            doPCWriteBack <= '0';
                            PC_out <= PC_in;
                        end if;
                    when "110" =>
                        doPCWriteBack <= '1'; -- NOP operation
                        PC_out <= resultCalcedPC;
                        
                        result <= std_logic_vector(unsigned(PC_in) + 2);
                    when "111" =>
                        doPCWriteBack <= '1'; -- NOP operation
                        PC_out <= operand2;
                    when others => doPCWriteBack <= '0'; -- Temporary until all cases are completed 
                end case;
            
            elsif useALU = '1' then 
                result <= resultALU;
                --doWriteBackOut <= doWriteBackIn; 
                  
            elsif useIO = '1' then
                --doWriteBackOut <= doWriteBackIn;
                if modeIO = '1' then  -- Input, write the operand rand to memory
                    result <= operand1;
                else
                    outputCPU <= operand1Buffer;
                    doOutputUpdateOut <= '1';
                end if;
                
            elsif useLS = '1' then 
                doMemoryAccess <= '1';
                case modeALU(1 downto 0) is
                    when "00" => -- load
                        --doWriteBackOut <= '1';
                        memoryAddress <= operand1Buffer;
                    when "01" => -- store
                        result <= operand2Buffer;
                        memoryAddress <= operand1Buffer;
                        --doWriteBackOut <= '0';
                    when "10" => -- load_imm
                        --doWriteBackOut<='1';
                        if operand1(8) = '1' then 
                            result <= (operand1(7 downto 0) & operand2Buffer(7 downto 0));
                        else 
                            result <= (operand2Buffer(15 downto 8) & operand1(7 downto 0));
                        end if;
                    when "11" => -- mov
                        result <= operand1Buffer;
                       -- doWriteBackOut<='1';
                    when others =>
                        doMemoryAccess <= '0';
                        --doWriteBackOut <= '0';
                  end case;
            end if;

        end if;
    else 
        --doWriteBackOut <= '0';
        doPCWriteBack <= '0';
        PC_out <= X"0000";
        result <= X"0000";
        outputCPU <= X"0000";
        doOutputUpdateOut<='0';
    end if;
end process;

end Behavioral;
