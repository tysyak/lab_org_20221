library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bufferdatabus is
  port(
    portl, portr: inout std_logic_vector(7 downto 0);
    nrw: in std_logic;
    bd: in std_logic);
end bufferdatabus;

architecture behavioral of bufferdatabus is

begin

	portr <= portl when (nrw = '0' and bd = '1') else (others => 'Z');
	portl <= portr when (nrw = '1' and bd = '1') else (others => 'Z');

end behavioral;
