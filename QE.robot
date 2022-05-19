*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
${QE_BTN}                   //a[@class='ng-tns-c118-2 ng-star-inserted'][contains(.,'Qualidade energética')]
${QE_QUADRO}                id:mat-select-value-1
${QE_SELECIONARQUADRO}      //span[@class='mat-option-text'][contains(.,'QD-01')]
${QE_BTN_PROSSEGUIR}        //button[@aria-disabled='false'][contains(.,'Prosseguir')]


*** Keywords ***
Clicar na categoria de qualidade energetica
    Set Browser Implicit Wait    value=2
    Click Element    ${QE_BTN}

Selecionar quadro
    Click Element    ${QE_QUADRO}
    Set Browser Implicit Wait    value=1
    Click Element    ${QE_SELECIONARQUADRO}

Clicar no botão de preosseguir
    Click Button    ${QE_BTN_PROSSEGUIR}
    Set Browser Implicit Wait    value=2

Aguardar que a pagina contenha as infomações
    Wait Until Page Contains    text=Tensão de atendimento (TA)
