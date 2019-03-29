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
    clk, rst, rstLoad, halt : in std_logic;
    instruction_out, PC_out: out std_logic_vector(15 downto 0) := X"0000";
    inputIn, instruction_in : in std_logic_vector(15 downto 0);
    inputOut, fetchAddress : out std_logic_vector(15 downto 0) := X"0000";
    PC_set : in std_logic_vector(15 downto 0);
    PC_doJump : in std_logic
);
end fetchStage;

architecture Behavioral of fetchStage is

signal PC_next : std_logic_vector(15 downto 0) := X"0002";
signal PC_current : std_logic_vector(15 downto 0) := X"0000";

signal PC_setLatched : std_logic_vector(15 downto 0);

signal PC_justHalted, validInstruction : std_logic := '0';

begin

fetchAddress <= PC_current;

    with validInstruction select
        instruction_out <=
            instruction_in when '0',
            X"0000" when others;

validInstruction <= PC_justHalted or halt;

process(rst, clk) begin
    if(rst = '0') then
        if rising_edge(clk) then
            PC_setLatched <= PC_set;
        end if;
    else
        PC_setLatched <= X"0000";
    end if;
end process;

process(clk)
begin
    if(rst = '0' and rstLoad='0') then 
        if (clk='0' and clk'event) then
                
                if (PC_doJump = '0' and halt='0') then -- normal increment mode
                    if(PC_justHalted = '1') then 
                        PC_justHalted <= '0';
                    end if; 
                    PC_current <= PC_next;
                    PC_next <= std_logic_vector(unsigned(PC_next) + 2);
                    PC_out <= PC_current;            
                else
                    PC_current <= PC_setLatched;
                    PC_next <= std_logic_vector(unsigned(PC_setLatched) + 2);
                    PC_out <=  PC_setLatched;
                    PC_justHalted <= '1';
                end if;
                inputOut <= inputIn;

        end if;
    else 
        
            inputOut <= X"0000";
            PC_justHalted<='0';
            
            if rstLoad = '1' then
                PC_next <= X"0004";
                PC_current <= X"0002";
                PC_out<=X"0002";
            else --must be normal rst aka rst_load
                PC_next <= X"0002";
                PC_current <= X"0000";
                PC_out<=X"0000";
            end if;
    end if;

end process;

end Behavioral;
