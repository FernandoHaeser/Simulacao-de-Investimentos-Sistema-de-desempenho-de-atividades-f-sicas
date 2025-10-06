programa
{
    inclua biblioteca Graficos --> g
    inclua biblioteca Mouse --> m
    inclua biblioteca Teclado --> t
    inclua biblioteca Util --> u

    funcao inicio()
    {
        g.iniciar_modo_grafico(falso)

        enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
        {
            // Fundo carbono
            g.definir_cor(0x121212)
            g.limpar()

            // Cabeçalho amarelo
            g.definir_cor(0xF4EB20)
            g.desenhar_retangulo(50, 20, 600, 50, verdadeiro, falso)

            // Campos de registro (inputs pretos com borda vinho)
            inteiro camposX = 50
            inteiro camposLarg = 600
            inteiro camposAlt = 30    // altura reduzida
            inteiro yInicial = 100
            inteiro espaco = 50       // espaçamento menor

            para(inteiro i = 0; i < 5; i++)
            {
                inteiro y = yInicial + i * espaco

                // Preenchimento preto
                g.definir_cor(0x000000)
                g.desenhar_retangulo(camposX, y, camposLarg, camposAlt, verdadeiro, falso)

                // Borda vermelho vinho
                g.definir_cor(0x800000)
                g.desenhar_retangulo(camposX, y, camposLarg, camposAlt, falso, verdadeiro)
            }

            // Botão de salvar (preto com borda vinho)
            g.definir_cor(0x000000)
            g.desenhar_retangulo(250, 420, 200, 40, verdadeiro, falso) // altura menor
            g.definir_cor(0x800000)
            g.desenhar_retangulo(250, 420, 200, 40, falso, verdadeiro)

            g.renderizar()
            u.aguarde(16)
        }
    }
}