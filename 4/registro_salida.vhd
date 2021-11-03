library IEEE;
use IEEE.std_logic_1164.all;
entity registro_salida is port(
  clk, rst : in std_logic;
  data_in : in std_logic_vector(4 downto 0);
  salidas : out std_logic_vector(4 downto 0)
  );
end registro_salida ;
architecture behavioral of registro_salida is
  signal int_val : std_logic_vector(4 downto 0) := b"00000";
begin
  process (clk, rst, data_in)
  begin
    if rst = '1' then
      int_val <= b"00000";
    elsif rising_edge(clk) then
      int_val(4 downto 0) <= data_in;
    end if;
  end process;
  process(int_val)
  begin
    salidas <= int_val;
  end process;
end behavioral;
