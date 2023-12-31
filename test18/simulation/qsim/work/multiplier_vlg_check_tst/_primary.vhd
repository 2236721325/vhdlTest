library verilog;
use verilog.vl_types.all;
entity multiplier_vlg_check_tst is
    port(
        result          : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end multiplier_vlg_check_tst;
