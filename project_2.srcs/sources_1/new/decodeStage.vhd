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
    clk, rst : in std_logic;
    halt : out std_logic := '0';
    instruction, PC_in : in std_logic_vector(15 downto 0);
    useALU, useBranch : out std_logic := '0';
    useIO : out std_logic := '0';
    modeALU : out std_logic_vector(2 downto 0) := "000";
    modeIO : out std_logic := '0';
    operand1, operand2 : out std_logic_vector(15 downto 0) := X"0000";
    destReg, readReg1, readReg2 : out std_logic_vector(2 downto 0) := "000";
    doWriteBack : out std_logic;
    regWriteEnable : in std_logic;
    regWriteAddress : in std_logic_vector(2 downto 0);
    writeBackValue : in std_logic_vector(15 downto 0);
    inputIn : in std_logic_vector(15 downto 0);
    PC_out : out std_logic_vector(15 downto 0) := X"0000"
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

constant brr : std_logic_vector(6 downto 0) 			:= "1000000";
constant brr_neg : std_logic_vector(6 downto 0) 	:= "1000001";
constant brr_zero : std_logic_vector(6 downto 0) 	:= "1000010";
constant br : std_logic_vector(6 downto 0) 			:= "1000011"; --uses ra
constant br_neg : std_logic_vector(6 downto 0) 		:= "1000100"; --uses ra
constant br_zero : std_logic_vector(6 downto 0) 	:= "1000101"; --uses ra
constant br_sub : std_logic_vector(6 downto 0) 		:= "1000110"; --uses ra
constant rtn	: std_logic_vector(6 downto 0)		:= "1000111";

signal destRegBuffer : std_logic_vector(2 downto 0);
signal doWriteBackBuffer : std_logic := '0';

begin

registers : register_file port map(
    clk=>clk,
    rst=>rst,
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
            "000" when others;
            
    with instruction(15 downto 9) select
        rd_index2 <= 
            instruction(2 downto 0) when add_op | sub_op | mul_op | nand_op,
            instruction(8 downto 6) when br | br_neg | br_zero | br_sub,
            "000" when others;
            
     with instruction(15 downto 9) select
        useALU <= 
            '1' when nop_op | add_op | sub_op | mul_op | nand_op | shl_op | shr_op | test_op,
            '0' when others;
    
    with instruction(15 downto 9) select
        useIO <=
            '1' when in_op | out_op,
            '0' when others;
            
     with instruction(15 downto 9) select
        destRegBuffer <=
            instruction(8 downto 6) when add_op | sub_op | mul_op | nand_op | shl_op | shr_op | in_op ,
            "UUU" when others;
            
    destReg <= destRegBuffer;
            
    with instruction(15 downto 9) select
        doWriteBackBuffer <=
            '1' when add_op | sub_op | mul_op | nand_op | shl_op | shr_op | in_op ,
            '0' when others;
         
    doWriteBack <= doWriteBackBuffer;
         
    with instruction(15 downto 9) select
        modeIO <=
            '1' when in_op ,
            '0' when out_op,
            '0' when others;
       
    with instruction(15 downto 9) select
        operand2 <=
            rd_data2 when add_op | sub_op | mul_op | nand_op | br | br_neg | br_zero | br_sub,
            X"000" & instruction(3 downto 0) when shl_op | shr_op ,
            PC_in when brr | brr_neg | brr_zero,
            X"0000" when others;   
            
    with instruction(15 downto 9) select
        operand1 <=
            rd_data1 when add_op | sub_op | mul_op | nand_op | shl_op | shr_op | test_op | out_op,
            inputIn when in_op ,
            (X"0" & "000" & instruction(8 downto 0)) when brr | brr_neg | brr_zero,
            (X"00" & "00" & instruction(5 downto 0)) when br | br_neg | br_zero | br_sub,
            X"0000" when others;   
            
    with instruction(15 downto 9) select
        useBranch <=
            '1' when  brr | brr_neg | brr_zero | br | br_neg | br_zero | br_sub | rtn,
            '0' when others;       
             
    modeALU <= instruction(11 downto 9);
    
    PC_out <= PC_in;
    readReg1 <= rd_index1;
    readReg2 <= rd_index2;
    
process(clk)

begin
    if falling_edge(clk) then
        
    end if;

end process;    

end Behavioral;
