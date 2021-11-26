library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity registro_microinst is
  port (
	reloj : in std_logic;
	reset : in std_logic;
	entrada  : in std_logic_vector(11 downto 0);
	salida : out std_logic_vector(11 downto 0));
end registro_microinst;

architecture behavioral of registro_microinst is
  signal valor_interno : std_logic_vector (11 downto 0) := x"000";
begin
  process (reloj, reset, entrada)
  begin
	if reset = '0' then
	  valor_interno <= x"000";
	elsif rising_edge (reloj) then
	  valor_interno <= entrada + 1;
	end if;
  end process;

  process (valor_interno)
  begin
	salida <= valor_interno;
  end process;
end behavioral;
