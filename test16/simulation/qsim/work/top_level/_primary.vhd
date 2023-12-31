library verilog;
use verilog.vl_types.all;
entity top_level is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        tr_g            : out    vl_logic_vector(1 downto 0);
        tr_r            : out    vl_logic_vector(1 downto 0);
        tr_y            : out    vl_logic_vector(1 downto 0);
        segment         : out    vl_logic_vector(7 downto 0);
        selector        : out    vl_logic_vector(2 downto 0)
    );
end top_level;
