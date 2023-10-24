module magComp ( In1,
   In2,
   Gt,
   In3,
   greaterval,
   tempDifference,
   finalRoom
); 

/*
In1 - Input Body Temperature
In2 - Optimum Body Temperature
In3 - Optimum Room Temperature
All are 8 bit numbers
*/
input [7:0] In1,In2,In3;

//The Outputs of comparison 
output Gt; 

// The greaterVal between In1 and In2 aswell as the finalRoom Temp
output [7:0] greaterval,finalRoom;
output [7:0] tempDifference;
reg [7:0] tempDifference;
reg lightColor;
reg [7:0] finalRoom;
reg Gt; 
reg [7:0] greaterval;

//Check the state of the input lines 
always @ (In1 or In2 or In3) 

// Depending on which is greater, return 1 or 0
begin 
 Gt <= ( In1 > In2 )? 1'b1 : 1'b0; 
end 

always @(In1, In2) begin
    tempDifference = In1>In2? In1-In2 : In2-In1;
end

// Checking the light color either red of green
always @(In1, In2) begin
    lightColor = In1>In2? 1 : 0;
end

// Based on light color to find the finalRoom temperature
always @(lightColor,tempDifference,In3) begin
    if (lightColor)
    finalRoom=In3-tempDifference;
    else
    finalRoom=In3+tempDifference;
end



endmodule
