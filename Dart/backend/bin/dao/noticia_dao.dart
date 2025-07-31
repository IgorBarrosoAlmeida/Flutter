import 'dao.dart';
import '../infra/database/db_configuration.dart';
import '../models/noticia_model.dart';

class NoticiaDAO implements DAO<NoticiaModel> {
  final DbConfiguration _dbConfiguration;

  NoticiaDAO(this._dbConfiguration);

  @override
  Future<bool> create(NoticiaModel value) async {
    var queryResult = await _dbConfiguration.execQuery(
      'INSERT INTO noticias (titulo, descricao, id_usuario) VALUES (?, ?, ?)',
      [value.title, value.description, value.userId],
    );
    return queryResult.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var queryResult = await _dbConfiguration.execQuery(
      'DELETE FROM noticias WHERE id = ?',
      [id],
    );
    return queryResult.affectedRows > 0;
  }

  @override
  Future<List<NoticiaModel>> readAll() async {
    var query = await _dbConfiguration.execQuery('SELECT * FROM noticias');

    List<NoticiaModel> result = [];
    for (var q in query) {
      result.add(NoticiaModel.fromMap(q.fields));
    }

    return result;
  }

  @override
  Future<NoticiaModel?> readOne(int id) async {
    var queryResult = await _dbConfiguration.execQuery(
      'SELECT * FROM noticias WHERE id = ?',
      [id],
    );

    return queryResult.length == 0
        ? null
        : NoticiaModel.fromMap(queryResult.first.fields);
  }

  @override
  Future<bool> update(NoticiaModel value) async {
    var queryResult = await _dbConfiguration.execQuery(
      'UPDATE noticias SET titulo = ?, descricao = ? WHERE id = ?',
      [value.title, value.description, value.id],
    );
    return queryResult.affectedRows > 0;
  }
}
