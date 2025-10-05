programa {
  funcao inicio() {
    
  }
}
programa
{
    inclua biblioteca Graficos --> g

    // Variáveis globais para armazenar os dados
    cadeia atividade
    real tempo, calorias, freqCardiaca, ritmo

    funcao inicio()
    {
        // Criar a janela
        g.iniciarGraficos(600, 400, "Registro de Exercícios")

        // Definir cor e fonte
        g.definirCor(g.COR_PRETO)
        g.definirFonte("Arial", 16)

        // Escreve título
        g.escreva(200, 30, "Registro de Exercício")

        // Solicitar dados via entrada gráfica
        atividade = g.lerTexto(200, 80, "Atividade: ")
        tempo = real(g.lerTexto(200, 120, "Tempo (min): "))
        calorias = real(g.lerTexto(200, 160, "Calorias: "))
        freqCardiaca = real(g.lerTexto(200, 200, "Frequência (bpm): "))
        ritmo = real(g.lerTexto(200, 240, "Ritmo: "))

        // Mostrar resumo
        g.limparTela()
        g.escreva(200, 60, "Resumo da Performance")
        g.escreva(150, 120, "Atividade: " + atividade)
        g.escreva(150, 150, "Tempo: " + tempo + " minutos")
        g.escreva(150, 180, "Calorias: " + calorias + " kcal")
        g.escreva(150, 210, "Freq. Cardíaca: " + freqCardiaca + " bpm")
        g.escreva(150, 240, "Ritmo: " + ritmo)

        // Mantém a janela aberta até o usuário fechar
        g.aguardeTecla()
        g.finalizarGraficos()
    }
}