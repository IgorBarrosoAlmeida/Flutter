import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';
import 'apis/login_api.dart';
import 'apis/blog_api.dart';
import 'utils/custom_env.dart';
import 'infra/middleware_interception.dart';
import 'infra/dependency_injector/injects.dart';
import 'infra/database/db_configuration.dart';
import 'dao/user_dao.dart';
//import 'models/usuario_model.dart';

void main() async {
  final di = Injects.initialize();

  //var connection = await di.get<DbConfiguration>().connection;
  UserDAO userDAO = UserDAO(di<DbConfiguration>());

  /*
  var newUser = UsuarioModel()
    ..name = "XPTO"
    ..email = "xpto@gmail.com"
    ..password = "123";
  userDAO.create(newUser);
  */

  /*
  var updateUser = UsuarioModel()
    ..id = 3
    ..name = "Vitoria"
    ..email = "xpto@gmail.com"
    ..password = "123";

  await userDAO.update(updateUser);
  */

  await userDAO.delete(3);
  (await userDAO.readAll()).forEach(print);

  // adiciona multiplos handlers
  var cascadeHandler = Cascade()
      .add(di<LoginApi>().getHandler())
      .add(di<BlogApi>().getHandler(needAuth: true))
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
