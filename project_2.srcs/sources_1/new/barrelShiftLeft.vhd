----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/18/2019 02:43:41 PM
-- Design Name: 
-- Module Name: barrelShiftLeft - Behavioral
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

entity barrelShiftLeft is
Port (
    input : in std_logic_vector(15 downto 0);
    shiftBy : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(15 downto 0));
end barrelShiftLeft;

architecture Behavioral of barrelShiftLeft is

signal stage1a : std_logic_vector(7 downto 0);
signal stage1b : std_logic_vector(7 downto 0);

signal stage2a : std_logic_vector(3 downto 0);
signal stage2b : std_logic_vector(3 downto 0);
signal stage2c : std_logic_vector(3 downto 0);
signal stage2d : std_logic_vector(3 downto 0);

signal stage3a : std_logic_vector(1 downto 0);
signal stage3b : std_logic_vector(1 downto 0);
signal stage3c : std_logic_vector(1 downto 0);
signal stage3d : std_logic_vector(1 downto 0);
signal stage3e : std_logic_vector(1 downto 0);
signal stage3f : std_logic_vector(1 downto 0);
signal stage3g : std_logic_vector(1 downto 0);
signal stage3h : std_logic_vector(1 downto 0);
    
begin
    s1a : entity work.mux2_8 port map(ch0=>input(7 downto 0), ch1=>X"00", sel=>shiftBy(3), output=>stage1a);
    s1b : entity work.mux2_8 port map(ch0=>input(15 downto 8), ch1=>input(7 downto 0), sel=>shiftBy(3), output=>stage1b);

    s2a : entity work.mux2_4 port map(ch0=>stage1a(3 downto 0), ch1=>X"0", sel=>shiftBy(2), output=>stage2a);
    s2b : entity work.mux2_4 port map(ch0=>stage1a(7 downto 4), ch1=>stage1a(3 downto 0), sel=>shiftBy(2), output=>stage2b);
    s2c : entity work.mux2_4 port map(ch0=>stage1b(3 downto 0), ch1=>stage1a(7 downto 4), sel=>shiftBy(2), output=>stage2c);
    s2d : entity work.mux2_4 port map(ch0=>stage1b(7 downto 4), ch1=>stage1b(3 downto 0), sel=>shiftBy(2), output=>stage2d);

    s3a : entity work.mux2_2 port map(ch0=>stage2a(1 downto 0), ch1=>"00", sel=>shiftBy(1), output=>stage3a);
    s3b : entity work.mux2_2 port map(ch0=>stage2a(3 downto 2), ch1=>stage2a(1 downto 0), sel=>shiftBy(1), output=>stage3b);
    s3c : entity work.mux2_2 port map(ch0=>stage2b(1 downto 0), ch1=>stage2a(3 downto 2), sel=>shiftBy(1), output=>stage3c);
    s3d : entity work.mux2_2 port map(ch0=>stage2b(3 downto 2), ch1=>stage2b(1 downto 0), sel=>shiftBy(1), output=>stage3d);
    s3e : entity work.mux2_2 port map(ch0=>stage2c(1 downto 0), ch1=>stage2b(3 downto 2), sel=>shiftBy(1), output=>stage3e);
    s3f : entity work.mux2_2 port map(ch0=>stage2c(3 downto 2), ch1=>stage2c(1 downto 0), sel=>shiftBy(1), output=>stage3f);
    s3g : entity work.mux2_2 port map(ch0=>stage2d(1 downto 0), ch1=>stage2c(3 downto 2), sel=>shiftBy(1), output=>stage3g);
    s3h : entity work.mux2_2 port map(ch0=>stage2d(3 downto 2), ch1=>stage2d(1 downto 0), sel=>shiftBy(1), output=>stage3h);

    s4a : entity work.mux2_1 port map(ch0=>stage3a(0), ch1=>'0', sel=>shiftBy(0), output=>output(0));
    s4b : entity work.mux2_1 port map(ch0=>stage3a(1), ch1=>stage3a(0), sel=>shiftBy(0), output=>output(1));
    s4c : entity work.mux2_1 port map(ch0=>stage3b(0), ch1=>stage3a(1), sel=>shiftBy(0), output=>output(2));
    s4d : entity work.mux2_1 port map(ch0=>stage3b(1), ch1=>stage3b(0), sel=>shiftBy(0), output=>output(3));
    s4e : entity work.mux2_1 port map(ch0=>stage3c(0), ch1=>stage3b(1), sel=>shiftBy(0), output=>output(4));
    s4f : entity work.mux2_1 port map(ch0=>stage3c(1), ch1=>stage3c(0), sel=>shiftBy(0), output=>output(5));
    s4g : entity work.mux2_1 port map(ch0=>stage3d(0), ch1=>stage3c(1), sel=>shiftBy(0), output=>output(6));
    s4h : entity work.mux2_1 port map(ch0=>stage3d(1), ch1=>stage3d(0), sel=>shiftBy(0), output=>output(7));
    s4i : entity work.mux2_1 port map(ch0=>stage3e(0), ch1=>stage3d(1), sel=>shiftBy(0), output=>output(8));
    s4j : entity work.mux2_1 port map(ch0=>stage3e(1), ch1=>stage3e(0), sel=>shiftBy(0), output=>output(9));
    s4k : entity work.mux2_1 port map(ch0=>stage3f(0), ch1=>stage3e(1), sel=>shiftBy(0), output=>output(10));
    s4l : entity work.mux2_1 port map(ch0=>stage3f(1), ch1=>stage3f(0), sel=>shiftBy(0), output=>output(11));
    s4m : entity work.mux2_1 port map(ch0=>stage3g(0), ch1=>stage3f(1), sel=>shiftBy(0), output=>output(12));
    s4n : entity work.mux2_1 port map(ch0=>stage3g(1), ch1=>stage3g(0), sel=>shiftBy(0), output=>output(13));
    s4o : entity work.mux2_1 port map(ch0=>stage3h(0), ch1=>stage3g(1), sel=>shiftBy(0), output=>output(14));
    s4p : entity work.mux2_1 port map(ch0=>stage3h(1), ch1=>stage3h(0), sel=>shiftBy(0), output=>output(15));

end Behavioral;