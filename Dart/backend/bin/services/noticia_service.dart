import 'generic_service.dart';
import '../models/noticia_model.dart';
import '../utils/list_extension.dart';

class NoticiaService implements GenericService<NoticiaModel> {
  final List<NoticiaModel> _fakeDB = [];

  @override
  bool delete(int id) {
    _fakeDB.removeWhere((e) => e.id == id);
    return true;
  }

  @override
  List<NoticiaModel> findAll() {
    return _fakeDB;
  }

  @override
  NoticiaModel findOne(int id) {
    return _fakeDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(NoticiaModel value) {
    NoticiaModel? model = _fakeDB.firstWhereNullable((e) => e.id == value.id);

    if (model == null) {
      // Nova noticia
      _fakeDB.add(value);
    } else {
      // Atualização de noticia
      var index = _fakeDB.indexOf(model);
      _fakeDB[index] = value;
    }

    return true;
  }
}
