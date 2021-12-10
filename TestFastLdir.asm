
	org	#A000

Test1
	LD	HL,#4000
	LD	DE,#C000
	LD	BC,#4000
	JP	TestLdir

Test2
	LD	HL,#4000
	LD	DE,#C000
	LD	BC,#4000
	JP	TestFastLdir

TestFastLdir
	LD	A,16
	SUB	C
	AND	15
	ADD	A,A
	LD	(FastLdir_Entry+1),A
FastLdir_Entry
	JR	FastLdir_Entry
FastLdir_Loop
	LDI:LDI:LDI:LDI:LDI:LDI:LDI:LDI
	LDI:LDI:LDI:LDI:LDI:LDI:LDI:LDI
	JP	PE,FastLdir_Loop
	RET

TestLdir
	LDIR
	RET