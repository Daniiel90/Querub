*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
##########--------Cadastrar um novo didpositivo de concentração------########
${DC_MSG}                       //a[@href='/pages/sge/concentration-devices']
${DC_BTN}                       //a[@href='/pages/sge/concentration-devices']
${DC_MSG_CADASTRAR}             //th[@role='columnheader'][contains(.,'Quadro')]
${DC_BTN_CADASTRAR}             //button[@class='button'][contains(.,'Cadastrar')]
${DC_MSG}                       //h2[@class='card-title'][contains(.,'Cadastro dispositivo de concentração')]
&{DC_FORM_CREAT}                nomedoquadro=//input[contains(@placeholder,'Quadro A')]
...                             identificação=//input[contains(@placeholder,'121212121212')]
...                             descrição=//textarea[contains(@rows,'3')]
...                             demandamaxima=//input[contains(@placeholder,'40 kW')]
...                             consumomaximo=//input[contains(@placeholder,'1 kWh')]
...                             correntemaximadodisjuntor=//input[contains(@placeholder,'50')]
...                             tensaofaseneutro=//input[contains(@placeholder,'127')]
...                             forneciemtodeenergia=//label[contains(.,'Bifásico')]
...                             sequenciadefases=//label[contains(.,'Bifásico')]
...                             host=//input[contains(@placeholder,'0.0.0.0')]
...                             porta=//input[contains(@placeholder,'8765')]
${DC_BTN_SALVAR}                //button[@type='submit'][contains(.,'SALVAR')]
${DC_MSG_CREAT}                 //th[@role='columnheader'][contains(.,'Quadro')]
######------EXCLUIR DISPOSITIVO DE CONCENTRAÇÃO----######
${DC_BTN_CATEGORIA}             //button[@type='button'][contains(.,'Categoria')]
${DC_BTN_NOME_QUADRO}           //nb-option[@ng-reflect-value='name'][contains(.,'Nome')]
${DC_INPUT_NOMEQUADRO}          //input[contains(@type,'text')]
${DC_BTN_EXCLUIR}               //button[contains(@nbtooltip,'Excluir')]
${DC_BTN_EXCLUIR_CONFIRMAR}     //button[@status='success'][contains(.,'Excluir')]


*** Keywords ***
##########--------Cadastrar um novo diSpositivo de concentração------########

Entrar na categoria dispositivo de concentração
    Wait Until Element Is Visible    ${DC_MSG}
    Set Browser Implicit Wait    value=5
    Click Element    ${DC_BTN}

Clicar no botão de cadastrar
    Wait Until Page Contains Element    ${DC_MSG_CADASTRAR}
    Set Browser Implicit Wait    value=2
    Click Button    ${DC_BTN_CADASTRAR}

Preencher formulário
    Wait Until Page Contains Element    ${DC_MSG}
    Input Text    ${DC_FORM_CREAT.nomedoquadro}    text=QuadroPT
    Input Text    ${DC_FORM_CREAT.identificação}    text=123456789101
    Input Text    ${DC_FORM_CREAT.descrição}    text=qualquer coisa pra ateste
    Input Text    ${DC_FORM_CREAT.demandamaxima}    text=40
    Input Text    ${DC_FORM_CREAT.consumomaximo}    text=1
    Input Text    ${DC_FORM_CREAT.correntemaximadodisjuntor}    text=50
    Input Text    ${DC_FORM_CREAT.tensaofaseneutro}    text=128
    Click Element    ${DC_FORM_CREAT.forneciemtodeenergia}
    Click Element    ${DC_FORM_CREAT.sequenciadefases}
    Input Text    ${DC_FORM_CREAT.host}    text=1.5.2.4
    Input Text    ${DC_FORM_CREAT.porta}    text=1525

 Clicar no botão de salvar
    Click Button    ${DC_BTN_SALVAR}
    Wait Until Element Is Visible    ${DC_MSG_CREAT}

######------EXCLUIR DISPOSITIVO DE CONCENTRAÇÃO----######

Inserir o nome do quadro que sera deletado
    Wait Until Element Is Visible    ${DC_BTN_CATEGORIA}
    Set Browser Implicit Wait    2
    Click Button    ${DC_BTN_CATEGORIA}
    Set Browser Implicit Wait    2
    Click Element    ${DC_BTN_NOME_QUADRO}
    Input Text    ${DC_INPUT_NOMEQUADRO}    text=quadro22

Conferir se o quadro nestá sendo apresentado
    Set Browser Implicit Wait    4
    Capture Page Screenshot
    Wait Until Page Contains Element    ${DC_BTN_EXCLUIR}

Clicar no botão de excluir
    Click Button    ${DC_BTN_EXCLUIR}
    Set Browser Implicit Wait    1

Confirmar exclusão
    Click Button    ${DC_BTN_EXCLUIR_CONFIRMAR}
    Set Browser Implicit Wait    1
    Wait Until Element Is Visible    locator=toast-container
    Capture Page Screenshot
