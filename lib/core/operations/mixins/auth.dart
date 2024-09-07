mixin SignUp<T> {
  Future<void> signUp(T entity);
}

mixin SignIn<T> {
  Future<void> signIn(T entity);
}

mixin SignOut<T> {
  Future<void> signOut(T entity);
}
