`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 05:08:58 PM
// Design Name: 
// Module Name: Microtable
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


module Microtable(
    address,
    read_en,
    data
    );
    
    parameter bit_depth  = 8;
    parameter log_port_depth  = 5;
    
    input [(log_port_depth-1):0] address;
    input read_en;
    output [(bit_depth-1):0] data;
    
    reg [(bit_depth-1):0] data;
    reg [(bit_depth-1):0] rom [0:(20-1)];
    
    always @(*)
    begin 
        if(read_en)
            data <= rom[address];
    end
    
    initial
        begin
            rom[0] = 8'h81;    //fetch
            rom[1] = 8'h14;    //decode
            rom[2] = 8'h01;    //start of mac
            rom[3] = 8'h11;
            rom[4] = 8'hc4;    //finish of mac iteration
            rom[5] = 8'h00;    
            rom[6] = 8'h00;    
            rom[7] = 8'h00;    
            rom[8] = 8'h88;    //END, go back to fetch
            rom[9] = 8'h00;    
            rom[10] = 8'h00;   
            rom[11] = 8'h00;   
            rom[12] = 8'h00;   
            rom[13] = 8'h00;    
            rom[14] = 8'h00;   
            rom[15] = 8'h00;   
            rom[16] = 8'he1;   //ReLU, other operations 
            rom[17] = 8'ha1;   //ReLU, continue other operations
            rom[18] = 8'hc8;   //PROG, end of instruction
            rom[19] = 8'h00;
        end    
endmodule
