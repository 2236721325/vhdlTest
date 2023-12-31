library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity test14 is
    port(
        clk : in std_logic;
        mt_speed : in std_logic;--霍尔器件输出脉冲
		  mt_pwm : out std_logic;--pwm输出
        seg : out std_logic_vector(7 downto 0);--八个数码管
        sel : out std_logic_vector(2 downto 0)--译码器选择
    );edc
end test14;
architecture myArc of test14 is
    signal count_sel : std_logic_vector(2 downto 0);--显示计数器
	 signal tim_1s : std_logic_vector(9 downto 0);--1秒定时器
	 signal count_rps : integer := 0;--每秒电机转次
	 signal mt_speed_rpm,mt_speed_unit : integer := 0;--每分钟电机转次，电机速度每位
begin
	--显示
	 sel <= count_sel;
    process(clk)
	 begin
        if rising_edge(clk) then
				if(count_sel = "011") then
					count_sel <= "000";
				else
					count_sel <= count_sel + '1';
				end if;
        end if;
    end process;
	 
	 process(count_sel)
	 begin
		case count_sel is
            when"000"=>
					mt_speed_unit <= mt_speed_rpm/1000;
            when"001"=>
					mt_speed_unit <= (mt_speed_rpm/100) rem 10;
            when"010"=>
					mt_speed_unit <= (mt_speed_rpm/10) rem 10;
				when"011"=>
					mt_speed_unit <= mt_speed_rpm rem 10;
            when others=>null; 
        end case;
	 end process;
	 
	 process(mt_speed_unit)
	 begin
		case mt_speed_unit is
            when 0=>seg<="00111111";--0
            when 1=>seg<="00000110";--1
            when 2=>seg<="01011011";--2
            when 3=>seg<="01001111";--3
            when 4=>seg<="01100110";--4
            when 5=>seg<="01101101";--5
            when 6=>seg<="01111101";--6
            when 7=>seg<="00000111";--7
            when 8=>seg<="01111111";--8
            when 9=>seg<="01101111";--9
            when others=>null; 
        end case;
	 end process;
	 
	 --1s
	 process(clk)
	 begin
        if rising_edge(clk) then
				if(tim_1s = "1111101000") then
					tim_1s <= "0000000000";
				else
					tim_1s <= tim_1s + '1';
				end if;
        end if;
    end process;
	 
	 --转次计数
	 process(mt_speed,tim_1s)
	 begin
		if (tim_1s = "1111101000") then
			count_rps <= 0;
		else
			if rising_edge(mt_speed) then
				count_rps <= count_rps + 1;
			end if;
		end if;
    end process;
	 
	 --锁存数据
	 process(clk)
	 begin
		if rising_edge(clk) then
			if(tim_1s = "1111100111") then
				mt_speed_rpm <= count_rps*60;
			end if;
       end if;
    end process;
	 
	 
end myArc;
