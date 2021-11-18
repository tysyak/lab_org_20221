library ieee;
use ieee.std_logic_1164.all;

entity mux3 is
	port (
		sel2 : in std_logic;
		sel1 : in std_logic;
		sel0 : in std_logic;
		i0 : in std_logic;
		i1 : in std_logic;
		i2 : in std_logic;
		i3 : in std_logic;
		i4 : in std_logic;
		i5 : in std_logic;
		i6 : in std_logic;
		i7 : in std_logic;
		output  : out std_logic);
end mux3;

architecture behavioral of mux3 is
begin
	process (sel0, sel1, sel2, i0, i1, i2, i3, i4, i5, i6, i7)
	begin
		if sel2 = '0' and sel1 = '0' and sel0 = '0' then
			output <= i0;
		elsif sel2 = '0' and sel1 = '0' and sel0 = '1' then
			output <= i1;
		elsif sel2 = '0' and sel1 = '1' and sel0 = '0' then
			output <= i2;
		elsif sel2 = '0' and sel1 = '1' and sel0 = '1' then
			output <= i3;
		elsif sel2 = '1' and sel1 = '0' and sel0 = '0' then
			output <= i4;
		elsif sel2 = '1' and sel1 = '0' and sel0 = '1' then
			output <= i5;
		elsif sel2 = '1' and sel1 = '1' and sel0 = '0' then
			output <= i6;
		elsif sel2 = '1' and sel1 = '1' and sel0 = '1' then
			output <= i7;
		else
			output <= '0';
		end if;
	end process;
end behavioral;
