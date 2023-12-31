library verilog;
use verilog.vl_types.all;
entity frequencyDivider_vlg_sample_tst is
    port(
        clock_in        : in     vl_logic;
        rate_value      : in     vl_logic_vector(11 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end frequencyDivider_vlg_sample_tst;
