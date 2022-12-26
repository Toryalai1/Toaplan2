derive_pll_clocks
derive_clock_uncertainty

create_generated_clock -name SDRAM_CLK -source \
    [get_pins {emu|pll|raizingpll_inst|altera_pll_i|general[5].gpll~PLL_OUTPUT_COUNTER|divclk}] \
    -divide_by 1 \
    [get_ports SDRAM_CLK]

set_false_path -from {ascal:ascal|o_hcpt[3]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[3]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[3]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[3]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[3]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[3]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[3]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[3]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[2]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[2]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[2]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[2]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[2]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[2]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[2]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[2]} -to {ascal:ascal|o_vcpt[0]}

set_false_path -from {ascal:ascal|o_hcpt[5]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[5]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[5]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[5]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[5]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[5]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[5]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[5]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {ascal:ascal|o_hcpt[5]} -to {ascal:ascal|o_vcpt[0]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[15]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[15]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[15]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[15]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[15]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[15]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[15]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[15]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[15]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[9]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[9]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[9]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[9]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[9]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[9]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[9]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[9]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[9]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[11]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[11]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[11]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[11]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[11]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[11]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[11]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[11]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[11]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[17]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[17]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[17]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[17]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[17]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[17]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[17]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[17]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[17]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[19]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[19]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[19]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[19]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[19]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[19]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[19]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[19]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[19]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[21]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[21]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[21]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[21]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[21]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[21]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[21]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[21]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[21]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[13]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[13]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[13]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[13]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[13]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[13]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[13]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[13]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[13]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[10]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[10]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[10]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[10]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[10]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[10]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[10]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[10]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[10]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[20]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[20]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[20]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[20]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[20]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[20]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[20]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[20]}; set_false_path -from {osd:hdmi_osd|GEOMETRY.h_cnt[2]} -to {osd:hdmi_osd|GEOMETRY.osd_hcnt[20]}

set_multicycle_path -from [get_clocks {SDRAM_CLK}] -to [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[4].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup -end 2

set_multicycle_path -from [get_clocks {SDRAM_CLK}] -to [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[4].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold -end 2

# Multicycle paths for setup time

set_multicycle_path -setup -end -from [get_keepers {SDRAM_DQ[*]}] -to [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_sdram_bank:u_sdram|jtframe_sdram_bank_core:u_core|dq_ff[*]}] 2
#set_multicycle_path -setup -end -from [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_sdram_bank:u_sdram|jtframe_sdram_bank_core:u_core|hold_bus}] -to [get_keepers {SDRAM_DQ[*]}] 2
set_multicycle_path -setup -end -from [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_sdram_bank:u_sdram|jtframe_sdram_bank_core:u_core|dq_ff[*]}] -to [get_keepers {SDRAM_DQ[*]}] 2
set_multicycle_path -setup -end -from [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_sdram_bank:u_sdram|jtframe_sdram_bank_core:u_core|SDRAM_DQMH}] -to [get_keepers {SDRAM_DQMH}] 2
set_multicycle_path -setup -end -from [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_sdram_bank:u_sdram|jtframe_sdram_bank_core:u_core|SDRAM_A[12]}] -to [get_keepers {SDRAM_DQMH}] 2

# Multicycle paths for hold time

set_multicycle_path -hold -end -from [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_sdram_bank:u_sdram|jtframe_sdram_bank_core:u_core|dq_ff[*]}] -to [get_keepers {SDRAM_DQ[*]}] 2
# set_multicycle_path -hold -end -from [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_sdram_bank:u_sdram|jtframe_sdram_bank_core:u_core|hold_bus}] -to [get_keepers {SDRAM_DQ[*]}] 2
set_multicycle_path -hold -end -from [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_sdram_bank:u_sdram|jtframe_sdram_bank_core:u_core|SDRAM_DQMH}] -to [get_keepers {SDRAM_DQMH}] 2
set_multicycle_path -hold -end -from [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_sdram_bank:u_sdram|jtframe_sdram_bank_core:u_core|SDRAM_A[12]}] -to [get_keepers {SDRAM_DQMH}] 2

