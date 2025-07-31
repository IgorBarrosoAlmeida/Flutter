import 'package:password_dart/password_dart.dart';

import 'generic_service.dart';
import '../models/user_model.dart';
import '../dao/user_dao.dart';

class UserService implements GenericService<UserModel> {
  final UserDAO _userDAO;

  UserService(this._userDAO);

  @override
  Future<bool> delete(int value) {
    return _userDAO.delete(value);
  }

  @override
  Future<List<UserModel>> findAll() {
    return _userDAO.readAll();
  }

  @override
  Future<UserModel?> findOne(int id) {
    return _userDAO.readOne(id);
  }

  @override
  Future<bool> save(UserModel value) {
    if (value.id != null) {
      return _userDAO.update(value);
    } else {
      final hash = Password.hash(value.password!, PBKDF2());
      value.password = hash;

      return _userDAO.create(value);
    }
  }

  Future<UserModel?> findByEmail(String email) async {
    return _userDAO.readByEmail(email);
  }
}
