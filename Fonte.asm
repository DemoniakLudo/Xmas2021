	org	#C000

	Write	direct	"fonte.bin"

; Lettre = Largeurx21
SpriteLettres
	DW	Char_SPC,Char_Exclamation,Char_SPC,Char_Candy,Char_SPC,Char_SPC,Char_Et,Char_SPC
	DW	Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC
	DW	Char_0,Char_1,Char_2,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC
	DW	Char_SPC,Char_SPC,Char_DeuxPoint,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC
	DW	Char_Cadeau,Char_A,Char_B,Char_C,Char_D,Char_E,Char_F,Char_G,Char_H
	DW	Char_I,Char_J,Char_K,Char_L,Char_M,Char_N,Char_O,Char_P,Char_Q
	DW	Char_R,Char_S,Char_T,Char_U,Char_V,Char_W,Char_X,Char_Y,Char_Z

Char_SPC
	DB	2			; Largeur
	DS	42,#00		; Espace
Char_A
	DB	5
	DB	#00,#F0,#F0,#C0,#00
	DB	#10,#1F,#EF,#2C,#00
	DB	#21,#3F,#CF,#1E,#00
	DB	#43,#7F,#0F,#0F,#80
	DB	#43,#0F,#E1,#2F,#80
	DB	#87,#1E,#10,#3F,#48
	DB	#87,#2C,#00,#B7,#48
	DB	#87,#48,#00,#53,#48
	DB	#A7,#48,#00,#43,#48
	DB	#B7,#48,#00,#43,#48
	DB	#B7,#48,#00,#43,#48
	DB	#B7,#78,#F0,#C3,#48
	DB	#B7,#0F,#0F,#1F,#48
	DB	#97,#0F,#FF,#1F,#48
	DB	#87,#0F,#EF,#3F,#48
	DB	#87,#1F,#EF,#3F,#48
	DB	#87,#78,#F0,#87,#48
	DB	#87,#80,#00,#43,#48
	DB	#A7,#80,#00,#43,#48
	DB	#B7,#80,#00,#43,#48
	DB	#70,#00,#00,#30,#80
Char_B
	DB	5
	DB	#F0,#F0,#F0,#00,#00
	DB	#87,#FF,#0F,#80,#00
	DB	#97,#EF,#0F,#48,#00
	DB	#87,#0F,#0F,#AC,#00
	DB	#87,#F0,#C3,#EC,#00
	DB	#87,#80,#21,#EC,#00
	DB	#C7,#F0,#C3,#EC,#00
	DB	#C7,#0F,#0F,#EC,#00
	DB	#E7,#3F,#8F,#C8,#00
	DB	#A7,#7F,#1F,#E8,#00
	DB	#87,#0F,#0F,#7E,#00
	DB	#87,#F0,#F0,#1E,#00
	DB	#87,#80,#00,#87,#80
	DB	#87,#80,#00,#87,#80
	DB	#C7,#80,#00,#87,#80
	DB	#C7,#80,#00,#C7,#80
	DB	#E7,#F0,#F0,#7E,#00
	DB	#A7,#0F,#0F,#7E,#00
	DB	#87,#3F,#8F,#EC,#00
	DB	#87,#7F,#1F,#C8,#00
	DB	#F0,#F0,#F0,#80,#00
Char_C
	DB	4
	DB	#00,#F0,#E0,#00
	DB	#30,#0F,#1E,#80
	DB	#43,#3F,#9F,#68
	DB	#43,#7F,#1F,#DE
	DB	#C7,#0F,#0F,#FE
	DB	#E7,#3C,#F0,#1E
	DB	#E7,#48,#00,#96
	DB	#C7,#80,#00,#60
	DB	#87,#80,#00,#00
	DB	#87,#80,#00,#00
	DB	#87,#80,#00,#00
	DB	#87,#80,#00,#00
	DB	#C7,#80,#00,#00
	DB	#C7,#80,#00,#C0
	DB	#E7,#48,#10,#2C
	DB	#B7,#3C,#E1,#DE
	DB	#53,#0F,#0F,#5E
	DB	#43,#1F,#CF,#2C
	DB	#21,#0F,#EF,#48
	DB	#10,#87,#0F,#80
	DB	#00,#70,#F0,#00
Char_D
	DB	5
	DB	#F0,#F0,#E0,#00,#00
	DB	#87,#0F,#1E,#80,#00
	DB	#B7,#8F,#CF,#48,#00
	DB	#B7,#0F,#6F,#2C,#00
	DB	#A7,#0F,#0F,#1E,#00
	DB	#87,#78,#E1,#0F,#80
	DB	#87,#48,#10,#7F,#48
	DB	#87,#48,#00,#B7,#48
	DB	#87,#48,#00,#97,#AC
	DB	#A7,#48,#00,#43,#2C
	DB	#B7,#48,#00,#43,#2C
	DB	#B7,#48,#00,#43,#2C
	DB	#97,#48,#00,#97,#2C
	DB	#87,#48,#00,#B7,#48
	DB	#87,#48,#10,#3F,#48
	DB	#87,#78,#E1,#3F,#48
	DB	#87,#0F,#0F,#6F,#80
	DB	#A7,#0F,#EF,#1E,#00
	DB	#B7,#1F,#CF,#2C,#00
	DB	#97,#0F,#0F,#48,#00
	DB	#F0,#F0,#F0,#80,#00
