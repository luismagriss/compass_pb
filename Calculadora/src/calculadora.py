class Calculadora:
    def soma(self, a, b):
        return a + b

    def sub(self, a, b):
        return a - b

    def mult(self, a, b):
        return a * b

    def div(self, a, b):
        if b == 0:
            raise ZeroDivisionError("Não é possível dividir por zero")
        return a / b

    def pow(self, a, b):
        return a ** b

    def per(self, a, b):
        return (a * b) / 100