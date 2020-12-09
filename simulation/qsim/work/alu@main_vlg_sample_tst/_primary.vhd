library verilog;
use verilog.vl_types.all;
entity aluMain_vlg_sample_tst is
    port(
        iA              : in     vl_logic_vector(15 downto 0);
        iB              : in     vl_logic_vector(15 downto 0);
        iClock          : in     vl_logic;
        iOpcode         : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end aluMain_vlg_sample_tst;
