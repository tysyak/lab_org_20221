library IEEE;
use IEEE.std_logic_1164.all;
entity selector_entrada is
  port (
    valor_salida : out std_logic;
    prueba: in std_logic_vector(2 downto 0);
    w, x, y, z, aux : in std_logic
    );
end entity;
architecture arch_selector_entrada of selector_entrada is
  signal selInt : std_logic_vector (2 downto 0);
begin
  selInt <= prueba;
  valor_salida <= x when selInt = "000" else
                  y when selInt = "001" else
                  z when selInt = "010" else
                  w when selInt = "011" else
                  aux when selInt = "011" else
                  'U';
end architecture;
