library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package functions is
	function to_dec_vector(input_integer: integer) return std_logic_vector;
end package functions;

package body functions is
	function to_dec_vector(input_integer: integer) return std_logic_vector is
	  variable result_vector: std_logic_vector(31 downto 0);
	  variable temp:integer:=0;
	  variable temp_int:integer:=0;
	begin
		temp_int:=input_integer;
	  for i in 0 to 3 loop
		temp:=temp_int rem 10;
		temp_int:=temp_int/10;
		result_vector(i*4+3 downto i*4):=std_logic_vector(to_unsigned(temp, 4));
	  end loop;
	  return result_vector;
	end function;
end package body functions;


