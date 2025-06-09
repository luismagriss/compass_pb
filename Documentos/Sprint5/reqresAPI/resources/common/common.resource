*** Settings ***
Documentation       Common keywords and variables for ReqRes API testing
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