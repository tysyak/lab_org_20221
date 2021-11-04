library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity logica is port (
  vf : in std_logic;
  prueba : in std_logic_vector(2 downto 0);
  entrada : in std_logic_vector(2 downto 0);
  mon_prueba: out std_logic_vector(2 downto 0);
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
    case(entrada) is
      when "000" =>
        if entrada = prueba then
          qset <= '1';
        else
          qset <= '0';
        end if;
      when "001" =>
        if entrada = prueba then
          qset <= '1';
        else
          qset <= '0';
        end if;
      when "010" =>
        if entrada = prueba then
          qset <= '1';
        else
          qset <= '0';
        end if;
      when "011" =>
        if entrada = prueba then
          qset <= '1';
        else
          qset <= '0';
        end if;
      when "100" =>
        if entrada = prueba then
          qset <= '1';
        else
          qset <= '0';
        end if;
      when others =>
        qset <= '0';
    end case;
  end process;

  process (qset)
  begin
    if qset = '1' xor vf='1' then
      xor_res <= '1';
    else
      xor_res <= '0';
    end if;
  end process;

  process(xor_res)
  begin
    carga <= not xor_res;
    incrementa <= xor_res;
  end process;
end behavioral;
