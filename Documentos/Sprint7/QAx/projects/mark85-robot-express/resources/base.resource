*** Settings ***
Documentation        Keywords
Library              Browser
Library              ../libs/database.py
Resource             ./env.resource
Resource             ./pages/SignupPage.resource

*** Keywords ***
Iniciar sessão
    New Browser    browser=chromium     headless=False
    New Page       ${BASE_URL}

Short password
    [Arguments]    ${short_password}
    ${user}        Create Dictionary
    ...            name=Luis
    ...            email=teste1@qa.com
    ...            password=${short_password}
    
    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe uma senha com pelo menos 6 digitos