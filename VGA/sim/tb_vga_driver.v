// ===================================================
// 
// designer:        yang shjiang
// date:            2020-08-23
// description:     to test the vga driver
// 
// ===================================================
`timescale  1ns/1ns 

module tb_vga_driver;

// -----------------------------------------------
// ********** define parameters and signals ***
// -----------------------------------------------
localparam      rem_depth   =   64  ;

reg             sys_clk     ;
reg             rst_n       ;
reg     [15:0]  data        ;

wire            data_req    ;
wire            h_sync      ;
wire            v_sync      ;
wire    [ 4:0]  red         ;
wire    [ 5:0]  green       ;
wire    [ 4:0]  blue        ;

reg     [15:0]  rem[0:rem_depth-1]   ;
reg     [ 5:0]  addr        ;



// ------------------------------------------------
// *************** main code ******************
// ------------------------------------------------
initial begin
    sys_clk     = 0 ;
    rst_n       = 0 ;
    # 100;
    rst_n       = 1 ;
end

always @(posedge sys_clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin: init
        integer i ;
        for (i=0; i<rem_depth; i=i+1) begin
            rem[i]  <=  {$random} % 2**16   ;
        end
        addr    <= 0        ;
        data    <=  16'b0   ;
    end else if (data_req == 1'b1) begin
        data    <=  rem[addr]   ;
        addr    <=  addr +  'b1 ;
    end
end

always #5 sys_clk = ~sys_clk    ;


vga_driver vga_driver_inst(
    // system signals
    .sys_clk                    (   sys_clk     )   ,
    .rst_n                      (   rst_n       )   ,
    // req data
    .data_req                   (   data_req    )   ,
    .data                       (   data        )   ,
    // vga interface
    .h_sync                     (   h_sync      )   ,
    .v_sync                     (   v_sync      )   ,
    .red                        (   red         )   ,
    .green                      (   green       )   ,
    .blue                       (   blue        )   
);

endmodule