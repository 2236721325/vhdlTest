library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity clock_generator is
  port (
    clock: in std_logic;--时钟为24MHZ
	 clock_4hz:out std_logic
  );
end clock_generator;

architecture behave of clock_generator is
begin
	process(clock)
		variable tmp_counter_4hz:integer range 0 to 4000000:=0;
		variable tmp_clock_4hz:std_logic:='0';
	begin
		clock_4hz<=tmp_clock_4hz;
		if rising_edge(clock) then
			tmp_counter_4hz:=tmp_counter_4hz+1;
			if (tmp_counter_4hz >= 3000000) then
				tmp_clock_4hz:=not tmp_clock_4hz;
				tmp_counter_4hz:=0;
			end if;
		end if;
	end process;
end behave;









