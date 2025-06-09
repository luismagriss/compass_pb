*** Settings ***
Documentation     Testes para endpoints de autenticação (login, register, logout)
Resource          ../../resources/common/common.resource
Resource          ../../resources/keywords/auth_keywords.resource
Suite Setup       Criar sessão no ReqRes
Test Tags         api    reqres    auth

*** Test Cases ***
Cenário 01: POST Cadastro de usuário com sucesso
    [Tags]    POST    user    register    success
    POST Endpoint /register
    Validar status code "200"
    Validar resposta contém campo "token"
    Validar resposta contém campo "id"

Cenário 02: POST Cadastro de usuário sem senha
    [Tags]    POST    user    register    error
    POST Endpoint /register - sem senha
    Validar status code "400"
    Validar resposta contém campo "error"
    Validar valor do campo "error" é "Missing password"

Cenário 03: POST Login com sucesso
    [Tags]    POST    login    success
    POST Endpoint /login
    Validar status code "200"
    Validar resposta contém campo "token"

Cenário 04: POST Login sem senha
    [Tags]    POST    login    error
    POST Endpoint /login - sem senha
    Validar status code "400"
    Validar resposta contém campo "error"
    Validar valor do campo "error" é "Missing password"

Cenário 05: POST Logout
    [Tags]    POST    logout
    POST Endpoint /logout
    Validar status code "200"