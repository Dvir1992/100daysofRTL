//ALU
//designer: Dvir Hazut
module day4(
  input     logic [7:0]   a_i,  // First 8-bit input vector
  input     logic [7:0]   b_i, // Second 8-bit input vector
  input     logic [2:0]   op_i, // Encoded operation
  output    logic [7:0]   alu_o // ALU output
);
  localparam ADD= 3'b000;
  localparam SUB= 3'b001;
  localparam SLL= 3'b010;
  localparam LSR= 3'b011;
  localparam AND= 3'b100;
  localparam OR=  3'b101;
  localparam XOR= 3'b110;
  localparam EQL= 3'b111;
  always@(a_i,b_i,op_i)begin
  case(op_i)
    	ADD: alu_o=a_i+b_i;
    	SUB: alu_o=a_i-b_i;
    	SLL: alu_o=a_i<<b_i[0+:3];
    	LSR: alu_o=a_i>>b_i[0+:3];
    	AND: alu_o=a_i&b_i;
    	OR:  alu_o=a_i|b_i;
    	XOR: alu_o=a_i^b_i;
    	EQL: alu_o=(a_i==b_i)?1:0;
    
  	endcase
  end
endmodule
