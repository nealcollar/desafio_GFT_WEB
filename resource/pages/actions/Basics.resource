*** Settings ***
Resource    ${ROOT}/resource/main.robot

*** Variables ***
${pipe_chrome_options}     add_argument("--incognito"); 
...                        add_experimental_option("excludeSwitches", ["enable-logging"]);
...                        add_argument("--no-sandbox");add_argument("---disable-gpu");
...                        add_argument("--headless"); add_argument("--disable-dev-shm-usage")
${local_chrome_options}    add_argument("--incognito"); 
...                        add_experimental_option("excludeSwitches", ["enable-logging"]);

*** Keywords ***
Abrir navegador chrome
    [Documentation]    Keyword responsavel por abrir o navegador definido
    IF  '${ENV}'=='PIPE'
        ${chrome_options}    Set Variable    ${pipe_chrome_options}
    ELSE
        ${chrome_options}    Set Variable    ${local_chrome_options}
    END
    Open Browser    browser=chrome    options=${chrome_options}
    Set Window Position    -8     -8
    Set Window Size        1920    1080

Fechar navegador
    [Documentation]    Keyword responsavel por finalizar o navegador
    Close Browser

Acessar Web-site
    [Documentation]    esta keyword e responsavel por acessar SkOm
    [Arguments]    ${url}
    Go To    ${url}

Validar lista de elementos web
    [Documentation]    Keyword responsavel por realizar validacoes em listas
    ...                para utilizar deve passar uma lista como parametro de
    ...                comparacao
    [Arguments]    ${elements}    ${validations}
    ${cont}    Set Variable    0
    FOR  ${element}  IN  @{elements}
         ${element_text}    Get Text    ${element}
         Should Be Equal    ${element_text}    ${validations}[${cont}]
         ${cont}    Evaluate    ${cont} + 1
    END

Colorir elemento
    [Documentation]    Keyword responsavel por colorir webelement com JS
    [Arguments]    ${locator}
    ${elemento}    Get WebElement    ${locator}
    Execute Javascript    arguments[0].setAttribute('style', 'background: yellow; border: 2px solid red')   ARGUMENTS    ${elemento}

Descolorir elemento
    [Documentation]    Keyword responsavel por descolorir webelement com JS
    [Arguments]    ${locator}
    ${elemento}    Get WebElement    ${locator}
    Execute Javascript    arguments[0].setAttribute('style', 'background: default; border: 2px default')    ARGUMENTS    ${elemento}

Evidenciar elemento
    [Documentation]   Keyword responsavel executar a verificacao dos elementos bem como verificar rotinar de telas como:
    ...               aguardar carregamento por completo da pagina, verificar se o elemento está disponivel/visivel na tela,
    ...               evidenciar o elemento com uma coloracao, salvar uma imagem deste elemento evidenciado e 
    ...               alertar no terminal algum erro encontrado identificando o elemento em que houve essa "quebra".
    [Arguments]    ${elemento}    ${msge_error}=${EMPTY}    ${texto}=${EMPTY}    ${scroll?}=${False}
        TRY
            Wait For Condition	    return document.readyState == "complete"
            Wait Until Element Is Visible    ${elemento}
            ${web_elemento}    Get WebElement    ${elemento}
            Run Keyword If    ${scroll?}    Scroll Element Into View    ${web_elemento}
            Colorir elemento    ${web_elemento}
            Wait Until Page Contains Element      css:*[style*="background: yellow; border: 2px solid red"]
            Salvando imagem de evidencia
            Descolorir elemento    ${web_elemento}
        EXCEPT    AS    ${erro_sistema}
            Criar mensagem de erro    ${elemento}    ${erro_sistema}    ${msge_error}
        END
        IF  '${texto}' != '${EMPTY}'
            Textfield Value Should Be    ${elemento}    ${texto}
        END

Verifica e clica no botao
    [Documentation]    Keyword responsavel por realizar clicar no elemento e verificar se ele esta ativo, caso negativo
    ...                sera apresentado no logo com coloracao diferenciada.
    [Arguments]    ${elemento}    ${evidencia?}=${True}    ${scroll?}=${False}    ${msge_error}=${EMPTY}
    Evidenciar elemento    ${elemento}    ${msge_error}    scroll?=${scroll?}
    Click Button    ${elemento}
    Run Keyword If    ${evidencia?}    Evidenciar elemento    ${elemento}    ${msge_error}

Verifica e clica no elemento
    [Documentation]    Keyword responsavel por realizar clicar no elemento e verificar se ele esta ativo, caso negativo
    ...                sera apresentado no logo com coloracao diferenciada.
    [Arguments]    ${elemento}    ${evidencia?}=${True}    ${scroll?}=${False}    ${msge_error}=${EMPTY}
    Evidenciar elemento    ${elemento}    ${msge_error}    scroll?=${scroll?}
    Click Element    ${elemento}
    Run Keyword If    ${evidencia?}    Evidenciar elemento    ${elemento}    ${msge_error}

Verifica e inserir texto
    [Documentation]    Keyword responsavel por inserir texto e verificar se seu preenchimento foi conluido com sucesso, caso negativo
    ...                sera apresentado no logo com coloracao diferenciada.
    [Arguments]    ${elemento}   ${texto}    ${evidencia?}=${True}    ${scroll?}=${False}   ${msge_error}=${EMPTY}
    Evidenciar elemento    ${elemento}    ${msge_error}    scroll?=${scroll?}
    Input Text    ${elemento}    ${texto}
    Run Keyword If    ${evidencia?}    Evidenciar elemento    ${elemento}    ${msge_error}

Verifica e inserir senha
    [Documentation]    Keyword responsavel por inserir senha e verificar se seu preenchimento foi conluido com sucesso, caso negativo
    ...                sera apresentado no logo com coloracao diferenciada.
    [Arguments]    ${elemento}    ${texto}    ${evidencia?}=${True}    ${scroll?}=${False}    ${msge_error}=${EMPTY}
    Evidenciar elemento    ${elemento}    ${msge_error}    scroll?=${scroll?}
    Input Password    ${elemento}    ${texto}
    Run Keyword If    ${evidencia?}    Evidenciar elemento    ${elemento}    ${msge_error}

Verifica, atualiza a pagina
    [Documentation]    Keyword responsavel por atualiza o navegador e validar se a pagina foi carregada corretamente, em caso negativo
    ...                sera apresentado uma mensagem de erro ao usuario.
    [Arguments]    ${elemento}    ${evidencia?}=${True}    ${msge_error}=${EMPTY}
    Reload Page
    Evidenciar elemento    ${elemento}    ${msge_error}
    Run Keyword If    ${evidencia?}    Evidenciar elemento    ${elemento}    ${msge_error}