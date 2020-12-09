library verilog;
use verilog.vl_types.all;
entity ALU_DESIGN_vlg_check_tst is
    port(
        nCarryflagout   : in     vl_logic;
        nZeroflagout    : in     vl_logic;
        oAccumulator    : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALU_DESIGN_vlg_check_tst;
