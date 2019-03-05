library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--  the entity for your test bench code must be declared
--  as follows:

entity RAMTestBench is
end RAMTestBench;

architecture simulate of RAMTestBench is
	 signal douta, doutb : std_logic_vector (15 downto 0);
     signal addra, addrb :  std_logic_vector (7 downto 0);
     signal dina :  std_logic_vector (15 downto 0);
     signal wea :  std_logic_vector (0 downto 0);
     signal clka, clkb, ena, enb, regcea, regceb, rsta, rstb : std_logic;

begin

-- entity instantiation (uut = "unit under test")
-- the name of the entity ("Example2" in this example) must
-- match the name of your upper level entity that you are
-- simulating.  Also the word "work" must be used as shown.
-- You should do explicit connections in the port map as follows
-- (otherwise you get a warning):
--      ( ip1 => ip1_s, ip2 => ip2_s, sum => sum_s, ca => ca_s);

uut : entity work.RAMController port map(
        douta => douta, 
        doutb => doutb, 
        addra => addra, 
        addrb => addrb, 
        dina => dina, 
        wea => wea, 
        clka => clka, 
        clkb => clkb, 
        ena => ena, 
        enb => enb, 
        regcea => regcea, 
        regceb => regceb, 
        rsta => rsta, 
        rstb => rstb
);

-- specify a sequence of inputs for simulating our design

process 
begin
    addra <= x"2c";
    dina <= x"0050";
    wea <= "1";
    clka <= '0';
    ena <= '1';
    enb <= '1';    
    regcea <= '0';
    regceb <= '1';
    rsta <= '0';
    rstb <= '0';
    wait for 10 ns;
    
    clka <= '1';
    addrb <= addra;
    wait for 10ns;
    wait for 20 ns;

    
--    douta <= ;
--    doutb <= ;
--    addra <= ;
--    wea <= ;
--    clka <= ;
--    clkb <= ;
--    ena <= ;
--    enb <= ;
--    regcea <= ;
--    regceb <= ;
--    rsta <= ;
--    rstb <= ;
--    wait for 10 ns;
end process;

end simulate;