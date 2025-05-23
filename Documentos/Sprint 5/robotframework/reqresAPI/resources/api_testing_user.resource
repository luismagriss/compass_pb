*** Settings ***
Library                      String
Library                      RequestsLibrary

*** Keywords ***

POST Endpoint /login
    ${body}                  Create Dictionary
    ...                      email=eve.holt@reqres.in
    ...                      password=cityslicka
    ${response}              POST On Session
    ...                      alias=ReqRes
    ...                      url=/login
    ...                      json=${body}
    Set Global Variable      ${response}

POST Endpoint /login - sem senha
    ${body}                  Create Dictionary
    ...                      email=eve.holt@reqres.in
    ${response}              POST On Session
    ...                      alias=ReqRes
    ...                      url=/login
    ...                      json=${body}
    ...                      expected_status=400
    Set Global Variable      ${response}


POST Endpoint /logout
    ${response}              POST On Session
    ...                      alias=ReqRes
    ...                      url=/logout
    Set Global Variable      ${response}
Validar status code "${statuscode}"
    Should Be True           ${response.status_code} == ${statuscode}
    
Criar sessão no ReqRes
    ${headers}               Create Dictionary  accept=application/json  Content-Type=application/json  x-api-key=reqres-free-v1
    Create Session           ReqRes    https://reqres.in/api/  ${headers}
POST Endpoint /register
    ${body}                  Create Dictionary
    ...                      email=eve.holt@reqres.in
    ...                      password=pistol

    ${response}              POST On Session
    ...                      alias=ReqRes
    ...                      url=/register
    ...                      json=${body}
    Set Global Variable      ${response}
    
    Log                      ${response.json}

POST Endpoint /register - sem senha
    ${body}                  Create Dictionary
    ...                      email=sydney@fife

    ${response}              POST On Session
    ...                      alias=ReqRes
    ...                      url=/register
    ...                      json=${body}
    ...                      expected_status=400
      
    Set Global Variable      ${response}
    
    Log                      ${response.json}

GET Endpoint /users

    ${response}              GET On Session
    ...                      alias=ReqRes
    ...                      url=/users
    Set Global Variable      ${response}
    Log                      ${response.content}

GET Endpoint /users/id
    ${response}              GET On Session
    ...                      alias=ReqRes
    ...                      url=/users/1
    Set Global Variable      ${response}
    Log                      ${response.content}

PUT Endpoint /users/id
    ${payload}               Create Dictionary
    ...                      name=ze
    ...                      job=pedreiro
    ${response}              PUT On Session
    ...                      alias=ReqRes
    ...                      url=/users/3
    ...                      json=${payload}
    Set Global Variable      ${response}

    Log                      ${response.content}

PATCH Endpoint /users/id
    ${payload}               Create Dictionary
    ...                      name=joao
    ...                      job=jogador
    ${response}              PUT On Session
    ...                      alias=ReqRes
    ...                      url=/users/5
    ...                      json=${payload}
    Set Global Variable      ${response}

    Log                      ${response.content}

DELETE Endpoint /users/id
    ${response}              PUT On Session
    ...                      alias=ReqRes
    ...                      url=/users/5
    Set Global Variable      ${response}

    Log                      ${response.content}

GET Endpoint /resource/id
    ${response}              GET On Session
    ...                      alias=ReqRes
    ...                      url=/unknown/2
    Set Global Variable      ${response}
    Log                      ${response.content}

GET Endpoint /resource
    ${response}              GET On Session
    ...                      alias=ReqRes
    ...                      url=/unknown
    Set Global Variable      ${response}
    Log                      ${response.content}

PUT Endpoint /resource/id
    ${payload}               Create Dictionary
    ...                      name=azul
    ...                      year=2000
    ...                      color=#C48394
    ${response}              PUT On Session
    ...                      alias=ReqRes
    ...                      url=/unknown/2
    ...                      json=${payload}
    Set Global Variable      ${response}

    Log                      ${response.content}

DELETE Endpoint /resource/id
    ${response}              GET On Session
    ...                      alias=ReqRes
    ...                      url=/unknown/3
    Set Global Variable      ${response}
    Log                      ${response.content}