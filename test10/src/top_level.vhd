library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity  pulseGenerator is
	port(
		clock,
		duty_sub,
		duty_add,
		frequency_sub,
		frequency_add,
		reset:in std_logic;
		fout:out std_logic
		
	);
end pulseGenerator;


architecture behave of pulseGenerator is	
begin
	process(clock)
		variable counter:integer:=0;
		variable n:integer:=9999;
		variable m:integer:=5000;
	begin
		if(rising_edge(clock)) then
			if(reset='0') then
				counter:=0;
			else 
				counter:=counter+1;
			end if;
				
			if(duty_sub='0') then 
				n:=n-1;
			end if;
			if(duty_add='0') then 
				n:=n+1;
			end if;
			if(frequency_sub='0') then 
				m:=m-1;
			end if;
			if(frequency_add='0') then 
				m:=+1;
			end if;
			
			if(counter<m) then 
				fout<='1';
			elsif(counter<n) then
				fout<='0';
			else
				counter:=0;
				fout<='1';
			end if;
		end if;
	end process;
end behave;
