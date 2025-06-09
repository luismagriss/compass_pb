*** Settings ***
Documentation     Testes para o endpoint de recursos
Resource          ../../resources/common/common.resource
Resource          ../../resources/keywords/resources_keywords.resource
Suite Setup       Criar sessão no ReqRes
Test Tags         api    reqres    resources

*** Test Cases ***
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