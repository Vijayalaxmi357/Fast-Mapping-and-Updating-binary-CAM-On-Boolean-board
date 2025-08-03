
`include "utils.vh"

`ifndef SIM
`endif

`define CAMD

`ifndef TYPE
`define TYPE ""
`endif

`ifndef PIPE
`define PIPE 0
`endif

`ifndef BYPS
`define BYPS 1
`endif

module bcam
 #( parameter CAMD = 256,       // CAM depth
    parameter CAMW = 32,        // CAM/pattern width
    parameter SEGW = 8,         // Segment width (only for STR)
    parameter BYPS = 0,         // Bypass match logic?
    parameter PIPE = 0,         // Pipeline stages?
    parameter INOM = 1,         // Init with no match
    parameter REGW = 1,         // Register write input
    parameter REGM = 1,         // Register match input
    parameter REGO = 1,         // Register output
    parameter BRAM = "GEN",     // Use generic BRAMs
    parameter TYPE = "STR"  )  // implementation type: BHV, REG, TRS, TRC, & STR
  ( input                    clk           ,  // clock
    input                    rst           ,  // global registers reset
    input                    wEnb          ,  // write enable
    input  [`log2(CAMD)-1:0] wAddr         ,  // write address
    input  [      CAMW -1:0] wPatt         ,  // write patterns
    input  [      CAMW -1:0] mPatt         ,  // patern to match
    output                   match         ,  // match indicator
    output [`log2(CAMD)-1:0] mAddr         ); // matched address

  localparam ADDRW = `log2(CAMD); // address width

  // register inputs 1
  reg wEnbR;
  reg [ADDRW-1:0] wAddrR;
  reg [CAMW -1:0] wPattR,mPattR;
  always @(posedge clk, posedge rst)
    if (rst) {wEnbR,wAddrR,wPattR,mPattR} <= {(1   +ADDRW+CAMW +CAMW ){1'b0}};
    else     {wEnbR,wAddrR,wPattR,mPattR} <= { wEnb,wAddr,wPatt,mPatt       };

  // register inputs 2
  reg wEnbRR;
  reg [ADDRW-1:0] wAddrRR;
  reg [CAMW -1:0] wPattRR,mPattRR;
  always @(posedge clk, posedge rst)
    if (rst) {wEnbRR,wAddrRR,wPattRR,mPattRR} <= {(1    +ADDRW +CAMW  +CAMW  ){1'b0}};
    else     {wEnbRR,wAddrRR,wPattRR,mPattRR} <= { wEnbR,wAddrR,wPattR,mPattR       };

  // assign inputs
  wire             wEnbI  = PIPE ? wEnbRR  : ( REGW ? wEnbR  : wEnb  );
  wire [ADDRW-1:0] wAddrI = PIPE ? wAddrRR : ( REGW ? wAddrR : wAddr );
  wire [CAMW -1:0] wPattI = PIPE ? wPattRR : ( REGW ? wPattR : wPatt );
  wire [CAMW -1:0] mPattI = PIPE ? mPattRR : ( REGM ? mPattR : mPatt );

  // generate and instantiate BCAM with specific implementation
  wire             matchI;
  wire [ADDRW-1:0] mAddrI;
  generate
    if (TYPE=="BHV") begin
      // instantiate behavioral BCAM
      bcam_bhv  #( .CAMD ( CAMD   ),  // CAM depth
                   .CAMW ( CAMW   ),  // CAM/pattern width
                   .INOM ( INOM   ))  // binary / Initial CAM with no match (has priority over IFILE)
      bcam_bhv_i ( .clk  ( clk    ),  // clock
                   .rst  ( rst    ),  // global registers reset
                   .wEnb ( wEnbI  ),  // write enable
                   .wAddr( wAddrI ),  // write address
                   .wPatt( wPattI ),  // write pattern
                   .mPatt( mPattI ),  // patern to match
                   .match( matchI ),  // match indicator
                   .mAddr( mAddrI )); // matched address
    end
    else if (TYPE=="REG") begin
      // instantiate register-based BCAM
      bcam_reg  #( .CAMD ( CAMD   ),  // CAM depth
                   .CAMW ( CAMW   ),  // CAM/pattern width
                   .PIPE ( PIPE   ),  // Pipelined? (binary; 0 or 1)
                   .INOM ( INOM   ))  // binary / Initial CAM with no match (has priority over IFILE)
      bcam_reg_i ( .clk  ( clk    ),  // clock
                   .rst  ( rst    ),  // global registers reset
                   .wEnb ( wEnbI  ),  // write enable
                   .wAddr( wAddrI ),  // write address
                   .wPatt( wPattI ),  // write pattern
                   .mPatt( mPattI ),  // patern to match
                   .match( matchI ),  // match indicator
                   .mAddr( mAddrI )); // matched address
    end
    else if (TYPE=="TRS") begin
      // instantiate transposed-RAM stage BCAM (TRS)
      bcam_trc  #( .CAMD ( CAMD   ),  // CAM depth
                   .CAMW ( CAMW   ),  // CAM/pattern width
                   .STGW ( 524288 ),  // maximum stage width (9 for M20k; infinity for uncascaded) - allow STGW+1 for last stage if required
                   .BYPS ( BYPS   ),  // Bypassed?  (binary; 0 or 1)
                   .PIPE ( PIPE   ),  // Pipelined? (binary; 0 or 1)
                   .INOM ( INOM   ),  // binary / Initial CAM with no match (has priority over IFILE)
                   .BRAM ( BRAM   ))  // BRAM type- "M20K":Altera's M20K; "GEN":generic
      bcam_trs_i ( .clk  ( clk    ),  // clock
                   .rst  ( rst    ),  // global registers reset
                   .wEnb ( wEnbI  ),  // write enable
                   .wAddr( wAddrI ),  // write address
                   .wPatt( wPattI ),  // write pattern
                   .mPatt( mPattI ),  // patern to match
                   .match( matchI ),  // match indicator
                   .mAddr( mAddrI )); // matched address
    end
    else if (TYPE=="TRC") begin
      // instantiate transposed-RAM cascade BCAM (TRC)
      bcam_trc  #( .CAMD ( CAMD   ),  // CAM depth
                   .CAMW ( CAMW   ),  // CAM/pattern width
                   .STGW ( 9      ),  // maximum stage width (9 for M20k; infinity for uncascaded) - allow STGW+1 for last stage if required
                   .BYPS ( BYPS   ),  // Bypassed?  (binary; 0 or 1)
                   .PIPE ( PIPE   ),  // Pipelined? (binary; 0 or 1)
                   .INOM ( INOM   ),  // binary / Initial CAM with no match (has priority over IFILE)
                   .BRAM ( BRAM   ))  // BRAM type- "M20K":Altera's M20K; "GEN":generic
      bcam_trc_i ( .clk  ( clk    ),  // clock
                   .rst  ( rst    ),  // global registers reset
                   .wEnb ( wEnbI  ),  // write enable
                   .wAddr( wAddrI ),  // write address
                   .wPatt( wPattI ),  // write pattern
                   .mPatt( mPattI ),  // patern to match
                   .match( matchI ),  // match indicator
                   .mAddr( mAddrI )); // matched address
    end
    else begin // default: STRAM
      // instantiate segmented transposed-RAM BCAM (STRAM)
      bcam_str  #( .CAMD ( CAMD   ),  // CAM depth
                   .CAMW ( CAMW   ),  // CAM/pattern width
                   .SEGW ( SEGW   ),  // Segment width
                   .BYPS ( BYPS   ),  // Bypassed?  (binary; 0 or 1)
                   .PIPE ( PIPE   ),  // Pipelined? (binary; 0 or 1)
                   .INOM ( INOM   ),  // binary / Initial CAM with no match (has priority over IFILE)
                   .BRAM ( BRAM   ))  // BRAM type- "M20K":Altera's M20K; "GEN":generic
      bcam_str_i ( .clk  ( clk    ),  // clock
                   .rst  ( rst    ),  // global registers reset
                   .wEnb ( wEnbI  ),  // write enable
                   .wAddr( wAddrI ),  // write address
                   .wPatt( wPattI ),  // write pattern
                   .mPatt( mPattI ),  // patern to match
                   .match( matchI ),  // match indicator
                   .mAddr( mAddrI )); // matched address
    end
  endgenerate

  // register outputs 1
  reg             matchIR;
  reg [ADDRW-1:0] mAddrIR;
  always @(posedge clk, posedge rst)
    if (rst) {matchIR,mAddrIR} <= {(1     +ADDRW ){1'b0}};
    else     {matchIR,mAddrIR} <= { matchI,mAddrI       };

  // register outputs 2
  reg             matchIRR;
  reg [ADDRW-1:0] mAddrIRR;
  always @(posedge clk, posedge rst)
    if (rst) {matchIRR,mAddrIRR} <= {(1      +ADDRW  ){1'b0}};
    else     {matchIRR,mAddrIRR} <= { matchIR,mAddrIR       };

  // assign outputs
  assign match = PIPE ? matchIRR : ( REGO ? matchIR : matchI);
  assign mAddr = PIPE ? mAddrIRR : ( REGO ? mAddrIR : mAddrI);

endmodule

