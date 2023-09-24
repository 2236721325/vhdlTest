library verilog;
use verilog.vl_types.all;
entity digitalTube is
    port(
        clock           : in     vl_logic;
        key             : in     vl_logic_vector(3 downto 0);
        segment         : out    vl_logic_vector(7 downto 0);
        selector        : out    vl_logic_vector(2 downto 0)
    );
end digitalTube;
