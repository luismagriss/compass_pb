import pytest
from tests.data_set import *

@pytest.mark.parametrize("a", data_set_a)
@pytest.mark.parametrize("b", data_set_b) 
def test_divisao(a, b, calculadora):
    expected_divisao = a / b
    assert calculadora.div(a, b) == expected_divisao
    
def test_divisão_zero(calculadora):
    with pytest.raises(ZeroDivisionError) as exec_info:
        calculadora.div(12,0)
    assert "Não é possível dividir por zero" in str(exec_info)