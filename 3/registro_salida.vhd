library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity registro_salida is port (
  clk, rst : in std_logic;
  data_in : in std_logic_vector (5 downto 0);
  salidas : out std_logic_vector (5 downto 0)
  );
end registro_salida;
architecture behavioral of registro_salida is
  signal internal_value : std_logic_vector (5 downto 0) := b"000000";
begin
  process (clk, rst, data_in)
  begin
    if rst = '1' then
      internal_value <= b"000000";
    elsif rising_edge(clk) then
      internal_value <= data_in;
    end if;
  end process;
  process (internal_value)
  begin
    salidas <= internal_value;
  end process;
end behavioral;
