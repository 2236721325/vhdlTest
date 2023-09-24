library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fullAdderVector is
	port(
		num1:in std_logic_vector(3 downto 0);
		num2:in std_logic_vector(3 downto 0);
		sum:out std_logic_vector(4 downto 0)
	);
end fullAdderVector;


architecture behave of fullAdderVector is
	signal carry:std_logic_vector(3 downto 0):=(others=>'0');
	component fullAdder is
		port(
			num1:in std_logic;
			num2:in std_logic;
			carry_in:in std_logic;
			sum:out std_logic;
			carry_out:out std_logic
		);
	end component;
	
begin

	inst_1:fullAdder port map (num1(0),num2(0),'0',sum(0),carry(0));
	inst_2:fullAdder port map (num1(1),num2(1),carry(0),sum(1),carry(1));
	inst_3:fullAdder port map (num1(2),num2(2),carry(1),sum(2),carry(2));
	inst_4:fullAdder port map (num1(3),num2(3),carry(2),sum(3),carry(3));
	sum(4)<=carry(3);
end behave;
