import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class BlogApi {
  Handler get handler {
    Router router = Router();

    router.get(
      '/blog/noticias',
      (Request req) => Response(200, body: "choveu hoje"),
    );

    return router.call;
  }
}
