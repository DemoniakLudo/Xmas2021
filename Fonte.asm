	org	#C000

	Write	direct	"lettres.bin"

; Lettre = Largeurx21
SpriteLettres
	DW	Char_SPC,Char_Exclamation,Char_SPC,Char_Candy,Char_SPC,Char_SPC,Char_Et,Char_SPC
	DW	Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC
	DW	Char_0,Char_1,Char_2,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC
	DW	Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC,Char_SPC
	DW	Char_SPC,Char_A,Char_B,Char_C,Char_D,Char_E,Char_F,Char_G,Char_H
	DW	Char_I,Char_J,Char_K,Char_L,Char_M,Char_N,Char_O,Char_P,Char_Q
	DW	Char_R,Char_S,Char_T,Char_U,Char_V,Char_W,Char_X,Char_Y,Char_Z

Char_SPC
	DB	2			; Largeur
	DS	42,#00		; Espace
Char_Exclamation
	DB	3
	DB	#00,#47,#0C
	DB	#00,#CF,#0E
	DB	#00,#8F,#8E
	DB	#01,#0F,#4F
	DB	#01,#0E,#2F
	DB	#01,#4E,#07
	DB	#01,#CE,#00
	DB	#01,#CE,#00
	DB	#01,#8E,#00
	DB	#01,#0E,#00
	DB	#01,#0E,#00
	DB	#01,#4E,#00
	DB	#01,#CE,#00
	DB	#01,#8E,#00
	DB	#00,#00,#00
	DB	#00,#00,#00
	DB	#00,#0C,#00
	DB	#01,#8E,#00
	DB	#01,#8E,#00
	DB	#01,#4E,#00
	DB	#00,#0C,#00
Char_Et
	DB	5
	DB	#00,#07,#8E,#00,#00
	DB	#00,#3F,#8F,#00,#00
	DB	#01,#2F,#2F,#08,#00
	DB	#03,#0C,#17,#0C,#00
	DB	#27,#08,#13,#0C,#00
	DB	#17,#08,#13,#8C,#00
	DB	#17,#08,#07,#0C,#00
	DB	#13,#0C,#0F,#08,#00
	DB	#03,#8F,#4F,#00,#00
	DB	#01,#0F,#8E,#00,#00
	DB	#00,#0F,#0C,#00,#00
	DB	#00,#0F,#0E,#01,#0C
	DB	#00,#4F,#0F,#03,#8C
	DB	#01,#8E,#2F,#0F,#08
	DB	#03,#8C,#17,#0F,#00
	DB	#03,#0C,#03,#8E,#00
	DB	#07,#08,#07,#8F,#00
	DB	#07,#08,#0F,#0F,#00
	DB	#17,#0F,#4F,#17,#08
	DB	#13,#0F,#8E,#03,#8C
	DB	#01,#8F,#0C,#01,#0E
Char_0
	DB	5
	DB	#00,#03,#0F,#08,#00
	DB	#00,#0F,#1F,#8C,#00
	DB	#01,#EF,#3F,#CF,#00
	DB	#03,#CF,#0F,#EF,#08
	DB	#13,#8E,#00,#2F,#08
	DB	#07,#8C,#00,#0F,#0C
	DB	#07,#08,#01,#0F,#0C
	DB	#0F,#08,#03,#1F,#0E
	DB	#0F,#00,#17,#1D,#8E
	DB	#4F,#00,#2F,#19,#CE
	DB	#6F,#01,#0F,#01,#CE
	DB	#6F,#13,#0E,#01,#4E
	DB	#6F,#27,#0C,#01,#0E
	DB	#3F,#0F,#08,#03,#0E
	DB	#07,#0F,#00,#03,#0C
	DB	#07,#0E,#00,#37,#0C
	DB	#03,#0E,#00,#7F,#08
	DB	#03,#8F,#0F,#7F,#08
	DB	#01,#FF,#8F,#6F,#00
	DB	#00,#3F,#0F,#0E,#00
	DB	#00,#03,#0F,#08,#00
