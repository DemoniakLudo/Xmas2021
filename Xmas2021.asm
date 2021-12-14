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

TpsWaitPalette	equ	#3000
TpsWaitMessage	equ	#100			; Temps avant repassage du train
TpsWaitBougie	equ	10			; Delai animation bougie
TpsNextYeux	equ	15			; Delai animation yeux
TpsWaitYeux	equ	10			; Temps entre chaque anim yeux

NbFloc		Equ	100			; Nbre de flocons sur image intro
CoulFlocon	Equ	21			; Couleur flocon (octet)
TpsFlocon	equ	#200			; Temps de bouclage des flocons
TexteSens	equ	#800			; Adresse du texte "inverse"

TailleSpY	Equ	23

; Constantes - adresses de decompactage
TrainFull equ #92A0				; Adresse gros sprite train
Musique equ TrainFull+4440			; Adresse musique
cstPeriodeOffset EQU Musique+4			; Duration of song (number of frame)
cstCrunchedDataOffset EQU Musique+#10		; Pointer to the array of Buffer Data offsets (14 words)
RegVars Equ Musique+3484			; Decompactage registres PSG
SpriteLettres equ #C000				; Adresse de la fonte
AdrEcrFloc equ #A000				; Adresse memoire ecran
TabFlocs equ AdrEcrFloc+512			; Adresse des flocons
; structure flocons = 
; IX+0 = x
; IX+1 = y
; IX+2 = inc y
; IX+3 = memo adr

	ORG	#5000

;	Write	direct	"xmas2021.bin"

	Nolist

XmasSong_ZX0
	incbin	"xmassong.zx0"
Lettres_ZX0
	Read	"Fonte_zx0.asm"
TrainFull_ZX0
	Read	"TrainFull_zx0.asm"
