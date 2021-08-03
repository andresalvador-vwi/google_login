# googlelogin

Aplicativo para validar o login com o Google.

## Instruções

Se você pretende testar usando apenas Android, ou não está testando num computador com MacOS, pule as instruções referentes ao iOS. Lembrando que os passos para Android são obrigatórios.

1. Criar o projeto no Firebase e adicionar os apps Android e iOS
2. Baixar o `google-services.json` (Android) e o `GoogleService-Info.plist` (iOS)
    - Colocar o `google-services.json` no caminho `android/app/google-services.json`
    - Usar o Xcode para colocar o `GoogleService-Info.plist` no caminho `ios/Runner/GoogleService-Info.plist` (é importante que o arquivo seja colocado via Xcode pois o mesmo registra o arquivo no projeto, o que não acontece se ele for colocado diretamente na pasta)
    - Para abrir o projeto no Xcode, na interface do aplicativo, selecione "Arquivo" > "Abrir", e selecione o arquivo no caminho `ios/Runner.xcworkspace`
3. Para o iOS, depois de copiar o `GoogleService-Info.plist` com o Xcode, abra este arquivo no Xcode e procure pela chave `REVERSED_CLIENT_ID`
    - Copie o valor dessa chave
    - Selecione o arquivo principal do projeto ("Runner") no topo da barra lateral esquerda da interface do Xcode
    - Na barra lateral interna, na seção "Targets", selecione o target "Runner"
    - Na view principal, do meio, selecione a aba "Info"
    - Expanda o grupo "URL types" e clique no botão "+" para adicionar uma nova
    - Preencha apenas o compo "URL Schemes" com o valor copiado de `REVERSED_CLIENT_ID`
4. Copiar o arquivo `.env.dist` com o nome `.env`
5. Colocar a url do backend na chave `API_URL` do .env
   - Ex.: `API_URL=http://localhost` ou `API_URL=http://192.168.0.101`
   - Se você for testar com iOS, localhost deve funcionar para apontar para a máquina que está rodando o simulador. Já no **Android**, localhost irá apontar para o próprio simulador, os simuladores do AndroidStudio usam `10.0.2.2` para apontar para a máquina hospedeira
6. Atualizar as dependências do projeto com `flutter pub get`
7. Atualizar as dependências do iOS
    - `cd ios`
    - `pod install`
    - `cd ..`
8. Rodar o aplicativo com `flutter run`
