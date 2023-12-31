library verilog;
use verilog.vl_types.all;
entity pulseGenerator is
    port(
        clock           : in     vl_logic;
        duty_sub        : in     vl_logic;
        duty_add        : in     vl_logic;
        frequency_sub   : in     vl_logic;
        frequency_add   : in     vl_logic;
        reset           : in     vl_logic;
        fout            : out    vl_logic
    );
end pulseGenerator;
