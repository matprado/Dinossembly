;DINOSSEMBLY

jmp main



main:
	
	loadn r0, #1000
	
	;Argumento r0 -> posição central do dinossemblezinho
	call imprimeDino
	
	call delay
	
	;Argumento r0 -> posição central do dinossemblezinho
	call apagaDino
	
	
	
	
	halt
	




;*******************************************************************************************************************************************
;Procedimento para imprimir o dino
;Argumento r0 -> posição central do dinossemblezinho	
imprimeDino:
	
	push r0
	push r1 ; variavel auxiliar
	
	;0  1  2  3  4
	;5  6  7  8  9
	;10 11 12 13 14
	;15 16 17 18 19
	;20 21 22 23 24
	
	outchar CORPO_CENTRO, r0
	
	inc r0
	outchar BRACO, r0
	
	loadn r1, #40
	sub r0, r0, r1
	outchar CABECA_ESQUERDA_INFERIOR, r0
	
	inc r0
	outchar CABECA_DIREITA_INFERIOR, r0
	
	loadn r1, #39
	sub r0, r0, r1
	outchar CABECA_ESQUERDA_SUPERIOR, r0
	
	inc r0
	outchar CABECA_DIREITA_SUPERIOR, r0
	
	loadn r1, #76
	add r0, r0, r1
	outchar RABO_ACIMA, r0
	
	inc r0
	outchar CORPO_ESQUERDA, r0
	
	loadn r1, #39
	add r0, r0, r1
	outchar RABO_ABAIXO, r0
	
	inc r0
	outchar CORPO_ESQUERDA_ABAIXO, r0
	
	inc r0
	outchar BARRIGA_CENTRO_INFERIOR_ESQUERDO, r0
	
	inc r0
	outchar BARRIGA_CENTRO_INFERIOR, r0
	
	loadn r1, #38
	add r0, r0, r1
	outchar PE_DINO, r0
	
	inc r0
	outchar PE_DINO, r0
	
	pop r1
	pop r0
	rts
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
apagaDino:
	
	push r0
	push r1 ; variavel com o espaço em branco
	
	loadn r1, #' '
	
	outchar r1, r0
	
	inc r0
	outchar r1, r0
	
	loadn r1, #40
	sub r0, r0, r1
	outchar r1, r0
	
	inc r0
	outchar r1, r0
	
	loadn r1, #39
	sub r0, r0, r1
	outchar r1, r0
	
	inc r0
	outchar r1, r0
	
	loadn r1, #76
	add r0, r0, r1
	outchar r1, r0
	
	inc r0
	outchar r1, r0
	
	loadn r1, #39
	add r0, r0, r1
	outchar r1, r0
	
	inc r0
	outchar r1, r0
	
	inc r0
	outchar r1, r0
	
	inc r0
	outchar r1, r0
	
	loadn r1, #38
	add r0, r0, r1
	outchar r1, r0
	
	inc r0
	outchar r1, r0
	
	pop r1
	pop r0
	rts
;*******************************************************************************************************************************************
	
	
;*******************************************************************************************************************************************
delay:
	push r0
	push r1
	
	loadn r0, #60000
	
	loopi:
		loadn r1, #60000	
		loopj:
			dec r1
			jnz loopj
		dec r0
		jnz loopi
					
	pop r1
	pop r0
	rts
;*******************************************************************************************************************************************		



;---------------------------------------------------------------
; Tela de inicio:
;---------------------------------------------------------------

tela0Linha0  : string "                                        "
tela0Linha1  : string "                                        "
tela0Linha2  : string "                                        "
tela0Linha3  : string "                                        "
tela0Linha4  : string "                                        "
tela0Linha5  : string "                                        "
tela0Linha6  : string "                                        "
tela0Linha7  : string "                                        "
tela0Linha8  : string "                                        "
tela0Linha9  : string "                                        "                   
tela0Linha10 : string "                                        "               
tela0Linha11 : string "                                        "               
tela0Linha12 : string "                                        "            
tela0Linha13 : string "                                        "                   
tela0Linha14 : string "                                        "                  
tela0Linha15 : string "                                        "
tela0Linha16 : string "                                        "
tela0Linha17 : string "                                        "
tela0Linha18 : string "                                        "
tela0Linha19 : string "                                        "
tela0Linha20 : string "                                        "
tela0Linha21 : string "                                        "
tela0Linha22 : string "                                        "
tela0Linha23 : string "                                        "
tela0Linha24 : string "                                        "
tela0Linha25 : string "                                        "
tela0Linha26 : string "                                        "
tela0Linha27 : string "                                        "
tela0Linha28 : string "                                        "
tela0Linha29 : string "                                        "