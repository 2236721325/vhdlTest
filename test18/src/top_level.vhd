library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity top_level is
  port (
    clock: in std_logic;--时钟为24MHZ
	 spk:out std_logic
  );
end top_level;

architecture behave of top_level is
	component clock_generator is
	  port (
		 clock: in std_logic;--时钟为24MHZ
		 clock_4hz:out std_logic
	  );
	end component;
	component frequency_counter is
		port (
			clock: in std_logic;--时钟为24MHZ
			clock_4hz:in std_logic;
			data:in std_logic_vector(7 downto 0);
			spk:out std_logic
		);
	end component;
	component rom_read is
	port
	(
		address		: in STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
	signal clock_4hz:std_logic;
	signal start_address:std_logic_vector(7 downto 0):=(others=>'0');
	signal address:std_logic_vector(7 downto 0);
	signal cur_data:std_logic_vector(7 downto 0);
begin
	clock_generator_inst: clock_generator
	port map (
		clock => clock,
      clock_4hz => clock_4hz
	);
	frequency_counter_inst:frequency_counter
	port map(
		clock=>clock,
		clock_4hz=>clock_4hz,
		data=>cur_data,
		spk=>spk
	);
	rom_read_inst:rom_read
	port map(
		address=>address,
		clock=>clock,
		q=>cur_data
	);
	
	process(clock_4hz)
		variable address_cnt:integer:=0;
	begin
		address<=start_address+address_cnt;
		if rising_edge(clock_4hz) then
			address_cnt:=address_cnt+1;
			if(address_cnt>=112) then
				address_cnt:=0;
			end if;	
		end if;
	
	end process;
		
end behave;









