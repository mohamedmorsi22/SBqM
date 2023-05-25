`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2023 07:25:45 AM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
logic clk,rst;
logic sensor_a,sensor_b;
logic [2:0] count;
logic [1:0] Tcount;
logic [4:0] Wtime;
logic full,empty;

SBqM #(.N(3)) CT (.clk(clk),
                     .rst(rst),
                     .sensor_a(sensor_a),
                     .sensor_b(sensor_b),
                     .Pcount(count),
                     .full(full),.empty(empty),
                     .Tcount(Tcount),
                     .Wtime(Wtime));
                     
                     
                     

localparam T = 20;
integer i;
integer j;
integer TC;

always #(T/2) clk = ~clk;

initial
begin
clk = 1'b0;
rst = 1'b0;
sensor_a = 1'b0;
sensor_b = 1'b0;
Tcount = 2'b00;


@(negedge clk)
rst = 1'b1;

for (j=0 ; j<2 ; j=j+1)
begin
 
 for (i = 0 ; i<8 ; i=i+1)
 begin
  if (i<4)
  TC = i;
  else
  TC = i-4;
  
  @(negedge clk)
  Tcount = TC;
  sensor_b = j;
  sensor_a = ~j;
 end
 end
  
 #(T);
 $stop;

end
endmodule
