import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';
import 'apis/login_api.dart';
import 'apis/blog_api.dart';
import 'utils/custom_env.dart';
import 'services/noticia_service.dart';
import 'infra/middleware_interception.dart';

void main() async {
  // adiciona multiplos handlers
  var cascadeHandler = Cascade()
      .add(LoginApi().handler)
      .add(BlogApi(NoticiaService()).handler)
      .handler;

  // fornece um log das chamadas a API
  var handlers = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handlers,
    address: await CustomEnv.get<String>(key: "server_address"),
    port: await CustomEnv.get<int>(key: "server_port"),
  );
}
