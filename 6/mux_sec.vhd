library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_sec is
	Port (  SEL : in STD_LOGIC;
			  E0 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
			  E1 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
			  SALIDA  : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end mux_sec;

architecture Behavioral of mux_sec is
begin
	process (SEL, E0, E1)
	begin		
		if SEL = '0' then 
			SALIDA <= E0;
		elsif SEL = '1' then 
			SALIDA <= E1;
		end if;
	end process;
end Behavioral;