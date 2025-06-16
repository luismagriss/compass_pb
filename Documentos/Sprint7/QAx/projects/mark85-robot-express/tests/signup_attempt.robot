*** Settings ***
Documentation        Cenários de tentativa de cadastro com senha curta

Resource             ../resources/base.resource
Test Template        Short password
Test Setup           Iniciar sessão

*** Test Cases ***
Não deve permitir senha com 1 digito     1

Não deve permitir senha com 2 digitos    12

Não deve permitir senha com 3 digitos    123

Não deve permitir senha com 4 digitos    1234

Não deve permitir senha com 5 digitos    12345