Char_E
	DB	5
	DB	#F0,#F0,#F0,#F0,#00
	DB	#87,#CF,#0F,#EF,#80
	DB	#97,#8F,#1F,#CF,#80
	DB	#97,#0F,#0F,#0F,#80
	DB	#87,#0F,#0F,#0F,#80
	DB	#87,#78,#F0,#F0,#00
	DB	#C7,#48,#00,#00,#00
	DB	#E7,#78,#C0,#00,#00
	DB	#E7,#0F,#2C,#00,#00
	DB	#A7,#1F,#DE,#00,#00
	DB	#87,#3F,#9E,#00,#00
	DB	#87,#0F,#2C,#00,#00
	DB	#87,#78,#C0,#00,#00
	DB	#87,#48,#00,#00,#00
	DB	#87,#48,#00,#00,#00
	DB	#C7,#78,#F0,#F0,#00
	DB	#E7,#0F,#0F,#0F,#80
	DB	#E7,#0F,#3F,#8F,#80
	DB	#B7,#0F,#7F,#0F,#80
	DB	#87,#0F,#0F,#0F,#80
	DB	#F0,#F0,#F0,#F0,#00
Char_F
	DB	4
	DB	#F0,#F0,#F0,#E0
	DB	#87,#0F,#0F,#1E
	DB	#97,#CF,#1F,#CF
	DB	#B7,#8F,#3F,#8F
	DB	#87,#0F,#0F,#1E
	DB	#87,#78,#F0,#E0
	DB	#87,#48,#00,#00
	DB	#A7,#78,#C0,#00
	DB	#B7,#0F,#2C,#00
	DB	#B7,#1F,#DE,#00
	DB	#97,#3F,#9E,#00
	DB	#87,#0F,#2C,#00
	DB	#87,#78,#C0,#00
	DB	#87,#48,#00,#00
	DB	#87,#48,#00,#00
	DB	#97,#48,#00,#00
	DB	#B7,#48,#00,#00
	DB	#B7,#48,#00,#00
	DB	#A7,#48,#00,#00
	DB	#87,#48,#00,#00
	DB	#70,#80,#00,#00
Char_G
	DB	5
	DB	#00,#70,#F0,#00,#00
	DB	#10,#87,#EF,#C0,#00
	DB	#21,#1F,#CF,#3C,#00
	DB	#43,#0F,#0F,#EF,#80
	DB	#A7,#0F,#0F,#3F,#80
	DB	#B7,#1E,#F0,#0F,#80
	DB	#F7,#2C,#00,#C3,#80
	DB	#E7,#2C,#00,#30,#00
	DB	#A7,#48,#00,#00,#00
	DB	#87,#48,#F0,#F0,#00
	DB	#87,#58,#0F,#0F,#80
	DB	#87,#69,#6F,#1F,#48
	DB	#87,#69,#CF,#3F,#48
	DB	#E7,#58,#0F,#3F,#48
	DB	#F7,#2C,#F0,#B7,#48
	DB	#73,#BC,#F0,#B7,#48
	DB	#53,#8F,#0F,#1F,#48
	DB	#21,#0F,#0F,#0F,#80
	DB	#10,#0F,#6F,#1E,#00
	DB	#00,#D3,#CF,#2C,#00
	DB	#00,#30,#F0,#C0,#00
Char_H
	DB	5
	DB	#30,#00,#00,#30,#00
	DB	#43,#80,#00,#43,#80
	DB	#A7,#48,#00,#87,#48
	DB	#B7,#48,#00,#87,#48
	DB	#B7,#48,#00,#A7,#48
	DB	#97,#48,#00,#B7,#48
	DB	#87,#48,#00,#B7,#48
	DB	#87,#48,#00,#B7,#48
	DB	#87,#48,#00,#97,#48
	DB	#A7,#3C,#F0,#0F,#48
	DB	#B7,#0F,#0F,#0F,#48
	DB	#B7,#0F,#EF,#0F,#48
	DB	#97,#1F,#CF,#0F,#48
	DB	#87,#0F,#0F,#2F,#48
	DB	#87,#3C,#F0,#3F,#48
	DB	#87,#48,#00,#B7,#48
	DB	#97,#48,#00,#97,#48
	DB	#B7,#48,#00,#87,#48
	DB	#A7,#48,#00,#87,#48
	DB	#87,#48,#00,#87,#48
	DB	#70,#80,#00,#70,#80
Char_I
	DB	2
	DB	#30,#C0
	DB	#53,#AC
	DB	#53,#AC
	DB	#53,#2C
	DB	#43,#2C
	DB	#43,#2C
	DB	#43,#AC
	DB	#53,#AC
	DB	#53,#AC
	DB	#53,#2C
	DB	#43,#2C
	DB	#43,#2C
	DB	#43,#2C
	DB	#53,#2C
	DB	#53,#AC
	DB	#53,#AC
	DB	#43,#AC
	DB	#43,#2C
	DB	#53,#2C
	DB	#53,#AC
	DB	#30,#C0
	DB	#10,#E0
