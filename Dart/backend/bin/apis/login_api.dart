import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/security/security_service.dart';
import 'api.dart';
import '../to/auth_to.dart';
import '../services/login_service.dart';

class LoginApi extends Api {
  final SecurityService _securityService;
  final LoginService _loginService;
  LoginApi(this._securityService, this._loginService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool needAuth = false}) {
    Router router = Router();

    router.post("/login", (Request req) async {
      var body = await req.readAsString();
      var authTO = AuthTO.fromRequest(body);

      var userID = await _loginService.authenticate(authTO);

      if (userID > 0) {
        var jwt = await _securityService.generateJWT(userID.toString());
        return Response(200, body: jsonEncode({'token': jwt}));
      } else {
        return Response(401, body: "Usuario não autenticado");
      }
    });

    return createHandler(
      router: router.call,
      needAuth: needAuth,
      middlewares: middlewares,
    );
  }
}
