*** Settings ***
Resource     ${ROOT}/resource/main.robot
Resource     ${ROOT}/resource/pages/objects/signup/signup_objects.resource
Variables    ${ROOT}/resource/data/sigup/formulario_de_novo_usruario.yaml

*** Variables ***
${quantidade_de_ocorrencias}
${msg_erro_formulario}    Formulario de login nao foi encontrado
${msg_erro_qtd_campos_requeridos}    Numero de campos obrigatorios esta difente do esperado

*** Keywords ***
esta na pagina de SignUp
    Evidenciar elemento    ${signup_form.formulario_de_login}    ${msg_erro_formulario}

conta numero de campos requeridos
    ${lista_de_elementos}    Get WebElements    ${signup_form.campos_requeridos}
    ${quantidade_de_ocorrencias}    Get Length    ${lista_de_elementos}
    Set Test Variable    ${quantidade_de_ocorrencias}    ${quantidade_de_ocorrencias}

valido que a quantidade de campos requeridos
    Should Be Equal As Integers    ${quantidade_de_ocorrencias}    ${SIGNUP.FILD_REQUIRED}    ${msg_erro_qtd_campos_requeridos}

preencho todos os dados obrigatorios
    @{name}    Split String    ${nome_falso}

    ${pasword}    FakerLibrary.Password
    Verifica e inserir senha    ${signup_form.campo_senha}    ${pasword}    msge_error=Erro ao inserir a senha no campo

    Press Keys    NONE    PAGE_DOWN
    Verifica e inserir texto    ${signup_form.campo_primeiro_nome}    ${name}[0]    msge_error=Erro ao inserir o primeiro nome no campo    
    Verifica e inserir texto    ${signup_form.campo_sobrenome}    ${name}[1]  msge_error=Erro ao inserir o sobrenome no campo    

    ${endereco}    FakerLibrary.Address
    Verifica e inserir texto    ${signup_form.campo_endereco}    ${endereco}  msge_error=Erro ao inserir o endereco no campo    

    Verifica e clica no elemento    ${signup_form.campo_pais}    scroll?=${True}
    Verifica e clica no elemento    ${opcao_paises.canada}

    ${estado}    FakerLibrary.State
    Verifica e inserir texto    ${signup_form.campo_estado}    ${estado}  msge_error=Erro ao inserir o estado no campo    scroll?=${True}

    ${cidade}    FakerLibrary.City
    Verifica e inserir texto    ${signup_form.campo_cidade}    ${cidade}  msge_error=Erro ao inserir o cidade no campo    scroll?=${True}

    ${cep}    FakerLibrary.Zipcode
    Verifica e inserir texto    ${signup_form.campo_cep}    ${cep}  msge_error=Erro ao inserir o cep no campo    scroll?=${True}

    ${celular}    FakerLibrary.Phone Number
    Verifica e inserir texto    ${signup_form.campo_celular}    ${celular}  msge_error=Erro ao inserir o celular no campo    scroll?=${True}

    Press Keys    NONE    PAGE_DOWN
    Verifica e clica no botao    ${signup_form.botao}    scroll?={True}    msge_error=Erro ao clicar no botao subimit    evidencia?=${False}

valido que o usuario foi criado com sucesso
    Evidenciar elemento    ${usuario_criado.msg_sucesso}    msge_error=Usuario nao foi criado com sucesso