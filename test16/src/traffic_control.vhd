library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--							  	<-----------------------
--								|								|
--	状态依次对应(全红灯->东西通车->闪烁->南北通车->闪烁->
--	状态机 000->001->010->011->100->001;
--	clock_y 为0.5时钟用于黄灯闪烁
	
entity traffic_control is
  port (
	 clock:in std_logic;
    state_counter: in std_logic_vector(2 downto 0);
	 clock_y:in std_logic;
	 tr_g:out std_logic_vector(1 downto 0);
	 tr_r:out std_logic_vector(1 downto 0);
	 tr_y:out std_logic_vector(1 downto 0)
  );
end traffic_control;

architecture behave of traffic_control is
	signal y_state:std_logic:='0';
begin
	process(clock_y)
	begin
		if rising_edge(clock_y) then
			y_state<= not y_state;
		end if;
	end process;
	process(clock)
	begin
		if rising_edge(clock) then
			if state_counter="000" then
				tr_r<="11";
				tr_g<="00";
				tr_y<="00";
			elsif state_counter="001" then
				tr_g<="01";
				tr_r<="10";
				tr_y<="00";
			elsif state_counter="010" then
				tr_g<="00";
				tr_r<="10";
				tr_y(0)<=y_state;
			elsif state_counter="011" then
				tr_g<="10";
				tr_r<="01";
				tr_y<="00";
			elsif state_counter="100" then
				tr_g<="00";
				tr_r<="01";
				tr_y(1)<=y_state;
			end if;
		end if;
	end process;
end behave;

