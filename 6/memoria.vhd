library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity memoria is
  generic(
    data_width : natural := 21;
    addr_length : natural := 3
    );
  port ( direccion : in std_logic_vector (3 downto 0);
         m : out std_logic_vector(20 downto 0);
         pl : in std_logic;
         prueba: out std_logic_vector(1 downto 0);
         vf : out std_logic;
         mi : out std_logic_vector(1 downto 0);
         liga : out std_logic_vector (3 downto 0);
         salidas : out std_logic_vector(5 downto 0)
			);
end memoria;

architecture behavioral of memoria is
  signal datos: std_logic_vector (data_width-1 downto 0);

  constant mem_size : natural := 15;
  type mem_type is array (mem_size-1 downto 0) of std_logic_vector(data_width-1 downto 0);
  constant mem : mem_type :=
  (
    0 => b"000000001000001000001",
    1 => b"010010111001101001011",
    2 => b"000000011000011000011",
    3 => b"000000100001010001010",
    4 => b"000100100010000010000",
    5 => b"101011010010010110010",
    6 => b"000010010001001001001",
    7 => b"111110111010000010001",
    8 => b"000010001100000100000",
    9 => b"110111001101011001010",
    10=> b"000010000000000000000",
    11=> b"000101011000100000100",
    12=> b"000010000000100000100",
    13=> b"000010000101000101000",
    14=> b"000010000010011010011"
  );
  begin
  process(direccion,pl)
  begin

    -- entrada/prueba (20 - 19), vf (18), mi (17 - 16), liga (15 - 12), salidas_v(11-6), salida_f(5,0)



    datos <= mem(to_integer(unsigned(direccion)));
	 m <= datos;


    prueba <= datos(20 downto 19);
    vf <= datos(18);
    mi <= datos(17 downto 16);
    if pl = '1' then
      liga <= datos(15 downto 12);
    else
      liga <= "ZZZZ";
    end if;
    if (datos(18)='0') then salidas<=datos(5 downto 0); else salidas<=datos(11 downto 6); end if;
  end process;
end behavioral;
