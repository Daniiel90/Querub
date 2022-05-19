*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
######---------FAZER LOGIN NA PLATAFORMA-------------########
${URL}                              http://192.168.100.126:8080
${LOGIN_USUARIO}                    name:email
${LOGIN_SENHA}                      //input[contains(@type,'password')]
${LOGIN_BTN_ENTRAR}                 //button[@type='submit'][contains(.,'Entrar')]
${LOGIN_MSG}                        //span[contains(.,'Sistema de Gestão Energética')]

######-----------RESCUPERAR SENHA-------------#####
${LOGIN_BTN_RECUPERAR_SENHA}        //a[@routerlink='../request-password'][contains(.,'Esqueci minha senha')]
${LOGIN.INPUT_EMAIL_RECUPERAR}      name:user-email
${LOGIN_BTN_ENVIAR}                 //button[contains(@class,'btn-login appearance-filled size-medium status-basic shape-rectangle nb-transition')]
${LOGIN_TEXT_ENVIADO}               //button[@type='submit'][contains(.,'Voltar ao login')]

#######--------------- CADASTRAR NOVO USUARIO NA PLATAFORMA---------------#####
${LOGIN_MSG_CREAT}                  //span[@class='content-title'][contains(.,'Criar sua conta')]
${LOGIN_BTN_INSCREVER}              //a[@routerlink='../register'][contains(.,'Inscreva-se')]
&{CADASTRO_FORM}                    matricula=user-registry
...                                 nome=user-name
...                                 email=name:email
...                                 username=user-name-account
...                                 senha=password

${MSG_CREAT_ACOUNT}                 //span[@class='content-title'][contains(.,'Criar sua conta')]
${CADASTRO_BTN}                     //button[contains(@class,'btn-login appearance-filled size-medium status-basic shape-rectangle nb-transition')]
${CADASTRO_MSG}                     //span[@class='content-title'][contains(.,'Tudo certo, aguarde seu ativamento!')]

#########------- FAZER LOGOUT NA PLATAFORMA-------#######
${LOGIN_USER}                       //div[contains(@class,'user-picture image ng-star-inserted')]
${LOGIN_BTN_SAIR}                   //a[@class='ng-tns-c118-11 ng-star-inserted'][contains(.,'Sair')]
${LOGIN_MSG}                        id:"toast-container"

########--------ALTERAR SENHA--------######
${LOGIN_BTN_ALTERARSENHA}           //span[@class='menu-title ng-tns-c118-68'][contains(.,'Alterar senha')]
&{LOGIN_SENHA_ALTERAR}              senhaatual=//input[contains(@class,'input input-full-width size-medium shape-rectangle ng-pristine ng-invalid nb-transition is-danger status-danger ng-touched')]
...                                 novasenha=//input[contains(@type,'email')]

