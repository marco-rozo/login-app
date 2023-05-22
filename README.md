# login_app

Projeto flutter com exemplo de autenticação.
- GetX com gerenciador de estado
- GetConnect para requisições http
- GetStorage para salvar key-value na memoria


## Getting Started

install
```
$ flutter pub get
```

run 
```
$ flutter run
```

run in release mode
```
$ flutter run --release
```

### Obs
Para realizar a autenticação estou utilizando uma API que pode ser acessada  <a href="https://github.com/marco-rozo/api-express-example">aqui</a>.

Como é uma API simulada o login pode ser feito usando

- email: marco123@gmail.com
- senha: marco123

ou pode verificar a lista de usuários <a href="https://github.com/marco-rozo/api-express-example/blob/master/src/data/users.ts">aqui</a>.

# 
A baseUrl para conexão com a API é definida em 
```lib\app\data\providers\api\rest_client.dart```

Para teste no emulador e api local (localhost) deixo o padrão de ```10.0.2.2:PORTA_DA_APLICAÇÃO_BACKEND``` no meu caso a porta é 3000 ficando:

```
http://10.0.2.2:3000/
```