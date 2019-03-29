----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 10:28:20 AM
-- Design Name: 
-- Module Name: memoryController - Behavioral
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

entity memoryController is

Port (
    -- Clock flag
    clk : in std_logic; -- Clk flag
    
    -- Port information shared between RAM and ROM
    readOnlyAddress : in std_logic_vector(15 downto 0); -- Address to either read from RAM port B or ROM
    outputOnReadOnlyChannel : out std_logic_vector(15 downto 0) := X"0000";
    
    -- Port information relating to RAM controller
    addressARAM : in std_logic_vector(15 downto 0); -- Address to read/write from in RAM port A
    writeContentRAM : in std_logic_vector(15 downto 0); -- Content to write to RAM port A
    outaContentRAM : out std_logic_vector(15 downto 0); -- Content read from port A of RAM
    weaRAM : in std_logic; -- Write enable vector for port A in RAM
    rstaRAM, rst : in std_logic; -- Reset signal for port A in RAM
    rstbRAM : in std_logic; -- Reset signal for port B in RAM
    regceaRAM : in std_logic; -- Clock enable for last register stage on output data path
    
    -- Port information relating to ROM controller
    rstaROM : in std_logic; -- Reset signal for ROM,
    
    hexDigitsOut : out std_logic_vector(15 downto 0);
    inputIn : in std_logic_vector(15 downto 0)
);
end memoryController;

architecture Behavioral of memoryController is


-- Component declaration for RAM module
component RAMController port(
    addra, addrb : in std_logic_vector (9 downto 0); -- The address for port A read/write operations, and port B read operations
    dina : in std_logic_vector (15 downto 0); -- Data in for port A
    wea : in std_logic_vector (0 downto 0); -- Write enable for port A input data port dina
    douta : out std_logic_vector (15 downto 0); -- Data out from port A
    doutb : out std_logic_vector (15 downto 0); -- Data out from port B
    regceb : in std_logic; -- Leave always at '1'
    clka, ena, enb, regcea, rsta, rstb : in std_logic);
    
end component;

-- Component declaration for ROM module
component ROMController Port (
    clka, ena, rsta : in std_logic;
    addra : in std_logic_vector (7 downto 0);
    douta : out std_logic_vector (15 downto 0)
);
end component;

signal readOnlyAddressShifted, addressARAMShifted : std_logic_vector(9 downto 0);

signal weaRAMBuffer : std_logic := '0';

-- Signal declarations
signal outbContentRAM, outContentROM : std_logic_vector(15 downto 0);
signal weaRAMVector : std_logic_vector(0 downto 0);

signal outaContentRAMBuffer : std_logic_vector(15 downto 0);

begin

readOnlyAddressShifted <= "0" & readOnlyAddress(9 downto 1);
addressARAMShifted <= "0" & addressARAM(9 downto 1);

weaRAMVector <= ("" & weaRAMBuffer);

u0 : RAMController port map(
    douta => outaContentRAMBuffer, 
    doutb => outbContentRAM, 
    addra => addressARAMShifted, 
    addrb => readOnlyAddressShifted, 
    dina => writeContentRAM,
    wea => weaRAMVector, 
    clka => clk, 
    ena => '1', 
    enb => '1', 
    regcea => regceaRAM, 
    regceb => '1', 
    rsta => rstaRAM, 
    rstb => rstbRAM
);

u1 : ROMController port map(
    douta => outContentROM, 
    addra => readOnlyAddressShifted(7 downto 0), 
    clka => clk, ena => '1', 
    rsta => rstaROM
);
    
    with addressARAM select
        weaRAMBuffer <=
            '0' when X"FFF2" | X"FFF0",
            weaRAM when others;

    with addressARAM select
        outaContentRAM <= 
            inputIn when X"FFF0",
            outaContentRAMBuffer when others;

--with readOnlyAddress(10) select
--    outputOnReadOnlyChannel <=
--        outbContentRAM when '1',
--        outContentROM when others;

process(clk)	
begin        
    if falling_edge(clk) then            
        if (readOnlyAddress(10) = '1') then            
            outputOnReadOnlyChannel <= outbContentRAM;    
         else    
            outputOnReadOnlyChannel <= outContentROM;    
        end if;        
    end if;    
end process;

process(clk, rst) begin
    if (rst='1') then
        hexDigitsOut <= X"0000";
    elsif (rising_edge(clk) and weaRAM = '1') then
    
        if (addressARAM = X"FFF2") then
            hexDigitsOut <= writeContentRAM;
        end if;
    end if;
end process;

end Behavioral;

