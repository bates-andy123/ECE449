----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2019 04:09:59 PM
-- Design Name: 
-- Module Name: memoryController_TB - Behavioral
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

entity memoryController_TB is
--  Port ( );
end memoryController_TB;

architecture Behavioral of memoryController_TB is

component memoryController Port (
    -- Clock flag
    clk : in std_logic; -- Clk flag
    
    -- Port information shared between RAM and ROM
    readOnlyAddress : in std_logic_vector(15 downto 0); -- Address to either read from RAM port B or ROM
    outputOnReadOnlyChannel : out std_logic_vector(15 downto 0) := X"0000";
    
    -- Port information relating to RAM controller
    addressARAM : in std_logic_vector(15 downto 0); -- Address to read/write from in RAM port A
    writeContentRAM : in std_logic_vector(15 downto 0); -- Content to write to RAM port A
    outaContentRAM : out std_logic_vector(15 downto 0); -- Content read from port A of RAM
    weaRAM : in std_logic_vector(0 downto 0); -- Write enable vector for port A in RAM
    rstaRAM : in std_logic; -- Reset signal for port A in RAM
    rstbRAM : in std_logic; -- Reset signal for port B in RAM
    regceaRAM : in std_logic; -- Clock enable for last register stage on output data path
    
    -- Port information relating to ROM controller
    rstaROM : in std_logic
);
end component;

signal clk : std_logic := '0';
signal readOnlyAddressIn : std_logic_vector(15 downto 0) := X"0000"; -- Address to either read from RAM port B or ROM
signal outputOnReadOnlyChannelOut : std_logic_vector(15 downto 0);

-- Port information relating to RAM controller
signal addressARAMIn : std_logic_vector(15 downto 0) := X"0000"; -- Address to read/write from in RAM port A
signal writeContentRAMIn : std_logic_vector(15 downto 0) := X"0000"; -- Content to write to RAM port A
signal outaContentRAMOut : std_logic_vector(15 downto 0); -- Content read from port A of RAM

begin

memCtrl : memoryController port map(
    clk=>clk,
    readOnlyAddress=>readOnlyAddressIn,
    outputOnReadOnlyChannel=>outputOnReadOnlyChannelOut,
    addressARAM=>addressARAMIn,
    writeContentRAM=>writeContentRAMIn,
    outaContentRAM=>outaContentRAMOut,
    weaRAM=>"0",
    rstaRAM=>'0',
    rstbRAM=>'0',
    regceaRAM=>'1',
    rstaROM=>'0'
);

process begin
    clk<='0';
    wait for 5us;
    clk<='1';
    wait for 5us;
end process;

process begin 
    wait until falling_edge(clk);
        readOnlyAddressIn <= X"0000";
        addressARAMIn <= X"0000";
    wait until falling_edge(clk);
        readOnlyAddressIn <= X"0001";
        addressARAMIn <= X"0001";
    wait until falling_edge(clk);
        readOnlyAddressIn <= X"0003";
        addressARAMIn <= X"0003";
    wait until falling_edge(clk);
        readOnlyAddressIn <= X"0002";
        addressARAMIn <= X"0002";
    wait until falling_edge(clk);
        readOnlyAddressIn <= X"0012";
        addressARAMIn <= X"0012";
    wait until falling_edge(clk);
        readOnlyAddressIn <= X"0013";
        addressARAMIn <= X"0002";
    wait until falling_edge(clk);
        readOnlyAddressIn <= X"0022";
        addressARAMIn <= X"0002";
    wait;
end process;


end Behavioral;
