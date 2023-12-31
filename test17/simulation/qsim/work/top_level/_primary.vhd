library verilog;
use verilog.vl_types.all;
entity top_level is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        nd              : in     vl_logic;
        nu              : in     vl_logic;
        keys            : in     vl_logic_vector(1 downto 0);
        dac_clock       : out    vl_logic;
        dacs            : out    vl_logic_vector(7 downto 0)
    );
end top_level;
