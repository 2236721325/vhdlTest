library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity multiplier is
	port(
		num1:in std_logic_vector(3 downto 0);
		num2:in std_logic_vector(3 downto 0);
		result:out std_logic_vector(7 downto 0)
	);
end multiplier;


architecture behave of multiplier is
begin
	process (num1, num2)
	variable mult_result:std_logic_vector(7 downto 0);
	variable num2_extended:std_logic_vector(7 downto 0);
	begin
        mult_result := (others => '0');  -- 初始化乘法结果为0
		  num2_extended := (7 downto 4 => '0') & num2; --移位操作会溢出 所以需要拓展为8位
        for i in 0 to 3 loop
            if num1(i) = '1' then
					mult_result := mult_result + to_stdlogicvector(to_bitvector(num2_extended) sll i);  -- 执行乘法并累加 ,VHDL的类型限定过于强，以至于很多时候出问题都是类型错误……
            end if;																							-- 也许有更好的方式
        end loop;
		  result<= mult_result;
	end process;

end behave;
