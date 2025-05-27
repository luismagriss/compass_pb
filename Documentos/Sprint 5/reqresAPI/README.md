# reqresAPI – Automação de Testes com Robot Framework

Este diretório contém testes automatizados para a API [ReqRes](https://reqres.in/), desenvolvidos durante as Sprints 5 e 6 do PB na Compass UOL. Os testes foram implementados utilizando o Robot Framework com a biblioteca RequestsLibrary.

## Objetivo

Automatizar cenários de teste para os principais endpoints da API ReqRes, incluindo criação, listagem e autenticação de usuários.

## Tecnologias Utilizadas

* [Robot Framework](https://robotframework.org/)
* [RequestsLibrary](https://github.com/MarketSquare/robotframework-requests)
* Python 3.10 ou superior

## Estrutura do Projeto

```
reqresAPI/
├── tests/                   # Casos de teste organizados por funcionalidade
├── keywords/                # Keywords customizadas para reutilização
├── resources/               # Recursos compartilhados (variáveis, headers etc.)
├── output/                  # Relatórios e logs gerados após a execução
└── README.md                # Documentação do projeto
```

## Como Executar os Testes

1. **Instale os requisitos:**

   ```bash
   pip install robotframework
   pip install robotframework-requests
   ```

2. **Execute os testes:**

   ```bash
   robot -d ./results tests/
   ```

3. **Verifique os resultados:**

   * `log.html`: detalhes dos testes executados
   * `report.html`: resumo da execução
   * `output.xml`: resultados em formato XML

## Cenários de Teste

* Criação de novo usuário
* Login com usuário válido
* Login com usuário inválido
* Listagem de usuários
* Validação de campos e status code
* Testes com dados dinâmicos (usuário aleatório)

## Boas Práticas Adotadas

* Utilização de variáveis globais e dinâmicas
* Keywords customizadas para reutilização e legibilidade
* Separação de responsabilidades por pastas (`tests/`, `keywords/`, `resources/`)
* Validações robustas com `Should Be Equal`, `Status Should Be` e `Dictionary Should Contain`

## Autor

[Luis Magris de Sousa](https://github.com/luismagriss)
