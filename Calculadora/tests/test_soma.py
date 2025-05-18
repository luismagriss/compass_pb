import pytest
from tests.data_set import *

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_soma(a, b, calculadora):
    expected_soma = a + b
    assert calculadora.soma(a, b) == expected_soma