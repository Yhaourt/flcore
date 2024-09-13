abstract class FindAll<T> {
  Future<List<T>> findAll();
}

abstract class Find<T> {
  Future<T> find(String id);
}

abstract class Insert<T> {
  Future<void> insert(T entity);
}

abstract class Update<T> {
  Future<void> update(T entity);
}

abstract class Upsert<T> {
  Future<void> upsert(T entity);
}

abstract class Delete<T> {
  Future<void> delete(T entity);
}
