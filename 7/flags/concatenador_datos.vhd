library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity concatenador_datos is
  port (
    d0 : in std_logic;
    d1 : in std_logic;
    d2 : in std_logic;
    d3 : in std_logic;
    d4 : in std_logic;
    d5 : in std_logic;
    d6 : in std_logic;
    d7 : in std_logic;
    data: out std_logic_vector(7 downto 0));
end concatenador_datos;

architecture behavioral of concatenador_datos is
begin
  process(d0, d1, d2, d3, d4, d5, d6, d7)
  begin
    data <= d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0;
  end process;
end behavioral;
