# Repository Structure

```text
DDS-Mini-Project/
|
|-- Logisim/
|   |-- final1.circ
|   `-- enhanced/
|       `-- temperature_controller_v2.circ
|
|-- Simulation/
|   `-- waveforms/
|       `-- temperature_controller.vcd
|
|-- Snapshots/
|   |-- enhanced/
|   |   |-- 01_normal_heating.png
|   |   |-- 02_normal_cooling.png
|   |   |-- 03_comfort.png
|   |   |-- 04_heating_boundary_50.png
|   |   `-- 05_cooling_boundary_0.png
|   |-- BCD_Convertor.png
|   `-- Maincircuit.png
|
|-- Verilog/
|   |-- modules/
|   |   |-- temperature_controller.v
|   |   |-- room_controller.v
|   |   `-- digital_temperature_controller.v
|   |
|   `-- testbench/
|       `-- digital_temperature_controller_tb.v
|
|-- docs/
|   |-- design.md
|   |-- implementation.md
|   |-- test_cases.md
|   `-- repository_structure.md
|
|-- README.md
`-- .gitignore
```

## Notes

- `Logisim/final1.circ` is the retained original/reference circuit.
- `Logisim/enhanced/temperature_controller_v2.circ` is the enhanced circuit.
- `Simulation/waveforms/temperature_controller.vcd` contains Verilog simulation waveform data.
- `Snapshots/enhanced/` contains screenshots of the enhanced implementation and test cases.
- `BCD_Convertor.png` and `Maincircuit.png` may be retained as supporting/reference screenshots if they are relevant to the project documentation.
- Any old Verilog files such as `Final`, `regulator.v`, or `regulator_tb.v` should be treated as legacy/reference material unless they are explicitly used by the final implementation. If they are not needed, they can be removed during final cleanup.
