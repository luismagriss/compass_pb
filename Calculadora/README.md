#  Calculadora TDD

Uma calculadora básica implementada com foco na prática de **TDD (Test-Driven Development)**. Este projeto cobre as quatro operações matemáticas fundamentais — adição, subtração, multiplicação e divisão — além de **potenciação** e **porcentagem**.

##  Funcionalidades

-  Soma
-  Subtração
-  Multiplicação
-  Divisão (com tratamento para divisão por zero)
-  Potenciação
-  Porcentagem

##  Testes

Os testes foram desenvolvidos **antes da implementação dos métodos**, seguindo a metodologia TDD. Utilizei o framework [**Pytest**](https://docs.pytest.org/) e apliquei recursos como:

- `@pytest.mark.parametrize` para testar diferentes cenários de entrada
- `@pytest.fixture` para reutilização da instância da calculadora

##  Tecnologias

- Python 3.10+
- Pytest

##  Estrutura de Pastas
   ```plaintext
   Calculadora/
   ├── src/
   │ └── __init__.py
   │ └── calculadora.py
   ├── tests/
   │ ├── init.py
   │ ├── conftest.py
   │ ├── data_set.py
   │ ├── test_soma.py
   │ ├── test_subtracao.py
   │ ├── test_multiplicacao.py
   │ ├── test_divisao.py
   │ ├── test_potenciacao.py
   │ └── test_porcentagem.py
````


##  Como executar os testes
1. Clone este repositório:
   ```bash
   git clone git@github.com:luismagriss/compass_pb.git
   ````
2. (Opcional) Crie um ambiente virtual:
   ```bash      
   python3 -m venv venv
   source venv/bin/activate   # Linux/macOS
   .\venv\Scripts\activate   # Windows
   
4. Instale as dependências
   ```bash
   pip install -r requirements.txt
   ```
5. Execute os testes
   ```bash
   pytest --cov=src tests/
6. Gerar relatório visual da cobertura de testes
   ```bash
   pytest --cov=src tests/ --cov-report html
   ```
   
## Autor
- [Luis Magris de Sousa](https://github.com/luismagriss)

## Referências
- ChatGPT - usado para tirar dúvidas e entender erros.
