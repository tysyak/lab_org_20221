library IEEE;
use IEEE.std_logic_1164.all;
entity registros_entrada is
  port (
    q : out std_logic_vector (5 downto 0);
    ent : in std_logic_vector (2 downto 0);
    liga : in std_logic_vector (2 downto 0);
    rst, clk: in std_logic
    );
end entity registros_entrada;
architecture arch_registros_entrada of registros_entrada is
begin
  identifier : process (clk)
  begin
    if (rising_edge(clk)) then
      if rst = '1' then
        q <= "000000";
      else
        q <= liga & ent;
      end if;
    end if;
  end process;
end architecture arch_registros_entrada;
