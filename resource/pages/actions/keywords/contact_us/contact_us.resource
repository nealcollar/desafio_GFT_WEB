*** Settings ***
Resource     ${ROOT}/resource/main.robot
Resource     ${ROOT}/resource/pages/objects/contact_us/contact_us_objects.resource



*** Keywords ***
preenchendo formulario contact us
    ${nome}    FakerLibrary.Name
    Verifica e inserir texto    ${contact_us.name}    ${nome}    msge_error=Erro ao tentar colocar o texto no input name
    ${email}    FakerLibrary.Email
    Verifica e inserir texto    ${contact_us.email}    ${email}    msge_error=Erro ao tentar colocar o texto no input email
    ${subject}    FakerLibrary.Word
    Verifica e inserir texto    ${contact_us.subject}    ${subject}    msge_error=Erro ao tentar colocar o texto no input subject
    ${message}    FakerLibrary.Texts
    Verifica e inserir texto    ${contact_us.message}    ${message}    msge_error=Erro ao tentar colocar o texto no input message
    Verifica e clica no botao    ${contact_us.submit}    evidencia?=${False}    msge_error=Erro ao tentar clicar no botao submit#
    Alert Should Be Present

valido que meu contato foi enviado com sucesso
    Evidenciar elemento    ${contact_us.alert_success}    msge_error=Erro ao validar que o contato foi realizado com sucesso