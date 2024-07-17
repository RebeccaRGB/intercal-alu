module intercal_alu(
	input  wire [3:0]  s,
	input  wire [31:0] a,
	input  wire [31:0] b,
	output wire [31:0] f
);

	function automatic [31:0] unand32;
		input [31:0] a;
		unand32 = {a[0], a[31:1]} & a;
	endfunction

	function automatic [31:0] unxor32;
		input [31:0] a;
		unxor32 = {a[0], a[31:1]} ^ a;
	endfunction

	function automatic [31:0] unor32;
		input [31:0] a;
		unor32 = {a[0], a[31:1]} | a;
	endfunction

	function automatic [15:0] unand16;
		input [15:0] a;
		unand16 = {a[0], a[15:1]} & a;
	endfunction

	function automatic [15:0] unxor16;
		input [15:0] a;
		unxor16 = {a[0], a[15:1]} ^ a;
	endfunction

	function automatic [15:0] unor16;
		input [15:0] a;
		unor16 = {a[0], a[15:1]} | a;
	endfunction

	function automatic [31:0] mingle16;
		input [15:0] a; input [15:0] b;
		mingle16 = {
			a[15], b[15], a[14], b[14], a[13], b[13], a[12], b[12],
			a[11], b[11], a[10], b[10], a[9], b[9], a[8], b[8],
			a[7], b[7], a[6], b[6], a[5], b[5], a[4], b[4],
			a[3], b[3], a[2], b[2], a[1], b[1], a[0], b[0]
		};
	endfunction

	function automatic [15:0] select16;
		input [15:0] a; input [15:0] b;
		reg        s15; reg [1:0]  s14; reg [2:0]  s13; reg [3:0]  s12;
		reg [4:0]  s11; reg [5:0]  s10; reg [6:0]  s9;  reg [7:0]  s8;
		reg [8:0]  s7;  reg [9:0]  s6;  reg [10:0] s5;  reg [11:0] s4;
		reg [12:0] s3;  reg [13:0] s2;  reg [14:0] s1;  reg [15:0] s0;
		begin
			s15 = (b[15] ?       a[15]  :  1'b0      );
			s14 = (b[14] ? {s15, a[14]} : {1'b0, s15});
			s13 = (b[13] ? {s14, a[13]} : {1'b0, s14});
			s12 = (b[12] ? {s13, a[12]} : {1'b0, s13});
			s11 = (b[11] ? {s12, a[11]} : {1'b0, s12});
			s10 = (b[10] ? {s11, a[10]} : {1'b0, s11});
			s9  = (b[9]  ? {s10, a[9] } : {1'b0, s10});
			s8  = (b[8]  ? { s9, a[8] } : {1'b0, s9 });
			s7  = (b[7]  ? { s8, a[7] } : {1'b0, s8 });
			s6  = (b[6]  ? { s7, a[6] } : {1'b0, s7 });
			s5  = (b[5]  ? { s6, a[5] } : {1'b0, s6 });
			s4  = (b[4]  ? { s5, a[4] } : {1'b0, s5 });
			s3  = (b[3]  ? { s4, a[3] } : {1'b0, s4 });
			s2  = (b[2]  ? { s3, a[2] } : {1'b0, s3 });
			s1  = (b[1]  ? { s2, a[1] } : {1'b0, s2 });
			s0  = (b[0]  ? { s1, a[0] } : {1'b0, s1 });
			select16 = s0;
		end
	endfunction

	function automatic [31:0] select32;
		input [31:0] a; input [31:0] b;
		reg        s31; reg [1:0]  s30; reg [2:0]  s29; reg [3:0]  s28;
		reg [4:0]  s27; reg [5:0]  s26; reg [6:0]  s25; reg [7:0]  s24;
		reg [8:0]  s23; reg [9:0]  s22; reg [10:0] s21; reg [11:0] s20;
		reg [12:0] s19; reg [13:0] s18; reg [14:0] s17; reg [15:0] s16;
		reg [16:0] s15; reg [17:0] s14; reg [18:0] s13; reg [19:0] s12;
		reg [20:0] s11; reg [21:0] s10; reg [22:0] s9;  reg [23:0] s8;
		reg [24:0] s7;  reg [25:0] s6;  reg [26:0] s5;  reg [27:0] s4;
		reg [28:0] s3;  reg [29:0] s2;  reg [30:0] s1;  reg [31:0] s0;
		begin
			s31 = (b[31] ?       a[31]  :  1'b0      );
			s30 = (b[30] ? {s31, a[30]} : {1'b0, s31});
			s29 = (b[29] ? {s30, a[29]} : {1'b0, s30});
			s28 = (b[28] ? {s29, a[28]} : {1'b0, s29});
			s27 = (b[27] ? {s28, a[27]} : {1'b0, s28});
			s26 = (b[26] ? {s27, a[26]} : {1'b0, s27});
			s25 = (b[25] ? {s26, a[25]} : {1'b0, s26});
			s24 = (b[24] ? {s25, a[24]} : {1'b0, s25});
			s23 = (b[23] ? {s24, a[23]} : {1'b0, s24});
			s22 = (b[22] ? {s23, a[22]} : {1'b0, s23});
			s21 = (b[21] ? {s22, a[21]} : {1'b0, s22});
			s20 = (b[20] ? {s21, a[20]} : {1'b0, s21});
			s19 = (b[19] ? {s20, a[19]} : {1'b0, s20});
			s18 = (b[18] ? {s19, a[18]} : {1'b0, s19});
			s17 = (b[17] ? {s18, a[17]} : {1'b0, s18});
			s16 = (b[16] ? {s17, a[16]} : {1'b0, s17});
			s15 = (b[15] ? {s16, a[15]} : {1'b0, s16});
			s14 = (b[14] ? {s15, a[14]} : {1'b0, s15});
			s13 = (b[13] ? {s14, a[13]} : {1'b0, s14});
			s12 = (b[12] ? {s13, a[12]} : {1'b0, s13});
			s11 = (b[11] ? {s12, a[11]} : {1'b0, s12});
			s10 = (b[10] ? {s11, a[10]} : {1'b0, s11});
			s9  = (b[9]  ? {s10, a[9] } : {1'b0, s10});
			s8  = (b[8]  ? { s9, a[8] } : {1'b0, s9 });
			s7  = (b[7]  ? { s8, a[7] } : {1'b0, s8 });
			s6  = (b[6]  ? { s7, a[6] } : {1'b0, s7 });
			s5  = (b[5]  ? { s6, a[5] } : {1'b0, s6 });
			s4  = (b[4]  ? { s5, a[4] } : {1'b0, s5 });
			s3  = (b[3]  ? { s4, a[3] } : {1'b0, s4 });
			s2  = (b[2]  ? { s3, a[2] } : {1'b0, s3 });
			s1  = (b[1]  ? { s2, a[1] } : {1'b0, s2 });
			s0  = (b[0]  ? { s1, a[0] } : {1'b0, s1 });
			select32 = s0;
		end
	endfunction

	reg [31:0] result;
	assign f = result;

	always @(s or a or b) begin
		case (s)
			0:  result = a;
			1:  result = b;
			2:  result = {unand16(a[31:16]), unand16(a[15:0])};
			3:  result = unand32(a);
			4:  result = {unor16(a[31:16]), unor16(a[15:0])};
			5:  result = unor32(a);
			6:  result = {unxor16(a[31:16]), unxor16(a[15:0])};
			7:  result = unxor32(a);
			8:  result = mingle16(a[15:0], b[15:0]);
			9:  result = mingle16(a[31:16], b[31:16]);
			10: result = {select16(a[31:16], b[31:16]), select16(a[15:0], b[15:0])};
			11: result = select32(a, b);
			12: result = 32'h63746150;
			13: result = 32'h62207968;
			14: result = 32'h20747365;
			15: result = 32'h6C726967;
		endcase
	end

endmodule
