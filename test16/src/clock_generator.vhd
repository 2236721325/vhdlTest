library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


--	用于生成 1s时钟和0.5s时钟

entity clock_generator is
  port (
    clock: in std_logic;
	 clock_1s:out std_logic;
	 clock_05s:out std_logic
  );
end clock_generator;

architecture behave of clock_generator is
begin
	process(clock)
		variable tmp_clock_1s:std_logic:='0';
		variable tmp_clock_05s:std_logic:='0';
		variable tmp_state:std_logic:='0';
		variable cnt_05s:integer range 0 to 500:=0;
	begin
		clock_1s<=tmp_clock_1s;
		clock_05s<=tmp_clock_05s;
		if rising_edge(clock) then
			cnt_05s:=cnt_05s+1;
			if cnt_05s = 250 then
				cnt_05s:=0;
				if tmp_state ='0' then 
					tmp_clock_05s:= not tmp_clock_05s;
					tmp_state:='1';
				else
					tmp_clock_05s:=not tmp_clock_05s;
					tmp_clock_1s:=not tmp_clock_1s;
					tmp_state:='0';
				end if;
			end if;
		end if;
	end process;
end behave;

