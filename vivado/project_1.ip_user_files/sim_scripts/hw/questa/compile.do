vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_20
vlib questa_lib/msim/processing_system7_vip_v1_0_22
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/lib_cdc_v1_0_3
vlib questa_lib/msim/interrupt_control_v3_1_5
vlib questa_lib/msim/axi_gpio_v2_0_36
vlib questa_lib/msim/xlconstant_v1_1_9
vlib questa_lib/msim/proc_sys_reset_v5_0_16
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_register_slice_v2_1_34

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_20 questa_lib/msim/axi_vip_v1_1_20
vmap processing_system7_vip_v1_0_22 questa_lib/msim/processing_system7_vip_v1_0_22
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_3 questa_lib/msim/lib_cdc_v1_0_3
vmap interrupt_control_v3_1_5 questa_lib/msim/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_36 questa_lib/msim/axi_gpio_v2_0_36
vmap xlconstant_v1_1_9 questa_lib/msim/xlconstant_v1_1_9
vmap proc_sys_reset_v5_0_16 questa_lib/msim/proc_sys_reset_v5_0_16
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_34 questa_lib/msim/axi_register_slice_v2_1_34

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"/home/ja/vivado/Vivado/2024.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/ja/vivado/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"/home/ja/vivado/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93  \
"/home/ja/vivado/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_20 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/0f82/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_22 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_processing_system7_0_0/sim/hw_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93  \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_3 -64 -93  \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/2a4f/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -64 -93  \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_36 -64 -93  \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/7a36/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/hw/ip/hw_axi_gpio_0_0/sim/hw_axi_gpio_0_0.vhd" \
"../../../bd/hw/ip/hw_axi_gpio_1_0/sim/hw_axi_gpio_1_0.vhd" \

vlog -work xlconstant_v1_1_9 -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_0/sim/bd_bf64_one_0.v" \

vcom -work proc_sys_reset_v5_0_16 -64 -93  \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/0831/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_1/sim/bd_bf64_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/3718/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_2/sim/bd_bf64_arinsw_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_3/sim/bd_bf64_rinsw_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_4/sim/bd_bf64_awinsw_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_5/sim/bd_bf64_winsw_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_6/sim/bd_bf64_binsw_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_7/sim/bd_bf64_aroutsw_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_8/sim/bd_bf64_routsw_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_9/sim/bd_bf64_awoutsw_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_10/sim/bd_bf64_woutsw_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_11/sim/bd_bf64_boutsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_12/sim/bd_bf64_arni_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_13/sim/bd_bf64_rni_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_14/sim/bd_bf64_awni_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_15/sim/bd_bf64_wni_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_16/sim/bd_bf64_bni_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/f49a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_17/sim/bd_bf64_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/2da8/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_18/sim/bd_bf64_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/63ed/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_19/sim/bd_bf64_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/cef3/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_20/sim/bd_bf64_s00a2s_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_21/sim/bd_bf64_sarn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_22/sim/bd_bf64_srn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_23/sim/bd_bf64_sawn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_24/sim/bd_bf64_swn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_25/sim/bd_bf64_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/7f4f/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_26/sim/bd_bf64_m00s2a_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_27/sim/bd_bf64_m00arn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_28/sim/bd_bf64_m00rn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_29/sim/bd_bf64_m00awn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_30/sim/bd_bf64_m00wn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_31/sim/bd_bf64_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/37bc/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_20 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_22 -L xilinx_vip "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_32/sim/bd_bf64_m00e_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_33/sim/bd_bf64_m01s2a_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_34/sim/bd_bf64_m01arn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_35/sim/bd_bf64_m01rn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_36/sim/bd_bf64_m01awn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_37/sim/bd_bf64_m01wn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_38/sim/bd_bf64_m01bn_0.sv" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/ip/ip_39/sim/bd_bf64_m01e_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/bd_0/sim/bd_bf64.v" \

vlog -work axi_register_slice_v2_1_34 -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../project_1.gen/sources_1/bd/hw/ipshared/48f8/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/ip/hw_axi_smc_0/sim/hw_axi_smc_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/hw/ip/hw_rst_ps7_0_100M_0/sim/hw_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/ec67/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/8391/hdl" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/f0b6/hdl/verilog" "+incdir+../../../../project_1.gen/sources_1/bd/hw/ipshared/0127/hdl/verilog" "+incdir+/home/ja/vivado/Vivado/2024.2/data/xilinx_vip/include" \
"../../../bd/hw/sim/hw.v" \

vlog -work xil_defaultlib \
"glbl.v"

