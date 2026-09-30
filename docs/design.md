# Digital Temperature Controller — Design

## 1. Overview

The project implements a digital temperature regulation controller using combinational digital logic. The controller compares a measured body temperature with a desired optimum body temperature and decides whether the room should be heated, cooled, or left unchanged.

The enhanced design introduces a configurable tolerance and safe room-temperature limits.

## 2. Inputs

| Input | Width | Description |
|---|---:|---|
| Input Body Temp | 8-bit | Current measured body temperature |
| Body Optimum Temp | 8-bit | Desired body temperature |
| Current Room Temp | 8-bit | Current room temperature |
| Tolerance | 8-bit | Allowed deviation from the optimum |

## 3. Outputs

| Output | Width | Description |
|---|---:|---|
| Temperature Difference | 8-bit | Absolute difference between body and optimum temperature |
| Heater | 1-bit | Heating control |
| Cooler | 1-bit | Cooling control |
| Comfort | 1-bit | Indicates that the temperature is within tolerance |
| Final Room Temperature | 8-bit | Resulting room temperature |

## 4. Control Logic

The absolute temperature difference is calculated as:

`Temperature Difference = |Input Body Temp - Body Optimum Temp|`

The difference is compared with the tolerance.

- If `Difference <= Tolerance`: Comfort mode.
- If `Difference > Tolerance` and body temperature is below optimum: Heat.
- If `Difference > Tolerance` and body temperature is above optimum: Cool.

## 5. Room Temperature Regulation

For heating:

`Calculated Room Temperature = Current Room Temperature + Temperature Difference`

For cooling:

`Calculated Room Temperature = Current Room Temperature - Temperature Difference`

The enhanced design limits the final room temperature to the safe range:

`0 <= Final Room Temperature <= 50`

Therefore:

- Heating above 50 is limited to 50.
- Cooling below 0 is limited to 0.

## 6. Digital Logic Used

The Logisim implementation uses:

- 8-bit comparators
- Subtractor/addition blocks
- Multiplexers
- NOT gates
- AND gates
- Constants
- Splitters
- BCD conversion/display logic
- LEDs/output indicators

## 7. Overall Data Flow

```text
Body Temperature + Optimum Temperature
                |
                v
       Absolute Difference
                |
                v
       Compare with Tolerance
          /       |       \
       HEAT     COMFORT    COOL
         |         |         |
         +---------+---------+
                   |
          Room Temperature
            Adjustment
                   |
          Boundary Protection
             0 <= T <= 50
                   |
                   v
        Final Room Temperature
```
