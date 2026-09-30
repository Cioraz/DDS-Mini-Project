module room_controller(
    input [7:0] room_temp,
    input [7:0] temperature_difference,

    input heat,
    input cool,

    output reg [7:0] final_room_temp
);

parameter MIN_TEMP = 8'd0;
parameter MAX_TEMP = 8'd50;

always @(*) begin

    final_room_temp = room_temp;

    if (heat) begin
        if (room_temp + temperature_difference > MAX_TEMP)
            final_room_temp = MAX_TEMP;
        else
            final_room_temp = room_temp + temperature_difference;
    end

    else if (cool) begin
        if (temperature_difference > room_temp)
            final_room_temp = MIN_TEMP;
        else
            final_room_temp = room_temp - temperature_difference;
    end

end

endmodule