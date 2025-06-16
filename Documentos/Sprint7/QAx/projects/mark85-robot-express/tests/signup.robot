*** Settings ***
Documentation    Cenários de testes de cadastro de usuários

Library          Browser
Library          FakerLibrary
Library          ../libs/database.py

Resource         ../resources/base.resource
Resource         ../resources/pages/SignupPage.resource

Test Setup       Iniciar sessão



*** Test Cases ***
Deve poder cadastrar um novo usuário

    ${user}        Create Dictionary
    ...            name=Usuário Teste
    ...            email=usuario@teste.com
    ...            password=teste123
    
    Remove User           ${user}[email]

    Go to signup page
    Submit signup form    ${user}
    Notice should be      Boas vindas ao Mark85, o seu gerenciador de tarefas.

    Remove User           ${user}[email]

Não deve poder cadastrar email duplicado
    
    ${user}        Create Dictionary
    ...            name=Teste QA
    ...            email=qa@teste.com
    ...            password=teste123
    
    Insert User    ${user}
    
    Go to signup page
    Submit signup form    ${user}
    Notice should be    Oops! Já existe uma conta com o e-mail informado.

Não deve permitir senha com 1 digito
    ${user}        Create Dictionary
    ...            name=${EMPTY}
    ...            email=${EMPTY}
    ...            password=${EMPTY}
    
    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe seu nome completo
    Alert should be    Informe seu e-email
    Alert should be    Informe uma senha com pelo menos 6 digitos

Não deve permitir email inválido
    ${user}        Create Dictionary
    ...            name=EMAIL INVÁLIDO
    ...            email=notanemail.com.br
    ...            password=teste123
    
    Go to signup page
    Submit signup form    ${user}

    Alert should be    Digite um e-mail válido