library verilog;
use verilog.vl_types.all;
entity digitalTube_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        key             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end digitalTube_vlg_sample_tst;