Char_1
	DB	3
	DB	#00,#03,#0E
	DB	#00,#17,#CE
	DB	#00,#3F,#8E
	DB	#01,#0F,#0E
	DB	#03,#0F,#0E
	DB	#17,#0F,#4E
	DB	#37,#0D,#CE
	DB	#27,#09,#CE
	DB	#07,#01,#8E
	DB	#06,#01,#0E
	DB	#00,#01,#0E
	DB	#00,#01,#0E
	DB	#00,#01,#0E
	DB	#00,#01,#4E
	DB	#00,#01,#CE
	DB	#00,#01,#CE
	DB	#00,#01,#8E
	DB	#00,#01,#0E
	DB	#00,#01,#0E
	DB	#00,#01,#0E
	DB	#00,#00,#0C
Char_2
	DB	5
	DB	#00,#0F,#0F,#0F,#0C
	DB	#01,#0F,#0F,#0F,#0E
	DB	#03,#0F,#EF,#1F,#CF
	DB	#07,#9F,#CF,#3F,#8F
	DB	#37,#8F,#0F,#0F,#0F
	DB	#37,#0F,#00,#0F,#2F
	DB	#07,#0E,#00,#07,#4E
	DB	#03,#0C,#00,#0F,#0C
	DB	#00,#00,#01,#4F,#08
	DB	#00,#00,#03,#CF,#00
	DB	#00,#00,#17,#CE,#00
	DB	#00,#01,#1F,#8C,#00
	DB	#00,#03,#0F,#08,#00
	DB	#00,#0F,#0F,#00,#00
	DB	#00,#0F,#0E,#00,#00
	DB	#01,#2F,#0E,#01,#0E
	DB	#01,#6F,#0F,#03,#0F
	DB	#03,#EF,#0F,#0F,#2F
	DB	#03,#0F,#0F,#0F,#6F
	DB	#03,#0F,#3F,#CF,#4F
	DB	#01,#0F,#7F,#8F,#0F
Char_Candy
	DB	5
	DB	#00,#00,#00,#00,#00
	DB	#03,#00,#00,#00,#00
	DB	#07,#08,#00,#00,#00
	DB	#07,#08,#00,#00,#00
	DB	#07,#08,#00,#00,#00
	DB	#27,#08,#00,#00,#00
	DB	#37,#08,#00,#00,#00
	DB	#37,#08,#00,#00,#00
	DB	#17,#08,#00,#00,#00
	DB	#07,#08,#00,#00,#00
	DB	#07,#08,#00,#00,#00
	DB	#07,#08,#00,#00,#00
	DB	#07,#08,#00,#00,#00
	DB	#27,#08,#00,#07,#00
	DB	#37,#08,#00,#27,#08
	DB	#37,#08,#00,#37,#08
	DB	#17,#8C,#00,#17,#08
	DB	#03,#0E,#00,#0F,#00
	DB	#01,#0F,#0F,#8F,#00
	DB	#01,#0F,#7F,#8E,#00
	DB	#00,#07,#EF,#0C,#00
Char_A
	DB	5			; Largeur
	DB	#00,#0F,#0F,#08,#00
	DB	#01,#3F,#CF,#0C,#00
	DB	#03,#7F,#8F,#0E,#00
	DB	#07,#EF,#0F,#0F,#00
	DB	#07,#0E,#03,#4F,#00
	DB	#0F,#08,#00,#6F,#08
	DB	#0F,#08,#00,#7F,#08
	DB	#0F,#00,#00,#37,#08
	DB	#4F,#00,#00,#17,#08
	DB	#6F,#00,#00,#07,#08
	DB	#6F,#00,#00,#07,#08
	DB	#6F,#00,#00,#07,#08
	DB	#6F,#0F,#0F,#2F,#08
	DB	#2F,#1F,#EF,#3F,#08
	DB	#0F,#1F,#CF,#3F,#08
	DB	#0F,#3F,#CF,#3F,#08
	DB	#0F,#0F,#0F,#1F,#08
	DB	#0F,#00,#00,#07,#08
	DB	#4F,#00,#00,#07,#08
	DB	#6F,#00,#00,#07,#08
	DB	#06,#00,#00,#03,#00
