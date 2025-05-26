*** Settings ***
Documentation       Keywords para testar a ReqRes API
...                 Esse arquivo de recursos contém todas as keywords necessárias para interagir com
...                 os endpoints da API ReqRes incluindo users, resources, login e operação de cadastro
Library             String
Library             RequestsLibrary
Library             Collections

*** Variables ***
${BASE_URL}         https://reqres.in/api
${DEFAULT_EMAIL}    eve.holt@reqres.in
${DEFAULT_PASSWORD}  cityslicka
${REGISTER_PASSWORD}  pistol

*** Keywords ***
Criar sessão no ReqRes
    [Documentation]    Cria uma sessão na API ReqRes com os headers apropriados
    ${headers}         Create Dictionary    
    ...                accept=application/json    
    ...                Content-Type=application/json    
    ...                x-api-key=reqres-free-v1
    Create Session     ReqRes    ${BASE_URL}    ${headers}

Validar status code "${statuscode}"
    [Documentation]    Valida que a resposta tem o status code esperado
    Should Be True     ${response.status_code} == ${statuscode}
    Log                Response status: ${response.status_code}

Validar resposta contém campo "${field}"
    [Documentation]    Valida que a resposta JSON contém o campo específico
    ${fields}    Split String    ${field}    .
    ${dict}    Set Variable    ${response.json()}
    
    FOR    ${part}    IN    @{fields}
        Run Keyword If    "${part}" in ${dict}    Dictionary Should Contain Key    ${dict}    ${part}
        ...    ELSE    Fail    Field "${part}" not found in response
        ${dict}    Set Variable If    "${part}" in ${dict}    ${dict["${part}"]}    ${dict}
    END

Validar valor do campo "${field}" é "${expected_value}"
    [Documentation]    Valida que o campo na response tem o valor esperado
    ${fields}    Split String    ${field}    .
    ${dict}    Set Variable    ${response.json()}
    
    FOR    ${index}    ${part}    IN ENUMERATE    @{fields}
        Run Keyword If    ${index} < ${fields.__len__() - 1}    Dictionary Should Contain Key    ${dict}    ${part}
        ...    ELSE    Dictionary Should Contain Key    ${dict}    ${part}
        ${dict}    Set Variable If    ${index} < ${fields.__len__() - 1}    ${dict["${part}"]}    ${dict}
    END
    
    ${last_field}    Set Variable    ${fields[-1]}
    ${actual_value}    Convert To String    ${dict["${last_field}"]}
    Should Be Equal    ${actual_value}    ${expected_value}

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