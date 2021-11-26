library ieee;
use ieee.std_logic_1164.all;

entity registro is
	port (
		clk : in std_logic;
		reset : in std_logic;
		entrada  : in std_logic;
		salida : out std_logic;
		salida2 : out std_logic);
end registro;

architecture behavioral of registro is
	signal valor_interno : std_logic := '0';
begin
	salida2 <= valor_interno;

	process (clk, reset, entrada)
	begin
		if reset = '0' then
			valor_interno <= '0';
		elsif falling_edge (clk) then
			valor_interno <= entrada;
		end if;
	end process;

	process (valor_interno)
	begin
		salida <= valor_interno;
	end process;
end behavioral;
