#  Challenge 02 – Testes Automatizados na API ServeRest

Este projeto é parte do programa de estágio da Compass UOL (Sprint 6), com foco em automação de testes de API REST usando **Robot Framework**. Os testes cobrem os endpoints da [API ServeRest](https://github.com/PauloGoncalvesBH/ServeRest), que simula um fluxo completo de e-commerce, incluindo usuários, produtos, carrinho e pedidos.

---

##  Objetivos

- Aplicar técnicas de testes como classes de equivalência, valores-limite, CRUD, etc.
- Criar e automatizar cenários de testes usando `Robot Framework` e bibliotecas auxiliares.
- Executar testes que validam status codes, mensagens de erro e dados retornados.

---

##  Documentos
- [Plano de Testes - Confluence](https://luisms.atlassian.net/wiki/external/YTRmM2JkMjc1MmZmNDBkZjkxMDI5YjkzMDE1MWNjNDI)

- [Relatório de Testes - Confluence](https://luisms.atlassian.net/wiki/external/ZjkzOGM3ZGM5ZjQzNDdhMWEwMjljZjNiNDU0NjI0ZWI)

🗂️ Também disponível como PDF neste repositório: `Challenge02/docs`

---

##  Tecnologias e Bibliotecas

- **Python 3.11**
- **Robot Framework**
- [RequestsLibrary](https://github.com/MarketSquare/robotframework-requests) – Requisições HTTP
- [FakerLibrary](https://github.com/guykisel/robotframework-faker) – Dados dinâmicos
- JSONLibrary – Validação de resposta
- BuiltIn, OperatingSystem – Utilitários

---

##  Estrutura do Projeto

```

serverest/
├── docs/
│   ├── Plano de Testes-Serverest API.pdf
│   ├── Relatório de Testes.pdf
├── tests/                 # Casos de teste organizados por endpoint (autenticação, usuário, produto, carrinho)
│   ├── test_auth.robot
│   ├── test_carrinhos.robot
│   |── test_produtos.robot
|   |── test_usuarios.robot
├── resources/             # Variáveis, keywords e endpoints reutilizáveis
│   ├── resources_keywords.resource
└── README.md

````

---

##  Instalação e Execução

1. Clone o repositório:

```bash
git clone https://github.com/luismagriss/compass_pb.git
cd compass_pb/Documentos/Sprint6/Challenge02/serverest
````

2. Crie e ative um ambiente virtual(opcional):

```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
```

3. Instale as dependências:

```bash
pip install robotframework-requests
pip install robotframework-faker
```

4. Execute os testes:

```bash
robot -d ./results tests/
```

5. Após a execução, abra o relatório:

```bash
start report.html  # ou abra manualmente o arquivo gerado
```

---

##  Exemplos de Testes Automatizados

*  Criação e login de usuários comuns e administradores
*  Atualização e exclusão de usuários e produtos
*  Cadastro de produtos no carrinho e fluxo de compra
*  Validação de mensagens de erro em inputs inválidos

---

##  Técnicas Aplicadas

* **Heurísticas de Teste**: CRUD
* **Classes de Equivalência**
* **Valores Limite**
* **Transição de Estado**

---

##  Observações

* O ambiente está configurado para o back-end ser rodado via instância EC2, mas pode ser rodado na url: https://compassuol.serverest.dev/, sendo necessário apenas substituir o valor da variável ${BASE_URL}.
* Alguns testes requerem **exclusão de carrinho existente** antes de prosseguir — esse controle está automatizado nos testes.
* As variáveis e headers (como token de login) são definidos dinamicamente nos testes.

---

##  Autor

Desenvolvido por **Luis M. de Sousa** – *Estagiário na trilha AWS & AI for Software Quality Engineering – Compass UOL*

---

##  Licença

Este projeto é apenas para fins educacionais e não possui licença de uso comercial.

```
