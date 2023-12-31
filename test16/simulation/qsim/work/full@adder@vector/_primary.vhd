library verilog;
use verilog.vl_types.all;
entity fullAdderVector is
    port(
        num1            : in     vl_logic_vector(3 downto 0);
        num2            : in     vl_logic_vector(3 downto 0);
        sum             : out    vl_logic_vector(4 downto 0)
    );
end fullAdderVector;
