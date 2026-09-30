# Digital Temperature Regulation and Room Climate Controller

A digital temperature regulation system implemented using **Logisim** and **Verilog**. The project compares measured body temperature with a desired optimum temperature, applies a configurable tolerance, determines whether heating, cooling, or no adjustment is required, and regulates the room temperature within a safe range of **0–50°C**.

## Features

- 8-bit digital temperature inputs
- Body-temperature comparison
- Absolute temperature-difference calculation
- Configurable tolerance
- HEAT / COOL / COMFORT control
- Automatic room-temperature adjustment
- Lower room-temperature limit of 0
- Upper room-temperature limit of 50
- Logisim digital circuit implementation
- Verilog HDL implementation
- Verilog testbench
- VCD waveform simulation
- Test cases covering normal and boundary conditions

## Inputs

| Input | Width | Meaning |
|---|---:|---|
| Input Body Temp | 8-bit | Current body temperature |
| Body Optimum Temp | 8-bit | Desired body temperature |
| Current Room Temp | 8-bit | Current room temperature |
| Tolerance | 8-bit | Allowed body-temperature deviation |

## Outputs

| Output | Meaning |
|---|---|
| Temperature Difference | Absolute body-temperature difference |
| Heater | Heating control signal |
| Cooler | Cooling control signal |
| Comfort | Temperature-within-tolerance signal |
| Final Room Temperature | Regulated room temperature |

## Control Logic

```text
Difference = |Body Temperature - Optimum Temperature|

If Difference <= Tolerance:
    COMFORT
    Keep current room temperature

Else if Body Temperature < Optimum:
    HEAT
    Increase room temperature

Else:
    COOL
    Decrease room temperature
```

The resulting room temperature is constrained to:

```text
0 <= Final Room Temperature <= 50
```

## Test Cases

| Case | Body | Optimum | Room | Tolerance | Difference | Mode | Final |
|---|---:|---:|---:|---:|---:|---|---:|
| Normal Heating | 34 | 36 | 21 | 1 | 2 | HEAT | 23 |
| Normal Cooling | 39 | 36 | 21 | 1 | 3 | COOL | 18 |
| Comfort | 37 | 36 | 21 | 1 | 1 | COMFORT | 21 |
| Heating Boundary | 26 | 36 | 45 | 1 | 10 | HEAT | 50 |
| Cooling Boundary | 46 | 36 | 5 | 1 | 10 | COOL | 0 |

## Project Structure

```text
Logisim/
├── final1.circ
└── enhanced/
    └── temperature_controller_v2.circ

Simulation/
└── waveforms/
    └── temperature_controller.vcd

Snapshots/
├── enhanced/
├── BCD_Convertor.png
└── Maincircuit.png

Verilog/
├── modules/
│   ├── temperature_controller.v
│   ├── room_controller.v
│   └── digital_temperature_controller.v
└── testbench/
    └── digital_temperature_controller_tb.v

docs/
├── design.md
├── implementation.md
├── test_cases.md
└── repository_structure.md
```

## Tools

- Logisim
- Verilog HDL
- Icarus Verilog
- GTKWave

## Verification

The Verilog testbench covers normal heating, normal cooling, comfort operation, and both room-temperature boundary conditions. The resulting waveform is stored in `Simulation/waveforms/temperature_controller.vcd`.

## Attribution

This repository evolved from an existing digital temperature-regulation project used as a reference starting point. The enhanced version reorganizes the implementation and adds tolerance-based control, explicit comfort handling, room-temperature boundary protection, modular Verilog implementation, automated simulation, and verification evidence.

The original reference should be credited when the project is presented or redistributed. The enhanced implementation and documentation in this repository should be understood as the subsequent development work rather than as the original upstream design.
