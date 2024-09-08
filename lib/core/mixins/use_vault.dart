import 'package:flcore/core/vault/vault.dart';

/// A mixin that provides secure storage functionality.
mixin UseVault {
  final Vault _vault = Vault();

  /// Gets the vault instance.
  Vault get vault => _vault;
}
