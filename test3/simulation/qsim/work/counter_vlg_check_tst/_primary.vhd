library verilog;
use verilog.vl_types.all;
entity counter_vlg_check_tst is
    port(
        carry           : in     vl_logic;
        count_result    : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end counter_vlg_check_tst;
