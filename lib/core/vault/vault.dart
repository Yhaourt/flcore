import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A class that provides secure storage functionality.
class Vault {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Writes a key-value pair to the vault.
  Future<void> writeInVault(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Reads a value from the vault by key.
  Future<String?> readFromVault(String key) async {
    return await _storage.read(key: key);
  }

  /// Deletes a value from the vault by key.
  Future<void> deleteFromVault(String key) async {
    await _storage.delete(key: key);
  }
}