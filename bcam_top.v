
`timescale 1ns / 1ps

module bcam_led_top (
    input wire clk,               // 100 MHz clock input from Basys 3
    input wire [2:0] btn,              // Reset button (Up)
//    input wire btnL,              // Write pattern button (Left)
//    input wire btnR,              // Match pattern button (Right)
    input wire [15:0] sw,         // Switches used for pattern input
    output wire [15:0] led        // LEDs display match and address
);

    // Parameters
    localparam CAMD = 256;        // CAM depth (number of entries)
    localparam CAMW = 16;         // CAM width (bit-width of pattern)
    localparam ADDRW = $clog2(CAMD);

    // Internal control signals
    wire rst = btn[0];
    wire wEnb = btn[1];
    wire match_trigger = btn[2];

    // Internal pattern and address registers
    reg [CAMW-1:0] wPatt = 0;
    reg [CAMW-1:0] mPatt = 0;
    reg [ADDRW-1:0] wAddr = 0;

    // Match outputs
    wire match;
    wire [ADDRW-1:0] mAddr;

    // Write logic
    always @(posedge clk) begin
        if (rst) begin
            wPatt <= 0;
            wAddr <= 0;
        end else if (wEnb) begin
            wPatt <= sw;
            wAddr <= wAddr + 1;
        end
    end

    // Match pattern loading
    always @(posedge clk) begin
        if (match_trigger)
            mPatt <= sw;
    end

    // Instantiate BCAM core
    bcam #(
        .CAMD(CAMD),
        .CAMW(CAMW),
        .SEGW(8),
        .BYPS(0),
        .PIPE(0),
        .INOM(1),
        .REGW(1),
        .REGM(1),
        .REGO(1),
        .BRAM("GEN"),
        .TYPE("STR")
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

    // Drive all 16 LEDs: [15:9]=wAddr, [8]=match, [7:0]=match address
    assign led = {wAddr[6:0], match, mAddr};

endmodule

