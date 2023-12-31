library verilog;
use verilog.vl_types.all;
entity top_level_vlg_check_tst is
    port(
        segment         : in     vl_logic_vector(7 downto 0);
        selector        : in     vl_logic_vector(2 downto 0);
        tr_g            : in     vl_logic_vector(1 downto 0);
        tr_r            : in     vl_logic_vector(1 downto 0);
        tr_y            : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end top_level_vlg_check_tst;
