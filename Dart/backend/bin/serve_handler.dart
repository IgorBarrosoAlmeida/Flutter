import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();

    router.get("/", (Request req) {
      return Response(200, body: "Primeira rota");
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

    return router;
  }
}
