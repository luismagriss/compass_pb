*** Settings ***
Documentation        Online
Library              Browser
Resource             ../resources/base.resource

*** Test Cases ***
WebApp deve estar Online
    Iniciar sessão
    Get Title        equal    Mark85 by QAx

