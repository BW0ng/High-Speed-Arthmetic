# Use this Comparator.do file to run this example.
# Either bring up ModelSim and type the following at the "ModelSim>" prompt:
#     do Comparator.do
# or, to run from a shell, type the following at the shell prompt:
#     vsim -do Comparator.do -c
# (omit the "-c" to see the GUI while running from the shell)

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog Comparator.sv testbench.sv

# start and run simulation
vsim -novopt work.testbench

view list
view wave

######################################
#             Wave Forms             #
######################################

# Inputs
add wave -noupdate -divider -height 32 "Inputs"
add wave -hex /testbench/dut/A
add wave -hex /testbench/dut/B

# Ouputs
add wave -noupdate -divider -height 32 "Outputs"
add wave -hex /testbench/dut/A_eq_B
add wave -hex /testbench/dut/A_lt_B
add wave -hex /testbench/dut/A_gt_B

add list -hex -r /testbench/*
add log -r /*

-- Set Wave Output Items
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {75 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation
run 340
