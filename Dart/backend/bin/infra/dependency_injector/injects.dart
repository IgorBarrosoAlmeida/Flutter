import 'dependency_injector.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import '../../apis/login_api.dart';
import '../../services/noticia_service.dart';
import '../../apis/blog_api.dart';
import '../../models/noticia_model.dart';
import '../../services/generic_service.dart';
import '../database/mysql_db_configuration.dart';
import '../database/db_configuration.dart';
import '../../dao/user_dao.dart';
import '../../services/user_service.dart';
import '../../apis/user_api.dart';
import '../../services/login_service.dart';

class Injects {
  static DependencyInjector initialize() {
    DependencyInjector di = DependencyInjector();

    di.register<DbConfiguration>(() => MysqlDbConfiguration());

    di.register<SecurityService>(() => SecurityServiceImp());

    di.register<GenericService<NoticiaModel>>(() => NoticiaService());

    di.register<BlogApi>(() => BlogApi(di<GenericService<NoticiaModel>>()));

    di.register<UserDAO>(() => UserDAO(di<DbConfiguration>()));
    di.register<UserService>(() => UserService(di<UserDAO>()));
    di.register<UserApi>(() => UserApi(di<UserService>()));

    di.register<LoginService>(() => LoginService(di<UserService>()));
    di.register<LoginApi>(
      () => LoginApi(di<SecurityService>(), di<LoginService>()),
    );

    return di;
  }
}
