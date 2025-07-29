import 'dao.dart';
import '../infra/database/db_configuration.dart';
import '../models/user_model.dart';

class UserDAO implements DAO<UserModel> {
  final DbConfiguration _dbConfiguration;

  UserDAO(this._dbConfiguration);

  @override
  Future<bool> create(UserModel value) async {
    var queryResult = await _execQuery(
      'INSERT INTO usuarios (nome, email, password) VALUES (?, ?, ?)',
      [value.name, value.email, value.password],
    );
    return queryResult.affectedRows > 0;
  }

  @override
  Future<List<UserModel>> readAll() async {
    var query = await _execQuery('SELECT * FROM usuarios');

    List<UserModel> result = [];
    for (var q in query) {
      result.add(UserModel.fromMap(q.fields));
    }

    return result;
  }

  @override
  Future<UserModel?> readOne(int id) async {
    var queryResult = await _execQuery('SELECT * FROM usuarios WHERE id = ?', [
      id,
    ]);

    return queryResult.affectedRows > 0
        ? UserModel.fromMap(queryResult.first.fields)
        : null;
  }

  @override
  Future<bool> update(UserModel value) async {
    var queryResult = await _execQuery(
      'UPDATE usuarios SET nome = ?, password = ? WHERE id = ?',
      [value.name, value.password, value.id],
    );
    return queryResult.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var queryResult = await _execQuery('DELETE FROM usuarios WHERE id = ?', [
      id,
    ]);
    return queryResult.affectedRows > 0;
  }

  _execQuery(String sql, [List? params]) async {
    var conn = await _dbConfiguration.connection;
    return await conn.query(sql, params);
  }
}
