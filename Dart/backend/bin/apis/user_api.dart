import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/user_service.dart';
import '../models/user_model.dart';
import 'api.dart';

class UserApi extends Api {
  final UserService _userService;

  UserApi(this._userService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool needAuth = false}) {
    final router = Router();

    router.post('/user', (Request req) async {
      var body = await req.readAsString();
      if (body.isEmpty) {
        return Response(400, body: "O usuario não foi informado");
      }

      var user = UserModel.fromRequest(jsonDecode(body));

      bool result = await _userService.save(user);
      return result
          ? Response(201, body: "usuario criado")
          : Response(500, body: "Usuario não encontrado");
    });

    return createHandler(
      router: router.call,
      needAuth: needAuth,
      middlewares: middlewares,
    );
  }
}
