library verilog;
use verilog.vl_types.all;
entity top_level_vlg_sample_tst is
    port(
        clock_50m       : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end top_level_vlg_sample_tst;
