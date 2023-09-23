library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity digitalTube is
  port (
    clock: in std_logic;
    key: in std_logic_vector(3 downto 0);
    segment: out std_logic_vector(7 downto 0);
    selector: out std_logic_vector(2 downto 0)
  );
end digitalTube;

architecture behave of digitalTube is
begin
  process(clock)
  variable current_selector: std_logic_vector(2 downto 0):=(others=>'0');
  begin
    if rising_edge(clock) 
        then current_selector:=current_selector+1;
    end if;
    selector<=current_selector;
  end process;

  process(key)
  begin
    case( key ) is
        when "0000" => segment<= "00111111"; --0
        when "0001" => segment<= "00000110"; --1
        when "0010" => segment<= "01011011"; --2
        when "0011" => segment<= "01001111"; --3
        when "0100" => segment<= "01100110"; --4
        when "0101" => segment<= "01101101"; --5
        when "0110" => segment<= "01111101"; --6
        when "0111" => segment<= "00000111"; --7
        when "1000" => segment<= "01111111"; --8
        when "1001" => segment<= "01101111"; --9
        when others => segment<= "01110111"; --A
    end case ;
  end process ; -- 

end behave;

