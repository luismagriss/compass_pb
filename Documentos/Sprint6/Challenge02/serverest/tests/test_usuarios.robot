*** Settings ***
Resource        ../resources/resources_keywords.resource

*** Test Cases ***
Cenário 01: Listar usuários
    POST Endpoint /login
    Criar sessão na Serverest
    ${response}    GET Endpoint /usuarios
    Should Be Equal As Strings    ${response.status_code}    200
    Should Not Be Empty    ${response.json()}[usuarios]

Cenário 02: Criar novo usuário
    ${response}    POST Endpoint /usuarios
    Should Be Equal As Strings    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()}[message]    Cadastro realizado com sucesso
    ${id_usuario}    Set Variable    ${response.json()}[_id]
    Set Test Variable    ${id_usuario}

Cenário 03: Atualizar usuário
    POST Endpoint /login
    Criar sessão na Serverest
    ${response}    POST Endpoint /usuarios
    ${id_usuario}    Set Variable    ${response.json()}[_id]
    ${response}    PUT Endpoint /usuarios/${id_usuario}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Registro alterado com sucesso

Cenário 04: Excluir usuário
    POST Endpoint /login
    Criar sessão na Serverest
    ${response}    POST Endpoint /usuarios
    ${id_usuario}    Set Variable    ${response.json()}[_id]
    ${response}    DELETE Endpoint /usuarios/${id_usuario}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Registro excluído com sucesso