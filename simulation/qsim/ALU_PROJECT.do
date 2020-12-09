onerror {quit -f}
vlib work
vlog -work work ALU_PROJECT.vo
vlog -work work ALU_PROJECT.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ALU_DESIGN_vlg_vec_tst
vcd file -direction ALU_PROJECT.msim.vcd
vcd add -internal ALU_DESIGN_vlg_vec_tst/*
vcd add -internal ALU_DESIGN_vlg_vec_tst/i1/*
add wave /*
run -all
