module OCC(se,sclk,ats_mode,fclk,test_m,out);
input se,sclk,ats_mode,fclk,test_m;
output out;
reg d;
reg [0:7]Q;
reg en_clk;
wire en;


always @(posedge sclk) 

  begin
  d<=~se;
  end

always @(posedge fclk)

  begin
  Q<={d,Q[0:6]};
  end

always@(posedge fclk)
  begin
    if(en) 
    en_clk<=fclk;
    else
    en_clk<=0;
  end

assign en=(ats_mode?(Q[5]&~Q[7]):(Q[6]&~Q[7]));
assign out=(test_m?(se?(sclk):(en_clk)):(fclk));

endmodule

