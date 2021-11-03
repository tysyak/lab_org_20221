library IEEE;
use IEEE.std_logic_1164.all;
entity selector_salida is
  port (
    valor_entrada : in std_logic;
    salida_falsa: in std_logic_vector(4 downto 0);
    salida_verdadera: in std_logic_vector(4 downto 0);
    salida: out std_logic_vector(4 downto 0)
    );
end entity;
architecture arch_selector_salida of selector_salida is
begin
  process(valor_entrada)
  begin
    case(valor_entrada) is
      when '1' => salida <= salida_verdadera;
      when '0' => salida <= salida_falsa;
    end case;
  end process;
end architecture;