Char_B
	DB	5			; Largeur
	DB	#0F,#0F,#0F,#00,#00
	DB	#0F,#FF,#0F,#08,#00
	DB	#1F,#EF,#0F,#0C,#00
	DB	#0F,#0F,#0F,#8E,#00
	DB	#0E,#00,#01,#CE,#00
	DB	#0E,#00,#01,#CE,#00
	DB	#4E,#00,#01,#CE,#00
	DB	#4F,#0F,#0F,#CE,#00
	DB	#6F,#3F,#8F,#8C,#00
	DB	#2F,#7F,#1F,#8E,#00
	DB	#0F,#0F,#0F,#6F,#00
	DB	#0E,#00,#00,#0F,#00
	DB	#0E,#00,#00,#07,#08
	DB	#8E,#00,#00,#07,#08
	DB	#CE,#00,#00,#07,#08
	DB	#4E,#00,#00,#4F,#08
	DB	#6E,#00,#00,#6F,#00
	DB	#2F,#0F,#0F,#6F,#00
	DB	#0F,#3F,#8F,#CE,#00
	DB	#0F,#7F,#1F,#8C,#00
	DB	#0F,#0F,#0F,#08,#00
Char_C
	DB	4			; Largeur
	DB	#00,#07,#0E,#00
	DB	#01,#1F,#8F,#08
	DB	#03,#3F,#1F,#0E
	DB	#07,#0F,#1F,#CF
	DB	#4F,#0C,#03,#EF
	DB	#6F,#08,#00,#4E
	DB	#6F,#00,#00,#04
	DB	#4E,#00,#00,#00
	DB	#0E,#00,#00,#00
	DB	#0E,#00,#00,#00
	DB	#0E,#00,#00,#00
	DB	#8E,#00,#00,#00
	DB	#CE,#00,#00,#00
	DB	#CE,#00,#00,#00
	DB	#6F,#00,#00,#06
	DB	#3F,#08,#00,#6F
	DB	#07,#0C,#03,#2F
	DB	#07,#0F,#0F,#0E
	DB	#03,#0F,#EF,#0C
	DB	#01,#1F,#CF,#08
	DB	#00,#07,#0E,#00
Char_D
	DB	5			; Largeur
	DB	#0F,#0F,#0E,#00,#00
	DB	#3F,#8F,#CF,#08,#00
	DB	#7F,#0F,#FF,#0C,#00
	DB	#4F,#0F,#1F,#0E,#00
	DB	#0F,#00,#03,#0F,#00
	DB	#0F,#00,#01,#0F,#08
	DB	#0F,#00,#00,#7F,#08
	DB	#0F,#00,#00,#37,#08
	DB	#4F,#00,#00,#17,#8C
	DB	#6F,#00,#00,#03,#0C
	DB	#6F,#00,#00,#03,#0C
	DB	#2F,#00,#00,#03,#0C
	DB	#0F,#00,#00,#17,#0C
	DB	#0F,#00,#00,#37,#08
	DB	#0F,#00,#00,#3F,#08
	DB	#0F,#00,#01,#3F,#08
	DB	#4F,#00,#03,#6F,#00
	DB	#6F,#0F,#0F,#0E,#00
	DB	#7F,#1F,#EF,#0C,#00
	DB	#3F,#3F,#CF,#08,#00
	DB	#17,#0F,#0E,#00,#00
Char_E
	DB	4			; Largeur
	DB	#07,#0F,#0F,#0E
	DB	#0F,#CF,#0F,#EF
	DB	#1F,#8F,#1F,#CF
	DB	#1F,#0F,#0F,#0E
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#4F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#6F,#0F,#0C,#00
	DB	#2F,#1F,#CE,#00
	DB	#0F,#3F,#8E,#00
	DB	#0F,#0F,#0C,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#4F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#6F,#0F,#0F,#0E
	DB	#7F,#0F,#3F,#CF
	DB	#3F,#0F,#7F,#8F
	DB	#07,#0F,#0F,#0E
Char_F
	DB	4			; Largeur
	DB	#07,#0F,#0F,#0E
	DB	#0F,#CF,#0F,#EF
	DB	#1F,#8F,#1F,#CF
	DB	#1F,#0F,#0F,#0E
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#4F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#6F,#0F,#0C,#00
	DB	#2F,#1F,#CE,#00
	DB	#0F,#3F,#8E,#00
	DB	#0F,#0F,#0C,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#4F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#2F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#06,#00,#00,#00
