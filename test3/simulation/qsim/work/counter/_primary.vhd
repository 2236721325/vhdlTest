library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        count_result    : out    vl_logic_vector(3 downto 0);
        carry           : out    vl_logic
    );
end counter;
