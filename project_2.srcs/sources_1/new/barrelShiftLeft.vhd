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
    s1a : entity work.mux2_8 port map(ch0 => input(7 downto 0), ch1 => X"00", sel => shiftBy(3), output => stage1a);
    s1b : entity work.mux2_8 port map(ch0 => input(15 downto 8), ch1 => input(7 downto 0), sel => shiftBy(3), output => stage1b);

    s2a : entity work.mux2_4 port map(ch0 => stage1a(3 downto 0), ch1 => X"0", sel => shiftBy(2), output => stage2a);
    s2b : entity work.mux2_4 port map(ch0 => stage1a(7 downto 4), ch1 => stage1a(3 downto 0), sel => shiftBy(2), output => stage2b);
    s2c : entity work.mux2_4 port map(ch0 => stage1b(3 downto 0), ch1 => stage1a(7 downto 4), sel => shiftBy(2), output => stage2c);
    s2d : entity work.mux2_4 port map(ch0 => stage1b(7 downto 4), ch1 => stage1b(3 downto 0), sel => shiftBy(2), output => stage2d);

    s3a : entity work.mux2_2 port map(ch0 => stage2a(1 downto 0), ch1 => "00", sel => shiftBy(1), output => stage3a);
    s3b : entity work.mux2_2 port map(ch0 => stage2a(3 downto 2), ch1 => stage2a(1 downto 0), sel => shiftBy(1), output => stage3b);
    s3c : entity work.mux2_2 port map(ch0 => stage2b(1 downto 0), ch1 => stage2a(3 downto 2), sel => shiftBy(1), output => stage3c);
    s3d : entity work.mux2_2 port map(ch0 => stage2b(3 downto 2), ch1 => stage2b(1 downto 0), sel => shiftBy(1), output => stage3d);
    s3e : entity work.mux2_2 port map(ch0 => stage2c(1 downto 0), ch1 => stage2b(3 downto 2), sel => shiftBy(1), output => stage3e);
    s3f : entity work.mux2_2 port map(ch0 => stage2c(3 downto 2), ch1 => stage2c(1 downto 0), sel => shiftBy(1), output => stage3f);
    s3g : entity work.mux2_2 port map(ch0 => stage2d(1 downto 0), ch1 => stage2c(3 downto 2), sel => shiftBy(1), output => stage3g);
    s3h : entity work.mux2_2 port map(ch0 => stage2d(3 downto 2), ch1 => stage2d(1 downto 0), sel => shiftBy(1), output => stage3h);

    s4a : entity work.mux2_1 port map(ch0 => stage3a(0), ch1 => '0', sel => shiftBy(0), output => output(0));
    s4b : entity work.mux2_1 port map(ch0 => stage3a(1), ch1 => stage3a(0), sel => shiftBy(0), output => output(1));
    s4c : entity work.mux2_1 port map(ch0 => stage3b(0), ch1 => stage3a(1), sel => shiftBy(0), output => output(2));
    s4d : entity work.mux2_1 port map(ch0 => stage3b(1), ch1 => stage3b(0), sel => shiftBy(0), output => output(3));
    s4e : entity work.mux2_1 port map(ch0 => stage3c(0), ch1 => stage3b(1), sel => shiftBy(0), output => output(4));
    s4f : entity work.mux2_1 port map(ch0 => stage3c(1), ch1 => stage3c(0), sel => shiftBy(0), output => output(5));
    s4g : entity work.mux2_1 port map(ch0 => stage3d(0), ch1 => stage3c(1), sel => shiftBy(0), output => output(6));
    s4h : entity work.mux2_1 port map(ch0 => stage3d(1), ch1 => stage3d(0), sel => shiftBy(0), output => output(7));
    s4i : entity work.mux2_1 port map(ch0 => stage3e(0), ch1 => stage3d(1), sel => shiftBy(0), output => output(8));
    s4j : entity work.mux2_1 port map(ch0 => stage3e(1), ch1 => stage3e(0), sel => shiftBy(0), output => output(9));
    s4k : entity work.mux2_1 port map(ch0 => stage3f(0), ch1 => stage3e(1), sel => shiftBy(0), output => output(10));
    s4l : entity work.mux2_1 port map(ch0 => stage3f(1), ch1 => stage3f(0), sel => shiftBy(0), output => output(11));
    s4m : entity work.mux2_1 port map(ch0 => stage3g(0), ch1 => stage3f(1), sel => shiftBy(0), output => output(12));
    s4n : entity work.mux2_1 port map(ch0 => stage3g(1), ch1 => stage3g(0), sel => shiftBy(0), output => output(13));
    s4o : entity work.mux2_1 port map(ch0 => stage3h(0), ch1 => stage3g(1), sel => shiftBy(0), output => output(14));
    s4p : entity work.mux2_1 port map(ch0 => stage3h(1), ch1 => stage3h(0), sel => shiftBy(0), output => output(15));

end Behavioral;

-- 32 Bit shift left for  multiplier
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shiftLeft32 is
    Port (
        input : in std_logic_vector(31 downto 0);
        shiftBy : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(31 downto 0));
