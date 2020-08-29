// =========================================================
// 
// designer:               yang shjiang
// date:                   2020-08-25
// description:            the ov5640_powerup module
// 
// =========================================================


module ov5640_powerup(
    // system signals
    input               sysclk      ,       // 50M
    input               rst_n       ,
    // ov5640 interface
    output              coms_pwdn   ,
    output              coms_reset  ,
    // other
    output              done        
);

// --------------------------------------------------------
// ************ define parameters and signals ********
// --------------------------------------------------------
localparam      delay_5ms   =   250_000     ;
localparam      delay_2ms   =   100_000     ;
localparam      delay_21ms  =   1_050_000   ;

reg     [20:0]  delay_cnt   ;

// --------------------------------------------------------
// ******************** main code ********************
// --------------------------------------------------------
always @(posedge sysclk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
        delay_cnt   <=  1'b0    ;
    end else if (delay_cnt == delay_21ms+delay_2ms+delay_5ms-1) begin
        delay_cnt   <=  delay_cnt   ;
    end else begin
        delay_cnt   <=  delay_cnt + 1'b1    ;
    end
end

assign coms_pwdn    = (delay_cnt < delay_5ms) ? 1'b1 : 1'b0             ;
assign coms_reset   = (delay_cnt < delay_5ms+delay_2ms) ? 1'b0 : 1'b1   ;
assign done         = (delay_cnt < delay_21ms+delay_2ms+delay_5ms-2) ? 1'b0 : 1'b1;

endmodule