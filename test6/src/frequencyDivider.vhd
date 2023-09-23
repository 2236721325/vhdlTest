library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity frequencyDivider is
  port (
    clock_in: in std_logic;
    rate_value: in std_logic_vector(11 downto 0);
    reset:in std_logic;
    clock_out: out std_logic
  );
end frequencyDivider;

architecture behave of frequencyDivider is
  signal temp_counter: integer := 0; -- 使用 signal 声明
  signal rate_value_int: integer;
begin

  rate_value_int <= conv_integer(rate_value); -- 将 std_logic_vector 转换为整数
  process(clock_in, reset)
  begin
    if reset = '0' then
      temp_counter <= 0;
      clock_out <= '0';
    elsif rising_edge(clock_in) then
      temp_counter <= temp_counter + 1;
      if temp_counter < rate_value_int then
        clock_out <= '1';
      elsif temp_counter = rate_value_int * 2 - 1 then
        temp_counter <= 0;
        clock_out <= '0';
      else
        clock_out <= '0';
      end if;
    end if;
  end process;
end behave;