import pytest
from calculadora import Calculadora
from data_set import *

@pytest.fixture
def calculadora():
    return Calculadora()

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_soma(a, b, calculadora):
    expected_soma = a + b
    assert calculadora.soma(a, b) == expected_soma

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b)   
def test_subtracao(a, b, calculadora):
    expected_subtracao = a - b
    assert calculadora.sub(a, b) == expected_subtracao

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_multiplicacao(a, b, calculadora):
    expected_multiplicacao = a * b
    assert calculadora.mult(a, b) == expected_multiplicacao

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_divisao(a, b, calculadora):
    if b == 0:
        expected_divisao = None
    else:
        expected_divisao = a / b
    assert calculadora.div(a, b) == expected_divisao

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_potencia(a, b, calculadora):
    expected_potencia = a ** b
    assert calculadora.pow(a, b) == expected_potencia

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_porcentagem(a, b, calculadora):
    expected_porcentagem = (a * b) / 100
    assert calculadora.per(a, b) == expected_porcentagem