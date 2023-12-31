library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
entity test15 is
	port( 
		
		gclk : in std_logic;
		k : in std_logic; 
		 
		step_a : out std_logic; 
		step_b : out std_logic; 
		step_c : out std_logic; 
		step_d : out std_logic; 
		
		step_7_5 : in std_logic; --1 
		step_15 : in std_logic; --2
		step_30 : in std_logic; --4
		step_45 : in std_logic; --6
		step_90 : in std_logic; --12
		step_180 : in std_logic; --24
		step_360 : in std_logic; --48
		step_n : in std_logic
       );      
end test15;
--------------------------------------------------------------------
architecture lesson of test15 is

signal cnt : integer range 0 to 1000 := 0;
signal low_clk : std_logic := '0';

signal step : std_logic_vector(3 downto 0) := "1000";--abcd
signal counter : integer range 0 to 10000000 := 0;
signal tmp_counter : integer range 0 to 10000000 := 0;

signal rst_0 : std_logic := '0'; 
signal rst_1 : std_logic := '0'; 
signal en : std_logic := '1';  

begin


	process(gclk)--产生低频信号，降低转盘速度，便于观察
	begin
		if rising_edge(gclk) then
			if cnt = 30 then
				low_clk <= not low_clk;
				cnt <= 0;
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process;
	
	
	process(low_clk,step_7_5, step_15, step_30, step_45, step_90, step_180, step_360, step_n)
	begin
		if rst_0 = '1' then--本次旋转结束，目标步进次数置零
			counter <= 0;
		elsif rising_edge(low_clk) then
			if en = '1' then--对应角度选择对应目标步进次数
				if step_7_5 = '0' then
					counter <= 1;
				elsif step_15 = '0' then
					counter <= 2;
				elsif step_30 = '0' then
					counter <= 4;
				elsif step_45 = '0' then
					counter <= 6;
				elsif step_90 = '0' then
					counter <= 12;
				elsif step_180 = '0' then
					counter <= 24;
				elsif step_360 = '0' then
					counter <= 48;
				elsif step_n = '0' then
					counter <= 480;	
				end if;
			end if;
		end if;
	end process;
	
	
	process (low_clk)
	begin
		if rst_1 = '1' then--本次旋转结束，步进次数置零
			tmp_counter <= 0;
		elsif rising_edge(low_clk) then
			if tmp_counter < counter then--本次旋转未结束，步进
				
				if k = '1' then--根据 k 值判断顺、逆时针
					step(3) <= step(2);
					step(2) <= step(1);
					step(1) <= step(0);
					step(0) <= step(3);
				else
					step(3) <= step(0);
					step(2) <= step(3);
					step(1) <= step(2);
					step(0) <= step(1);
				end if;
				
				tmp_counter <= tmp_counter + 1;--步进数目加一
				
			end if;	
		end if;
	end process;
	
	
	process (low_clk)
	begin
		if rising_edge(low_clk) then
			if counter = 0 then--目标步进次数置零时，复位完成，等待按键确定目标步进次数
				rst_0 <= '0';
				rst_1 <= '0';
				en <= '1';
			elsif tmp_counter + 1 < counter then--已步进次数小于目标步进次数时，旋转继续，目标步进次数不变
				rst_0 <= '0';
				rst_1 <= '0';
				en <= '0';
			elsif tmp_counter + 1 = counter then--已步进次数等于目标步进次数时，旋转结束，不旋转，目标步进次数置零
				rst_0 <= '1';
				rst_1 <= '1';
			end if;	
		end if;
	end process;
	
	
	step_a <= step(3); 
	step_b <= step(2);
	step_c <= step(1);
	step_d <= step(0);
	
		
end lesson;
