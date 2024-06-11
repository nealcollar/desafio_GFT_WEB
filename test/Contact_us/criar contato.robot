*** Settings ***
Resource         ${ROOT}/resource/main.robot
Resource         ${ROOT}/resource/pages/actions/keywords/contact_us/contact_us.resource
Resource         ${ROOT}/resource/pages/actions/keywords/home/home.resource
Test Teardown    Fechar navegador


*** Test Cases ***
Criar um contato com pelo contact us
    [Tags]    1
    Dado que  acesso a home page
    Quando    acesso a pagina contact us e preencho o formulario
    Entao     valido que meu contato foi enviado com sucesso

*** Keywords ***
acesso a pagina contact us e preencho o formulario
    acesso o menu de contato
    preenchendo formulario contact us