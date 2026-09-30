module temperature_controller(
    input [7:0] body_temp,
    input [7:0] target_body_temp,
    input [7:0] tolerance,

    output reg heat,
    output reg cool,
    output reg comfort,

    output reg [7:0] temperature_difference
);

always @(*) begin

    heat = 1'b0;
    cool = 1'b0;
    comfort = 1'b0;
    temperature_difference = 8'b0;

    if (body_temp > target_body_temp) begin

        temperature_difference = body_temp - target_body_temp;

        if (temperature_difference > tolerance)
            cool = 1'b1;
        else
            comfort = 1'b1;

    end

    else if (body_temp < target_body_temp) begin

        temperature_difference = target_body_temp - body_temp;

        if (temperature_difference > tolerance)
            heat = 1'b1;
        else
            comfort = 1'b1;

    end

    else begin
        comfort = 1'b1;
    end

end

endmodule