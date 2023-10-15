library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity   top_level is
	port(
		clock:in std_logic;
		rows:in std_logic_vector(3 downto 0);
		cols:in std_logic_vector(3 downto 0);
		segment: out std_logic_vector(7 downto 0);
		selector: out std_logic_vector(2 downto 0)
	);
end  top_level;


architecture behave of  top_level is	
	component  keyBoard is
		port(
			clock:in std_logic;
			rows:in std_logic_vector(3 downto 0);
			cols:in std_logic_vector(3 downto 0);
			result:out std_logic_vector(3 downto 0)
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
	
	signal temp_result:std_logic_vector(3 downto 0):=(others=>'0');
begin

	 keyBoard_inst: keyBoard
    port map (
        clock => clock,
        rows => rows, -- Connect the counter result to the digitalTube
        cols => cols,
        result => temp_result
    );
    -- Instantiate the digitalTube component
    digitalTube_inst: digitalTube
    port map (
        clock => clock,
        key => temp_result, -- Connect the counter result to the digitalTube
        segment => segment,
        selector => selector
    );
	 

end behave;
