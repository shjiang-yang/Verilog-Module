// =========================================================
// 
// designer:               yang shjiang
// date:                   2020-09-05
// description:            to test the ov5640_config module
// 
// =========================================================
`timescale 1ns/1ns


module tb_ov5640_sccb;

// --------------------------------------------------------
// ************ define parameters and signals ********
// --------------------------------------------------------
reg                 sysclk      ; 
reg                 rst_n       ; 
reg                 start       ; 
reg     [31:0]      cfg_data    ; 

wire                cmos_sclk   ;
wire                cmos_sdat   ;
wire                done        ;
wire                busy        ;
wire    [ 7:0]      rd_data     ;

// --------------------------------------------------------
// ******************** main code ********************
// --------------------------------------------------------
initial begin
    sysclk      =   0   ;
    rst_n       =   0   ;
    start       =   0   ;
    cfg_data    =   32'h78aa56bb;
    #100;
    rst_n       =   1   ;
    #100;
    start       =   1   ;
    #10;
    start       =   0   ;
end

always #5 sysclk    =   ~sysclk ;




ov5640_sccb u_ov5640_sccb(
    // system signals
    .sysclk                     (   sysclk      ),       // sclk*2
    .rst_n                      (   rst_n       ),
    // control
    .start                      (   start       ),
    .cfg_data                   (   cfg_data    ),
    // sccb interface
    .cmos_sclk                  (   cmos_sclk   ),
    .cmos_sdat                  (   cmos_sdat   ),
    // others
    .done                       (   done        ),
    .busy                       (   busy        ),
    // debug
    .rd_data                    (   rd_data     )
);



endmodule