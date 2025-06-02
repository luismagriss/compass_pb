*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}             https://compassuol.serverest.dev
${nome_produto}         Processador Ryzen 7
${preco_produto}        780
${descricao_produto}    CPU com 8 núcleos e 16 threads

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
    ${response}        GET On Session
    ...                alias=ServeRest
    ...                url=users    

POST Endpoint /produtos
    ${body}            Create Dictionary
    ...                nome= ${nome_produto}
    ...                preco=${preco_produto}
    ...                descricao=${descricao_produto}
    ...                quantidade=15
    
    ${response}        POST On Session    ServeRest    /produtos    json=${body}

    Log    ${response.json()}[message]