`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2023 07:03:43 AM
// Design Name: 
// Module Name: counter
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


module counter
   #(parameter N = 3)
    (
     input logic clk,rst,
     input logic sensor_a,sensor_b,
     output logic [N-1:0] Pcount,
     output logic full,empty
    );
    
    always_ff @(posedge clk, negedge rst)
    if (~rst)
    Pcount <= 0;
    else if (sensor_a & sensor_b)
    Pcount <= Pcount;
    else if (sensor_a & ~(Pcount == {N{1'b1}}))
    Pcount <= Pcount+1;
    else if (sensor_b && Pcount)
    Pcount <= Pcount-1;
    else
    Pcount <= Pcount;
    
    assign full = (Pcount == {N{1'b1}})? 1'b1 : 1'b0;
    assign empty = (Pcount == {N{1'b0}})? 1'b1 : 1'b0;
    
    
endmodule