Char_J
	DB	4
	DB	#00,#00,#30,#C0
	DB	#00,#00,#43,#2C
	DB	#00,#00,#43,#2C
	DB	#00,#00,#43,#AC
	DB	#00,#00,#53,#AC
	DB	#00,#00,#53,#AC
	DB	#00,#00,#53,#2C
	DB	#00,#00,#43,#2C
	DB	#00,#00,#43,#2C
	DB	#00,#00,#43,#2C
	DB	#00,#00,#43,#AC
	DB	#30,#00,#53,#AC
	DB	#43,#80,#53,#AC
	DB	#97,#48,#53,#2C
	DB	#B7,#48,#43,#2C
	DB	#A7,#3C,#87,#2C
	DB	#87,#0F,#0F,#2C
	DB	#43,#0F,#EF,#48
	DB	#21,#1F,#CF,#48
	DB	#10,#87,#0F,#80
	DB	#00,#70,#F0,#00
Char_K
	DB	4
	DB	#30,#80,#70,#00
	DB	#73,#48,#A7,#80
	DB	#87,#58,#4F,#80
	DB	#87,#69,#1E,#00
	DB	#87,#0F,#1E,#00
	DB	#97,#1F,#AC,#00
	DB	#B7,#3F,#48,#00
	DB	#B7,#2F,#80,#00
	DB	#A7,#1E,#00,#00
	DB	#87,#2C,#00,#00
	DB	#87,#3C,#00,#00
	DB	#87,#0F,#C0,#00
	DB	#87,#4F,#2C,#00
	DB	#97,#6F,#1E,#00
	DB	#B7,#0F,#0F,#80
	DB	#B7,#69,#6F,#48
	DB	#A7,#58,#7F,#2C
	DB	#87,#48,#B7,#1E
	DB	#87,#48,#53,#1E
	DB	#87,#48,#21,#1E
	DB	#70,#80,#10,#E0
Char_L
	DB	4
	DB	#70,#80,#00,#00
	DB	#B7,#48,#00,#00
	DB	#97,#48,#00,#00
	DB	#87,#48,#00,#00
	DB	#87,#48,#00,#00
	DB	#87,#48,#00,#00
	DB	#A7,#48,#00,#00
	DB	#B7,#48,#00,#00
	DB	#B7,#48,#00,#00
	DB	#97,#48,#00,#00
	DB	#87,#48,#00,#00
	DB	#87,#48,#00,#00
	DB	#87,#48,#00,#00
	DB	#87,#48,#00,#00
	DB	#87,#2C,#00,#00
	DB	#A7,#1E,#F0,#E0
	DB	#B7,#0F,#0F,#1E
	DB	#B7,#0F,#3F,#9E
	DB	#97,#8F,#1F,#DE
	DB	#87,#8F,#0F,#1E
	DB	#70,#F0,#F0,#E0
Char_M
	DB	5
	DB	#70,#80,#00,#10,#E0
	DB	#87,#48,#00,#21,#1E
	DB	#A7,#48,#00,#21,#5E
	DB	#B7,#2C,#00,#43,#DE
	DB	#B7,#1E,#00,#87,#DE
	DB	#97,#2F,#90,#4F,#9E
	DB	#87,#3F,#69,#8F,#1E
	DB	#87,#1F,#1F,#8F,#1E
	DB	#87,#1F,#9F,#8F,#1E
	DB	#87,#4B,#9F,#AD,#1E
	DB	#A7,#69,#3F,#69,#5E
	DB	#B7,#58,#2F,#A1,#DE
	DB	#B7,#48,#96,#21,#DE
	DB	#B7,#48,#60,#21,#DE
	DB	#97,#48,#00,#21,#9E
	DB	#87,#48,#00,#21,#1E
	DB	#87,#48,#00,#21,#1E
	DB	#87,#48,#00,#21,#1E
	DB	#A7,#48,#00,#21,#1E
	DB	#B7,#48,#00,#21,#1E
	DB	#70,#80,#00,#10,#E0
Char_N
	DB	5
	DB	#70,#80,#00,#10,#E0
	DB	#A7,#48,#00,#21,#DE
	DB	#B7,#2C,#00,#21,#5E
	DB	#B7,#1E,#00,#21,#1E
	DB	#97,#0F,#80,#21,#1E
	DB	#87,#2F,#48,#21,#5E
	DB	#87,#2F,#2C,#21,#DE
	DB	#87,#3F,#1E,#21,#DE
	DB	#87,#1F,#0F,#A1,#9E
	DB	#A7,#0F,#0F,#4B,#1E
	DB	#B7,#2D,#6F,#0F,#1E
	DB	#B7,#58,#3F,#0F,#1E
	DB	#B7,#48,#97,#0F,#1E
	DB	#97,#48,#43,#3F,#1E
	DB	#87,#48,#21,#3F,#9E
	DB	#87,#48,#10,#1F,#9E
	DB	#87,#48,#00,#87,#9E
	DB	#87,#48,#00,#43,#1E
	DB	#A7,#48,#00,#21,#1E
	DB	#B7,#48,#00,#10,#1E
	DB	#70,#80,#00,#00,#E0
