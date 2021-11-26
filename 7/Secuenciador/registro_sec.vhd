library ieee;
use ieee.std_logic_1164.all;

entity registro_sec is
  port (
	 clk : in std_logic;
	 reset : in std_logic;
	 entrada : in std_logic_vector(93 downto 0);
	 prueba: out std_logic_vector(4 downto 0);
	 vf: out std_logic;
	 instruccion: out std_logic_vector(1 downto 0);
	 liga: out std_logic_vector(11 downto 0);
	 ncri: out std_logic;
	 eb: out std_logic_vector(1 downto 0);
	 nwb: out std_logic;
	 ea: out std_logic_vector(1 downto 0);
	 nwa: out std_logic;
	 selbus: out std_logic;
	 upa: out std_logic_vector(9 downto 0);
	 noeupa: out std_logic;
	 ndupa: out std_logic;
	 selmux: out std_logic;
	 nex2: out std_logic;
	 nex1: out std_logic;
	 nex0: out std_logic;
	 x: out std_logic_vector(2 downto 0);
	 enay: out std_logic;
	 nera2: out std_logic;
	 nera1: out std_logic;
	 nera0: out std_logic;
	 ra: out std_logic_vector(2 downto 0);
	 neap2: out std_logic;
	 neap1: out std_logic;
	 neap0: out std_logic;
	 ap: out std_logic_vector(2 downto 0);
	 nepc2: out std_logic;
	 nepc1: out std_logic;
	 nepc0: out std_logic;
	 pc: out std_logic_vector(2 downto 0);
	 ncbd: out std_logic;
	 nas: out std_logic;
	 nrw: out std_logic;
	 bd: out std_logic;
	 dint: out std_logic;
	 hint: out std_logic;
	 set_irq: out std_logic;
	 set_xirq: out std_logic;
	 b9: out std_logic;
	 b8: out std_logic;
	 b7: out std_logic;
	 b6: out std_logic;
	 b5: out std_logic;
	 b4: out std_logic;
	 b3: out std_logic;
	 b2: out std_logic;
	 b1: out std_logic;
	 b0: out std_logic;
	 cc: out std_logic;
	 cn: out std_logic;
	 cv: out std_logic;
	 cz: out std_logic;
	 ci: out std_logic;
	 ch: out std_logic;
	 cx: out std_logic;
	 cs: out std_logic;
	 nhb: out std_logic;
	 accsec: out std_logic);
end registro_sec;

architecture behavioral of registro_sec is

