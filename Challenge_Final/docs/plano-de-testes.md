
# Plano de Testes para o Challenge PB AWS & AI for QE: Automação de Testes de Cinema

Este Plano de Testes detalha as atividades, estratégias e recursos necessários para o desenvolvimento do projeto de automação de testes do desafio "PB AWS & AI for QE". O foco principal será a validação funcional das funcionalidades de um sistema de reserva de ingressos e gerenciamento de cinema (back-end e front-end).

-----

## 1\. Introdução

O objetivo deste plano é guiar a criação de um projeto de automação de testes para uma aplicação de cinema, que consiste em um back-end e um front-end. O projeto visa garantir a qualidade do sistema, identificar defeitos, validar os requisitos funcionais e aplicar as melhores práticas de engenharia de qualidade. Será utilizada a ferramenta Robot Framework para a automação dos testes.

-----

## 2\. Escopo dos Testes

O escopo dos testes abrangerá as principais funcionalidades da aplicação de cinema, tanto no **back-end (API)** quanto no **front-end (interface de usuário)**.

### 2.1. Funcionalidades a Serem Testadas:

  * **Gerenciamento de Filmes:**
      * Listagem de filmes (API e UI)
      * Criação de novos filmes (API e UI)
      * Atualização de informações de filmes (API e UI)
      * Exclusão de filmes (API e UI)
  * **Gerenciamento de Salas:**
      * Listagem de salas (API e UI)
      * Criação de novas salas (API e UI)
      * Atualização de informações de salas (API e UI)
      * Exclusão de salas (API e UI)
  * **Gerenciamento de Sessões:**
      * Listagem de sessões (API e UI)
      * Criação de novas sessões (API e UI)
      * Atualização de informações de sessões (API e UI)
      * Exclusão de sessões (API e UI)
  * **Funcionalidades de Usuário (Front-end):**
      * Visualização de filmes e detalhes.
      * Navegação entre as diferentes seções da aplicação.
      * Interação com os elementos da interface de usuário (botões, campos de texto, etc.).

### 2.2. Funcionalidades Fora do Escopo:

  * Testes de performance/carga.
  * Testes de segurança.
  * Testes de usabilidade extensivos (apenas validação funcional).
  * Testes de compatibilidade em múltiplos navegadores (foco em um navegador principal).

-----

## 3\. Objetivos dos Testes

  * **Garantir a Correta Implementação das Funcionalidades:** Assegurar que o sistema atenda aos requisitos funcionais especificados.
  * **Identificar e Reportar Defeitos:** Encontrar bugs, anomalias e comportamentos inesperados na aplicação.
  * **Assegurar a Qualidade do Software:** Validar que o sistema opere de forma estável e confiável.
  * **Fornecer Feedback Contínuo:** Oferecer informações sobre a qualidade do produto ao longo do ciclo de desenvolvimento.
  * **Demonstrar Conhecimento e Aplicação de Práticas de QE:** Apresentar a capacidade de planejar, executar e documentar testes de forma eficaz.

-----

## 4\. Estratégias de Teste

A estratégia de testes será baseada em uma abordagem híbrida, combinando testes de API (back-end) e testes de UI (front-end), com foco em automação.

  * **Testes de API (Back-end):**
      * Serão desenvolvidos testes automatizados para validar os endpoints da API (GET, POST, PUT, DELETE) para as entidades de Filmes, Salas e Sessões.
      * Validação de códigos de status HTTP, estruturas de resposta (JSON) e dados retornados.
      * Cenários de sucesso e falha para cada endpoint.
  * **Testes de UI (Front-end):**
      * Serão desenvolvidos testes automatizados para simular interações do usuário com a interface gráfica, navegando pelas diferentes telas e validando o comportamento esperado.
      * Validação da exibição correta de dados, mensagens de erro e elementos da UI.
      * Cobertura dos fluxos de criação, edição, visualização e exclusão através da interface do usuário.
  * **Testes de Regressão:**
      * Todos os testes automatizados serão executados periodicamente para garantir que novas alterações não introduzam defeitos em funcionalidades existentes.
  * **Design de Casos de Teste:**
      * Serão utilizados **mapas mentais** para auxiliar na identificação de cenários e casos de teste.
      * **Priorização de cenários de alto risco e de maior impacto.**
      * **Cenários complexos e de fluxo** serão abordados para garantir a cobertura de ponta a ponta.

-----

## 5\. Critérios de Entrada e Saída

