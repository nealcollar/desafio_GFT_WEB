*** Variables ***
&{signup_form}    formulario_de_login=css:.login-form
...               campos_requeridos=css:.required
...               campo_senha=css:.login-form [type="password"]
...               campo_primeiro_nome=css:.login-form [name="first_name"]
...               campo_sobrenome=css:.login-form [name="last_name"]
...               campo_endereco=css:.login-form [name="address1"]
...               campo_estado=css:.login-form [name="state"]
...               campo_cidade=css:.login-form [name="city"]
...               campo_cep=css:.login-form [name="zipcode"]
...               campo_celular=css:.login-form [name="mobile_number"]
...               campo_pais=id:country
...               botao=css:.login-form button


&{opcao_paises}    canada=css:#country option[value="Canada"]

&{usuario_criado}    msg_sucesso=css:h2[data-qa='account-created']