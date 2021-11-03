library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity separador is port (
  data_in : in std_logic_vector (18 downto 0);
  prueba:
  out std_logic_vector(2 downto 0);
  salida_falsa: out std_logic_vector(4 downto 0);
  salida_verdadera: out std_logic_vector(4 downto 0);
  liga_falsa:  out std_logic_vector(2 downto 0);
  liga_verdadera:  out std_logic_vector(2 downto 0)
  );
end separador;
architecture behavioral of separador is
begin
  process (data_in)
  begin
    prueba <= data_in(18 downto 16);
    liga_falsa<= data_in(15 downto 13);
    liga_verdadera<= data_in(12 downto 10);
    salida_falsa<= data_in(9 downto 5);
    salida_verdadera<= data_in(4 downto 0);
  end process;
end behavioral;
