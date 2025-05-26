*** Settings ***
Documentation     Suite de testes para validação da ReqRes API
...               Testa todos os principais endpoints e operações da ReqRes API
Resource          ../resources/api_testing_user.resource
Suite Setup       Criar sessão no ReqRes
Test Tags         api    reqres

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

Cenário 06: GET Listar todos os usuários
    [Tags]    GET    user    list
    GET Endpoint /users
    Validar status code "200"
    Validar resposta contém campo "data"
    Validar resposta contém campo "total"

Cenário 07: GET Listar um usuário específico
    [Tags]    GET    user    single
    GET Endpoint /users/id    2
    Validar status code "200"
    Validar resposta contém campo "data"
    Validar valor do campo "data.id" é "2"

Cenário 08: PUT Atualizar um usuário
    [Tags]    PUT    user    update
    PUT Endpoint /users/id    3
    Validar status code "200"
    Validar resposta contém campo "updatedAt"
    Validar resposta contém campo "name"

Cenário 09: PATCH Atualizar parcialmente um usuário
    [Tags]    PATCH    user    update
    PATCH Endpoint /users/id    5
    Validar status code "200"
    Validar resposta contém campo "updatedAt"

Cenário 10: DELETE Excluir um usuário
    [Tags]    DELETE    user
    DELETE Endpoint /users/id    5
    Validar status code "204"

Cenário 11: GET Listar um recurso específico
    [Tags]    GET    resource    single
    GET Endpoint /resource/id    2
    Validar status code "200"
    Validar resposta contém campo "data"
    Validar resposta contém campo "data.name"

Cenário 12: PUT Atualizar um recurso
    [Tags]    PUT    resource    update
    PUT Endpoint /resource/id    2
    Validar status code "200"
    Validar resposta contém campo "updatedAt"

Cenário 13: DELETE Excluir um recurso
    [Tags]    DELETE    resource
    DELETE Endpoint /resource/id    3
    Validar status code "204"

Cenário 14: GET Listar todos os recursos
    [Tags]    GET    resource    list
    GET Endpoint /resource
    Validar status code "200"
    Validar resposta contém campo "data"
    Validar resposta contém campo "total"