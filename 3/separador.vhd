library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity separador is port (
  clk, rst : in std_logic;
  data_in : in std_logic_vector (8 downto 0);
  estado_siguiente : out std_logic_vector (2 downto 0);
  salidas : out std_logic_vector (5 downto 0)
  );
end separador;
architecture behavioral of separador is
  signal internal_value : std_logic_vector (8 downto 0) := b"000000000";
begin
  process (clk, rst, data_in)
  begin
    if rst = '1' then
      internal_value <= b"000000000";
    elsif rising_edge(clk) then
      internal_value <= data_in;
    end if;
  end process;
  process (internal_value)
  begin
    estado_siguiente <= internal_value(8 downto 6);
    salidas <= internal_value(5 downto 0);
  end process;
end behavioral;
