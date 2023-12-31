library verilog;
use verilog.vl_types.all;
entity fullAdderVector_vlg_check_tst is
    port(
        sum             : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end fullAdderVector_vlg_check_tst;
