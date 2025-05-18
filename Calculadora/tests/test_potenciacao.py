import pytest
from tests.data_set import *

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_potencia(a, b, calculadora):
    expected_potencia = a ** b
    assert calculadora.pow(a, b) == expected_potencia