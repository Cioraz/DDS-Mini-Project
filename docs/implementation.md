# Implementation Details

## 1. Logisim Implementation

The main enhanced Logisim circuit is:

`Logisim/enhanced/temperature_controller_v2.circ`

The original reference circuit is retained separately as:

`Logisim/final1.circ`

The enhanced circuit adds tolerance-based control and room-temperature boundary protection.

### Major blocks

1. **Temperature comparison**
   - Compares body temperature and optimum body temperature.

2. **Absolute difference**
   - Produces the magnitude of the temperature deviation.

3. **Tolerance comparator**
   - Determines whether the deviation is significant enough to modify the room temperature.

4. **Heating/Cooling control**
   - Activates the heater when body temperature is below the optimum.
   - Activates the cooler when body temperature is above the optimum.
   - Activates comfort when the difference is within tolerance.

5. **Room-temperature arithmetic**
   - Adds the difference for heating.
   - Subtracts the difference for cooling.

6. **Boundary protection**
   - Prevents heating results above 50.
   - Prevents cooling results below 0.

7. **Final output**
   - Selects either the unchanged current room temperature or the calculated room temperature depending on the tolerance decision.

## 2. Verilog Implementation

The Verilog implementation is organized into modules:

### `temperature_controller.v`

Responsible for:

- absolute temperature difference
- tolerance comparison
- heat/cool/comfort control

### `room_controller.v`

Responsible for:

- room-temperature adjustment
- 0–50 boundary protection

### `digital_temperature_controller.v`

Top-level module that integrates the temperature and room controllers.

### Testbench

`Verilog/testbench/digital_temperature_controller_tb.v`

The testbench exercises normal heating, normal cooling, comfort, and boundary conditions and generates a VCD waveform.

## 3. Simulation

The generated waveform is stored at:

`Simulation/waveforms/temperature_controller.vcd`

The waveform demonstrates:

- body temperature
- optimum temperature
- room temperature
- tolerance
- temperature difference
- heat
- cool
- comfort
- final room temperature

## 4. Verification

The same functional scenarios are used to verify both the Logisim and Verilog implementations. This provides a cross-check between the hardware-oriented circuit model and the HDL implementation.
