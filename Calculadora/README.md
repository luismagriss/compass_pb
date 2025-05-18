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

Os testes foram desenvolvidos **antes da implementação dos métodos**, seguindo a metodologia TDD. Utilizamos o framework [**Pytest**](https://docs.pytest.org/) e aplicamos recursos como:

- `@pytest.mark.parametrize` para testar diferentes cenários de entrada
- `@pytest.fixture` para reutilização da instância da calculadora

##  Tecnologias

- Python 3.10+
- Pytest

##  Como executar os testes

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
