library verilog;
use verilog.vl_types.all;
entity RSTrigger_vlg_sample_tst is
    port(
        R               : in     vl_logic;
        S               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end RSTrigger_vlg_sample_tst;
