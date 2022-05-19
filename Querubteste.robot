*** Settings ***
Resource            ./PO/querub_resouces.robot
Resource            ./PO/GRUPO.robot
Resource            ./PO/LOGIN.robot
Resource            ./PO/DC.robot
Resource            ./PO/DM.robot
Resource            ./PO/USUARIO.robot
Resource            ./PO/RELATORIOS.robot
Resource            ./PO/QE.robot
Resource            ./PO/QS.robot
Resource            ./PO/PM.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***
 ##########-----LOGIN------########
# Caso de teste 01- Fazer login na plataforma
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    LOGIN.Verificar se login foi efetuado

# Caso de teste 2- Recuperar senha
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Clicar no no botão Esqueci minha senha
#    LOGIN.Inserir email de recuperação
#    LOGIN.Clicar no botão de enviar

# Caso de teste 3- Criar novo usuario na plataforma
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Clicar no botão de inscreva-se
#    LOGIN.Preencer formulario de inscrição
#    LOGIN.Clicar no no botão de entrar
#    LOGIN.Verificar se usuario foi cadastrado

# Caso de teste 4- Fazer logout na plataforma
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    LOGIN.Verificar se login foi efetuado
#    LOGIN.Clicar na caixa de msg
#    LOGIN.Clicar em usuario
#    LOGIN.Clicar em sair

# Caso de teste- Alterar senha
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    LOGIN.Clicar em usuario
#    LOGIN.Clicar em alterar senha
#    LOGIN.Inserir senha atual e nova senha

# Caso de teste- Editar perfil de usuario
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    LOGIN.Clicar em usuario
#    LOGIN.Clicar em visializar perfil
#    LOGIN.Clicar em editar perfil
#    LOGIN.Inserir dados
#    LOGIN.Clicar em salvar

#########-------GRUPO--------########

# Caso de este 05- Criar um grupo de usuario na plataforma
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    GRUPO.Entrar na categoria Grupo de Usuarios
#    GRUPO.Clicar no Botão de Criar Grupo
#    GRUPO.Inserir nome do grupo
#    GRUPO.Selecionar todas as Permissões
#    GRUPO.Clicar no Botão de Salvar

# Caso de teste 06- Verificar um grupo existente na plataforma
#    GRUPO.Acessar home page da aplicação
#    GRUPO.Inserir usuario e senha
#    GRUPO.Clicar no botão de entrar
#    GRUPO.Entrar na categoria Grupo de Usuarios
#    GRUPO.Selecionar categoria
#    GRUPO.Inserir o nome de um grupo já criado no campo de pesquisa
#    GRUPO.Verificar se o grupo está criado

# Caso de teste 07- Verificar se os grupos estão com as definidas permissoes
#    GRUPO.Acessar home page da aplicação
#    GRUPO.Inserir usuario e senha
#    GRUPO.Clicar no botão de entrar
#    GRUPO.Entrar na categoria Grupo de Usuarios
#    GRUPO.Inserir o nome de um grupo já criado no campo de pesquisa
#    GRUPO.Verificar se o grupo está criado
#    GRUPO.Clicar no botão de visualizar

# ########--------DISPOSITIVO DE CONCENTRAÇÃO----########

# Caso de teste 08- Cadastrar um Dispositivo de Concentração
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    DC.Entrar na categoria dispositivo de concentração
#    DC.Clicar no botão de cadastrar
#    DC.Preencher formulário
#    DC.Clicar no botão de salvar

# Caso de teste numero - Excluir dispositivo de concentração
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    DC.Entrar na categoria dispositivo de concentração
#    DC.Inserir o nome do quadro que sera deletado
#    DC.Conferir se o quadro nestá sendo apresentado
#    DC.Clicar no botão de excluir
#    DC.Confirmar exclusão

####------------DISPOSITIVO DE MEDIÇÃO--------#####

Caso de teste 09- Cadastrar dispositivo de medição
    LOGIN.Acessar home page da aplicação
    LOGIN.Inserir usuario e senha
    LOGIN.Clicar no botão de entrar
    DM.Entrar na categoria Dispositivo de Medição
    DM.Clicar no botão de Cadastrar
    DM.Preencher formulário
    DM.Clicar no botão de Salvar

# Caso de teste mumero - Excluir dispositivo de medição
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    DM.Entrar na categoria Dispositivo de Medição
#    DM.Inserir o nome do circuito que sera deletado
#    DM.Conferir se o circuito nestá sendo apresentado
#    DM.Clicar no botão de excluir
#    DM.Confirmar exclusão

#####---------USUARIOS DO SISTEMA----------------#####

# Caso de teste 10 - Ativar usuario do sistema
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    USUARIO.Entrar na categoria grupo de usuario
#    USUARIO.Clicar no botão de ativar usuario

# Caso de teste 11- Apagar usuario do sistema
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    USUARIO.Entrar na categoria grupo de usuario
#    USUARIO.Selecionar categoria
#    USUARIO.Inserir nome de usuario que deseja deletar
#    # USUARIO.Clicar no botão de apagar

#####------Gerar Rleatorios------#######

# Caso de teste 12- Gerar relatorios
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    RELATORIOS.Clicar no botão de relatórios
#    RELATORIOS.Inserir dados do relatorios
#    RELATORIOS.Clicar no botão de gerar relatórios
#    RELATORIOS.Conferir se o relatorio está sendo gerado

#####------Gerar Qualidade Energetica------####

# Caso de teste 13- Gerar Qaualidade Energetica
#    LOGIN.Acessar home page da aplicação
#    LOGIN.Inserir usuario e senha
#    LOGIN.Clicar no botão de entrar
#    QE.Clicar na categoria de qualidade energetica
#    QE.Selecionar quadro
#    QE.Clicar no botão de preosseguir
#    QE.Aguardar que a pagina contenha as infomações
