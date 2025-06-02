*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}           https://compassuol.serverest.dev

*** Keywords ***

Criar sessão na Serverest
    ${headers}        Create Dictionary
    ...               accept=application/json
    ...               Content-Type=application/json
    ...               authorization=${token}
    Create Session    ServeRest    ${BASE_URL}    ${headers}
    Log    ${headers}[authorization]

POST Endpoint /login

    ${body}           Create Dictionary
    ...               email=fulano@qa.com
    ...               password=teste
    
    ${header}         Create Dictionary
    ...               accept=application/json
    ...               Content-Type=application/json
    
    ${response}       POST
    ...               url=${BASE_URL}/login
    ...               json=${body}
    ...               headers=${header}
    
    Set Global Variable    ${response}
    Log                    ${response.json()}[authorization]
    ${token}          Set Variable        ${response.json()}[authorization]
    Set Global Variable    ${token}

GET Endpoint /users
    ${headers}         Create Dictionary
    ...                accept=application/json
    ...                Content-Type=application/json
    ...                authorization=${token}
    ${response}        GET On Session
    ...                alias=ServeRest
    ...                url=users                