*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
######--------CADASTRAER DISPOSITIVO DE MEDIÇÃO-----########
${DM_BTN}                       //a[@class='ng-tns-c118-1 ng-star-inserted active'][contains(.,'Dispositivos de medição')]
${DM_BTN_CADASTRAR}             //button[@class='button'][contains(.,'Cadastrar')]
&{DM_FORMULARIO}                nome=//input[contains(@placeholder,'Nome')]
...                             quadro=//button[@type='button'][contains(.,'QD-1')]
...                             selecionarquadro=//nb-option[@ng-reflect-value='QD-01'][contains(.,'QD-01')]
...                             potenciainstalada=//input[contains(@placeholder,'Potencia Instalada')]
...                             fornecimentodeenergia=//span[@class='text'][contains(.,'Trifásico')]
...                             correntenominaldodisjuntor=//input[contains(@placeholder,'50A')]
...                             identificador=//input[contains(@placeholder,'12')]
...                             descrição=id:description
${DM_BRN_SALVAR}                //button[@type='submit'][contains(.,'SALVAR')]
######--------DELETAR DISPOSITIVO DE MEDIÇÃO-----########
${DM_BN_CATEGORIA}              //button[@type='button'][contains(.,'Categoria')]
${DM_BTN_NOMECIRCUITO}          nb-option-0
${DM_INPUT_NOME}                //input[contains(@type,'text')]
${DM_BTN_EXCLUIR}               //button[contains(@nbtooltip,'Excluir')]
${DM_BTR_EXCLUIR_CONFIRMAR}     //button[@status='success'][contains(.,'Excluir')]


*** Keywords ***
Entrar na categoria Dispositivo de Medição
    Set Browser Implicit Wait    value=3
    Click Element    ${DM_BTN}

Clicar no botão de Cadastrar
    Click Button    ${DM_BTN_CADASTRAR}

Preencher formulário
    Input Text    ${DM_FORMULARIO.nome}    text=Circuito22
    Click Button    ${DM_FORMULARIO.quadro}
    Input Text    ${DM_FORMULARIO.potenciainstalada}    text=50
    Set Browser Implicit Wait    value=2
    Click Element    ${DM_FORMULARIO.selecionarquadro}
    Click Element    ${DM_FORMULARIO.fornecimentodeenergia}
    Input Text    ${DM_FORMULARIO.correntenominaldodisjuntor}    text=50
    Input Text    ${DM_FORMULARIO.identificador}    text=22
    Input Text    ${DM_FORMULARIO.descrição}    text=

Clicar no botão de Salvar
    Click Button    ${DM_BRN_SALVAR}

######--------DELETAR DISPOSITIVO DE MEDIÇÃO-----########

Inserir o nome do circuito que sera deletado
    Click Button    ${DM_BN_CATEGORIA}
    Set Browser Implicit Wait    1
    Click Element    ${DM_BTN_NOMECIRCUITO}
    Input Text    ${DM_INPUT_NOME}    text=Circuito 19
    Set Browser Implicit Wait    4

Conferir se o circuito nestá sendo apresentado
    Wait Until Page Contains Element    ${DM_BTN_EXCLUIR}

Clicar no botão de excluir
    Click Button    ${DM_BTN_EXCLUIR}
    Set Browser Implicit Wait    1

Confirmar exclusão
    Click Button    ${DM_BTR_EXCLUIR_CONFIRMAR}
    Set Browser Implicit Wait    3
