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
    clk, rst, overflowExecuteStage, overflowInMemoryStage, overflowInWritebackStage : in std_logic;
    useALU, useBranch, useCustomTest : in std_logic;
    useIO, useLS, operand2Passthrough : in std_logic;
    modeALU : in std_logic_vector(2 downto 0);
    readReg1, readReg2, executeDestReg, memoryDestReg, writebackDestReg : in std_logic_vector(2 downto 0);
    modeIO, overflowStatusIn : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    destRegIn : in std_logic_vector(2 downto 0);
    destRegOut, readReg1Out : out std_logic_vector(2 downto 0) := "000";
    doWriteBackIn, useExecuteDestValue, useMemoryDestValue, useWritebackDestValue : in std_logic;
    doWriteBackOut, doMemoryAccess, doOutputUpdateOut : out std_logic := '0';
    doPCWriteBack, overflowOut : out std_logic := '0';
    result : out std_logic_vector(15 downto 0) := X"0000";
    outputCPU : out std_logic_vector(15 downto 0) := X"0000";
    modeMemory : out std_logic_vector(1 downto 0) := "00";
    PC_in, executeDestValue, memoryDestValue, writebackDestValue : in std_logic_vector(15 downto 0);
    PC_out, memoryAddress : out std_logic_vector(15 downto 0) := X"0000"
);
end executeStage;

architecture Behavioral of executeStage is

component dataForwarder Port (
    doExecuteWriteback, doMemoryWriteback, doWritebackWriteback, operand1Passthrough, operand2Passthrough : in std_logic;
    overflowExecuteStage, overflowInMemoryStage, overflowInWritebackStage, overflowIn: in std_logic;
    overflowOut : out std_logic;
    readReg1, readReg2, executeWritebackDest, memoryWritebackDest, writebackWritebackDest : in std_logic_vector(2 downto 0);
    operand1DecodeStage, operand2DecodeStage, executeWritebackValue, memoryWritebackValue, writebackWritebackValue : in std_logic_vector(15 downto 0);
    operand1, operand2 : out std_logic_vector(15 downto 0)
);
end component;

component alu port(
    in1, in2 : in std_logic_vector(15 downto 0); -- Input signals
    mode : in std_logic_vector(2 downto 0); -- ALU mode, see comments in process block for values associated to modes
    clk, enable : in std_logic; -- Clk and reset flags
    result : out std_logic_vector(15 downto 0); -- Result of ALU operation
    z, n, overflow, lastInstructionOverflow : out std_logic
);
end component;

component PC_calculator is Port ( -- We always we always 
    disp, reg, PC_current: in std_logic_vector(15 downto 0);
    modeBranch : in std_logic_vector(2 downto 0);
    calcedPC : out std_logic_vector(15 downto 0)
);
end component;

signal dataForwarderOverflow : std_logic; -- Did the data forwarder current have an overflow

signal resultALU : std_logic_vector(15 downto 0); -- The ALU result
signal operand1Buffer, operand2Buffer : std_logic_vector(15 downto 0) := X"0000"; -- Hold data forwarder results
signal z, n, aluOverflow :  std_logic := '0'; -- resutls from ALU

signal resultCalcedPC : std_logic_vector(15 downto 0); -- result fo the CalcedPC

signal test2Active : std_logic := '0'; -- Is test2 current active from test condition 

begin


u1:alu port map(
    in1=>operand1Buffer, 
    in2=>operand2Buffer, 
    mode=>modeALU, 
    clk=>clk, 
    enable=>useALU,
    result=>resultALU,
    n=>n, 
    z=>z,
    overflow=>aluOverflow
);

u2 : PC_calculator Port map( -- Use this to always calculate what the PC would be due to based on mode
    disp=>operand1, 
    reg=>operand2Buffer, 
    PC_current=>PC_in,
    modeBranch=>modeALU, -- modeALU is used to indicate the lowest three bytes of the opcode
    calcedPC=>resultCalcedPC -- updated asyncrhonous 
);

u3 : dataForwarder port map( -- Used for data forwarding
    doExecuteWriteback=>useExecuteDestValue,
    doMemoryWriteback=>useMemoryDestValue, 
    doWritebackWriteback=>useWritebackDestValue, 
    operand1Passthrough=>'0', 
    operand2Passthrough=>operand2Passthrough,
    overflowExecuteStage=>overflowExecuteStage,
    overflowInMemoryStage=>overflowInMemoryStage, 
    overflowInWritebackStage=>overflowInWritebackStage, 
    overflowIn=>overflowStatusIn,
    overflowOut=>dataForwarderOverflow,
    readReg1=>readReg1, 
    readReg2=>readReg2, 
    executeWritebackDest=>executeDestReg,
    memoryWritebackDest=>memoryDestReg, 
    writebackWritebackDest=>writebackDestReg,
    operand1DecodeStage=>operand1, 
    operand2DecodeStage=>operand2, 
    executeWritebackValue=>executeDestValue,
    memoryWritebackValue=>memoryDestValue, 
    writebackWritebackValue=>writebackDestValue,
    operand1=>operand1Buffer, 
    operand2=>operand2Buffer
);

