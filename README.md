# Fast-Mapping-and-Updating-binary-CAM-On-Boolean-board
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Fast Mapping and Updating BCAM on Boolean Board</title>
  <style>
    :root {
      --bg:#0f111a;
      --card:#1f2435;
      --radius:12px;
      --shadow:0 20px 60px -10px rgba(0,0,0,0.5);
      --accent:#6366f1;
      --text:#e3e9ff;
      font-family: system-ui,-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,sans-serif;
    }
    body {
      margin:0;
      background: linear-gradient(135deg,#0f111a 0%,#1c223b 100%);
      color: var(--text);
      line-height:1.5;
      min-height:100vh;
      display:flex;
      justify-content:center;
      padding:2rem;
    }
    .container {
      max-width: 960px;
      width:100%;
      display:grid;
      gap:1.5rem;
    }
    h1 {
      margin:0;
      font-size:2.2rem;
      display:flex;
      align-items:center;
      gap:.5rem;
    }
    .badge {
      background: var(--accent);
      padding:6px 12px;
      border-radius:999px;
      font-size:.65rem;
      text-transform:uppercase;
      letter-spacing:1px;
      margin-left:4px;
      color:#fff;
    }
    .card {
      background: var(--card);
      border-radius: var(--radius);
      padding:1.5rem 1.75rem;
      box-shadow: var(--shadow);
    }
    .section-title {
      display:flex;
      align-items:center;
      gap:.5rem;
      margin-bottom:.5rem;
    }
    ul {
      padding-left:1.25rem;
    }
    code {
      background: rgba(255,255,255,0.08);
      padding:2px 6px;
      border-radius:4px;
      font-family: monospace;
      font-size:.95em;
    }
    .grid-2 {
      display:grid;
      grid-template-columns: repeat(auto-fit,minmax(280px,1fr));
      gap:1.25rem;
    }
    .feature {
      margin-bottom:1rem;
    }
    .footer {
      text-align:center;
      font-size:.8rem;
      margin-top:2rem;
      opacity:.75;
    }
    a {
      color: var(--accent);
      text-decoration:none;
    }
    .pill {
      background: rgba(255,255,255,0.07);
      padding:4px 10px;
      border-radius:999px;
      font-size:.75rem;
      margin-right:.35rem;
      display:inline-block;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="card">
      <h1>
        Fast Mapping and Updating Binary Content Addressable Memory (BCAM) 
        <span class="badge">Project</span>
      </h1>
      <p>
        This project implements a parameterized Binary Content Addressable Memory (BCAM) in Verilog HDL, optimized for fast mapping and updating operations on an FPGA-based Boolean Board. The BCAM supports single-cycle lookups and efficient partial/full entry updates without full memory reload. Two architectures — <strong>Register-based (REG)</strong> and <strong>Segmented Transposed RAM (STR)</strong> — are explored to trade off between resource usage and update speed.
      </p>
    </div>

    <div class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Overview</h2>
      </div>
      <p>
        The design is deployed and validated on a Boolean Board FPGA platform using hardware-in-the-loop techniques for real-time pattern matching. Performance metrics such as mapping latency, update time, and resource utilization are analyzed and compared across architectures to guide design decisions in embedded and networking applications.
      </p>
    </div>

    <div class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Key Features</h2>
      </div>
      <ul>
        <li><strong>Configurable Parameters:</strong> Adjustable CAM depth and width to suit different requirements.</li>
        <li><strong>Multiple Architectures:</strong> REG for simplicity and speed; STR for better resource efficiency.</li>
        <li><strong>Fast Update Mechanism:</strong> Supports partial and full entry updates with minimal delay.</li>
        <li><strong>FPGA Integration:</strong> Synthesizable Verilog design ready for Boolean Board deployment.</li>
        <li><strong>Verification:</strong> Comprehensive simulation (ModelSim/Vivado) and on-board hardware testing.</li>
      </ul>
    </div>

    <div class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Applications</h2>
      </div>
      <ul>
        <li>High-speed packet classification in routers and switches</li>
        <li>Network intrusion detection systems</li>
        <li>Address lookup tables in embedded processors</li>
        <li>Pattern recognition systems</li>
      </ul>
    </div>

    <div class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Technologies Used</h2>
      </div>
      <div class="grid-2">
        <div class="feature">
          <div class="pill">HDL</div>
          <p>Verilog</p>
        </div>
        <div class="feature">
          <div class="pill">FPGA Toolchain</div>
          <p>Xilinx Vivado (or compatible for your Boolean board)</p>
        </div>
        <div class="feature">
          <div class="pill">Simulation</div>
          <p>ModelSim / Vivado Simulator</p>
        </div>
        <div class="feature">
          <div class="pill">Testing Platform</div>
          <p>Boolean Board FPGA</p>
        </div>
        <div class="feature">
          <div class="pill">Optional</div>
          <p>AXI interface for SoC integration</p>
        </div>
      </div>
    </div>

    <div class="card">
      <div class="section-title">
        <h2 style="margin:0; font-size:1.5rem;">Getting Started (Placeholder)</h2>
      </div>
      <p>
        Replace this section with build and test instructions tailored to your FPGA board. Typical steps include:
      </p>
      <ul>
        <li>Install FPGA toolchain (e.g., Vivado)</li>
        <li>Run synthesis and generate bitstream</li>
        <li>Simulate using testbenches in ModelSim/Vivado</li>
        <li>Deploy to Boolean Board and verify mapping/updating latency</li>
      </ul>
    </div>

    <div class="footer">
      <p>© 2025 Fast Mapping and Updating BCAM Project. Built for real-time hardware-accelerated pattern matching.</p>
    </div>
  </div>
</body>
</html>
