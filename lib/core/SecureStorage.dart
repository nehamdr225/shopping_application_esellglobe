import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CoreSecureStorage {
  final _storage = new FlutterSecureStorage();

  Future getValue(key) async {
    try {
      return await _storage.read(key: key);
    } catch (err) {
      return null;
    }
  }

  Future savekeyVal(key, value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (err) {
      throw err;
    }
  }

  Future delKeyVal(key) async {
    try {
      await _storage.delete(key: key);
    } catch (err) {
      throw err;
    }
  }
}
