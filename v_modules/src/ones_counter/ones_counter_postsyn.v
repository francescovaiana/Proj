/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Wed Jul 11 12:49:13 2018
/////////////////////////////////////////////////////////////


module ones_counter_postsyn ( clk, rst, word_in, count_out );
  input [31:0] word_in;
  output [5:0] count_out;
  input clk, rst;
  wire   count_out_5, count_out_0, \reg_in/N1 , n2, n3, n4, n5, n6, n7, n8, n9,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188;
  wire   [31:0] seq_in;
  assign count_out[5] = n151;
  assign count_out[0] = n166;

  HS65_LS_IVX18 U171 ( .A(rst), .Z(\reg_in/N1 ) );
  HS65_LS_AND2X4 U181 ( .A(n183), .B(n184), .Z(n47) );
  HS65_LS_IVX9 U182 ( .A(n30), .Z(n4) );
  HS65_LSS_XOR3X2 U183 ( .A(n26), .B(n25), .C(n2), .Z(n44) );
  HS65_LS_PAO2X4 U184 ( .A(n164), .B(n162), .P(n163), .Z(n21) );
  HS65_LS_PAOI2X1 U185 ( .A(n47), .B(n48), .P(n49), .Z(n46) );
  HS65_LSS_XOR2X6 U186 ( .A(n104), .B(n103), .Z(n106) );
  HS65_LSS_XOR2X6 U187 ( .A(n82), .B(n81), .Z(n105) );
  HS65_LS_NOR2X6 U188 ( .A(n33), .B(n34), .Z(n16) );
  HS65_LS_NOR2AX3 U189 ( .A(n35), .B(n36), .Z(n15) );
  HS65_LSS_XOR2X6 U190 ( .A(n33), .B(n34), .Z(n22) );
  HS65_LS_IVX2 U191 ( .A(n147), .Z(n2) );
  HS65_LS_NOR2AX3 U192 ( .A(n26), .B(n147), .Z(n39) );
  HS65_LSS_XOR3X2 U193 ( .A(n58), .B(n148), .C(n149), .Z(n45) );
  HS65_LS_AOI212X2 U194 ( .A(n50), .B(n148), .C(n7), .D(n149), .E(n179), .Z(
        n20) );
  HS65_LSS_XNOR2X6 U195 ( .A(n36), .B(n35), .Z(n53) );
  HS65_LS_OR2X4 U196 ( .A(n149), .B(n7), .Z(n50) );
  HS65_LS_IVX2 U197 ( .A(n58), .Z(n7) );
  HS65_LS_NAND2X7 U198 ( .A(n119), .B(n120), .Z(n30) );
  HS65_LS_NAND2X7 U199 ( .A(n111), .B(n112), .Z(n93) );
  HS65_LSS_XOR3X2 U200 ( .A(n92), .B(n99), .C(n93), .Z(n102) );
  HS65_LS_PAOI2X1 U201 ( .A(n100), .B(n176), .P(n161), .Z(n26) );
  HS65_LS_AND2X4 U202 ( .A(n103), .B(n104), .Z(n101) );
  HS65_LSS_XOR3X2 U203 ( .A(n186), .B(n156), .C(n155), .Z(n100) );
  HS65_LS_OAI212X5 U204 ( .A(n61), .B(n8), .C(n62), .D(n63), .E(n64), .Z(n52)
         );
  HS65_LSS_XNOR2X6 U205 ( .A(n57), .B(n56), .Z(n64) );
  HS65_LS_AND2X4 U206 ( .A(n63), .B(n62), .Z(n61) );
  HS65_LS_OAI212X5 U207 ( .A(n69), .B(n70), .C(n9), .D(n71), .E(n72), .Z(n51)
         );
  HS65_LSS_XNOR2X6 U208 ( .A(n55), .B(n54), .Z(n72) );
  HS65_LS_IVX9 U209 ( .A(n77), .Z(n9) );
  HS65_LS_NOR2AX3 U210 ( .A(n71), .B(n77), .Z(n69) );
  HS65_LSS_XOR2X6 U211 ( .A(n137), .B(n138), .Z(n82) );
  HS65_LSS_XOR2X6 U212 ( .A(n111), .B(n112), .Z(n104) );
  HS65_LS_PAOI2X1 U213 ( .A(n160), .B(n175), .P(n158), .Z(n58) );
  HS65_LS_AND2X4 U214 ( .A(n81), .B(n82), .Z(n79) );
  HS65_LSS_XOR3X2 U215 ( .A(n63), .B(n62), .C(n83), .Z(n78) );
  HS65_LS_OAI212X5 U216 ( .A(n84), .B(n5), .C(n3), .D(n30), .E(n85), .Z(n43)
         );
  HS65_LSS_XNOR2X6 U217 ( .A(n32), .B(n31), .Z(n85) );
  HS65_LS_NOR2X6 U218 ( .A(n4), .B(n27), .Z(n84) );
  HS65_LSS_XOR2X6 U219 ( .A(n129), .B(n130), .Z(n81) );
  HS65_LSS_XOR2X6 U220 ( .A(n119), .B(n120), .Z(n103) );
  HS65_LS_NAND2X7 U221 ( .A(n31), .B(n32), .Z(n34) );
  HS65_LS_NAND2X7 U222 ( .A(n41), .B(n42), .Z(n33) );
  HS65_LS_NAND2X7 U223 ( .A(n137), .B(n138), .Z(n63) );
  HS65_LS_PAOI2X1 U224 ( .A(n24), .B(n25), .P(n26), .Z(n23) );
  HS65_LS_AOI112X1 U225 ( .A(n186), .B(n156), .C(n174), .D(n159), .Z(n24) );
  HS65_LSS_XOR2X6 U226 ( .A(n31), .B(n32), .Z(n28) );
  HS65_LS_AOI12X2 U227 ( .A(n3), .B(n30), .C(n5), .Z(n29) );
  HS65_LS_NAND2X7 U228 ( .A(n129), .B(n130), .Z(n71) );
  HS65_LS_NAND2X7 U229 ( .A(n56), .B(n57), .Z(n36) );
  HS65_LS_IVX9 U230 ( .A(n27), .Z(n3) );
  HS65_LS_IVX9 U231 ( .A(n90), .Z(n5) );
  HS65_LS_IVX9 U232 ( .A(n83), .Z(n8) );
  HS65_LSS_XOR3X2 U233 ( .A(n70), .B(n77), .C(n71), .Z(n80) );
  HS65_LSS_XOR3X2 U234 ( .A(n173), .B(n110), .C(n161), .Z(n49) );
  HS65_LS_NAND2X7 U235 ( .A(n104), .B(n103), .Z(n109) );
  HS65_LSS_XOR3X2 U236 ( .A(n155), .B(n156), .C(n178), .Z(n110) );
  HS65_LSS_XOR3X2 U237 ( .A(n172), .B(n157), .C(n158), .Z(n48) );
  HS65_LS_NAND2X7 U238 ( .A(n82), .B(n81), .Z(n127) );
  HS65_LSS_XOR3X2 U239 ( .A(n8), .B(n62), .C(n63), .Z(n128) );
  HS65_LS_AND2X4 U240 ( .A(n54), .B(n55), .Z(n35) );
  HS65_LS_OA212X4 U241 ( .A(n170), .B(n154), .C(n185), .D(n177), .E(n171), .Z(
        n25) );
  HS65_LSS_XNOR2X6 U242 ( .A(n42), .B(n41), .Z(n94) );
  HS65_LS_AND2X4 U243 ( .A(n93), .B(n6), .Z(n91) );
  HS65_LS_IVX9 U244 ( .A(n99), .Z(n6) );
  HS65_LS_OAI21X3 U245 ( .A(n121), .B(n122), .C(n123), .Z(n27) );
  HS65_LSS_XOR2X6 U246 ( .A(n89), .B(n88), .Z(n123) );
  HS65_LSS_XOR2X6 U247 ( .A(n125), .B(n124), .Z(n119) );
  HS65_LSS_XOR2X6 U248 ( .A(n117), .B(n116), .Z(n111) );
  HS65_LSS_XOR2X6 U249 ( .A(n122), .B(n121), .Z(n120) );
  HS65_LSS_XOR2X6 U250 ( .A(n114), .B(n113), .Z(n112) );
  HS65_LS_NOR2AX3 U251 ( .A(n86), .B(n87), .Z(n31) );
  HS65_LS_NOR2AX3 U252 ( .A(n88), .B(n89), .Z(n32) );
  HS65_LS_OAI21X3 U253 ( .A(n131), .B(n132), .C(n133), .Z(n77) );
  HS65_LSS_XOR2X6 U254 ( .A(n76), .B(n75), .Z(n133) );
  HS65_LSS_XOR2X6 U255 ( .A(n132), .B(n131), .Z(n129) );
  HS65_LSS_XOR2X6 U256 ( .A(n143), .B(n142), .Z(n137) );
  HS65_LS_OAI21X3 U257 ( .A(n124), .B(n125), .C(n126), .Z(n90) );
  HS65_LSS_XOR2X6 U258 ( .A(n87), .B(n86), .Z(n126) );
  HS65_LSS_XOR2X6 U259 ( .A(n135), .B(n134), .Z(n130) );
  HS65_LSS_XOR2X6 U260 ( .A(n140), .B(n139), .Z(n138) );
  HS65_LS_NOR2AX3 U261 ( .A(n67), .B(n68), .Z(n57) );
  HS65_LS_NOR2AX3 U262 ( .A(n97), .B(n98), .Z(n42) );
  HS65_LS_NOR2AX3 U263 ( .A(n65), .B(n66), .Z(n56) );
  HS65_LS_NOR2AX3 U264 ( .A(n95), .B(n96), .Z(n41) );
  HS65_LS_OAI21X3 U265 ( .A(n113), .B(n114), .C(n115), .Z(n99) );
  HS65_LSS_XOR2X6 U266 ( .A(n98), .B(n97), .Z(n115) );
  HS65_LS_NOR2AX3 U267 ( .A(n75), .B(n76), .Z(n55) );
  HS65_LS_NOR2AX3 U268 ( .A(n73), .B(n74), .Z(n54) );
  HS65_LS_OAI21X3 U269 ( .A(n142), .B(n143), .C(n144), .Z(n83) );
  HS65_LSS_XOR2X6 U270 ( .A(n66), .B(n65), .Z(n144) );
  HS65_LS_OA12X9 U271 ( .A(n134), .B(n135), .C(n136), .Z(n70) );
  HS65_LSS_XOR2X6 U272 ( .A(n74), .B(n73), .Z(n136) );
  HS65_LS_OA12X9 U273 ( .A(n139), .B(n140), .C(n141), .Z(n62) );
  HS65_LSS_XOR2X6 U274 ( .A(n68), .B(n67), .Z(n141) );
  HS65_LS_OA12X9 U275 ( .A(n116), .B(n117), .C(n118), .Z(n92) );
  HS65_LSS_XOR2X6 U276 ( .A(n96), .B(n95), .Z(n118) );
  HS65_LSS_XNOR3X2 U278 ( .A(n150), .B(n21), .C(n146), .Z(n37) );
  HS65_LS_OAI212X3 U279 ( .A(n39), .B(n25), .C(n26), .D(n2), .E(n169), .Z(n38)
         );
  HS65_LSS_XNOR2X6 U280 ( .A(n34), .B(n33), .Z(n40) );
  HS65_LSS_XNOR2X6 U281 ( .A(seq_in[6]), .B(seq_in[7]), .Z(n125) );
  HS65_LSS_XNOR2X6 U282 ( .A(seq_in[2]), .B(seq_in[3]), .Z(n122) );
  HS65_LSS_XNOR2X6 U283 ( .A(seq_in[10]), .B(seq_in[11]), .Z(n114) );
  HS65_LSS_XNOR2X6 U284 ( .A(seq_in[4]), .B(seq_in[5]), .Z(n124) );
  HS65_LSS_XNOR2X6 U285 ( .A(seq_in[0]), .B(seq_in[1]), .Z(n121) );
  HS65_LSS_XNOR2X6 U286 ( .A(seq_in[8]), .B(seq_in[9]), .Z(n113) );
  HS65_LSS_XNOR2X6 U287 ( .A(seq_in[14]), .B(seq_in[15]), .Z(n117) );
  HS65_LSS_XNOR2X6 U288 ( .A(seq_in[12]), .B(seq_in[13]), .Z(n116) );
  HS65_LS_NAND2X7 U289 ( .A(seq_in[1]), .B(seq_in[0]), .Z(n89) );
  HS65_LS_AND2X4 U290 ( .A(seq_in[3]), .B(seq_in[2]), .Z(n88) );
  HS65_LSS_XNOR3X2 U292 ( .A(n153), .B(n164), .C(n162), .Z(n59) );
  HS65_LS_PAO2X4 U293 ( .A(n49), .B(n47), .P(n48), .Z(n60) );
  HS65_LSS_XOR2X3 U295 ( .A(n181), .B(n182), .Z(n17) );
  HS65_LS_PAOI2X1 U296 ( .A(n167), .B(n150), .P(n21), .Z(n18) );
  HS65_LS_NOR2X2 U297 ( .A(n180), .B(n23), .Z(n19) );
  HS65_LSS_XNOR2X6 U298 ( .A(seq_in[26]), .B(seq_in[27]), .Z(n132) );
  HS65_LSS_XNOR2X6 U299 ( .A(seq_in[22]), .B(seq_in[23]), .Z(n143) );
  HS65_LSS_XNOR2X6 U300 ( .A(seq_in[24]), .B(seq_in[25]), .Z(n131) );
  HS65_LSS_XNOR2X6 U301 ( .A(seq_in[20]), .B(seq_in[21]), .Z(n142) );
  HS65_LSS_XNOR2X6 U302 ( .A(seq_in[28]), .B(seq_in[29]), .Z(n135) );
  HS65_LSS_XNOR2X6 U303 ( .A(seq_in[18]), .B(seq_in[19]), .Z(n140) );
  HS65_LSS_XNOR2X6 U304 ( .A(seq_in[16]), .B(seq_in[17]), .Z(n139) );
  HS65_LSS_XNOR2X6 U305 ( .A(seq_in[30]), .B(seq_in[31]), .Z(n134) );
  HS65_LS_NAND2X7 U306 ( .A(seq_in[9]), .B(seq_in[8]), .Z(n98) );
  HS65_LS_NAND2X7 U307 ( .A(seq_in[25]), .B(seq_in[24]), .Z(n76) );
  HS65_LS_NAND2X7 U308 ( .A(seq_in[29]), .B(seq_in[28]), .Z(n74) );
  HS65_LS_NAND2X7 U309 ( .A(seq_in[17]), .B(seq_in[16]), .Z(n68) );
  HS65_LS_NAND2X7 U310 ( .A(seq_in[21]), .B(seq_in[20]), .Z(n66) );
  HS65_LS_NAND2X7 U311 ( .A(seq_in[5]), .B(seq_in[4]), .Z(n87) );
  HS65_LS_NAND2X7 U312 ( .A(seq_in[13]), .B(seq_in[12]), .Z(n96) );
  HS65_LS_NOR2X6 U313 ( .A(rst), .B(n145), .Z(count_out_0) );
  HS65_LSS_XNOR2X3 U314 ( .A(n184), .B(n183), .Z(n145) );
  HS65_LSS_XOR3X2 U316 ( .A(n48), .B(n49), .C(n165), .Z(n107) );
  HS65_LS_NAND2X7 U317 ( .A(n106), .B(n105), .Z(n108) );
  HS65_LS_AND2X4 U318 ( .A(seq_in[11]), .B(seq_in[10]), .Z(n97) );
  HS65_LS_AND2X4 U319 ( .A(seq_in[27]), .B(seq_in[26]), .Z(n75) );
  HS65_LS_AND2X4 U320 ( .A(seq_in[31]), .B(seq_in[30]), .Z(n73) );
  HS65_LS_AND2X4 U321 ( .A(seq_in[19]), .B(seq_in[18]), .Z(n67) );
  HS65_LS_AND2X4 U322 ( .A(seq_in[23]), .B(seq_in[22]), .Z(n65) );
  HS65_LS_AND2X4 U323 ( .A(seq_in[7]), .B(seq_in[6]), .Z(n86) );
  HS65_LS_AND2X4 U324 ( .A(seq_in[15]), .B(seq_in[14]), .Z(n95) );
  HS65_LS_AND3X9 U325 ( .A(n181), .B(\reg_in/N1 ), .C(n182), .Z(count_out_5)
         );
  HS65_LS_AND2X4 U326 ( .A(word_in[31]), .B(\reg_in/N1 ), .Z(seq_in[31]) );
  HS65_LS_AND2X4 U327 ( .A(word_in[30]), .B(\reg_in/N1 ), .Z(seq_in[30]) );
  HS65_LS_AND2X4 U328 ( .A(word_in[29]), .B(\reg_in/N1 ), .Z(seq_in[29]) );
  HS65_LS_AND2X4 U329 ( .A(word_in[28]), .B(\reg_in/N1 ), .Z(seq_in[28]) );
  HS65_LS_AND2X4 U330 ( .A(word_in[27]), .B(\reg_in/N1 ), .Z(seq_in[27]) );
  HS65_LS_AND2X4 U331 ( .A(word_in[26]), .B(\reg_in/N1 ), .Z(seq_in[26]) );
  HS65_LS_AND2X4 U332 ( .A(word_in[25]), .B(\reg_in/N1 ), .Z(seq_in[25]) );
  HS65_LS_AND2X4 U333 ( .A(word_in[24]), .B(\reg_in/N1 ), .Z(seq_in[24]) );
  HS65_LS_AND2X4 U334 ( .A(word_in[23]), .B(\reg_in/N1 ), .Z(seq_in[23]) );
  HS65_LS_AND2X4 U335 ( .A(word_in[22]), .B(\reg_in/N1 ), .Z(seq_in[22]) );
  HS65_LS_AND2X4 U336 ( .A(word_in[21]), .B(\reg_in/N1 ), .Z(seq_in[21]) );
  HS65_LS_AND2X4 U337 ( .A(word_in[20]), .B(\reg_in/N1 ), .Z(seq_in[20]) );
  HS65_LS_AND2X4 U338 ( .A(word_in[19]), .B(\reg_in/N1 ), .Z(seq_in[19]) );
  HS65_LS_AND2X4 U339 ( .A(word_in[18]), .B(\reg_in/N1 ), .Z(seq_in[18]) );
  HS65_LS_AND2X4 U340 ( .A(word_in[17]), .B(\reg_in/N1 ), .Z(seq_in[17]) );
  HS65_LS_AND2X4 U341 ( .A(word_in[16]), .B(\reg_in/N1 ), .Z(seq_in[16]) );
  HS65_LS_AND2X4 U342 ( .A(word_in[15]), .B(\reg_in/N1 ), .Z(seq_in[15]) );
  HS65_LS_AND2X4 U343 ( .A(word_in[14]), .B(\reg_in/N1 ), .Z(seq_in[14]) );
  HS65_LS_AND2X4 U344 ( .A(word_in[13]), .B(\reg_in/N1 ), .Z(seq_in[13]) );
  HS65_LS_AND2X4 U345 ( .A(word_in[12]), .B(\reg_in/N1 ), .Z(seq_in[12]) );
  HS65_LS_AND2X4 U346 ( .A(word_in[11]), .B(\reg_in/N1 ), .Z(seq_in[11]) );
  HS65_LS_AND2X4 U347 ( .A(word_in[10]), .B(\reg_in/N1 ), .Z(seq_in[10]) );
  HS65_LS_AND2X4 U348 ( .A(word_in[9]), .B(\reg_in/N1 ), .Z(seq_in[9]) );
  HS65_LS_AND2X4 U349 ( .A(word_in[8]), .B(\reg_in/N1 ), .Z(seq_in[8]) );
  HS65_LS_AND2X4 U350 ( .A(word_in[7]), .B(\reg_in/N1 ), .Z(seq_in[7]) );
  HS65_LS_AND2X4 U351 ( .A(word_in[6]), .B(\reg_in/N1 ), .Z(seq_in[6]) );
  HS65_LS_AND2X4 U352 ( .A(word_in[5]), .B(\reg_in/N1 ), .Z(seq_in[5]) );
  HS65_LS_AND2X4 U353 ( .A(word_in[4]), .B(\reg_in/N1 ), .Z(seq_in[4]) );
  HS65_LS_AND2X4 U354 ( .A(word_in[3]), .B(\reg_in/N1 ), .Z(seq_in[3]) );
  HS65_LS_AND2X4 U355 ( .A(word_in[2]), .B(\reg_in/N1 ), .Z(seq_in[2]) );
  HS65_LS_AND2X4 U356 ( .A(word_in[1]), .B(\reg_in/N1 ), .Z(seq_in[1]) );
  HS65_LS_AND2X4 U357 ( .A(word_in[0]), .B(\reg_in/N1 ), .Z(seq_in[0]) );
  HS65_LS_DFPQX4 clk_r_REG0_S1 ( .D(rst), .CP(clk), .Q(n188) );
  HS65_LS_DFPQX4 clk_r_REG1_S1 ( .D(\reg_in/N1 ), .CP(clk), .Q(n187) );
  HS65_LS_DFPQX4 clk_r_REG23_S1 ( .D(n4), .CP(clk), .Q(n186) );
  HS65_LS_DFPQX4 clk_r_REG25_S1 ( .D(n6), .CP(clk), .Q(n185) );
  HS65_LS_DFPQX4 clk_r_REG19_S1 ( .D(n106), .CP(clk), .Q(n184) );
  HS65_LS_DFPQX4 clk_r_REG40_S1 ( .D(n105), .CP(clk), .Q(n183) );
  HS65_LS_DFPQX4 clk_r_REG7_S1 ( .D(n16), .CP(clk), .Q(n182) );
  HS65_LS_DFPQX4 clk_r_REG37_S1 ( .D(n15), .CP(clk), .Q(n181) );
  HS65_LS_DFPQX4 clk_r_REG6_S1 ( .D(n22), .CP(clk), .Q(n180) );
  HS65_LS_DFPQX4 clk_r_REG36_S1 ( .D(n53), .CP(clk), .Q(n179) );
  HS65_LS_DFPQX4 clk_r_REG22_S1 ( .D(n30), .CP(clk), .Q(n178) );
  HS65_LS_DFPQX4 clk_r_REG29_S1 ( .D(n93), .CP(clk), .Q(n177) );
  HS65_LS_DFPQX4 clk_r_REG18_S1 ( .D(n101), .CP(clk), .Q(n176) );
  HS65_LS_DFPQX4 clk_r_REG39_S1 ( .D(n79), .CP(clk), .Q(n175) );
  HS65_LS_DFPQX4 clk_r_REG2_S1 ( .D(n28), .CP(clk), .Q(n174) );
  HS65_LS_DFPQX4 clk_r_REG17_S1 ( .D(n109), .CP(clk), .Q(n173) );
  HS65_LS_DFPQX4 clk_r_REG38_S1 ( .D(n127), .CP(clk), .Q(n172) );
  HS65_LS_DFPQX4 clk_r_REG28_S1 ( .D(n94), .CP(clk), .Q(n171) );
  HS65_LS_DFPQX4 clk_r_REG26_S1 ( .D(n91), .CP(clk), .Q(n170) );
  HS65_LS_DFPQX4 clk_r_REG4_S1 ( .D(n40), .CP(clk), .Q(n169) );
  HS65_LS_DFPQX4 clk_r_REG8_S2 ( .D(n17), .CP(clk), .Q(n168) );
  HS65_LS_DFPQX4 clk_r_REG3_S2 ( .D(n19), .CP(clk), .Q(n167) );
  HS65_LS_DFPQX4 clk_r_REG20_S1 ( .D(n108), .CP(clk), .Q(n165) );
  HS65_LS_DFPQX4 clk_r_REG11_S2 ( .D(n44), .CP(clk), .Q(n164) );
  HS65_LS_DFPQX4 clk_r_REG16_S2 ( .D(n46), .CP(clk), .Q(n163) );
  HS65_LS_DFPQX4 clk_r_REG34_S2 ( .D(n45), .CP(clk), .Q(n162) );
  HS65_LS_DFPQX4 clk_r_REG27_S1 ( .D(n102), .CP(clk), .Q(n161) );
  HS65_LS_DFPQX4 clk_r_REG32_S1 ( .D(n78), .CP(clk), .Q(n160) );
  HS65_LS_DFPQX4 clk_r_REG13_S1 ( .D(n29), .CP(clk), .Q(n159) );
  HS65_LS_DFPQX4 clk_r_REG42_S1 ( .D(n80), .CP(clk), .Q(n158) );
  HS65_LS_DFPQX4 clk_r_REG31_S1 ( .D(n128), .CP(clk), .Q(n157) );
  HS65_LS_DFPQX4 clk_r_REG12_S1 ( .D(n27), .CP(clk), .Q(n156) );
  HS65_LS_DFPQX4 clk_r_REG24_S1 ( .D(n90), .CP(clk), .Q(n155) );
  HS65_LS_DFPQX4 clk_r_REG30_S1 ( .D(n92), .CP(clk), .Q(n154) );
  HS65_LS_DFPQX4 clk_r_REG15_S2 ( .D(n60), .CP(clk), .Q(n153) );
  HS65_LS_DFPQX4 clk_r_REG14_S2 ( .D(n107), .CP(clk), .Q(n152) );
  HS65_LS_DFPQX4 clk_r_REG33_S2 ( .D(n20), .CP(clk), .Q(n150) );
  HS65_LS_DFPQX4 clk_r_REG35_S1 ( .D(n52), .CP(clk), .Q(n149) );
  HS65_LS_DFPQX4 clk_r_REG41_S1 ( .D(n51), .CP(clk), .Q(n148) );
  HS65_LS_DFPQX4 clk_r_REG10_S1 ( .D(n43), .CP(clk), .Q(n147) );
  HS65_LS_DFPQX4 clk_r_REG5_S2 ( .D(n38), .CP(clk), .Q(n146) );
  HS65_LSS_DFPQX18 clk_r_REG21_S1 ( .D(count_out_0), .CP(clk), .Q(n166) );
  HS65_LSS_DFPQX18 clk_r_REG9_S1 ( .D(count_out_5), .CP(clk), .Q(n151) );
  HS65_LS_OA12X18 U277 ( .A(n168), .B(n18), .C(n187), .Z(count_out[4]) );
  HS65_LS_AND2ABX18 U291 ( .A(n188), .B(n152), .Z(count_out[1]) );
  HS65_LS_AND2ABX18 U294 ( .A(n188), .B(n37), .Z(count_out[3]) );
  HS65_LS_AND2ABX18 U315 ( .A(n188), .B(n59), .Z(count_out[2]) );
endmodule

