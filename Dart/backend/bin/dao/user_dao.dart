import 'dao.dart';
import '../infra/database/db_configuration.dart';
import '../models/usuario_model.dart';

class UserDAO implements DAO<UsuarioModel> {
  final DbConfiguration _dbConfiguration;

  UserDAO(this._dbConfiguration);

  @override
  Future<bool> create(UsuarioModel value) async {
    var queryResult = await _execQuery(
      'INSERT INTO usuarios (nome, email, password) VALUES (?, ?, ?)',
      [value.name, value.email, value.password],
    );
    return queryResult.affectedRows > 0;
  }

  @override
  Future<List<UsuarioModel>> readAll() async {
    var query = await _execQuery('SELECT * FROM usuarios');

    List<UsuarioModel> result = [];
    for (var q in query) {
      result.add(UsuarioModel.fromMap(q.fields));
    }

    return result;
  }

  @override
  Future<UsuarioModel?> readOne(int id) async {
    var queryResult = await _execQuery('SELECT * FROM usuarios WHERE id = ?', [
      id,
    ]);

    return queryResult.affectedRows > 0
        ? UsuarioModel.fromMap(queryResult.first.fields)
        : null;
  }

  @override
  Future<bool> update(UsuarioModel value) async {
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
