module detect(clk,enable,switch,select,button0,button1,display0,display1,display2,display3,display4,display5,display6,display7,LED_R,LED_G);
input clk,enable,select,button0,button1;
input [7:0] switch;
output LED_G,LED_R;
reg [6:0]display0,display1,display2,display3,display4,display5,display6,display7;
output [6:0]display0,display1,display2,display3,display4,display5,display6,display7;

reg [7:0] target = 0;
reg [7:0] display = 0;
reg [7:0] type_in = 0;

reg[3:0] i = 0;

integer LED_G_count = 0;
integer LED_R_count = 0;
integer state_count = 0;

reg button0_r0;
reg button0_r1;
reg button1_r0;
reg button1_r1;
reg button0_pushed = 0;
reg button1_pushed = 0;
reg typed = 0;
reg LED_G_state;
reg LED_R_state;
reg wrong = 0;


parameter [5:0] not_compared= 5'b00001, right_typed = 5'b00010, wrong_typed = 5'b00100, continue_type_in = 5'b01000, find_prefix = 5'b10000;
reg [5:0] curr_state, next_state;

always@(posedge clk)begin
	if(enable)begin
		target<=switch;
		end
	if(select)begin
		display<=target;
		end
	else
		begin
		display<=type_in;
		end
	
	button0_r0<= button0;
	button0_r1<= button0_r0;
	button1_r0<= button1;
	button1_r1<= button1_r0;	
	
	if(button0_r0==0 && button0_r1==1)begin
		button0_pushed <= 1;
		i<= i + 1;
		end
	if(button1_r0==0 && button1_r1==1)begin
		button1_pushed <=1;
		i<= i + 1;
		end
	typed = button0_pushed + button1_pushed;
end

always@(typed)begin
type_in <= type_in + 1 * 2**(7-i);
typed<=0;
button0_pushed<=0;
button1_pushed<=0;

if(target == type_in)begin
	LED_G_state<=1;
	end
else
	begin
	if((target-type_in)<2**(8-i))begin
//		curr_state<=find_prefix;
		end
	else
		begin
		curr_state<=find_prefix;
		end
	end

case(curr_state)
find_prefix:begin
	type_in <= type_in * 2;
	i<i-1;
	if((target-type_in)<2**(8-i))begin
		curr_state<= 0;
		end
	else
		begin
		curr_state<=find_prefix;
		end
	end
endcase
end

always@(display)begin
case(display[7])
0: display7=7'b1000000;
1: display7=7'b1111001;
default: display7=7'b000110;
endcase
case(display[6])
0:display6=7'b1000000;
1:display6=7'b1111001;
default: display6=7'b000110;
endcase
case(display[5])
0:display5=7'b1000000;
1:display5=7'b1111001;
default: display5=7'b000110;
endcase
case(display[4])
0:display4=7'b1000000;
1:display4=7'b1111001;
default: display4=7'b000110;
endcase
case(display[3])
0:display3=7'b1000000;
1:display3=7'b1111001;
default: display3=7'b000110;
endcase
case(display[2])
0:display2=7'b1000000;
1:display2=7'b1111001;
default: display2=7'b000110;
endcase
case(display[1])
0:display1=7'b1000000;
1:display1=7'b1111001;
default: display1=7'b000110;
endcase
case(display[0])
0:display0=7'b1000000;
1:display0=7'b1111001;
default: display0=7'b000110;
endcase
end

assign LED_G = LED_G_state;
assign LED_R = LED_R_state;

endmodule
