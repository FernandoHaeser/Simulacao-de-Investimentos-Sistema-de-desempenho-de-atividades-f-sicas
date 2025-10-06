programa
{
    inclua biblioteca Graficos --> g
    inclua biblioteca Mouse --> m
    inclua biblioteca Teclado --> t
    inclua biblioteca Util --> u

    funcao inicio()
    {
        g.iniciar_modo_grafico(falso)

        // Configurações dos campos
        inteiro camposX = 50
        inteiro camposLarg = 600
        inteiro camposAlt = 30
        inteiro yInicial = 100
        inteiro espaco = 50

        cadeia campos[5] = {"", "", "", "", ""}   // valores digitados
        inteiro campoAtivo = -1                   // campo selecionado

        enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
        {
            // Limpar fundo
            g.definir_cor(0x121212)
            g.limpar()

            // Cabeçalho amarelo
            g.definir_cor(0xF4EB20)
            g.desenhar_retangulo(50, 20, 600, 50, verdadeiro, falso)

            // Detectar clique do mouse nos campos
		se(m.botao_pressionado(m.BOTAO_ESQUERDO))
		{
    		inteiro mouseX = m.posicao_x()
		inteiro mouseY = m.posicao_y()
		    campoAtivo = -1
		
		    para(inteiro i = 0; i < 5; i++)
		    {
		        inteiro y = yInicial + i * espaco
		        se(mouseX >= camposX e mouseX <= camposX + camposLarg 
		           e mouseY >= y e mouseY <= y + camposAlt)
		        {
		            campoAtivo = i
		        }
		    }
		
		    // Detectar clique no botão de salvar
		    se(mouseX >= 250 e mouseX <= 450 e mouseY >= 420 e mouseY <= 460)
		    {
		        para(inteiro i = 0; i < 5; i++)
		            escreva("Campo ", i+1, ": ", campos[i], "\n")
		    }
		}


            // Capturar teclas digitadas
            se(campoAtivo != -1)
            {
                cadeia tecla = t.tecla_pressionada()
                se(tecla != "")
                {
                    se(tecla == t.TECLA_BACKSPACE)
                    {
                        se(tamanho(campos[campoAtivo]) > 0)
                            campos[campoAtivo] = subcadeia(campos[campoAtivo], 0, tamanho(campos[campoAtivo])-1)
                    }
                    senao
                    {
                        campos[campoAtivo] = campos[campoAtivo] + tecla
                    }
                }
            }

            // Desenhar campos
            para(inteiro i = 0; i < 5; i++)
            {
                inteiro y = yInicial + i * espaco

                // Preenchimento preto
                g.definir_cor(0x000000)
                g.desenhar_retangulo(camposX, y, camposLarg, camposAlt, verdadeiro, falso)

                // Borda (diferente se ativo)
                se(i == campoAtivo)
                    g.definir_cor(0xFFD700) // amarelo quando ativo
                senao
                    g.definir_cor(0x800000)
                g.desenhar_retangulo(camposX, y, camposLarg, camposAlt, falso, verdadeiro)

                // Texto do campo
                g.definir_cor(0xFFFFFF)
                g.escrever(camposX + 5, y + 5, campos[i])
            }

            // Botão de salvar
            g.definir_cor(0x000000)
            g.desenhar_retangulo(250, 420, 200, 40, verdadeiro, falso)
            g.definir_cor(0x800000)
            g.desenhar_retangulo(250, 420, 200, 40, falso, verdadeiro)
            g.definir_cor(0xFFFFFF)
            g.escrever(310, 430, "SALVAR")

            g.renderizar()
            u.aguarde(16)
        }
    }
}