### 5.1. Critérios de Entrada (Start Testing):

  * Ambiente de teste configurado e acessível (back-end e front-end).
  * Repositório Git inicializado e configurado.
  * Ferramentas e dependências de automação instaladas (Robot Framework, Selenium Library, Requests Library, etc.).
  * Plano de Testes aprovado e revisado.

### 5.2. Critérios de Saída (End Testing):

  * Todos os cenários de teste críticos executados e com status final.
  * Cobertura de testes satisfatória (conforme métricas definidas).
  * Bugs críticos reportados e rastreados.
  * Relatório de testes gerado e documentado.
  * Documentação do projeto atualizada no README e/ou Wiki do repositório.

-----

## 6\. Ambiente de Teste

  * **Hardware:** Máquina pessoal com acesso à internet.
  * **Sistema Operacional:** (Ex: Windows 10/11, macOS, Linux).
  * **Software:**
      * Python 3.x (com pip para gerenciamento de pacotes).
      * Robot Framework.
      * Selenium Library.
      * Requests Library.
      * Web browser (Chrome recomendado para compatibilidade com Selenium WebDriver).
      * Git para controle de versão.
      * IDE (Visual Studio Code, PyCharm, etc.).
  * **Dados de Teste:**
      * Dados de teste serão criados e gerenciados de forma programática ou através de arquivos de dados (ex: CSV, JSON) para garantir a independência dos testes.

-----

## 7\. Papéis e Responsabilidades

  * **Engenheiro de Qualidade (QE) / Participante do Challenge:**
      * Planejamento e design dos testes.
      * Desenvolvimento e execução dos scripts de automação.
      * Análise de resultados e criação de issues (bugs/melhorias).
      * Manutenção da documentação do projeto.
      * Gerenciamento do repositório Git.

-----

## 8\. Cronograma (Estimativa)

  * **Semana 1:**
      * Estudo e análise da aplicação (back-end e front-end).
      * Criação de mapa mental e identificação de cenários.
      * Definição da estrutura inicial do projeto de automação.
      * Configuração do ambiente de desenvolvimento.
      * Início da automação dos testes de API (endpoints básicos).
  * **Semana 2:**
      * Continuação da automação de testes de API (cenários mais complexos).
      * Início da automação de testes de UI (fluxos principais).
      * Refatoração e aplicação de padrões (Page Objects, Service Objects).
  * **Semana 3:**
      * Finalização da automação de testes de UI.
      * Execução e análise dos testes.
      * Criação e rastreamento de issues (bugs/melhorias).
      * Documentação do projeto (README, Wiki).
      * Preparação para a apresentação.

-----

## 9\. Recursos Necessários

  * **Ferramentas de Automação:** Robot Framework, Selenium Library, Requests Library.
  * **Controle de Versão:** Git e GitHub.
  * **Documentação:** Markdown para README/Wiki, ferramentas para mapas mentais (ex: XMind, MindMeister).
  * **Comunicação:** Plataformas para colaboração e citação de colegas (se houver).

-----

## 10\. Gerenciamento de Defeitos

  * **Identificação:** Defeitos serão identificados durante a execução dos testes automatizados e manuais.
  * **Registro:** Todos os defeitos serão registrados como **Issues** no repositório GitHub, com informações detalhadas (passos para reprodução, resultados esperados vs. obtidos, capturas de tela/logs quando aplicável).
  * **Priorização:** As issues serão priorizadas com base no impacto e gravidade do defeito (ex: Crítico, Alto, Médio, Baixo).
  * **Acompanhamento:** As issues serão acompanhadas até a resolução.

-----

## 11\. Métricas de Teste

  * **Número de Casos de Teste Automatizados:** Quantidade de cenários cobertos pela automação.
  * **Porcentagem de Testes Passados/Falhos:** Indicação da estabilidade da aplicação.
  * **Cobertura de Automação:** Medida da proporção de funcionalidades cobertas por testes automatizados.
  * **Número de Issues Abertas/Fechadas:** Indicador da qualidade e progresso na correção de defeitos.
  * **Frequência de Commits:** Demonstração da atividade e evolução do projeto no repositório Git.
  * **Tempo Médio de Execução por Teste/Suite:** Crucial para pipelines de CI e para identificar testes lentos.
  * **Flakiness Rate (Taxa de Instabilidade):** Porcentagem de testes que falham e passam aleatoriamente, indicando a confiabilidade dos testes.

-----

## 12\. Sugestões para Cenários de Teste Mais Complexos

