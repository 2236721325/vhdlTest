library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.ALL;




entity digitalCounter is
	port(
		clock:in std_logic;
		step:in std_logic_vector(6 downto 0);
		add_or_sub:in std_logic;
		reset:in std_logic;
		segment: out std_logic_vector(7 downto 0);
		selector: out std_logic_vector(2 downto 0);
		leds:out std_logic_vector(2 downto 0)
	);
end digitalCounter;


architecture behave of digitalCounter is
	component digitalTube is
	  port (
		 clock: in std_logic;
		 keys: in std_logic_vector(31 downto 0);
		 segment: out std_logic_vector(7 downto 0);
		 selector: out std_logic_vector(2 downto 0)
	  );
	end component;
	signal count_result:integer:=0;
	signal count_result_show:std_logic_vector(31 downto 0):=(others=>'0');
	signal count_step:integer:=0;
	signal timer_count:integer:=0;
	signal key1:integer:=0;
	signal key2:integer:=0;
begin
	-- Instantiate the digitalTube component
    digitalTube_inst: digitalTube
    port map (
        clock => clock,
        keys => count_result_show, -- Connect the counter result to the digitalTube
        segment => segment,
        selector => selector
    );
	process(step)
	begin
		count_step<= conv_integer(step);
		leds<=std_logic_vector(to_unsigned(count_step, leds'length));
	end process;

	process(clock)
	begin
	if rising_edge(clock) then
		timer_count<=timer_count+1;
		if timer_count>1000 then
			timer_count<=0;
			if add_or_sub='0' then
				if key2+count_step>9 then
					key1<=key1+1;
					key2<=key2-10+count_step;
					if key1 >=9 then
						key1<=0;
					end if;
				else 
					key2<=key2+count_step;
				end if;
			else
				if key2 < count_step then
				   key2<=key2+10-count_step;
				   key1<=key1-1;
				   if key1 <= 0 then
						key1<=9;
				   end if;
				else
					key2<=key2-count_step;	
				end if;

			end if;
		end if;
		if(reset='0') then 
			key1<=0;
			key2<=0;
		end if;
		count_result_show(3 downto 0)<= std_logic_vector(to_unsigned(key2, 4));
		count_result_show(7 downto 4)<= std_logic_vector(to_unsigned(key1, 4));

	end if;
	end process;


end behave;
