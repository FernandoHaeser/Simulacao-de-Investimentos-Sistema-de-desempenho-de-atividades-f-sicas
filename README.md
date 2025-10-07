# Trabalho Portugol - LPG

Este repositório contém os projetos desenvolvidos para a disciplina de Linguagem de Programação (LPG), utilizando o Portugol Studio.

## Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Autores](#autores)
- [Projetos Desenvolvidos](#projetos-desenvolvidos)
- [Requisitos](#requisitos)
- [Instalação do Portugol Studio](#instalação-do-portugol-studio)
  - [Windows](#windows)
  - [Linux](#linux)
- [Como Executar os Projetos](#como-executar-os-projetos)
- [Estrutura do Repositório](#estrutura-do-repositório)
- [Contribuição](#contribuição)
- [Licença](#licença)

---

## Sobre o Projeto

Este repositório foi desenvolvido para armazenar exercícios, trabalhos e projetos feitos em Portugol Studio na disciplina de Linguagem de Programação (LPG). O Portugol Studio é uma ferramenta educacional que permite a simulação de algoritmos escritos em pseudocódigo.

## Autores

- **Fernando A. Haeser**
- **Isadora S. Feijó**
- **Nicolas G. Cafarete**

## Projetos Desenvolvidos

### 1. Simulação de Investimentos (`Investimento.por`)
Sistema interativo para simulação de investimentos financeiros, permitindo ao usuário:
- Simular diferentes tipos de investimento (Tesouro Selic, Fundo Imobiliário, CDB/LCI)
- Calcular rendimentos mensais e anuais
- Visualizar projeções de crescimento do capital investido
- Comparar múltiplas simulações

### 2. Registro de Atividades Físicas (`AtividadesFisicas.por`)
Aplicação para gerenciamento e acompanhamento de atividades físicas, com funcionalidades para:
- Registrar diferentes tipos de atividade (Corrida, Musculação, Yoga, Natação, Caminhada)
- Monitorar calorias, tempo, frequência cardíaca e ritmo
- Exibir resumos e estatísticas por tipo de atividade
- Calcular médias e totais gerais

## Requisitos

- [Portugol Studio](https://portugolstudio.sourceforge.io/) (versão recomendada: mais recente)
- Sistema Operacional: Windows ou Linux

## Instalação do Portugol Studio

### Windows

1. **Baixe o instalador**
   - Acesse: [Download Portugol Studio](https://portugolstudio.sourceforge.io/)
   - Clique em "Download" para baixar o instalador do Windows (`.exe`).

2. **Execute o instalador**
   - Dê um duplo clique no arquivo baixado e siga as instruções do assistente de instalação.

3. **Conclua a instalação**
   - Após finalizar, o Portugol Studio estará disponível no menu Iniciar.

### Linux

1. **Baixe o instalador**
   - Acesse: [Download Portugol Studio](https://portugolstudio.sourceforge.io/)
   - Baixe o arquivo `.tar.gz` para Linux.

2. **Descompacte o arquivo**
   ```bash
   tar -xvzf portugol-studio-linux*.tar.gz
   ```

3. **Dê permissão de execução**
   ```bash
   cd portugol-studio
   chmod +x portugolstudio.sh
   ```

4. **Execute o Portugol Studio**
   ```bash
   ./portugolstudio.sh
   ```

   > **Observação:** É recomendável ter o Java instalado (normalmente o Portugol Studio já inclui o necessário). Se necessário, instale o Java:
   ```bash
   sudo apt-get update
   sudo apt-get install default-jre
   ```

## Como Executar os Projetos

1. Abra o Portugol Studio.
2. Clique em **Arquivo > Abrir**.
3. Navegue até a pasta do repositório clonado.
4. Selecione o arquivo desejado (`.por`) para abrir.
5. Clique em **Executar** (ícone de "play" ou pressione **F5**) para rodar o algoritmo.

### Exemplos de Execução

**Simulação de Investimentos:**
```
1. Abra o arquivo Investimento.por
2. Execute o programa (F5)
3. Informe o valor inicial do investimento
4. Informe o valor mensal de aporte
5. Escolha o tipo de investimento desejado
6. Visualize os resultados da simulação
```

**Registro de Atividades Físicas:**
```
1. Abra o arquivo AtividadesFisicas.por
2. Execute o programa (F5)
3. Escolha a opção desejada no menu
4. Registre suas atividades físicas
5. Consulte resumos e estatísticas
```

## Estrutura do Repositório

```
trabalho-portugol-LPG/
├── AtividadesFisicas.por    # Sistema de registro de atividades físicas
├── Investimento.por          # Simulador de investimentos financeiros
└── README.md                 # Documentação do projeto
```

> Cada arquivo `.por` contém um projeto completo e independente.

## Contribuição

Sinta-se à vontade para abrir issues ou pull requests com sugestões, correções ou melhorias!

## Licença

Este projeto é de código aberto e está disponível para fins educacionais.
