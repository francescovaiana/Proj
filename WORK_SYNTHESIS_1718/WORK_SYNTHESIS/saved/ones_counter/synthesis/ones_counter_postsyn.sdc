###################################################################

# Created by write_sdc on Thu Jul 12 13:07:06 2018

###################################################################
set sdc_version 1.3

set_operating_conditions nom_1.20V_25C -library                                \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT
set_wire_load_model -name area_12Kto18K -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT
set_max_area 0
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports clk]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports rst]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[31]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[30]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[29]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[28]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[27]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[26]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[25]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[24]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[23]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[22]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[21]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[20]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[19]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[18]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[17]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[16]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[15]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[14]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[13]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[12]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[11]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[10]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[9]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[8]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[7]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[6]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[5]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[4]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[3]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[2]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[1]}]
set_driving_cell -lib_cell HS65_LS_BFX7 -library                               \
CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT [get_ports {word_in[0]}]
set_load -pin_load 0.05 [get_ports {count_out[5]}]
set_load -pin_load 0.05 [get_ports {count_out[4]}]
set_load -pin_load 0.05 [get_ports {count_out[3]}]
set_load -pin_load 0.05 [get_ports {count_out[2]}]
set_load -pin_load 0.05 [get_ports {count_out[1]}]
set_load -pin_load 0.05 [get_ports {count_out[0]}]
set_max_transition 0.1 [get_ports {count_out[5]}]
set_max_transition 0.1 [get_ports {count_out[4]}]
set_max_transition 0.1 [get_ports {count_out[3]}]
set_max_transition 0.1 [get_ports {count_out[2]}]
set_max_transition 0.1 [get_ports {count_out[1]}]
set_max_transition 0.1 [get_ports {count_out[0]}]
create_clock [get_ports clk]  -period 5  -waveform {0 2.5}
set_clock_latency 0.05  [get_clocks clk]
set_clock_uncertainty 0.05  [get_clocks clk]
set_clock_transition -max -rise 0.05 [get_clocks clk]
set_clock_transition -max -fall 0.05 [get_clocks clk]
set_clock_transition -min -rise 0.05 [get_clocks clk]
set_clock_transition -min -fall 0.05 [get_clocks clk]
set_min_delay 0.2  -from [list [get_ports clk] [get_ports rst] [get_ports {word_in[31]}]         \
[get_ports {word_in[30]}] [get_ports {word_in[29]}] [get_ports {word_in[28]}]  \
[get_ports {word_in[27]}] [get_ports {word_in[26]}] [get_ports {word_in[25]}]  \
[get_ports {word_in[24]}] [get_ports {word_in[23]}] [get_ports {word_in[22]}]  \
[get_ports {word_in[21]}] [get_ports {word_in[20]}] [get_ports {word_in[19]}]  \
[get_ports {word_in[18]}] [get_ports {word_in[17]}] [get_ports {word_in[16]}]  \
[get_ports {word_in[15]}] [get_ports {word_in[14]}] [get_ports {word_in[13]}]  \
[get_ports {word_in[12]}] [get_ports {word_in[11]}] [get_ports {word_in[10]}]  \
[get_ports {word_in[9]}] [get_ports {word_in[8]}] [get_ports {word_in[7]}]     \
[get_ports {word_in[6]}] [get_ports {word_in[5]}] [get_ports {word_in[4]}]     \
[get_ports {word_in[3]}] [get_ports {word_in[2]}] [get_ports {word_in[1]}]     \
[get_ports {word_in[0]}]]  -to [list [get_ports {count_out[5]}] [get_ports {count_out[4]}] [get_ports    \
{count_out[3]}] [get_ports {count_out[2]}] [get_ports {count_out[1]}]          \
[get_ports {count_out[0]}]]
set_input_delay -clock clk  0  [get_ports clk]
set_input_delay -clock clk  0.25  [get_ports rst]
set_input_delay -clock clk  0.25  [get_ports {word_in[31]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[30]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[29]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[28]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[27]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[26]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[25]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[24]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[23]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[22]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[21]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[20]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[19]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[18]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[17]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[16]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[15]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[14]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[13]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[12]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[11]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[10]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[9]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[8]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[7]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[6]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[5]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[4]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[3]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[2]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[1]}]
set_input_delay -clock clk  0.25  [get_ports {word_in[0]}]
set_output_delay -clock clk  0.15  [get_ports {count_out[5]}]
set_output_delay -clock clk  0.15  [get_ports {count_out[4]}]
set_output_delay -clock clk  0.15  [get_ports {count_out[3]}]
set_output_delay -clock clk  0.15  [get_ports {count_out[2]}]
set_output_delay -clock clk  0.15  [get_ports {count_out[1]}]
set_output_delay -clock clk  0.15  [get_ports {count_out[0]}]