--modeMemory <= modeALU(1 downto 0);

process(rst, clk) begin --modeALU, useBranch, useIO, useLS, useBranch) begin
    if rst = '1' then -- Reset everything back to it's ground state
        destRegOut <= "000";
        doWriteBackOut <= '0';
        overflowOut<='0';
        modeMemory<="00";
    elsif falling_edge(clk) then
        doWriteBackOut <= '0';
        modeMemory <= "00";
        overflowOut<='0';
    
        if useBranch = '1' then
            if modeALU = "110" then
                doWriteBackOut <= '1';
                destRegOut <= "111";
            end if;
        elsif useALU='1' then
            destRegOut <= destRegIn;
            doWriteBackOut <= doWriteBackIn;
            if (modeALU = "001") or (modeALU = "010") or (modeALU = "011") then
                overflowOut<=aluOverflow;
            end if;
        elsif useIO='1' then
            destRegOut <= destRegIn;
            doWriteBackOut <= doWriteBackIn;
        elsif useLS='1' then
            case modeALU(1 downto 0) is
                when "00" => -- load
                    memoryAddress <= operand1Buffer;
                    modeMemory<="00";
                    destRegOut <= destRegIn;
                    doWriteBackOut <= '1';
                when "01" => -- store
                    memoryAddress <= operand1Buffer;
                    modeMemory<="01";
                    destRegOut <= "000";
                    doWriteBackOut <= '0';
                    
                when "10" => -- load_imm
                    modeMemory<="10";
                    destRegOut <= "111";
                    doWriteBackOut <= '1';
                when "11" => -- mov
                    modeMemory<="11";
                    destRegOut <= destRegIn;
                    doWriteBackOut <= '1';
                when others =>
                    modeMemory<="00";
                    destRegOut <= "000";
                    doWriteBackOut <= '0';
            end case;
        end if;
    end if;  
end process;

process(clk) begin
    if rst='0' then
        if falling_edge(clk) then
            if useALU = '1' then 
                result <= resultALU;
            elsif useBranch = '1' then
                if modeALU = "110" then
                    result <= std_logic_vector(unsigned(PC_in) + 2);
                end if;
            elsif useIO = '1' then
                if modeIO = '1' then
                     result <= operand1;
                 end if;
            elsif useLS = '1' then
                case modeALU(1 downto 0) is
                    when "01" => -- store
                        result <= operand2Buffer;
            
                    when "10" => -- load_imm
                        if operand1(8) = '1' then 
                            result <= (operand1(7 downto 0) & operand2Buffer(7 downto 0));
                        else 
                            result <= (operand2Buffer(15 downto 8) & operand1(7 downto 0));
                        end if;
                    when "11" => -- mov
                        result <= operand1Buffer;
                    when others =>
                        null;
                  end case;
            end if;
        end if;
    else
        result <= X"0000";
    end if;
end process;

process(clk) begin
    if rst = '0' then
        if falling_edge(clk) then
            readReg1Out <= readReg2;
        end if;
    else
        readReg1Out <= "000";
    end if;
end process;

process(clk) begin
    if rst='0' then
        if falling_edge(clk) then
            doPCWriteBack <= '0';
            PC_out <= PC_in; 
            doMemoryAccess <= '0';
            doOutputUpdateOut <= '0';
            
            
            if useCustomTest = '1' then
                if dataForwarderOverflow='1' then
                    test2Active<='1';
                end if;
            elsif useBranch = '1' then
                case modeALU(2 downto 0) is
                    when "000" | "011" => 
                        doPCWriteBack <= '1'; -- NOP operation
                        PC_out <= resultCalcedPC;
                    when "001" | "100" => 
                        if(n='1' or test2Active='1') then
                            doPCWriteBack <= '1';
                            PC_out <= resultCalcedPC;
                        else
                            doPCWriteBack <= '0';
                            PC_out <= PC_in;
                        end if;
                    when "010" | "101" => 
                        if(z='1' or test2Active='1') then
                            doPCWriteBack <= '1';
                            PC_out <= resultCalcedPC;
                        else
                            doPCWriteBack <= '0';
                            PC_out <= PC_in;
                        end if;
                    when "110" =>
                        doPCWriteBack <= '1'; -- NOP operation
                        PC_out <= resultCalcedPC;
                        
--                        result <= std_logic_vector(unsigned(PC_in) + 2);
                    when "111" =>
                        doPCWriteBack <= '1'; -- NOP operation
                        PC_out <= operand2;
                    when others => doPCWriteBack <= '0'; -- Temporary until all cases are completed 
                end case;
            
            elsif useIO = '1' then
                if modeIO = '0' then  -- Input, write the operand rand to memory
--                    result <= operand1;
--                else
                    outputCPU <= operand1Buffer;
                    doOutputUpdateOut <= '1';
                end if;
                
            elsif useLS = '1' then 
                doMemoryAccess <= '1';
            end if;

        end if;
    else 
        --doWriteBackOut <= '0';
        test2Active<='0';
        doPCWriteBack <= '0';
        PC_out <= X"0000";
        outputCPU <= X"0000";
        doOutputUpdateOut<='0';
    end if;
end process;

end Behavioral;