Char_G
	DB	5			; Largeur
	DB	#00,#03,#0F,#00,#00
	DB	#00,#07,#EF,#0C,#00
	DB	#01,#1F,#CF,#0F,#00
	DB	#03,#0F,#0F,#EF,#08
	DB	#27,#0E,#00,#3F,#08
	DB	#37,#0C,#00,#03,#00
	DB	#7F,#08,#00,#00,#00
	DB	#6F,#08,#00,#00,#00
	DB	#2F,#00,#00,#00,#00
	DB	#0F,#00,#00,#00,#00
	DB	#0F,#00,#0F,#0F,#00
	DB	#0F,#01,#6F,#1F,#08
	DB	#0F,#01,#CF,#3F,#08
	DB	#6F,#08,#0F,#3F,#08
	DB	#7F,#08,#00,#37,#08
	DB	#37,#8C,#00,#37,#08
	DB	#13,#8E,#01,#1F,#08
	DB	#03,#0F,#0F,#0F,#00
	DB	#01,#0F,#6F,#0E,#00
	DB	#00,#1F,#CF,#0C,#00
	DB	#00,#03,#0F,#00,#00
Char_H
	DB	5			; Largeur
	DB	#06,#00,#00,#03,#00
	DB	#6F,#00,#00,#37,#08
	DB	#6F,#00,#00,#07,#08
	DB	#2F,#00,#00,#07,#08
	DB	#0F,#00,#00,#07,#08
	DB	#0F,#00,#00,#27,#08
	DB	#0F,#00,#00,#37,#08
	DB	#0F,#00,#00,#37,#08
	DB	#4F,#00,#00,#17,#08
	DB	#6F,#00,#00,#07,#08
	DB	#6F,#0F,#0F,#0F,#08
	DB	#6F,#0F,#EF,#0F,#08
	DB	#6F,#1F,#CF,#0F,#08
	DB	#2F,#3F,#8F,#2F,#08
	DB	#0F,#0F,#0F,#3F,#08
	DB	#0F,#00,#00,#37,#08
	DB	#0F,#00,#00,#17,#08
	DB	#0F,#00,#00,#07,#08
	DB	#0F,#00,#00,#07,#08
	DB	#6F,#00,#00,#07,#08
	DB	#06,#00,#00,#03,#00
Char_I
	DB	2			; Largeur
	DB	#01,#08
	DB	#03,#8C
	DB	#13,#8C
	DB	#13,#0C
	DB	#03,#0C
	DB	#03,#0C
	DB	#03,#0C
	DB	#03,#8C
	DB	#13,#8C
	DB	#13,#8C
	DB	#13,#0C
	DB	#03,#0C
	DB	#03,#0C
	DB	#03,#8C
	DB	#13,#8C
	DB	#13,#8C
	DB	#13,#0C
	DB	#03,#0C
	DB	#03,#0C
	DB	#03,#0C
	DB	#01,#08
Char_J
	DB	4			; Largeur
	DB	#00,#00,#03,#00
	DB	#00,#00,#07,#08
	DB	#00,#00,#07,#08
	DB	#00,#00,#17,#08
	DB	#00,#00,#37,#08
	DB	#00,#00,#37,#08
	DB	#00,#00,#27,#08
	DB	#00,#00,#07,#08
	DB	#00,#00,#07,#08
	DB	#00,#00,#07,#08
	DB	#00,#00,#17,#08
	DB	#00,#00,#37,#08
	DB	#06,#00,#37,#08
	DB	#6F,#00,#27,#08
	DB	#6F,#00,#07,#08
	DB	#4F,#00,#07,#08
	DB	#0F,#08,#0F,#08
	DB	#07,#0F,#0F,#00
	DB	#03,#3F,#CF,#00
	DB	#03,#7F,#8E,#00
	DB	#00,#0F,#08,#00
