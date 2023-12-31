library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity fullAdder is
	port(
		num1:in std_logic;
		num2:in std_logic;
		carry_in:in std_logic;
		sum:out std_logic;
		carry_out:out std_logic
	);
end fullAdder;


architecture behave of fullAdder is
begin
	sum<= num1 xor num2 xor carry_in;
	carry_out<=(num1 and num2) or ((num1 xor num2) and carry_in);
end behave;
