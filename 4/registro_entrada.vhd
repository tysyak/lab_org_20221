library IEEE;
use IEEE.std_logic_1164.all;
entity registro_entrada is port(
  clk, rst : in std_logic;
  estado_siguiente : in std_logic_vector(2 downto 0);
  data_out : out std_logic_vector(2 downto 0);
  mon_estado_siguiente: out td_logic_vector(2 downto 0)
  );
end registro_entrada;
architecture behavioral of registro_entrada is
  signal int_val : std_logic_vector(2 downto 0) := b"000";
begin
  process (clk, rst, estado_siguiente)
  begin
    if rst = '1' then
      int_val <= b"000";
    elsif rising_edge(clk) then
      mon_estado_siguiente <= estado_siguiente;
      int_val(2 downto 0) <= estado_siguiente;
    end if;
  end process;
  process(int_val)
  begin
    data_out <= int_val;
  end process;
end behavioral;
