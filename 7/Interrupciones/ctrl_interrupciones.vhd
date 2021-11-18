library ieee;
use ieee.std_logic_1164.all;

entity ctrl_interrupciones is
  port (
	irqn : in std_logic; -- conectar a boton de interrupciones internas
	xirqn : in std_logic; -- conectar a boton de interrupciones externas
	set_irq : in std_logic; -- resetea bandera de irq
	set_xirq : in std_logic; -- resetea bandera de xirq
	i  : in std_logic; -- i del registro de banderas
	x  : in std_logic; -- x del registro de banderas
	dint  : in std_logic; -- deshabilita generacion de la linea int
	hint  : in std_logic; -- habilita generacion de la linea int
	vectn  : in std_logic; -- linea generada por el secuenciador
	int: out std_logic; -- indica al secuenciador la existencia de interrupciones
	y : out std_logic_vector(11 downto 0); -- direccion de la microinstruccion a ejecutar
	clk : in std_logic
	);
end ctrl_interrupciones;

architecture behavioral of ctrl_interrupciones is
  constant dir_irq : std_logic_vector(11 downto 0) := x"000"; -- direccion de microprograma de irq
  constant dir_xirq : std_logic_vector(11 downto 0) := x"200"; -- direccion de microprograma de xirq
  signal irq_flag : std_logic := '0'; -- indica si hubo interrupcion interna
  signal xirq_flag : std_logic := '0'; -- indcica si hubo interrupcion externa
  signal int_flag : std_logic := '0'; -- bandera int


begin

  int <= ((i or irq_flag) nand (x or xirq_flag)) and int_flag;

  -- controla la generacion de la bandera interna irq_flag
  ctrl_irq : process (clk, irqn, set_irq)
  begin
	if falling_edge(clk) then
	  if not(irqn) = '0' and set_irq = '0' then
		irq_flag <= irq_flag;
	  elsif not(irqn) = '0' and set_irq = '1' then
		irq_flag <= '1';
	  elsif not(irqn) = '1' and set_irq = '0' then
		irq_flag <= '0';
	  else
		irq_flag <= '0';
	  end if;
	end if;
  end process;

  -- controla la generacion de la bandera interna xirq_flag
  ctrl_xirq : process (clk, xirqn, set_xirq)
  begin
	if falling_edge(clk) then
	  if not(xirqn) = '0' and set_xirq = '0' then
		xirq_flag <= xirq_flag;
	  elsif not(xirqn) = '0' and set_xirq = '1' then
		xirq_flag <= '1';
	  elsif not(xirqn) = '1' and set_xirq = '0' then
		xirq_flag <= '0';
	  else
		xirq_flag <= '0';
	  end if;
	end if;
  end process;

  -- controla la generacion de la direccion de la interrupcion
  ctrl_y : process (irq_flag, xirq_flag, i, x, vectn)
  begin
	if(vectn = '0') then
	  if irq_flag = '0' and i = '0' then -- hay interrupcion interna y
										 -- estan habilitadas las
										 -- interrupciones irq en
										 -- reg. banderas y vect = 0
		y <= dir_irq;
	  elsif xirq_flag = '0' and x = '0' then -- hay interrupcion
											 -- externa y estan
											 -- habilitadas las
											 -- interrupciones xirq
											 -- en reg. banderas y
											 -- vect = 0
		y <= dir_xirq;
	  else
		y <= (others => 'Z');
	  end if;
	else
	  y <= (others => 'Z');
	end if;
  end process;

  -- controla la generacion de la bandera int_flag (habilita o
  -- deshabilita la generacion de la linea int)
  ctrl_int_dh : process (clk, dint, hint)
  begin
	if falling_edge(clk) then
	  if dint = '0' and hint = '0' then
		int_flag <= int_flag;
	  elsif dint = '0' and hint = '1' then
		int_flag <= '1';
	  elsif dint = '1' and hint = '0' then
		int_flag <= '0';
	  else
		int_flag <= '0';
	  end if;
	end if;
  end process;

end behavioral;
