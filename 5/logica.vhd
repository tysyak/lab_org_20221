library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity logica is port (
  vf : in std_logic;
  prueba : in std_logic_vector(2 downto 0);
  entrada : in std_logic_vector(4 downto 0);
  qsel: out std_logic;
  carga : out std_logic;
  incrementa : out std_logic
  );
end logica;

architecture behavioral of logica is
  signal qset : std_logic;
  signal xor_res : std_logic;
begin
  process (prueba)
  begin
    case(prueba) is
      when "000" =>
        qset <= entrada(4);
      when "001" =>
        qset <= entrada(3);
      when "010" =>
        qset <= entrada(2);
      when "011" =>
        qset <= entrada(1);
      when others =>
        qset <= '0';
    end case;
  end process;

  process (qset)
  begin
    xor_res <= qset xor vf;
		qsel <= qset;
  end process;

  process(xor_res)
  begin
    carga <= not xor_res;
    incrementa <= xor_res;
  end process;
end behavioral;
