*** Settings ***
Documentation       Keywords for authentication endpoints (login, register, logout)
Resource            ../common/common.resource

*** Keywords ***
POST Endpoint /login
    [Documentation]    Realiza o login com credenciais válidas
    ${body}            Create Dictionary
    ...                email=${DEFAULT_EMAIL}
    ...                password=${DEFAULT_PASSWORD}
    ${response}        POST On Session
    ...                alias=ReqRes
    ...                url=/login
    ...                json=${body}
    Set Global Variable    ${response}
    Log                Response: ${response.json()}

POST Endpoint /login - sem senha
    [Documentation]    Realiza uma requisição de login sem senha (falhe esperada)
    ${body}            Create Dictionary
    ...                email=${DEFAULT_EMAIL}
    ${response}        POST On Session
    ...                alias=ReqRes
    ...                url=/login
    ...                json=${body}
    ...                expected_status=400
    Set Global Variable    ${response}
    Log                Error response: ${response.json()}

POST Endpoint /logout
    [Documentation]    Realiza uma requisição de logout
    ${response}        POST On Session
    ...                alias=ReqRes
    ...                url=/logout
    Set Global Variable    ${response}

POST Endpoint /register
    [Documentation]    Cadastra um novo usuário com credenciais válidas.
    ${body}            Create Dictionary
    ...                email=${DEFAULT_EMAIL}
    ...                password=${REGISTER_PASSWORD}
    ${response}        POST On Session
    ...                alias=ReqRes
    ...                url=/register
    ...                json=${body}
    Set Global Variable    ${response}
    Log                Response: ${response.json()}

POST Endpoint /register - sem senha
    [Documentation]    Tenta cadastrar um novo usuário sem senha (falha esperada)
    ${body}            Create Dictionary
    ...                email=sydney@fife
    ${response}        POST On Session
    ...                alias=ReqRes
    ...                url=/register
    ...                json=${body}
    ...                expected_status=400
    Set Global Variable    ${response}
    Log                Error response: ${response.json()}