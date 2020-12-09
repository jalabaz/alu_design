library verilog;
use verilog.vl_types.all;
entity ALU_DESIGN_vlg_sample_tst is
    port(
        iA              : in     vl_logic_vector(15 downto 0);
        iAluOpcode      : in     vl_logic_vector(2 downto 0);
        iB              : in     vl_logic_vector(15 downto 0);
        iClock          : in     vl_logic;
        iRegACommand    : in     vl_logic_vector(2 downto 0);
        iRegBCommand    : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end ALU_DESIGN_vlg_sample_tst;
