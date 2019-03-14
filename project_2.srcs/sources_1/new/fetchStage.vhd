----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 01:06:50 PM
-- Design Name: 
-- Module Name: fetchStage - Behavioral
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

entity fetchStage is Port (
    clk, rst, halt : in std_logic;
    instruction, PC_out: out std_logic_vector(15 downto 0) := X"0000";
    inputIn : in std_logic_vector(15 downto 0);
    inputOut : out std_logic_vector(15 downto 0) := X"0000";
    PC_set : in std_logic_vector(15 downto 0);
    PC_doJump : in std_logic
);
end fetchStage;

architecture Behavioral of fetchStage is

component ROMController port(
    clka, ena, regcea, rsta : in std_logic;
    addra : in std_logic_vector (7 downto 0);
    douta : out std_logic_vector (15 downto 0)
);
end component;

signal addrROM : std_logic_vector (7 downto 0) := X"00";
signal doutROM : std_logic_vector (15 downto 0);

signal PC_next : std_logic_vector(15 downto 0) := X"0001";
signal PC_current : std_logic_vector(15 downto 0) := X"0000";

signal PC_JustDidJump : std_logic := '0';

begin

ROM : ROMController port map(
    clka=>clk,
    ena=>'1',  
    regcea=>'1', 
    rsta=>'0', 
    addra=>addrROM,
    douta=>doutROM
);



process(clk)
begin
    if(rst = '0') then 
        if falling_edge(clk) then
            if(halt = '0') then
                 
                
                if (PC_doJump = '0' and PC_JustDidJump='0') then -- normal increment mode
                    addrROM <= PC_next(7 downto 0);
                    instruction <= doutROM;
                    PC_current <= PC_next;
                    PC_next <= std_logic_vector(unsigned(PC_next) + 1);
                    PC_out <= PC_current;
                    --PC_current <= std_logic_vector(unsigned(PC_current) + 1);
--                elsif (PC_JustDidJump = '1') then
--                    PC_JustDidJump <= '0';
--                    instruction <= X"0000";                
                else
                    --PC_current <= PC_set;
                    --PC_JustDidJump <= '1';
                    instruction <= X"0000";
                    PC_current <= PC_set;
                    PC_next <= std_logic_vector(unsigned(PC_set) + 1);
                    addrROM <= PC_set(7 downto 0);
                    PC_out <=  PC_set;
                end if;
                inputOut <= inputIn;
            end if;
        end if;
    else 
        PC_next <= X"0001";
        PC_current <= X"0000";
        inputOut <= X"0000";
        instruction <= X"0000";
        addrROM <= X"00";
    end if;

end process;

end Behavioral;
