----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 01:43:13 PM
-- Design Name: 
-- Module Name: pipeline_TB2 - Behavioral
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

entity pipeline_TB3 is end pipeline_TB3;

architecture Behavioral of pipeline_TB3 is

component pipeline Port (
    clk, rst, rstLoad, display_clock : in  STD_LOGIC;
    input, switchInput : in std_logic_vector(15 downto 0);
    SSEG : out std_logic_vector(6 downto 0);
    AN : out std_logic_vector(3 downto 0);
    
--    modeIO_stat, useIO_stat, useLS_stat, useALU_stat, useBranch_stat, destRegDoWritebackExecute_stat, doOutputUpdateOutMemoryStage_stat : out std_logic;
--    destRegDoWritebackDecode_stat, doBranchResetWritebackStage_stat, doOutputUpdateOutExecuteStage_stat : out std_logic;
--    executeStageResult_stat : out std_logic_vector(15 downto 0);
--    destRegOutExecute_state, destRegOutDecode_state, modeALU_stat : out std_logic_vector(2 downto 0);
    
    output : out std_logic_vector(15 downto 0)
);
end component;

signal clk, rst, rstLoad, display_clock : std_logic := '0';
signal output : std_logic_vector(15 downto 0);
signal input, switchInput : std_logic_vector(15 downto 0) := X"C0A0";
signal SSEG : std_logic_vector(6 downto 0);
signal AN : std_logic_vector(3 downto 0);


signal executeStageResult_stat : std_logic_vector(15 downto 0);
signal destRegOutExecute_state, destRegOutDecode_state, modeALU_stat : std_logic_vector(2 downto 0);
signal modeIO_stat, useIO_stat, useLS_stat, useALU_stat, useBranch_stat, destRegDoWritebackExecute_stat, doOutputUpdateOutMemoryStage_stat : std_logic;
signal destRegDoWritebackDecode_stat, doBranchResetWritebackStage_stat, doOutputUpdateOutExecuteStage_stat : std_logic;

begin

u0 : pipeline port map(
    clk => clk,
    rstLoad=>rstLoad,
    display_clock => display_clock,
    rst => rst,
    input=>input,
    an=>an,
    SSEG=>sseg,
    switchInput=>switchInput,
--    doOutputUpdateOutExecuteStage_stat=>doOutputUpdateOutExecuteStage_stat,
--    modeALU_stat=>modeALU_stat,
--    destRegDoWritebackExecute_stat=>destRegDoWritebackExecute_stat,
--    destRegOutExecute_state=>destRegOutExecute_state,
--    destRegOutDecode_state=>destRegOutDecode_state,
--    modeIO_stat=>modeIO_stat,
--    useIO_stat=>useIO_stat,
--    useLS_stat=>useLS_stat,
--    useALU_stat=>useALU_stat,
--    useBranch_stat=>useBranch_stat,
--    executeStageResult_stat=>executeStageResult_stat,
--    destRegDoWritebackDecode_stat=>destRegDoWritebackDecode_stat,
--    doBranchResetWritebackStage_stat=>doBranchResetWritebackStage_stat,
--    doOutputUpdateOutMemoryStage_stat=>doOutputUpdateOutMemoryStage_stat,
    
    output => output
);

process begin
    switchInput<=X"A0B4";
    input<=X"0009";
    rst <= '1';
    rstLoad<='0';
    wait until falling_edge(clk);
    rst<='0';
    rstLoad<='0';
    wait until falling_edge(clk);
    input<=X"AA80";
    wait until rising_edge(output(0));
    input<=X"0000";
    wait until falling_edge(output(0));
    input<=X"0000";
    wait;

end process;

process begin
    display_clock<='0';
    wait for 5us;
    display_clock<='1';
    wait for 5us;
end process;

process begin
    clk<='0';
    wait for 5us;
    clk<='1';
    wait for 5us;
end process;

end Behavioral;
