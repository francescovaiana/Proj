onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_pe/DUT/clk
add wave -noupdate /tb_pe/DUT/rst
add wave -noupdate /tb_pe/DUT/read_data
add wave -noupdate /tb_pe/DUT/read_weigth
add wave -noupdate /tb_pe/DUT/load_n_op
add wave -noupdate /tb_pe/DUT/load_base_addr
add wave -noupdate /tb_pe/DUT/load_bias
add wave -noupdate /tb_pe/DUT/acc_addr_en
add wave -noupdate /tb_pe/DUT/acc_op_en
add wave -noupdate -radix decimal /tb_pe/DUT/init_n_operations
add wave -noupdate /tb_pe/DUT/init_base_addr
add wave -noupdate /tb_pe/DUT/feedback_sel
add wave -noupdate /tb_pe/DUT/bias_in
add wave -noupdate /tb_pe/DUT/output_reuse
add wave -noupdate /tb_pe/DUT/end_conv_layer
add wave -noupdate /tb_pe/DUT/stall_word
add wave -noupdate /tb_pe/DUT/mult_in_data
add wave -noupdate /tb_pe/DUT/mult_in_weigth
add wave -noupdate /tb_pe/DUT/mult_out
add wave -noupdate /tb_pe/DUT/net_in
add wave -noupdate /tb_pe/DUT/net_out
add wave -noupdate /tb_pe/DUT/val_bit_mul
add wave -noupdate -divider ARRAYS
add wave -noupdate -radix decimal -childformat {{{/tb_pe/DUT/mult_in_data_arr[7]} -radix decimal} {{/tb_pe/DUT/mult_in_data_arr[6]} -radix decimal} {{/tb_pe/DUT/mult_in_data_arr[5]} -radix decimal} {{/tb_pe/DUT/mult_in_data_arr[4]} -radix decimal} {{/tb_pe/DUT/mult_in_data_arr[3]} -radix decimal} {{/tb_pe/DUT/mult_in_data_arr[2]} -radix decimal} {{/tb_pe/DUT/mult_in_data_arr[1]} -radix decimal} {{/tb_pe/DUT/mult_in_data_arr[0]} -radix decimal -childformat {{{/tb_pe/DUT/mult_in_data_arr[0][7]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][6]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][5]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][4]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][3]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][2]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][1]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][0]} -radix hexadecimal}}}} -expand -subitemconfig {{/tb_pe/DUT/mult_in_data_arr[7]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_data_arr[6]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_data_arr[5]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_data_arr[4]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_data_arr[3]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_data_arr[2]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_data_arr[1]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_data_arr[0]} {-height 17 -radix decimal -childformat {{{/tb_pe/DUT/mult_in_data_arr[0][7]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][6]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][5]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][4]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][3]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][2]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][1]} -radix hexadecimal} {{/tb_pe/DUT/mult_in_data_arr[0][0]} -radix hexadecimal}}} {/tb_pe/DUT/mult_in_data_arr[0][7]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/mult_in_data_arr[0][6]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/mult_in_data_arr[0][5]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/mult_in_data_arr[0][4]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/mult_in_data_arr[0][3]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/mult_in_data_arr[0][2]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/mult_in_data_arr[0][1]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/mult_in_data_arr[0][0]} {-height 17 -radix hexadecimal}} /tb_pe/DUT/mult_in_data_arr
add wave -noupdate -childformat {{{/tb_pe/DUT/mult_in_weigth_arr[7]} -radix decimal} {{/tb_pe/DUT/mult_in_weigth_arr[6]} -radix decimal} {{/tb_pe/DUT/mult_in_weigth_arr[5]} -radix decimal} {{/tb_pe/DUT/mult_in_weigth_arr[4]} -radix decimal} {{/tb_pe/DUT/mult_in_weigth_arr[3]} -radix decimal} {{/tb_pe/DUT/mult_in_weigth_arr[2]} -radix decimal} {{/tb_pe/DUT/mult_in_weigth_arr[1]} -radix decimal} {{/tb_pe/DUT/mult_in_weigth_arr[0]} -radix decimal}} -expand -subitemconfig {{/tb_pe/DUT/mult_in_weigth_arr[7]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_weigth_arr[6]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_weigth_arr[5]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_weigth_arr[4]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_weigth_arr[3]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_weigth_arr[2]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_weigth_arr[1]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_in_weigth_arr[0]} {-height 17 -radix decimal}} /tb_pe/DUT/mult_in_weigth_arr
add wave -noupdate -childformat {{{/tb_pe/DUT/mult_out_arr[7]} -radix decimal} {{/tb_pe/DUT/mult_out_arr[6]} -radix decimal} {{/tb_pe/DUT/mult_out_arr[5]} -radix decimal} {{/tb_pe/DUT/mult_out_arr[4]} -radix decimal} {{/tb_pe/DUT/mult_out_arr[3]} -radix decimal} {{/tb_pe/DUT/mult_out_arr[2]} -radix decimal} {{/tb_pe/DUT/mult_out_arr[1]} -radix decimal} {{/tb_pe/DUT/mult_out_arr[0]} -radix decimal}} -expand -subitemconfig {{/tb_pe/DUT/mult_out_arr[7]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_out_arr[6]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_out_arr[5]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_out_arr[4]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_out_arr[3]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_out_arr[2]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_out_arr[1]} {-height 17 -radix decimal} {/tb_pe/DUT/mult_out_arr[0]} {-height 17 -radix decimal}} /tb_pe/DUT/mult_out_arr
add wave -noupdate -childformat {{{/tb_pe/DUT/net_in_arr[7]} -radix decimal -childformat {{{/tb_pe/DUT/net_in_arr[7][18]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][17]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][16]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][15]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][14]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][13]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][12]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][11]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][10]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][9]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][8]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][7]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][6]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][5]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][4]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][3]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][2]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][1]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][0]} -radix hexadecimal}}} {{/tb_pe/DUT/net_in_arr[6]} -radix decimal} {{/tb_pe/DUT/net_in_arr[5]} -radix decimal} {{/tb_pe/DUT/net_in_arr[4]} -radix decimal} {{/tb_pe/DUT/net_in_arr[3]} -radix decimal} {{/tb_pe/DUT/net_in_arr[2]} -radix decimal} {{/tb_pe/DUT/net_in_arr[1]} -radix decimal} {{/tb_pe/DUT/net_in_arr[0]} -radix decimal}} -expand -subitemconfig {{/tb_pe/DUT/net_in_arr[7]} {-height 17 -radix decimal -childformat {{{/tb_pe/DUT/net_in_arr[7][18]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][17]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][16]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][15]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][14]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][13]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][12]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][11]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][10]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][9]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][8]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][7]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][6]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][5]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][4]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][3]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][2]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][1]} -radix hexadecimal} {{/tb_pe/DUT/net_in_arr[7][0]} -radix hexadecimal}}} {/tb_pe/DUT/net_in_arr[7][18]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][17]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][16]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][15]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][14]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][13]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][12]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][11]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][10]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][9]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][8]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][7]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][6]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][5]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][4]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][3]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][2]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][1]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[7][0]} {-height 17 -radix hexadecimal} {/tb_pe/DUT/net_in_arr[6]} {-height 17 -radix decimal} {/tb_pe/DUT/net_in_arr[5]} {-height 17 -radix decimal} {/tb_pe/DUT/net_in_arr[4]} {-height 17 -radix decimal} {/tb_pe/DUT/net_in_arr[3]} {-height 17 -radix decimal} {/tb_pe/DUT/net_in_arr[2]} {-height 17 -radix decimal} {/tb_pe/DUT/net_in_arr[1]} {-height 17 -radix decimal} {/tb_pe/DUT/net_in_arr[0]} {-height 17 -radix decimal}} /tb_pe/DUT/net_in_arr
add wave -noupdate -radix decimal -childformat {{{/tb_pe/DUT/net_out_arr[7]} -radix decimal} {{/tb_pe/DUT/net_out_arr[6]} -radix decimal} {{/tb_pe/DUT/net_out_arr[5]} -radix decimal} {{/tb_pe/DUT/net_out_arr[4]} -radix decimal} {{/tb_pe/DUT/net_out_arr[3]} -radix decimal} {{/tb_pe/DUT/net_out_arr[2]} -radix decimal} {{/tb_pe/DUT/net_out_arr[1]} -radix decimal} {{/tb_pe/DUT/net_out_arr[0]} -radix decimal}} -subitemconfig {{/tb_pe/DUT/net_out_arr[7]} {-height 17 -radix decimal} {/tb_pe/DUT/net_out_arr[6]} {-height 17 -radix decimal} {/tb_pe/DUT/net_out_arr[5]} {-height 17 -radix decimal} {/tb_pe/DUT/net_out_arr[4]} {-height 17 -radix decimal} {/tb_pe/DUT/net_out_arr[3]} {-height 17 -radix decimal} {/tb_pe/DUT/net_out_arr[2]} {-height 17 -radix decimal} {/tb_pe/DUT/net_out_arr[1]} {-height 17 -radix decimal} {/tb_pe/DUT/net_out_arr[0]} {-height 17 -radix decimal}} /tb_pe/DUT/net_out_arr
add wave -noupdate -childformat {{{/tb_pe/DUT/acc_in_arr[7]} -radix decimal -childformat {{{/tb_pe/DUT/acc_in_arr[7][15]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][14]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][13]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][12]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][11]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][10]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][9]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][8]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][7]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][6]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][5]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][4]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][3]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][2]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][1]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][0]} -radix decimal}}}} -expand -subitemconfig {{/tb_pe/DUT/acc_in_arr[7]} {-height 17 -radix decimal -childformat {{{/tb_pe/DUT/acc_in_arr[7][15]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][14]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][13]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][12]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][11]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][10]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][9]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][8]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][7]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][6]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][5]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][4]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][3]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][2]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][1]} -radix decimal} {{/tb_pe/DUT/acc_in_arr[7][0]} -radix decimal}}} {/tb_pe/DUT/acc_in_arr[7][15]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][14]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][13]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][12]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][11]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][10]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][9]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][8]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][7]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][6]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][5]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][4]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][3]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][2]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][1]} {-height 17 -radix decimal} {/tb_pe/DUT/acc_in_arr[7][0]} {-height 17 -radix decimal}} /tb_pe/DUT/acc_in_arr
add wave -noupdate /tb_pe/DUT/output_reuse_i
add wave -noupdate /tb_pe/DUT/output_reuse_i_hw
add wave -noupdate /tb_pe/DUT/val_bit_acc
add wave -noupdate -divider ACCUMULATOR
add wave -noupdate {/tb_pe/DUT/genblk4[7]/accumulator_n/clk}
add wave -noupdate {/tb_pe/DUT/genblk4[7]/accumulator_n/rst}
add wave -noupdate {/tb_pe/DUT/genblk4[7]/accumulator_n/init}
add wave -noupdate {/tb_pe/DUT/genblk4[7]/accumulator_n/sign}
add wave -noupdate {/tb_pe/DUT/genblk4[7]/accumulator_n/in}
add wave -noupdate {/tb_pe/DUT/genblk4[7]/accumulator_n/out}
add wave -noupdate {/tb_pe/DUT/genblk4[7]/accumulator_n/mux_in_a}
add wave -noupdate {/tb_pe/DUT/genblk4[7]/accumulator_n/mux_out}
add wave -noupdate -radix decimal {/tb_pe/DUT/genblk4[7]/accumulator_n/reg_out}
add wave -noupdate {/tb_pe/DUT/genblk4[7]/accumulator_n/zero}
add wave -noupdate -divider NOC
add wave -noupdate /tb_pe/DUT/link_network/clk
add wave -noupdate /tb_pe/DUT/link_network/rst
add wave -noupdate /tb_pe/DUT/link_network/in
add wave -noupdate /tb_pe/DUT/link_network/out
add wave -noupdate /tb_pe/DUT/link_network/val_bit
add wave -noupdate /tb_pe/DUT/link_network/stall
add wave -noupdate /tb_pe/DUT/link_network/in_mat
add wave -noupdate /tb_pe/DUT/link_network/out_mat
add wave -noupdate -expand -subitemconfig {{/tb_pe/DUT/link_network/enh_mux_mat[2]} -expand {/tb_pe/DUT/link_network/enh_mux_mat[1]} -expand {/tb_pe/DUT/link_network/enh_mux_mat[0]} -expand} /tb_pe/DUT/link_network/enh_mux_mat
add wave -noupdate /tb_pe/DUT/link_network/enh_demux_mat
add wave -noupdate /tb_pe/DUT/link_network/enh_mux_busy
add wave -noupdate -divider ARB-1
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/clk_r}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/clk_w}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/rst}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/busy}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/in_1}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/in_2}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/out}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/full_1}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/full_2}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1_in}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo2_in}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1_out}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo2_out}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/curr_state}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/next_state}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/previous_state}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1_rd}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo2_rd}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1_rd_reg}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo2_rd_reg}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1_empty}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1_full}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo2_empty}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo2_full}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/read_1}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/read_2}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/curr_out}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/previous_out}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/valid}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/previous_busy}
add wave -noupdate -divider FIFO2
add wave -noupdate -divider FIFO1
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/clk_r}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/clk_w}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/rst}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/consume}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/load}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/empty}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/full}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/data_in}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/data_out}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/empty_v}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/full_v}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/data_out_v}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/load_addr}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/consume_addr}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/next_load_addr}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/next_consume_addr}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/n_residual}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/next_n_residual}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/already_read}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/next_already_read}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/wr_en}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/curr_state}
add wave -noupdate {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/next_state}
add wave -noupdate -expand {/tb_pe/DUT/link_network/genblk3[1]/genblk1[0]/genblk1/dist_arbiter/fifo1/buff}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2162 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 543
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
WaveRestoreZoom {1920 ns} {2701 ns}
