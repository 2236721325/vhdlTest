library verilog;
use verilog.vl_types.all;
entity frequencyDivider is
    port(
        clock_in        : in     vl_logic;
        rate_value      : in     vl_logic_vector(11 downto 0);
        reset           : in     vl_logic;
        clock_out       : out    vl_logic
    );
end frequencyDivider;
