mixin FindAll<T> {
  Future<List<T>> findAll();
}

mixin Find<T> {
  Future<T> find(String id);
}

mixin Insert<T> {
  Future<T> create(T entity);
}

mixin Update<T> {
  Future<T> update(T entity);
}

mixin Upsert<T> {
  Future<T> upsert(T entity);
}

mixin Delete<T> {
  Future<void> delete(T entity);
}
