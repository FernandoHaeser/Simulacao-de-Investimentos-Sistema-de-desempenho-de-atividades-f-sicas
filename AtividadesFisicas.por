programa
{
    /*
    * App de Controle de Atividades Fisicas - Projeto de Aprendizagem
	* Autores: Fernando A. Haeser, Isadora S. Feijó, Nicolas G. Cafarete.
	* Data: Setembro/2025
    */
    inclua biblioteca Matematica --> m

    // Constante que define o máximo de registros possíveis
    const inteiro MAX_REGISTROS = 100

    cadeia titulo_atividade[MAX_REGISTROS]      // Nome/título da atividade
    cadeia tipo_atividade[MAX_REGISTROS]        // Tipo(caminhada, corrida, etc.)
    real calorias[MAX_REGISTROS]                // Calorias gastas
    real tempo_minutos[MAX_REGISTROS]           // Tempo em minutos
    inteiro freq_cardiaca_media[MAX_REGISTROS]  // Frequência cardíaca 
    real ritmo_medio[MAX_REGISTROS]             // Ritmo(Km/h, m/min ou peso usado)

    // Contador para a quantidade de atividades registradas
    inteiro contador_registros = 0

    // Início da função principal
    funcao inicio()
    {
        inteiro opcao
        cadeia opcao_sair

        // Loop principal do programa
        enquanto (verdadeiro)
        {
            // Limpa a tela e exibe o menu principal
            limpa()
            escreva("======================================\n")
            escreva("|   Menu de Registro de Atividades   |\n")
            escreva("======================================\n")
            escreva("1. Registrar Nova Atividade\n")
            escreva("2. Exibir Resumo de Atividades\n")
            escreva("3. Sair\n")
            escreva("Escolha uma opção: ")
            leia(opcao)

            // Estrutura de decisão para escolher a opção do usuário
            escolha (opcao)
            {
                caso 1:
                    registrar_atividade() // Chama a função para registrar
                    pare
                caso 2:
                    exibir_resumo() // Mostra as estatísticas 
                    escreva("\nDigite 0 para voltar ao menu: ") 
                    leia(opcao_sair) // Apenas pausa antes de voltar
                    pare
                caso 3:
                    limpa()
                    escreva("\nSaindo do programa. Até a próxima!\n")
                    retorne               // Encerra o programa
                caso contrario:
                    escreva("\nOpção inválida! Retornando ao menu...\n")
            }
        }
    }

    // Funções de leitura segura (só deixa passar valores válidos)
    // Lê um número real positivo(valida a entrada)
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

    // Lê um número inteiro positivo (valida a entrada)
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

    // Lê um texto não vazio (valida a entrada)
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
    // Função registro de atividade
    funcao registrar_atividade()
    {
        // Impede que ultrapasse o limite de registros
        se (contador_registros >= MAX_REGISTROS)
        {
            limpa()
            escreva("\nLimite máximo de registros atingido (", MAX_REGISTROS, ").\n")
            retorne
        }

        // Tela de cadastro
        limpa()
        escreva("======================================\n")
        escreva("|      Registrar Nova Atividade      |\n")
        escreva("======================================\n")

        // Lê título da atividade
        titulo_atividade[contador_registros] = ler_cadeia_nao_vazia("Digite um título para a atividade: ")

        // Escolha do tipo de atividade 
        escreva("\nEscolha o tipo de atividade:\n")
        escreva("1. Corrida\n")
        escreva("2. Musculação\n")
        escreva("3. Yoga\n")
        escreva("4. Natação\n")
        escreva("5. Caminhada\n")
        escreva("Digite a opção: ")
        inteiro tipo_opcao
        leia(tipo_opcao)

        // Associa a opção escolhida ao vetor de tipos
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

        // Dependendo do tipo de atividade, pede medidas diferentes
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

        // Demais informações obrigatórias 
        calorias[contador_registros] = ler_real_positivo("Calorias queimadas (kcal): ")
        tempo_minutos[contador_registros] = ler_real_positivo("Tempo de atividade (minutos): ")
        freq_cardiaca_media[contador_registros] = ler_inteiro_positivo("Frequência cardíaca média (BPM): ")

        // Atualiza contador 
        contador_registros = contador_registros + 1

        limpa()
        escreva("Atividade '", titulo_atividade[contador_registros-1], "' registrada com sucesso!\n")
    }

    // Função exibir resumo
    funcao exibir_resumo()
{
    // Caso não haja registros 
    se (contador_registros == 0)
    {
        limpa()
        escreva("==========================================\n")
        escreva("|       NENHUMA ATIVIDADE REGISTRADA     |  \n")
        escreva("==========================================\n")
        retorne
    }
    // Cabeçalho
    limpa()
    escreva("==========================================\n")
    escreva("|         RESUMO DE ATIVIDADES           |  \n")
    escreva("==========================================\n")
    escreva("TOTAL DE ATIVIDADES: ", contador_registros, "\n")

    // Lista fixa com tipos de atividade
    cadeia tipos[5]
    tipos[0] = "Corrida"
    tipos[1] = "Musculação"
    tipos[2] = "Yoga"
    tipos[3] = "Natação"
    tipos[4] = "Caminhada"

    // Acumuladores gerais
    real soma_calorias = 0
    real soma_tempo = 0
    inteiro soma_freq = 0
    real soma_ritmo = 0

    // Mostrar por categoria somente se existir atividade
    para (inteiro t = 0; t < 5; t++)
    {
        cadeia tipo_atual = tipos[t]
        inteiro encontrou = 0

        // Verifica se existe ao menos uma atividade desse tipo
        para (inteiro i = 0; i < contador_registros; i++)
        {
            se (tipo_atividade[i] == tipo_atual)
            {
                encontrou = 1
                pare
            }
        }

        // Se achou, imprime todas desse tipo
        se (encontrou == 1)
        {
            escreva("\n==========================================\n")
            escreva("        ATIVIDADES - ", tipo_atual, "\n")
            escreva("==========================================\n")

            para (inteiro i = 0; i < contador_registros; i++)
            {
                se (tipo_atividade[i] == tipo_atual)
                {
                    escreva("Título:              ", titulo_atividade[i], "\n")
                    escreva("Calorias:            ", calorias[i], " kcal\n")

                    // Mostra em horas se >= 60min
                    se (tempo_minutos[i] >= 60)
                    {
                        escreva("Tempo:               ", m.arredondar(tempo_minutos[i] / 60, 2), " horas\n")
                    }
                    senao
                    {
                        escreva("Tempo:               ", tempo_minutos[i], " minutos\n")
                    }

                    escreva("Frequência Cardíaca: ", freq_cardiaca_media[i], " BPM\n")

                    se (ritmo_medio[i] > 0)
                    {
                        escreva("Ritmo/Peso Médio:    ", ritmo_medio[i], "\n")
                    }

                    escreva("------------------------------------------\n")

                    // Acumuladores gerais(atualiza)
                    soma_calorias = soma_calorias + calorias[i]
                    soma_tempo = soma_tempo + tempo_minutos[i]
                    soma_freq = soma_freq + freq_cardiaca_media[i]
                    soma_ritmo = soma_ritmo + ritmo_medio[i]
                }
            }
        }
    }

    // Estatísticas gerais
    escreva("\n==========================================\n")
    escreva("|         ESTATÍSTICAS GERAIS            | \n")
    escreva("==========================================\n")

    escreva("Total de calorias:        ", soma_calorias, " kcal\n")
    escreva("Tempo médio por atividade:", m.arredondar(soma_tempo / contador_registros, 2), " min\n")
    escreva("Frequência cardíaca média:", m.arredondar(soma_freq / contador_registros, 2), " BPM\n")
    escreva("Ritmo/Peso médio geral:   ", m.arredondar(soma_ritmo / contador_registros, 2), "\n")

    escreva("\n==========================================\n")
    escreva("|  ESTATÍSTICAS POR TIPO DE ATIVIDADE    | \n")
    escreva("==========================================\n")

    // Estatísticas por tipo (somente se houver registro)
    para (inteiro t = 0; t < 5; t++)
    {
        cadeia tipo = tipos[t]
        inteiro qtd = 0
        real total_cal = 0
        real total_temp = 0
        inteiro total_freq = 0
        real total_ritmo = 0

        // Soma os valores apenas para o tipo atual
        para (inteiro i = 0; i < contador_registros; i++)
        {
            se (tipo_atividade[i] == tipo)
            {
                qtd = qtd + 1
                total_cal = total_cal + calorias[i]
                total_temp = total_temp + tempo_minutos[i]
                total_freq = total_freq + freq_cardiaca_media[i]
                total_ritmo = total_ritmo + ritmo_medio[i]
            }
        }

        // Mostra estatísticas caso exista pelo menos 1 registro desse tipo
        se (qtd > 0)
        {
            escreva("\n>>> ", tipo, " <<<\n")
            escreva("Quantidade:              ", qtd, "\n")
            escreva("Total de calorias:       ", total_cal, " kcal\n")
            escreva("Tempo médio:             ", m.arredondar(total_temp / qtd, 2), " min\n")
            escreva("Frequência cardíaca:     ", m.arredondar(total_freq / qtd, 2), " BPM\n")
            escreva("Ritmo/Peso médio:        ", m.arredondar(total_ritmo / qtd, 2), "\n")
        }
    }
}

}
