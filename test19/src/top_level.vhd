library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity top_level is
  port (
    clock_50m: in std_logic;
	 reset:in std_logic;
	 clock_100m:out std_logic;
	 clock_25m:out std_logic;
	 clock_25m_60:out std_logic
  );
end top_level;

architecture behave of top_level is
	signal locked:std_logic;
	component pll_clk is
		port
		(
			areset		: IN STD_LOGIC  := '0';
			inclk0		: IN STD_LOGIC  := '0';
			c0		: OUT STD_LOGIC ;
			c1		: OUT STD_LOGIC ;
			c2		: OUT STD_LOGIC ;
			locked		: OUT STD_LOGIC 
		);
	end component;
begin
	pll_clk_inst:pll_clk
	port map(
		areset=>not reset,
		inclk0=>clock_50m,
		c0=>clock_100m,
		c1=>clock_25m,
		c2=>clock_25m_60,
		locked=>locked
	);		
end behave;









