programa
{
	/*
	 * Simulação de Investimentos - Projeto de Aprendizagem
	 * Autores: Fernando A. Haeser, Isadora S. Feijó, Nicolas G. Cafarete.
	 * Data: Setembro/2025
	 * Objetivo: Desenvolver uma ferramenta que auxilie o usuário na simulação de investimentos, 
     * monitorando seus resultados e demonstrando de forma simples e prática como o dinheiro pode render.
	 */

	funcao inicio()
	{
		inteiro repetir = 1

		enquanto (repetir == 1)
		{
			real investimentoInicial // Valor que o usuário vai aplicar no início
			real investMensal       // Valor que o usuário vai adicionar todo mês
			inteiro anosSimulacao   // Duração da simulação em anos
			real taxaAnual         // Taxa de juros anual (em decimal: ex: 0.12 para 12%)
			real valorAtual        // Variável para calcular o valor acumulado mês a mês
			inteiro meses          // Contador para o laço de repetição
			inteiro opcaoInvestimento // Opção do tipo de investimento escolhido pelo usuário
			real capitalTotalInvestido = 0.0 // Para Criatividade: Rastreia o total aportado

			// --- Título e Boas-Vindas ---
			escreva("===============================================\n")
			escreva("       SIMULADOR BÁSICO DE INVESTIMENTOS       \n")
			escreva("===============================================\n")
			escreva("Olá! Vamos simular o crescimento do seu dinheiro.\n")
			escreva("-----------------------------------------------\n")

			// --- Entrada de Dados  ---
			escreva("Qual o valor que você vai investir inicialmente? R$ ")
			leia(investimentoInicial)
			capitalTotalInvestido = capitalTotalInvestido + investimentoInicial

			escreva("Qual o valor que você pretende investir mensalmente? R$ ")
			leia(investMensal)

			escreva("Por quantos anos você quer simular o investimento? ")
			leia(anosSimulacao)

			limpa()
			// --- Estrutura Condicional (Comando Condicional - escolha) ---
			escreva("-----------------------------------------------\n")
			escreva("Escolha o tipo de investimento (taxa anual aproximada):\n")
			escreva("1 - Tesouro Selic (Taxa ~10.5% a.a.)\n")
			escreva("   -> É um investimento em que o investidor empresta dinheiro ao Governo Federal, recebendo juros em troca.\n")
			escreva("   -> É considerado o investimento mais seguro do país, pois o governo garante o pagamento.\n")
			escreva("   -> Risco: Muito baixo.\n\n")

			escreva("2 - Fundo Imobiliário (Taxa ~9.0% a.a.)\n")
			escreva("   -> Representa o investimento em cotas de empreendimentos imobiliários, como prédios comerciais e shoppings.\n")
			escreva("   -> O investidor recebe parte dos lucros obtidos com aluguéis ou venda de imóveis.\n")
			escreva("   -> Risco: Médio, pois o valor pode variar conforme o mercado imobiliário.\n\n")

			escreva("3 - CDB/LCI (Taxa ~11.0% a.a.)\n")
			escreva("   -> No CDB, o investidor empresta dinheiro a um banco e recebe juros em troca.\n")
			escreva("   -> A LCI funciona de forma semelhante, mas é voltada para o setor imobiliário e tem isenção de imposto de renda.\n")
			escreva("   -> Ambos contam com proteção do Fundo Garantidor de Créditos (FGC) até R$250 mil por instituição.\n")
			escreva("   -> Risco: Baixo.\n\n")

			escreva("4 - Outra Taxa (Você define a taxa)\n")
			escreva("   -> Permite simular um investimento com a taxa de rendimento que o usuário desejar.\n")
			escreva("   -> Risco: Depende do tipo de aplicação escolhida.\n\n")
			escreva("Digite a opção desejada (1 a 4): ")
			leia(opcaoInvestimento)

			limpa()
			escolha (opcaoInvestimento)
			{
				caso 1:
					taxaAnual = 0.105
					escreva("Opção escolhida: Tesouro Selic (10.5% a.a.)\n")
					pare
				caso 2:
					taxaAnual = 0.09
					escreva("Opção escolhida: Fundo Imobiliário (9.0% a.a.)\n")
					pare
				caso 3:
					taxaAnual = 0.11
					escreva("Opção escolhida: CDB/LCI (11.0% a.a.)\n")
					pare
				caso 4:
					escreva("Digite a taxa anual de juros desejada (em % - Ex: 12): ")
					leia(taxaAnual)
					taxaAnual = taxaAnual / 100.0
					escreva("Opção escolhida: Taxa Personalizada (", taxaAnual * 100, "% a.a.)\n")
					pare
				caso contrario:
					escreva("Opção inválida. Usaremos a taxa padrão de 10% a.a.\n")
					taxaAnual = 0.10
			}

			se (taxaAnual <= 0.0)
			{
				escreva("A taxa de juros não pode ser zero ou negativa. Ajustando para 1% a.a.\n")
				taxaAnual = 0.01
			}

			// --- Processamento da Simulação ---
			valorAtual = investimentoInicial
			meses = anosSimulacao * 12
			real taxaMensal = taxaAnual / 12.0

			escreva("-----------------------------------------------\n")
			escreva("Iniciando a simulação de ", anosSimulacao, " anos (", meses, " meses)...\n")
			escreva("Taxa de Juros Mensal: ", taxaMensal * 100.0, "%\n")
			escreva("-----------------------------------------------\n")

			para (inteiro mes = 1; mes <= meses; mes++)
			{
				valorAtual = valorAtual * (1.0 + taxaMensal)

				se (mes > 1)
				{
					valorAtual = valorAtual + investMensal
					capitalTotalInvestido = capitalTotalInvestido + investMensal
				}

				se (mes % 12 == 0)
				{
					escreva("Ano ", mes / 12, ": Acumulado R$ ", valorAtual, "\n")
				}
			}

			// --- Saída de Resultados ---
			real jurosGanhos = valorAtual - capitalTotalInvestido
			escreva("===============================================\n")
			escreva("RESULTADO DA SIMULAÇÃO\n")
			escreva("===============================================\n")
			escreva("Investimento Inicial: R$ ", investimentoInicial, "\n")
			escreva("Aporte Mensal: R$ ", investMensal, "\n")
			escreva("Duração: ", anosSimulacao, " anos\n")
			escreva("Taxa Anual Utilizada: ", taxaAnual * 100.0, "%\n")
			escreva("-----------------------------------------------\n")
			escreva("Capital Total Investido (Você Aportou): R$ ", capitalTotalInvestido, "\n")
			escreva("Juros Acumulados (Seu Dinheiro Rendendo): R$ ", jurosGanhos, "\n")
			escreva("Montante Final Acumulado: R$ ", valorAtual, "\n")
			escreva("===============================================\n")
			escreva("Lembre-se: Esta é uma simulação. O valor real pode variar.\n")

			// --- ADIÇÃO: Pergunta se quer simular outro investimento ---
			escreva("\nDeseja simular outro investimento? (1 - Sim / 2 - Não): ")
			leia(repetir)
			limpa()
		}

		escreva("\nObrigado por usar o Simulador de Investimentos! Até a próxima.\n")
	}
}