Para demonstrar a robustez dos seus testes, foque em cenários que simulem fluxos de usuário mais completos e interações entre a API e a UI.

1.  **Criação e Validação de Ponta a Ponta de uma Sessão:**
      * **API:** Criar um **Filme** e uma **Sala** utilizando os endpoints da API.
      * **API:** Criar uma **Sessão** associando o filme e a sala recém-criados via API, validando as regras de negócio (ex: horário disponível, sala existente).
      * **UI:** Navegar até a página de listagem de sessões no Front-end e verificar se a sessão criada via API é exibida corretamente com todos os seus detalhes (nome do filme, sala, horário).
      * **UI:** Tentar criar uma **Sessão** via UI com dados inválidos (ex: horário que conflita com outra sessão na mesma sala) e validar a mensagem de erro no Front-end.
2.  **Atualização Coerente de Dados de Filme:**
      * **UI:** Criar um **Filme** através da interface de usuário, preenchendo todos os campos.
      * **API:** Obter os detalhes desse filme via API (utilizando o ID retornado pela UI ou buscando pelo nome).
      * **API:** Atualizar **apenas o gênero** do filme utilizando o endpoint de atualização da API.
      * **UI:** Navegar de volta à página de detalhes do filme no Front-end e verificar se o gênero foi atualizado corretamente na UI, enquanto os outros campos permanecem inalterados.
3.  **Fluxo de Exclusão com Validação Cruzada:**
      * **UI:** Criar um **Filme** e associá-lo a uma **Sessão** através da UI.
      * **API:** Tentar excluir o **Filme** via API. Validar que a API **retorna um erro** indicando que o filme não pode ser excluído por estar associado a uma sessão.
      * **UI:** Excluir a **Sessão** associada ao filme através da UI.
      * **API:** Excluir o **Filme** via API e validar que a operação foi bem-sucedida (código 200/204).
      * **UI:** Verificar no Front-end se o filme e a sessão não aparecem mais nas suas respectivas listas.

-----

## 13\. Otimização da Estrutura do Projeto (Robot Framework)

Uma estrutura de projeto bem organizada é crucial para a legibilidade e manutenção. Recomendo a seguinte organização:

```
your_project_name/
├── tests/
│   ├── api/
│   │   ├── films/
│   │   │   └── films_api_tests.robot
│   │   ├── rooms/
│   │   │   └── rooms_api_tests.robot
│   │   └── sessions/
│   │       └── sessions_api_tests.robot
│   ├── ui/
│   │   ├── pages/
│   │   │   ├── common_page_elements.robot
│   │   │   ├── films_page.robot
│   │   │   ├── rooms_page.robot
│   │   │   └── sessions_page.robot
│   │   └── scenarios/
│   │       ├── films_ui_scenarios.robot
│   │       ├── rooms_ui_scenarios.robot
│   │       └── sessions_ui_scenarios.robot
│   └── suites/
│       ├── all_api_tests.robot  # Arquivo para rodar todos os testes de API
│       ├── all_ui_tests.robot   # Arquivo para rodar todos os testes de UI
│       └── smoke_tests.robot    # Testes críticos (API + UI)
├── resources/
│   ├── api_resources.robot      # Palavras-chave genéricas para API (setup/teardown, requisições comuns)
│   ├── ui_resources.robot       # Palavras-chave genéricas para UI (setup/teardown, navegação comum)
│   ├── common_keywords.robot    # Palavras-chave utilitárias compartilhadas (ex: geração de dados)
│   └── variables.robot          # Variáveis globais (URLs, credenciais, etc.)
├── libraries/
│   └── custom_libraries.py      # Caso precise de bibliotecas Python personalizadas
├── output/                      # Relatórios e logs de execução
├── .gitignore
├── README.md
└── robot_runner.py              # Script Python opcional para facilitar a execução
```

  * **`tests/`**: Contém todos os arquivos de testes.
      * **`api/`**: Testes específicos para a API, separados por entidade.
      * **`ui/`**: Testes específicos para a UI. Dentro, `pages/` para **Page Objects** e `scenarios/` para os testes que utilizam esses Page Objects.
      * **`suites/`**: Arquivos para organizar a execução de múltiplos testes, permitindo rodar subconjuntos (ex: todos os testes de API, todos de UI, ou apenas testes críticos de "smoke").
  * **`resources/`**: Contém arquivos de recursos com palavras-chave reutilizáveis. Separar `api_resources.robot` de `ui_resources.robot` é fundamental para modularidade. `common_keywords.robot` para palavras-chave compartilhadas e `variables.robot` para variáveis de ambiente.
  * **`libraries/`**: Para qualquer biblioteca Python personalizada que você precise criar.
  * **`output/`**: O Robot Framework gerará relatórios e logs aqui.

