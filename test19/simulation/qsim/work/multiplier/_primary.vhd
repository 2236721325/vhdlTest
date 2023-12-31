library verilog;
use verilog.vl_types.all;
entity multiplier is
    port(
        num1            : in     vl_logic_vector(3 downto 0);
        num2            : in     vl_logic_vector(3 downto 0);
        result          : out    vl_logic_vector(7 downto 0)
    );
end multiplier;
