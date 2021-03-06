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
    clk, rst, addNOP, overflowInFromWriteback : in std_logic;
    halt, overflowOut : out std_logic := '0';
    instruction_in, PC_in : in std_logic_vector(15 downto 0);
    useALU, useBranch, useCustomTest : out std_logic := '0';
    useIO, useLS : out std_logic := '0';
    modeALU : out std_logic_vector(2 downto 0) := "000";
    modeIO, operand2Passthrough : out std_logic := '0';
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
    rd_overflow1, rd_overflow2: out std_logic;
    wr_index: in std_logic_vector(2 downto 0); 
    wr_data: in std_logic_vector(15 downto 0); 
    wr_overflow: in std_logic;
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

constant load_imm : std_logic_vector(6 downto 0)    := "0010010";
constant load : std_logic_vector(6 downto 0)		:= "0010000";
constant store : std_logic_vector(6 downto 0)	    := "0010001";
constant mov : std_logic_vector(6 downto 0)		    := "0010011";

constant brr : std_logic_vector(6 downto 0) 	    := "1000000";
constant brr_neg : std_logic_vector(6 downto 0) 	:= "1000001";
constant brr_zero : std_logic_vector(6 downto 0) 	:= "1000010";
constant br : std_logic_vector(6 downto 0) 			:= "1000011"; --uses ra
constant br_neg : std_logic_vector(6 downto 0) 		:= "1000100"; --uses ra
constant br_zero : std_logic_vector(6 downto 0) 	:= "1000101"; --uses ra
constant br_sub : std_logic_vector(6 downto 0) 		:= "1000110"; --uses ra
constant rtn	: std_logic_vector(6 downto 0)		:= "1000111";

constant test2_op : std_logic_vector(6 downto 0)       := "1010000";

signal signExtenderB1 : std_logic_vector(6 downto 0);
signal signExtenderB2 : std_logic_vector(9 downto 0);
signal instruction : std_logic_vector(15 downto 0) := X"0000";
signal wr_overflow, rd_overflow1, rd_overflow2 : std_logic;

begin

    with addNOP select
        instruction <= instruction_in when '0',
        X"0000" when others;
            

registers : register_file port map(
    clk=>clk,
    rst=>rst,
    --read signals
    rd_overflow1=>rd_overflow1,
    rd_overflow2=>rd_overflow2,
    rd_index1=>rd_index1, 
    rd_index2=>rd_index2, 
    rd_data1=>rd_data1, 
    rd_data2=>rd_data2,
    --write signals
    wr_overflow=>wr_overflow,
    wr_index=>regWriteAddress, 
    wr_data=>writeBackValue, 
    wr_enable=>regWriteEnable
);

    overflowOut <= rd_overflow1;
    wr_overflow <= overflowInFromWriteback;

    with instruction(15 downto 9) select
        operand2Passthrough <= -- When 1 this will tell the execute stage to not use Data Forward for operand 2
            '1' when shl_op | shr_op,
            '0' when others;

    with instruction(15 downto 9) select
        rd_index1 <= --rd_index1 selects what to read 
            instruction(5 downto 3) when add_op | sub_op | mul_op | nand_op | load | mov, --| store,
            instruction(8 downto 6) when shl_op | shr_op | test_op | test2_op | out_op | store,
            "000" when others;
            
    with instruction(15 downto 9) select
        rd_index2 <= --rd_index2 selects what to read
            instruction(2 downto 0) when add_op | sub_op | mul_op | nand_op,
            instruction(5 downto 3) when store,
            instruction(8 downto 6) when br | br_neg | br_zero | br_sub, --| store,
            "111" when rtn | load_imm,
            "000" when others;
            
     with instruction(15 downto 9) select
        useALU <= --Do we need to use the ALU
            '1' when nop_op | add_op | sub_op | mul_op | nand_op | shl_op | shr_op | test_op,
            '0' when others;
    
    with instruction(15 downto 9) select
        useIO <= -- Is this operation IO
            '1' when in_op | out_op,
            '0' when others;
            
     with instruction(15 downto 9) select
        destReg <= -- Pass the destination register
            instruction(8 downto 6) when add_op | sub_op | mul_op | nand_op | shl_op | shr_op | in_op | load | mov,
            "UUU" when others;
            
    with instruction(15 downto 9) select
        doWriteBack <= -- The result is going to written back
            '1' when add_op | sub_op | mul_op | nand_op | shl_op | shr_op | in_op ,
            '0' when others;
         
    with instruction(15 downto 9) select
        modeIO <= -- output or input IO operation
            '1' when in_op ,
            '0' when out_op,
            '0' when others;
       
    with instruction(15 downto 9) select
        operand2 <= --select operand 2
            rd_data2 when add_op | sub_op | mul_op | nand_op | br | br_neg | br_zero | br_sub | rtn | load_imm | store,
            X"000" & instruction(3 downto 0) when shl_op | shr_op ,
            PC_in when brr | brr_neg | brr_zero,
            X"0000" when others;   
            
    with instruction(15 downto 9) select
        operand1 <= -- select operand 1 
            rd_data1 when add_op | sub_op | mul_op | nand_op | shl_op | shr_op | test_op | test2_op | out_op | load | store | mov,
            inputIn when in_op ,
            ("0000000" & instruction(8 downto 0)) when load_imm,
            (signExtenderB1 & instruction(8 downto 0)) when brr | brr_neg | brr_zero,
            (signExtenderB2 & instruction(5 downto 0)) when br | br_neg | br_zero | br_sub,
            X"0000" when others;   
            
    with instruction(8) select
        signExtenderB1 <= -- Automatic sign extending if it is needed
            ("1111111") when '1',
            ("0000000") when '0',
            ("0000000") when others;
            
    with instruction(5) select
        signExtenderB2 <= -- Automatic sign extending if it is needed
            ("1111111111") when '1',
            ("0000000000") when '0',
            ("0000000000") when others;
    
    with instruction(15 downto 9) select
        useCustomTest <= -- Was test_op2 necessary
            '1' when  test2_op,
            '0' when others;

    with instruction(15 downto 9) select
        useBranch <= -- Is branching needed
            '1' when  brr | brr_neg | brr_zero | br | br_neg | br_zero | br_sub | rtn,
            '0' when others;
            
    with instruction(15 downto 9) select
        useLS <= -- Does the instruction use memory stage
            '1' when load_imm | load | store | mov,        
            '0' when others;
             
    modeALU <= instruction(11 downto 9); -- modeALU is used to identify the bottom 3 bits of op_code
    
    PC_out <= PC_in; -- PC_out is passed through
    readReg1 <= rd_index1; -- The read register 1 index we used
    readReg2 <= rd_index2; -- The read register 2 index we used
    
process(clk)

begin
    if falling_edge(clk) then
        
    end if;

end process;    

end Behavioral;
