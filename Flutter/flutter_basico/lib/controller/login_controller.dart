import 'package:flutter/widgets.dart';

class LoginController {
  String? _login;
  setLogin(String value) => _login = value;
  String? _password;
  setPassword(String value) => _password = value;

  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  Future<bool> authentication() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1));
    loading.value = false;
    return _login == "admin" && _password == "1234";
  }
}
