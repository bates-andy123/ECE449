----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 12:56:00 PM
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
    clk : in std_logic; -- Clk flag
    
    -- Port information relating to RAM controller
    addressARAM : in std_logic_vector(7 downto 0); -- Address to read/write from in RAM port A
    addressBRAM : in std_logic_vector(7 downto 0); -- Address to read from in RAM port B
    writeContentRAM : in std_logic_vector(15 downto 0); -- Content to write to RAM port A
    outaContentRAM : out std_logic_vector(15 downto 0); -- Content read from port A of RAM
    outbContentRAM : out std_logic_vector(15 downto 0); -- Content read from port B of RAM
    weaRAM : in std_logic_vector(0 downto 0); -- Write enable for port A in RAM
    rstaRAM : in std_logic; -- Reset signal for port A in RAM
    rstbRAM : in std_logic; -- Reset signal for port B in RAM
    enaRAM : in std_logic; -- Enable signal for port A of RAM
    enbRAM : in std_logic; -- Enable signal for port B of RAM
    regceaRAM : in std_logic; -- Clock enable for the last register stage on the output data path
    regcebRAM : in std_logic; -- Do not change from default value
    
    -- Port information relating to ROM controller
    addressROM : in std_logic_vector(7 downto 0); -- Address to read from in ROM
    outContentROM : out std_logic_vector(15 downto 0); -- Content read from RAM
    enaROM : in std_logic; -- Enable signal for ROM
    regceaROM : in std_logic; -- Clock enable for 
    rstaROM : in std_logic; -- Reset signal for ROM
    sleepROM : in std_logic -- Sleep signal to enable dynamic power saving
);
end memoryController;

architecture Behavioral of memoryController is

-- Component declaration for RAM module
component RAMController port(
    douta : out std_logic_vector (15 downto 0);
    doutb : out std_logic_vector (15 downto 0);
    addra, addrb : in std_logic_vector (7 downto 0); -- The address for port A read/write operations, and port B read operations
    dina : in std_logic_vector (15 downto 0); -- Data in for port A
    wea : in std_logic_vector (0 downto 0); -- Write enable for port A input data port dina
    clka, ena, enb, regcea, regceb, rsta, rstb : in std_logic);
end component;

-- Component declaration for ROM module
component ROMController Port (
    clka, ena, regcea, rsta, sleep : in std_logic;
    addra : in std_logic_vector (7 downto 0);
    douta : out std_logic_vector (15 downto 0));
end component;

begin

u0 : RAMController port map(douta => outaContentRAM, doutb => outbContentRAM, addra => addressARAM, addrb => addressBRAM, dina => writeContentRAM, wea => weaRAM,
                    clka => clk, ena => enaRAM, enb => enbRAM, regcea => regceaRAM, regceb => regcebRAM, rsta => rstaRAM, rstb => rstbRAM);
u1 : ROMController port map(addra => addressROM, douta => outContentROM, clka => clk, ena => enaROM, regcea => regceaROm, rsta => rstaROM, sleep => sleepROM);

process(clk)
begin
    -- Read on rising edges
    if rising_edge(clk) then
        
    -- Write on falling edges
    elsif falling_edge(clk) then
        
    end if;
end process;
end Behavioral;