library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  the entity for your test bench code must be declared
--  as follows:

entity RAMTestBench is
end RAMTestBench;

architecture simulate of RAMTestBench is
    signal douta, doutb : std_logic_vector (15 downto 0);
    signal addra, addrb :  std_logic_vector (15 downto 0);
    signal dina :  std_logic_vector (15 downto 0);
    signal wea :  std_logic_vector (0 downto 0) := "1";
    signal clka : std_logic;
    signal clkb : std_logic;
    signal ena : std_logic := '1'; -- Must be 1 on clock cycles read or write operations are initiated
    signal enb : std_logic := '1'; -- Must be 1 on clock cycles read or write operations are initiated
    signal regcea : std_logic := '0'; -- 0 for writing, 1 for reading
    signal regceb : std_logic := '1'; -- Leave as 1 so that port B is always an output
    signal rsta : std_logic := '0'; -- Reset signal for port A
    signal rstb : std_logic := '0'; -- Reset signal for port B
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
    addra <= X"002C";
    dina <= X"0050";
    clka <= '0';
    wait for 100 us;
    
    clka <= '1';
    addrb <= addra;
    wait for 100 us;
    
    clka <= '0';
    --addrb <= addra;
    wait for 100 us;
    
    clka <= '1';
    --addrb <= addra;
    wait for 100 us;
    
    addra <= X"002D";
    dina <= X"0052";
    clka <= '0';
    wait for 100 us;
    
    clka <= '1';
    addrb <= addra;
    wait for 100 us;
    
    clka <= '0';
    --addrb <= addra;
    wait for 100 us;
    
    clka <= '1';
    dina <= X"0054";
    wait for 100 us;
    
    clka <= '0';
    wait for 100 us;
    
    clka <= '1';
    wait for 100 us;
    
    clka <= '0';
    wait for 100 us;
    
    clka <= '1';
    wait for 100 us;

    
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