import pytest
from tests.data_set import *

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_porcentagem(a, b, calculadora):
    expected_porcentagem = (a * b) / 100
    assert calculadora.per(a, b) == expected_porcentagem