Char_O
	DB	5
	DB	#00,#70,#F0,#E0,#00
	DB	#00,#87,#0F,#DE,#00
	DB	#10,#7F,#1F,#EF,#80
	DB	#21,#6F,#0F,#7F,#48
	DB	#21,#CF,#0F,#1F,#48
	DB	#43,#5E,#F0,#87,#2C
	DB	#43,#2C,#00,#43,#2C
	DB	#87,#48,#00,#21,#9E
	DB	#87,#48,#00,#21,#DE
	DB	#A7,#48,#00,#21,#DE
	DB	#B7,#48,#00,#21,#5E
	DB	#B7,#48,#00,#21,#1E
	DB	#B7,#48,#00,#21,#1E
	DB	#97,#48,#00,#21,#1E
	DB	#43,#2C,#00,#43,#2C
	DB	#43,#1E,#F0,#97,#AC
	DB	#21,#0F,#0F,#3F,#C8
	DB	#21,#3F,#8F,#3F,#48
	DB	#10,#1F,#CF,#2F,#80
	DB	#00,#87,#0F,#1E,#00
	DB	#00,#70,#F0,#E0,#00
Char_P
	DB	5
	DB	#70,#F0,#F0,#C0,#00
	DB	#87,#0F,#0F,#2C,#00
	DB	#87,#7F,#0F,#1E,#00
	DB	#87,#3F,#8F,#4F,#80
	DB	#87,#0F,#0F,#2F,#48
	DB	#A7,#3C,#F0,#3F,#48
	DB	#B7,#48,#00,#B7,#48
	DB	#B7,#3C,#F0,#7F,#48
	DB	#97,#0F,#EF,#6F,#80
	DB	#87,#1F,#CF,#5E,#00
	DB	#87,#0F,#0F,#2C,#00
	DB	#87,#0F,#0F,#48,#00
	DB	#87,#3C,#F0,#80,#00
	DB	#A7,#48,#00,#00,#00
	DB	#B7,#48,#00,#00,#00
	DB	#B7,#48,#00,#00,#00
	DB	#97,#48,#00,#00,#00
	DB	#87,#48,#00,#00,#00
	DB	#87,#48,#00,#00,#00
	DB	#87,#48,#00,#00,#00
	DB	#70,#80,#00,#00,#00
Char_Q
	DB	5
	DB	#00,#30,#F0,#C0,#00
	DB	#00,#C3,#0F,#FC,#00
	DB	#10,#2F,#1F,#FF,#80
	DB	#21,#6F,#0F,#6F,#48
	DB	#21,#6F,#0F,#0F,#48
	DB	#43,#5E,#F0,#87,#2C
	DB	#43,#2C,#00,#43,#2C
	DB	#43,#2C,#00,#43,#6C
	DB	#87,#48,#00,#21,#7E
	DB	#A7,#48,#00,#21,#7E
	DB	#B7,#48,#00,#21,#3E
	DB	#B7,#48,#00,#21,#1E
	DB	#B7,#48,#00,#21,#1E
	DB	#97,#AC,#00,#43,#1E
	DB	#43,#1E,#00,#A7,#1E
	DB	#43,#0F,#F0,#7F,#1E
	DB	#21,#0F,#0F,#3F,#E8
	DB	#10,#3F,#CF,#1F,#1E
	DB	#00,#87,#EF,#0F,#5E
	DB	#00,#61,#0F,#3C,#DE
	DB	#00,#10,#F0,#C0,#E0
Char_R
	DB	4
	DB	#70,#F0,#F0,#80
	DB	#87,#0F,#0F,#48
	DB	#87,#7F,#8F,#2C
	DB	#87,#3F,#CF,#1E
	DB	#87,#0F,#0F,#3E
	DB	#A7,#3C,#E1,#7E
	DB	#A7,#48,#10,#7E
	DB	#B7,#3C,#E1,#5E
	DB	#B7,#1F,#CF,#2C
	DB	#97,#3F,#8F,#48
	DB	#87,#0F,#0F,#80
	DB	#87,#3C,#B7,#48
	DB	#87,#48,#97,#C8
	DB	#87,#48,#97,#AC
	DB	#A7,#48,#53,#2C
	DB	#B7,#48,#43,#2C
	DB	#B7,#48,#21,#1E
	DB	#97,#48,#21,#5E
	DB	#87,#48,#10,#3E
	DB	#87,#48,#10,#3E
	DB	#70,#80,#00,#E0
