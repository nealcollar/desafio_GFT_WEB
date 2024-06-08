*** Settings ***
#BIBLIOTECAS
Library    SeleniumLibrary    run_on_failure=None    timeout=0:01:00
Library    OperatingSystem
Library    DateTime
Library    Collections
Library    String
Library    FakerLibrary

#Gherking configs
Resource    ${ROOT}/resource/gherkin_pt_br.resource

#VARIAVEIS YAML
Variables    ${ROOT}/resource/data/data_config_web_test.yaml

#LOGS
Resource    ${ROOT}/resource/log/console_log.resource
Resource    ${ROOT}/resource/log/evidencias.resource

#PAGE - ACTIONS + BASICS(KEYWORDS DE TESTES)
Resource    ${ROOT}/resource/pages/actions/Basics.resource