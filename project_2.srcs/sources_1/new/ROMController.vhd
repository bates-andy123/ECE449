----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2019 12:58:44 PM
-- Design Name: 
-- Module Name: myROMController - Behavioral
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


library IEEE, xpm;
use IEEE.STD_LOGIC_1164.ALL, xpm.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROMController is Port (
  clka, ena, rsta : in std_logic;
  addra : in std_logic_vector (7 downto 0);
  douta : out std_logic_vector (15 downto 0)
);
end ROMController;

architecture Behavioral of ROMController is

begin

-- xpm_memory_sprom: Single Port ROM
-- Xilinx Parameterized Macro, version 2018.3
xpm_memory_sprom_inst : xpm_memory_sprom

generic map (
 ADDR_WIDTH_A => 6, -- DECIMAL
 AUTO_SLEEP_TIME => 0, -- DECIMAL
 ECC_MODE => "no_ecc", -- String
 MEMORY_INIT_FILE => "ROM5.mem", -- String
 MEMORY_INIT_PARAM => "0", -- String
 MEMORY_OPTIMIZATION => "true", -- String
 MEMORY_PRIMITIVE => "auto", -- String
 MEMORY_SIZE => (128*8), -- DECIMAL
 MESSAGE_CONTROL => 0, -- DECIMAL
 READ_DATA_WIDTH_A => 16, -- DECIMAL
 READ_LATENCY_A => 1, -- DECIMAL
 READ_RESET_VALUE_A => "0", -- String
-- RST_MODE_A => "SYNC", -- String
 USE_MEM_INIT => 1, -- DECIMAL
 WAKEUP_TIME => "disable_sleep" -- String
)
port map (
 dbiterra => open, -- 1-bit output: Leave open.
 douta => douta, -- READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
 sbiterra => open, -- 1-bit output: Leave open.
 addra => addra(5 downto 0), -- ADDR_WIDTH_A-bit input: Address for port A read operations.
 clka => clka, -- 1-bit input: Clock signal for port A.
 ena => ena, -- 1-bit input: Memory enable signal for port A. Must be high on clock
 -- cycles when read operations are initiated. Pipelined internally.
 injectdbiterra => '0', -- 1-bit input: Do not change from the provided value.
 injectsbiterra => '0', -- 1-bit input: Do not change from the provided value.
 regcea => '1', -- 1-bit input: Do not change from the provided value.
 rsta => rsta, -- 1-bit input: Reset signal for the final port A output register
 -- stage. Synchronously resets output port douta to the value specified
 -- by parameter READ_RESET_VALUE_A.
 sleep => '0' -- 1-bit input: sleep signal to enable the dynamic power saving feature.
);

-- End of xpm_memory_sprom_inst instantiation

end Behavioral;