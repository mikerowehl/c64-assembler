10 rem ** global variables
20 tc = 0 : rem operation count
30 dim tm$(255) : rem table of mnemonic
40 dim tb%(255) : rem table of binary values
50 dim ts%(255) : rem table of sizes
60 ca = 49152 : rem current address

100 rem ** read in the instruction table
110 read tm$(tc)
120 if tm$(tc) = "x" then 200
130 read tb%(tc)
140 read ts%(tc)
150 tc = tc + 1
160 goto 100

200 rem ** start reading in instructions
210 print ca " : ";
220 input in$
230 if in$ = "x" then end
240 s = 0
250 if in$ = tm$(s) then 300
260 s = s + 1
270 if s = tc then print "unknown instruction":goto 200
280 goto 250

300 rem ** found instruction
310 bi = tb%(s) : rem binary instruction
320 os = ts%(s) : rem operation size
330 if os = 1 then 500

400 rem ** handle immediate value
410 input in$
420 if left$(in$,1) <> "$" then v = val(in$):goto 480
430 v = 0
440 for s = 2 to len(in$)
450 digit = asc(mid$(in$,s,1))
460 v = v * 16 + digit - 48 + ((digit >= 65) * 7)
470 next s
480 if os = 2 and v > 255 then print "value must be 255 or less":goto 400
490 if v > 65535 then print "value too large":goto 400

500 rem ** store the bytes in memory
510 poke ca, bi: ca = ca + 1
520 if os = 1 then 200
530 if os = 2 then poke ca, v: ca = ca + 1: goto 200
540 hb = int(v/256)
550 lb = v - (hb*256)
560 poke ca, lb:ca = ca + 1
570 poke ca, hb:ca = ca + 1
580 goto 200

2000 rem ** instruction table

2005 rem adc instruction
2010 data "adc#",105,2
2020 data "adcz",101,2
2030 data "adczx",117,2
2040 data "adca",109,3
2050 data "adcax",125,3
2060 data "adcay",121,3
2070 data "adcix",97,2
2080 data "adciy",113,2

2105 rem and instruction
2110 data "and#",41,2
2120 data "andz",37,2
2130 data "andzx",53,2
2140 data "anda",45,3
2150 data "andax",61,3
2160 data "anday",57,3
2170 data "andix",33,2
2180 data "andiy",49,2

2205 rem asl instruction
2210 data "asl",10,1
2220 data "aslz",6,2
2230 data "aslzx",22,2
2240 data "asla",14,3
2250 data "aslax",30,3

2305 rem bcc instruction
2310 data "bcc",144,2

2405 rem bcs instruction
2410 data "bcs",176,2

2505 rem beq instruction
2510 data "beq",240,2

2605 rem bit instruction
2610 data "bitz",36,2
2620 data "bita",44,3

2705 rem bmi instruction
2710 data "bmi",48,2

2805 rem bne instruction
2810 data "bne",208,2

2905 rem bpl instruction
2910 data "bpl",16,2

3005 rem brk instruction
3010 data "brk",0,1

3105 rem bvc instruction
3110 data "bvc",80,2

3205 rem bvs instruction
3210 data "bvs",112,2

3305 rem clc instruction
3310 data "clc",24,1

3405 rem cld instruction
3410 data "cld",216,1

3505 rem cli instruction
3510 data "cli",88,1

3605 rem clv instruction
3610 data "clv",184,1

3705 rem cmp instruction
3710 data "cmp#",201,2
3720 data "cmpz",197,2
3730 data "cmpzx",213,2
3740 data "cmpa",205,3
3750 data "cmpax",221,3
3760 data "cmpay",217,3
3770 data "cmpix",193,2
3780 data "cmpiy",209,2

3805 rem cpx instruction
3810 data "cpx#",224,2
3820 data "cpxz",228,2
3830 data "cpxa",236,3

3905 rem cpy instruction
3910 data "cpy#",192,2
3920 data "cpyz",196,2
3930 data "cpya",204,3

4005 rem dec instruction
4010 data "decz",198,2
4020 data "deczx",214,2
4030 data "deca",206,3
4040 data "decax",222,3

4105 rem dex instruction
4110 data "dex",202,1

