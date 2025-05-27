*** Settings ***
Documentation       Keywords for resources endpoints
Resource            ../common/common.resource

*** Keywords ***
GET Endpoint /resource/id
    [Documentation]    Busca um recurso específico pelo ID
    [Arguments]        ${id}=2
    ${response}        GET On Session
    ...                alias=ReqRes
    ...                url=/unknown/${id}
    Set Global Variable    ${response}
    Log                Resource data: ${response.json()["data"]}

GET Endpoint /resource
    [Documentation]    Lista todos os recursos
    ${response}        GET On Session
    ...                alias=ReqRes
    ...                url=/unknown
    Set Global Variable    ${response}
    Log                Resources found: ${response.json()["total"]}

PUT Endpoint /resource/id
    [Documentation]    Atualiza um recurso com o método PUT
    [Arguments]        ${id}=2
    ${payload}         Create Dictionary
    ...                name=azul
    ...                year=2000
    ...                color=#C48394
    ${response}        PUT On Session
    ...                alias=ReqRes
    ...                url=/unknown/${id}
    ...                json=${payload}
    Set Global Variable    ${response}
    Log                Updated resource: ${response.json()}

DELETE Endpoint /resource/id
    [Documentation]    Exclui um recurso
    [Arguments]        ${id}=3
    ${response}        DELETE On Session
    ...                alias=ReqRes
    ...                url=/unknown/${id}
    Set Global Variable    ${response}