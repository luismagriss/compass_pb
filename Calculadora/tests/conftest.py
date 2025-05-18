import pytest
from src.calculadora import Calculadora

@pytest.fixture
def calculadora():
    return Calculadora()