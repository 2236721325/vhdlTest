library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--	十进制计数器 20 - 0
--	同时生成 状态计数代码 详细见 traffic_control

entity bcd_counter is
  port (
    clock: in std_logic;
	 reset:in std_logic;
    counter: out std_logic_vector(7 downto 0);
	 state_counter:out std_logic_vector(2 downto 0)
  );
end bcd_counter;

architecture behave of bcd_counter is
begin
	process(clock)
		variable cnt1:integer range 0 to 9:=0;
		variable cnt2:integer range 0 to 9:=2;
		variable tmp_counter:std_logic_vector(2 downto 0):="000";
	begin
		counter(3 downto 0)<=std_logic_vector(to_unsigned(cnt2,4));
		counter(7 downto 4)<=std_logic_vector(to_unsigned(cnt1,4));
		state_counter<=tmp_counter;
		if rising_edge(clock) then
		
			if cnt1 = 0 then
				if cnt2 = 0 then
					cnt2:=2;
					if(tmp_counter = "100") then
						tmp_counter:="001";
					else
						tmp_counter:=tmp_counter+1;
					end if;
				else 
					cnt2:=cnt2-1;
					cnt1:=9;
				end if;
			else
				if (cnt1=3 and cnt2=0) then
					if(tmp_counter="000") then
						cnt1:=cnt1-1;
					else
						cnt1:=cnt1-1;
						tmp_counter:=tmp_counter+1;
					end if;
				else
					cnt1:=cnt1-1;
				end if;
			end if;
			if(reset = '0') then
				tmp_counter:="000";
				cnt1:=0;
				cnt2:=2;
			end if;
		end if;
	end process;
end behave;

