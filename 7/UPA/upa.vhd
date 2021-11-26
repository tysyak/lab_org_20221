library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

entity upa is
  port(
	upa_c : in std_logic_vector(9 downto 0); -- lineas de control
	a : in std_logic_vector(7 downto 0); -- entrada a
	b : in std_logic_vector(7 downto 0); -- b
	d : in std_logic_vector(7 downto 0); -- d
	ndupa : in std_logic; -- dupa
	noeupa : in std_logic; -- oeupa
	cin : in std_logic; -- acarreo de entrada
	q7 : out std_logic;
	q0 : out std_logic;
	y7 : out std_logic;
	y0 : out std_logic;
	c : out std_logic; -- acarreo
	n : out std_logic; -- signo
	v : out std_logic; -- overflow
	z : out std_logic; -- zero
	h : out std_logic; -- half carry
	fc : out std_logic; -- fc
	yupa: out std_logic_vector(7 downto 0);
	yupa2: out std_logic_vector(7 downto 0);
	debug_yupa: out std_logic_vector(7 downto 0);
	debug_q: out std_logic_vector(7 downto 0);
	clk : in std_logic
	);
end upa;

architecture behavioral of upa is
  signal contador : std_logic_vector(2 downto 0) := b"000";
  signal r : std_logic_vector(7 downto 0) := x"00";
  signal s : std_logic_vector(7 downto 0) := x"00";
  signal q : std_logic_vector(7 downto 0) := x"00";
  signal f : std_logic_vector(8 downto 0) := b"000000000"; -- un bit extra para
														   -- el overflow y
														   -- acarreo
  signal banderas : std_logic_vector(4 downto 0) := b"00000"; -- banderas
  signal reset : std_logic := '0';
  signal incrementa : std_logic := '0';
  signal yupa_interno : std_logic_vector(7 downto 0) := x"00";

  constant zero : std_logic_vector(7 downto 0) := x"00";

begin

  fc <= and_reduce(contador);
  debug_yupa <= yupa_interno;
  debug_q <= q;

  -- seleccion de entrada
  upa_entrada : process(upa_c, a, b, q, d)
  begin
	case upa_c(3 downto 0) is
	  when b"0000" =>
		r <= a;
		s <= zero;
		reset <= '0';
		incrementa <= '0';
	  when b"0001" =>
		r <= a;
		s <= b;
		reset <= '0';
		incrementa <= '0';
	  when b"0010" =>
		r <= q;
		s <= zero;
		reset <= '0';
		incrementa <= '0';
	  when b"0011" =>
		r <= b;
		s <= zero;
		reset <= '0';
		incrementa <= '0';
	  when b"0100" =>
		r <= zero;
		s <= a;
		reset <= '0';
		incrementa <= '0';
	  when b"0101" =>
		r <= d;
		s <= a;
		reset <= '0';
		incrementa <= '0';
	  when b"0110" =>
		r <= d;
		s <= q;
		reset <= '0';
		incrementa <= '0';
	  when b"0111" =>
		r <= d;
		s <= zero;
		reset <= '0';
		incrementa <= '0';
	  when b"1000" =>
		r <= d;
		s <= b;
		reset <= '0';
		incrementa <= '0';
	  when b"1001" =>
		r <= q;
		s <= b;
		reset <= '0';
		incrementa <= '0';
	  when b"1010" =>
		r <= r;
		s <= s;
		reset <= '1';
		incrementa <= '0';
	  when b"1011" =>
		r <= r;
		s <= s;
		reset <= '0';
		incrementa <= '1';
	  when b"1100" =>
		r <= q;
		s <= a;
		reset <= '0';
		incrementa <= '0';
	  when others =>
		r <= r;
		s <= s;
		reset <= '0';
		incrementa <= '0';
	end case;
  end process;


  -- operacion
  upa_op : process (upa_c, r, s, cin)
  begin
	case upa_c(6 downto 4) is
	  when b"000" =>
		f <= ('0' & r) + ('0' & s) + cin;
	  when b"001" =>
		f <= ('0' & s) - ('0' & r) - not(cin);
	  when b"010" =>
		f <= ('0' & r) - ('0' & s) - not(cin);
	  when b"011" =>
		f <= ('0' & r) or ('0' & s);
	  when b"100" =>
		f <= ('0' & r) and ('0' & s);
	  when b"101" =>
		f <= not('0' & r) and ('0' & s);
	  when b"110" =>
		f <= ('0' & r) xor ('0' & s);
	  when b"111" =>
		f <= not(('0' & r) xor ('0' & s));
	end case;
  end process;


  -- destinos y desplazamientos
  upa_dest : process(clk, f, a, b, ndupa)
  begin
	if(falling_edge(clk) and ndupa = '1') then
	  case upa_c(9 downto 7) is
		when b"000" =>
		  yupa_interno <= f(7 downto 0);
		  q <= f(7 downto 0);

		when b"001" =>
		  yupa_interno <= f(7 downto 0);
		  q <= q;

		when b"010" =>
		  yupa_interno <= a;
		  q <= q;

		when b"011" =>
		  yupa_interno <= b;
		  q <= q;

		when b"100" => -- corrimiento derecha
		  yupa_interno <= yupa_interno(0) & yupa_interno(7 downto 1);
		  q <= q;

		when b"101" =>
		  yupa_interno <= yupa_interno;
		  q <= q(0) & q(7 downto 1);

		when b"110" => -- corrimiento izquierda
		  yupa_interno <= yupa_interno(6 downto 0) & yupa_interno(7);
		  q <= q;

		when b"111" =>
		  yupa_interno <= yupa_interno;
		  q <= q(6 downto 0) & q(7);

	  end case;
	  banderas <= f(4) & f(8) & f(7) & f(8) &
				  not(or_reduce(f(7 downto 0)));-- half acarreo signo overflow
												-- cero
	end if;
  end process;


  -- contador
  upa_cont : process (clk, reset, incrementa)
  begin
	if reset = '1' then
	  contador <= b"000";
	elsif falling_edge(clk) and incrementa = '1' then
	  contador <= contador + 1;
	end if;
  end process;


  -- habilitacion de las salidas
  upa_tri_state: process (noeupa, yupa_interno, banderas, q)
  begin
	if (noeupa = '0') then
	  yupa <= yupa_interno;
	  yupa2 <= yupa_interno;
	else
	  yupa <= (others => 'Z');
	  yupa2 <= (others => 'Z');
	end if;
	h <= banderas(4);
	c <= banderas(3);
	n <= banderas(2);
	v <= banderas(1);
	z <= banderas(0);
	y7 <= yupa_interno(7);
	y0 <= yupa_interno(0);
	q7 <= q(7);
	q0 <= q(0);
  end process;
end behavioral;
