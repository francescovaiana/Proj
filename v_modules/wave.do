onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_my_noc/DUT/rst
add wave -noupdate /tb_my_noc/DUT/in
add wave -noupdate /tb_my_noc/DUT/out
add wave -noupdate /tb_my_noc/DUT/stall
add wave -noupdate /tb_my_noc/DUT/in_mat
add wave -noupdate /tb_my_noc/DUT/out_mat
add wave -noupdate /tb_my_noc/DUT/clk
add wave -noupdate -expand -subitemconfig {{/tb_my_noc/DUT/enh_mux_mat[3]} -expand {/tb_my_noc/DUT/enh_mux_mat[2]} -expand {/tb_my_noc/DUT/enh_mux_mat[1]} -expand {/tb_my_noc/DUT/enh_mux_mat[0]} -expand} /tb_my_noc/DUT/enh_mux_mat
add wave -noupdate /tb_my_noc/DUT/enh_mux_busy
add wave -noupdate -divider dist_arb_3
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/clk_r}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/clk_w}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/rst}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/busy}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/in_1}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/in_2}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/out}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/full_1}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/full_2}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo1_in}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2_in}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo1_out}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2_out}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/curr_state}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/next_state}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo1_rd}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2_rd}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo1_empty}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo1_full}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2_empty}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2_full}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/curr_out}
add wave -noupdate -divider fifo2
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/clk_w}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/clk_r}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/rst}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/consume}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/load}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/empty}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/full}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/data_in}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/data_out}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/empty_v}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/full_v}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/data_out_v}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/load_addr}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/consume_addr}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/next_load_addr}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/next_consume_addr}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/n_residual}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/next_n_residual}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/already_read}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/next_already_read}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/wr_en}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/curr_state}
add wave -noupdate {/tb_my_noc/DUT/genblk3[3]/genblk1[0]/genblk1/dist_arbiter/fifo2/next_state}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {130 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 573
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
WaveRestoreZoom {43 ns} {373 ns}
