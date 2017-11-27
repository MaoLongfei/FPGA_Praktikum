
//define module entity
module lmao_task1(A_in, B_in, Sum_out);

//define inputs and outputs

input [3:0] A_in;
input [3:0] B_in;

output [4:0] Sum_out;
reg [4:0] Sum_out;

//do the addition


always@(A_in or B_in) begin
	Sum_out <= A_in + B_in;
end

endmodule


/*

module lmao_task1(A_in,B_in,Sum_out);
input [3:0]A_in,B_in;
output [4:0]Sum_out;
wire c1,c2,c3;
reg [4:0]Sum_out;
fulladder u0(.a(A_in[0]),.b(B_in[0]),.cin(1'b0),.s(Sum_out[0]),.cout(c1));
fulladder u1(.a(A_in[1]),.b(B_in[1]),.cin(c1),.s(Sum_out[1]),.cout(c2));
fulladder u2(.a(A_in[2]),.b(B_in[2]),.cin(c2),.s(Sum_out[2]),.cout(c3));
fulladder u3(.a(A_in[3]),.b(B_in[3]),.cin(c3),.s(Sum_out[3]),.cout(Sum_out[4]));
endmodule

module fulladder(a,b,cin,s,cout);
input a,b,cin;
output s,cout;
assign s<=a^b^cin;
assign cout<=(a&b)|(a&cin)|(b&cin);
endmodule

*/
