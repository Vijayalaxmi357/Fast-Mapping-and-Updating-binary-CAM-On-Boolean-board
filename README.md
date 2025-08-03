<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Fast Mapping and Updating BCAM on Boolean Board</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
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
    *{box-sizing:border-box;}
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
    h1 { margin:0; font-size:2.2rem; display:flex; align-items:center; gap:.5rem; }
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
    ul { padding-left:1.25rem; }
    code {
      background: rgba(255,255,255,0.08);
      padding:2px 6px;
      border-radius:4px;
      font-family: monospace;
      font-size:.95em;
    }
    .grid-2 {
      display:grid;
      grid-template-columns: repeat(auto-fit,minmax(220px,1fr));
      gap:1.25rem;
    }
    .feature { margin-bottom:1rem; }
    .footer {
      text-align:center;
      font-size:.8rem;
      margin-top:2rem;
      opacity:.75;
    }
    a { color: var(--accent); text-decoration:none; }
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
