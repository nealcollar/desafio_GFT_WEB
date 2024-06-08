# Desafio GFT WEB

Projeto destinado à criação das automações de WEB que o __Desafio da GFT__ utiliza para avaliar seus candidatos.

Neste documento falaremos sobre o projeto como um todo, desde as arquiteturas que temos até as configurações iniciais para rodar o projeto na sua máquina.

1. Instalações necessárias:
    * Python 3.11 - https://www.python.org/downloads/
    * Poetry - https://python-poetry.org/docs/#installing-with-the-official-installer
    * Visual Studio Code - https://code.visualstudio.com/download
    * Git - https://git-scm.com/downloads
    * ChromeDriver - https://googlechromelabs.github.io/chrome-for-testing/#stable


    1.1 Instalação do Python 3.11:
    * __Baixe o Python 3.11:__ Acesse o site oficial do Python (https://www.python.org/downloads/) e clique na versão mais recente do Python 3.11 para Windows. Escolha o instalador apropriado para a arquitetura do seu sistema (32-bit ou 64-bit).

    * __Execute o Instalador:__ Após o download, execute o arquivo do instalador. Marque a opção "Add Python 3.11 to PATH" durante o processo de instalação para que o Python seja configurado no ambiente.

    * __Conclua a Instalação:__ Siga as instruções do instalador e aguarde até que a instalação seja concluída.

    * __Verifique a Instalação:__ Abra o prompt de comando (pressione Win + R, digite cmd e pressione Enter) e digite python --version para verificar se o Python 3.11 foi instalado corretamente.

        ```
        python --version
        ```


    1.2  Insstalação do Poetry:
    *  __Executar o comando no powersherl__: abra o Powershell e execute essa linha de codigo:
        ```
        (Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -
        ```
    * Apos executar o programa ele vai te dar no final do log da execução um comando para configurar a variavel de ambiente.
    * Verifique se ocorreu tudo bem executando a seguinte linha de comando:
        ```
        poetry
        ```
        **OBS:** Ele deve retornar a lista de comandos que o poetry pode executar em caso de sucesso.


    1.3 Instalação do Visual Studio Code:
    * __Baixe o Instalador:__ Acesse o site oficial do Visual Studio Code em (https://code.visualstudio.com/download) clique no botão de download para Windows. Isso irá baixar o instalador do Visual Studio Code para o seu computador.

    * __Execute o Instalador:__ Uma vez baixado, clique duas vezes no arquivo do instalador VSCodeSetup.exe para iniciar o processo de instalação.

    * __Conclua a Instalação:__ Após selecionar suas preferências, clique em "Next" (Próximo) ou "Install" (Instalar) para iniciar a instalação. Aguarde até que o processo seja concluído.

    * __Inicie o Visual Studio Code:__ Após a conclusão da instalação, você pode iniciar o VS Code a partir do menu Iniciar do Windows ou procurando por "Visual Studio Code" na barra de pesquisa.


    1.4 - Instalação do Git
    * __Baixe o Instalador:__ Acesse o site oficial do Git em https://git-scm.com/downloads e clique no botão de download para Windows. Isso iniciará o download do instalador do Git para o seu computador.

    * __Execute o Instalador:__ Após o download ser concluído, clique duas vezes no arquivo do instalador do Git para iniciar o processo de instalação.

    * __Selecione as Opções de Instalação:__ Durante a instalação, você pode escolher o diretório de instalação, componentes adicionais e opções de inicialização rápido.

    * __Escolha o Editor de Texto Padrão (Opcional):__ Durante a instalação, o Git pode solicitar que você escolha um editor de texto padrão para utilizar com o Git Bash. Você pode escolher o editor que preferir ou manter a opção padrão.

    * __Escolha o Terminal (Opcional):__ Durante a instalação, você pode optar por usar o Git a partir do Git Bash ou do prompt de comando do Windows. Escolha de acordo com suas preferências ou mantenha as configurações padrão.

    * __Conclua a Instalação:__ Após selecionar suas preferências, clique em "Next" (Próximo) e, em seguida, em "Install" (Instalar) para iniciar o processo de instalação. Aguarde até que a instalação seja concluída.

    * __Verifique a Instalação:__ Após a instalação, abra o prompt de comando e digite git --version para verificar se o Git foi instalado corretamente. Você deve ver a versão do Git sendo exibida.

        ```
        git --version 
        ```


    1.4 - Instalação do ChromeDriver
    * __Verifique a Versão do Google Chrome__ Abra o Chrome > Ajuda > Sobre o Google Chrome > Anote a versão.

    * __Baixe o Arquivo:__ Acesse https://googlechromelabs.github.io/chrome-for-testing/#stable e baixe o ChromeDriver compatível com sua versão do Chrome.

    * __Extrair o ChromeDriver:__ Extraia o arquivo ZIP baixado para uma pasta no C:\Windows.

    * __Verificar a Instalação:__ Abra o prompt de comando > Digite "chromedriver" > Verifique se exibe a versão do ChromeDriver.


2. Clonando projeto:

    * acessar gitlab: https://github.com/nealcollar/desafio_GFT_WEB


3. Configurando o projeto
    * Criando ambiente virtual
        * __Venv__ comando:
            ```
            python -m venv ./venv
            ```

          obs: após instalar você pode ativar a venv com comando

          cmd
          ~~~cmd
          .\venv-web\Scripts\activate.bat
          ~~~

          powershel
          ~~~powershell
           .\venv-web\Scripts\Activate.ps1 
           ~~~

    * Instalando Dependencias do projeto
        * Obs: comando deve ser rodado com a venv aberto
          __Poetry__ comando: 
            ``` 
            pip install poetry 
            ```

    * Configurando workespace para o __RobotCode__
    
      * Crie uma pasta na raiz do projeto como o nome  **.vscode**
      * Crie um arquvo com o nome **settings.jsson**
      * Com o arquivo settings.json aberto copie  o  codigo a baixo:

        Ex: 
        ```
        {
            "robotcode.robot.variables": {
                "ROOT": "PATH_ate_a_sua_pasta_do_projeto\\DESAFIO_GFT_WEB",
                "ENV": "LOCAL",
                "LOG_LEVEL": "TRACE"
            }
        }
        ```

4. Validando instalação
    * No Vs code com o projeto e venv abertos rodar o comando: 
        ```
        poetry run web
        ```

# Testar em ambiente Linux

### Para rodar em ambiente linux localemnte precisa seguir os seguintes passos:
   * Instalar o Docker Desktop, basta clicar no [link da pagina](https://www.docker.com/products/docker-desktop/).
   * Após instalar o Docker Desktop, basta iniciar ele.
   * Agora com o docker instalado abra um terminal dentro do diretorio do projeto `path_até_o_projeto/DESAFIO_GFT_WEB`
   * Com o terminal aberto no diretório do projeto digite o seguinte comando:
        ```
        docker build -t image-web .
        ```
   * Aguarde o build da imagem ser finalizado, após ele ser finalizado vá para o terminal e digite o seguinte comando:
        ````
        docker run -it -v %cd%/result_container:/web-automation/results image-web
        ````
   * Esse comando vai executar a o container em linux para rodar o projeto WEB e assim gerar um repot que vai ser exportado para a pasta
    `./result_container` no **diretório do seu projeto**.