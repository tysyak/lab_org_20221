library ieee;
use ieee.std_logic_1164.all;

entity mux1 is
	port (
		sel : in std_logic;
		i0 : in std_logic;
		i1 : in std_logic;
		output  : out std_logic);
end mux1;

architecture behavioral of mux1 is
begin
	process (sel, i0, i1)
	begin
		if sel = '0' then
			output <= i0;
		elsif sel = '1' then
			output <= i1;
		end if;
	end process;
end behavioral;
