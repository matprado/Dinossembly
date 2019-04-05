;DINOSSEMBLY

jmp main



;SUGESTÃO: FAZER 2 RANDS: 1 PARA CADA CACTO
rand : 	var #50
		static rand + #0, #0
		static rand + #1, #1
		static rand + #2, #1
		static rand + #3, #1
		static rand + #4, #0
		static rand + #5, #1
		static rand + #6, #0
		static rand + #7, #0
		static rand + #8, #1
		static rand + #9, #0
		static rand + #10, #0
		static rand + #11, #1
		static rand + #12, #0
		static rand + #13, #0
		static rand + #14, #0
		static rand + #15, #0
		static rand + #16, #1
		static rand + #17, #0
		static rand + #18, #1
		static rand + #19, #1
		static rand + #20, #0
		static rand + #21, #1
		static rand + #22, #0		




main:
	
	call ApagaTela
	loadn r1, #tela0Linha0		; Imprime a tela inicial
	loadn r2, #0                ;cor branca
	call ImprimeTela
	
	breakp
	
	loadn r0, #646
	
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
	
	push r0 ;posição
	push r1 ; variavel auxiliar
	push r2 ; variável auxiliar para carregar os chars do charmap.mif
	
	;0  1  2  3  4
	;5  6  7  8  9
	;10 11 12 13 14
	;15 16 17 18 19
	;20 21 22 23 24
	
	loadn r2, #'$'
	outchar r2, r0
	
	inc r0
	loadn r2, #'^'
	outchar r2, r0
	
	loadn r1, #40
	sub r0, r0, r1
	loadn r2, #'*'
	outchar r2, r0
	
	inc r0
	loadn r2, #'+'
	outchar r2, r0
	
	loadn r1, #41
	sub r0, r0, r1
	loadn r2, #'('
	outchar r2, r0
	
	inc r0
	loadn r2, #')'
	outchar r2, r0
	
	loadn r1, #76
	add r0, r0, r1
	loadn r2, #'"'
	outchar r2, r0
	
	inc r0
	loadn r2, #'%'
	outchar r2, r0
	
	loadn r1, #39
	add r0, r0, r1
	loadn r2, #'#'
	outchar r2, r0
	
	inc r0
	loadn r2, #'&'
	outchar r2, r0
	
	inc r0
	loadn r2, #']'
	outchar r2, r0
	
	inc r0
	loadn r2, #'['
	outchar r2, r0
	
	loadn r1, #38
	add r0, r0, r1
	loadn r2, #'!'
	outchar r2, r0
	
	inc r0
	outchar r2, r0
	
	pop r2
	pop r1
	pop r0
	
	rts
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
apagaDino:
	
	push r0
	push r1 
	push r2 ; variavel com o espaço em branco
	
	loadn r2, #' '
	
	outchar r1, r0
	
	inc r0
	outchar r2, r0
	
	loadn r1, #40
	sub r0, r0, r1
	outchar r2, r0
	
	inc r0
	outchar r2, r0
	
	loadn r1, #41
	sub r0, r0, r1
	outchar r2, r0
	
	inc r0
	outchar r2, r0
	
	loadn r1, #76
	add r0, r0, r1
	outchar r2, r0
	
	inc r0
	outchar r2, r0
	
	loadn r1, #39
	add r0, r0, r1
	outchar r2, r0
	
	inc r0
	outchar r2, r0
	
	inc r0
	outchar r2, r0
	
	inc r0
	outchar r2, r0
	
	loadn r1, #38
	add r0, r0, r1
	outchar r2, r0
	
	inc r0
	outchar r2, r0
	
	pop r2
	pop r1
	pop r0
	rts
;*******************************************************************************************************************************************
	
	
;*******************************************************************************************************************************************
delay:
	push r0
	push r1
	
	loadn r0, #64000
	
	loopi:
		loadn r1, #2000	
		loopj:
			dec r1
			jnz loopj
		dec r0
		jnz loopi
					
	pop r1
	pop r0
	rts
;*******************************************************************************************************************************************		


;*******************************************************************************************************************************************
ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	;label for(r0=1200;r3>0;r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts	
;*******************************************************************************************************************************************		



;*******************************************************************************************************************************************
ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
				;  r1 = endereco onde comeca a primeira linha do Cenario
				;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;*******************************************************************************************************************************************		


;*******************************************************************************************************************************************
ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
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
tela0Linha19 : string "----------------------------------------"
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