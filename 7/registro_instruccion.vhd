library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity registro_instruccion is
  port (
	reloj : in std_logic;
	ena : in std_logic;
	reset : in std_logic;
	entrada  : in std_logic_vector(7 downto 0);
	salida : out std_logic_vector(11 downto 0));
end registro_instruccion;

architecture behavioral of registro_instruccion is
  signal valor_interno : std_logic_vector (11 downto 0) := x"000";
begin
  process (reloj, reset, entrada, ena)
  begin
	if reset = '0' then
	  valor_interno <= x"000";
	elsif falling_edge(reloj) and ena = '0' then
	  valor_interno <= entrada & x"0";
	end if;
  end process;

  process (valor_interno)
  begin
	salida <= valor_interno;
  end process;
end behavioral;
