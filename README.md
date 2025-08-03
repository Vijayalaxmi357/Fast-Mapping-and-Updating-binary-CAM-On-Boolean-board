<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Fast Mapping and Updating BCAM</title>
</head>
<body>
  <h1>Fast Mapping and Updating Binary Content Addressable Memory (BCAM) Project</h1>
  <p>
    This project implements a parameterized BCAM in Verilog for Boolean Board FPGA, supporting
    single-cycle lookups and efficient updates via REG and STR architectures.
  </p>

  <h2>Overview</h2>
  <p>
    Deployed on a Boolean Board with hardware-in-the-loop validation. Metrics such as mapping latency,
    update time, and resource utilization are measured to inform embedded/networking design trade-offs.
  </p>

  <h2>Key Features</h2>
  <ul>
    <li><strong>Configurable Parameters:</strong> Adjustable CAM depth and width.</li>
    <li><strong>Multiple Architectures:</strong> REG for speed; STR for resource efficiency.</li>
    <li><strong>Fast Updates:</strong> Partial/full entry updates with minimal delay.</li>
    <li><strong>FPGA Ready:</strong> Synthesizable Verilog for Boolean Board.</li>
    <li><strong>Verification:</strong> Simulation + On-board testing.</li>
  </ul>

  <h2>Applications</h2>
  <ul>
    <li>High-speed packet classification</li>
    <li>Network intrusion detection</li>
    <li>Embedded address lookups</li>
    <li>Pattern recognition</li>
  </ul>

  <h2>Technologies Used</h2>
  <ul>
    <li><strong>HDL:</strong> Verilog</li>
    <li><strong>Toolchain:</strong> Xilinx Vivado (or compatible)</li>
    <li><strong>Simulation:</strong> ModelSim / Vivado Simulator</li>
    <li><strong>Platform:</strong> Boolean Board FPGA</li>
    <li><strong>Optional:</strong> AXI interface</li>
  </ul>

  <h2>Getting Started</h2>
  <p>Typical build/test flow:</p>
  <ol>
    <li>Install FPGA toolchain (Vivado).</li>
    <li>Synthesize and generate bitstream.</li>
    <li>Run simulations with testbenches.</li>
    <li>Deploy to Boolean Board and measure performance.</li>
  </ol>

  <footer>
    <p>© 2025 Fast Mapping and Updating BCAM Project. Real-time hardware-accelerated pattern matching.</p>
  </footer>
</body>
</html>
