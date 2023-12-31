library verilog;
use verilog.vl_types.all;
entity top_level_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        keys            : in     vl_logic_vector(1 downto 0);
        nd              : in     vl_logic;
        nu              : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end top_level_vlg_sample_tst;
