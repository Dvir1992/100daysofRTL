// 4-bit parallel to serial converter with valid and empty indications
//designer: Dvir Hazut
module day11(
input     wire      clk,
input     wire      reset,
output    wire      empty_o,    //should be asserted when all of the bits are given out serially
input     wire[3:0] parallel_i, //parallel input vector  
output    wire      serial_o,   //serial bit output
output    wire      valid_o     //serial bit is valid
);

  reg ser_d;
  reg [2:0] counter;
  wire [2:0] counter_next;
  reg [3:0]valid_parallel;
  wire valid;
  

  always @(posedge clk or posedge reset)begin
    if(reset)
      valid_parallel<=0;
    else if(counter==0)
      valid_parallel<=parallel_i;      
  end
  
  always @(posedge clk or posedge reset)begin
    if(reset)
      counter<=0;
    else
      counter<=counter_next;      
  end
  
  always @(valid_parallel or counter) begin
    case(counter)
      3'b001:ser_d<=valid_parallel[0];
      3'b010:ser_d<=valid_parallel[1];
      3'b011:ser_d<=valid_parallel[2];
      3'b100:ser_d<=valid_parallel[3];  
      default:ser_d<=0;
    endcase
  end
  assign counter_next= (counter+1)%5;
  assign serial_o=ser_d;
  assign empty_o=(counter==0);
  assign valid_o=!empty_o;
  
endmodule


