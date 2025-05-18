import pytest
from tests.data_set import *

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_multiplicacao(a, b, calculadora):
    expected_multiplicacao = a * b
    assert calculadora.mult(a, b) == expected_multiplicacao