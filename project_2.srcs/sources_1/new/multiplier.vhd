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
        overflow : out std_logic;
        product : out std_logic_vector(15 downto 0));
end multiplier;

architecture Behavioral of multiplier is

-- Internal signals
-- Shifted versions of the multiplicand
signal multi1, multi2, multi3, multi4, multi5, multi6, multi7, multi8, multi9, multi10, multi11, multi12, multi13, multi14, multi15 : std_logic_vector(31 downto 0);

-- Gated versions of the shifted results
signal multi0Gated, multi1Gated, multi2Gated, multi3Gated, multi4Gated, multi5Gated, multi6Gated, multi7Gated : std_logic_vector(31 downto 0);
signal multi8Gated, multi9Gated, multi10Gated, multi11Gated, multi12Gated, multi13Gated, multi14Gated, multi15Gated : std_logic_vector(31 downto 0);

-- Intermediate sums of the total product
signal inter01, inter02, inter03, inter04, inter05, inter06, inter07, inter08  : std_logic_vector(31 downto 0); -- First 8 sums
signal inter11, inter12, inter13, inter14 : std_logic_vector(31 downto 0); -- Second 4 sums
signal inter21, inter22 : std_logic_vector(31 downto 0); -- Third 2 sums
signal inter31 : std_logic_vector(31 downto 0); -- Final sum

-- Temporary signals
signal multiplicand32 : std_logic_vector(31 downto 0);
signal productTemp : std_logic_vector(15 downto 0);

begin
    multiplicand32 <= (X"0000" & multiplicand);

    -- Obtain 15 left shifts of multiplicand
    shift1 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "0001", output => multi1);
    shift2 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "0010", output => multi2);
    shift3 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "0011", output => multi3);
    shift4 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "0100", output => multi4);
    shift5 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "0101", output => multi5);
    shift6 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "0110", output => multi6);
    shift7 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "0111", output => multi7);
    shift8 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "1000", output => multi8);
    shift9 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "1001", output => multi9);
    shift10 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "1010", output => multi10);
    shift11 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "1011", output => multi11);
    shift12 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "1100", output => multi12);
    shift13 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "1101", output => multi13);
    shift14 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "1110", output => multi14);
    shift15 : entity work.shiftLeft32 port map(input => multiplicand32, shiftby => "1111", output => multi15);
    
    -- Gate out the results to only select multiplicands if the multiplier in that bit position is 1
    shift0Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multiplicand32, sel => multiplier(0), output => multi0Gated);
    shift1Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi1, sel => multiplier(1), output => multi1Gated);
    shift2Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi2, sel => multiplier(2), output => multi2Gated);
    shift3Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi3, sel => multiplier(3), output => multi3Gated);
    shift4Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi4, sel => multiplier(4), output => multi4Gated);
    shift5Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi5, sel => multiplier(5), output => multi5Gated);
    shift6Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi6, sel => multiplier(6), output => multi6Gated);
    shift7Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi7, sel => multiplier(7), output => multi7Gated);
    shift8Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi8, sel => multiplier(8), output => multi8Gated);
    shift9Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi9, sel => multiplier(9), output => multi9Gated);
    shift10Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi10, sel => multiplier(10), output => multi10Gated);
    shift11Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi11, sel => multiplier(11), output => multi11Gated);
    shift12Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi12, sel => multiplier(12), output => multi12Gated);
    shift13Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi13, sel => multiplier(13), output => multi13Gated);
    shift14Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi14, sel => multiplier(14), output => multi14Gated);
    shift15Gated : entity work.mux2_32 port map(ch0 => X"00000000", ch1 => multi15, sel => multiplier(15), output => multi15Gated);
    
    -- Addition of all the gated results to obtain the overall product
    -- Initial sum of all 16 shifted versions of the multiplicand
    sum01 : entity work.unsignedAddition port map(in1 => multi0Gated, in2 => multi1Gated, output => inter01);
    sum02 : entity work.unsignedAddition port map(in1 => multi2Gated, in2 => multi3Gated, output => inter02);
    sum03 : entity work.unsignedAddition port map(in1 => multi4Gated, in2 => multi5Gated, output => inter03);
    sum04 : entity work.unsignedAddition port map(in1 => multi6Gated, in2 => multi7Gated, output => inter04);
    sum05 : entity work.unsignedAddition port map(in1 => multi8Gated, in2 => multi9Gated, output => inter05);
    sum06 : entity work.unsignedAddition port map(in1 => multi10Gated, in2 => multi11Gated, output => inter06);
    sum07 : entity work.unsignedAddition port map(in1 => multi12Gated, in2 => multi13Gated, output => inter07);
    sum08 : entity work.unsignedAddition port map(in1 => multi14Gated, in2 => multi15Gated, output => inter08);
    
    -- Sum of all the 8 temporary sums above
    sum11 : entity work.unsignedAddition port map(in1 => inter01, in2 => inter02, output => inter11);
    sum12 : entity work.unsignedAddition port map(in1 => inter03, in2 => inter04, output => inter12);
    sum13 : entity work.unsignedAddition port map(in1 => inter05, in2 => inter06, output => inter13);
    sum14 : entity work.unsignedAddition port map(in1 => inter07, in2 => inter08, output => inter14);
    
    -- Sum of all the 4 temporary sums above
    sum21 : entity work.unsignedAddition port map(in1 => inter11, in2 => inter12, output => inter21);
    sum22 : entity work.unsignedAddition port map(in1 => inter13, in2 => inter14, output => inter22);
    
    -- Final result    
    finalProduct : entity work.unsignedAddition port map(in1 => inter21, in2 => inter22, output => inter31);
    productTemp <= inter31(15 downto 0);
    product <= productTemp;
    --overflow <= '0';
    overflow <= inter31(16) or inter31(17) or inter31(18) or inter31(19) or inter31(20) or inter31(21) or inter31(22) or inter31(23) or inter31(24)
                or inter31(25) or inter31(26) or inter31(27) or inter31(28) or inter31(29) or inter31(30);
end Behavioral;