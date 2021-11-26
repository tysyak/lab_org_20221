library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
	port (
		sel1 : in std_logic;
		sel0 : in std_logic;
		i0 : in std_logic;
		i1 : in std_logic;
		i2 : in std_logic;
		i3 : in std_logic;
		output  : out std_logic);
end mux2;

architecture behavioral of mux2 is
begin
	process (sel0, sel1, i0, i1, i2, i3)
	begin
		if sel1 = '0' and sel0 = '0' then
			output <= i0;
		elsif sel1 = '0' and sel0 = '1' then
			output <= i1;
		elsif sel1 = '1' and sel0 = '0' then
			output <= i2;
		elsif sel1 = '1' and sel0 = '1' then
			output <= i3;
		else
			output <= '0';
		end if;
	end process;
end behavioral;