#raizing obj
set_multicycle_path -from {*|raizing_video:u_video|raizing_gcu:u_gcu|jtframe_dual_ram:u_spriteram2|jtframe_dual_ram_cen:u_ram|altsyncram:mem_rtl_0|altsyncram_tsi1:auto_generated|ram_block1a9~PORT_B_WRITE_ENABLE_REG} -to {emu:emu|snowbro2_game:u_game|raizing_video:u_video|raizing_obj:u_obj|sprite_queue_priority_n[121]} -setup -end 2
set_multicycle_path -from {*|raizing_video:u_video|raizing_gcu:u_gcu|jtframe_dual_ram:u_spriteram2|jtframe_dual_ram_cen:u_ram|altsyncram:mem_rtl_0|altsyncram_tsi1:auto_generated|ram_block1a9~PORT_B_WRITE_ENABLE_REG} -to {emu:emu|snowbro2_game:u_game|raizing_video:u_video|raizing_obj:u_obj|sprite_queue_priority_n[121]} -hold -end 2
set_multicycle_path -from [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[4].gpll~PLL_OUTPUT_COUNTER|divclk*}] -to [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[4].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup -end 2
set_multicycle_path -from [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[4].gpll~PLL_OUTPUT_COUNTER|divclk*}] -to [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[4].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold -end 2

# Specify root clocks
create_clock -period "50.0 MHz" [get_ports FPGA_CLK1_50]
create_clock -period "50.0 MHz" [get_ports FPGA_CLK2_50]
create_clock -period "50.0 MHz" [get_ports FPGA_CLK3_50]
create_clock -period "100.0 MHz" [get_pins -compatibility_mode *|h2f_user0_clk]
create_clock -period "100.0 MHz" [get_pins -compatibility_mode spi|sclk_out] -name spi_sck
create_clock -period "10.0 MHz"  [get_pins -compatibility_mode hdmi_i2c|out_clk] -name hdmi_sck

derive_pll_clocks
derive_clock_uncertainty

# Decouple different clock groups (to simplify routing)
set_clock_groups -exclusive \
   -group [get_clocks { *|pll|pll_inst|altera_pll_i|*[*].*|divclk}] \
   -group [get_clocks { *|pll|raizingpll_inst|altera_pll_i|*[*].*|divclk}] \
   -group [get_clocks { pll_hdmi|pll_hdmi_inst|altera_pll_i|*[0].*|divclk}] \
   -group [get_clocks { pll_audio|pll_audio_inst|altera_pll_i|*[0].*|divclk}] \
   -group [get_clocks { spi_sck}] \
   -group [get_clocks { hdmi_sck}] \
   -group [get_clocks { *|h2f_user0_clk}] \
   -group [get_clocks { FPGA_CLK1_50 }] \
   -group [get_clocks { FPGA_CLK2_50 }] \
   -group [get_clocks { FPGA_CLK3_50 }]

set_false_path -from [get_ports {KEY*}]
set_false_path -from [get_ports {BTN_*}]
set_false_path -to [get_ports {LED_*}]
set_false_path -to [get_ports {VGA_*}]
set_false_path -to [get_ports {AUDIO_SPDIF}]
set_false_path -to [get_ports {AUDIO_L}]
set_false_path -to [get_ports {AUDIO_R}]
set_false_path -to {cfg[*]}
set_false_path -from {cfg[*]}
set_false_path -from {VSET[*]}
set_false_path -to {wcalc[*] hcalc[*]}
set_false_path -to {hdmi_width[*] hdmi_height[*]}

set_multicycle_path -to {*_osd|osd_vcnt*} -setup 2
set_multicycle_path -to {*_osd|osd_vcnt*} -hold 1

set_false_path -to {*_osd|v_cnt*}
set_false_path -to {*_osd|v_osd_start*}
set_false_path -to {*_osd|v_info_start*}
set_false_path -to {*_osd|h_osd_start*}
set_false_path -from {*_osd|v_osd_start*}
set_false_path -from {*_osd|v_info_start*}
set_false_path -from {*_osd|h_osd_start*}
set_false_path -from {*_osd|rot*}
set_false_path -from {*_osd|dsp_width*}
set_false_path -to {*_osd|half}

set_false_path -to   {WIDTH[*] HFP[*] HS[*] HBP[*] HEIGHT[*] VFP[*] VS[*] VBP[*]}
set_false_path -from {WIDTH[*] HFP[*] HS[*] HBP[*] HEIGHT[*] VFP[*] VS[*] VBP[*]}
set_false_path -to   {FB_BASE[*] FB_BASE[*] FB_WIDTH[*] FB_HEIGHT[*] LFB_HMIN[*] LFB_HMAX[*] LFB_VMIN[*] LFB_VMAX[*]}
set_false_path -from {FB_BASE[*] FB_BASE[*] FB_WIDTH[*] FB_HEIGHT[*] LFB_HMIN[*] LFB_HMAX[*] LFB_VMIN[*] LFB_VMAX[*]}
set_false_path -to   {vol_att[*] scaler_flt[*] led_overtake[*] led_state[*]}
set_false_path -from {vol_att[*] scaler_flt[*] led_overtake[*] led_state[*]}
set_false_path -from {aflt_* acx* acy* areset* arc*}
set_false_path -from {arx* ary*}
set_false_path -from {vs_line*}

set_false_path -from {ascal|o_ihsize*}
set_false_path -from {ascal|o_ivsize*}
set_false_path -from {ascal|o_format*}
set_false_path -from {ascal|o_hdown}
set_false_path -from {ascal|o_vdown}
set_false_path -from {ascal|o_hmin* ascal|o_hmax* ascal|o_vmin* ascal|o_vmax*}
set_false_path -from {ascal|o_hdisp* ascal|o_vdisp*}
set_false_path -from {ascal|o_htotal* ascal|o_vtotal*}
set_false_path -from {ascal|o_hsstart* ascal|o_vsstart* ascal|o_hsend* ascal|o_vsend*}
set_false_path -from {ascal|o_hsize* ascal|o_vsize*}

set_false_path -from {mcp23009|sd_cd}

# JTFRAME
set_false_path -from {*u_dip|enable_psg*}
set_false_path -from {*u_dip|enable_fm*}
set_false_path -to [get_keepers {audio_out:audio_out|cl1[*]}]
set_false_path -to [get_keepers {audio_out:audio_out|cr1[*]}]

# Reset synchronization signal
set_false_path -from [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_reset:u_reset|rst_rom[0]}] -to [get_keepers {emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_reset:u_reset|rst_rom_sync}]
set_false_path -to emu:emu|sRESET[0]
set_false_path -to emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_reset:u_reset|rst_req_sync[0]
# static signals
set_false_path -from FB_EN
set_false_path -to deb_osd[0]
set_false_path -from emu:emu|jtframe_mister:u_frame|jtframe_board:u_board|jtframe_led:u_led|led