Char_S
	DB	4
	DB	#10,#F0,#F0,#80
	DB	#21,#1F,#EF,#48
	DB	#43,#3F,#8F,#2C
	DB	#87,#0F,#0F,#1E
	DB	#97,#3C,#97,#9E
	DB	#97,#48,#53,#DE
	DB	#97,#48,#21,#DE
	DB	#87,#3C,#10,#2C
	DB	#43,#1F,#F0,#C0
	DB	#30,#1F,#EF,#C0
	DB	#00,#C3,#2F,#2C
	DB	#30,#30,#C3,#1E
	DB	#43,#80,#21,#1E
	DB	#B7,#48,#21,#1E
	DB	#87,#48,#21,#5E
	DB	#87,#3C,#C3,#FE
	DB	#87,#0F,#0F,#7E
	DB	#43,#0F,#0F,#6C
	DB	#21,#7F,#0F,#48
	DB	#10,#3F,#9E,#80
	DB	#00,#F0,#E0,#00
Char_T
	DB	5
	DB	#70,#F0,#F0,#F0,#C0
	DB	#87,#0F,#0F,#0F,#2C
	DB	#B7,#1F,#CF,#3F,#AC
	DB	#E7,#3F,#8F,#7F,#2C
	DB	#87,#0F,#0F,#0F,#2C
	DB	#70,#E1,#2F,#78,#C0
	DB	#00,#10,#6F,#80,#00
	DB	#00,#10,#6F,#80,#00
	DB	#00,#10,#6F,#80,#00
	DB	#00,#10,#4F,#80,#00
	DB	#00,#10,#0F,#80,#00
	DB	#00,#10,#0F,#80,#00
	DB	#00,#10,#0F,#80,#00
	DB	#00,#10,#2F,#80,#00
	DB	#00,#10,#6F,#80,#00
	DB	#00,#10,#6F,#80,#00
	DB	#00,#10,#4F,#80,#00
	DB	#00,#10,#0F,#80,#00
	DB	#00,#10,#0F,#80,#00
	DB	#00,#10,#0F,#80,#00
	DB	#00,#00,#F0,#00,#00
Char_U
	DB	5
	DB	#70,#80,#00,#30,#C0
	DB	#87,#48,#00,#53,#AC
	DB	#87,#48,#00,#53,#AC
	DB	#87,#48,#00,#43,#AC
	DB	#A7,#48,#00,#43,#2C
	DB	#B7,#48,#00,#43,#2C
	DB	#B7,#48,#00,#43,#2C
	DB	#97,#48,#00,#53,#2C
	DB	#87,#48,#00,#53,#AC
	DB	#87,#48,#00,#53,#AC
	DB	#87,#48,#00,#53,#AC
	DB	#87,#48,#00,#53,#AC
	DB	#A7,#48,#00,#43,#AC
	DB	#B7,#48,#00,#43,#2C
	DB	#B7,#2C,#00,#87,#2C
	DB	#97,#9E,#F0,#0F,#2C
	DB	#43,#0F,#0F,#0F,#48
	DB	#21,#0F,#7F,#8F,#80
	DB	#21,#0F,#FF,#0F,#80
	DB	#10,#87,#0F,#3C,#00
	DB	#00,#70,#F0,#C0,#00
Char_V
	DB	5
	DB	#70,#80,#00,#30,#C0
	DB	#87,#48,#00,#53,#AC
	DB	#87,#48,#00,#53,#AC
	DB	#87,#48,#00,#43,#AC
	DB	#A7,#48,#00,#43,#2C
	DB	#B7,#48,#00,#43,#2C
	DB	#B7,#48,#00,#43,#2C
	DB	#97,#48,#00,#53,#2C
	DB	#87,#48,#00,#53,#AC
	DB	#87,#48,#00,#53,#AC
	DB	#87,#2C,#00,#87,#AC
	DB	#53,#AC,#00,#87,#48
	DB	#43,#9E,#10,#0F,#48
	DB	#21,#DE,#10,#6F,#80
	DB	#21,#0F,#E1,#4F,#80
	DB	#10,#0F,#0F,#1E,#00
	DB	#00,#87,#2F,#2C,#00
	DB	#00,#43,#EF,#48,#00
	DB	#00,#21,#0F,#80,#00
	DB	#00,#10,#1E,#00,#00
	DB	#00,#00,#E0,#00,#00
Char_W
	DB	5
	DB	#70,#80,#00,#10,#E0
	DB	#87,#48,#00,#21,#1E
	DB	#87,#48,#00,#21,#1E
	DB	#87,#48,#00,#21,#1E
	DB	#87,#48,#00,#21,#1E
	DB	#87,#48,#00,#21,#1E
	DB	#87,#48,#00,#21,#1E
	DB	#97,#48,#60,#21,#9E
	DB	#B7,#48,#96,#21,#DE
	DB	#B7,#58,#4F,#A1,#DE
	DB	#B7,#2D,#CF,#4B,#DE
	DB	#B7,#1F,#8F,#0F,#DE
	DB	#A7,#1F,#8F,#0F,#5E
	DB	#87,#1F,#8F,#2F,#1E
	DB	#87,#1F,#69,#EF,#1E
	DB	#87,#2F,#90,#6F,#1E
	DB	#A7,#1E,#00,#A7,#5E
	DB	#B7,#2C,#00,#43,#DE
	DB	#B7,#48,#00,#21,#DE
	DB	#B7,#48,#00,#21,#DE
	DB	#70,#80,#00,#10,#E0
