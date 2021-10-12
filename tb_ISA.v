
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 03:17:58 PM
// Design Name: 
// Module Name: tb_ISA
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


module tb_ISA;
    reg Clk, en, rst;
    reg [31:0] Inputs;
    wire [7:0] Control_out;

    ISA inst(
        .Clk(Clk), 
        .Inputs(Inputs), 
        .en(en),
        .rst(rst),
        .Control_out(Control_out)
    );
        
    initial
        begin 
            Clk = 1;
            en = 0;
            rst = 1;
            Inputs = 32'h00000000;
            #100;
            
            en = 1;
            rst = 1;
            Inputs = 32'h00000000;
            #100;
            
            en = 1;
            rst = 0;
            Inputs = 32'h00000000;
            #100;
            
            en = 1;
            rst = 0;
            Inputs = 32'h2913bc53;
            #100;
            
            en = 1;
            rst = 0;
            Inputs = 32'h6a3d45f1;
            #400;
            
        end
        
    always
        #50 Clk = !Clk;

endmodule
