library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity counter is
  port( clock,reset,enable    :  in   std_logic;   
        count_result           :  out  std_logic_vector(3 downto 0);   
        carry           :  out  std_logic   
       );      
end counter;

architecture behave of counter is
begin
    process( clock,reset,enable ) 
    variable temp:std_logic_vector(3 downto 0):=(OTHERS => '0');
    begin
        if reset='0' then temp := (OTHERS => '0');
        elsif  clock'event  and  clock='1' and enable='1' then  
            temp:=temp+1;
        end if ;
        if temp=10 then carry<='1';
        else carry<='0';
        end if;
        count_result<=temp;
    end process ;



end  behave;