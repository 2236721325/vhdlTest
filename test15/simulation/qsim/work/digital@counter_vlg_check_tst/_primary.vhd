library verilog;
use verilog.vl_types.all;
entity digitalCounter_vlg_check_tst is
    port(
        count           : in     vl_logic_vector(11 downto 0);
        sampler_rx      : in     vl_logic
    );
end digitalCounter_vlg_check_tst;
