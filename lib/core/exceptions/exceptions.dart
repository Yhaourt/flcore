class UnknownException implements Exception {
  UnknownException();

  @override
  String toString() => 'Erreur inconnue. Veuillez réessayer.';
}

class InternalServerException implements Exception {
  InternalServerException();

  @override
  String toString() => 'Erreur interne du serveur. Veuillez réessayer.';
}

class UnauthorizedException implements Exception {
  UnauthorizedException();

  @override
  String toString() => 'Non autorisé. Veuillez vous reconnecter.';
}
