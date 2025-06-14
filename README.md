# 🛠️ Servidor Minecraft Forge com Docker

Este projeto fornece um ambiente pronto para executar um **servidor Minecraft Forge** em um container Docker. Ideal para quem quer rodar um servidor modificado de Minecraft de forma prática, isolada e reprodutível.

---

## 🚀 Começando

### Pré-requisitos

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- Docker Desktop rodando como administrador (Windows)

---

## ⚙️ Instalação e Execução

Clone o repositório e navegue até a pasta:

```bash
git clone https://github.com/seu-usuario/seu-repo.git
cd seu-repo
```

### 1. Coloque os Mods

Adicione os arquivos `.jar` dos mods desejados na pasta `mods/`.

> 📌 Você pode criar a pasta `mods/` se ela ainda não existir.

### 2. Aceite o EULA

Crie um arquivo `eula.txt` com o seguinte conteúdo:

```txt
eula=true
```

### 3. Build e execução com Docker Compose

```bash
docker-compose build
docker-compose up
```

---

## 🧰 Alternativa: Executar manualmente

Se preferir rodar sem o `docker-compose`:

```bash
docker build -t forge-server .
docker run -p 25565:25565 -v "$(pwd)/mods:/minecraft/mods" forge-server
```

---

## 🌐 Conectando ao Servidor

Para jogar, é necessário saber o IP público do servidor:

- Acesse [https://meuip.com.br](https://meuip.com.br) ou
- Verifique via interface do roteador/localhost

---

## 📝 Arquivos Principais

### `Dockerfile`

Contém as instruções para criar a imagem Docker com Minecraft Forge.

### `start.sh`

Script de inicialização que busca o arquivo `.jar` Forge adequado e inicia o servidor.

### `docker-compose.yml`

Facilita a orquestração da imagem, volumes persistentes (mods, mundo, eula) e o mapeamento de porta.

---

## 📌 Dicas e Cuidados

1. **Mods**: Coloque os `.jar` na pasta `mods/` **antes** de dar o build da imagem.
2. **EULA**: O servidor **não inicia** se o arquivo `eula.txt` não contiver `eula=true`.
3. **Nome do Forge**: O script `start.sh` assume um padrão para o `.jar` do Forge. Se o nome mudar, edite o script adequadamente.
4. **Mundo persistente**: O volume `./world` garante que o mundo não será perdido entre execuções.

---

## ⚖️ Aviso Legal

Este projeto **não distribui** arquivos proprietários da Mojang/Microsoft ou do Minecraft Forge. Para usar este servidor, o usuário deve obter legalmente os arquivos necessários:

- O servidor Minecraft deve ser baixado em: [https://www.minecraft.net/en-us/download/server](https://www.minecraft.net/en-us/download/server)
- O instalador do Forge está disponível em: [https://files.minecraftforge.net](https://files.minecraftforge.net)

Este repositório contém **apenas scripts e arquivos de automação** que **não violam o EULA da Mojang** nem a **licença LGPL do Forge**.  
A execução do servidor requer a aceitação do [EULA oficial da Mojang](https://www.minecraft.net/eula).

> Este projeto é fornecido para fins educacionais e uso pessoal.  
> O uso comercial deste projeto deve seguir estritamente as [diretrizes de uso comercial da Mojang](https://www.minecraft.net/en-us/usage-guidelines).

---

## 📄 Licença

Distribuído sob a licença MIT. Veja `LICENSE` para mais informações.

---

## 🙌 Créditos

Inspirado em várias implementações da comunidade de servidores Forge com Docker.
