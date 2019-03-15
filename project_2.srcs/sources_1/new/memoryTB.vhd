library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  the entity for your test bench code must be declared
--  as follows:

entity memoryTB is
end memoryTB;

architecture simulate of memoryTB is
    -- Clock flag
    signal clk : std_logic; -- Clk flag
    
    -- Port information shared between RAM and ROM
    signal readOnlyAddress : std_logic_vector(15 downto 0) := X"0000"; -- Address to either read from RAM port B or ROM
    signal outputOnReadOnlyChannel : std_logic_vector(15 downto 0) := X"0000";
    
    -- Port information relating to RAM controller
    signal addressARAM : std_logic_vector(15 downto 0); -- Address to read/write from in RAM port A
    signal writeContentRAM : std_logic_vector(15 downto 0); -- Content to write to RAM port A
    signal outaContentRAM : std_logic_vector(15 downto 0); -- Content read from port A of RAM
    signal weaRAM : std_logic_vector(0 downto 0) := "1"; -- Write enable vector for port A in RAM
    signal rstaRAM : std_logic := '0'; -- Reset signal for port A in RAM
    signal rstbRAM : std_logic := '0'; -- Reset signal for port B in RAM
    signal regceaRAM : std_logic := '0'; -- Clock enable for last register stage on output data path
    
    -- Port information relating to ROM controller
    signal rstaROM : std_logic := '0'; -- Reset signal for ROM
    signal sleepROM : std_logic := '0'; -- Sleep signal to enable dynamic power saving
begin

-- entity instantiation (uut = "unit under test")
-- the name of the entity ("Example2" in this example) must
-- match the name of your upper level entity that you are
-- simulating.  Also the word "work" must be used as shown.
-- You should do explicit connections in the port map as follows
-- (otherwise you get a warning):
--      ( ip1 => ip1_s, ip2 => ip2_s, sum => sum_s, ca => ca_s);

uut : entity work.memoryController port map(
        -- Clock flag
        clk => clk,

        -- Port information shared between RAM and ROM
        readOnlyAddress => readOnlyAddress,
        outputOnReadOnlyChannel => outputOnReadOnlyChannel,
        
        -- Port information relating to RAM controller
        addressARAM => addressARAM,
        writeContentRAM => writeContentRAM,
        outaContentRAM => outaContentRAM,
        weaRAM => weaRAM,
        rstaRAM => rstaRAM,
        rstbRAM => rstbRAM,
        regceaRAM => regceaRAM,
        
        -- Port information relating to ROM controller
        rstaROM => rstaROM,
        sleepROM  => sleepROM
);

-- specify a sequence of inputs for simulating our design

process 
begin
    clk <= '0';
    addressARAM <= X"0400";
    writeContentRAM <= X"0001";
    wait for 100 us;
    
    clk <= '1';
    wait for 100 us;
    
    clk <= '0';
    readOnlyAddress <= X"0001";
    wait for 100 us;
    
    clk <= '1';
    wait for 100 us;
    
    clk <= '0';
    wait for 100 us;
    
    clk <= '1';
    wait for 100 us;
    
    clk <= '0';
    readOnlyAddress <= X"0400";
    wait for 100 us;
    
    clk <= '1';
    wait for 100 us;
    
    clk <= '0';
    wait for 100 us;
    
    clk <= '1';
    wait for 100 us;    
end process;

end simulate;