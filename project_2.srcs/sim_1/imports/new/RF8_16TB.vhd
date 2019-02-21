library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
use work.all;

entity test_alu is end test_alu;

architecture behavioural of test_alu is

component alu port(
    in1, in2: in std_logic_vector(15 downto 0);
    mode: in std_logic_vector(2 downto 0);
    mulFlag : out std_logic_vector(1 downto 0);
    clk, rst: in std_logic;
    result: out std_logic_vector(15 downto 0);
    z, n: out std_logic);
end component;

-- Signal declarations
signal rst, clk, n, z : std_logic;
signal  mode : std_logic_vector(2 downto 0); 
signal in1, in2, result : std_logic_vector(15 downto 0);
signal mulStatus : std_logic_vector(1 downto 0);

begin

u1: alu port map(in1 => in1, in2 => in2, mode => mode, clk => clk, rst => rst, result => result, n => n, z => z, mulFlag => mulStatus);

process begin
    clk <= '0'; wait for 10 us;
    clk <= '1'; wait for 10 us; 
end process;

process  begin
--initialization
    rst <= '1';
    in1 <= X"0000";
    in2 <= X"0000";
    mode<="001";
    wait until (clk='0' and clk'event);
    wait until (clk='1' and clk'event);
        rst <= '0';
    wait until (clk='0' and clk'event);

-- bitwise NAND test
    wait until (clk='1' and clk'event);
        in1 <= "1100110011001100";
        in2 <= "1010101010101010";
        mode <= "100";
    wait until (clk='0' and clk'event);

-- unary test
    wait until (clk='1' and clk'event);
        in1 <= X"FFFF";
        in2 <= X"EEEE";
        mode <= "001";
    wait until (clk='0' and clk'event);
    wait until (clk='1' and clk'event);
        mode <= "010";
    wait until (clk='0' and clk'event);

-- multiplier test
        wait until (clk='1' and clk'event);
            in1 <= X"0024";
            in2 <= X"00FF";
            mode <= "011";
        wait until (clk='0' and clk'event);

-- shift test
    wait until (clk='1' and clk'event);
        in1 <= X"aa22";
        in2 <= X"0002";
        mode <= "110";
    wait until (clk='0' and clk'event);

-- test test
    wait until (clk='1' and clk'event);
        in1 <= X"0000";
        mode <= "111";
    wait until (clk='0' and clk'event);
    wait until (clk='1' and clk'event);
        in1 <= X"FFFF";
    wait until (clk='0' and clk'event);
    wait until (clk='1' and clk'event);
        in1 <= X"0FFF";
    wait until (clk='0' and clk'event);
    wait;
end process;

end behavioural;