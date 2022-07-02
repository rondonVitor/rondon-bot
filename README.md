# RondonBot

Simples bot de discord que toca musicas do youtube, spotify e soundcloud feito em dart.

<hr />

## Nyxx packages

Pacotes usados para a construção do bot

- [nyxx](https://github.com/nyxx-discord/nyxx)
- [nyxx_commander](https://github.com/nyxx-discord/nyxx_commander)
- [nyxx_lavalink](https://github.com/nyxx-discord/nyxx_lavalink)

## Como criar um bot

 - Crie seu bot em [discord-applications](https://discord.com/developers/applications)
 - Para configurar e adicionar o seu bot no servidor só seguir a documentação do próprio discord [doc](https://discord.com/developers/docs/getting-started#configuring-a-bot)


## Configuração

O bot requer que as variáveis ​​de ambiente sejam definidas antes de iniciar:
 - `ROD_PREFIX` - prefixo para os comandos
 - `ROD_TOKEN` - token do bot
 - `ROD_INTENT_FEATURES_ENABLE`: Um bool (`true` ou `false`) indicando se os recursos que exigem intenções privilegiadas devem ser ativados, ou seja, `GUILD_MESSAGES` e `GUILD_MEMBERS`.
 - `ROD_ADMIN_IDS`: Os IDs separados por espaço (snowflakes) dos usuários que podem usar comandos do administrador.
 - `LAVALINK_ADDRESS` (opcional, padrão `lavalink`): O endereço do servidor lavalink ao qual se conectar.
 - `LAVALINK_PORT` (opcional, padrão `2333`): A porta a ser usada para conectar ao servidor lavalink.
 - `LAVALINK_PASSWORD` (opcional, padrão `youshallnotpass`): A senha a ser usada ao conectar ao servidor lavalink.
 - `LAVALINK_USE_SSL` (opcional, padrão `false`): Se deve ou não usar ssl para conectar ao servidor lavalink.


### Como rodar

1. Defina todas as variáveis ​​de ambiente acima em um arquivo `.env` na raiz do projeto.
2. Execute `dart pub get` para instalar dependências
3. Execute `dart run nyxx_commands:compile -o bot.dart` para gerar um executável.
4. Execute o arquivo `bot.exe` criado.

### Com o Docker

1. Defina todas as variáveis ​​de ambiente acima em um arquivo `.env` na raiz do projeto.
2. Crie um arquivo `lavalink.yml` contendo uma [configuração do Lavalink] válida (https://github.com/freyacodes/Lavalink/blob/master/LavalinkServer/application.yml.example). Certifique-se de que a porta e a senha correspondam à variável de ambiente associada.
3. Execute `docker-compose up` para executar o bot. Se você quiser executar o bot com métricas, adicione a opção `-f docker-compose.prod.yaml`.
