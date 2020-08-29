// =========================================================
// 
// designer:               yang shjiang
// date:                   2020-08-25
// description:            to test ov5640_powerup
// 
// =========================================================
`timescale  1ns / 1ps

module tb_ov5640_powerup;

// --------------------------------------------------------
// ************ define parameters and signals ********
// --------------------------------------------------------

// ov5640_powerup Parameters
parameter PERIOD  = 20;


// ov5640_powerup Inputs
reg   sysclk                               = 0 ;
reg   rst_n                                = 0 ;

// ov5640_powerup Outputs
wire  coms_pwdn                            ;
wire  coms_reset                           ;
wire  done                                 ;

// --------------------------------------------------------
// ******************** main code ********************
// --------------------------------------------------------

initial
begin
    forever #(PERIOD/2)  sysclk = ~sysclk;
end


initial
begin
    #(PERIOD*2) rst_n  =  1;
end


ov5640_powerup  u_ov5640_powerup (
    .sysclk                  ( sysclk       ),
    .rst_n                   ( rst_n        ),

    .coms_pwdn               ( coms_pwdn    ),
    .coms_reset              ( coms_reset   ),
    .done                    ( done         )
);

endmodule

