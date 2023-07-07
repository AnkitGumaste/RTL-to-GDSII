# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Mon Jul 03 05:11:15 EDT 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 2.0 -waveform {0.0 1.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_load -pin_load 0.15 [get_ports {q[3]}]
set_load -pin_load 0.15 [get_ports {q[2]}]
set_load -pin_load 0.15 [get_ports {q[1]}]
set_load -pin_load 0.15 [get_ports {q[0]}]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 0.8 [get_ports rst]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.8 [get_ports {q[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.8 [get_ports {q[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.8 [get_ports {q[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.8 [get_ports {q[0]}]
set_max_fanout 20.000 [current_design]
set_input_transition 0.12 [get_ports clk]
set_input_transition 0.12 [get_ports rst]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
