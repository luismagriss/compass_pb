*** Settings ***
Library           BuiltIn
Library           Collections
Library           String

*** Test Cases ***
Exemplo de Teste
    Log    ${MESES[0]}
    Log    ${MESES[1]}
    Log    ${MESES[2]}
    Log    ${MESES[3]}
    Log    ${MESES[4]}
    Log    ${MESES[5]}
    Log    ${MESES[6]}
    Log    ${MESES[7]}
    Log    ${MESES[8]}
    Log    ${MESES[9]}
    Log    ${MESES[10]}
    Log    ${MESES[11]}

*** Variables ***
@{MESES}    janeiro    fevereiro    março    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro

*** Keywords ***
Set Global Variable    @{MESES}

