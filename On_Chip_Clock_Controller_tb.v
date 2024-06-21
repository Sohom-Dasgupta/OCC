module OCC_tb();
reg se,sclk,ats_mode,fclk,test_m;
wire out;

OCC O1(.se(se),.sclk(sclk),.ats_mode(ats_mode),.fclk(fclk),.test_m(test_m),.out(out));

initial
begin
test_m=1'b0;
ats_mode=1'b1;
se=1'b1;
sclk=1'b0;
fclk=1'b0;
end

always #20 sclk=~sclk;

always #5 fclk=~fclk;

initial 
begin
#35 test_m=1'b1;
#70 se=1'b0;
#50 se=1'b1;
end

initial
#300 $finish;

endmodule