Char_X
	DB	5
	DB	#70,#80,#00,#10,#E0
	DB	#A7,#48,#00,#21,#1E
	DB	#B7,#2C,#00,#43,#9E
	DB	#97,#1E,#00,#97,#9E
	DB	#43,#2F,#90,#1F,#2C
	DB	#21,#3F,#69,#8F,#48
	DB	#10,#3F,#1F,#8F,#80
	DB	#00,#97,#1F,#1E,#00
	DB	#00,#43,#0F,#2C,#00
	DB	#00,#21,#4F,#48,#00
	DB	#00,#10,#6F,#80,#00
	DB	#00,#21,#6F,#48,#00
	DB	#00,#43,#2F,#2C,#00
	DB	#00,#97,#0F,#1E,#00
	DB	#10,#3F,#0F,#0F,#80
	DB	#21,#2F,#69,#2F,#48
	DB	#43,#6F,#90,#3F,#2C
	DB	#87,#1E,#00,#97,#9E
	DB	#A7,#2C,#00,#53,#1E
	DB	#B7,#48,#00,#21,#1E
	DB	#70,#80,#00,#10,#E0
Char_Y
	DB	5
	DB	#70,#80,#00,#70,#80
	DB	#87,#48,#00,#87,#48
	DB	#87,#48,#00,#87,#48
	DB	#87,#C8,#00,#A7,#48
	DB	#53,#EC,#10,#6F,#80
	DB	#43,#EC,#10,#6F,#80
	DB	#21,#9E,#21,#DE,#00
	DB	#21,#9E,#21,#1E,#00
	DB	#10,#0F,#C3,#2C,#00
	DB	#10,#0F,#0F,#2C,#00
	DB	#00,#97,#0F,#48,#00
	DB	#00,#97,#8F,#48,#00
	DB	#00,#53,#CF,#80,#00
	DB	#00,#43,#CF,#80,#00
	DB	#00,#21,#DE,#00,#00
	DB	#00,#21,#5E,#00,#00
	DB	#00,#21,#1E,#00,#00
	DB	#00,#21,#1E,#00,#00
	DB	#00,#21,#1E,#00,#00
	DB	#00,#21,#1E,#00,#00
	DB	#00,#10,#E0,#00,#00
Char_Z
	DB	5
	DB	#70,#F0,#F0,#F0,#E0
	DB	#87,#0F,#0F,#0F,#1E
	DB	#B7,#0F,#EF,#1F,#DE
	DB	#F7,#1F,#CF,#7F,#9E
	DB	#87,#0F,#0F,#1F,#9E
	DB	#70,#F0,#C3,#0F,#2C
	DB	#00,#00,#21,#0F,#48
	DB	#00,#00,#43,#CF,#80
	DB	#00,#00,#B7,#9E,#00
	DB	#00,#10,#3F,#2C,#00
	DB	#00,#21,#6F,#48,#00
	DB	#00,#43,#0F,#80,#00
	DB	#00,#87,#1E,#00,#00
	DB	#10,#2F,#2C,#00,#00
	DB	#21,#3F,#48,#00,#00
	DB	#43,#7F,#78,#F0,#E0
	DB	#87,#7F,#0F,#0F,#1E
	DB	#87,#EF,#0F,#7F,#9E
	DB	#87,#0F,#0F,#FF,#1E
	DB	#87,#0F,#0F,#0F,#1E
	DB	#70,#F0,#F0,#F0,#E0
Char_0
	DB	5
	DB	#00,#70,#F0,#80,#00
	DB	#00,#87,#1F,#C8,#00
	DB	#10,#EF,#3F,#EC,#00
	DB	#21,#CF,#0F,#FE,#00
	DB	#31,#8F,#E1,#3E,#00
	DB	#43,#9E,#10,#0F,#80
	DB	#43,#2C,#21,#0F,#80
	DB	#87,#48,#43,#1F,#48
	DB	#87,#80,#97,#3D,#C8
	DB	#C7,#90,#3F,#79,#C8
	DB	#E7,#A1,#0F,#A1,#C8
	DB	#E7,#D3,#1E,#21,#48
	DB	#E7,#A7,#2C,#21,#48
	DB	#B7,#0F,#48,#43,#48
	DB	#43,#0F,#80,#87,#80
	DB	#43,#1E,#10,#3F,#80
	DB	#21,#1E,#E1,#7E,#00
	DB	#21,#8F,#0F,#7E,#00
	DB	#10,#FF,#8F,#6C,#00
	DB	#00,#B7,#0F,#48,#00
	DB	#00,#70,#F0,#80,#00
Char_1
	DB	3	
	DB	#00,#30,#E0
	DB	#00,#53,#DE
	DB	#00,#B7,#9E
	DB	#10,#0F,#1E
	DB	#21,#0F,#1E
	DB	#53,#0F,#5E
	DB	#B7,#2D,#DE
	DB	#A7,#69,#DE
	DB	#87,#A1,#9E
	DB	#96,#21,#1E
	DB	#60,#21,#1E
	DB	#00,#21,#1E
	DB	#00,#21,#1E
	DB	#00,#21,#5E
	DB	#00,#21,#DE
	DB	#00,#21,#DE
	DB	#00,#21,#9E
	DB	#00,#21,#1E
	DB	#00,#21,#1E
	DB	#00,#21,#1E
	DB	#00,#10,#E0
