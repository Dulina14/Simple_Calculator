# ToyStory Mini Calculator FPGA Implementation

This repository contains the FPGA implementation of a mini calculator designed for children under 5 years old. The calculator performs multiplication of two numbers (each below 10) and displays the result in decimal form using seven-segment displays.

## Project Structure

```
.
├── Section1_Adder/
│   ├── one_bit_adder.sv
│   ├── one_bit_adder_tb.sv
│   ├── eight_bit_adder.sv
│   ├── eight_bit_adder_tb.sv
│   └── simulation_outputs/
├── Section2_Multiplier/
│   ├── four_bit_unsigned_multiplier.sv
│   ├── four_bit_multiplier_tb.sv
│   ├── four_bit_signed_multiplier.sv
│   └── simulation_outputs/
├── Section3_Display/
│   ├── seven_segment_decoder.sv
│   ├── seven_segment_decoder_tb.sv
│   └── simulation_outputs/
├── Section4_Integration/
│   ├── top_module.sv
│   ├── top_module_tb.sv
│   └── simulation_outputs/
├── docs/
│   ├── assignment_requirements.md
│   └── full_adder_truth_table.md
└── README.md
```

## Overview

This project implements a mini calculator for ToyStory (Pvt) Ltd targeted at children under 5 years. The calculator handles multiplication of two numbers (each below 10) and displays the result on seven-segment displays.

## Sections

### Section 1: 8-Bit Adder Design
- Implementation of 1-bit full adder using data flow modeling
- Design of an 8-bit ripple carry adder using the 1-bit full adder modules

### Section 2: 4-Bit Multiplier Design
- Implementation of a 4-bit unsigned multiplier using 8-bit adders
- Implementation of a 4-bit signed multiplier

### Section 3: 7-Segment Display Decoder
- Design of a decoder to convert 4-bit binary inputs to 7-segment display outputs

### Section 4: Integration (Optional)
- Integration of the multiplier and seven-segment decoders into a complete system

## Usage

To simulate these designs:
1. Clone this repository
2. Open the files in your preferred SystemVerilog simulator
3. Run the testbenches to verify functionality

## Simulation Results

<details>
<summary>1-Bit Full Adder Simulation</summary>
<p>
<!-- Insert simulation screenshot here -->
</p>
</details>

<details>
<summary>8-Bit Adder Simulation</summary>
<p>
<!-- Insert simulation screenshot here -->
</p>
</details>

<details>
<summary>4-Bit Multiplier Simulation</summary>
<p>
<!-- Insert simulation screenshot here -->
</p>
</details>

<details>
<summary>7-Segment Decoder Simulation</summary>
<p>
<!-- Insert simulation screenshot here -->
</p>
</details>

## Implementation Details

### 1-Bit Full Adder
- Inputs: A, B, Cin
- Outputs: Sum, Cout
- Implemented using simple logic expressions

### 8-Bit Ripple Carry Adder
- Built using eight instances of the 1-bit full adder
- Handles 8-bit unsigned addition

### 4-Bit Multiplier
- Implements multiplication using shifting and addition
- Uses the 8-bit adder modules from Section 1

### 7-Segment Decoder
- Maps 4-bit binary numbers (0-9) to 7-bit segment outputs
- Designed for common cathode displays

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Acknowledgements

- ToyStory (Pvt) Ltd for the project requirements
- Digital Logic Design course materials
