----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 11:52:28 AM
-- Design Name: 
-- Module Name: dataHazardPredictor_TB - Behavioral
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

entity dataHazardPredictor_TB is
--  Port ( );
end dataHazardPredictor_TB;

architecture Behavioral of dataHazardPredictor_TB is

component dataHazardPredictor port(
    halt : out std_logic;
    writeReg, readReg1, readReg2 : in std_logic_vector(2 downto 0);
    clk, isWriteInstruction : in std_logic
);
end component;

signal halt : std_logic;
signal writeReg : std_logic_vector(2 downto 0) := "000";
signal readReg1 : std_logic_vector(2 downto 0); 
signal readReg2 : std_logic_vector(2 downto 0);
signal clk : std_logic;
signal isWriteInstruction : std_logic;

begin

u0 : dataHazardPredictor port map(
    halt=>halt,
    writeReg=>writeReg, 
    readReg1=>readReg1, 
    readReg2=>readReg2,
    clk=>clk, 
    isWriteInstruction=>isWriteInstruction
);

process begin
    clk<='0';
    wait for 5us;
    clk<='1';
    wait for 5us;
end process;

process(clk) 
    variable var : integer range 0 to 5 := 0;
begin
    if falling_edge(clk) then
        if(halt = '0') then
            if (var = 2) then
                writeReg <= "100";
            else
                var := 2;
                writeReg <= "001";
            end if;
        end if;
    end if;
end process;


process begin
    isWriteInstruction <= '1';
    readReg1 <= "100";
    readReg2 <= "010";
    
    wait until falling_edge(clk);
    wait until rising_edge(clk);
    
    wait until falling_edge(clk);
    wait until rising_edge(clk);
        
    wait until falling_edge(clk);
    wait until rising_edge(clk);
    
    wait until falling_edge(clk);
    wait until rising_edge(clk);
    
    wait;
end process;

end Behavioral;