end shiftLeft32;

architecture Behavioral of shiftLeft32 is

signal stage10, stage11, stage12, stage13 : std_logic_vector(7 downto 0);

signal stage20, stage21, stage22, stage23, stage24, stage25, stage26, stage27 : std_logic_vector(3 downto 0);

signal stage30, stage31, stage32, stage33, stage34, stage35, stage36, stage37 : std_logic_vector(1 downto 0);
signal stage38, stage39, stage3A, stage3B, stage3C, stage3D, stage3E, stage3F: std_logic_vector(1 downto 0);
    
begin
    s10 : entity work.mux2_8 port map(ch0 => input(7 downto 0), ch1 => X"00", sel => shiftBy(3), output => stage10);
    s11 : entity work.mux2_8 port map(ch0 => input(15 downto 8), ch1 => input(7 downto 0), sel => shiftBy(3), output => stage11);
    s12 : entity work.mux2_8 port map(ch0 => input(23 downto 16), ch1 => input(15 downto 8), sel => shiftBy(3), output => stage12);
    s13 : entity work.mux2_8 port map(ch0 => input(31 downto 24), ch1 => input(23 downto 16), sel => shiftBy(3), output => stage13);

    s20 : entity work.mux2_4 port map(ch0 => stage10(3 downto 0), ch1 => X"0", sel => shiftBy(2), output => stage20);
    s21 : entity work.mux2_4 port map(ch0 => stage10(7 downto 4), ch1 => stage10(3 downto 0), sel => shiftBy(2), output => stage21);
    s22 : entity work.mux2_4 port map(ch0 => stage11(3 downto 0), ch1 => stage10(7 downto 4), sel => shiftBy(2), output => stage22);
    s23 : entity work.mux2_4 port map(ch0 => stage11(7 downto 4), ch1 => stage11(3 downto 0), sel => shiftBy(2), output => stage23);
    s24 : entity work.mux2_4 port map(ch0 => stage12(3 downto 0), ch1 => stage11(7 downto 4), sel => shiftBy(2), output => stage24);
    s25 : entity work.mux2_4 port map(ch0 => stage12(7 downto 4), ch1 => stage12(3 downto 0), sel => shiftBy(2), output => stage25);
    s26 : entity work.mux2_4 port map(ch0 => stage13(3 downto 0), ch1 => stage12(7 downto 4), sel => shiftBy(2), output => stage26);
    s27 : entity work.mux2_4 port map(ch0 => stage13(7 downto 4), ch1 => stage13(3 downto 0), sel => shiftBy(2), output => stage27);

    s30 : entity work.mux2_2 port map(ch0 => stage20(1 downto 0), ch1 => "00", sel => shiftBy(1), output => stage30);
    s31 : entity work.mux2_2 port map(ch0 => stage20(3 downto 2), ch1 => stage20(1 downto 0), sel => shiftBy(1), output => stage31);
    s32 : entity work.mux2_2 port map(ch0 => stage21(1 downto 0), ch1 => stage20(3 downto 2), sel => shiftBy(1), output => stage32);
    s33 : entity work.mux2_2 port map(ch0 => stage21(3 downto 2), ch1 => stage21(1 downto 0), sel => shiftBy(1), output => stage33);
    s34 : entity work.mux2_2 port map(ch0 => stage22(1 downto 0), ch1 => stage21(3 downto 2), sel => shiftBy(1), output => stage34);
    s35 : entity work.mux2_2 port map(ch0 => stage22(3 downto 2), ch1 => stage22(1 downto 0), sel => shiftBy(1), output => stage35);
    s36 : entity work.mux2_2 port map(ch0 => stage23(1 downto 0), ch1 => stage22(3 downto 2), sel => shiftBy(1), output => stage36);
    s37 : entity work.mux2_2 port map(ch0 => stage23(3 downto 2), ch1 => stage23(1 downto 0), sel => shiftBy(1), output => stage37);
    s38 : entity work.mux2_2 port map(ch0 => stage24(1 downto 0), ch1 => stage23(3 downto 2), sel => shiftBy(1), output => stage38);
    s39 : entity work.mux2_2 port map(ch0 => stage24(3 downto 2), ch1 => stage24(1 downto 0), sel => shiftBy(1), output => stage39);
    s3A : entity work.mux2_2 port map(ch0 => stage25(1 downto 0), ch1 => stage24(3 downto 2), sel => shiftBy(1), output => stage3A);
    s3B : entity work.mux2_2 port map(ch0 => stage25(3 downto 2), ch1 => stage25(1 downto 0), sel => shiftBy(1), output => stage3B);
    s3C : entity work.mux2_2 port map(ch0 => stage26(1 downto 0), ch1 => stage25(3 downto 2), sel => shiftBy(1), output => stage3C);
    s3D : entity work.mux2_2 port map(ch0 => stage26(3 downto 2), ch1 => stage26(1 downto 0), sel => shiftBy(1), output => stage3D);
    s3E : entity work.mux2_2 port map(ch0 => stage27(1 downto 0), ch1 => stage26(3 downto 2), sel => shiftBy(1), output => stage3E);
    s3F : entity work.mux2_2 port map(ch0 => stage27(3 downto 2), ch1 => stage27(1 downto 0), sel => shiftBy(1), output => stage3F);
    
    s400 : entity work.mux2_1 port map(ch0 => stage30(0), ch1 => '0', sel => shiftBy(0), output => output(0));
    s401 : entity work.mux2_1 port map(ch0 => stage30(1), ch1 => stage30(0), sel => shiftBy(0), output => output(1));
    s402 : entity work.mux2_1 port map(ch0 => stage31(0), ch1 => stage30(1), sel => shiftBy(0), output => output(2));
    s403 : entity work.mux2_1 port map(ch0 => stage31(1), ch1 => stage31(0), sel => shiftBy(0), output => output(3));
    s404 : entity work.mux2_1 port map(ch0 => stage32(0), ch1 => stage31(1), sel => shiftBy(0), output => output(4));
    s405 : entity work.mux2_1 port map(ch0 => stage32(1), ch1 => stage32(0), sel => shiftBy(0), output => output(5));
    s406 : entity work.mux2_1 port map(ch0 => stage33(0), ch1 => stage32(1), sel => shiftBy(0), output => output(6));
    s407 : entity work.mux2_1 port map(ch0 => stage33(1), ch1 => stage33(0), sel => shiftBy(0), output => output(7));
    s408 : entity work.mux2_1 port map(ch0 => stage34(0), ch1 => stage33(1), sel => shiftBy(0), output => output(8));
    s409 : entity work.mux2_1 port map(ch0 => stage34(1), ch1 => stage34(0), sel => shiftBy(0), output => output(9));
    s40A : entity work.mux2_1 port map(ch0 => stage35(0), ch1 => stage34(1), sel => shiftBy(0), output => output(10));
    s40B : entity work.mux2_1 port map(ch0 => stage35(1), ch1 => stage35(0), sel => shiftBy(0), output => output(11));
    s40C : entity work.mux2_1 port map(ch0 => stage36(0), ch1 => stage35(1), sel => shiftBy(0), output => output(12));
    s40D : entity work.mux2_1 port map(ch0 => stage36(1), ch1 => stage36(0), sel => shiftBy(0), output => output(13));
    s40E : entity work.mux2_1 port map(ch0 => stage37(0), ch1 => stage36(1), sel => shiftBy(0), output => output(14));
    s40F : entity work.mux2_1 port map(ch0 => stage37(1), ch1 => stage37(0), sel => shiftBy(0), output => output(15));
    s410 : entity work.mux2_1 port map(ch0 => stage38(0), ch1 => stage37(0), sel => shiftBy(0), output => output(16));
    s411 : entity work.mux2_1 port map(ch0 => stage38(1), ch1 => stage38(0), sel => shiftBy(0), output => output(17));
    s412 : entity work.mux2_1 port map(ch0 => stage39(0), ch1 => stage38(1), sel => shiftBy(0), output => output(18));
    s413 : entity work.mux2_1 port map(ch0 => stage39(1), ch1 => stage39(0), sel => shiftBy(0), output => output(19));
    s414 : entity work.mux2_1 port map(ch0 => stage3A(0), ch1 => stage39(1), sel => shiftBy(0), output => output(20));
    s415 : entity work.mux2_1 port map(ch0 => stage3A(1), ch1 => stage3A(0), sel => shiftBy(0), output => output(21));
    s416 : entity work.mux2_1 port map(ch0 => stage3B(0), ch1 => stage3A(1), sel => shiftBy(0), output => output(22));
    s417 : entity work.mux2_1 port map(ch0 => stage3B(1), ch1 => stage3B(0), sel => shiftBy(0), output => output(23));
    s418 : entity work.mux2_1 port map(ch0 => stage3C(0), ch1 => stage3B(1), sel => shiftBy(0), output => output(24));
    s419 : entity work.mux2_1 port map(ch0 => stage3C(1), ch1 => stage3C(0), sel => shiftBy(0), output => output(25));
    s41A : entity work.mux2_1 port map(ch0 => stage3D(0), ch1 => stage3C(1), sel => shiftBy(0), output => output(26));
    s41B : entity work.mux2_1 port map(ch0 => stage3D(1), ch1 => stage3D(0), sel => shiftBy(0), output => output(27));
    s41C : entity work.mux2_1 port map(ch0 => stage3E(0), ch1 => stage3D(1), sel => shiftBy(0), output => output(28));
    s41D : entity work.mux2_1 port map(ch0 => stage3E(1), ch1 => stage3E(0), sel => shiftBy(0), output => output(29));
    s41E : entity work.mux2_1 port map(ch0 => stage3F(0), ch1 => stage3E(1), sel => shiftBy(0), output => output(30));
    s41F : entity work.mux2_1 port map(ch0 => stage3F(1), ch1 => stage3F(0), sel => shiftBy(0), output => output(31));

end Behavioral;