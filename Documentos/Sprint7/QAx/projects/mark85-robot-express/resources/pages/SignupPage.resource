*** Settings ***
Documentation        Keywords da página de cadastro de usuário
Library              Browser
Resource             ../env.resource
Resource             ../base.robot

*** Keywords ***
Go to signup page
    Go To             http://localhost:3000/signup
    #Checkpoint
    ${element}        Set Variable    css=h1
    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    equal      Faça seu cadastro

Submit signup form
    [Arguments]    ${user}
    Fill Text    id=name        ${user}[name]
    Fill Text    id=email       ${user}[email]
    Fill Text    id=password    ${user}[password]
    Click        id=buttonSignup

Notice should be
    [Arguments]    ${message}
    ${notice_element}    Set Variable    css=.notice p 
    Wait For Elements State    ${notice_element}    visible    5
    Get Text                   ${notice_element}    equal      ${message}

Alert should be
    [Arguments]    ${message}
    ${alert_element}    Set Variable    css=.alert-error >> text=${message}

    Wait For Elements State    ${alert_element}    visible    5
    Get Text                   ${alert_element}    equal      ${message}