Char_2
	DB	5
	DB	#30,#F0,#F0,#F0,#00
	DB	#43,#0F,#EF,#1F,#80
	DB	#87,#9F,#CF,#3F,#C8
	DB	#B7,#8F,#0F,#0F,#2C
	DB	#B7,#0F,#0F,#0F,#2C
	DB	#87,#1E,#E1,#0F,#6C
	DB	#43,#2C,#21,#0F,#2C
	DB	#30,#C0,#43,#4F,#48
	DB	#00,#00,#87,#CF,#80
	DB	#00,#10,#1F,#DE,#00
	DB	#00,#21,#1F,#AC,#00
	DB	#00,#43,#0F,#48,#00
	DB	#00,#87,#0F,#80,#00
	DB	#10,#0F,#1E,#10,#C0
	DB	#21,#2F,#2C,#21,#2C
	DB	#43,#6F,#3C,#C3,#1E
	DB	#87,#EF,#0F,#0F,#1E
	DB	#87,#EF,#0F,#0F,#5E
	DB	#87,#0F,#1F,#CF,#DE
	DB	#43,#0F,#3F,#CF,#9E
	DB	#30,#F0,#F0,#F0,#E0
Char_Candy
	DB	5
	DB	#00,#00,#00,#00,#00
	DB	#00,#00,#30,#F0,#00
	DB	#00,#00,#43,#0F,#80
	DB	#00,#00,#97,#8F,#48
	DB	#00,#10,#3F,#1F,#48
	DB	#00,#10,#2F,#1F,#AC
	DB	#00,#21,#0F,#C3,#AC
	DB	#00,#21,#1E,#21,#2C
	DB	#00,#43,#1E,#21,#2C
	DB	#00,#53,#AC,#43,#2C
	DB	#00,#97,#68,#43,#48
	DB	#00,#B7,#48,#30,#80
	DB	#10,#2F,#48,#00,#00
	DB	#10,#0F,#80,#00,#00
	DB	#21,#0F,#80,#00,#00
	DB	#21,#1E,#00,#00,#00
	DB	#53,#9E,#00,#00,#00
	DB	#53,#2C,#00,#00,#00
	DB	#B7,#2C,#00,#00,#00
	DB	#A7,#48,#00,#00,#00
	DB	#70,#80,#00,#00,#00
Char_DeuxPoint
	DB	2
	DB	#00,#00
	DB	#00,#00
	DB	#00,#00
	DB	#00,#00
	DB	#00,#00
	DB	#10,#80
	DB	#21,#C8
	DB	#21,#48
	DB	#21,#48
	DB	#31,#48
	DB	#10,#80
	DB	#00,#00
	DB	#10,#80
	DB	#21,#C8
	DB	#21,#C8
	DB	#21,#48
	DB	#21,#48
	DB	#10,#80
	DB	#00,#00
	DB	#00,#00
	DB	#00,#00
Char_Cadeau
	DB	6
	DB	#00,#33,#F8,#F0,#F0,#E0
	DB	#00,#76,#CF,#AB,#0F,#68
	DB	#00,#65,#5F,#77,#8F,#A4
	DB	#00,#77,#EE,#CF,#9E,#2C
	DB	#00,#D5,#55,#47,#ED,#2C
	DB	#10,#AA,#BB,#9F,#EB,#2C
	DB	#21,#1F,#57,#BF,#C5,#6C
	DB	#43,#2E,#8F,#FE,#2B,#A8
	DB	#F0,#D1,#70,#E1,#5D,#64
	DB	#87,#2E,#8F,#2D,#2A,#AC
	DB	#87,#1D,#07,#2D,#5D,#2C
	DB	#87,#2E,#8F,#2D,#AB,#2C
	DB	#87,#1D,#07,#3D,#45,#2C
	DB	#AA,#AA,#AA,#AA,#AB,#48
	DB	#55,#55,#55,#55,#4D,#80
	DB	#AA,#AA,#AA,#AB,#3A,#00
	DB	#87,#1D,#07,#2D,#6C,#00
	DB	#87,#2E,#8F,#2D,#48,#00
	DB	#87,#1D,#07,#2D,#80,#00
	DB	#87,#2E,#8F,#3C,#00,#00
	DB	#F0,#D1,#70,#E0,#00,#00
