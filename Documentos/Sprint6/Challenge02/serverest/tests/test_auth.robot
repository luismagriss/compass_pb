*** Settings ***
Resource        ../resources/resources_keywords.resource

*** Test Cases ***
Cenário 01: Fazer login
    POST Endpoint /login
    Criar sessão na Serverest

# Cenário 02: Criar produto
#     POST Endpoint /produtos
#     Criar sessão na Serverest
#     # Validar status code "200"