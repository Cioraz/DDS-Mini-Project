module digital_temperature_controller(
    input [7:0] body_temp,
    input [7:0] target_body_temp,
    input [7:0] room_temp,
    input [7:0] tolerance,

    output heat,
    output cool,
    output comfort,

    output [7:0] temperature_difference,
    output [7:0] final_room_temp
);

temperature_controller controller(
    body_temp,
    target_body_temp,
    tolerance,
    heat,
    cool,
    comfort,
    temperature_difference
);

room_controller room(
    room_temp,
    temperature_difference,
    heat,
    cool,
    final_room_temp
);

endmodule