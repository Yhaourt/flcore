abstract class ISignUp<T> {
  Future<void> signUp({
    required String email,
    required String password,
  });
}

abstract class ISignIn<T> {
  Future<void> signIn({
    required String email,
    required String password,
  });
}

abstract class ICurrentUser<T> {
  Future<T> currentUser();
}

abstract class ISignOut<T> {
  Future<void> signOut();
}

abstract class IRefreshToken<T> {
  Future<T> refreshToken(String refreshToken);
}
