abstract class DAO<T> {
  // CRUD

  Future<bool> create(T value);
  Future<T?> readOne(int id);
  Future<List<T>> readAll();
  Future<bool> update(T value);
  Future<bool> delete(int id);
}
