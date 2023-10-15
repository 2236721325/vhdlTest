library verilog;
use verilog.vl_types.all;
entity RSTrigger is
    port(
        R               : in     vl_logic;
        S               : in     vl_logic;
        Q               : out    vl_logic;
        Qn              : out    vl_logic
    );
end RSTrigger;
