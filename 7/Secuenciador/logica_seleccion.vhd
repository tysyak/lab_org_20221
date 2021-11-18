library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity logica_seleccion is
  port (
	inst : in std_logic_vector(1 downto 0);
	cc : in std_logic;
	selector : out std_logic;
	pl : out std_logic;
	map1 : out std_logic;
	vect : out std_logic);
end logica_seleccion;

architecture behavioral of logica_seleccion is
begin
  process (inst, cc)
  begin
	if inst = "00" then
	  selector <= '0'; pl <= '0';	map1 <= '0'; vect <= '0';
	elsif (inst = "01" and cc = '1') then
	  selector <= '1'; pl <= '1'; map1 <= '0'; vect <= '0';

	elsif (inst = "01" and cc = '0') then
	  selector <= '0'; pl <= '1'; map1 <= '0'; vect <= '0';

	elsif inst = "10" then
	  selector <= '1'; pl <= '0'; map1 <= '1'; vect <= '0';

	elsif (inst = "11" and cc = '1') then
	  selector <= '1'; pl <= '0'; map1 <= '0'; vect <= '1';

	elsif (inst = "11" and cc = '0') then
	  selector <= '0'; pl <= '0'; map1 <= '0'; vect <= '1';

	end if;
  end process;
end behavioral;
