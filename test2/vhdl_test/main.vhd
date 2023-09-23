library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity first is
  port (
	input: in std_logic_vector(7 downto 0);
	enable: in std_logic;
	led: out std_logic_vector(7 downto 0)
  ) ;
end first;

architecture lesson1 of first is
begin
	led(0) <= enable and (input(0) xor input(1));
	led(1) <= enable and (input(1) xor input(2));
	led(2) <= enable and (input(2) xor input(3));
	led(3) <= enable and (input(3) xor input(4));
	led(4) <= enable and (input(4) xor input(5));
	led(5) <= enable and (input(5) xor input(6));
	led(6) <= enable and (input(6) xor input(7));
	led(7) <= enable and input(7);

end lesson1 ; -- lesson1