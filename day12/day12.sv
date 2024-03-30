//A sequence detector to detect the following sequence: 1110_1101_1011
//designer: Dvir Hazut
module day12(
input     wire        clk,
input     wire        reset,
input     wire        x_i,    // Serial input
output    wire        det_o   // Output asserted when sequence is detected
);
  
  reg [11:0] q;
  wire [11:0] d;
  always @(posedge clk or posedge reset)begin
    if(reset)
      q<=0;
    else
      q<=d;      
  end
  
  assign d={q[10:0],x_i};
  assign det_o=(d==12'b111011011011);
  
  
endmodule