Char_K
	DB	4			; Largeur
	DB	#06,#00,#0E,#00
	DB	#6F,#01,#4E,#00
	DB	#0F,#03,#0E,#00
	DB	#0F,#07,#0C,#00
	DB	#0F,#0F,#0C,#00
	DB	#2F,#3F,#08,#00
	DB	#6F,#6F,#00,#00
	DB	#6F,#4E,#00,#00
	DB	#4F,#0C,#00,#00
	DB	#0F,#08,#00,#00
	DB	#0F,#08,#00,#00
	DB	#0F,#0E,#00,#00
	DB	#0F,#8F,#08,#00
	DB	#2F,#CF,#0C,#00
	DB	#6F,#0F,#0E,#00
	DB	#6F,#03,#CF,#00
	DB	#4F,#01,#EF,#08
	DB	#0F,#00,#6F,#0C
	DB	#0F,#00,#27,#0E
	DB	#0F,#00,#03,#0E
	DB	#06,#00,#00,#0E
Char_L
	DB	4			; Largeur
	DB	#06,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#2F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#4F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#2F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#4F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#6F,#0F,#0F,#0F
	DB	#3F,#0F,#3F,#CF
	DB	#1F,#0F,#7F,#8F
	DB	#07,#0F,#0F,#0F
Char_M
	DB	5			; Largeur
	DB	#0E,#00,#00,#00,#0E
	DB	#4F,#00,#00,#01,#4E
	DB	#6F,#00,#00,#01,#CE
	DB	#6F,#08,#00,#03,#CE
	DB	#2F,#8C,#00,#07,#8E
	DB	#0F,#CE,#00,#4F,#0E
	DB	#0F,#EF,#01,#8F,#0E
	DB	#0F,#8F,#13,#8F,#0E
	DB	#0F,#0F,#1F,#8F,#4E
	DB	#4F,#07,#1F,#8D,#CE
	DB	#6F,#03,#3F,#09,#CE
	DB	#6F,#01,#2F,#01,#CE
	DB	#6F,#00,#0E,#01,#CE
	DB	#2F,#00,#00,#01,#8E
	DB	#0F,#00,#00,#01,#0E
	DB	#0F,#00,#00,#01,#0E
	DB	#0F,#00,#00,#01,#0E
	DB	#0F,#00,#00,#01,#0E
	DB	#0F,#00,#00,#01,#0E
	DB	#0F,#00,#00,#01,#0E
	DB	#06,#00,#00,#00,#0C
Char_N
	DB	5			; Largeur
	DB	#0E,#00,#00,#07,#00
	DB	#4F,#00,#00,#17,#08
	DB	#6F,#00,#00,#07,#08
	DB	#6F,#08,#00,#07,#08
	DB	#2F,#0C,#00,#07,#08
	DB	#0F,#4E,#00,#67,#08
	DB	#0F,#4E,#00,#77,#08
	DB	#0F,#6F,#00,#77,#08
	DB	#0F,#2F,#08,#37,#08
	DB	#4F,#07,#0C,#07,#08
	DB	#6F,#03,#8E,#07,#08
	DB	#6F,#13,#CF,#07,#08
	DB	#6F,#01,#EF,#4F,#08
	DB	#2F,#00,#4F,#6F,#08
	DB	#0F,#00,#07,#7F,#08
	DB	#0F,#00,#03,#3F,#08
	DB	#0F,#00,#01,#1F,#08
	DB	#0F,#00,#01,#8F,#08
	DB	#4F,#00,#00,#4F,#08
	DB	#6F,#00,#00,#07,#08
	DB	#06,#00,#00,#03,#08
Char_O
	DB	5			; Largeur
	DB	#00,#03,#0F,#08,#00
	DB	#00,#0F,#1F,#8C,#00
	DB	#01,#EF,#3F,#CF,#00
	DB	#03,#CF,#0F,#EF,#08
	DB	#13,#8E,#00,#2F,#08
	DB	#07,#8C,#00,#07,#0C
	DB	#07,#08,#00,#03,#0C
	DB	#0F,#08,#00,#13,#0E
	DB	#0F,#00,#00,#11,#8E
	DB	#4F,#00,#00,#11,#CE
	DB	#6F,#00,#00,#01,#CE
	DB	#6F,#00,#00,#01,#4E
	DB	#6F,#00,#00,#01,#0E
	DB	#3F,#08,#00,#03,#0E
	DB	#07,#08,#00,#03,#0C
	DB	#07,#0C,#00,#37,#0C
	DB	#03,#0E,#00,#7F,#08
	DB	#03,#8F,#0F,#7F,#08
	DB	#01,#FF,#8F,#6F,#00
	DB	#00,#3F,#0F,#0E,#00
	DB	#00,#03,#0F,#08,#00
