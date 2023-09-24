library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity  RSTrigger is
	port(
		R,
		S:in std_logic;
		Q:buffer std_logic;
		Qn:out std_logic -- not Q
	);
end RSTrigger;


architecture behave of RSTrigger is	
begin
	process(R,S)
	begin
		  if R = '0' and S = '1' then  --低电平有效
            Q <= '0';  -- 异步复位
        elsif R = '1' and S = '0' then
            Q <= '1';  -- 异步设置
--        elsif R = '0' and S = '0' then   --buffer 默认便是保持 所以可以删除
--            Q <= Q;  -- 保持状态
        end if;
		  Qn <= not Q;
	end process;

end behave;
