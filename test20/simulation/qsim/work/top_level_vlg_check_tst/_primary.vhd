library verilog;
use verilog.vl_types.all;
entity top_level_vlg_check_tst is
    port(
        clock_25m       : in     vl_logic;
        clock_25m_60    : in     vl_logic;
        clock_100m      : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end top_level_vlg_check_tst;
