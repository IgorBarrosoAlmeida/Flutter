import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/generic_service.dart';
import '../models/noticia_model.dart';
import 'api.dart';

class NoticiasApi extends Api {
  final GenericService<NoticiaModel> _service;

  NoticiasApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool needAuth = false}) {
    Router router = Router();

    // listagem das noticias
    router.get('/noticias', (Request req) async {
      List<NoticiaModel> noticias = await _service.findAll();
      List<Map> noticiasMap = noticias.map((e) => e.toJson()).toList();

      return Response(200, body: jsonEncode(noticiasMap));
    });

    // Busca por uma noticia pelo id
    router.get('/noticia', (Request req) async {
      String? id = req.url.queryParameters["id"];

      if (id == null) return Response(400, body: "Noticia não informada");

      var noticia = await _service.findOne(int.parse(id));
      if (noticia == null) return Response(404, body: "Noticia não encontrada");

      return Response(200, body: jsonEncode(noticia.toJson()));
    });

    // novas noticias
    router.post('/noticias', (Request req) async {
      String body = await req.readAsString();

      var result = await _service.save(
        NoticiaModel.fromRequest(jsonDecode(body)),
      );

      return result
          ? Response(201, body: "Noticia criada")
          : Response(500, body: "Não foi possivel criar a noticia");
    });

    // /noticias?id=1 // edição de noticias
    router.put('/noticias', (Request req) async {
      String body = await req.readAsString();

      var result = await _service.save(
        NoticiaModel.fromRequest(jsonDecode(body)),
      );

      return result
          ? Response(200, body: "Noticia atualizada")
          : Response(500, body: "Não foi possivel atualizar a noticia");
    });

    // /noticias?id=1 // deleção de noticias
    router.delete('/noticias', (Request req) async {
      String? id = req.url.queryParameters["id"];

      if (id == null) return Response(400, body: "Noticia não encontrada");
      var result = await _service.delete(int.parse(id));

      //_service.delete(1);
      return result
          ? Response(200, body: "noticia $id deletada")
          : Response(500, body: "Não foi possivel deletar");
    });

    return createHandler(
      router: router.call,
      needAuth: needAuth,
      middlewares: middlewares,
    );
  }
}
