import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';
import 'api/login_api.dart';
import 'api/blog_api.dart';

void main() async {
  // adiciona multiplos handlers
  var cascadeHandler = Cascade()
      .add(LoginApi().handler)
      .add(BlogApi().handler)
      .handler;

  // fornece um log das chamadas a API
  var handlers = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(cascadeHandler);

  await CustomServer().initialize(handlers);
}
