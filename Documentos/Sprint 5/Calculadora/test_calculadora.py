import pytest
from calculadora import Calculadora
from dados_de_teste import *

@pytest.fixture
def calculadora():
    return Calculadora()


@pytest.mark.parametrize("a, b, resultado_esperado", dados_soma)
def test_soma(a, b, resultado_esperado, calculadora):
    assert calculadora.soma(a, b) == resultado_esperado

@pytest.mark.parametrize("a, b, resultado_esperado", dados_subtracao)
def test_subtracao(a, b, resultado_esperado, calculadora):
    assert calculadora.sub(a, b) == resultado_esperado

@pytest.mark.parametrize("a, b, resultado_esperado", dados_multiplicacao)
def test_multiplicacao(a, b, resultado_esperado, calculadora):
    assert calculadora.mult(a, b) == resultado_esperado

@pytest.mark.parametrize("a, b, resultado_esperado", dados_divisao)
def test_divisao(a, b, resultado_esperado, calculadora):
    assert calculadora.div(a, b) == resultado_esperado

@pytest.mark.parametrize("a, b, resultado_esperado", dados_potencia)
def test_potencia(a, b, resultado_esperado, calculadora):
    assert calculadora.pow(a, b) == resultado_esperado

@pytest.mark.parametrize("a, b, resultado_esperado", dados_porcetagem)
def test_porcentagem(a, b, resultado_esperado, calculadora):
    assert calculadora.per(a, b) == resultado_esperado
