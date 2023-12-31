library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity top_level is
    Port (
        clock : in std_logic;
        cols : out std_logic_vector(3 downto 0);
        rows : out std_logic_vector(15 downto 0)
    );
end top_level;

architecture Behavioral of top_level is
	signal col_selector:std_logic_vector(3 downto 0):=(others=>'0');
    type MyArray is array (15 downto 0) of std_logic_vector(15 downto 0);
	signal timer:integer:=0;
	constant c_value : MyArray := (
        "0000000000000000", -- 0
		"0000000000000000", -- 1
		"0000000000000000", -- 2
		"0000001111100000", -- 3
		"0000010000100000", -- 4
		"0000010000100000", -- 5
		"0000100000000000", -- 6
		"0000100000000000", -- 7
		"0000100000000000", -- 8
		"0000100000000000", -- 9
		"0000100000000000", -- 10
		"0000010000100000", -- 11
		"0000010001000000", -- 12
		"0000001110000000", -- 13
		"0000000000000000", -- 14
        "0000000000000000" -- 15
    );
	constant n_value : MyArray := (
        "0000000000000000", -- 0
		"0000000000000000", -- 1
		"0000000000000000", -- 2
		"0000110001110000", -- 3
		"0000011000100000", -- 4
		"0000011000100000", -- 5
		"0000010100100000", -- 6
		"0000010100100000", -- 7
		"0000010010100000", -- 8
		"0000010010100000", -- 9
		"0000010010100000", -- 10
		"0000010001100000", -- 11
		"0000010001100000", -- 12
		"0000111000100000", -- 13
		"0000000000000000", -- 14
        "0000000000000000" -- 15
    );
	constant u_value : MyArray := (
        "0000000000000000", -- 0
		"0000000000000000", -- 1
		"0000000000000000", -- 2
		"0000111001110000", -- 3
		"0000010000100000", -- 4
		"0000010000100000", -- 5
		"0000010000100000", -- 6
		"0000010000100000", -- 7
		"0000010000100000", -- 8
		"0000010000100000", -- 9
		"0000010000100000", -- 10
		"0000010000100000", -- 11
		"0000010000100000", -- 12
		"0000001111000000", -- 13
		"0000000000000000", -- 14
        "0000000000000000" -- 15
    );
begin

    process (clock)
    begin
        if rising_edge(clock) then
			timer<=timer+1;
        	col_selector<=col_selector+1;
			cols<=col_selector;
			if(timer<500) then
				rows<=c_value(15-conv_integer(col_selector));
			elsif timer<1000 then
				rows<=c_value(15-conv_integer(col_selector));
			elsif timer<1500 then
				rows<=n_value(15-conv_integer(col_selector));
			elsif timer<4000 then
				rows<=u_value(15-conv_integer(col_selector));
			else
				timer<=0;
			end if;
			  
        end if;
    end process;

end Behavioral;

