*** Settings ***
Documentation       Keywords for users endpoints
Resource            ../common/common.resource

*** Keywords ***
GET Endpoint /users
    [Documentation]    Lista todos os usuários
    ${response}        GET On Session
    ...                alias=ReqRes
    ...                url=/users
    Set Global Variable    ${response}
    Log                Users found: ${response.json()["total"]}

GET Endpoint /users/id
    [Documentation]    Lista um usuário específico pelo ID
    [Arguments]        ${id}=1
    ${response}        GET On Session
    ...                alias=ReqRes
    ...                url=/users/${id}
    Set Global Variable    ${response}
    Log                User data: ${response.json()["data"]}

PUT Endpoint /users/id
    [Documentation]    Atualiza um usuário com o método PUT
    [Arguments]        ${id}=3
    ${payload}         Create Dictionary
    ...                name=ze
    ...                job=pedreiro
    ${response}        PUT On Session
    ...                alias=ReqRes
    ...                url=/users/${id}
    ...                json=${payload}
    Set Global Variable    ${response}
    Log                Updated at: ${response.json()["updatedAt"]}

PATCH Endpoint /users/id
    [Documentation]    Atualiza um usuário com o método PATCH
    [Arguments]        ${id}=5
    ${payload}         Create Dictionary
    ...                name=joao
    ...                job=jogador
    ${response}        PATCH On Session
    ...                alias=ReqRes
    ...                url=/users/${id}
    ...                json=${payload}
    Set Global Variable    ${response}
    Log                Updated at: ${response.json()["updatedAt"]}

DELETE Endpoint /users/id
    [Documentation]    Exclui um usuário
    [Arguments]        ${id}=5
    ${response}        DELETE On Session
    ...                alias=ReqRes
    ...                url=/users/${id}
    Set Global Variable    ${response}