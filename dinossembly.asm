;DINOSSEMBLY

jmp main



;SUGESTÃO: FAZER 2 RANDS: 1 PARA CADA CACTO
rand : 	var #23
		static rand + #0, #0
		static rand + #1, #0
		static rand + #2, #0
		static rand + #3, #0
		static rand + #4, #0
		static rand + #5, #0
		static rand + #6, #0
		static rand + #7, #0
		static rand + #8, #0
		static rand + #9, #0
		static rand + #10, #0
		static rand + #11, #0
		static rand + #12, #0
		static rand + #13, #0
		static rand + #14, #0
		static rand + #15, #0
		static rand + #16, #0
		static rand + #17, #0
		static rand + #18, #0
		static rand + #19, #0
		static rand + #20, #0
		static rand + #21, #0
		static rand + #22, #0



main:
	
	call ApagaTela
	loadn r1, #tela0Linha0		; Imprime a tela inicial
	loadn r2, #0                ;cor branca
	call ImprimeTela

	
	
	loadn r0, #646
	call imprimeDino
	call invocaCactos
	call apagaDino
	
	call ApagaTela
	loadn r1, #tela1Linha0		; Imprime a tela inicial
	loadn r2, #0                ;cor branca
	call ImprimeTela
	
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
	
	outchar r2, r0
	
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
;argumentos r0
delay:
	push r0
	push r1
	
	;loadn r0, #64000
	
	loopi:
		loadn r1, #10000	
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


;*******************************************************************************************************************************************
;Procedimento para imprimir o cacto do tipo 0
;Argumento r0 -> posição central do cacto
;A	
imprimeCacto0:
	
	push r0 ;posição
	push r1 ; variavel auxiliar
	push r2 ; variável auxiliar para carregar os chars do charmap.mif
	
	;0  1  2  
	;3  4  5
	;6  7  8
	
	loadn r1, #41
	sub r0, r0, r1
	loadn r2, #'@'
	outchar r2, r0
		
	inc r0
	loadn r2, #'$'
	outchar r2, r0
	
	inc r0
	loadn r2, #'.'
	outchar r2, r0
	
	loadn r1, #38
	add r0, r0, r1
	loadn r2, #';'
	outchar r2, r0
	
	inc r0
	loadn r2, #'$'
	outchar r2, r0
	
	inc r0
	loadn r2, #'<'
	outchar r2, r0
	
	loadn r1, #39
	add r0, r0, r1
	loadn r2, #'$'
	outchar r2, r0
	
	pop r2
	pop r1
	pop r0
	
	rts
;*******************************************************************************************************************************************



;*******************************************************************************************************************************************
;Procedimento para imprimir o cacto do tipo 0
;Argumento r0 -> posição central do cacto
;A	
apagaCacto0:
	
	push r0 ;posição
	push r1 ; variavel auxiliar
	push r2 ; variável auxiliar para carregar o char vazio
	
	;0  1  2  
	;3  4  5
	;6  7  8
	
	loadn r2, #' '
	
	loadn r1, #41
	sub r0, r0, r1
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
	
	inc r0
	outchar r2, r0
	
	loadn r1, #39
	add r0, r0, r1
	outchar r2, r0
	
	pop r2
	pop r1
	pop r0
	
	rts
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
;Procedimento para imprimir o cacto do tipo 1
;Argumento r0 -> posição central do cacto
imprimeCacto1:
	
	push r0 ;posição
	push r1 ; variavel auxiliar
	push r2 ; variável auxiliar para carregar os chars do charmap.mif
	
	;0  1  2  
	;3  4  5
	;6  7  8
	
	loadn r1, #41
	sub r0, r0, r1
	loadn r2, #'@'
	outchar r2, r0
	
	
	inc r0
	loadn r2, #'$'
	outchar r2, r0
	
	inc r0
	loadn r2, #'$'
	outchar r2, r0
	
	
	loadn r1, #38
	add r0, r0, r1
	loadn r2, #';'
	outchar r2, r0
	
	inc r0
	loadn r2, #'$'
	outchar r2, r0
	
	inc r0
	loadn r2, #'$'
	outchar r2, r0
	
	inc r0
	loadn r2, #'.'
	outchar r2, r0
	
	loadn r1, #38
	add r0, r0, r1
	loadn r2, #'$'
	outchar r2, r0
	
	inc r0
	loadn r2, #'$'
	outchar r2, r0
	
	inc r0
	loadn r2, #'<'
	outchar r2, r0
	
	loadn r1, #38
	add r0, r0, r1
	loadn r2, #'$'
	outchar r2, r0
	
	inc r0
	loadn r2, #'$'
	outchar r2, r0
	
	pop r2
	pop r1
	pop r0
	
	rts
