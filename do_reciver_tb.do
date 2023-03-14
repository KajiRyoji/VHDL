vlib work
vcom -work work D:/Teaching/2023/drozdetski_g/VHDL/Reciver_logic.vhd
vcom -work work D:/Teaching/2023/drozdetski_g/VHDL/reciver_tb.vhd

vsim work.reciver_tb

add wave -position end  sim:/reciver_tb/reciver_inst/mac_taken
add wave -position end  sim:/reciver_tb/reciver_inst/rxdv
add wave -position end  sim:/reciver_tb/reciver_inst/clk
add wave -position end  sim:/reciver_tb/reciver_inst/rxd
add wave -position end  sim:/reciver_tb/reciver_inst/rxd_out
add wave -position end  sim:/reciver_tb/reciver_inst/rxdv_out
add wave -position end  sim:/reciver_tb/reciver_inst/resetb
add wave -position end  sim:/reciver_tb/reciver_inst/mdk
add wave -position end  sim:/reciver_tb/reciver_inst/a
add wave -position end  sim:/reciver_tb/reciver_inst/b
add wave -position end  sim:/reciver_tb/reciver_inst/ind
add wave -position end  sim:/reciver_tb/reciver_inst/mem
add wave -position end  sim:/reciver_tb/reciver_inst/flag
add wave -position end  sim:/reciver_tb/reciver_inst/mac_taken


run -all