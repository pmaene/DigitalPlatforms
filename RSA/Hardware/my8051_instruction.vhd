library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.std_logic_arithext.all;


-- datapath entity
entity my8051_instruction is
port(
     data                   : out std_logic_vector(7 downto 0);
     RST                    : in  std_logic;
     CLK                    : in  std_logic
);
end my8051_instruction;


architecture RTL of my8051_instruction is
begin

-- VHDL view of ipblock

end RTL;
