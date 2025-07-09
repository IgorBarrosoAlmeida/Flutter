import 'package:shelf/shelf.dart';

// faz o formato json ser o padrão de "content-type"
class MiddlewareInterception {
  Middleware get middleware {
    return createMiddleware(
      responseHandler: (Response res) {
        return res.change(headers: {'content-type': 'aplication/json'});
      },
    );
  }
}
