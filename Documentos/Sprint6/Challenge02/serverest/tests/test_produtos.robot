*** Settings ***
Resource        ../resources/resources_keywords.resource

*** Test Cases ***
Cenário 01: Listar produtos
    POST Endpoint /login
    Criar sessão na Serverest
    ${response}    GET Endpoint /produtos
    Should Be Equal As Strings    ${response.status_code}    200
    Should Not Be Empty    ${response.json()}[produtos]

Cenário 02: Criar novo produto
    POST Endpoint /login
    Criar sessão na Serverest
    ${response}    POST Endpoint /produtos
    Should Be Equal As Strings    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()}[message]    Cadastro realizado com sucesso
    ${id_produto}    Set Variable    ${response.json()}[_id]
    Set Test Variable    ${id_produto}

Cenário 03: Atualizar produto
    POST Endpoint /login
    Criar sessão na Serverest
    ${response}    POST Endpoint /produtos
    ${id_produto}    Set Variable    ${response.json()}[_id]
    ${response}    PUT Endpoint /produtos/${id_produto}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Registro alterado com sucesso

Cenário 04: Excluir produto
    POST Endpoint /login
    Criar sessão na Serverest
    ${response}    POST Endpoint /produtos
    ${id_produto}    Set Variable    ${response.json()}[_id]
    ${response}    DELETE Endpoint /produtos/${id_produto}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Registro excluído com sucesso