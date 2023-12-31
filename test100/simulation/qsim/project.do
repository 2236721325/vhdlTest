onerror {quit -f}
vlib work
vlog -work work project.vo
vlog -work work project.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.digitalCounter_vlg_vec_tst
vcd file -direction project.msim.vcd
vcd add -internal digitalCounter_vlg_vec_tst/*
vcd add -internal digitalCounter_vlg_vec_tst/i1/*
add wave /*
run -all
