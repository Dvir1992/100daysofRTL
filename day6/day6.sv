//shift register
//designer: Dvir Hazut
module day6(

input     wire        clk,
input     wire        reset,
input     wire        x_i,  // Serial input

output    wire[3:0]   sr_o  //Shift register output
);
  
  reg [3:0] sr_r;
  wire [3:0] sr_next;
  
  always @(posedge clk or posedge reset) begin
    if(reset)
      sr_r<=0;
    else
      sr_r<=sr_next;
  end
  assign sr_next={sr_r[2:0],x_i};
  assign sr_o=sr_next;
endmodule
