module digital_temperature_controller_tb;

reg [7:0] body_temp;
reg [7:0] target_body_temp;
reg [7:0] room_temp;
reg [7:0] tolerance;

wire heat;
wire cool;
wire comfort;

wire [7:0] temperature_difference;
wire [7:0] final_room_temp;

digital_temperature_controller dut(
    .body_temp(body_temp),
    .target_body_temp(target_body_temp),
    .room_temp(room_temp),
    .tolerance(tolerance),
    .heat(heat),
    .cool(cool),
    .comfort(comfort),
    .temperature_difference(temperature_difference),
    .final_room_temp(final_room_temp)
);

initial begin

    $dumpfile("temperature_controller.vcd");
    $dumpvars(0, digital_temperature_controller_tb);

    $display("==============================================================");
    $display("       DIGITAL TEMPERATURE CONTROLLER - TEST RESULTS");
    $display("==============================================================");

    // Test Case 1
    body_temp = 8'd34;
    target_body_temp = 8'd36;
    room_temp = 8'd21;
    tolerance = 8'd1;

    #10;

    $display("Test 1: Body=34, Target=36, Room=21, Tolerance=1");
    $display("Difference=%d | HEAT=%b | COOL=%b | COMFORT=%b | Final Room=%d",
             temperature_difference, heat, cool, comfort, final_room_temp);

    // Test Case 2
    body_temp = 8'd39;

    #10;

    $display("Test 2: Body=39, Target=36, Room=21, Tolerance=1");
    $display("Difference=%d | HEAT=%b | COOL=%b | COMFORT=%b | Final Room=%d",
             temperature_difference, heat, cool, comfort, final_room_temp);

    // Test Case 3
    body_temp = 8'd37;

    #10;

    $display("Test 3: Body=37, Target=36, Room=21, Tolerance=1");
    $display("Difference=%d | HEAT=%b | COOL=%b | COMFORT=%b | Final Room=%d",
             temperature_difference, heat, cool, comfort, final_room_temp);

    // Test Case 4
    body_temp = 8'd36;

    #10;

    $display("Test 4: Body=36, Target=36, Room=21, Tolerance=1");
    $display("Difference=%d | HEAT=%b | COOL=%b | COMFORT=%b | Final Room=%d",
             temperature_difference, heat, cool, comfort, final_room_temp);

    $display("==============================================================");

    // Test Case 5 - Lower Boundary Protection
    body_temp = 8'd46;
    target_body_temp = 8'd36;
    room_temp = 8'd5;
    tolerance = 8'd1;

    #10;

    $display("Test 5: Boundary Low");
    $display("Body=46, Target=36, Room=5");
    $display("Difference=%d | HEAT=%b | COOL=%b | COMFORT=%b | Final Room=%d",
             temperature_difference, heat, cool, comfort, final_room_temp);

    // Test Case 6 - Upper Boundary Protection
    body_temp = 8'd26;
    target_body_temp = 8'd36;
    room_temp = 8'd45;
    tolerance = 8'd1;

    #10;

    $display("Test 6: Boundary High");
    $display("Body=26, Target=36, Room=45");
    $display("Difference=%d | HEAT=%b | COOL=%b | COMFORT=%b | Final Room=%d",
             temperature_difference, heat, cool, comfort, final_room_temp);

    $finish;

end

endmodule