; Couleurs Gate-Array
Basic00	equ #54
Basic01	equ #44
Basic02	equ #55
Basic03	equ #5C
Basic04	equ #58
Basic05	equ #5D
Basic06	equ #4C
Basic07	equ #45
Basic08	equ #4D
Basic09	equ #56
Basic10	equ #46
Basic11	equ #57
Basic12	equ #5E
Basic13	equ #40
Basic14	equ #5F
Basic15	equ #4E
Basic16	equ #47
Basic17	equ #4F
Basic18	equ #52
Basic19	equ #42
Basic20	equ #53
Basic21	equ #5A
Basic22	equ #59
Basic23	equ #5B
Basic24	equ #4A
Basic25	equ #43
Basic26	equ #4B

FastCopy	equ	0
TpsWaitMessage	equ	#100			; Temps avant repassage du train
TpsWaitBougie	equ	10			; Delai animation bougie
TpsNextYeux	equ	15			; Delai animation yeux
TpsWaitYeux	equ	10			; Temps entre chaque anim yeux

NbFloc	Equ	100				; Nbre de flocons sur image intro
CoulFlocon	Equ	63			; Couleur flocon (octet)

TexteSens	equ	#800			; Adresse du texte "inverse"

; Constantes - adresses de decompactage
TrainFull equ #92A0				; Adresse gros sprite train
Musique equ TrainFull+4440			; Adresse musique
cstPeriodeOffset EQU Musique+4			; Duration of song (number of frame)
cstCrunchedDataOffset EQU Musique+#10		; Pointer to the array of Buffer Data offsets (14 words)
RegVars Equ Musique+3484			; Decompactage registres PSG
SpriteLettres equ #C000				; Adresse de la fonte
AdrEcr equ #A000				; Adresse memoire ecran
TabFlocs equ AdrEcr+512				; Adresse des flocons
; structure flocons = 
; IX+0 = x
; IX+1 = y
; IX+2 = inc y
; IX+3 = memo adr

	ORG	#5C00

;	Write	direct	"xmas2021.bin"

	Nolist

XmasSong_ZX0
	incbin	"Fichiers\xmassong.zx0"
SantaPic
	Read	"SantaPic_zx0.asm"
Lettres_ZX0
	Read	"Fonte_zx0.asm"
TrainFull_ZX0
	Read	"TrainFull_zx0.asm"

	List

	RUN	$
_StartDemo
	DI
	LD	BC,#7F8C
	OUT	(C),C
	LD	SP,#200
	LD	HL,CrtcNoScreen
	CALL	SendCrtc
	LD	HL,PaletteBlack
	CALL	SetPalette
;	LD	HL,#A000
;	LD	DE,#A001
;	LD	BC,#AFFF
;	LD	(HL),L
;	LDIR

	LD	HL,XmasSong_ZX0
	LD	DE,Musique
	CALL	Depack
	CALL	InitPlayer

	LD	HL,SantaPic
	LD	DE,#0200
	CALL	Depack

