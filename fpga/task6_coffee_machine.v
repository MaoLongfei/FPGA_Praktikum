module machine(clk,button0,button1,button2,button3,buy_tee,buy_coffee,reset,LED_tee,LED_coffee,display_low,display_high);

input clk;
input button0;
input button1;
input button2;
input button3;
input buy_tee,buy_coffee,reset;
output LED_tee,LED_coffee;
//output [6:0] display_high;
//output [6:0] display_low;
reg[6:0] display_low;
reg[6:0] display_high;
reg[3:0] result = 0;
reg[4:0] paid = 0;
reg[3:0] price = 0;

reg button0_r0;
reg button0_r1;
reg button1_r0;
reg button1_r1;
reg button2_r0;
reg button2_r1;
reg button3_r0;
reg button3_r1;
reg LED_tee_state;
reg LED_coffee_state;

always@(posedge clk)begin
	if(reset)begin
		price<=0;
		paid<=0;
		LED_tee_state<= 0;
		LED_coffee_state<= 0;
		end
	else
		begin
			if(buy_tee)begin
				price<=15;
				LED_tee_state<=1;		
				LED_coffee_state<=0;
				end
			if(buy_coffee)begin
				price<=10;
				LED_coffee_state<=1;
				LED_tee_state<=0;		
				end
		end

		
	button0_r0<= button0;
	button0_r1<= button0_r0;
	button1_r0<= button1;
	button1_r1<= button1_r0;
	button2_r0<= button2;
	button2_r1<= button2_r0;
	button3_r0<= button3;
	button3_r1<= button3_r0;
		
		
	if(button0_r0==0 && button0_r1==1)begin
		paid<= paid +1;
		end
	if(button1_r0==0 && button1_r1==1)begin
		paid<= paid +2;
		end
	if(button2_r0==0 && button2_r1==1)begin
		paid<= paid +3;
		end
	if(button3_r0==0 && button3_r1==1)begin
		paid<= paid +5;
		end	
	
//	if(paid)begin
		if(price>paid)begin
			//result <= price - paid;
			result <= paid;
			end
		else
			begin
			result <= paid - price;
			LED_tee_state<= 0;
			LED_coffee_state<= 0;
			end


end

output display_low,display_high;

reg[3:0] res_high;
reg[3:0] res_low;

always@(result)begin
	if(result>9)begin
		res_high<=1;
		res_low<= result-10;
			end
	else
		begin
		res_high<=0;
		res_low<= result;
		end

	case(res_low)            
	4'd0:display_low=7'b1000000;     
	4'd1:display_low=7'b1111001;     
	4'd2:display_low=7'b0100100;     
	4'd3:display_low=7'b0110000;     
	4'd4:display_low=7'b0011001;     
	4'd5:display_low=7'b0010010;     
	4'd6:display_low=7'b0000010;     
	4'd7:display_low=7'b1111000;     
	4'd8:display_low=7'b0000000;     
	4'd9:display_low=7'b0010000;       
	default: display_low=7'b1001000;           
	endcase                  
	case(res_high)            
	4'd0:display_high=7'b1000000;     
	4'd1:display_high=7'b1111001;     
	4'd2:display_high=7'b0100100;     
	4'd3:display_high=7'b0110000;     
	4'd4:display_high=7'b0011001;     
	4'd5:display_high=7'b0010010;     
	4'd6:display_high=7'b0000010;     
	4'd7:display_high=7'b1111000;     
	4'd8:display_high=7'b0000000;     
	4'd9:display_high=7'b0010000;       
	default: display_high=7'b1001000;        
	endcase         
end 

//assign display_high = display_high;
//assign display_low = display_low;
assign LED_coffee=LED_coffee_state;
assign LED_tee=LED_tee_state;
endmodule
