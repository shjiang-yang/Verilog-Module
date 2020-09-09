// =========================================================
// 
// designer:               yang shjiang
// date:                   2020-09-06
// description:            to test ov5640_cfg
// 
// =========================================================
`timescale 1ns/1ns


module tb_ov5640_cfg;

// --------------------------------------------------------
// ************ define parameters and signals ********
// --------------------------------------------------------
reg         sysclk      ;   
reg         rst_n       ;   
wire        cmos_sclk   ;
wire        cmos_sdat   ;
wire        cfg_done    ;
wire [7:0]  rd_data     ;

// --------------------------------------------------------
// ******************** main code ********************
// --------------------------------------------------------
initial begin
    sysclk  =   0   ;
    rst_n   =   0   ;
    #100;
    rst_n   =   1   ;
end

always #5 sysclk = ~sysclk  ;

ov5640_cfg u_ov5640_cfg(
    // system signals
    .sysclk                 (   sysclk      ),
    .rst_n                  (   rst_n       ),
    // sccb
    .cmos_sclk              (   cmos_sclk   ),
    .cmos_sdat              (   cmos_sdat   ),
    // control  
    .cfg_done               (   cfg_done    ),
    .rd_data                (   rd_data     )
);

endmodule