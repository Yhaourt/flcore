mixin SignUp<T> {
  Future<void> signUp({
    required String email,
    required String password,
  });
}

mixin SignIn<T> {
  Future<void> signIn({
    required String email,
    required String password,
  });
}

mixin SignOut<T> {
  Future<void> signOut();
}

mixin CurrentUser<T> {
  Future<T> currentUser();
}
