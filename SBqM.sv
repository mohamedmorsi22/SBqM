`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2023 08:05:49 AM
// Design Name: 
// Module Name: SBqM
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


module SBqM
   #(parameter N = 3)
    (
     input logic clk,rst,
     input logic sensor_a,sensor_b,
     input logic [1:0] Tcount,
     output logic [N-1:0] Pcount,
     output logic [4:0] Wtime,
     output logic full,empty
    );
    
    counter #(.N(N)) CB (.clk(clk),
                        .rst(rst),
                        .sensor_a(sensor_a),
                        .sensor_b(sensor_b),
                        .Pcount(Pcount),
                        .full(full),
                        .empty(empty));
                        
                        
    WT_ROM  ROM_inst (.Pcount(Pcount),
                      .Tcount(Tcount),
                      .Wtime(Wtime));  
                      
    
    
    always_comb
    begin
    if (full)
    begin
    $warning ("the queue is full");
    end
    end
    
    always_comb
    begin
    if (empty)
    begin
    $warning ("the queue is empty");
    end
    end
                      
    always_comb 
    begin
    if (Tcount == 0)
    begin
    $warning ("number of tellers can't be 0");
    end
    end                                   
endmodule
