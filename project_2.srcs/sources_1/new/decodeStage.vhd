----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 04:45:57 PM
-- Design Name: 
-- Module Name: decodeStage - Behavioral
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

entity decodeStage is Port (
    clk : in std_logic;
    instruction : in std_logic_vector(15 downto 0);
    useALU : out std_logic := '0';
    useIO : out std_logic := '0';
    modeALU : out std_logic_vector(2 downto 0) := "000";
    modeIO : out std_logic := '0';
    operand1, operand2 : out std_logic_vector(15 downto 0) := X"0000";
    destReg : out std_logic_vector(2 downto 0);
    doWriteBack : out std_logic;
    regWriteEnable : in std_logic;
    regWriteAddress : in std_logic_vector(2 downto 0);
    writeBackValue : in std_logic_vector(15 downto 0);
    inputIn : in std_logic_vector(15 downto 0)
    --inputOut : out std_logic_vector(15 downto 0)
);
end decodeStage;

architecture Behavioral of decodeStage is

component register_file port(
    rst : in std_logic; 
    clk: in std_logic; 
    rd_index1, rd_index2: in std_logic_vector(2 downto 0);
    rd_data1, rd_data2: out std_logic_vector(15 downto 0); 
    wr_index: in std_logic_vector(2 downto 0); 
    wr_data: in std_logic_vector(15 downto 0); 
    wr_enable: in std_logic
);
end component; 

signal rd_index1, rd_index2 : std_logic_vector(2 downto 0) := "000";
signal rd_data1, rd_data2 : std_logic_vector(15 downto 0) := X"0000";

--Op code identifiers
constant alu_op : std_logic_vector(3 downto 0)  := "0000";

-- Op Codes
constant nop_op : std_logic_vector(6 downto 0)  := "0000000";
constant add_op : std_logic_vector(6 downto 0)  := "0000001";
constant sub_op : std_logic_vector(6 downto 0)  := "0000010";
constant mul_op : std_logic_vector(6 downto 0)  := "0000011";
constant nand_op : std_logic_vector(6 downto 0) := "0000100";
constant shl_op : std_logic_vector(6 downto 0)  := "0000101";
constant shr_op : std_logic_vector(6 downto 0)  := "0000110";
constant test_op : std_logic_vector(6 downto 0) := "0000111";
constant out_op : std_logic_vector(6 downto 0)  := "0100000";
constant in_op : std_logic_vector(6 downto 0)   := "0100001";

begin

u0 : register_file port map(
    clk=>clk,
    rst=>'0',
    --read signals
    rd_index1=>rd_index1, 
    rd_index2=>rd_index2, 
    rd_data1=>rd_data1, 
    rd_data2=>rd_data2,
    --write signals
    wr_index=>regWriteAddress, 
    wr_data=>writeBackValue, 
    wr_enable=>regWriteEnable
);


    with instruction(15 downto 9) select
        rd_index1 <= 
            instruction(5 downto 3) when add_op | sub_op | mul_op | nand_op,
            instruction(8 downto 6) when shl_op | shr_op | test_op | out_op,
            "UUU" when others;
            
    with instruction(15 downto 9) select
        rd_index2 <= 
            instruction(2 downto 0) when add_op | sub_op | mul_op | nand_op,
            "UUU" when others;
            
     with instruction(15 downto 9) select
        useALU <= 
            '1' when nop_op | add_op | sub_op | mul_op | nand_op | shl_op | shr_op | test_op,
            '0' when others;
    
    with instruction(15 downto 9) select
        useIO <=
            '1' when in_op | out_op,
            '0' when others;
            
     with instruction(15 downto 9) select
        destReg <=
            instruction(8 downto 6) when add_op | sub_op | mul_op | nand_op | shl_op | shr_op | in_op ,
            "UUU" when others;
            
    with instruction(15 downto 9) select
        doWriteBack <=
            '1' when add_op | sub_op | mul_op | nand_op | shl_op | shr_op | in_op ,
            '0' when others;
         
    with instruction(15 downto 9) select
        modeIO <=
            '1' when in_op ,
            '0' when out_op,
            '0' when others;
       
    with instruction(15 downto 9) select
        operand2 <=
            rd_data2 when add_op | sub_op | mul_op | nand_op ,
            (X"0000" & instruction(3 downto 0)) when shl_op | shr_op ,
            X"0000" when others;   
            
    with instruction(15 downto 9) select
        operand1 <=
            rd_data2 when add_op | sub_op | mul_op | nand_op | shl_op | shr_op | test_op | out_op,
            inputIn when in_op ,
            X"0000" when others;   
         
    modeALU <= instruction(11 downto 9);
    
    

end Behavioral;
