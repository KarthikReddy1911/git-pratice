vlib work
vmap work work
vlog -reportprogress 300 -work work /proj/assignments/encrtypted_designs/tb_circuit_2_encrypted.sv circuit_2_encrypted.svp
vsim -l result2.log work.tb_circuit_2 -voptargs=+acc -wlf result2.wlf
add wave -position insertpoint sim:/tb_circuit_2/*
run -all
quit -sim
quit -f 
