module mux51_generic #(parameter bit_width = 16) (a, b, c, d, e, s, y);
input [bit_width-1:0] a, b, c, d, e;
input [2:0] s;
output [bit_width-1:0] y;

wire [bit_width-1:0] s1, s2, s3;

mux21_generic #(.bit_width(bit_width))muxAB (
.a(a),
.b(b),
.s(s[0]),
.y(s1)
);

mux21_generic #(.bit_width(bit_width))muxCD (
.a(c),
.b(d),
.s(s[0]),
.y(s2)
);

mux21_generic #(.bit_width(bit_width))muxSS (
.a(s1),
.b(s2),
.s(s[1]),
.y(s3)
);
mux21_generic #(.bit_width(bit_width))muxSE (
.a(s3),
.b(e),
.s(s[2]),
.y(y)
);
endmodule
