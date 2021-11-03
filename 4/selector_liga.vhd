library IEEE;
use IEEE.std_logic_1164.all;
entity selector_liga is
  port (
    valor_entrada : in std_logic;
    liga_falsa: in std_logic_vector(2 downto 0);
    liga_verdadera: in std_logic_vector(2 downto 0);
    liga: out std_logic_vector(2 downto 0)
    );
end entity;
architecture arch_selector_liga of selector_liga is
begin
  process(valor_entrada)
  begin
    case(valor_entrada) is
      when '1' => liga <= liga_verdadera;
      when '0' => liga <= liga_falsa;
    end case;
  end process;
end architecture;
