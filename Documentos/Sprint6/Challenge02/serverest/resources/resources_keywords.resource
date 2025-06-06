*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary
Library    Collections

*** Variables ***
${BASE_URL}             http://172.31.64.74:3000

*** Keywords ***

Criar sessão na Serverest
    ${headers}        Create Dictionary
    ...               accept=application/json
    ...               Content-Type=application/json
    ...               authorization=${token}
    Create Session    ServeRest    ${BASE_URL}    ${headers}
    Log    ${headers}[authorization]

POST Endpoint /login
    [Arguments]       ${email}=fulano@qa.com    ${password}=teste
    
    ${body}           Create Dictionary
    ...               email=${email}
    ...               password=${password}
    
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
    
    RETURN          ${response}

GET Endpoint /usuarios
    ${response}        GET On Session
    ...                alias=ServeRest
    ...                url=usuarios
    
    RETURN           ${response}

POST Endpoint /produtos
    ${nome_produto}    FakerLibrary.Company
    ${preco_produto}   FakerLibrary.Random Int    min=10    max=1000
    ${descricao}       FakerLibrary.Paragraph    nb_sentences=2
    ${quantidade}      FakerLibrary.Random Int    min=1    max=100
    
    ${body}            Create Dictionary
    ...                nome=${nome_produto}
    ...                preco=${preco_produto}
    ...                descricao=${descricao}
    ...                quantidade=${quantidade}
    
    ${response}        POST On Session    ServeRest    /produtos    json=${body}

    Log    ${response.json()}[message]
    RETURN           ${response}

GET Endpoint /produtos
    ${response}        GET On Session
    ...                alias=ServeRest
    ...                url=produtos
    
    RETURN           ${response}

PUT Endpoint /produtos/${id_produto}
    ${nome_produto}    FakerLibrary.Company
    ${preco_produto}   FakerLibrary.Random Int    min=10    max=1000
    ${descricao}       FakerLibrary.Paragraph    nb_sentences=2
    ${quantidade}      FakerLibrary.Random Int    min=1    max=100
    
    ${body}            Create Dictionary
    ...                nome=${nome_produto}
    ...                preco=${preco_produto}
    ...                descricao=${descricao}
    ...                quantidade=${quantidade}
    
    ${response}        PUT On Session    ServeRest    /produtos/${id_produto}    json=${body}
    
    Log    ${response.json()}[message]
    RETURN           ${response}

DELETE Endpoint /produtos/${id_produto}
    ${response}        DELETE On Session    ServeRest    /produtos/${id_produto}
    
    Log    ${response.json()}[message]
    RETURN           ${response}

POST Endpoint /usuarios
    ${nome}            FakerLibrary.Name
    ${email}           FakerLibrary.Email
    ${password}        FakerLibrary.Password    length=10    special_chars=True
    
    ${body}            Create Dictionary
    ...                nome=${nome}
    ...                email=${email}
    ...                password=${password}
    ...                administrador=true
    
    ${header}          Create Dictionary
    ...                accept=application/json
    ...                Content-Type=application/json
    
    ${response}        POST
    ...                url=${BASE_URL}/usuarios
    ...                json=${body}
    ...                headers=${header}
    
    Log    ${response.json()}[message]
    RETURN           ${response}

PUT Endpoint /usuarios/${id_usuario}
    ${nome}            FakerLibrary.Name
    ${email}           FakerLibrary.Email
    ${password}        FakerLibrary.Password    length=10    special_chars=True
    
    ${body}            Create Dictionary
    ...                nome=${nome}
    ...                email=${email}
    ...                password=${password}
    ...                administrador=true
    
    ${response}        PUT On Session    ServeRest    /usuarios/${id_usuario}    json=${body}
    
    Log    ${response.json()}[message]
    RETURN           ${response}

DELETE Endpoint /usuarios/${id_usuario}
    ${response}        DELETE On Session    ServeRest    /usuarios/${id_usuario}
    
    Log    ${response.json()}[message]
    RETURN           ${response}

GET Endpoint /carrinhos
    ${response}        GET On Session
    ...                alias=ServeRest
    ...                url=carrinhos
    
    RETURN           ${response}

POST Endpoint /carrinhos
    [Arguments]        ${id_produto}
    ${quantidade}      FakerLibrary.Random Int    min=1    max=5
    
    ${body}            Create Dictionary
    ...                produtos=@{EMPTY}
    
    ${produto}         Create Dictionary
    ...                idProduto=${id_produto}
    ...                quantidade=${quantidade}
    
    Append To List     ${body.produtos}    ${produto}
    
    ${response}        POST On Session    ServeRest    /carrinhos    json=${body}
    
    Log    ${response.json()}[message]
    RETURN           ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    ${response}        DELETE On Session    ServeRest    /carrinhos/cancelar-compra
    
    Log    ${response.json()}[message]
    RETURN           ${response}

DELETE Endpoint /carrinhos/concluir-compra
    ${response}        DELETE On Session    ServeRest    /carrinhos/concluir-compra
    
    Log    ${response.json()}[message]
    RETURN           ${response}