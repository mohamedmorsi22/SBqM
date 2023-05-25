`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2023 05:24:10 AM
// Design Name: 
// Module Name: WT_ROM
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


module WT_ROM
    (
      input logic [2:0] Pcount,
      input logic [1:0] Tcount,
      output logic [4:0] Wtime
    );
    
    logic [4:0] rom [0:31];
    
    initial
    $readmemb("ROM.mem",rom);
    
    assign Wtime = rom[{Tcount,Pcount}];
endmodule
