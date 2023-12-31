library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity  keyBoard is
	port(
		clock:in std_logic;
		cols:inout  std_logic_vector(3 downto 0);
		rows:inout  std_logic_vector(3 downto 0);
		result:out std_logic_vector(31 downto 0)
	);
end keyBoard;

architecture behave of keyBoard is
	signal state_clock:std_logic_vector(1 downto 0):=(others=>'0');
	signal rowIndex:integer;
	signal colIndex:integer;
begin

	
	process(clock)
		variable temp_result:integer:=-1;
		variable last_result:integer:=-1;
		variable tmp_vector_result:std_logic_vector(31 downto 0):=(others=>'0');
	begin
		if rising_edge(clock) then
			state_clock<=state_clock+1;
			result<=tmp_vector_result;
			if state_clock="01" then
				rowIndex<=-1;
				colIndex<=-1;
				rows <="ZZZZ";
				cols <= "0000";
			elsif state_clock="10" then
				for i in 0 to 3 loop
					if rows(i) = '0' then
						colIndex <= 3-i;
					end if;
				end loop;
				cols <= "ZZZZ";
				rows <="0000";
			elsif state_clock="11" then

				for i in 0 to 3 loop
					if cols(i)='0' then
						rowIndex <= 3-i;
					end if;
				end loop;
			else
				if rowIndex=-1 or colIndex=-1 then
					temp_result:=-1;
				else
					if rowIndex<3 and colIndex<3 then
						temp_result:= rowIndex*3 + colIndex + 1;
					end if;
					if colIndex=3 then 
						temp_result:= rowIndex+10;
					end if;
					if rowIndex=3 then
						case colIndex is
							when 0=> temp_result:=14;
							when 1=> temp_result:=0;
							when 2=> temp_result:=15;
							when 3=> temp_result:=13;
							when others=> temp_result:=0;
						end case;
					end if;
				end if;
				
				if temp_result/=-1 and last_result/=temp_result then
					last_result:=temp_result;
					tmp_vector_result:=to_stdlogicvector(to_bitvector(tmp_vector_result) srl 4);
					tmp_vector_result(31 downto 28 ):=std_logic_vector(to_unsigned(temp_result,4));
				end if;
				
				

			end if;
			
			
		end if;
		
	
		
	end process;

end behave;