;*******************************************************************************************************************************************



;*******************************************************************************************************************************************
apagaCacto1:
	
	push r0 ;posição
	push r1 ; variavel auxiliar
	push r2 ; variável auxiliar para carregar os chars do charmap.mif
	
	;0  1  2  
	;3  4  5
	;6  7  8
	
	loadn r2, #' '
	
	loadn r1, #41
	sub r0, r0, r1
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
	
	inc r0
	outchar r2, r0
	
	inc r0
	outchar r2, r0
	
	loadn r1, #38
	add r0, r0, r1
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
;Argumento r0 possui a posição do dino 
;Retorna em r7 1 se houve contato ou 0 caso contrário
loopCacto0:
	
	;push r0 ; posição do dino que poderá ser modificada
	push r1 ; posição do cacto
	push r2 ; variavel auxiliar
	push r3 ; variável auxiliar == 1
	
	loadn r7, #0
	
	loadn r1, #719 ;carrega pos_ini do cacto + 1
	loadn r2, #681 ;
	loadn r3, #1
	
	;Confere se apertou espaço
	call digLetra
	
	
	loopIC0:
	
		push r0
		mov r0, r1
		call apagaCacto0
		pop r0
		
		dec r1
		
		;cmp r1, r0 ;CONTATO
		call confereContatoCacto0 ;retorna 1 ou 0 no r7
		cmp r7, r3 ;compara o retorno com 1
		jeq fim_loopIC0
		
		;Confere se apertou espaço
		call digLetra
		
		; ciclo do pulo está no r5
		call checaPulo ;checa se apertou espaço para pular ou em que ciclo o dino está para atualizar
		
		call confereContatoCacto0 ;retorna 1 ou 0 no r7
		cmp r7, r3 ;compara o retorno com 1
		jeq fim_loopIC0
		
		push r0
		mov r0, r1
		call imprimeCacto0
		loadn r0, #40
		call delay
		pop r0
		
		cmp r1, r2
		jne loopIC0
		
	fim_loopIC0:
		
		push r0
		mov r0, r1
		call apagaCacto0
		pop r0
		
		;Confere se apertou espaço
		call digLetra
	
	
		pop r3
		pop r2	
		pop r1	
		
		rts
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
;Argumento r0 possui a posição do dino 
;Retorna em r7 1 se houve contato ou 0 caso contrário
loopCacto1:
	
	;push r0 ; posição do dino que poderá ser modificada
	push r1 ; posição do cacto
	push r2 ; variavel auxiliar
	push r3 ; variável auxiliar == 1
	
	loadn r7, #0
	
	loadn r1, #678; carrega pos_ini do cacto + 1
	loadn r2, #641
	
	;Confere se apertou espaço
	call digLetra
	
	
	loopIC1:
	
		push r0
		mov r0, r1
		call apagaCacto1
		pop r0
		
		dec r1
		
		;cmp r1, r0 ;CONTATO
		call confereContatoCacto1 ;retorna 1 ou 0 no r7
		cmp r7, r3 ;compara o retorno com 1
		jeq fim_loopIC1
		
		;Confere se apertou espaço
		call digLetra
		
		; ciclo do pulo está no r5
		call checaPulo ;checa se apertou espaço para pular ou em que ciclo o dino está para atualizar
		
		call confereContatoCacto1 ;retorna 1 ou 0 no r7
		cmp r7, r3 ;compara o retorno com 1
		jeq fim_loopIC1
		
		push r0
		
		mov r0, r1
		call imprimeCacto1
		loadn r0, #40
		call delay
		pop r0
		
		cmp r1, r2
		jne loopIC1
		
	fim_loopIC1:
		
		push r0
		mov r0, r1
		call apagaCacto1
		pop r0
		
		;Confere se apertou espaço
		call digLetra
	
		
		pop r3
		pop r2	
		pop r1	
		
		rts
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
; Argumento r0 tem a posicao do dinossauro
invocaCactos:
	
	push r0
	push r1
	push r2
	push r3
	push r4
	
	loadn r5, #0  ;r5 tem o ciclo de pulo do dino que começa com 0
	loadn r1, #1
	
	loopRand: ;SORTEIO 1 DOS CACTOS
		
		;Confere se apertou espaço
		call digLetra
		
		loadn r2, #rand ; declara ponteiro para tabela rand na memoria!
		loadn r4, #22
		
		loopEscolhe:
		
			;Confere se apertou espaço
			call digLetra
		
			loadi r3, r2 ; busca nr. randomico da memoria
			inc r2
			
			cmp r3, r1
			jne opcao0
			jeq opcao1
			
			opcao0:
				call loopCacto0 ;retorna em r7 o contato 
				cmp r7, r1
				jeq fim_loopRand
				jmp fim_loopEscolhe
				
			opcao1:
				call loopCacto1 ;retorna em r7 o contato
				cmp r7, r1
				jeq fim_loopRand
				
			fim_loopEscolhe:	
				dec r4
				jz loopRand
				jnz loopEscolhe
		
		fim_loopRand:		
	
	pop r4		
	pop r3
	pop r2	
	pop r1
	pop r0
	rts
	
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
; Argumento r0 tem a posição central do dino
; Argumento r1 tem uma posicao específica do cacto
; Retorna em r7 se há um contato ou não
colisaoDino:
	
	push r0
	push r1
	push r2
	
	loadn r7, #0
	
	inc r0
	cmp r0, r1
	jeq retornaColisao1
	
	loadn r2, #39
	sub r0, r0, r2
	cmp r0, r1
	jeq retornaColisao1
	
	loadn r2, #76
	add r0, r0, r2
	cmp r0, r1
	jeq retornaColisao1
	
	loadn r2, #3
	add r0, r0, r2
	cmp r0, r1
	jeq retornaColisao1
	
	loadn r2, #38
	add r0, r0, r2
	cmp r0, r1
	jeq retornaColisao1
	
	inc r0
	cmp r0, r1
	jeq retornaColisao1
		
	jmp retorna
	
	retornaColisao1:
		loadn r7, #1
		
	retorna:
		pop r2
		pop r1
		pop r0
		rts
		
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
; Checa se apertou espaço para pular ou em que ciclo o dino está para atualizar
; Argumento r0 tem a posicao do dinossauro
; Argumento r1 tem o ciclo atual de pulo do dino
checaPulo:
	
	;push r0  ;posição do dino que será modificada, ou seja, não empilha
	;push r5  ;ciclo atual (entre 0 e 3) que será modificado, ou não, ou seja, não empilha
	push r2	 ;aux para pulo	
	push r3  ;char espaço de referencia
	push r4  ;aux para switch
	;push r6  ;letra digitada
	
	loadn r4, #0
	
	loadn r2, #120
	
	loadn r3, #32
	
	;Confere se apertou espaço
	call digLetra
		
	;checa fase atual e pulo:
	;switch(r5) PEGANDO COMO BASE A FUNÇÃO NO CODIGO DA FORCA
	cmp r5, r4	; Se case == 0
	jeq Compara_Case0
	
	inc r4
	cmp r5, r4 ; Se case == 1
	jeq Compara_Case1
	
	inc r4
	cmp r5, r4 ; Se case == 2
	jeq Compara_Case2
	
	inc r4
	cmp r5, r4 ; Se case == 3
	jeq Compara_Case3
	
	inc r4
	cmp r5, r4 ; Se case == 4
	jeq Compara_Case4
	
	inc r4
	cmp r5, r4 ; Se case == 5
	jeq Compara_Case5
	
	inc r4
	cmp r5, r4 ; Se case == 6
	jeq Compara_Case6
	
	inc r4
	cmp r5, r4 ; Se case == 7
	jeq Compara_Case7
	
	
	jmp Compara_FimSwitch	; Break do Switch
	
	Compara_Case0:
		
		;Confere se apertou espaço
		call digLetra
		
		cmp r6, r3
		jne Compara_FimSwitch ;Se Não apertou não faz nada
		
		loadn r6, #255	;reseta r6
		
		;Se apertou, vai pro próximo ciclo e atualiza a posição do dino
		inc r5
		
		call apagaDino
		sub r0, r0, r2
		call imprimeDino
		
		jmp Compara_FimSwitch	; Break do Switch
	
	Compara_Case1:
	
		;vai pro próximo ciclo e atualiza a posição do dino

		inc r5
		
		call apagaDino
		sub r0, r0, r2
		call imprimeDino
		
		jmp Compara_FimSwitch	; Break do Switch
		
	Compara_Case2:
		
		;vai pro próximo ciclo e atualiza a posição do dino

		inc r5
		
		call apagaDino
		sub r0, r0, r2
		call imprimeDino
		
		jmp Compara_FimSwitch	; Break do Switch
		
	Compara_Case3:
		
		;vai pro próximo ciclo e atualiza a posição do dino

		inc r5
		
		call apagaDino
		sub r0, r0, r2
		call imprimeDino
		
		jmp Compara_FimSwitch	; Break do Switch	
	
	Compara_Case4:
		
		;vai pro próximo ciclo e atualiza a posição do dino

		inc r5
		
		call apagaDino
		add r0, r0, r2
		call imprimeDino
		
		jmp Compara_FimSwitch	; Break do Switch
		
	Compara_Case5:
		
		;vai pro próximo ciclo e atualiza a posição do dino

		inc r5
		
		call apagaDino
		add r0, r0, r2
		call imprimeDino
		
		jmp Compara_FimSwitch	; Break do Switch
		
	Compara_Case6:
		
		;vai pro próximo ciclo e atualiza a posição do dino

		inc r5
		
		call apagaDino
		add r0, r0, r2
		call imprimeDino
		
		jmp Compara_FimSwitch	; Break do Switch
					
		
	Compara_Case7:
		
		;vai pro próximo ciclo e atualiza a posição do dino

		loadn r5, #0
		
		call apagaDino
		add r0, r0, r2
		call imprimeDino
		
		jmp Compara_FimSwitch	; Break do Switch
	
	Compara_FimSwitch:
	
	;Confere se apertou espaço
	call digLetra
	
	pop r4
	pop r3
	pop r2	
	
	rts
	
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
digLetra:	; Tenta ler uma tecla digitada e retorna no r6 a letra ou 255 se não há nada digitado; (se r6 já tem a tecla espeço digitada não precisa ler)
	push r0
	push r1
	push r2
	
	loadn r1, #255	; Se nao digitar nada vem 255
	loadn r2, #32
	
   	cmp r6, r2
   	jeq fimDigLetra
   	
   	inchar r0		; Le o teclado, se nada for digitado = 255
	mov r6, r0		; Salva a tecla no r2 e retorna

	fimDigLetra:
	
	pop r2
	pop r1
	pop r0
	
	rts
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
; Argumento r0 tem a posicao central do dinossauro
; Argumento r1 tem a posição central do cacto
; Retorna 1 ou 0 no r7 indicando se houve ou não o contato
confereContatoCacto0:
	
	push r0
	push r1
	push r2
	push r3
	
	loadn r3, #1
	
	loadn r2, #41
	sub r1, r1, r2
	call colisaoDino
	cmp r7, r3
	jeq fim_confereContato0
	
	inc r1
	call colisaoDino
	cmp r7, r3
	jeq fim_confereContato0
	
	inc r1
	call colisaoDino
	cmp r7, r3
	jeq fim_confereContato0
	
	loadn r2, #38
	add r1, r1, r2
	call colisaoDino
	cmp r7, r3
	jeq fim_confereContato0	
		
	fim_confereContato0:	
		pop r3
		pop r2	
		pop r1
		pop r0
		rts
	
