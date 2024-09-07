import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A mixin that provides secure storage functionality.
mixin Vault {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Stores a key-value pair.
  Future<void> storeInVault(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Retrieves a value by key.
  Future<String?> retrieveFromVault(String key) async {
    return await _storage.read(key: key);
  }

  /// Deletes a value by key.
  Future<void> deleteFromVault(String key) async {
    await _storage.delete(key: key);
  }
}
