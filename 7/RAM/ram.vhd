library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ram is
  port(
	address : in std_logic_vector(15 downto 0);
	data : inout std_logic_vector(7 downto 0);
	wn : in std_logic;
	csn : in std_logic;
	res: out std_logic_vector(7 downto 0);
	clk: in std_logic
	);
end ram;

architecture behavioral of ram is
  type memory is array(0 to 255) of std_logic_vector(7 downto 0);
  signal mem : memory;
  signal data_out : std_logic_vector(7 downto 0) := x"00";

begin

  -- memory write block
  mem_write: process (address, csn, wn, data)
  begin
	mem(0) <= x"00";
	if (csn = '0' and wn = '0') then
	  mem(conv_integer(unsigned(address))) <= data;
	end if;
  end process;

  res <= mem(64);  -- x"0040"

  tri_state: process (address, csn, wn, data_out)
  begin
	if (csn = '0' and wn = '1') then
	  data <= data_out;
	else
	  data <= (others => 'z');
	end if;
  end process;

  -- memory read block
  mem_read: process (address, csn, wn, mem)
  begin
	if (csn = '0' and wn = '1') then
	  data_out <= mem(conv_integer(unsigned(address)));
	else
	  data_out <= (others => '0');
	end if;
  end process;

end behavioral;