;*******************************************************************************************************************************************


;*******************************************************************************************************************************************
; Argumento r0 tem a posicao central do dinossauro
; Argumento r1 tem a posição central do cacto
; Retorna 1 ou 0 no r7 indicando se houve ou não o contato
confereContatoCacto1:
	
	push r0
	push r1
	push r2
	push r3
	
	loadn r3, #1
	
	loadn r2, #41
	sub r1, r1, r2
	call colisaoDino
	cmp r7, r3
	jeq fim_confereContato1
	
	inc r1
	call colisaoDino
	cmp r7, r3
	jeq fim_confereContato1
	
	inc r1
	call colisaoDino
	cmp r7, r3
	jeq fim_confereContato1
	
	loadn r2, #38
	add r1, r1, r2
	call colisaoDino
	cmp r7, r3
	jeq fim_confereContato1	
	
	loadn r2, #3
	add r1, r1, r2
	call colisaoDino
	cmp r7, r3
	jeq fim_confereContato1
		
	fim_confereContato1:
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
tela0Linha19 : string "________________________________________"
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

;---------------------------------------------------------------
; Tela de game-over:
;---------------------------------------------------------------

tela1Linha0  : string "                                        "
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string "                                        "
tela1Linha4  : string "                                        "
tela1Linha5  : string "                                        "
tela1Linha6  : string "                                        "
tela1Linha7  : string "                                        "
tela1Linha8  : string "                                        "
tela1Linha9  : string "________________________________________"                   
tela1Linha10 : string "                                        "               
tela1Linha11 : string "                                        "               
tela1Linha12 : string "                                        "            
tela1Linha13 : string "                                        "                   
tela1Linha14 : string "           G A M E - O V E R            "                   
tela1Linha15 : string "                                        "
tela1Linha16 : string "                                        "
tela1Linha17 : string "                                        "
tela1Linha18 : string "                                        "
tela1Linha19 : string "________________________________________"
tela1Linha20 : string "                                        "
tela1Linha21 : string "                                        "
tela1Linha22 : string "                                        "
tela1Linha23 : string "                                        "
tela1Linha24 : string "                                        "
tela1Linha25 : string "                                        "
tela1Linha26 : string "                                        "
tela1Linha27 : string "                                        "
tela1Linha28 : string "                                        "
tela1Linha29 : string "                                        "