library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test1 is
  port (
    input: in std_logic_vector(2 downto 0);
	output: out std_logic_vector(7 downto 0)
  ) ;
end test1;

architecture entry of test1 is
begin
    identifier : process( sensitivity_list )
    begin
        
    end process ; -- identifier
    output<="00000001" when input="000" else
            "00000010" when input="001" else
            "00000100" when input="010" else
            "00001000" when input="011" else
            "00010000" when input="100" else
            "00100000" when input="101" else
            "01000000" when input="110" else
            "10000000"; 
end entry ; -- lesson1