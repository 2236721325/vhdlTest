library verilog;
use verilog.vl_types.all;
entity fullAdderVector_vlg_sample_tst is
    port(
        num1            : in     vl_logic_vector(3 downto 0);
        num2            : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end fullAdderVector_vlg_sample_tst;
