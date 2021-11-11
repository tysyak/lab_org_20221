library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logica_interna is
  Port (  mi : in STD_LOGIC_vectOR(1 downto 0);
          cc : in STD_LOGIC;
          sel : out STD_LOGIC;
          pl : out STD_LOGIC;
          map_li : Out STD_LOGIC;
          vect : out STD_LOGIC);
end logica_interna;

architecture Behavioral of logica_interna is
begin
  process (mi, cc)
  begin
    if mi = "00" then
	   pl <= '0';map_li <= '0';vect <= '0';sel <= '0';
		
    elsif (mi = "01" and cc = '0') then
	   pl <= '1';map_li <= '0';vect <= '0';sel <= '0';
    elsif (mi = "01" and cc = '1') then
	   pl <= '1';map_li <= '0';vect <= '0';sel <= '1';
		
	 elsif mi = "10" then
	   pl <= '0';map_li <= '1';vect <= '0';sel <= '1';
		
    elsif (mi = "11" and cc = '0') then
	   pl <= '0';map_li <= '0';vect <= '1';sel <= '0';
    elsif (mi = "11" and cc = '1') then
	   pl <= '0';map_li <= '0';vect <= '1';sel <= '1';
    end if;
  end process;
end Behavioral;
