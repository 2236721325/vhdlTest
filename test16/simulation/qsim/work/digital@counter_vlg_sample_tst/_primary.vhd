library verilog;
use verilog.vl_types.all;
entity digitalCounter_vlg_sample_tst is
    port(
        add_or_sub      : in     vl_logic;
        clock           : in     vl_logic;
        step            : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end digitalCounter_vlg_sample_tst;
