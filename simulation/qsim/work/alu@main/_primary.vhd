library verilog;
use verilog.vl_types.all;
entity aluMain is
    port(
        iA              : in     vl_logic_vector(15 downto 0);
        iB              : in     vl_logic_vector(15 downto 0);
        iOpcode         : in     vl_logic_vector(2 downto 0);
        iClock          : in     vl_logic;
        oAccumulator    : out    vl_logic_vector(15 downto 0);
        nCarryflagout   : out    vl_logic;
        nZeroflagout    : out    vl_logic
    );
end aluMain;
