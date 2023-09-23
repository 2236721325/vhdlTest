library verilog;
use verilog.vl_types.all;
entity top_level_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        key             : in     vl_logic_vector(11 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end top_level_vlg_sample_tst;
