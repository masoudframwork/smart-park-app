import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static final SecureStorageHelper _instance = SecureStorageHelper._internal();

  factory SecureStorageHelper() => _instance;

  SecureStorageHelper._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Write a value securely
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read a value securely
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete a key
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Delete all stored keys
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Check if key exists
  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  /// Read all key-value pairs
  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }
}
