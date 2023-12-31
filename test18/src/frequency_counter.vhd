library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity frequency_counter is
  port (
    clock:in std_logic;
    clock_4hz: in std_logic;--4hz
	 data:in std_logic_vector(7 downto 0);
	 spk:out std_logic
  );
end frequency_counter;

architecture behave of frequency_counter is
	signal counter:integer:=0;
begin
	process(clock_4hz,data)
			variable var_data:integer range 0 to 100;
	begin
		if rising_edge(clock_4hz) then
			var_data:=conv_integer(data);
			case(var_data) is
				when 1 => counter<=24000000/261;
				when 2 => counter<=24000000/293;
				when 3 => counter<=24000000/329;
				when 4 => counter<=24000000/349;
				when 5 => counter<=24000000/392;
				when 6 => counter<=24000000/440;
				when 7 => counter<=24000000/499;
				
				when 11 => counter<=24000000/523;
				when 12=> counter<=24000000/587;
				when 13 => counter<=24000000/659;
				when 14 => counter<=24000000/698;
				when 15 => counter<=24000000/784;
				when 16 => counter<=24000000/880;
				when 17 => counter<=24000000/998;
				
				when 21 => counter<=24000000/1046;
				when 22 => counter<=24000000/1174;
				when 23 => counter<=24000000/1318;
				when 24 => counter<=24000000/1396;
				when 25 => counter<=24000000/1568;
				when 26 => counter<=24000000/1760;
				when 27 => counter<=24000000/1976;
				
				when 31 => counter<=24000000/2093;
				when 32 => counter<=24000000/2349;
				when 33=> counter<=24000000/2637;
				when 34=> counter<=24000000/2794;
				when 35=> counter<=24000000/3136;
				when 36=> counter<=24000000/3520;
				when 37=> counter<=24000000/3951;
				when others=> counter<=24000000/261;
			end case;
		end if;
	end process;
	process(clock)
		variable tmp_counter:integer:=0;
		variable tmp_spk: std_logic:='0';
	begin
		spk<=tmp_spk;
		if rising_edge(clock) then		
			tmp_counter:=tmp_counter+1;
			if tmp_counter>counter then
				tmp_counter:=0;
				tmp_spk:= not tmp_spk;
			end if;
		end if;
	end process;
	
end behave;