--signal prueba: std_logic_vector(4 downto 0):= "00000";
--signal vf: std_logic:= '0';
--signal instruccion: std_logic_vector(1 downto 0):= "00";
--signal liga: std_logic_vector(11 downto 0):= "000000000000";
--signal ncri: std_logic:= '1'; -- carga en registro de instrucciones
--signal eb: std_logic_vector(1 downto 0):= "00"; -- señales de control de accb
--signal nwb: std_logic:= '1'; -- escritura en accb
--signal ea: std_logic_vector(1 downto 0):= "00"; -- señales de control de acca
--signal nwa: std_logic:= '1'; -- escritura en acca
--signal selbus: std_logic:= '0'; -- selecciona bus de entrada d de upa
--signal upa: std_logic_vector(9 downto 0):= "0000000000"; -- lineas de control de upa
--signal noeupa: std_logic:= '1'; -- habilita salida yupa de upa
--signal ndupa: std_logic:= '1'; -- deshabilita upa
--signal selmux: std_logic:= '0'; -- selecciona acarreo
--signal nex2: std_logic:= '1'; -- habilita puerto 2 de inx
--signal nex1: std_logic:= '1'; -- habilita puerto 1 de inx
--signal nex0: std_logic:= '1'; -- habilita puerto 0 de inx
--signal x: std_logic_vector(2 downto 0):= "000"; -- lineas de control de inx
--signal enay: std_logic:= '0'; -- señal de habilitacion de iny
--signal nera2: std_logic:= '1'; -- habilita puerto 2 de reg aux
--signal nera1: std_logic:= '1'; -- habilita puerto 1 de reg aux
--signal nera0: std_logic:= '1'; -- habilita puerto 0 de reg aux
--signal ra: std_logic_vector(2 downto 0):= "000"; -- lineas de control de reg aux
--signal neap2: std_logic:= '1'; -- habilita puerto 2 de reg apuntador de pila
--signal neap1: std_logic:= '1'; -- habilita puerto 1 de reg apuntador de pila
--signal neap0: std_logic:= '1'; -- habilita puerto 0 de reg apuntador de pila
--signal ap: std_logic_vector(2 downto 0):= "000"; -- lineas de control de reg apuntador de pila
--signal nepc2: std_logic:= '1'; -- habilita puerto 2 de reg program counter
--signal nepc1: std_logic:= '1'; -- habilita puerto 1 de reg program counter
--signal nepc0: std_logic:= '1'; -- habilita puerto 0 de reg program counter
--signal pc: std_logic_vector(2 downto 0):= "000"; -- lineas de control de reg program counter
--signal ncbd: std_logic:= '1'; -- carga en registro de direcciones
--signal nas: std_logic:= '1'; -- habilita puerto de memoria externa
--signal nrw: std_logic:= '1'; -- escritura en memoria externa
--signal bd: std_logic:= '0'; -- selecciona bus de datos alto o bajo
--signal dint: std_logic:= '0'; -- deshabilita generacion de señal int
--signal hint: std_logic:= '0'; -- habilita la generacion de señal int
--signal set_irq: std_logic:= '0'; -- habilita interrupciones internas
--signal set_xirq: std_logic:= '0'; -- habilita interrupciones externas
--signal b9: std_logic:= '0'; -- control de registro de banderas
--signal b8: std_logic:= '0'; -- control de registro de banderas
--signal b7: std_logic:= '0'; -- control de registro de banderas
--signal b6: std_logic:= '0'; -- control de registro de banderas
--signal b5: std_logic:= '0'; -- control de registro de banderas
--signal b4: std_logic:= '0'; -- control de registro de banderas
--signal b3: std_logic:= '0'; -- control de registro de banderas
--signal b2: std_logic:= '0'; -- control de registro de banderas
--signal b1: std_logic:= '0'; -- control de registro de banderas
--signal b0: std_logic:= '0'; -- control de registro de banderas
--signal cc: std_logic:= '0'; -- clock de registro de banderas
--signal cn: std_logic:= '0'; -- clock de registro de banderas
--signal cv: std_logic:= '0'; -- clock de registro de banderas
--signal cz: std_logic:= '0'; -- clock de registro de banderas
--signal ci: std_logic:= '0'; -- clock de registro de banderas
--signal ch: std_logic:= '0'; -- clock de registro de banderas
--signal cx: std_logic:= '0'; -- clock de registro de banderas
--signal cs: std_logic:= '0'; -- clock de registro de banderas
--signal nhb: std_logic:= '1'; -- habilita puerto de registro de banderas
--signal accsec: std_logic:= '0'; -- acarrero personalizado


