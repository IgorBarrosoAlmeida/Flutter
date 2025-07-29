import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/generic_service.dart';
import '../models/noticia_model.dart';
import 'api.dart';

class BlogApi extends Api {
  final GenericService<NoticiaModel> _service;

  BlogApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool needAuth = false}) {
    Router router = Router();

    // listagem das noticias
    router.get('/blog/noticias', (Request req) {
      List<NoticiaModel> noticias = _service.findAll();
      List<Map> noticiasMap = noticias.map((e) => e.toJson()).toList();

      return Response(200, body: jsonEncode(noticiasMap));
    });

    // novas noticias
    router.post('/blog/noticias', (Request req) async {
      String body = await req.readAsString();

      _service.save(NoticiaModel.fromJson(jsonDecode(body)));

      return Response(201);
    });

    // /blog/noticias?id=1 // edição de noticias
    router.put('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters["id"];

      //_service.save("");

      return Response(200, body: "noticia $id atualizada");
    });

    // /blog/noticias?id=1 // deleção de noticias
    router.delete('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters["id"];

      //_service.delete();

      return Response(200, body: "noticia $id deletada");
    });

    return createHandler(
      router: router.call,
      needAuth: needAuth,
      middlewares: middlewares,
    );
  }
}
