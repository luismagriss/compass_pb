*** Settings ***
Resource  ../resources/api_testing_user.resource

*** Test Cases ***
Cenário: POST Cadastro de usuário
    Criar sessão no ReqRes
    POST Endpoint /register
    Validar status code "200"

Cenário: GET Listar todos os usuários
    Criar sessão no ReqRes
    GET Endpoint /users
    Validar status code "200"

Cenário: GET Listar um usuário
    Criar sessão no ReqRes
    GET Endpoint /users/id
    Validar status code "200"

Cenário: PUT Editar um usuário
    Criar sessão no ReqRes
    PUT Endpoint /users/id
    Validar status code "200"

Cenário: PATCH Editar um usuário
    Criar sessão no ReqRes
    PATCH Endpoint /users/id
    Validar status code "200"

Cenário: DELETE Excluir um usuário
    Criar sessão no ReqRes
    DELETE Endpoint /users/id
    Validar status code "200"

Cenário: GET Listar um recurso
    Criar sessão no ReqRes
    GET Endpoint /resource/id
    Validar status code "200"

Cenário: PUT Editar um recurso
    Criar sessão no ReqRes
    PUT Endpoint /resource/id
    Validar status code "200"

Cenário: DELETE Excluir um recurso
    Criar sessão no ReqRes
    DELETE Endpoint /resource/id
    Validar status code "200"

Cenário: GET Listar todos os recursos
    Criar sessão no ReqRes
    GET Endpoint /resource
    Validar status code "200"
