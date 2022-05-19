*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
${BROWSER}      chrome


*** Keywords ***
##SETUP E TEARDOWN
Abrir Navegador
    Open Browser    about:blank    ${BROWSER}

Fechar navegador
    Close Browser
