library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity top_level is
	port(
		clock: in std_logic;
		key: in std_logic_vector(11 downto 0);
		reset:in std_logic;
		carry:out std_logic;
		segment: out std_logic_vector(7 downto 0);
		selector: out std_logic_vector(2 downto 0)
	);

end top_level;

--我不喜欢图形化的方式 连接 entity 就用代码的方式了 直观  简洁
architecture behave of top_level is

	component frequencyDivider is
	  port (
		 clock_in: in std_logic;
		 rate_value: in std_logic_vector(11 downto 0);
		 reset:in std_logic;
		 clock_out: out std_logic
	  );
	end component;


	component counter is
	  port( clock,reset,enable    :  in   std_logic;   
			  count_result           :  out  std_logic_vector(3 downto 0);   
			  carry           :  out  std_logic   
			 );      
	end component;

	component digitalTube is
	  port (
		 clock: in std_logic;
		 key: in std_logic_vector(3 downto 0);
		 segment: out std_logic_vector(7 downto 0);
		 selector: out std_logic_vector(2 downto 0)
	  );
	end component;


   signal divider_clock: std_logic;
	signal counter_result: std_logic_vector(3 downto 0);

begin
  -- Instantiate the frequencyDivider component
    divider_inst: frequencyDivider
    port map (
        clock_in => clock,
        rate_value => key(11 downto 0), -- Assuming key[11:0] is the rate value
        reset => reset,
        clock_out => divider_clock
    );

    -- Instantiate the counter component
    counter_inst: counter
    port map (
        clock => divider_clock, -- Connect the clock to the output of frequencyDivider
        reset => reset,
        enable => '1',
        count_result => counter_result,
        carry => carry
    );

    -- Instantiate the digitalTube component
    digitalTube_inst: digitalTube
    port map (
        clock => clock,
        key => counter_result, -- Connect the counter result to the digitalTube
        segment => segment,
        selector => selector
    );
	 
	 
end  behave;





