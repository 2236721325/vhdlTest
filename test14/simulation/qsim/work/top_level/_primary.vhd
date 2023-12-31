library verilog;
use verilog.vl_types.all;
entity top_level is
    port(
        clock           : in     vl_logic;
        mt_speed        : in     vl_logic;
        segment         : out    vl_logic_vector(7 downto 0);
        selector        : out    vl_logic_vector(2 downto 0)
    );
end top_level;
