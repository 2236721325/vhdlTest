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
	signal slow_clock: std_logic := '0';
	signal slow_counter:integer:=0;
	signal counter:integer:=0;
	signal n:integer:=9999;
	signal m:integer:=5000;
begin
	process(clock)
	begin
        if rising_edge(clock) then
            if slow_counter = 999 then
                slow_counter <= 0;
                slow_clock <= not slow_clock;
            else
                slow_counter <= slow_counter + 1;
            end if;
			


			if(reset='0') then
				counter <=0;
			else 
				counter <=counter+1;
			end if;
			if(counter<m) then 
				fout<='1';
			elsif(counter<n) then
				fout<='0';
			else
				counter<=0;
				fout<='1';
			end if;
		end if;
    end process;

	process(slow_clock)
	begin
		if rising_edge(slow_clock) then
			if reset = '0' then
				n <= 9999;
				m <= 5000;
			end if;
			if(duty_sub='0') then 
				n<=n-1;
			end if;
			if(duty_add='0') then 
				n<=n+1;
			end if;
			if(frequency_sub='0') then 
				m<=m-1;
			end if;
			if(frequency_add='0') then 
				m<=m+1;
			end if;
		end if;
	end process;

	
	
end behave;