Char_P
	DB	4			; Largeur
	DB	#07,#0F,#0F,#08
	DB	#0F,#7F,#0F,#0C
	DB	#0F,#EF,#0F,#0E
	DB	#0F,#0F,#0F,#0F
	DB	#0F,#00,#00,#4F
	DB	#4F,#00,#00,#6F
	DB	#6F,#00,#00,#6F
	DB	#6F,#0F,#0F,#EF
	DB	#2F,#1F,#CF,#CE
	DB	#0F,#3F,#8F,#8C
	DB	#0F,#0F,#0F,#08
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#4F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#6F,#00,#00,#00
	DB	#2F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#0F,#00,#00,#00
	DB	#06,#00,#00,#00
Char_Q
	DB	5			; Largeur
	DB	#00,#03,#0F,#08,#00
	DB	#00,#07,#1F,#8E,#00
	DB	#01,#4F,#3F,#EF,#00
	DB	#01,#CF,#0F,#CF,#08
	DB	#03,#CE,#00,#0F,#08
	DB	#07,#8C,#00,#07,#0C
	DB	#07,#08,#00,#03,#0C
	DB	#07,#08,#00,#03,#8E
	DB	#0F,#00,#00,#01,#CE
	DB	#4F,#00,#00,#01,#CE
	DB	#6F,#00,#00,#01,#4E
	DB	#6F,#00,#00,#01,#0E
	DB	#6F,#00,#00,#01,#0E
	DB	#37,#08,#01,#0D,#0E
	DB	#07,#08,#03,#CF,#0C
	DB	#03,#0C,#01,#AF,#0C
	DB	#03,#0E,#03,#3F,#08
	DB	#01,#4F,#0F,#2F,#0C
	DB	#00,#7F,#CF,#0F,#8C
	DB	#00,#37,#0F,#1F,#8C
	DB	#00,#03,#0F,#01,#0C
Char_R
	DB	4			; Largeur
	DB	#0F,#0F,#0F,#00
	DB	#0F,#FF,#0F,#08
	DB	#1F,#EF,#0F,#0C
	DB	#0F,#0F,#0F,#0E
	DB	#0E,#00,#01,#CE
	DB	#0E,#00,#01,#CE
	DB	#4E,#00,#01,#CE
	DB	#4F,#0F,#0F,#CE
	DB	#6F,#3F,#8F,#8C
	DB	#2F,#7F,#1F,#8C
	DB	#0F,#0F,#0F,#08
	DB	#0E,#00,#7F,#08
	DB	#0E,#00,#37,#08
	DB	#8E,#00,#37,#08
	DB	#4E,#00,#27,#0C
	DB	#4E,#00,#03,#0C
	DB	#4E,#00,#03,#0C
	DB	#2E,#00,#01,#0E
	DB	#0E,#00,#01,#4E
	DB	#0E,#00,#01,#4E
	DB	#0E,#00,#00,#0E
Char_S
	DB	4			; Largeur
	DB	#00,#07,#0C,#00
	DB	#01,#3F,#CF,#00
	DB	#03,#7F,#0F,#08
	DB	#07,#0F,#0F,#08
	DB	#27,#0C,#37,#0C
	DB	#37,#08,#37,#8C
	DB	#37,#08,#13,#8C
	DB	#17,#0E,#01,#08
	DB	#03,#2F,#0E,#00
	DB	#01,#3F,#CF,#08
	DB	#00,#07,#4F,#0C
	DB	#00,#00,#07,#0C
	DB	#06,#00,#01,#0E
	DB	#6F,#00,#01,#0E
	DB	#0F,#00,#01,#8E
	DB	#0F,#00,#13,#CE
	DB	#0F,#08,#07,#CE
	DB	#07,#0F,#0F,#8C
	DB	#03,#EF,#0F,#08
	DB	#01,#7F,#0F,#00
	DB	#00,#07,#0C,#00
