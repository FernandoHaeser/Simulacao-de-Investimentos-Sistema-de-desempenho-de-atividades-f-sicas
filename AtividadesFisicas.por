programa
{
	// Constante para o tamanho máximo do vetor de registros
	const inteiro MAX_REGISTROS = 100
	
	// Vetores para armazenar os dados de cada atividade
	cadeia tipo_atividade[MAX_REGISTROS]
	real calorias[MAX_REGISTROS]
	real tempo_minutos[MAX_REGISTROS]
	inteiro freq_cardiaca_media[MAX_REGISTROS]
	real ritmo_medio[MAX_REGISTROS] // Exemplo: km/h ou min/km
	
	// Variável para contar quantos registros foram feitos
	inteiro contador_registros = 0

	funcao inicio()
	{
		inteiro opcao

		// Loop principal do menu
		enquanto (verdadeiro)
		{
			escreva("\n--- Menu de Registro de Atividades ---\n")
			escreva("1. Registrar Nova Atividade\n")
			escreva("2. Exibir Resumo de Atividades\n")
			escreva("3. Sair\n")
			escreva("Escolha uma opção: ")
			leia(opcao)

			escolha (opcao)
			{
				caso 1:
					registrar_atividade()
					pare
				caso 2:
					exibir_resumo()
					pare
				caso 3:
					escreva("Saindo do programa. Até a próxima!\n")
					retorne // Finaliza a função inicio e o programa
				caso contrario:
					escreva("Opção inválida! Tente novamente.\n")
			}
		}
	}

	// Função para registrar os dados de uma nova atividade
	funcao registrar_atividade()
	{
		// Verifica se ainda há espaço para novos registros
		se (contador_registros < MAX_REGISTROS)
		{
			escreva("\n--- Registro de Nova Atividade ---\n")
			
			// 1. Tipo de Atividade
			escreva("Digite o Tipo de Atividade (Ex: Corrida, Yoga, Musculação): ")
			leia(tipo_atividade[contador_registros])

			// 2. Calorias
			escreva("Calorias queimadas (kcal): ")
			leia(calorias[contador_registros])

			// 3. Tempo de Atividade
			escreva("Tempo de Atividade (minutos): ")
			leia(tempo_minutos[contador_registros])

			// 4. Frequência Cardíaca Média
			escreva("Frequência Cardíaca Média (BPM): ")
			leia(freq_cardiaca_media[contador_registros])

			// 5. Ritmo Médio
			escreva("Ritmo Médio (Ex: Km/h ou min/km): ")
			leia(ritmo_medio[contador_registros])

			// Incrementa o contador para o próximo registro
			contador_registros = contador_registros + 1
			escreva("\nRegistro de atividade concluído com sucesso!\n")
		}
		senao
		{
			escreva("\nLimite máximo de registros atingido (", MAX_REGISTROS, "). Não é possível registrar mais atividades.\n")
		}
	}

	// Função para exibir o resumo de todos os registros
	funcao exibir_resumo()
	{
		se (contador_registros == 0)
		{
			escreva("\nNão há atividades registradas ainda.\n")
		}
		senao
		{
			escreva("\n--- Resumo de Atividades Registradas ---\n")
			escreva("Total de atividades: ", contador_registros, "\n\n")

			// Loop para percorrer e exibir cada registro
			para (inteiro i = 0; i < contador_registros; i++)
			{
				escreva("--- Atividade #", i + 1, " ---\n")
				escreva("Tipo: ", tipo_atividade[i], "\n")
				escreva("Calorias: ", calorias[i], " kcal\n")
				escreva("Tempo: ", tempo_minutos[i], " minutos\n")
				escreva("F. Cardíaca Média: ", freq_cardiaca_media[i], " BPM\n")
				escreva("Ritmo Médio: ", ritmo_medio[i], "\n")
			}
		}
	}
}