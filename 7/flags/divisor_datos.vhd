library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity divisor_datos is
  port (
    input : in std_logic_vector (7 downto 0);
    d0: out std_logic;
    d1: out std_logic;
    d2: out std_logic;
    d3: out std_logic;
    d4: out std_logic;
    d5: out std_logic;
    d6: out std_logic;
    d7: out std_logic;
    gnd: out std_logic);
end divisor_datos;

architecture behavioral of divisor_datos is
begin
  gnd <= '0';
  process(input)
  begin
    d0 <= input(0);
    d1 <= input(1);
    d2 <= input(2);
    d3 <= input(3);
    d4 <= input(4);
    d5 <= input(5);
    d6 <= input(6);
    d7 <= input(7);
  end process;
end behavioral;
