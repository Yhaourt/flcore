class InvalidCredentials implements Exception {
  InvalidCredentials();

  @override
  String toString() => 'Identifiants invalides. Veuillez réessayer.';
}