4205 rem dey instruction
4210 data "dey",136,1

4305 rem eor instruction
4310 data "eor#",73,2
4320 data "eorz",69,2
4330 data "eorzx",85,2
4340 data "eora",77,3
4350 data "eorax",93,3
4360 data "eoray",89,3
4370 data "eorix",65,2
4380 data "eoriy",81,2

4405 rem inc instruction
4410 data "incz",230,2
4420 data "inczx",246,2
4430 data "inca",238,3
4440 data "incax",254,3

4505 rem inx instruction
4510 data "inx",232,1

4605 rem iny instruction
4610 data "iny",200,1

4705 rem jmp instruction
4710 data "jmpa",76,3
4720 data "jmpi",108,3

4805 rem jsr instruction
4810 data "jsr",32,3

4905 rem lda instruction
4910 data "lda#",169,2
4920 data "ldaz",165,2
4930 data "ldazx",181,2
4940 data "ldaa",173,3
4950 data "ldaax",189,3
4960 data "ldaay",185,3
4970 data "ldaix",161,2
4980 data "ldaiy",177,2

5005 rem ldx instruction
5010 data "ldx#",162,2
5020 data "ldxz",166,2
5030 data "ldxzy",182,2
5040 data "ldxa",174,3
5050 data "ldxay",190,3

5105 rem ldy instruction
5110 data "ldy#",160,2
5120 data "ldyz",164,2
5130 data "ldyzx",180,2
5140 data "ldya",172,3
5150 data "ldyax",188,3

5205 rem lsr instruction
5210 data "lsr",74,1
5220 data "lsrz",70,2
5230 data "lsrzx",86,2
5240 data "lsra",78,3
5250 data "lsrax",94,3

5305 rem nop instruction
5310 data "nop",234,1

5405 rem ora instruction
5410 data "ora#",9,2
5420 data "oraz",5,2
5430 data "orazx",21,2
5440 data "oraa",13,3
5450 data "oraax",29,3
5460 data "oraay",25,3
5470 data "oraix",1,2
5480 data "oraiy",17,2

5505 rem pha instruction
5510 data "pha",72,1

5605 rem php instruction
5610 data "php",8,1 : rem check this

5705 rem pla instruction
5710 data "pla",104,1

5805 rem plp instruction
5810 data "plp",40,1

5905 rem rol instruction
5910 data "rol",42,1
5920 data "rolz",38,2
5930 data "rolzx",54,2
5940 data "rola",46,3
5950 data "rolax",62,3

6005 rem ror instruction
6010 data "ror",106,1
6020 data "rorz",102,2
6030 data "rorzx",118,2
6040 data "rora",110,3
6050 data "rorax",126,3

6105 rem rti instruction
6110 data "rti",64,1

6205 rem rts instruction
6210 data "rts",96,1

6305 rem sbc instruction
6310 data "sbc#",233,2
6320 data "sbcz",229,2
6330 data "sbczx",245,2
6340 data "sbca",237,3
6350 data "sbcax",253,3
6360 data "sbcay",249,3
6370 data "sbcix",225,2
6380 data "sbciy",241,2

6405 rem sec instruction
6410 data "sec",56,1

6505 rem sed instruction
6510 data "sed",248,1

6605 rem sei instruction
6610 data "sei",120,1

6705 rem sta instruction
6710 data "staz",133,2
6720 data "stazx",149,2
6730 data "staa",141,3
6740 data "staax",157,3
6750 data "staay",153,3
6760 data "staix",129,2
6770 data "staiy",145,2

6805 rem stx instruction
6810 data "stxz",134,2
6820 data "stxzy",150,2
6830 data "stxa",142,3

6905 rem sty instruction
6910 data "styz",132,2
6920 data "styzx",148,2
6930 data "stya",140,3

7005 rem tax instruction
7010 data "tax",170,1

7105 rem tay instruction
7110 data "tay",168,1

7205 rem tsx instruction
7210 data "tsx",186,1

7305 rem txa instruction
7310 data "txa",138,1

7405 rem txs instruction
7410 data "txs",154,1

7505 rem tya instruction
7520 data "tya",152,1

9999 data "x"

