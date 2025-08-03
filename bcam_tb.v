`timescale 1ns / 1ps

module bcam_tb;

  // Parameters
  localparam CAMD    = 16;                      // CAM depth
  localparam CAMW    = 8;                       // Pattern width
  localparam ADDRW   = $clog2(CAMD);            // Address width
  localparam CYCLES  = 100;                     // Simulation cycles
  localparam CLK_PER = 10;                      // Clock period

  // Signals
  reg clk = 0;
  reg rst = 1;

  reg wEnb;
  reg [ADDRW-1:0] wAddr;
  reg [CAMW-1:0]  wPatt;
  reg [CAMW-1:0]  mPatt;

  wire match;
  wire [ADDRW-1:0] mAddr;

  // Clock generator
  always #(CLK_PER/2) clk = ~clk;

  // DUT Instance - REG version
  bcam #(
    .CAMD(CAMD),
    .CAMW(CAMW),
    .TYPE("REG"),
    .REGO(1),
    .REGW(0),
    .REGM(0),
    .INOM(1)
  ) dut (
    .clk(clk),
    .rst(rst),
    .wEnb(wEnb),
    .wAddr(wAddr),
    .wPatt(wPatt),
    .mPatt(mPatt),
    .match(match),
    .mAddr(mAddr)
  );

  // Simulation logic
  integer i;
  initial begin
    $display("Starting BCAM testbench...");
    wEnb  = 0;
    wAddr = 0;
    wPatt = 0;
    mPatt = 0;

    // Release reset
    #(3*CLK_PER);
    rst = 0;

    // Write random patterns
    for (i = 0; i < CAMD; i = i + 1) begin
      @(posedge clk);
      wEnb  = 1;
      wAddr = i[ADDRW-1:0];
      wPatt = $random;
    end
    @(posedge clk);
    wEnb = 0;

    // Match tests
    for (i = 0; i < CAMD; i = i + 1) begin
      @(posedge clk);
      mPatt = $random;
      $display("Searching for: %h => Match: %b at Addr: %d", mPatt, match, mAddr);
    end

    // Done
    $display("BCAM test completed.");
    $finish;
  end

endmodule
