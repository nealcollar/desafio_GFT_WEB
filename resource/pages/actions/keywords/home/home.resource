*** Settings ***
Resource     ${ROOT}/resource/main.robot
Resource     ${ROOT}/resource/pages/objects/home/home_objects.resource

*** Keywords ***
Pre informacoes pra novo cadastro
    acesso a home page
    ${name}    FakerLibrary.Name
    Set Test Variable    ${nome_falso}    ${name}
    ${email}    FakerLibrary.Email
    Verifica e inserir texto    ${home.campo_name}    ${name}    msge_error=Erro ao tentar inserir o texto no campo nome
    Verifica e inserir texto    ${home.campo_email}    ${email}    msge_error=Erro ao tentar inserir o texto no campo de email
    Verifica e clica no botao    ${home.botao}    evidencia?=${False}    msge_error=Erro ao interagir com o botao "signUp"

acesso a home page
    Abrir navegador chrome
    Acessar Web-site    ${WEB_SITE.AUTOMCAO.URL}

acesso o menu de contato
    Verifica e clica no elemento    ${home.menu_contact_us}    msge_error=Erro ao tentar clicar no menu Contact Us