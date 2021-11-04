library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity selector_salida is port (
  carga : in std_logic;
  incrementa : in std_logic;
  salida_incremento : in std_logic_vector (3 downto 0);
  salida_carga : in std_logic_vector (3 downto 0);
  salida : out std_logic_vector (3 downto 0)
  );
end selector_salida;

architecture behavioral of selector_salida is
begin
  process (carga, incrementa)
  begin
    if carga = '1' then
      salida <= salida_carga;
    elsif incrementa = '1' then
      salida <= salida_incremento;
    else
      salida <= "1000";
    end if;
  end process;
end behavioral;
