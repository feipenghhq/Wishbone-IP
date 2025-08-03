// -------------------------------------------------------------------
// Copyright 2025 by Heqing Huang (feipenghhq@gamil.com)
// -------------------------------------------------------------------
//
// Project: Wishbone IP
// Author: Heqing Huang
// Date Created: 08/01/2025
//
// -------------------------------------------------------------------
// Wishbone B4 interface template.
// -------------------------------------------------------------------

module wbintf #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter TAG_WIDTH  = 8,   // (Place Holder)
    parameter BYTE_WIDTH = 8,
    parameter NUM_BYTES  = DATA_WIDTH / BYTE_WIDTH
) (

// clk and reset
input  logic                    wb_clk_i,
input  logic                    wb_rst_i,

// Common signals
input  logic [DATA_WIDTH-1:0]   wb_dat_i,
output logic [DATA_WIDTH-1:0]   wb_dat_o,

input  logic [TAG_WIDTH-1:0]    wb_tgd_i,       // [optional]
output logic [TAG_WIDTH-1:0]    wb_tgd_o,       // [optional]

// Host signals
output logic                    wb_cyc_o,
output logic                    wb_stb_o,
output logic                    wb_we_o,
output logic [ADDR_WIDTH-1:0]   wb_adr_o,
input  logic                    wb_ack_i,
input  logic                    wb_stall_i,

output logic [NUM_BYTES-1:0]    wb_sel_o,       // [optional]
output logic                    wb_lock_o,      // [optional]
output logic [TAG_WIDTH-1:0]    wb_tga_o,       // [optional]
output logic [TAG_WIDTH-1:0]    wb_tgc_o,       // [optional]
input  logic                    wb_err_i,       // [optional]
input  logic                    wb_try_i,       // [optional]

// Device signals
input  logic                    wb_cyc_i,
input  logic                    wb_stb_i,
input  logic                    wb_we_i,
input  logic [ADDR_WIDTH-1:0]   wb_adr_i,
output logic                    wb_ack_o,
output logic                    wb_stall_o,

input  logic [NUM_BYTES-1:0]    wb_sel_i,       // [optional]
input  logic                    wb_lock_i,      // [optional]
input  logic [TAG_WIDTH-1:0]    wb_tga_i,       // [optional]
input  logic [TAG_WIDTH-1:0]    wb_tgc_i,       // [optional]
output logic                    wb_err_o,       // [optional]
output logic                    wb_try_o        // [optional]
);

endmodule
