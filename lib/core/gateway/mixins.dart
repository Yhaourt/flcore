mixin FindAll<T> {
  Future<List<T>> findAll();
}

mixin Find<T> {
  Future<T> find(String id);
}

mixin Create<T> {
  Future<T> create(T draft);
}

mixin Update<T> {
  Future<T> update(T entity);
}

mixin Delete<T> {
  Future<void> delete(T entity);
}
