library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity top_level is
	port(
		gclk:in std_logic;
		kb_dat:in std_logic;
		kb_clk:in std_logic;
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
	signal tube_show:std_logic_vector(31 downto 0):=(others=>'0');
begin 
	 digitalTube_inst: digitalTube
    port map (
        clock => gclk,
        keys => tube_show,
        segment => segment,
        selector => selector
    );
	 process(kb_clk)
		variable tmp_cnt:integer range 0 to 20:=0;
		variable code:std_logic_vector(10 downto 0):=(others=>'0');
		variable ok:std_logic:='0';
	 begin
		if falling_edge(kb_clk) then
			code(tmp_cnt):=kb_dat;
			tmp_cnt:=tmp_cnt+1;
			if(tmp_cnt>10) then
				tmp_cnt:=0;
				tube_show(7 downto 0)<=code(8 downto 1);
			   code:=(others=>'0');
			end if;
		end if;
	 end process;
	 
end behave;









