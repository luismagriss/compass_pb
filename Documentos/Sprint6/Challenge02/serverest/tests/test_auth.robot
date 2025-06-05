*** Settings ***
Resource        ../resources/resources_keywords.resource

*** Test Cases ***
Cenário 01: Fazer login com sucesso
    ${response}    POST Endpoint /login
    Should Be Equal As Strings    ${response.status_code}    200
    Should Not Be Empty    ${response.json()}[authorization]
    Criar sessão na Serverest