SantaPic
	Read	"SantaPic_zx0.asm"

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

	LD	HL,XmasSong_ZX0
	LD	DE,Musique
	CALL	Depack
	CALL	InitPlayer

	LD	HL,NewIrq
	LD	(#39),HL
	EI

	LD	HL,XmassPic
	LD	DE,#C000
	CALL	Depack
	LD	HL,CrtcStartScreen
	CALL	SendCrtc
	LD	HL,XmassPaletteFadeMid
	CALL	SetPalette2Times

; Calcul des adresses ecran pour affichage flocons
	LD	DE,AdrEcrFloc
	LD	HL,#C000
CalcAdrLoop
	LD	A,L
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
	JR	NZ,CalcAdrLoop
; Initialisation des flocons
	LD	IX,TabFlocs
	LD	B,NbFloc
	LD	DE,0
Random
	LD	HL,#4BC9
	ADD	HL,HL
	SBC	A,A
	AND	#83
	XOR	L
	LD	L,A
	LD	(Random+1),HL			; HL = valeur pseudo aleatoire
	AND	#3F
	ADD	A,2
	ADD	A,E
	LD	E,A
	CP	96
	JR	C,InitFlocon
	SUB	96
	LD	E,A
	INC	D
InitFlocon
	LD	A,L
	AND	#1F
	ADD	A,D
	LD	D,A
	LD	(IX+0),E			; Position X
	LD	(IX+1),D			; Position Y
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
	LD	HL,TpsFlocon
LoopDisplay
	LD	B,#F5
	IN	A,(C)
	RRA
	JR	NC,LoopDisplay
	PUSH	HL
	LD	HL,AdrEcrFloc
	LD	IX,TabFlocs
	LD	A,NbFloc
	LD	B,0
DisplayFloc
	EX	AF,AF'
	LD	C,(IX+0)			; Position X
	LD	L,(IX+1)			; Position Y
	LD	A,(IX+3)
	INC	A
	JR	Z,EndRestore			; Rien a restaurer
	LD	E,(HL)
	INC	H
	LD	D,(HL)
	DEC	H
	EX	DE,HL
	ADD	HL,BC
	LD	A,(IX+3)
	LD	(HL),A				; Restaurer ancienne valeur
	EX	DE,HL
EndRestore
	LD	A,C
	INC	A
	CP	96
	JR	C,SetNewPosX
	XOR	A
SetNewPosX
	LD	(IX+0),A			; Nouvelle position X
	LD	C,A
	LD	A,L
	ADD	A,(IX+2)
	CP	168
	JR	C,SetNewPosY
	XOR	A
SetNewPosY
	LD	(IX+1),A			; Nouvelle position Y
	LD	L,A
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
	LD	HL,AdrEcrFloc
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

; Fade palette
	LD	HL,XmassPaletteFadeMid
	CALL	SetPalette
	LD	HL,PaletteBlack
	CALL	SetPalette
	LD	HL,CrtcFullScreen
	CALL	SendCrtc

; Decompacter sprtie du train
	LD	HL,TrainFull_ZX0
	LD	DE,TrainFull
	CALL	Depack
; Decompacter fonte
	LD	HL,Lettres_ZX0
	LD	DE,SpriteLettres
	CALL	Depack
; Decompacter image principale
	LD	HL,SantaPic
	LD	DE,#0200
	CALL	Depack

	LD	HL,SantaPaletteFadeMid
	CALL	SetPalette2Times

; Boucle principale demo
DemoLoop
	LD	B,#F5
WaitVBL
	IN	A,(C)
	RRA
	JR	NC,WaitVBL


OldPosY
	LD	A,#FF
	INC	A
	JR	Z,EndRestoreEcr
	DEC	A
	LD	C,A
OldPosX
	LD	A,0
	CALL	RestoreEcr
EndRestoreEcr
	LD	A,(PosY+1)
	LD	(OldPosY+1),A
	LD	C,A
	LD	A,(PosX+1)
	LD	(OldPosX+1),A
	CALL	SauvSprite
PosX
	LD	A,30
PosY
	LD	C,44
	CALL	DrawSprite
	LD	HL,PosX+1
	LD	A,(HL)
IncX
	ADD	A,1
	CP	#FF
	JR	Z,SwapPosXSp
	CP	89
	JR	C,SetNewPosXSp
SwapPosXSp
	LD	A,(IncX+1)
	NEG
	LD	(IncX+1),A
	ADD	A,(HL)
SetNewPosXSp
	LD	(HL),A
	LD	HL,TabCos
	PosCos
	LD	BC,0
	ADD	HL,BC
	LD	A,(PosCos+1)
	INC	A
	AND	#7F
	LD	(PosCos+1),A
	LD	A,(HL)
	LD	(Posy+1),A

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

; Dessine l'etoile
; A = posX, C = posY
DrawSprite
	LD	(AddSpriteX+1),A
	LD	DE,SpriteEtoile
	LD	A,C
	EXX
	LD	C,A				; Y
	LD	D,TailleSpY
	LD	HL,AdrEcr
	LD	B,0
	ADD	HL,BC
	ADD	HL,BC
DrawSpriteX
	LD	A,(HL)
	EX	AF,AF'
	INC	HL
	LD	A,(HL)
	INC	HL
	EXX
	LD	H,A
	EX	AF,AF'
	LD	L,A
AddSpriteX
	LD	BC,0
	ADD	HL,BC
	EX	DE,HL
	LDI:LDI:LDI:LDI:LDI:LDI:LDI:LDI	; 8 LDI
	EX	DE,HL
	EXX
	INC	C
	DEC	D
	JR	NZ,DrawSpriteX
	RET

; Sauvegarde l'ecran sous l'etoile
SauvSprite
	LD	(AddSauvX+1),A
	LD	DE,SauvBuff
	LD	A,C
	EXX
	LD	C,A				; Y
	LD	D,TailleSpY
	LD	HL,AdrEcr
	LD	B,0
	ADD	HL,BC
	ADD	HL,BC
SauvSpriteX
	LD	A,(HL)
	EX	AF,AF'
	INC	HL
	LD	A,(HL)
	INC	HL
	EXX
	LD	H,A
	EX	AF,AF'
	LD	L,A
AddSauvX
	LD	BC,0
	ADD	HL,BC
	LDI:LDI:LDI:LDI:LDI:LDI:LDI:LDI	; 8 LDI
	EXX
	INC	C
	DEC	D
	JR	NZ,SauvSpriteX
	RET

; Restore l'ecran sous l'etoile
RestoreEcr
	LD	(AddRestoreX+1),A
	LD	DE,SauvBuff
	LD	A,C
	EXX
	LD	C,A				; Y
	LD	D,TailleSpY
	LD	HL,AdrEcr
	LD	B,0
	ADD	HL,BC
	ADD	HL,BC
RestoreEcrX
	LD	A,(HL)
	EX	AF,AF'
	INC	HL
	LD	A,(HL)
	INC	HL
	EXX
	LD	H,A
	EX	AF,AF'
	LD	L,A
AddRestoreX
	LD	BC,0
	ADD	HL,BC
	EX	DE,HL
	LDI:LDI:LDI:LDI:LDI:LDI:LDI:LDI	; 8 LDI
	EX	DE,HL
	EXX
	INC	C
	DEC	D
	JR	NZ,RestoreEcrX
	RET

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
	LD	BC,5
	ADD	HL,BC
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
TailleLettre
	LD	C,0
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
	EX	DE,HL
	LD	L,(IX+0)
	LD	H,(IX+1)
PosReel
	LD	BC,0
	ADD	HL,BC
	EX	DE,HL
DrawTrainNbCol
	LD	C,40
	LDIR
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
	LD	BC,#0EF4
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
	LD	B,C				; C=#F4 
	OUT	(C),A				; Numero du registre
	LD	B,D
	OUT	(C),B
	DW	#71ED	; out (c),0
	LD	B,C				; setup register data on PPI port A
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
	EI
RetIrq
	RET

TabExecIrq
	DW	Mode0,RetIrq,PlaySong,RetIrq,RetIrq,Mode1
	DW	RetIrq,RetIrq,RetIrq,RetIrq,RetIrq,Retirq

Mode0
	LD	BC,#7F8C
	JR	SetMode

Mode1
	LD	BC,#7F8D
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

SetPalette2Times
	CALL	SetPalette
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
	CP	C
	JR	NZ,BclPalette

	LD	BC,TpsWaitPalette
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

PaletteBlack
	DB	Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00,Basic00
XmassPaletteFadeMid
	DB	Basic00,Basic00,Basic03,Basic00,Basic00,Basic00,Basic03,Basic03,Basic06,Basic06,Basic13,Basic00,Basic00,Basic00,Basic00,Basic00
;XmassPaletteOk
	DB	Basic00,Basic03,Basic06,Basic09,Basic12,Basic13,Basic15,Basic16,Basic24,Basic25,Basic26,Basic00,Basic00,Basic00,Basic26,Basic00
SantaPaletteFadeMid
	DB	Basic00,Basic00,Basic03,Basic13,Basic00,Basic06,Basic06,Basic12,Basic12,Basic00,Basic01,Basic00,Basic00,Basic07,Basic01,Basic10
;SantaPaletteOk
	DB	Basic13,Basic03,Basic06,Basic26,Basic00,Basic15,Basic16,Basic25,Basic24,Basic04,Basic07,Basic12,Basic01,Basic17,Basic14,Basic23

CrtcNoScreen
	DB	6,0,7,#21,0				; Ecran "invisible" (R6=0)

CrtcFullScreen
	DB	1,#30,2,#32,6,#22,7,#23,12,#0D,13,0,0	; Ecran "Overscan" (32ko)

CrtcStartScreen
	DB	1,#30,2,#32,6,#15,7,#21,12,#30,13,0,0

Message
	Read	"Message.asm"
	DB	#FF

	Read	"Animations.asm"

	nolist


AdrEcr
	DW	#0200,#0A00,#1200,#1A00,#2200,#2A00,#3200,#3A00
	DW	#0260,#0A60,#1260,#1A60,#2260,#2A60,#3260,#3A60
	DW	#02C0,#0AC0,#12C0,#1AC0,#22C0,#2AC0,#32C0,#3AC0
	DW	#0320,#0B20,#1320,#1B20,#2320,#2B20,#3320,#3B20
	DW	#0380,#0B80,#1380,#1B80,#2380,#2B80,#3380,#3B80
	DW	#03E0,#0BE0,#13E0,#1BE0,#23E0,#2BE0,#33E0,#3BE0
	DW	#0440,#0C40,#1440,#1C40,#2440,#2C40,#3440,#3C40
	DW	#04A0,#0CA0,#14A0,#1CA0,#24A0,#2CA0,#34A0,#3CA0
	DW	#0500,#0D00,#1500,#1D00,#2500,#2D00,#3500,#3D00
	DW	#0560,#0D60,#1560,#1D60,#2560,#2D60,#3560,#3D60
	DW	#05C0,#0DC0,#15C0,#1DC0,#25C0,#2DC0,#35C0,#3DC0
	DW	#0620,#0E20,#1620,#1E20,#2620,#2E20,#3620,#3E20
	DW	#0680,#0E80,#1680,#1E80,#2680,#2E80,#3680,#3E80
	DW	#06E0,#0EE0,#16E0,#1EE0,#26E0,#2EE0,#36E0,#3EE0
	DW	#0740,#0F40,#1740,#1F40,#2740,#2F40,#3740,#3F40
	DW	#07A0,#0FA0,#17A0,#1FA0,#27A0,#2FA0,#37A0,#3FA0
	DW	#4000,#4800,#5000,#5800,#6000,#6800,#7000,#7800
	DW	#4060,#4860,#5060,#5860,#6060,#6860,#7060,#7860
	DW	#40C0,#48C0,#50C0,#58C0,#60C0,#68C0,#70C0,#78C0
	DW	#4120,#4920,#5120,#5920,#6120,#6920,#7120,#7920
	DW	#4180,#4980,#5180,#5980,#6180,#6980,#7180,#7980
	DW	#41E0,#49E0,#51E0,#59E0,#61E0,#69E0,#71E0,#79E0
	DW	#4240,#4A40,#5240,#5A40,#6240,#6A40,#7240,#7A40
	DW	#42A0,#4AA0,#52A0,#5AA0,#62A0,#6AA0,#72A0,#7AA0
	DW	#4300,#4B00,#5300,#5B00,#6300,#6B00,#7300,#7B00
	DW	#4360,#4B60,#5360,#5B60,#6360,#6B60,#7360,#7B60
	DW	#43C0,#4BC0,#53C0,#5BC0,#63C0,#6BC0,#73C0,#7BC0
	DW	#4420,#4C20,#5420,#5C20,#6420,#6C20,#7420,#7C20
	DW	#4480,#4C80,#5480,#5C80,#6480,#6C80,#7480,#7C80

SpriteEtoile
	Read	"EtoileSpt.asm"

TabCos
	DB	#BE,#B9,#B4,#AF,#AA,#A5,#A1,#9C,#98,#93,#8F,#8B
	DB	#87,#83,#7F,#7B,#77,#73,#6F,#6C,#68,#65,#61,#5E,#5B,#58,#55,#52
	DB	#4F,#4C,#49,#47,#44,#42,#3F,#3D,#3B,#39,#37,#35,#33,#31,#2F,#2D
	DB	#2C,#2A,#29,#27,#26,#25,#24,#23,#22,#21,#20,#1F,#1F,#1E,#1E,#1D
	DB	#1D,#1D,#1D,#1D,#1D,#1D,#1D,#1D,#1D,#1E,#1E,#1F,#1F,#20,#21,#22
	DB	#23,#24,#25,#26,#27,#29,#2A,#2C,#2D,#2F,#31,#33,#35,#37,#39,#3B
	DB	#3D,#3F,#42,#44,#47,#49,#4C,#4F,#52,#55,#58,#5B,#5E,#61,#65,#68
	DB	#6C,#6F,#73,#77,#7B,#7F,#83,#87,#8B,#8F,#93,#98,#9C,#A1,#A5,#AA,#AF,#B4,#B9,#BE

SauvBuff
	DS	300

XmassPic
	Read	"XmassPic_zx0.asm"
	list
_endxmass

