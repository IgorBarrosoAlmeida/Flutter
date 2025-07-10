import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';
import 'apis/login_api.dart';
import 'apis/blog_api.dart';
import 'utils/custom_env.dart';
import 'services/noticia_service.dart';
import 'infra/middleware_interception.dart';
import 'infra/security/security_service_imp.dart';
import 'infra/security/security_service.dart';

void main() async {
  SecurityService _securityService = SecurityServiceImp();
  // adiciona multiplos handlers
  var cascadeHandler = Cascade()
      .add(LoginApi(_securityService).getHandler())
      .add(
        BlogApi(NoticiaService()).getHandler(
          middlewares: [
            _securityService.authorization,
            _securityService.verityJwt,
          ],
        ),
      )
      .handler;

  var handlers = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      //.addMiddleware(_securityService.authorization) --> eram globais
      //.addMiddleware(_securityService.verityJwt)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handlers,
    address: await CustomEnv.get<String>(key: "server_address"),
    port: await CustomEnv.get<int>(key: "server_port"),
  );
}
