module LED(clk,LED_out);
input clk;

output LED_out;

reg LED_state;
integer count = 0;
//integer inside_count =1;
integer rate= 1;//1-49
reg flag=1;
reg change=0;

always@(posedge clk)begin

if(count<5000000)begin
	count<=count + 1;
	change<= 0;
	end
else
	begin
	count <= 0;
	change <= 1;
	end
	
	
if((count%100)<rate)begin
	LED_state<=1;
	end
else
	begin
	LED_state<=0;
	end


if(change)begin

	if(flag)begin
		if(rate<50)begin
				rate<=rate+1;
				end
		else
			flag<=0;
		end
	else	
		begin
		if(rate>1)
			rate<=rate-1;
		else
			flag<=1;
		end

end
	
end
assign LED_out=LED_state;
endmodule
