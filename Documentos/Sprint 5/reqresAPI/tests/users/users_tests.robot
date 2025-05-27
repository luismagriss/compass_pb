*** Settings ***
Documentation     Testes para endpoints de usuários
Resource          ../../resources/common/common.resource
Resource          ../../resources/keywords/users_keywords.resource
Suite Setup       Criar sessão no ReqRes
Test Tags         api    reqres    users

*** Test Cases ***
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