*** Settings ***
Resource         ${ROOT}/resource/main.robot
Resource         ${ROOT}/resource/pages/actions/keywords/home/home.resource
Resource         ${ROOT}/resource/pages/actions/keywords/signup/novo_usuario.resource
Test Teardown    Fechar navegador


*** Test Cases ***
Criar um usuario corretamente
    [Setup]    Pre informacoes pra novo cadastro
    Dado que  esta na pagina de SignUp
    Quando  preencho todos os dados obrigatorios
    Entao  valido que o usuario foi criado com sucesso