begin

  -- p4 p3 p2 p1 p0 vf i1 i0 l11 l10 l9 l8 l7 l6 l5 l4 l3 l2 l1 l0 ncri eb1 eb0 nwb ea1 ea0 nwa selbus upa9 upa8 upa7 upa6 upa5 upa4 upa3 upa2 upa1 upa0 noeupa ndupa selmux nex2 nex1 nex0 x2 x1 x0 enay nera2 nera1 nera0 ra2 ra1 ra0 neap2 neap1 neap0 ap2 ap1 ap0 nepc2 nepc1 nepc0 pc2 pc1 pc0 ncbd nas nrw bd dint hint set_irq set_xirq b9 b8 b7 b6 b5 b4 b3 b2 b1 b0 cc cn cv cz ci ch cx cs nhb accsec

  process (clk, reset, entrada)
  begin
	 if reset = '0' then
		prueba <= "00000";
		vf <= '0';
		instruccion <= "00";
		liga <= "000000000000";
		ncri <= '1'; -- carga en registro de instrucciones
		eb <= "00"; -- señales de control de accb
		nwb <= '1'; -- escritura en accb
		ea <= "00"; -- señales de control de acca
		nwa <= '1'; -- escritura en acca
		selbus <= '0'; -- selecciona bus de entrada d de upa
		upa <= "0000000000"; -- lineas de control de upa
		noeupa <= '1'; -- habilita salida yupa de upa
		ndupa <= '1'; -- deshabilita upa
		selmux <= '0'; -- selecciona acarreo
		nex2 <= '1'; -- habilita puerto 2 de inx
		nex1 <= '1'; -- habilita puerto 1 de inx
		nex0 <= '1'; -- habilita puerto 0 de inx
		x <= "000"; -- lineas de control de inx
		enay <= '0'; -- señal de habilitacion de iny
		nera2 <= '1'; -- habilita puerto 2 de reg aux
		nera1 <= '1'; -- habilita puerto 1 de reg aux
		nera0 <= '1'; -- habilita puerto 0 de reg aux
		ra <= "000"; -- lineas de control de reg aux
		neap2 <= '1'; -- habilita puerto 2 de reg apuntador de pila
		neap1 <= '1'; -- habilita puerto 1 de reg apuntador de pila
		neap0 <= '1'; -- habilita puerto 0 de reg apuntador de pila
		ap <= "000"; -- lineas de control de reg apuntador de pila
		nepc2 <= '1'; -- habilita puerto 2 de reg program counter
		nepc1 <= '1'; -- habilita puerto 1 de reg program counter
		nepc0 <= '1'; -- habilita puerto 0 de reg program counter
		pc <= "000"; -- lineas de control de reg program counter
		ncbd <= '1'; -- carga en registro de direcciones
		nas <= '1'; -- habilita puerto de memoria externa
		nrw <= '1'; -- escritura en memoria externa
		bd <= '0'; -- selecciona bus de datos alto o bajo
		dint <= '0'; -- deshabilita generacion de señal int
		hint <= '0'; -- habilita la generacion de señal int
		set_irq <= '0'; -- habilita interrupciones internas
		set_xirq <= '0'; -- habilita interrupciones externas
		b9 <= '0'; -- control de registro de banderas
		b8 <= '0'; -- control de registro de banderas
		b7 <= '0'; -- control de registro de banderas
		b6 <= '0'; -- control de registro de banderas
		b5 <= '0'; -- control de registro de banderas
		b4 <= '0'; -- control de registro de banderas
		b3 <= '0'; -- control de registro de banderas
		b2 <= '0'; -- control de registro de banderas
		b1 <= '0'; -- control de registro de banderas
		b0 <= '0'; -- control de registro de banderas
		cc <= '0'; -- clock de registro de banderas
		cn <= '0'; -- clock de registro de banderas
		cv <= '0'; -- clock de registro de banderas
		cz <= '0'; -- clock de registro de banderas
		ci <= '0'; -- clock de registro de banderas
		ch <= '0'; -- clock de registro de banderas
		cx <= '0'; -- clock de registro de banderas
		cs <= '0'; -- clock de registro de banderas
		nhb <= '1'; -- habilita puerto de registro de banderas
		accsec <= '0'; -- acarrero personalizado
	 elsif rising_edge (clk) then
		prueba <= entrada(93 downto 89);
		vf <= entrada(88);
		instruccion <= entrada(87 downto 86);
		liga <= entrada(85 downto 74);
		ncri <= entrada(73);
		eb <= entrada(72 downto 71);
		nwb <= entrada(70);
		ea <= entrada(69 downto 68);
		nwa <= entrada(67);
		selbus <= entrada(66);
		upa <= entrada(65 downto 56);
		noeupa <= entrada(55);
		ndupa <= entrada(54);
		selmux <= entrada(53);
		nex2 <= entrada(52);
		nex1 <= entrada(51);
		nex0 <= entrada(50);
		x <= entrada(49 downto 47);
		enay <= entrada(46);
		nera2 <= entrada(45);
		nera1 <= entrada(44);
		nera0 <= entrada(43);
		ra <= entrada(42 downto 40);
		neap2 <= entrada(39);
		neap1 <= entrada(38);
		neap0 <= entrada(37);
		ap <= entrada(36 downto 34);
		nepc2 <= entrada(33);
		nepc1 <= entrada(32);
		nepc0 <= entrada(31);
		pc <= entrada(30 downto 28);
		ncbd <= entrada(27);
		nas <= entrada(26);
		nrw <= entrada(25);
		bd <= entrada(24);
		dint <= entrada(23);
		hint <= entrada(22);
		set_irq <= entrada(21);
		set_xirq <= entrada(20);
		b9 <= entrada(19);
		b8 <= entrada(18);
		b7 <= entrada(17);
		b6 <= entrada(16);
		b5 <= entrada(15);
		b4 <= entrada(14);
		b3 <= entrada(13);
		b2 <= entrada(12);
		b1 <= entrada(11);
		b0 <= entrada(10);
		cc <= entrada(9);
		cn <= entrada(8);
		cv <= entrada(7);
		cz <= entrada(6);
		ci <= entrada(5);
		ch <= entrada(4);
		cx <= entrada(3);
		cs <= entrada(2);
		nhb <= entrada(1);
		accsec <= entrada(0);
	 end if;
  end process;

end behavioral;
