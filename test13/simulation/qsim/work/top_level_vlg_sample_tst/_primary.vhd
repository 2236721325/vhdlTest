library verilog;
use verilog.vl_types.all;
entity top_level_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        cols            : in     vl_logic_vector(3 downto 0);
        rows            : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end top_level_vlg_sample_tst;
