onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_my_noc/DUT/clk
add wave -noupdate /tb_my_noc/DUT/rst
add wave -noupdate /tb_my_noc/DUT/in
add wave -noupdate -expand /tb_my_noc/DUT/out
add wave -noupdate /tb_my_noc/DUT/stall
add wave -noupdate /tb_my_noc/DUT/in_mat
add wave -noupdate -expand /tb_my_noc/DUT/out_mat
add wave -noupdate -expand -subitemconfig {{/tb_my_noc/DUT/enh_mux_mat[3]} -expand {/tb_my_noc/DUT/enh_mux_mat[3][0]} -expand} /tb_my_noc/DUT/enh_mux_mat
add wave -noupdate -expand -subitemconfig {{/tb_my_noc/DUT/enh_demux_mat[1]} -expand {/tb_my_noc/DUT/enh_demux_mat[0]} -expand} /tb_my_noc/DUT/enh_demux_mat
add wave -noupdate /tb_my_noc/DUT/enh_mux_busy
add wave -noupdate -expand /tb_my_noc/DUT/pack_data
add wave -noupdate -expand /tb_my_noc/DUT/pack_addr
add wave -noupdate -divider disp0
add wave -noupdate {/tb_my_noc/DUT/genblk4[0]/genblk1[0]/genblk1/data_dispatcher/i}
add wave -noupdate {/tb_my_noc/DUT/genblk4[0]/genblk1[0]/genblk1/data_dispatcher/sel}
add wave -noupdate {/tb_my_noc/DUT/genblk4[0]/genblk1[0]/genblk1/data_dispatcher/out_a}
add wave -noupdate {/tb_my_noc/DUT/genblk4[0]/genblk1[0]/genblk1/data_dispatcher/out_b}
add wave -noupdate -divider disp1
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[1]/genblk1/data_dispatcher/i}
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[1]/genblk1/data_dispatcher/sel}
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[1]/genblk1/data_dispatcher/out_a}
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[1]/genblk1/data_dispatcher/out_b}
add wave -noupdate -divider disp2
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[2]/genblk1/data_dispatcher/i}
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[2]/genblk1/data_dispatcher/sel}
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[2]/genblk1/data_dispatcher/out_a}
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[2]/genblk1/data_dispatcher/out_b}
add wave -noupdate -divider disp3
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[3]/genblk1/data_dispatcher/i}
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[3]/genblk1/data_dispatcher/sel}
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[3]/genblk1/data_dispatcher/out_a}
add wave -noupdate {/tb_my_noc/DUT/genblk4[2]/genblk1[3]/genblk1/data_dispatcher/out_b}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {200 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 484
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1236 ns}
