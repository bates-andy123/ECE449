----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 02:07:30 PM
-- Design Name: 
-- Module Name: multiplier - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
    Port (
        multiplicand : in std_logic_vector(15 downto 0);
        multiplier : in std_logic_vector(15 downto 0);
        clk : in std_logic;
        start : in std_logic;
        product : out std_logic_vector(15 downto 0);
        done : out std_logic_vector(1 downto 0));
end multiplier;

architecture Behavioral of multiplier is

-- Internal signals
signal productTemp : std_logic_vector(31 downto 0); -- 16 bit multiplication has 32 bit result
signal multiplicandTemp : std_logic_vector(15 downto 0); -- temporary signal to hold shifts in multiplicand

-- Variables
shared variable counter : integer range 0 to 15 := 0; -- Counts current iteration of multiplication algorithm 

begin

process(clk)
begin
    case start is
        -- When not in multiply mode, set these values
        when '0' =>
            productTemp <= X"00000000";
            multiplicandTemp <= X"0000";
            done <= "00";
            counter := 0;
            
        -- When start flag is set, begin multiplication 
        when '1' =>
            -- Set done flag to show multiplication is currently happening
            -- Also initialize temporary multiplicand signal to current multiplicand value
            if (counter = 0) then
                done <= "01";
                multiplicandTemp <= multiplicand;
            end if;     
            
            -- After 16th iteration, set done flag to show multiplication is complete
            -- Check is done before counter variable assignment to gain a required clock cycle
            if (counter = 15) then
                done <= "10";
            end if;
            
            -- On clock cycle and iteration is less than the 16th time
            if (clk = '0' and clk'event and counter < 15) then
                -- Initial assignment
                if (multiplier(counter) = '1') then
                    productTemp <= (productTemp + (X"0000" & multiplicandTemp));    -- Add multiplicand to product
                    multiplicandTemp(15 downto 1) <= multiplicandTemp(14 downto 0); -- Shift multiplicand left by 1
                    multiplicandTemp(0) <= '0';                                     -- Assign 0 to unshifted bit 
                end if;
                
                -- If not the final iteration
                if (counter < 15) then
                    counter := counter + 1;
                end if;
                
                -- Output the intermediate (or final) result
                product <= productTemp(15 downto 0);
            end if;
        when others => null; -- Case never executes but is required or errors occur
    end case;
end process;
    
end Behavioral;