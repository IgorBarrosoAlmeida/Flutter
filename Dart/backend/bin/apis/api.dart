import 'package:shelf/shelf.dart';

import '../infra/dependency_injector/dependency_injector.dart';
import '../infra/security/security_service.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlewares, bool needAuth = false});
  Handler createHandler({
    required Handler router,
    bool needAuth = false,
    List<Middleware>? middlewares,
  }) {
    middlewares ??= [];
    var pipeline = Pipeline();
    if (needAuth) {
      var securityService = DependencyInjector().get<SecurityService>();
      middlewares.addAll([
        securityService.authorization,
        securityService.verityJwt,
      ]);
    }

    for (var m in middlewares) {
      pipeline = pipeline.addMiddleware(m);
    }

    return pipeline.addHandler(router);
  }
}
