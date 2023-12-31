library verilog;
use verilog.vl_types.all;
entity top_level is
    port(
        clock_50m       : in     vl_logic;
        reset           : in     vl_logic;
        clock_100m      : out    vl_logic;
        clock_25m       : out    vl_logic;
        clock_25m_60    : out    vl_logic
    );
end top_level;
