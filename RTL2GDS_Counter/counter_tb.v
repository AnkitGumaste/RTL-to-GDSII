
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ankit Gumaste
// 
// Create Date: 02.07.2023 23:38:41
// Design Name: 
// Module Name: counter_tb
// Project Name: RTL2GDSII
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_tb ;
reg clk,rst;
wire [3:0]q;

counter dut(clk,rst,q);

initial begin
clk=0;
rst=1;
#20; rst=0; 
end

always #5 clk=~clk;

initial
#200 $finish;
endmodule




