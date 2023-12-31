library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity top_level is
  port (
    clock: in std_logic;
	 reset:in std_logic;
	 tr_g:out std_logic_vector(1 downto 0);
	 tr_r:out std_logic_vector(1 downto 0);
	 tr_y:out std_logic_vector(1 downto 0);
    segment: out std_logic_vector(7 downto 0);
    selector: out std_logic_vector(2 downto 0)
  );
end top_level;


architecture behave of top_level is
	component digitalTube is
	  port (
		 clock: in std_logic;
		 keys: in std_logic_vector(31 downto 0);
		 segment: out std_logic_vector(7 downto 0);
		 selector: out std_logic_vector(2 downto 0)
	  );
	end component;
	component bcd_counter is
		port (
		clock: in std_logic;
		reset:in std_logic;
		counter: out std_logic_vector(7 downto 0);
		state_counter:out std_logic_vector(2 downto 0)
		);
	end component;
	component clock_generator is
	  port (
		 clock: in std_logic;
		 clock_1s:out std_logic;
		 clock_05s:out std_logic
	  );
	end component;
	component traffic_control is
	  port (
		 clock:in std_logic;
		 state_counter: in std_logic_vector(2 downto 0);
		 clock_y:in std_logic;
		 tr_g:out std_logic_vector(1 downto 0);
		 tr_r:out std_logic_vector(1 downto 0);
		 tr_y:out std_logic_vector(1 downto 0)
	  );
	end component;
	signal tube_show:std_logic_vector(31 downto 0);
	signal time_counter:std_logic_vector(7 downto 0);
	signal state_counter:std_logic_vector(2 downto 0);
	signal clock_1s:std_logic;
	signal clock_05s:std_logic;
begin
	digitalTube_inst: digitalTube
    port map (
        clock => clock,
        keys => tube_show,
        segment => segment,
        selector => selector
    );
	bcd_counter_inst: bcd_counter
    port map (
        clock => clock_1s,
		  reset=>reset,
        counter => time_counter,
		  state_counter=>state_counter
    );
	clock_generator_inst: clock_generator
    port map (
        clock => clock,
        clock_1s => clock_1s,
		  clock_05s=>clock_05s
    ); 
	traffic_control_inst: traffic_control
    port map (
        clock => clock,
        state_counter => state_counter,
		  clock_y=>clock_05s,
		  tr_g=>tr_g,
		  tr_r=>tr_r,
		  tr_y=>tr_y
    ); 
	tube_show(7 downto 0)<=time_counter;
end behave;

