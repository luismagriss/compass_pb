*** Settings ***
Resource        ../resources/resources_keywords.resource  
Suite Setup     Criar sessão na Serverest

*** Test Cases ***
Cenário 01: Listar carrinhos
    POST Endpoint /login
    Criar sessão na Serverest
    ${response}    GET Endpoint /carrinhos
    Should Be Equal As Strings    ${response.status_code}    200
    Should Not Be Empty    ${response.json()}[carrinhos]

Cenário 02: Criar novo carrinho
    POST Endpoint /login
    Criar sessão na Serverest
    ${response_produto}    POST Endpoint /produtos
    ${id_produto}    Set Variable    ${response_produto.json()}[_id]

    # Excluir carrinho já existente ao iniciar a sessão
    DELETE Endpoint /carrinhos/cancelar-compra
    
    ${response}        POST Endpoint /carrinhos    ${id_produto}
    Should Be Equal As Strings    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()}[message]    Cadastro realizado com sucesso

Cenário 03: Cancelar compra
    POST Endpoint /login
    Criar sessão na Serverest
    ${response}    DELETE Endpoint /carrinhos/cancelar-compra
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Registro excluído com sucesso. Estoque dos produtos reabastecido

Cenário 04: Concluir compra
    POST Endpoint /login
    Criar sessão na Serverest
    ${response_produto}    POST Endpoint /produtos
    ${id_produto}    Set Variable    ${response_produto.json()}[_id]
    
    # Criar carrinho primeiro
    ${response}        POST Endpoint /carrinhos    ${id_produto}
    
    # Concluir compra
    ${response}    DELETE Endpoint /carrinhos/concluir-compra
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Registro excluído com sucesso