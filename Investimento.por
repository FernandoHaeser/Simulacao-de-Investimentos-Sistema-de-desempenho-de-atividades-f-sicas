programa
{
	/*
	 * Simulação de Investimentos - Projeto de Aprendizagem
	 * Autores: Fernando A. Haeser, Isadora S. Feijó, Nicolas G. Cafarete.
	 * Data: Setembro/2025
	 * Objetivo: Desenvolver uma ferramenta que auxilie o usuário na simulação de investimentos, 
     * monitorando seus resultados e demonstrando de forma simples e prática como o dinheiro pode render.
	 */

	inclua biblioteca Matematica --> m

	// 🔹 VARIÁVEIS GLOBAIS PARA SOMAR TODOS OS INVESTIMENTOS
	real totalGeralInvestido = 0.0
	real totalGeralJuros = 0.0
	real totalGeralFinal = 0.0
	inteiro totalSimulacoes = 0

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
			real capitalTotalInvestido = 0.0 // Rastreia o total aportado

			// --- Título e Boas-Vindas ---
			escreva("╔════════════════════════════════════════════════╗\n")
      		escreva("║       SIMULADOR BÁSICO DE INVESTIMENTOS        ║\n")
      		escreva("╚════════════════════════════════════════════════╝\n")

			escreva("➤ Olá! Vamos simular o crescimento do seu dinheiro!\n\n")
		
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
			escreva("╔══════════════════════════════════════════════════════════════════╗\n")
      		escreva("║                💰 Tipos de Investimento 💰                      ║\n")
      		escreva("╠══════════════════════════════════════════════════════════════════╣\n")
      		escreva("║ 1 — Tesouro Selic (Taxa ≈ 10.5% a.a.)                            ║\n")
      		escreva("║    → Investimento em que o investidor empresta dinheiro ao       ║\n")
      		escreva("║      Governo Federal, recebendo juros em troca.                  ║\n")
      		escreva("║    → Considerado o investimento mais seguro do país.             ║\n")
      		escreva("║    → Risco: Muito baixo.                                         ║\n")
      		escreva("╠──────────────────────────────────────────────────────────────────╣\n")
      		escreva("║ 2 — Fundo Imobiliário (Taxa ≈ 9.0% a.a.)                         ║\n")
      		escreva("║    → Investimento em cotas de empreendimentos imobiliários.      ║\n")
      		escreva("║    → Lucros obtidos com aluguéis ou venda de imóveis.            ║\n")
      		escreva("║    → Risco: Médio.                                               ║\n")
      		escreva("╠──────────────────────────────────────────────────────────────────╣\n")
      		escreva("║ 3 — CDB/LCI (Taxa ≈ 11.0% a.a.)                                  ║\n")
      		escreva("║    → CDB: empresta dinheiro a um banco e recebe juros.           ║\n")
      		escreva("║    → LCI: semelhante, voltada ao setor imobiliário, isenta de IR.║\n")
      		escreva("║    → Proteção FGC até R$250 mil por instituição.                 ║\n")
      		escreva("║    → Risco: Baixo.                                               ║\n")
      		escreva("╠──────────────────────────────────────────────────────────────────╣\n")
      		escreva("║ 4 — Outra Taxa (Definida pelo usuário)                           ║\n")
      		escreva("║    → Permite simular qualquer taxa desejada.                     ║\n")
      		escreva("║    → Risco: Depende da aplicação.                                ║\n")
      		escreva("╚══════════════════════════════════════════════════════════════════╝\n")
      		escreva("Digite a opção desejada (1 a 4): ")
			leia(opcaoInvestimento)

			limpa()
      		escreva("╔═══════════════════════════════════════════════╗\n")
      		escreva("║         ESCOLHA DO INVESTIMENTO               ║\n")
      		escreva("╚═══════════════════════════════════════════════╝\n\n")
      		escolha (opcaoInvestimento)
      		{
        		caso 1:
          			taxaAnual = 0.105
          			escreva("➡️  Tesouro Selic (10.5% a.a.) selecionado!\n")
          			pare
        		caso 2:
          			taxaAnual = 0.09
          			escreva("➡️  Fundo Imobiliário (9.0% a.a.) selecionado!\n")
          			pare
        		caso 3:
          			taxaAnual = 0.11
          			escreva("➡️  CDB/LCI (11.0% a.a.) selecionado!\n")
          			pare
        		caso 4:
          			escreva("Digite a taxa anual desejada (%): ")
          			leia(taxaAnual)
          			taxaAnual = taxaAnual / 100.0
          			escreva("➡️  Taxa Personalizada (", taxaAnual * 100, "% a.a.) selecionada!\n")
          			pare
        		caso contrario:
          			escreva("❌ Opção inválida. Usando taxa padrão de 10% a.a.\n")
          			taxaAnual = 0.10
      		}

      		escreva("\n╔═══════════════════════════════════════════════╗\n")
      		escreva("║        INICIANDO SIMULAÇÃO DE INVESTIMENTO    ║\n")
      		escreva("╚═══════════════════════════════════════════════╝\n")

      		valorAtual = investimentoInicial
      		meses = anosSimulacao * 12
      		real taxaMensal = taxaAnual / 12.0

      		escreva("📆 Duração: ", anosSimulacao, " anos (", meses, " meses)\n")
      		escreva("💰 Taxa Mensal: ", taxaMensal * 100.0, "%\n")
      		escreva("───────────────────────────────────────────────\n")

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
          			escreva("📅 Ano ", mes / 12, ": R$ ", m.arredondar(valorAtual, 2), "\n")
        		}
      		}

      		real jurosGanhos = valorAtual - capitalTotalInvestido

      		escreva("\n╔═══════════════════════════════════════════════╗\n")
      		escreva("║              RESULTADO FINAL                  ║\n")
      		escreva("╚═══════════════════════════════════════════════╝\n")
      		escreva("💵 Investimento Inicial: R$ ", m.arredondar(investimentoInicial, 2), "\n")
      		escreva("📈 Aporte Mensal: R$ ", m.arredondar(investMensal, 2), "\n")
      		escreva("🕓 Tempo Total: ", anosSimulacao, " anos\n")
      		escreva("💹 Taxa Anual: ", taxaAnual * 100.0, "%\n")
      		escreva("───────────────────────────────────────────────\n")
      		escreva("💰 Capital Investido: R$ ", m.arredondar(capitalTotalInvestido, 2), "\n")
      		escreva("💸 Juros Ganhos: R$ ", m.arredondar(jurosGanhos, 2), "\n")
      		escreva("🏦 Montante Final: R$ ", m.arredondar(valorAtual, 2), "\n")
      		escreva("───────────────────────────────────────────────\n")
      		escreva("📢 Lembre-se: Esta é uma simulação. Os valores reais podem variar.\n")

			// --- Somar ao total geral de todas as simulações ---
			totalSimulacoes = totalSimulacoes + 1
			totalGeralInvestido = totalGeralInvestido + capitalTotalInvestido
			totalGeralJuros = totalGeralJuros + jurosGanhos
			totalGeralFinal = totalGeralFinal + valorAtual

			// --- Mostrar resumo geral ---
			escreva("\n╔═══════════════════════════════════════════════╗\n")
			escreva("║               RESUMO GERAL                     ║\n")
			escreva("╚═══════════════════════════════════════════════╝\n")
			escreva("Simulações realizadas: ", totalSimulacoes, "\n")
			escreva("Total investido: R$ ", m.arredondar(totalGeralInvestido, 2), "\n")
			escreva("Total em juros ganhos: R$ ", m.arredondar(totalGeralJuros, 2), "\n")
			escreva("Total acumulado geral: R$ ", m.arredondar(totalGeralFinal, 2), "\n")

			// --- Pergunta se quer simular outro investimento ---
			escreva("\nDeseja simular outro investimento? (1 - Sim / 2 - Não): ")
			leia(repetir)
			limpa()
		}

		escreva("\nObrigado por usar o Simulador de Investimentos! Até a próxima.\n")
	}
}
