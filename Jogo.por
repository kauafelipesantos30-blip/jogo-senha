programa
{
	funcao logico verificar(cadeia palpite[], cadeia senha[]){
	          inteiro acertos = 0
			para (inteiro i = 0; i < 4; i = i +1){
				se (palpite[i] == senha[i]){
					acertos = acertos + 1
				}
			}
			retorne acertos == 4
}

	funcao inicio()
	{
          //vermelho, roxo, verde, laranja, amarelo, azul	
		cadeia opcoes[] = {"🔴", "🟣", "🟢", "🟠", "🟡", "🔵"}
		cadeia senha[] = {"🟣", "🟡", "🟠", "🔴"}
		inteiro tentativas = 10
		cadeia palpites[10][4]
		logico acertou = falso

		escreva("===== JOGO SENHA =====\n\n")
		escreva("Cores disponiveis:\n")
		para (inteiro i = 0; i < 6; i = i + 1) {
			escreva(opcoes[i], " ")
		}
		escreva("\nDigite quatro cores para tentar descobrir a senha!\n")
		escreva("Para cada cor correta, você recebera um emoji preto (⚫) e para cada cor correta, mas na posição errada, você recebera um emoji branco (⚪)\n.")

		enquanto (tentativas > 0 e nao acertou) {
			escreva("Digite seu palpite: ")
			cadeia palpite[4]
			leia(palpite[0])
			leia(palpite[1])
			leia(palpite[2])
			leia(palpite[3])

			acertou = verificar(palpite, senha)

			limpa()

			se (acertou) {
				escreva("Parabéns! Você acertou!")
			} senao {
				para (inteiro i = 0; i < 4; i = i + 1){
					palpites[10 - tentativas][i] = palpite[i]
			   }
			   escreva("Senha incorreta! Você tem ", tentativas - 1, " tentativas restantes\n")
			   escreva("Cores disponiveis:\n")
			   para (inteiro i = 0; i < 6; i = i + 1) {
			   	escreva(opcoes[i], " ") 
			   }
         escreva("\n")

			   para (inteiro i = 0; i < 10 - tentativas + 1; i = i + 1) {
			   	inteiro posicao_correta = 0
			   	inteiro posicao_errada = 0
			  
			   	logico usados[] = {falso, falso, falso, falso}

			   	para (inteiro j = 0; j < 4; j = j + 1) {
			   		se (palpites[i][j] == senha[j]) {
			   			posicao_correta = posicao_correta + 1
			   			usados[j] = verdadeiro
			   		 }
			   	  }

			   	  para (inteiro j = 0; j < 4; j = j + 1) {
			   	  	se (palpites[i][j] != senha[j]) {
			   	  		para (inteiro k = 0; k < 4; k = k + 1) {
			   	  			se (nao usados[k] e palpites[i][j] ==senha[k]) {
			   	  				posicao_errada = posicao_errada + 1
			   	  				usados[k] = verdadeiro
			   	  			}
			               }		   
			   	     }
			   	  }
			   	  escreva("Tentativa: ")
			   	  para (inteiro j = 0; j < 4; j = j + 1) {
			   	  	escreva(palpites[i][j])
			   	  }
			   	  escreva(" | Dicas: ")
			   	  para(inteiro j = 0; j < posicao_correta; j = j + 1) {
			   	  	escreva("⚫ ")
			   	  }
			   	  para(inteiro j = 0; j < posicao_errada; j = j + 1) {
			   	  	escreva("⚪ ")
			   	  }
			   	  	escreva("\n")
			   }
			   tentativas = tentativas - 1
			}
		}
	}
}