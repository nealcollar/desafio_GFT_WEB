FROM python:3.11-slim

ENV LOG_LEVEL=trace
ENV SET_ENV=PIPE

# Instalar dependências do sistema
RUN apt-get update && \
    apt-get install -y wget gnupg curl --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Adicionar chave e repositório do Google Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Instalar Google Chrome para pegar dependencias
RUN apt-get update && \
    apt-get install -y --no-install-recommends google-chrome-stable && \
    apt-get remove --yes google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instalar nvm e Node.js LTS
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Configurar NVM e instalar Node.js LTS
ENV NVM_DIR /root/.nvm
RUN . "$NVM_DIR/nvm.sh" && \
    nvm install --lts

# Instalar Puppeteer e ChromeDriver
RUN . "$NVM_DIR/nvm.sh" && \
    npm install -g @puppeteer/browsers && \
    npx @puppeteer/browsers install chrome@stable && \
    npx @puppeteer/browsers install chromedriver@stable

#Instalar poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /web-automation

#Separando quais arquivos preciso copiar
COPY resource /web-automation/resource
COPY test /web-automation/test
COPY pyproject.toml /web-automation/
COPY run_tests.py /web-automation/

RUN poetry install

CMD ["poetry", "run", "web"]