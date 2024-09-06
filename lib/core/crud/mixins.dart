mixin FindAll<T> {
  Future<List<T>> findAll();
}

mixin Find<T> {
  Future<T> find(String id);
}

mixin Insert<T> {
  Future<void> insert(T entity);
}

mixin Update<T> {
  Future<void> update(T entity);
}

mixin Upsert<T> {
  Future<void> upsert(T entity);
}

mixin Delete<T> {
  Future<void> delete(T entity);
}
