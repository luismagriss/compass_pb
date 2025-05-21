*** Settings ***
Library    Collections
Library    String
Library    RequestsLibrary

*** Keywords ***
Gerar dados de um novo usuário
    ${random_user}       String.Generate Random String  6  [LOWER][NUMBERS]
    Set Global Variable  ${random_user}
    Set Test Variable    ${user_mail}  ${random_user}@email.com
    Log                  ${user_mail}

Cadastrar novo usuário
    ${body}  Create Dictionary
    ...      email=eve.holt@reqres.in
    ...      password=pistol
    Log      ${body}

    Criar sessão no ReqRes

    ${post_request}  POST On Session
    ...              alias=ReqRes
    ...              url=/register
    ...              json=${body}
    
    Log  ${post_request}

Criar sessão no ReqRes
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json  x-api-key=reqres-free-v1
    Create Session    ReqRes    https://reqres.in/api/  ${headers}