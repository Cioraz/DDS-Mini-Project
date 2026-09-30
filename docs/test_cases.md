# Test Cases and Expected Results

The following cases are used to verify the enhanced controller.

| Case | Body | Optimum | Room | Tolerance | Difference | Mode | Final Room |
|---|---:|---:|---:|---:|---:|---|---:|
| Normal Heating | 34 | 36 | 21 | 1 | 2 | HEAT | 23 |
| Normal Cooling | 39 | 36 | 21 | 1 | 3 | COOL | 18 |
| Comfort | 37 | 36 | 21 | 1 | 1 | COMFORT | 21 |
| Heating Boundary | 26 | 36 | 45 | 1 | 10 | HEAT | 50 |
| Cooling Boundary | 46 | 36 | 5 | 1 | 10 | COOL | 0 |

## Case 1 — Normal Heating

```text
Body Temperature = 34
Optimum = 36
Room = 21
Tolerance = 1
```

Difference:

`|34 - 36| = 2`

Since `2 > 1` and body temperature is below optimum, heating is activated.

Expected room temperature:

`21 + 2 = 23`

## Case 2 — Normal Cooling

```text
Body Temperature = 39
Optimum = 36
Room = 21
Tolerance = 1
```

Difference:

`|39 - 36| = 3`

Since `3 > 1` and body temperature is above optimum, cooling is activated.

Expected room temperature:

`21 - 3 = 18`

## Case 3 — Comfort

```text
Body Temperature = 37
Optimum = 36
Room = 21
Tolerance = 1
```

Difference:

`|37 - 36| = 1`

Since `1 <= 1`, no room-temperature modification is required.

Expected room temperature:

`21`

## Case 4 — Heating Boundary

```text
Body Temperature = 26
Optimum = 36
Room = 45
Tolerance = 1
```

Difference:

`|26 - 36| = 10`

Normal heating would produce:

`45 + 10 = 55`

Because the maximum allowed room temperature is 50, the output is limited to:

`50`

## Case 5 — Cooling Boundary

```text
Body Temperature = 46
Optimum = 36
Room = 5
Tolerance = 1
```

Difference:

`|46 - 36| = 10`

Normal cooling would produce:

`5 - 10 = -5`

Because the minimum allowed room temperature is 0, the output is limited to:

`0`
