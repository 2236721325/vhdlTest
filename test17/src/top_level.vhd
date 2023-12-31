library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity top_level is
  port (
    clock: in std_logic;
	 reset:in std_logic;
	 nd:in std_logic;
	 nu:in std_logic;
	 keys:in std_logic_vector(1 downto 0);
	 dac_clock:out std_logic;
    dacs: out std_logic_vector(7 downto 0)
  );
end top_level;


architecture behave of top_level is
	component data_rom is
	port
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
	signal address:std_logic_vector(7 downto 0):=(others=>'0');
	signal clock_value:integer:=2500;
	signal slow_clock:std_logic:='0';
begin
	process(clock)
	variable counter:integer:=0;
	variable nd_bf:std_logic:='0';
	variable nu_bf:std_logic:='0';
	variable reset_bf:std_logic:='0';
	begin
		if rising_edge(clock) then
			counter:=counter+1;
			if counter = clock_value then
				slow_clock<= not slow_clock;
				counter:=0;
			end if;
			if nd='0' then
				nd_bf:='1';
			else
				if nd_bf='1' then
					if clock_value>100 then
							clock_value<=clock_value-100;
					end if;
					counter:=0;
					nd_bf:='0';
				end if;
			end if;
			if nu='0' then
				nu_bf:='1';
			else
				if nu_bf='1' then
					clock_value<=clock_value+100;
					counter:=0;
					nu_bf:='0';
				end if;
			end if;
			if reset='0' then
				reset_bf:='1';
			else
				if reset_bf='1' then
					clock_value<=5000;
					counter:=0;
					reset_bf:='0';
				end if;
			end if;
		end if;
	end process;
	

		
	process(slow_clock,keys)
	variable address_counter:integer:=0;
	variable start_address:std_logic_vector(7 downto 0):=(others=>'0');
	begin
		address<=start_address+address_counter;
		if rising_edge(slow_clock) then
			if(address_counter=63) then
				address_counter:=0;
			else
				address_counter:=address_counter+1;
			end if;
			case(keys) is
				when "00"=>start_address:="00000000";
				when "01"=>start_address:="01000000";
				when "10"=>start_address:="10000000";
				when others=>start_address:="00000000";
			end case;
		end if;
	end process;
	data_rom_inst : data_rom 
	port map (
		address	 => address,
		clock	 => slow_clock,
		q	 => dacs
	);
	dac_clock<=slow_clock;
end behave;