;	LD	A,#C3
;	LD	(#38),A
	LD	HL,NewIrq
	LD	(#39),HL
	EI

	LD	HL,XmassPic
	LD	DE,#C000
	CALL	Depack
	LD	HL,CrtcStartScreen
	CALL	SendCrtc
	LD	HL,XmassPaletteFadeMid
	CALL	SetPalette
	LD	HL,XmassPaletteOk
	CALL	SetPalette

; Calcul des adresses ecran pour affichage flocons
	LD	DE,AdrEcr
	LD	HL,#C000
Loop:	LD	A,L
	LD	(DE),A
	INC	D
	LD	A,H
	LD	(DE),A
	DEC	D
	LD	BC,#800
	ADD	HL,BC
	JR	NC,NextAdr
	LD	BC,#C060
	ADD	HL,BC
NextAdr
	INC	E
	JR	NZ,Loop
; Initialisation des flocons
	LD	IX,TabFlocs
	LD	B,NbFloc
	LD	DE,0
Random
	LD	HL,#28D9
	ADD	HL,HL
	SBC	A,A
	AND	#83
	XOR	L
	LD	L,A
	LD	(Random+1),HL			; HL = valeur pseudo aleatoire
	AND	#1F
	ADD	A,2
	ADD	A,E
	LD	E,A
	CP	96
	JR	C,Init2
	SUB	96
	LD	E,A
	PUSH	AF
	LD	A,L
	AND	#F
	ADD	A,2
	ADD	A,D
	LD	D,A
	POP	AF
Init2
	LD	(IX+0),A			; Position X
	LD	A,D
	LD	(IX+1),A			; Position Y
	LD	A,H
	AND	3
	INC	A
	LD	(IX+2),A			; Vitesse descente
	LD	A,#FF
	LD	(IX+3),A			; Octet memorise (#FF=aucun)
	INC	IX
	INC	IX
	INC	IX
	INC	IX
	DJNZ	Random
; Affichage des flocons
	LD	HL,#22A
LoopDisplay
	LD	B,#F5
	IN	A,(C)
	RRA
	JR	NC,LoopDisplay
	PUSH	HL
	LD	HL,AdrEcr
	LD	IX,TabFlocs
	LD	A,NbFloc
	LD	B,0
DisplayFloc
	EX	AF,AF'
	LD	A,(IX+3)
	INC	A
	JR	Z,NoRestore			; Rien a restaurer
	LD	C,(IX+0)
	LD	L,(IX+1)
	LD	E,(HL)
	INC	H
	LD	D,(HL)
	DEC	H
	EX	DE,HL
	ADD	HL,BC
	LD	A,(IX+3)
	LD	(HL),A				; Restaurer ancienne valeur
	EX	DE,HL
NoRestore
	LD	A,(IX+1)
	ADD	A,(IX+2)
	CP	168
	JR	C,SetNewPosY
	XOR	A
SetNewPosY
	LD	(IX+1),A			; Nouvelle position Y
	LD	A,(IX+0)
	INC	A
	CP	96
	JR	C,SetNewPosX
	XOR	A
SetNewPosX
	LD	(IX+0),A			; Nouvelle position X
	LD	C,A
	LD	L,(IX+1)
	LD	E,(HL)
	INC	H
	LD	D,(HL)
	DEC	H
	EX	DE,HL
	ADD	HL,BC
	LD	A,(HL)				; Octet a sauver
	CP	CoulFlocon
	JR	Z,NoFloc
	LD	(IX+3),A			; Sauver octet
NoFloc
	LD	(HL),CoulFlocon			; Ecrire flocon
	EX	DE,HL
	INC	IX
	INC	IX
	INC	IX
	INC	IX
	EX	AF,AF'
	DEC	A
	JR	NZ,DisplayFloc			; Reboucler pour tous les flocons
	POP	HL
	DEC	HL				; Temps d'affichage
	LD	A,H
	OR	L
	JR	NZ,LoopDisplay
; Effacer les flocons avant le "palette fade"
	LD	HL,AdrEcr
	LD	IX,TabFlocs
	LD	A,NbFloc
	LD	B,0
ClearFloc
	EX	AF,AF'
	LD	C,(IX+0)
	LD	L,(IX+1)
	LD	E,(HL)
	INC	H
	LD	D,(HL)
	DEC	H
	EX	DE,HL
	ADD	HL,BC
	LD	A,(IX+3)
	LD	(HL),A
	EX	DE,HL
	INC	IX
	INC	IX
	INC	IX
	INC	IX
	EX	AF,AF'
	DEC	A
	JR	NZ,ClearFloc
; Decompacter sprtie du trin
	LD	HL,TrainFull_ZX0
	LD	DE,TrainFull
	CALL	Depack
; Fade palette
	LD	HL,XmassPaletteFadeMid
	CALL	SetPalette
	LD	HL,PaletteBlack
	CALL	SetPalette
	LD	HL,CrtcFullScreen
	CALL	SendCrtc
	LD	HL,SantaPaletteFadeMid
	CALL	SetPalette
	LD	HL,SantaPaletteOk
	CALL	SetPalette
; Decompacter fonte
	LD	HL,Lettres_ZX0
	LD	DE,SpriteLettres
	CALL	Depack

; Boucle principale demo
DemoLoop
	LD	B,#F5
WaitVBL
	IN	A,(C)
	RRA
	JR	NC,WaitVBL
WaitEndVBL
	IN	A,(C)
	RRA
	JR	C,WaitEndVBL
; Anim bougie
WithBougie
	LD	A,TpsWaitBougie
	DEC	A
	LD	(WithBougie+1),A
	JR	NZ,EndBougie
	LD	A,TpsWaitBougie
	LD	(WithBougie+1),A
PosBougie
	LD	A,0
	INC	A
	CP	4
	JR	C,PosBougie2
	XOR	A
PosBougie2
	LD	(PosBougie+1),A
	LD	HL,DataBougie
	CALL	DrawAnim
EndBougie
; Anim yeux
	LD	A,(PosYeux+1)
	AND	A
	JR	NZ,WithYeux
WaitNextYeux
	LD	A,TpsNextYeux
	DEC	A
	LD	(WaitNextYeux+1),A
	AND	A
	JR	NZ,EndYeux
	LD	A,TpsNextYeux
	LD	(WaitNextYeux+1),A
WithYeux
	LD	A,TpsWaitYeux
	DEC	A
	LD	(WithYeux+1),A
	JR	NZ,EndYeux
	LD	A,TpsWaitYeux
	LD	(WithYeux+1),A
PosYeux
	LD	A,0
	INC	A
	CP	4
	JR	C,PosYeux2
	XOR	A
PosYeux2
	LD	(PosYeux+1),A
	LD	HL,DataYeux
	CALL	DrawAnim
EndYeux
; Anim Train
	LD	A,40
	LD	(DrawTrainNbCol+1),A
	ADD	A,A
	LD	(DrawTrainAddDecal+1),A
PosxTrain
	LD	A,0
	PUSH	AF
	CALL	DrawTrain
	POP	AF
	DEC	A
	CP	96
	JR	NC,TestEndTrain
	LD	(PosxTrain+1),A
	CALL	DrawMessage
	LD	A,(PosxTrain+1)
TestEndTrain
	CP	#FF
	JR	NZ,NextPos
; Attente avant nouveau passage du train
WaitMessage
	LD	HL,TpsWaitMessage
	DEC	HL
	LD	(WaitMessage+1),HL
	LD	A,H
	OR	L
	JP	NZ,DemoLoop
	LD	HL,TpsWaitMessage
	LD	(WaitMessage+1),HL
; Changement message
	LD	HL,(PosMessage+1)
	LD	A,(HL)
	AND	A
	JR	NZ,SetMessage
PosReelMessage
	LD	HL,Message
	INC	HL
	LD	A,(HL)
	CP	#FF
	JR	NZ,CopyInverse
	LD	HL,Message
	LD	(PosReelMessage+1),HL
; Mettre le message dans l'ordre d'affichage (inverse)
CopyInverse
	INC	HL
	LD	A,(HL)
	AND	A				; Fin du message ?
	JR	NZ,CopyInverse
	LD	(PosReelMessage+1),HL
	DEC	HL				; Dernier caractere du message=premier a afficher
	LD	DE,TexteSens
CopyMessage
	LD	A,(HL)
	LD	(DE),A				; Copier
	INC	DE
	DEC	HL
	AND	A				; Jusqu'a retrouver le 0 du message precedent
	JR	NZ,CopyMessage
	LD	HL,TexteSens
SetMessage
	LD	(PosMessage+1),HL
	LD	A,135
NextPos
	LD	(PosxTrain+1),A
	JP	DemoLoop

;
; Affiche petite animation (yeux ou bougie)
;
DrawAnim
	LD	(OffsetAnim+1),A
DrawAnim2	
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	LD	A,D
	OR	E
	RET	Z
OffsetAnim
	LD	A,0
	PUSH	HL
CalcPosOctet
	INC	HL
	DEC	A
	JP	P,CalcPosOctet
	LDI
	POP	HL
	INC	HL
	INC	HL
	INC	HL
	INC	HL
	INC	HL
	JR	DrawAnim2

;
; Affichage message
;
DrawMessage
	LD	A,0					; Position dans la lettre
	DEC	A
	JP	P,DrawLettre			; Dessine la lettre
PosMessage
	LD	HL,TexteSens
	LD	A,(HL)
	AND	A
	RET	Z
	INC	HL
	LD	(PosMessage+1),HL
	SUB	32
	ADD	A,A
	LD	C,A
	LD	B,0
	LD	HL,SpriteLettres
	ADD	HL,BC
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	LD	A,(DE)				; Taille lettre
	INC	DE
	LD	(DrawMessage+1),A
	DEC	A
	LD	(TailleLettre+1),A
	EX	DE,HL
	LD	(AdrLettre+1),HL
DrawLettre
	LD	A,(DrawMessage+1)
	DEC	A
	LD	(DrawMessage+1),A
	LD	C,A
AdrLettre
	LD	HL,0
	ADD	HL,BC
	LD	A,(PosxTrain+1)
	LD	C,A
	LD	B,0
	LD	IX,AdrEcrLettre
	LD	A,21
DrawLettre2
	LD	E,(IX+0)
	INC	IX
	LD	D,(IX+0)
	INC	IX
	EX	DE,HL
	ADD	HL,BC
	EX	DE,HL
	PUSH	BC
	LDI
TailleLettre	LD	C,0
	ADD	HL,BC
	POP	BC
	DEC	A
	JR	NZ,DrawLettre2
	RET

;
; Affichage du train (A = posx du train)
;
DrawTrain
	LD	E,A			; E = X
; Calcul decalage dans le sprite
	LD	A,80
	SUB	E
	JR	C,CalcDecal1
	CP	40
	JR	NC,CalcDecal3
CalcDecal1
	LD	A,E
	CP	96
	JR	C,CalcDecal2
; de 135 a 96
	SUB	40
	LD	(PosReel+1),A
	LD	A,136
	SUB	E
	LD	(DrawTrainNbCol+1),A
	SUB	120
	NEG
	LD	(DrawTrainAddDecal+1),A
	LD	HL,TrainFull+40
	JR	DrawTrain21

	LD	A,136
	SUB	E
	JR	CalcDecal3
CalcDecal2
	LD	A,40
CalcDecal3
	LD	C,A			; C = 80 - X ou 135 - X
	LD	B,0			; BC = ajout au sprite
	LD	HL,TrainFull
	ADD	HL,BC
; calcul position reelle
	LD	A,E			; A = X
	SUB	40
	JR	NC,CalcPos2
	ADD	A,40
	LD	(DrawTrainNbCol+1),A
	RET	Z
	SUB	120
	NEG
	LD	(DrawTrainAddDecal+1),A
	XOR	A
CalcPos2
	CP	57
	JR	C,DrawTrain2
	LD	A,56
DrawTrain2
	LD	(PosReel+1),A		; Position reelle sprite
DrawTrain21
	LD	IX,AdrEcrTrain
	LD	A,37			; 37 Lignes
DrawTrain3
	LD	E,(IX+0)
	LD	D,(IX+1)
	EX	DE,HL
PosReel
	LD	BC,0
	ADD	HL,BC
	EX	DE,HL
DrawTrainNbCol
	LD	C,40
if FastCopy=1
	EX	AF,AF'
	LD	A,16
	SUB	C
	AND	15
	ADD	A,A
	LD	(Lp_Entry+1),A
	EX	AF,AF'
Lp_Entry
	JR	Lp_Entry
Copy_Loop
	LDI:LDI:LDI:LDI:LDI:LDI:LDI:LDI
	LDI:LDI:LDI:LDI:LDI:LDI:LDI:LDI
	JP	PE,Copy_Loop
else
	LDIR
endif
DrawTrainAddDecal
	LD	BC,80
	ADD	HL,BC
	INC	IX
	INC	IX
	DEC	A
	JR	NZ,DrawTrain3
	RET

;
; Player musique
;
InitPlayer
	LD	BC,#F782			; 8255 Control port
	OUT	(C),C				; Send to 8255
InitMusic
	LD	HL,(cstPeriodeOffset)
	LD	(wrdPeriode+1),HL

	LD	IX,cstCrunchedDataOffset
	LD	IY,RegVars+8
	LD	B,14
initRegVars2:
	LD	L,(IX+0)
	LD	H,(IX+1)
	LD	DE,Musique
	ADD	HL,DE
	LD	(IY-3),L
	LD	(IY-2),H
	INC	IX
	INC	IX
	PUSH	IY
	POP	HL
	LD	(IY-5),L
	LD	(IY-4),H
	LD	(IY-1),1
	LD	DE,255+8
	ADD	IY,DE
	DJNZ	initRegVars2
	RET

PlaySong
	LD	B,14
	LD	IX,RegVars+8
decrunch_register:
	CALL	getRegisterValue
	LD	DE,255+8
	ADD	IX,DE
	DJNZ	decrunch_register
wrdPeriode
	LD	HL,0
	DEC	HL
	LD	(wrdPeriode+1),HL
	LD	A,H
	OR	L
	RET	NZ
	JR	InitMusic
getRegisterValue:
	DEC	(IX-1)				; if (Lenght == 0) it's A new sequence
	JR	NZ,DecodeSeq
	LD	L,(IX-3)			; read cmd into "A"
	LD	H,(IX-2)
	LD	A,(HL)
	INC	HL
	LD	E,(HL)				; store length into
	LD	(IX-1),E			; (IX-1)
	INC	HL
	OR	A
	JR	Z,newBytes
	LD	(IX-3),L			; Store Crunched Offset
	LD	(IX-2),H 
	LD	L,(IX-5)			; read Current Buffer Offset
	LD	H,(IX-4)
	LD	D,#FF
	LD	E,A
	ADD	HL,DE 				; sub relative offset
	LD	D,HX
	LD	E,LX
	XOR	A				; A = 0, Flag C = 0
	SBC	HL,DE
	JR	NC,endMod1
	INC	H				; HL += 255
	DEC	HL				; error
endMod1:
	ADD	HL,DE
	LD	(IX-7),L			; store copy offset
	LD	(IX-6),H
	LD	(IX-8),A
	JR	DecodeSeq
newBytes:
	LD	(IX-7),L			; store copy offset
	LD	(IX-6),H
	LD	D,A				; Increment Crunched Offset by length
	ADD	HL,DE
	LD	(IX-3),L
	LD	(IX-2),H
	LD	(IX-8),1
DecodeSeq:
	LD	L,(IX-7)			; HL = CopyOffset
	LD	H,(IX-6)
	LD	A,(HL)
	INC	HL
	LD	D,HX
	LD	E,LX
	INC	D
	DEC	DE				; DE = BuffOffsetInitial + 255
	BIT	0,(IX-8)
	JR	NZ,afterMod
	SBC	HL,DE
	JR	NZ,endMod3
	LD	HL,-255
endMod3:
	ADD	HL,DE
afterMod:
	LD	(IX-7),L
	LD	(IX-6),H
	LD	L,(IX-5)			; DE = Current BufferOffset
	LD	H,(IX-4)
	LD	(HL),A
	INC	HL
	AND	A
	SBC	HL,DE
	JR	NZ,endMod2
	LD	HL,-255
endMod2:
	ADD	HL,DE
	LD	(IX-5),L
	LD	(IX-4),H
	LD	H,A
	LD	A,14
	SUB	B
	LD	L,B				; Sauvegarde registre B
	LD	DE,#F680
	LD	B,#F4				; setup PSG register number on PPI port A
	OUT	(C),A				; Numero du registre
	LD	B,D
	OUT	(C),B
	DW	#71ED	; out (c),0
	LD	B,#F4				; setup register data on PPI port A
	OUT	(C),H				; Valeur du registre
	LD	B,D
	OUT	(C),E
	DW	#71ED	; out (c),0
	LD	B,L				; Restauration registre B
	RET

;
; Routine appelee sous interruptions (300 fois par secondes)
;
NewIrq
	PUSH	AF
	EX	AF,AF'
	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
	PUSH	IX
	LD	B,#F5
	IN	A,(C)
	RRA
	JR	NC,CntIrq			; Si pas sur la vbl, on continue
	LD	HL,TabExecIrq
	LD	(CntIrq2+1),HL
CntIrq
CntIrq2
	LD	HL,TabExecIrq
	LD	DE,EndIrq
	PUSH	DE				; Pour retour a EndIrq
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	(CntIrq2+1),HL
	EX	DE,HL
	JP	(HL)				; Saut a la routine d'interruption (CntIrq2+1)
EndIrq
	POP	IX
	POP	HL
	POP	DE
	POP	BC
	POP	AF
	EX	AF,AF'
	POP	AF
	EI
RetIrq
	RET

Mode1
	LD	BC,#7F8D
	JR	SetMode

Mode0
	LD	BC,#7F8C
SetMode
	OUT	(C),C
	RET

SendCrtc
	LD	A,(HL)
	AND	A
	RET	Z
	LD	B,#BD
	OUTI
	LD	B,#BE
	OUTI
	JR	SendCrtc

SetPalette
	LD	BC,#7F10
	LD	A,(HL)
	OUT	(C),C
	OUT	(C),A
	XOR	A
BclPalette
	OUT	(C),A
	INC	B
	OUTI
	INC	A
	CP	16
	JR	NZ,BclPalette

	LD	BC,#3000
WaitBC
	DEC	BC
	LD	A,B
	OR	C
	JR	NZ,WaitBC
	RET

;
; Decompactage ZX0
; HL = source
; DE = destination
;
Depack
	ld	bc,#ffff			; preserve default offset 1
	push	bc
	inc	bc
	ld	a,#80
dzx0s_literals:
	call	dzx0s_elias			; obtain length
	ldir					; copy literals
	add	a,a				; copy from last offset or new offset?
	jr	c,dzx0s_new_offset
	call	dzx0s_elias			; obtain length
dzx0s_copy:
	ex	(sp),hl				; preserve source,restore offset
	push	hl				; preserve offset
	add	hl,de				; calculate destination - offset
	ldir					; copy from offset
	pop	hl				; restore offset
	ex	(sp),hl				; preserve offset,restore source
	add	a,a				; copy from literals or new offset?
	jr	nc,dzx0s_literals
dzx0s_new_offset:
	call	dzx0s_elias			; obtain offset MSB
	ld b,a
	pop	af				; discard last offset
	xor	a				; adjust for negative offset
	sub	c
	RET	z				; Plus d'octets a traiter = fini

	ld	c,a
	ld	a,b
	ld	b,c
	ld	c,(hl)				; obtain offset LSB
	inc	hl
	rr	b				; last offset bit becomes first length bit
	rr	c
	push	bc				; preserve new offset
	ld	bc,1				; obtain length
	call	nc,dzx0s_elias_backtrack
	inc	bc
	jr	dzx0s_copy
dzx0s_elias:
	inc	c				; interlaced Elias gamma coding
dzx0s_elias_loop:
	add	a,a
	jr	nz,dzx0s_elias_skip
	ld	a,(hl)				; load another group of 8 bits
	inc	hl
	rla
dzx0s_elias_skip:
	ret 	c
dzx0s_elias_backtrack:
	add	a,a
	rl	c
	rl	b
	jr	dzx0s_elias_loop

AdrEcrTrain
	DW	#44E0,#4CE0,#54E0,#5CE0
	DW	#64E0,#6CE0,#74E0,#7CE0
	DW	#4540,#4D40,#5540,#5D40
AdrEcrLettre
	DW	#6540,#6D40,#7540,#7D40
	DW	#45A0,#4DA0,#55A0,#5DA0
	DW	#65A0,#6DA0,#75A0,#7DA0
	DW	#4600,#4E00,#5600,#5E00
	DW	#6600,#6E00,#7600,#7E00
	DW	#4660,#4E60,#5660,#5E60
	DW	#6660,#6E60

TabExecIrq
	DW	Mode0,RetIrq,PlaySong,RetIrq,RetIrq,Mode1
	DW	RetIrq,RetIrq,RetIrq,RetIrq,RetIrq,Retirq

PaletteBlack
	DB	Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00
XmassPaletteFadeMid
	DB	Basic00,Basic00,Basic03,Basic00,Basic00,Basic00,Basic03,Basic03,Basic06,Basic06,Basic13,Basic00,Basic00,Basic00,Basic00,Basic00
XmassPaletteOk
	DB	Basic00,Basic03,Basic06,Basic09,Basic12,Basic13,Basic15,Basic16,Basic24,Basic25,Basic26,Basic00,Basic00,Basic00,Basic26,Basic00

SantaPaletteFadeMid
	DB	Basic00,Basic00,Basic03,Basic13,Basic00,Basic06,Basic06,Basic12,Basic12,Basic00,Basic01,Basic00,Basic00,Basic07,Basic01,Basic10
SantaPaletteOk
	DB	Basic13,Basic03,Basic06,Basic26,Basic00,Basic15,Basic16,Basic25,Basic24,Basic04,Basic07,Basic12,Basic01,Basic17,Basic14,Basic23

CrtcNoScreen
	DB	6,0,7,#21,0				; Ecran "invisible" (R6=0)

CrtcFullScreen
	DB	1,#30,2,#32,6,#22,7,#23,12,#0D,13,0,0	; Ecran "Overscan" (32ko)

CrtcStartScreen
	DB	1,#30,2,#32,6,#15,7,#21,12,#30,13,0,0

Message
	DB	"@ @ @ @ @ @ @ @ @ @ @ @ @  ",0
	DB	"CMP DRILL AST          ",0
	DB	"SID KRIS DEMONIAK      ",0
	DB	"THE WHOLE IMPACT TEAM  ",0
	DB	"WOULD LIKE TO WISH YOU  ",0
	DB	"#   A MERRY XMAS 2021   # ",0
	DB	"& A HAPPY NEW YEAR 2022",0
	DB	"!!!  FUCK LA SENE  !!!     ",0
	DB	"HOPE 2022 WILL BE       ",0
	DB	"FULL OF NEW PRODS !!!    ",0
	DB	#FF

	Read	"Animations.asm"

	nolist
XmassPic
	Read	"XmassPic_zx0.asm"
	list
_endxmass

