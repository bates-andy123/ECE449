----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 01:05:40 PM
-- Design Name: 
-- Module Name: pipeline - Behavioral
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

entity pipeline is Port (
    clk : in  STD_LOGIC;
    input : in std_logic_vector(15 downto 0);
    output : out std_logic_vector(15 downto 0) 
);
end pipeline;

architecture Behavioral of pipeline is

component fetchStage port(
    clk : in std_logic;
    instruction: out std_logic_vector(15 downto 0)
);
end component;

component decodeStage port(
    clk : in std_logic;
    instruction : in std_logic_vector(15 downto 0);
    useALU : out std_logic;
    modeALU : out std_logic_vector(2 downto 0);
    operand1, operand2 : out std_logic_vector(15 downto 0);
    destReg : out std_logic_vector(2 downto 0)
);
end component;

component executeStage port(
    clk : in std_logic;
    useALU : in std_logic;
    useIO : in std_logic;
    modeALU : in std_logic_vector(2 downto 0);
    modeIO : in std_logic;
    operand1, operand2 : in std_logic_vector(15 downto 0);
    inputCPU : in std_logic_vector(15 downto 0);
    outputRegIn : in std_logic_vector(2 downto 0);
    outputRegOut : out std_logic_vector(2 downto 0);
    result : out std_logic_vector(15 downto 0);
    outputCPU : out std_logic_vector(15 downto 0);
    execFreezePipe : out std_logic
);
end component;

signal fetchedInstruction: std_logic_vector(15 downto 0);
signal fetchedInstructionBuffer: std_logic_vector(15 downto 0) := X"0000";

signal useALU : std_logic;
signal useALUBuffer : std_logic := '0';
signal useIO : std_logic;
signal useIOBuffer : std_logic := '0';
signal modeALU : std_logic_vector(2 downto 0);
signal modeALUBuffer :  std_logic_vector(2 downto 0) := "000";
signal modeIO : std_logic;
signal modeIOBuffer : std_logic := '0';
signal operand1, operand2 : std_logic_vector(15 downto 0);
signal operand1Buffer : std_logic_vector(15 downto 0) := X"0000";
signal operand2Buffer : std_logic_vector(15 downto 0) := X"0000";
signal decodeWriteBackReg : std_logic_vector(2 downto 0);
signal decodeWriteBackRegBuffer : std_logic_vector(2 downto 0) := "000";
signal result : std_logic_vector(15 downto 0);
signal resultBuffer : std_logic_vector(15 downto 0) := X"0000";

signal execWriteBackReg : std_logic_vector(2 downto 0);
signal execWriteBackRegBuffer : std_logic_vector(2 downto 0) := "000";

begin

u0 : fetchStage port map(
    clk=>clk,
    instruction=>fetchedInstruction
);

u1 : decodeStage port map(
    clk => clk,
    instruction => fetchedInstructionBuffer,
    useALU => useALU,
    modeALU => modeALU,
    operand1 => operand1,
    operand2 => operand2,
    destReg => decodeWriteBackReg
);

u2 : executeStage port map(
    clk=>clk,
    useALU=>useALUBuffer,
    useIO=>useIOBuffer,
    modeALU=>modeALUBuffer,
    modeIO=>modeIOBuffer,
    operand1=>operand1Buffer, 
    operand2=>operand2Buffer,
    inputCPU => input,
    outputRegIn => decodeWriteBackRegBuffer,
    outputRegOut => execWriteBackReg,
    result=>result,
    outputCPU=>output
    --execFreezePipe
);

process(clk)
begin

    if rising_edge(clk) then
        fetchedInstructionBuffer <= fetchedInstruction;
        
        resultBuffer<=result;
        
        useALUBuffer <= useALU;
        useIOBuffer <= useIO;
        modeALUBuffer <= modeALU;
        modeIO <= modeIO;
        operand1Buffer <= operand1;
        operand2Buffer <= operand2;
        decodeWriteBackRegBuffer <= decodeWriteBackReg;
        
        execWriteBackRegBuffer <= execWriteBackReg;
    end if;

end process;

end Behavioral;
