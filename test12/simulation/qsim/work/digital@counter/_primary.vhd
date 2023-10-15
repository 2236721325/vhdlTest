library verilog;
use verilog.vl_types.all;
entity digitalCounter is
    port(
        clock           : in     vl_logic;
        step            : in     vl_logic_vector(3 downto 0);
        add_or_sub      : in     vl_logic;
        count           : out    vl_logic_vector(11 downto 0)
    );
end digitalCounter;
