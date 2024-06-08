*** Settings ***
Resource    ${ROOT}/resource/main.robot

*** Variables ***
${regex_white_space}    \\s
${regex_pattern_modulo}    (?<=Test\\.)[^.]+
${regex_suite_name}    .+[$.]
${caracter_subistituido}    _
${msg_error_dir}    nao foi possivel criar a pasta para salvar a evidencia os teste

*** Keywords ***
Salvando imagem de evidencia
    TRY
        ${modulo}    Pegando nome do modulo
        ${suite}     Pegando nome da Suite
        ${test}      Replace String Using Regexp    ${TEST NAME}    ${regex_white_space}    ${caracter_subistituido}
        ${time_evidencia}    Get Current Date    result_format=%Y_%m_%d__%H_%M_%S_%f
        Set Screenshot Directory       ${OUTPUT DIR}/${modulo}/${suite}/${test}
        Capture Page Screenshot        ${time_evidencia}.png
    EXCEPT     AS     ${system_error}
        Criar mensagem de erro    ${EMPTY}    ${system_error}    ${msg_error_dir}
    END

Pegando nome do modulo
    ${lista_modulo}    Get Regexp Matches  ${SUITE NAME}  ${regex_pattern_modulo}
    ${modulo}          Replace String Using Regexp    ${lista_modulo}[0]    ${regex_white_space}    ${caracter_subistituido}
    RETURN    ${modulo}

Pegando nome da Suite
    ${somente_suite_name}    Remove String Using Regexp    ${SUITE NAME}    ${regex_suite_name}
    ${suite}    Replace String Using Regexp    ${somente_suite_name}    ${regex_white_space}    ${caracter_subistituido}
    RETURN    ${suite}