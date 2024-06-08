*** Settings ***
Resource     ${ROOT}/resource/main.robot
Resource     ${ROOT}/resource/pages/objects/home/home_objects.resource

*** Keywords ***
Pre informacoes pra novo cadastro
    Abrir navegador chrome
    Acessar Web-site    ${WEB_SITE.AUTOMCAO.URL}
    ${name}    FakerLibrary.Name
    Set Test Variable    ${nome_falso}    ${name}
    ${email}    FakerLibrary.Email
    Verifica e inserir texto    ${home.campo_name}    ${name}    msge_error=Erro ao tentar inserir o texto no campo nome
    Verifica e inserir texto    ${home.campo_email}    ${email}    msge_error=Erro ao tentar inserir o texto no campo de email
    Verifica e clica no botao    ${home.botao}    evidencia?=${False}    msge_error=Erro ao interagir com o botao "signUp"