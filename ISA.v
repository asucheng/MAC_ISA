
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2021 01:02:05 PM
// Design Name: 
// Module Name: ISA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ISA(
    Clk,
    Inputs,
    en,
    rst,
//    increment,
//    load,
    skip,
    Control_out
    );
    
    parameter bit_depth  = 32;
    parameter log_port_depth  = 8;
    
    input Clk;
    input rst;
//    input increment;
//    input load;
    input skip;
    input [(bit_depth-1):0] Inputs;
    input en;
    output [(8-1):0] Control_out;
    
    wire [(bit_depth-1):0] reg_out;
    wire [(log_port_depth-1):0] decode_out;
    wire [(log_port_depth-1):0] counter_out;
    wire skip_NAND;
    wire skip_OR;
    wire rst_OR;
    wire [(8-1):0] rom_out;
    
    //`include "RegisterMN.v"
    regmn reg1(.clk_n(Clk), .rst(rst), .inputs(Inputs), .outputs(reg_out[(bit_depth-1):0]));
    
    //`include "decoder.v"
    decoder decode1(.sel(reg_out[(bit_depth-1):(bit_depth-3)]), .dout(decode_out[(log_port_depth-1):0]));
    
    //`include "presettable_counter.v"
    counter counter1(.clk(Clk), .rst(rst_OR), .increment(rom_out[0]), .load(skip_NAND), .preset_val(decode_out[(log_port_depth-1):0]), .count_out(counter_out[(log_port_depth-1):0]));
//    counter counter1(.clk(Clk), .rst(rst), .increment(increment), .load(load), .preset_val(decode_out[(log_port_depth-1):0]), .count_out(counter_out[(log_port_depth-1):0]));
    
    //`include "Microtable.v"
    Microtable rom1(.address(counter_out[4:0]), .read_en(en), .data(rom_out));
    
    assign Control_out = rom_out;
    assign skip_NAND = ~(rom_out[2] & skip);
    assign skip_OR = rom_out[3] | skip;
    assign rst_OR = rst | skip_OR;
    
endmodule
