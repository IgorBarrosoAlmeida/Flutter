import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';
import 'apis/login_api.dart';
import 'apis/noticias_api.dart';
import 'utils/custom_env.dart';
import 'infra/middleware_interception.dart';
import 'infra/dependency_injector/injects.dart';
import 'apis/user_api.dart';

void main() async {
  final di = Injects.initialize();

  // adiciona multiplos handlers
  var cascadeHandler = Cascade()
      .add(di<LoginApi>().getHandler())
      .add(di<NoticiasApi>().getHandler(needAuth: true))
      .add(di<UserApi>().getHandler(needAuth: true))
      .handler;

  var handlers = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      //.addMiddleware(securityService.authorization) --> eram globais
      //.addMiddleware(securityService.verityJwt)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handlers,
    address: await CustomEnv.get<String>(key: "server_address"),
    port: await CustomEnv.get<int>(key: "server_port"),
  );
}