-----

## 14\. Sugestões de Boas Práticas Adicionais (Robot Framework)

Além de Page Objects e Service Objects, considere estas práticas para maior robustez:

1.  **Tratamento de Erros e Retries (Repetições):** Implementar lógicas para **tentar novamente operações que falham ocasionalmente** (ex: um elemento de UI que não carrega na primeira tentativa, ou um timeout de API). O Robot Framework permite isso com a palavra-chave `Wait Until Keyword Succeeds` ou `Run Keyword And Ignore Error` para cenários específicos. Isso torna seus testes menos "flaky".
2.  **Uso de Tags para Seleção de Testes:** Utilize **tags** (`[Tags]`) nos seus casos de teste. Isso permite que você execute subconjuntos específicos de testes (ex: `@smoke`, `@regression`, `@feature_x`, `@api`, `@ui`) de forma muito flexível, o que é ótimo para o pipeline de CI e para focar a execução em partes específicas da aplicação.
3.  **TearDown e Setup Granulares:** Reforçar a importância de `Setup` e `Teardown` **a nível de Suite e de Test Case**. Use `Suite Setup` e `Suite Teardown` para preparar e limpar o ambiente para um conjunto de testes (ex: iniciar browser, limpar base de dados de teste via API). Use `Test Setup` e `Test Teardown` para preparar e limpar o estado para cada teste individual, garantindo a **independência dos testes** (ex: criar dados específicos para um teste e apagá-los depois).

-----

## 15\. Uso de Dados de Teste Dinâmicos

Para dados dinâmicos, as melhores abordagens no Robot Framework são:

1.  **Bibliotecas Python Personalizadas:** Crie uma biblioteca Python (`.py` na pasta `libraries/`) que utilize bibliotecas como `Faker` para gerar dados realistas e únicos (nomes, e-mails, números, etc.). Essa biblioteca pode ter funções como `generate_unique_movie_title` ou `generate_random_room_capacity`. No Robot Framework, você a importaria e chamaria as funções diretamente.
    ```robotframework
    *** Settings ***
    Library    libraries/custom_data_generator.py

    *** Test Cases ***
    Criar Filme Com Titulo Unico
        ${titulo}=    Generate Unique Movie Title
        Create Movie Via API    ${titulo}    Ação
    ```
2.  **Variáveis Geradas em Tempo de Execução:** Para dados simples, você pode gerar strings únicas usando o timestamp ou UUIDs dentro do próprio Robot Framework:
    ```robotframework
    *** Test Cases ***
    Criar Sala Com Nome Unico
        ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
        ${nome_sala}=    Set Variable    Sala ${timestamp}
        Create Room Via API    ${nome_sala}    100
    ```
3.  **CSV ou JSON para Massa de Dados Fixa (mas reutilizável):** Se você tiver uma massa de dados que precisa ser usada repetidamente e é fixa (não gerada dinamicamente a cada execução), pode usar arquivos CSV ou JSON e lê-los com bibliotecas customizadas ou diretamente com `Library` do Robot Framework para parsear o conteúdo. Isso é útil para cenários de **validação com múltiplos conjuntos de dados**.

-----

## 16\. Adicional de Inovação (Prático para o Tempo Limite)

Considerando o tempo limitado do desafio, foque em inovações que entreguem um impacto visual ou funcional rápido:

1.  **Integração com GitHub Actions (CI/CD Básico):** Configure um **fluxo de trabalho simples no GitHub Actions** que execute seus testes Robot Framework a cada push no repositório `main`. Isso demonstra automação de pipeline, feedback contínuo e uso de GenAI para CI/CD. Você pode começar com um arquivo `.github/workflows/main.yml` básico. **É extremamente impactante visualmente na apresentação.**
2.  **Relatórios de Teste Aprimorados (Customização Robot Framework):** Embora o Robot já gere relatórios, você pode **adicionar capturas de tela nos passos de falha** automaticamente para os testes de UI, ou até mesmo customizar o `log.html` com informações extras. Isso melhora drasticamente a capacidade de depuração e a apresentação dos resultados. Você pode usar a palavra-chave `Capture Page Screenshot` em um `Test Teardown` condicional (`Run Keyword If Test Failed`).

-----
