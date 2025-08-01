import 'package:mysql1/mysql1.dart';

import 'db_configuration.dart';
import '../../utils/custom_env.dart';

class MysqlDbConfiguration implements DbConfiguration {
  MySqlConnection? _connection;

  @override
  Future<MySqlConnection> get connection async {
    _connection ??= await createConnection();

    if (_connection == null) {
      throw Exception("[ERROR/DB] -> failed creating connection with database");
    }

    return _connection!;
  }

  @override
  Future<MySqlConnection> createConnection() async {
    return await MySqlConnection.connect(
      ConnectionSettings(
        host: await CustomEnv.get<String>(key: "db_host"),
        port: await CustomEnv.get<int>(key: "db_port"),
        user: await CustomEnv.get<String>(key: "db_user"),
        password: await CustomEnv.get<String>(key: "db_pass"),
        db: await CustomEnv.get<String>(key: "db_schema"),
      ),
    );
  }

  @override
  execQuery(String sql, [List? params]) async {
    var conn = await connection;
    return await conn.query(sql, params);
  }
}
