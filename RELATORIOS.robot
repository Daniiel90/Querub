*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
${RELATORIO_BTN}            //a[@class='ng-tns-c118-4 ng-star-inserted'][contains(.,'Relatórios')]
&{DADOS_RELATORIO}          datainicial=//input[contains(@placeholder,'Start date')]
...                         datafinal=//input[contains(@placeholder,'End date')]
...                         selecionarquadro=id:mat-select-value-1
...                         nomedoquadro=//span[@class='mat-option-text'][contains(.,'QD-01')]
${RELATORIO_BTN_GERAR}      //button[@aria-disabled='false'][contains(.,'Gerar')]


*** Keywords ***
Clicar no botão de relatórios
    Set Browser Implicit Wait    value=2
    Click Element    ${RELATORIO_BTN}

Inserir dados do relatorios
    Set Browser Implicit Wait    1
    Input Text    ${DADOS_RELATORIO.datainicial}    text=12/05/2022
    Input Text    ${DADOS_RELATORIO.datafinal}    text=16/05/2022
    Click Element    ${DADOS_RELATORIO.selecionarquadro}
    Click Element    ${DADOS_RELATORIO.nomedoquadro}

Clicar no botão de gerar relatórios
    Click Button    ${RELATORIO_BTN_GERAR}
    Set Browser Implicit Wait    5

# Conferir se o quadro está sendo gerado

    # Wait Until Element Is Visible
    # ...    locator=//span[@class='message message-dark'][contains(.,'Relatório em processamento')]
