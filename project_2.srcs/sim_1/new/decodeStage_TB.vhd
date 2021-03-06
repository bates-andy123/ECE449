----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 06:53:49 PM
-- Design Name: 
-- Module Name: decodeStage_TB - Behavioral
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

entity decodeStage_TB is end decodeStage_TB;

architecture Behavioral of decodeStage_TB is

component decodeStage port(
    clk : in std_logic;
    instruction : in std_logic_vector(15 downto 0);
    useALU : out std_logic;
    useIO : out std_logic;
    modeALU : out std_logic_vector(2 downto 0);
    modeIO : out std_logic;
    operand1, operand2 : out std_logic_vector(15 downto 0);
    destReg : out std_logic_vector(2 downto 0)
);
end component;

signal clk : std_logic := '0';
signal instruction : std_logic_vector(15 downto 0) := X"0000";
signal useALU : std_logic;
signal useIO : std_logic;
signal modeALU : std_logic_vector(2 downto 0);
signal modeIO : std_logic;
signal operand1, operand2 : std_logic_vector(15 downto 0);
signal destReg : std_logic_vector(2 downto 0);

begin

u0 : decodeStage port map(
    clk => clk,
    instruction => instruction,
    useALU => useALU,
    useIO => useIO,
    modeALU => modeALU,
    modeIO => modeIO,
    operand1 => operand1,
    operand2 => operand2,
    destReg => destReg
);

process begin
    clk <= '0';
    wait for 10 us;
    clk <= '1';
    wait for 10us;
end process;

process begin
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP
    wait until falling_edge(clk); instruction <= "0100001010000000"; -- IN	r2                    
    wait until falling_edge(clk); instruction <= "0100001011000000"; -- IN	r3                    
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP                     
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP                      
    wait until falling_edge(clk); instruction <= "0000001011010001"; -- ADD    r3,    r2,    r1           
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP                                            
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP                      
    wait until falling_edge(clk); instruction <= "0000101011000010"; -- SHL    r3,    2                
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP                                            
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP                      
    wait until falling_edge(clk); instruction <= "0000011010001011"; -- MUL    r2,    r1,    r3           
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP  
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP  
    wait until falling_edge(clk); instruction <= "0100000010000000"; -- OUT	r2  
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP  
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP  
    wait until falling_edge(clk); instruction <= "0000000000000000"; -- NOP  
    wait;                   

end process;

end Behavioral;
