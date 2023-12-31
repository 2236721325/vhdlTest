library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity  keyBoard is
	port(
		clock:in std_logic;
		rows:in std_logic_vector(3 downto 0);
		cols:in std_logic_vector(3 downto 0);
		result:out std_logic_vector(3 downto 0)
	);
end keyBoard;


architecture behave of keyBoard is	
begin
	process(clock)
		variable rowIndex:integer:=-1;
		variable colIndex:integer:=-1;
		variable temp_result:integer:=0;
	begin
		if rising_edge(clock) then 
			for i in 0 to 3 loop
				if rows(i)='0' then 
					rowIndex<=i;
				end if;
				if cols(i)='0' then
					colIndex<=i;
				end if;
			end loop;
			
			if rowIndex=-1 or colIndex=-1 then
				temp_result<=0;
			else
				if rowIndex<3 and colIndex<3 then
					temp_result<= rowIndex*3 + colIndex + 1;
					
				end if;
				
				if colIndex=3 then 
					temp_result<= rowIndex+10;
				end if;
				
				if rowIndex=3 then
					case colIndex is
						when 0=> temp_result<=14;
						when 1=> temp_result<=0;
						when 2=> temp_result<=15;
						when 3=> temp_result<=13;
						when others=> temp_result<=0;
					end case;
				end if;
			
			end if;
			result <= conv_std_logic_vector(temp_result, result'length);

			
			
			
		end if;
		
	
		
	end process;

end behave;
