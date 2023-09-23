library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


-- add_or_sub 0->add, 1->sub;
-- buffer 的意思是 类似触发器的效果 输出的值可以保存起来 作为输入
entity digitalCounter is
	port(
		clock:in std_logic;
		step:in std_logic_vector(3 downto 0);
		add_or_sub:in std_logic;
		count:buffer std_logic_vector(11 downto 0)
	);
end digitalCounter;


architecture behave of digitalCounter is
begin
	process(clock)
	begin
	if rising_edge(clock) then
		if add_or_sub='0' then
			count<=count+step;
		else
			if count < step then 
				count<= (others => '0');
			else 
				count<=count-step;
			end if;
		end if;
	end if;
	end process;


end behave;
