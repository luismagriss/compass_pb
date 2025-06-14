*** Settings ***
Documentation        Keywords
Library              Browser
Library              ../libs/database.py
Resource             ./env.resource

*** Keywords ***
Iniciar sessão
    New Browser    browser=chromium     headless=False
    New Page       ${BASE_URL}