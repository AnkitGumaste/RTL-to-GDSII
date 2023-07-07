
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ankit Gumaste
// 
// Create Date: 02.07.2023 23:32:27
// Module Name: counter
// Project Name: RTL2GDSII
// 
//////////////////////////////////////////////////////////////////////////////////


module counter(
    input clk,rst,
    output reg [3:0]q
    );
always@(posedge clk , posedge rst)
begin
if(rst)
    q=0;
else
    case(q)
        4'd0: q=4'd8;
        4'd8: q=4'd12;
        4'd12: q=4'd14;
        4'd14: q=4'd15;
        4'd15: q=4'd7;
        4'd7: q=4'd3;
        4'd3: q=4'd1;
        4'd1: q=4'd0;
        default: q=4'd0;
    endcase
end
endmodule
