library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

entity contador is
  port(
	control : in std_logic_vector(2 downto 0); -- lineas de control
	c : inout std_logic_vector(7 downto 0); -- bus c
	d : inout std_logic_vector(7 downto 0); -- bus d
	e : out std_logic_vector(15 downto 0); -- bus e
	ena0 : in std_logic; -- habilitacion bus d (e0)
	ena1 : in std_logic; -- habilitacion bus c (e1)
	ena2 : in std_logic; -- habilitacion bus e (e2)
	r15 : inout std_logic;
	r0 : inout std_logic;
	z : out std_logic;
	n : out std_logic;
	debug : out std_logic_vector(15 downto 0);
	clk : in std_logic;
	reset: in std_logic
	);
end contador;

architecture behavioral of contador is
  signal data_out : std_logic_vector(15 downto 0) := x"0000";

begin

  z <= not(or_reduce(data_out));
  n <= data_out(15);
  debug <= data_out;

  -- write block
  acc_write: process (reset, control, clk, ena0, ena1, ena2)
  begin
	if(reset = '0') then
	  data_out <= x"0000";
	elsif (falling_edge(clk) ) then
	  if (control = "001") then -- incrementa en 1
		data_out <= data_out + 1;
	  elsif (control = "010") then -- decrementa en 1
		data_out <= data_out - 1;
	  elsif (control = "011") then -- carga parte baja
		data_out(7 downto 0) <= d;
	  elsif (control = "100") then -- carga parte alta
		data_out(15 downto 8) <= c;
	  elsif (control = "101") then -- carga 16 bits
		data_out <= c & d;
	  elsif (control = "110") then -- corrimiento izquierda
		data_out <= data_out(14 downto 0) & r0;
	  elsif (control = "111") then -- corrimiento derecha
		data_out <= r15 & data_out(15 downto 1);
	  else
		data_out <= data_out;
	  end if;
	end if;
  end process;

  tri_state_d: process (ena0, data_out, control)
  begin
	if (ena0 = '0' and control = "000") then -- lectura
	  d <= data_out(7 downto 0); -- parte baja
	else
	  d <= (others => 'Z');
	end if;
  end process;


  tri_state_c: process (ena1, ena2, data_out, control)
  begin
	if (ena1 = '0' and control = "000") then -- lectura
	  c <= data_out(15 downto 8); -- parte alta
	else
	  c <= (others => 'Z');
	end if;
  end process;


  tri_state_e: process (ena2, data_out, control)
  begin
	if (ena2 = '0' and control = "000") then -- lectura
	  e <= data_out;
	else
	  e <= (others => 'Z');
	end if;
  end process;

  tri_state_rs: process (data_out, control)
  begin
	if (control = "000") then -- lectura
	  r15 <= data_out(15);
	  r0  <= data_out(0);
	else
	  r15 <= 'Z';
	  r0 <= 'Z';
	end if;
  end process;

end behavioral;
