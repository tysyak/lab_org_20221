library ieee;
use ieee.std_logic_1164.all;

entity separador is port (
  data_in : in std_logic_vector (14 downto 0);
  prueba: out std_logic_vector(2 downto 0);
  vf : out std_logic;
  liga : out std_logic_vector(2 downto 0);
  salida_falsa : OUT std_logic_vector(3 DOWNTO 0);
  salida_verdadera : OUT std_logic_vector(3 DOWNTO 0)
  );
end separador;
architecture behavioral of separador is
begin
  process (data_in)
  begin
    vf <= data_in(11);
    liga <= data_in(10 downto 8);
    salida_falsa <= data_in(7 downto 4);
    salida_verdadera <= data_in(3 downto 0);
  end process;
end behavioral;
