library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador is
  port(
    clk: in std_logic;
    rst: in std_logic;
    load: in std_logic;
    salida_count: out std_logic_vector(2 downto 0);
    liga: in std_logic_vector(2 downto 0) -- el que no es continuo
    );
end entity;

architecture rtl of contador is
  signal cuenta : integer range 0 to 7;


begin
  process(clk,rst)
  begin
    if (rst='1') then
      cuenta <= 0;
    elsif(rising_edge(clk)) then
      if load = '1' then
        cuenta<= to_integer(unsigned(liga));
      else
        if(cuenta=7) then
          cuenta <= 0;
        else
          cuenta <= cuenta + 1;
        end if;
      end if;
    end if;
  end process;

  salida_count <= std_logic_vector(to_unsigned(cuenta, 3));

end architecture;
