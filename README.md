<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Fast Mapping and Updating BCAM on Boolean Board</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  
</head>
<body>
  <div class="container">
    <header class="card">
      <h1>
        Fast Mapping and Updating <br/> <span style="font-weight:600;">Binary Content Addressable Memory (BCAM)</span>
        <span class="badge">Project</span>
      </h1>
      <p>
        Parameterized BCAM in Verilog for Boolean Board FPGA, supporting single-cycle lookups and efficient updates via REG and STR architectures.
      </p>
    </header>

    <section class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Overview</h2>
      </div>
      <p>
        Deployed on a Boolean Board with hardware-in-the-loop validation. Metrics such as mapping latency, update time, and resource utilization are measured to inform embedded/networking design trade-offs.
      </p>
    </section>

    <section class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Key Features</h2>
      </div>
      <ul>
        <li><strong>Configurable Parameters:</strong> Adjustable CAM depth and width.</li>
        <li><strong>Multiple Architectures:</strong> REG for speed; STR for resource efficiency.</li>
        <li><strong>Fast Updates:</strong> Partial/full entry updates with minimal delay.</li>
        <li><strong>FPGA Ready:</strong> Synthesizable Verilog for Boolean Board.</li>
        <li><strong>Verification:</strong> Simulation + On-board testing.</li>
      </ul>
    </section>

    <section class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Applications</h2>
      </div>
      <ul>
        <li>High-speed packet classification</li>
        <li>Network intrusion detection</li>
        <li>Embedded address lookups</li>
        <li>Pattern recognition</li>
      </ul>
    </section>

    <section class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Technologies Used</h2>
      </div>
      <div class="grid-2">
        <div class="feature">
          <div class="pill">HDL</div>
          <p>Verilog</p>
        </div>
        <div class="feature">
          <div class="pill">Toolchain</div>
          <p>Xilinx Vivado (or compatible)</p>
        </div>
        <div class="feature">
          <div class="pill">Simulation</div>
          <p>ModelSim / Vivado Simulator</p>
        </div>
        <div class="feature">
          <div class="pill">Platform</div>
          <p>Boolean Board FPGA</p>
        </div>
        <div class="feature">
          <div class="pill">Optional</div>
          <p>AXI interface</p>
        </div>
      </div>
    </section>

    <section class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Getting Started</h2>
      </div>
      <p>Typical build/test flow:</p>
      <ul>
        <li>Install FPGA toolchain (Vivado).</li>
        <li>Synthesize and generate bitstream.</li>
        <li>Run simulations with testbenches.</li>
        <li>Deploy to Boolean Board and measure performance.</li>
      </ul>
    </section>

    <footer class="footer">
      <p>© 2025 Fast Mapping and Updating BCAM Project. Real-time hardware-accelerated pattern matching.</p>
    </footer>
  </div>
</body>
</html>
