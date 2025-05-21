*** Settings ***
Library    Collections
Library    String
Library    RequestsLibrary

*** Keywords ***
Gerar dados de um novo usuário
    ${random_user}  String.Generate Random String  6  [LOWER][NUMBERS]
    Set Test Variable    ${user_mail}  ${random_user}@email.com
    Log                  ${user_mail}
    