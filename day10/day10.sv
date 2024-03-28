// Counter with a load
//designer: Dvir Hazut
module day10 (
  input     wire          clk,
  input     wire          reset,
  input     wire          load_i,
  input     wire[3:0]     load_val_i,

  output    wire[3:0]     count_o
);
  reg [3:0] count_q;
  reg [3:0] load_ff;
  wire [3:0] count_next;
  
  always@(posedge clk or posedge reset)begin
    if(reset)
      load_ff<=0;
    else if(load_i)
      load_ff<=load_val_i;            
  end
  
  
  always @(posedge clk or posedge reset)begin
    if(reset)
      count_q<=0;
    else
      count_q<=count_next;
  end
  
  assign count_next= load_i?load_val_i:((count_q==4'b1111)?load_ff:count_q+1);
 assign count_o=count_q;

  

endmodule
