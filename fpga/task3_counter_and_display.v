module counter_and_display(clk,SEC_low,SEC_high,MIN_low,MIN_high,HOUR_low,HOUR_high,key0,key1,key2,key3,led0,led1,led2,led3); 
input clk;       

integer count=0; 

input key0,key1,key2,key3;
output led0,led1,led2,led3;

reg led_out0,led_out1,led_out2,led_out3;

reg[6:0] SEC_low; 
reg[6:0] SEC_high;
reg[6:0] MIN_low; 
reg[6:0] MIN_high;
reg[6:0] HOUR_low; 
reg[6:0] HOUR_high;

reg[6:0] second=0; 
reg[6:0] min=0;
reg[6:0] hour=0; 

reg key0_r0;
reg key0_r1;
reg key1_r0;
reg key1_r1;
reg key2_r0;
reg key2_r1;
reg key3_r0;
reg key3_r1;

always@(posedge clk)begin   
	
	if(count==5000000-1)begin       
		count<=0;		
		if(second<59)begin
			second<= second + 1;
		end
		else
			begin
			second <= 0;
			if(min<59)begin
				min <= min +1;
			end
			else
				begin
				min<=0;
				if(hour<23)begin
					hour<=hour + 1;
					end				
				end			
			end
		end   
	else 
		count=count+1;      
		
	key0_r0<= key0;
	key0_r1<= key0_r0;
	key1_r0<= key1;
	key1_r1<= key1_r0;
	key2_r0<= key2;
	key2_r1<= key2_r0;
	key3_r0<= key3;
	key3_r1<= key3_r0;
	
	if(key0_r0==0 && key0_r1==1)begin
		if(min==59)begin
			min<=0;
			if(hour ==23)begin
				hour<= 0;
				end
			else
				hour<=hour+1;
			end
		else
			min<= min + 1;
	end
	if(key1_r0==0 && key1_r1==1)begin
		if(min == 0)begin
			if(hour==0)begin
				hour<=23;
				end
			else
				hour<= hour -1;
			min<=59;
			end
		else
			min <= min - 1;
	end
	if(key2_r0==0 && key2_r1==1)begin
		if(hour == 23)begin
			hour<=0;
			end
		else
			hour<= hour +1;
	end
	if(key3_r0==0 && key3_r1==1)begin
		if(hour==00)begin
				hour<=23;
			end
		else
			hour<= hour - 1;
	end		
end   

output SEC_low;  
output SEC_high;  
always@(second)begin
	SEC_low=second%10;
	case(SEC_low)            
	4'd0:SEC_low=7'b1000000;     
	4'd1:SEC_low=7'b1111001;     
	4'd2:SEC_low=7'b0100100;     
	4'd3:SEC_low=7'b0110000;     
	4'd4:SEC_low=7'b0011001;     
	4'd5:SEC_low=7'b0010010;     
	4'd6:SEC_low=7'b0000010;     
	4'd7:SEC_low=7'b1111000;     
	4'd8:SEC_low=7'b0000000;     
	4'd9:SEC_low=7'b0010000;       
	default: SEC_low=7'b1001000;           
	endcase         
end             
always@(second)begin            
	SEC_high=second/10;           
	case(SEC_high)            
	4'd0:SEC_high=7'b1000000;     
	4'd1:SEC_high=7'b1111001;     
	4'd2:SEC_high=7'b0100100;     
	4'd3:SEC_high=7'b0110000;     
	4'd4:SEC_high=7'b0011001;     
	4'd5:SEC_high=7'b0010010;     
	4'd6:SEC_high=7'b0000010;     
	4'd7:SEC_high=7'b1111000;     
	4'd8:SEC_high=7'b0000000;     
	4'd9:SEC_high=7'b0010000;       
	default: SEC_high=7'b1001000;        
	endcase         
end   

output MIN_low;  
output MIN_high;  
always@(min)begin
	MIN_low=min%10;
	case(MIN_low)            
	4'd0:MIN_low=7'b1000000;     
	4'd1:MIN_low=7'b1111001;     
	4'd2:MIN_low=7'b0100100;     
	4'd3:MIN_low=7'b0110000;     
	4'd4:MIN_low=7'b0011001;     
	4'd5:MIN_low=7'b0010010;     
	4'd6:MIN_low=7'b0000010;     
	4'd7:MIN_low=7'b1111000;     
	4'd8:MIN_low=7'b0000000;     
	4'd9:MIN_low=7'b0010000;       
	default: MIN_low=7'b1001000;           
	endcase         
	end             
always@(min)begin            
	MIN_high=min/10;           
	case(MIN_high)            
	4'd0:MIN_high=7'b1000000;     
	4'd1:MIN_high=7'b1111001;     
	4'd2:MIN_high=7'b0100100;     
	4'd3:MIN_high=7'b0110000;     
	4'd4:MIN_high=7'b0011001;     
	4'd5:MIN_high=7'b0010010;     
	4'd6:MIN_high=7'b0000010;     
	4'd7:MIN_high=7'b1111000;     
	4'd8:MIN_high=7'b0000000;     
	4'd9:MIN_high=7'b0010000;       
	default: MIN_high=7'b1001000;        
	endcase         
end 

output HOUR_low;  
output HOUR_high;  
always@(hour)begin
	HOUR_low=hour%10;
	case(HOUR_low)            
	4'd0:HOUR_low=7'b1000000;     
	4'd1:HOUR_low=7'b1111001;     
	4'd2:HOUR_low=7'b0100100;     
	4'd3:HOUR_low=7'b0110000;     
	4'd4:HOUR_low=7'b0011001;     
	4'd5:HOUR_low=7'b0010010;     
	4'd6:HOUR_low=7'b0000010;     
	4'd7:HOUR_low=7'b1111000;     
	4'd8:HOUR_low=7'b0000000;     
	4'd9:HOUR_low=7'b0010000;       
	default: HOUR_low=7'b1001000;           
	endcase         
end             
always@(hour)begin            
	HOUR_high=hour/10;           
	case(HOUR_high)            
	4'd0:HOUR_high=7'b1000000;     
	4'd1:HOUR_high=7'b1111001;     
	4'd2:HOUR_high=7'b0100100;     
	4'd3:HOUR_high=7'b0110000;     
	4'd4:HOUR_high=7'b0011001;     
	4'd5:HOUR_high=7'b0010010;     
	4'd6:HOUR_high=7'b0000010;     
	4'd7:HOUR_high=7'b1111000;     
	4'd8:HOUR_high=7'b0000000;     
	4'd9:HOUR_high=7'b0010000;       
	default: HOUR_high=7'b1001000;        
	endcase         
end 
endmodule
