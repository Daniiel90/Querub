*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
###----Apagar Usuarios---###
${USUARIO_BRN_APAGAR}       (//button[contains(@nbtooltip,'Excluir')])[7]


*** Keywords ***
#######-------------Ativar usuario do Siatema-------------#######
Entrar na categoria grupo de usuario
    Set Browser Implicit Wait    3
    Click Element    locator=//a[@class='ng-tns-c118-6 ng-star-inserted'][contains(.,'Usuários do sistema')]

Clicar no botão de ativar usuario
    Set Browser Implicit Wait    value=2
    Click Element    locator=//div[contains(@class,'toggle ng-tns-c223-686')]

######--------Excluir Usuario do Sistema-----------####

Selecionar categoria
    Set Selenium Implicit Wait    2
    Click Button    locator=//button[@type='button'][contains(.,'Categoria')]
    Wait Until Element Is Visible    locator=//nb-option[contains(@id,'nb-option-0')]
    Click Element    locator=//nb-option[contains(@id,'nb-option-0')]

Inserir nome de usuario que deseja deletar
    Wait Until Element Is Visible    locator=//input[contains(@type,'text')]
    Input Text    locator=//input[contains(@type,'text')]    text=Daniel
    Set Browser Implicit Wait    5
    Capture Page Screenshot

Clicar no botão de apagar
    Click Button    ${USUARIO_BRN_APAGAR}
    Set Browser Implicit Wait    value=2
