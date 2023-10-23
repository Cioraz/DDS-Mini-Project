module magComp_tb;

 // Inputs
reg [7:0] In1, In2,In3;

 // Outputs
wire Gt;
wire [7:0] greaterval;
wire [7:0] tempDifference;
wire [7:0] finalRoom;

 // Instantiate the Unit Under Test (UUT)
magComp uut (
  .In1(In1), 
  .In2(In2), 
  .Gt(Gt),
  .In3(In3),
  .greaterval(greaterval),
  .tempDifference(tempDifference),
  .finalRoom(finalRoom)
);

initial begin
  // Initialize Inputs
  In1 = 8'd0;
  In2 = 8'd36;
  In3 = 8'd21;
  // Wait 100 ns for global reset to finish
  #100; 

  // Add stimulus here
  // In1 = 8'd8;
  // In2 = 8'd7;
  
  $display("| Input Body Temperature | Optimum Body Temperature | Final Room Temperature |");
  $display("|----------------------------------------------------------------------------|");

  #20;
  In1 = 8'd34;
  
  $monitor("|         %d            |           %d            |         %d            |",In1,In2,finalRoom);

  #20;
  In1 = 8'd40;

  $monitor("|         %d            |           %d            |         %d            |",In1,In2,finalRoom);

  #20;
  In1 = 8'd39;

  $monitor("|         %d            |           %d            |         %d            |",In1,In2,finalRoom);

  #20;
  In1 = 8'd38;

  $monitor("|         %d            |           %d            |         %d            |",In1,In2,finalRoom);

  #20;
  In1 = 8'd37;

  $monitor("|         %d            |           %d            |         %d            |",In1,In2,finalRoom);

  #20;
  In1 = 8'd35;

  $monitor("|         %d            |           %d            |         %d            |",In1,In2,finalRoom);

  #20;
  In1 = 8'd34;

  $monitor("|         %d            |           %d            |         %d            |",In1,In2,finalRoom);

  // #20;
  // In1 =  8'd0;
  // In2 = -8'd5;

  // #20;
  // In1 = -8'd5;
  // In2 = -8'd5;

  #20;
end

endmodule
