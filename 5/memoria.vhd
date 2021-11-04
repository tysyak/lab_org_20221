library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity memoria is
  generic(
    data_width : natural := 15;
    addr_length : natural := 3
    );
  port(
    clk: in std_logic;
    address: in std_logic_vector(2 downto 0);
    data_out: out std_logic_vector(14 downto 0)
    );
end memoria;
architecture behavioral of memoria is
  constant mem_size: natural := 15;
  type mem_type is array (mem_size-1 downto 0) of std_logic_vector(data_width-1 downto 0);
  constant mem : mem_type :=
    (
      0 => b"000111000110101",
      1 => b"010011110111000",
      2 => b"011010110101111",
      3 => b"100110001010101",
      4 => b"001101011111111",
      5 => b"100001110111011",
      6 => b"100010001010101",
      7 => b"100000100000000",
      others=>b"111111111111111"
      );
begin
  rom : process(clk)
  begin
    if rising_edge(clk) then
      data_out <= mem(to_integer(unsigned(address)));
    end if;
  end process rom;
end architecture behavioral;