Char_T
	DB	5			; Largeur
	DB	#07,#0F,#0F,#0F,#08
	DB	#6F,#1F,#CF,#3F,#8C
	DB	#4F,#3F,#8F,#7F,#0C
	DB	#07,#0F,#0F,#0F,#08
	DB	#00,#01,#0E,#00,#00
	DB	#00,#01,#4E,#00,#00
	DB	#00,#01,#CE,#00,#00
	DB	#00,#01,#CE,#00,#00
	DB	#00,#01,#8E,#00,#00
	DB	#00,#01,#0E,#00,#00
	DB	#00,#01,#0E,#00,#00
	DB	#00,#01,#0E,#00,#00
	DB	#00,#01,#0E,#00,#00
	DB	#00,#01,#4E,#00,#00
	DB	#00,#01,#CE,#00,#00
	DB	#00,#01,#CE,#00,#00
	DB	#00,#01,#8E,#00,#00
	DB	#00,#01,#0E,#00,#00
	DB	#00,#01,#0E,#00,#00
	DB	#00,#01,#0E,#00,#00
	DB	#00,#00,#0C,#00,#00
Char_U
	DB	5			; Largeur
	DB	#06,#00,#00,#03,#00
	DB	#0F,#00,#00,#37,#08
	DB	#0F,#00,#00,#07,#08
	DB	#0F,#00,#00,#07,#08
	DB	#4F,#00,#00,#07,#08
	DB	#6F,#00,#00,#07,#08
	DB	#6F,#00,#00,#07,#08
	DB	#2F,#00,#00,#27,#08
	DB	#0F,#00,#00,#37,#08
	DB	#0F,#00,#00,#37,#08
	DB	#0F,#00,#00,#37,#08
	DB	#0F,#00,#00,#37,#08
	DB	#4F,#00,#00,#17,#08
	DB	#6F,#00,#00,#07,#08
	DB	#6F,#00,#00,#07,#08
	DB	#3F,#08,#00,#0F,#08
	DB	#07,#0C,#01,#0F,#00
	DB	#03,#0F,#1F,#0E,#00
	DB	#03,#0F,#FF,#0E,#00
	DB	#00,#1F,#CF,#08,#00
	DB	#00,#03,#0E,#00,#00
Char_V
	DB	5			; Largeur
	DB	#07,#00,#00,#00,#00
	DB	#6F,#00,#00,#00,#00
	DB	#4F,#08,#00,#00,#01
	DB	#07,#08,#00,#00,#01
	DB	#07,#0C,#00,#00,#03
	DB	#03,#8C,#00,#00,#13
	DB	#13,#8E,#00,#00,#37
	DB	#13,#CE,#00,#00,#37
	DB	#01,#8F,#00,#00,#1F
	DB	#01,#0F,#00,#00,#0F
	DB	#00,#0F,#08,#01,#0F
	DB	#00,#0F,#08,#01,#4F
	DB	#00,#17,#0C,#03,#8E
	DB	#00,#37,#8C,#13,#8C
	DB	#00,#13,#8C,#13,#0C
	DB	#00,#13,#0E,#07,#08
	DB	#00,#03,#0E,#07,#08
	DB	#00,#01,#0F,#4F,#00
	DB	#00,#00,#3F,#EF,#00
	DB	#00,#00,#17,#CE,#00
	DB	#00,#00,#03,#0C,#00
