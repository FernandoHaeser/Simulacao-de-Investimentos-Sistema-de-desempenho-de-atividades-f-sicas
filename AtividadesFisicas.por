programa
{
	// Nicolas Goncalves Cafarete
    // Incluindo a biblioteca matemática com prefixo m
    inclua biblioteca Matematica --> m

    const inteiro MAX_REGISTROS = 100

    cadeia titulo_atividade[MAX_REGISTROS]
    cadeia tipo_atividade[MAX_REGISTROS]
    real calorias[MAX_REGISTROS]
    real tempo_minutos[MAX_REGISTROS]
    inteiro freq_cardiaca_media[MAX_REGISTROS]
    real ritmo_medio[MAX_REGISTROS]

    inteiro contador_registros = 0

    funcao inicio()
    {
        inteiro opcao
        cadeia opcao_sair

        enquanto (verdadeiro)
        {
            limpa()
            escreva("======================================\n")
            escreva("      Menu de Registro de Atividades\n")
            escreva("======================================\n")
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
                    escreva("\nDigite 0 para voltar ao menu: ")
                    leia(opcao_sair)
                    pare
                caso 3:
                    limpa()
                    escreva("\nSaindo do programa. Até a próxima!\n")
                    retorne
                caso contrario:
                    escreva("\nOpção inválida! Retornando ao menu...\n")
            }
        }
    }

    funcao real ler_real_positivo(cadeia mensagem)
    {
        real valor
        faca
        {
            escreva(mensagem)
            leia(valor)
            se (valor <= 0)
            {
                escreva("Valor inválido! Digite um número maior que zero.\n")
            }
        } enquanto (valor <= 0)
        retorne valor
    }

    funcao inteiro ler_inteiro_positivo(cadeia mensagem)
    {
        inteiro valor
        faca
        {
            escreva(mensagem)
            leia(valor)
            se (valor <= 0)
            {
                escreva("Valor inválido! Digite um número maior que zero.\n")
            }
        } enquanto (valor <= 0)
        retorne valor
    }

    funcao cadeia ler_cadeia_nao_vazia(cadeia mensagem)
    {
        cadeia texto
        faca
        {
            escreva(mensagem)
            leia(texto)
            se (texto == "")
            {
                escreva("Entrada inválida! Não pode ser vazia.\n")
            }
        } enquanto (texto == "")
        retorne texto
    }

    funcao registrar_atividade()
    {
        se (contador_registros >= MAX_REGISTROS)
        {
            limpa()
            escreva("\nLimite máximo de registros atingido (", MAX_REGISTROS, ").\n")
            retorne
        }

        limpa()
        escreva("======================================\n")
        escreva("       Registrar Nova Atividade\n")
        escreva("======================================\n")

        titulo_atividade[contador_registros] = ler_cadeia_nao_vazia("Digite um título para a atividade: ")

        escreva("\nEscolha o tipo de atividade:\n")
        escreva("1. Corrida\n")
        escreva("2. Musculação\n")
        escreva("3. Yoga\n")
        escreva("4. Natação\n")
        escreva("5. Caminhada\n")
        escreva("Digite a opção: ")
        inteiro tipo_opcao
        leia(tipo_opcao)

        escolha (tipo_opcao)
        {
            caso 1:
                tipo_atividade[contador_registros] = "Corrida"
                pare
            caso 2:
                tipo_atividade[contador_registros] = "Musculação"
                pare
            caso 3:
                tipo_atividade[contador_registros] = "Yoga"
                pare
            caso 4:
                tipo_atividade[contador_registros] = "Natação"
                pare
            caso 5:
                tipo_atividade[contador_registros] = "Caminhada"
                pare
            caso contrario:
                tipo_atividade[contador_registros] = "Outros"
        }

        se (tipo_atividade[contador_registros] == "Corrida" ou tipo_atividade[contador_registros] == "Caminhada")
        {
            ritmo_medio[contador_registros] = ler_real_positivo("Informe o ritmo médio (Km/h): ")
        }
        senao se (tipo_atividade[contador_registros] == "Musculação")
        {
            ritmo_medio[contador_registros] = ler_real_positivo("Informe o peso médio utilizado (kg): ")
        }
        senao se (tipo_atividade[contador_registros] == "Yoga")
        {
            ritmo_medio[contador_registros] = 0
        }
        senao se (tipo_atividade[contador_registros] == "Natação")
        {
            ritmo_medio[contador_registros] = ler_real_positivo("Informe o ritmo médio (m/min): ")
        }
        senao
        {
            ritmo_medio[contador_registros] = 0
        }

        calorias[contador_registros] = ler_real_positivo("Calorias queimadas (kcal): ")
        tempo_minutos[contador_registros] = ler_real_positivo("Tempo de atividade (minutos): ")
        freq_cardiaca_media[contador_registros] = ler_inteiro_positivo("Frequência cardíaca média (BPM): ")

        contador_registros = contador_registros + 1

        limpa()
        escreva("Atividade '", titulo_atividade[contador_registros-1], "' registrada com sucesso!\n")
    }

    funcao exibir_resumo()
    {
        se (contador_registros == 0)
        {
            limpa()
            escreva("Não há atividades registradas ainda.\n")
            retorne
        }

        limpa()
        escreva("======================================\n")
        escreva("       Resumo de Atividades\n")
        escreva("======================================\n")
        escreva("Total de atividades: ", contador_registros, "\n\n")

        real soma_calorias = 0
        real soma_tempo = 0
        inteiro soma_freq = 0
        real soma_ritmo = 0

        para (inteiro i = 0; i < contador_registros; i++)
        {
            escreva("Atividade #", i + 1, " - ", titulo_atividade[i], "\n")
            escreva("Tipo: ", tipo_atividade[i], "\n")
            escreva("Calorias: ", calorias[i], " kcal\n")

            se (tempo_minutos[i] >= 60)
            {
                escreva("Tempo: ", m.arredondar(tempo_minutos[i]/60, 2), " horas\n")
            }
            senao
            {
                escreva("Tempo: ", tempo_minutos[i], " minutos\n")
            }

            escreva("F. Cardíaca Média: ", freq_cardiaca_media[i], " BPM\n")
            se (ritmo_medio[i] > 0)
            {
                escreva("Ritmo Médio: ", ritmo_medio[i], "\n")
            }
            escreva("--------------------------------------\n")

            soma_calorias = soma_calorias + calorias[i]
            soma_tempo = soma_tempo + tempo_minutos[i]
            soma_freq = soma_freq + freq_cardiaca_media[i]
            soma_ritmo = soma_ritmo + ritmo_medio[i]
        }

        escreva("\n--- Estatísticas Gerais ---\n")
        escreva("Total de calorias queimadas: ", soma_calorias, " kcal\n")
        escreva("Tempo médio por atividade: ", m.arredondar(soma_tempo / contador_registros, 2), " min\n")
        escreva("Frequência cardíaca média: ", soma_freq / contador_registros, " BPM\n")
        escreva("Ritmo médio geral: ", soma_ritmo / contador_registros, "\n")
    }
}
