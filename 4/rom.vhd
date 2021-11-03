library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity rom is
  generic(
    data_width : natural := 19;
    addr_length : natural := 3
    );
  port(
    clk: in std_logic;
    address: in std_logic_vector(addr_length-1 downto 0);
    data_out: out std_logic_vector(data_width-1 downto 0);
    mon_memoria: out std_logic_vector(data_width-1 downto 0)
    );
end rom;
architecture behavioral of rom is
  constant mem_size: natural := 7;
  type mem_type is array (mem_size-1 downto 0) of std_logic_vector(data_width-1 downto 0);
  constant mem : mem_type :=
    (
      0=>b"1000010010000000000",
      1=>b"0100101000001000010",
      2=>b"1000110110000000000",
      3=>b"0001011100100001000",
      4=>b"0110010101000010000",
      5=>b"1000110110000000000",
      6=>b"0011010100001010010",
      others=>b"1111111111111111111"
      );
begin
  rom : process(clk)
  begin
    if rising_edge(clk) then
      data_out <= mem(to_integer(unsigned(address)));
    end if;
  end process rom;
end architecture behavioral;
