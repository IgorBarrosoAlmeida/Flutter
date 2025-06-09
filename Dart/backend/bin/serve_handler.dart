import 'dart:convert';
import 'dart:isolate';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();

    router.get("/", (Request req) {
      return Response(
        200,
        body: "<h1>Primeira rota</h1>",
        headers: {'content-type': 'text/html'}, // Content type MIME
      );
    });

    // get com router params
    router.get("/ola/mundo/<user>", (Request req, String user) {
      return Response(200, body: "Ola mundo! $user");
    });

    // get com query params
    router.get("/query", (Request req) {
      String? nome = req.url.queryParameters["nome"];
      String? idade = req.url.queryParameters["idade"];
      return Response(200, body: "Nome: $nome, Idade: $idade");
    });

    // post
    router.post("/login", (Request req) async {
      String res = await req.readAsString();

      Map json = jsonDecode(res);
      if (json["login"] == "admin" && json["senha"] == "123") {
        return Response(200, body: "Bem vindo admin");
      } else {
        return Response(403, body: "Acesso negado");
      }
    });

    return router;
  }
}