Char_Et
	DB	5
	DB	#00,#F0,#C0,#00,#00
	DB	#10,#0F,#2C,#00,#00
	DB	#21,#7F,#1E,#00,#00
	DB	#43,#0F,#8F,#80,#00
	DB	#87,#3C,#0F,#48,#00
	DB	#A7,#48,#97,#48,#00
	DB	#B7,#48,#B7,#48,#00
	DB	#97,#BC,#2F,#48,#00
	DB	#43,#8F,#0F,#80,#00
	DB	#21,#0F,#1E,#00,#00
	DB	#21,#0F,#2C,#00,#00
	DB	#10,#1F,#48,#30,#00
	DB	#10,#1F,#48,#43,#80
	DB	#21,#2F,#2C,#87,#48
	DB	#43,#0F,#1E,#0F,#80
	DB	#87,#3C,#0F,#1E,#00
	DB	#87,#48,#97,#AC,#00
	DB	#B7,#78,#B7,#68,#00
	DB	#97,#8F,#2F,#96,#00
	DB	#43,#0F,#1E,#0F,#80
	DB	#30,#F0,#E0,#F0,#00
Char_Exclamation
	DB	2
	DB	#30,#C0
	DB	#43,#2C
	DB	#53,#2C
	DB	#53,#AC
	DB	#53,#AC
	DB	#43,#AC
	DB	#43,#2C
	DB	#43,#2C
	DB	#43,#2C
	DB	#53,#2C
	DB	#53,#AC
	DB	#53,#AC
	DB	#43,#AC
	DB	#43,#2C
	DB	#30,#C0
	DB	#00,#00
	DB	#30,#C0
	DB	#43,#6C
	DB	#43,#6C
	DB	#43,#AC
	DB	#30,#C0
Char_Bonnet
	DB	5
	DB	#00,#00,#00,#00,#00
	DB	#00,#00,#70,#00,#00
	DB	#00,#00,#F7,#80,#00
	DB	#00,#00,#F7,#80,#00
	DB	#00,#00,#F0,#80,#00
	DB	#00,#10,#4B,#48,#00
	DB	#00,#21,#1E,#48,#00
	DB	#00,#43,#87,#2C,#00
	DB	#00,#87,#1E,#1E,#00
	DB	#00,#96,#0F,#0F,#80
	DB	#10,#0F,#2D,#2D,#48
	DB	#10,#2D,#0F,#0F,#48
	DB	#21,#0F,#2D,#1E,#2C
	DB	#21,#4B,#0F,#0F,#2C
	DB	#43,#4B,#2D,#1E,#2C
	DB	#70,#0F,#0F,#0F,#1E
	DB	#F6,#F0,#F0,#0F,#1E
	DB	#F7,#FF,#FC,#F0,#F0
	DB	#F7,#FF,#FF,#FF,#FE
	DB	#70,#FF,#FF,#FF,#FE
	DB	#00,#F0,#F0,#F0,#E0
Char_Bonhomme
	DB	6
	DB	#00,#00,#00,#00,#00,#00
	DB	#00,#00,#33,#EE,#00,#00
	DB	#00,#00,#77,#FF,#00,#00
	DB	#00,#00,#66,#BB,#00,#00
	DB	#10,#00,#77,#FF,#00,#60
	DB	#10,#00,#22,#22,#00,#C0
	DB	#B0,#11,#FF,#FF,#98,#80
	DB	#E0,#33,#FF,#F7,#DC,#E0
	DB	#30,#F7,#FF,#FF,#FC,#30
	DB	#00,#F1,#FF,#FF,#F9,#00
	DB	#00,#FC,#F7,#F7,#F3,#00
	DB	#00,#FF,#F3,#FE,#FF,#00
	DB	#00,#FF,#FF,#FF,#FF,#88
	DB	#00,#FF,#FF,#F7,#FF,#88
	DB	#00,#FF,#FF,#FF,#FF,#00
	DB	#00,#FF,#FF,#FF,#FF,#00
	DB	#00,#77,#FF,#FF,#EE,#00
	DB	#00,#77,#FF,#FF,#EE,#00
	DB	#00,#11,#FF,#FF,#88,#00
	DB	#00,#00,#33,#CC,#00,#00
	DB	#00,#00,#00,#00,#00,#00
Char_Botte
	DB	6
	DB	#00,#00,#F0,#F0,#80,#00
	DB	#00,#00,#F7,#FF,#80,#00
	DB	#00,#10,#FF,#FF,#C8,#00
	DB	#00,#10,#FF,#FF,#C8,#00
	DB	#00,#10,#FF,#FF,#C8,#00
	DB	#00,#00,#F7,#FF,#80,#00
	DB	#00,#00,#87,#0F,#80,#00
	DB	#00,#00,#87,#0F,#80,#00
	DB	#00,#00,#87,#0F,#80,#00
	DB	#00,#00,#87,#0F,#80,#00
	DB	#00,#00,#87,#0F,#80,#00
	DB	#10,#E0,#87,#0F,#48,#00
	DB	#21,#1E,#87,#0F,#2C,#00
	DB	#43,#0F,#4B,#0F,#1E,#00
	DB	#87,#0F,#2D,#0F,#0F,#80
	DB	#87,#0F,#0F,#0F,#0F,#80
	DB	#87,#0F,#0F,#0F,#0F,#80
	DB	#87,#0F,#0F,#0F,#0F,#80
	DB	#87,#0F,#0F,#0F,#0F,#80
	DB	#43,#0F,#0F,#0F,#1E,#00
	DB	#30,#F0,#F0,#F0,#E0,#00
