library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity selector_salida is port (
  qsel : in std_logic;
  salida_falsa : in std_logic_vector (3 downto 0);
  salida_verdadera : in std_logic_vector (3 downto 0);
  salida : out std_logic_vector (3 downto 0)
  );
end selector_salida;

architecture behavioral of selector_salida is
begin
  process (qsel)
  begin
    if qsel = '1' then
      salida <= salida_verdadera;
    else
      salida <= salida_falsa;
    end if;
  end process;
end behavioral;