set_false_path  -from  [get_clocks {pll_audio|pll_audio_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]
set_false_path  -from  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {pll_audio|pll_audio_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]
set_false_path  -from  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {sysmem|fpga_interfaces|clocks_resets|h2f_user0_clk}]
set_false_path  -from  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {FPGA_CLK1_50}]
set_false_path  -from  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {pll_hdmi|pll_hdmi_inst|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk}]
set_false_path  -from  [get_clocks {pll_audio|pll_audio_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]
set_false_path  -from  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {pll_audio|pll_audio_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]
set_false_path  -from  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {sysmem|fpga_interfaces|clocks_resets|h2f_user0_clk}]
set_false_path  -from  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {FPGA_CLK1_50}]
set_false_path  -from  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {pll_hdmi|pll_hdmi_inst|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk}]
set_false_path  -from  [get_clocks {sysmem|fpga_interfaces|clocks_resets|h2f_user0_clk}]  -to  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]
set_false_path  -from  [get_clocks {FPGA_CLK2_50}]  -to  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]
set_false_path  -from  [get_clocks {pll_hdmi|pll_hdmi_inst|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk}]  -to  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]
set_false_path  -from  [get_clocks {FPGA_CLK1_50}]  -to  [get_clocks {emu|pll|raizingpll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]