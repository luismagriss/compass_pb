import pytest
from tests.data_set import *

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b)   
def test_subtracao(a, b, calculadora):
    expected_subtracao = a - b
    assert calculadora.sub(a, b) == expected_subtracao