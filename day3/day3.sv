// Simple edge detector 
// designer: Dvir Hazut

module day3 (

  input    clk,
  input    reset,
  input     wire    a_i,            // Serial input to the module
  output    wire    rising_edge_o,  // Rising edge output
  output    wire    falling_edge_o  // Falling edge output
);
  reg a_i_l;

  always_ff @(posedge clk or posedge reset)
    if (reset)
      a_i_l <= 1'b0;
    else
      a_i_l <= a_i;

  // Rising edge when delayed signal is 0 but current is 1
  assign rising_edge_o = !a_i_l & a_i;

  // Falling edge when delayed signal is 1 but current is 0
  assign falling_edge_o = a_i_l & !a_i;

endmodule
