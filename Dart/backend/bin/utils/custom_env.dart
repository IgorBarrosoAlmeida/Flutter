import 'dart:async';
import 'dart:io';
import 'string_extension.dart';

class CustomEnv {
  static Map<String, String> _envContent = {};

  static Future<T> get<T>({required String key}) async {
    if (_envContent.isEmpty) await _load();
    return _envContent[key]!.toType(T);
  }

  static Future<void> _load() async {
    List<String> lines = (await _readFile());

    // map = {'key': 'value'}
    _envContent = {for (String l in lines) l.split('=')[0]: l.split('=')[1]};
  }

  static Future<List<String>> _readFile() async {
    return await File(".env").readAsLines();
  }
}
