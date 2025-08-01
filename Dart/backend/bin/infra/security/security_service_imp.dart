import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import 'security_service.dart';
import '../../utils/custom_env.dart';

class SecurityServiceImp implements SecurityService {
  @override
  Future<String> generateJWT(String userID) async {
    var jwt = JWT({
      // claims do JWT
      'iat': DateTime.now().millisecondsSinceEpoch,
      'userID': userID,
      'roles': ['admin', 'user'],
    });

    String key = await CustomEnv.get(key: "jwt_key");
    String token = jwt.sign(SecretKey(key));

    return token;
  }

  @override
  Future<JWT?> validateJWT(String token) async {
    String key = await CustomEnv.get(key: "jwt_key");

    try {
      return JWT.verify(token, SecretKey(key));
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Middleware get authorization {
    return (Handler handler) {
      return (Request req) async {
        String? authorizationHeader = req.headers["Authorization"];
        JWT? jwt;
        if (authorizationHeader != null) {
          if (authorizationHeader.startsWith("Bearer ")) {
            String token = authorizationHeader.substring(7);
            jwt = await validateJWT(token);
          }
        }

        var request = req.change(context: {'jwt': jwt});
        return handler(request);
      };
    };
  }

  @override
  Middleware get verityJwt => createMiddleware(
    requestHandler: (req) {
      if (req.context["jwt"] == null) {
        return Response.forbidden("unauthorized");
      }
      return null;
    },
  );
}
