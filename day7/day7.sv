//linear feedback shift register
//deisgner: Dvir Hazut
module day7(
input     wire      clk,
input     wire      reset,

output    wire[3:0] lfsr_o
);
  
  reg [3:0] sr_q;
  wire [3:0] sr_d;
  
  always@(posedge clk or posedge reset)begin
    if(reset)
      sr_q<=1;
    else
      sr_q<=sr_d;    
  end
  assign sr_d[0]=sr_q[1]^sr_q[3];
  assign sr_d[1+:3]=sr_q[0+:3];
  assign lfsr_o=sr_q;
endmodule
