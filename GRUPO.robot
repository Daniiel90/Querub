*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
${URL_GRUPO}                http://192.168.100.126:8080
${GRUPO_USUARIO}            name:email
${GRUPO_SENHA}              name:senha
${GRUPO_BTN_ENTRAR}         //button[@type='submit'][contains(.,'Entrar')]

######------------VERIFICAR GRUPO EXISTENTE----------########
${GRUPO_MSG}                //div[contains(@class,'toast-top-right toast-container')]
${GRUPO_BTN}                //a[@href='/pages/admin/user-settings/account-groups']
${GRUPO_BTN_CATEGORIA}      //button[@type='button'][contains(.,'Categoria')]
${GRUPO_BTN_NOME}           id:nb-option-10
${GRUPO_INPUT_TEXT}         //input[contains(@type,'text')]
${GRUPO_MSG_CREAT}          //td[@role='gridcell'][contains(.,'admin')]
########----------- CRIAR NOVO GRUPO---------------########
${GRUPO_BTN_CREAT}          //button[@class='button'][contains(.,'Criar Grupo')]
${GRUPO_NEW_GROUP_TEXT}     //input[contains(@class,'input input-full-width size-medium status-basic shape-rectangle ng-untouched ng-pristine ng-invalid nb-transition')]
${GRUPO_SELECT_ALL}         //button[@class='btn-all'][contains(.,'Selecionar tudo')]
${GRUPO_BTN_SALVAR}         //button[@type='submit'][contains(.,'SALVAR')]


*** Keywords ***
Acessar home page da aplicação
    Go To    ${URL_GRUPO}

Inserir usuario e senha
    Input Text    ${GRUPO_USUARIO}    text=root
    Input Text    ${GRUPO_SENHA}    text=querub

 Clicar no botão de entrar
    Click Button    ${GRUPO_BTN_ENTRAR}

#######--------CRIAR UM NOVO GRUPO NA PLATAFORMA---------######

Clicar no Botão de Criar Grupo
    Wait Until Element Is Visible    ${GRUPO_BTN_CREAT}
    Click Button    ${GRUPO_BTN_CREAT}

Inserir nome do grupo
    Input Text    ${GRUPO_NEW_GROUP_TEXT}    text= 90922

Selecionar todas as Permissões
    Click Button    ${GRUPO_SELECT_ALL}

Clicar no Botão de Salvar
    Click Button    ${GRUPO_BTN_SALVAR}
    Wait Until Element Is Visible    id:toast-container
    Set Selenium Implicit Wait    value=3

#########------------VERIFICAR UM GRUPO EXISTENTE NA PLATAFORMA------------#######

Entrar na categoria Grupo de Usuarios
    Wait Until Page Contains Element    locator=//span[contains(.,'Sistema de Gestão Energética')]

    Click Element    ${GRUPO_BTN}

Selecionar categoria
    Click Element    locator=//button[@type='button'][contains(.,'Categoria')]
    Set Selenium Implicit Wait    value=1
    Click Element    locator=id:nb-option-0

Inserir o nome de um grupo já criado no campo de pesquisa
    Page Should Contain Textfield    locator=//input[contains(@type,'text')]
    Input Text    ${GRUPO_INPUT_TEXT}    text=90922

Verificar se o grupo está criado
    Set Selenium Implicit Wait    value=10
    Wait Until Page Contains    text=90922
#######-------Verificar se os grupos estão com as definidas permissoes------#####

Clicar no botão de visualizar
    Click Button    locator=//button[contains(@nbtooltip,'Visualizar')]