Char_W
	DB	5			; Largeur
	DB	#0E,#00,#00,#00,#0E
	DB	#6F,#00,#00,#01,#CE
	DB	#0F,#00,#00,#01,#0E
	DB	#0F,#00,#00,#01,#0E
	DB	#0F,#00,#00,#01,#0E
	DB	#0F,#00,#00,#01,#0E
	DB	#0F,#00,#00,#01,#0E
	DB	#2F,#00,#00,#01,#8E
	DB	#6F,#00,#0E,#01,#CE
	DB	#6F,#01,#8F,#01,#CE
	DB	#6F,#13,#8F,#09,#CE
	DB	#6F,#37,#0F,#0D,#CE
	DB	#4F,#3F,#0F,#0F,#4E
	DB	#0F,#3F,#0B,#2F,#0E
	DB	#0F,#2F,#01,#EF,#0E
	DB	#0F,#4E,#00,#6F,#0E
	DB	#4F,#0C,#00,#27,#4E
	DB	#6F,#08,#00,#03,#CE
	DB	#6F,#00,#00,#01,#CE
	DB	#6F,#00,#00,#01,#CE
	DB	#0E,#00,#00,#01,#0E
Char_X
	DB	5			; Largeur
	DB	#8F,#00,#00,#03,#08
	DB	#6F,#08,#00,#17,#0C
	DB	#4F,#08,#00,#37,#08
	DB	#07,#0C,#00,#3F,#08
	DB	#03,#4E,#01,#2F,#00
	DB	#01,#6F,#03,#0E,#00
	DB	#01,#6F,#23,#0C,#00
	DB	#00,#2F,#2F,#0C,#00
	DB	#00,#07,#3F,#08,#00
	DB	#00,#03,#0F,#00,#00
	DB	#00,#01,#4E,#00,#00
	DB	#00,#03,#6F,#00,#00
	DB	#00,#07,#7F,#08,#00
	DB	#00,#6F,#2F,#0C,#00
	DB	#01,#6F,#27,#0E,#00
	DB	#03,#4E,#03,#0F,#00
	DB	#03,#4E,#01,#2F,#00
	DB	#07,#0C,#00,#3F,#08
	DB	#4F,#08,#00,#37,#0C
	DB	#6F,#00,#00,#17,#0C
	DB	#8E,#00,#00,#03,#08
Char_Y
	DB	5			; Largeur
	DB	#8E,#00,#00,#07,#00
	DB	#0F,#00,#00,#0F,#08
	DB	#0F,#00,#00,#0F,#00
	DB	#17,#08,#01,#4F,#00
	DB	#37,#8C,#03,#CE,#00
	DB	#17,#8C,#03,#CE,#00
	DB	#13,#0E,#17,#8C,#00
	DB	#13,#0E,#07,#0C,#00
	DB	#01,#0F,#0F,#08,#00
	DB	#01,#3F,#0F,#08,#00
	DB	#00,#3F,#0F,#00,#00
	DB	#00,#3F,#8F,#00,#00
	DB	#00,#37,#8E,#00,#00
	DB	#00,#17,#8E,#00,#00
	DB	#00,#13,#8C,#00,#00
	DB	#00,#03,#0C,#00,#00
	DB	#00,#03,#0C,#00,#00
	DB	#00,#03,#0C,#00,#00
	DB	#00,#03,#0C,#00,#00
	DB	#00,#03,#8C,#00,#00
	DB	#00,#01,#08,#00,#00
Char_Z
	DB	5			; Largeur
	DB	#03,#0F,#0F,#0F,#0F
	DB	#27,#0F,#EF,#1F,#CF
	DB	#27,#1F,#CF,#3F,#8F
	DB	#03,#0F,#0F,#0F,#0F
	DB	#00,#00,#00,#03,#2F
	DB	#00,#00,#00,#07,#0E
	DB	#00,#00,#00,#0F,#0C
	DB	#00,#00,#01,#CF,#08
	DB	#00,#00,#03,#CF,#00
	DB	#00,#00,#17,#CE,#00
	DB	#00,#00,#1F,#8C,#00
	DB	#00,#01,#0F,#08,#00
	DB	#00,#03,#0F,#00,#00
	DB	#00,#07,#0E,#00,#00
	DB	#00,#2F,#0C,#00,#00
	DB	#01,#6F,#08,#00,#00
	DB	#03,#EF,#00,#00,#00
	DB	#07,#0F,#0F,#0F,#0F
	DB	#7F,#8F,#3F,#CF,#0F
	DB	#7F,#0F,#7F,#CF,#0F
	DB	#7F,#0F,#7F,#CF,#0F
