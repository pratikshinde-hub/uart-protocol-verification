# UART Protocol Verification System

UART communication verification platform developed using Verilog HDL and ModelSim for validating serial transmission behaviour, baud-rate timing, and FSM-based UART control logic.

The project focuses on RTL design, protocol verification, waveform analysis, and structured simulation-based debugging workflows.

---

## Project Overview

This project was developed to design and verify UART transmitter and receiver modules using FSM-based digital logic.

The system validates serial communication behaviour through simulation-driven verification using ModelSim testbenches and waveform analysis.

---

## UART Architecture

The UART system includes:

- UART Transmitter Module
- UART Receiver Module
- Baud Rate Generator
- FSM-Based Control Logic
- Serial-to-Parallel Conversion
- Start/Stop Bit Verification
- Testbench Validation Environment

---

## Design Features

- FSM-based UART transmitter and receiver
- Configurable baud-rate timing
- Serial data transmission and reception
- Start-bit detection
- Stop-bit verification
- Shift-register-based serial conversion
- Simulation-based functional verification

---

## Verification Workflow

1. Input data provided through testbench
2. UART transmitter serializes parallel data
3. Receiver samples incoming serial stream
4. FSM logic validates framing behaviour
5. Waveforms inspected using ModelSim
6. Timing and protocol correctness verified

---

## Testbench Validation

Simulation scenarios included:

- Standard UART transmission
- Back-to-back frame transmission
- Baud-rate timing verification
- Framing error injection
- Receiver sampling validation
- Start-bit and stop-bit detection testing

---

## Debugging & Verification

### Sampling Window Alignment Issue

Observed incorrect receiver sampling behaviour at higher baud rates.

### Investigation

- Analysed waveform timing in ModelSim
- Inspected FSM counter behaviour
- Verified sampling point relative to serial bit boundaries

### Resolution

- Adjusted mid-bit sampling offset
- Improved receiver timing alignment
- Stabilized serial frame detection across test cases

---

## Waveform Analysis

Waveform validation included:

- Start-bit timing
- Stop-bit verification
- Baud-rate consistency
- Serial frame correctness
- FSM state transitions
- Receiver sampling accuracy

---

## Engineering Tools Used

- Verilog HDL
- ModelSim
- FSM Design Methodology

---

## Repository Structure

```text
uart-protocol-verification/

│── README.md
│── rtl/
│── testbench/
│── waveforms/
│── docs/
│── results/
```

---

## Future Improvements

- UART parity-bit support
- Configurable frame lengths
- Error detection enhancements
- FPGA hardware deployment
- Extended protocol verification scenarios

---

## Author

Pratik D. Shinde  
Embedded Systems & Hardware Engineering Student

GitHub: github.com/pratikshinde-hub
