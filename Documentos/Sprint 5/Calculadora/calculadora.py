def sum(a, b):
    return a + b

def sub(a, b):
    return a - b

def mult(a, b):
    return a * b

def div(a, b):
    if b == 0:
        return None
    return a / b

def pow(a, b):
    return a ** b

def per(a, b):
    return (a * b) / 100

class Calculadora:
    def _init_(self):
        self.num1 = 
        self.num2 = 0

    def set_num1(self, num1):
        self.num1 = num1

    def set_num2(self, num2):
        self.num2 = num2

    def get_num1(self):
        return self.num1

    def get_num2(self):
        return self.num2

    def soma(self):
        return sum(self.num1, self.num2)

    def sub(self):
        return sub(self.num1, self.num2)

    def mult(self):
        return mult(self.num1, self.num2)

    def div(self):
        return div(self.num1, self.num2)

    def pow(self):
        return pow(self.num1, self.num2)

    def per(self):
        return per(self.num1, self.num2)