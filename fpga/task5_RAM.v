module RAM_01(clk,LED);
input clk;
output [25:0]LED;

reg[7:0] addr=0;
reg[25:0] data_in=9;
reg write_enable = 0;
reg read_enable= 1;
reg flag = 0;
reg[25:0] LED_state;

integer count = 0;

always@(posedge clk)begin
if(count <5000000)begin
	count<= count + 1;
//	flag <= 0;
	end
else
	begin
	count<= 0;
//	flag <= 1;
	addr <= addr +1;
	end
end
//test ram_test(.address(addr),.clock(clk),.data(data_in),.wren(write_enable),.rden(read_enable),.q(LED));

//addr<= addr + 1;
//data_in<=data_in +1;


test ram_test(.address(addr),.clock(clk),.data(data_in),.wren(write_enable),.rden(read_enable),.q(LED));
//	flag <= 0;
//end
//assign LED = LED_state;
endmodule