#########-----EDITAR PERFIL------########
${LOGIN_BTN_VISUALIZARPERFIL}       //a[@class='ng-tns-c118-100 ng-star-inserted'][contains(.,'Visualizar perfil')]
${LOGIN_BTN_EDITARPERFIL}           //button[contains(@nbtooltip,'Editar')]
&{LOGIN_INPUT_DADOS}                matricula=//input[contains(@class,'input input-full-width size-medium status-basic shape-rectangle ng-pristine ng-valid nb-transition ng-touched')]
...                                 email=//input[contains(@type,'email')]
...                                 username=(//input[contains(@class,'input input-full-width size-medium status-basic shape-rectangle ng-pristine ng-valid nb-transition ng-touched')])[3]
...                                 nome=(//input[contains(@class,'input input-full-width size-medium status-basic shape-rectangle ng-pristine ng-valid nb-transition ng-touched')])[3]
${LOGIN_BTN_SALVAR}                 //button[@type='submit'][contains(.,'SALVAR')]


*** Keywords ***
#####-------------FAZER LOGIN NA PLATAFORMA----------------####
Acessar home page da aplicação
    Go To    ${URL}

Inserir usuario e senha
    Input Text    ${LOGIN_USUARIO}    text=root
    Input Text    ${LOGIN_SENHA}    text=querub

 Clicar no botão de entrar
    Click Button    ${LOGIN_BTN_ENTRAR}

verificar se login foi efetuado
    Wait Until Page Contains Element    ${LOGIN_MSG}
######-----------RECUPERAR SENHA--------------- #####

Clicar no no botão Esqueci minha senha
    Click Element    ${LOGIN_BTN_RECUPERAR_SENHA}

Inserir email de recuperação
    Input Text    ${LOGIN.INPUT_EMAIL_RECUPERAR}    text=dokasii30@gmail.com

 Clicar no botão de enviar
    Click Button    ${LOGIN_BTN_ENVIAR}

    Wait Until Element Is Visible    ${LOGIN_TEXT_ENVIADO}

#############-----------CRIAR NOVO USUARIO NA PLATAFORMA-----------#############

Clicar no botão de inscreva-se
    # Wait Until Element Is Visible    ${LOGIN_MSG_CREAT}
    Click Element    ${LOGIN_BTN_INSCREVER}

Preencer formulario de inscrição
    Wait Until Element Is Visible    ${MSG_CREAT_ACOUNT}
    Input Text    ${CADASTRO_FORM.matricula}    9454073
    Input Text    ${CADASTRO_FORM.nome}    Daniel
    Input Text    ${CADASTRO_FORM.email}    dannioell@gmail.com
    Input Text    ${CADASTRO_FORM.username}    testee
    Input Text    ${CADASTRO_FORM.senha}    1234556

Clicar no no botão de entrar
    Click Button    ${CADASTRO_BTN}

Verificar se usuario foi cadastrado
    Wait Until Element Is Visible    ${CADASTRO_MSG}

#########------- FAZER LOGOUT NA PLATAFORMA-------#######

Clicar na caixa de msg
    Wait Until Element Is Visible    ${LOGIN_MSG}
    Click Element    ${LOGIN_MSG}
    Set Browser Implicit Wait    2
    Capture Page Screenshot

Clicar em usuario
    Wait Until Element Is Visible    ${LOGIN_USER}
    Click Element    ${LOGIN_USER}

Clicar em sair
    Wait Until Element Is Visible    ${LOGIN_BTN_SAIR}
    Click Element    ${LOGIN_BTN_SAIR}

########--------ALTERAR SENHA--------######

Clicar em alterar senha
    Click Element    ${LOGIN_BTN_ALTERARSENHA}

Inserir senha atual e nova senha
    Input Text    ${LOGIN_SENHA_ALTERAR.senhaatual}    text=*****
    Input Text    ${LOGIN_SENHA_ALTERAR.novasenha}    text=*****

#########-----EDITAR PERFIL------########

Clicar em visializar perfil
    Wait Until Element Is Visible    ${LOGIN_MSG}
    Click Element    ${LOGIN_MSG}
    Set Browser Implicit Wait    4
    Wait Until Element Is Visible    ${LOGIN_USER}
    Click Element    ${LOGIN_USER}
    Wait Until Element Is Not Visible    ${LOGIN_BTN_VISUALIZARPERFIL}
    Click Element    ${LOGIN_BTN_VISUALIZARPERFIL}

Clicar em editar perfil
    Capture Page Screenshot
    Click Button    ${LOGIN_BTN_EDITARPERFIL}

Inserir dados
    Input Text    ${LOGIN_INPUT_DADOS.matricula}    text=000
    Input Text    ${LOGIN_INPUT_DADOS.email}    text=danie
    Input Text    ${LOGIN_INPUT_DADOS.username}    text=dan
    Input Text    ${LOGIN_INPUT_DADOS.nome}    text=da

Clicar em salvar
    Click Button    ${LOGIN_BTN_SALVAR}
