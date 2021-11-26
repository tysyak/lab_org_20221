library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

entity acumulador is
  port(
	e : in std_logic_vector(1 downto 0);
	a : inout std_logic_vector(7 downto 0);
	b : inout std_logic_vector(7 downto 0);
	c : inout std_logic_vector(7 downto 0);
	nw : in std_logic;
	clk : in std_logic;
	z : out std_logic;
	n : out std_logic;
	debug : out std_logic_vector(7 downto 0)
	);
end acumulador;

architecture behavioral of acumulador is
  signal data_out : std_logic_vector(7 downto 0) := x"00";

begin

  z <= not(or_reduce(data_out));
  n <= data_out(7);
  debug <= data_out;

  -- write block
  acc_write: process (e, clk, nw, a, b, c)
  begin
	if (falling_edge(clk) and nw = '0') then
	  if (e = "01") then
		data_out <= a;
	  elsif (e = "10") then
		data_out <= b;
	  elsif (e = "11") then
		data_out <= c;
	  end if;
	end if;
  end process;

  tri_state: process (e, nw, data_out)
  begin
	if (e = "01" and nw = '1') then
	  a <= data_out;
	  b <= (others => 'Z');
	  c <= (others => 'Z');
	elsif (e = "10" and nw = '1') then
	  b <= data_out;
	  a <= (others => 'Z');
	  c <= (others => 'Z');
	elsif (e = "11" and nw = '1') then
	  c <= data_out;
	  a <= (others => 'Z');
	  b <= (others => 'Z');
	else
	  a <= (others => 'Z');
	  b <= (others => 'Z');
	  c <= (others => 'Z');
	end if;
  end process;

end behavioral;
