import 'package:flutter/material.dart';
import 'package:flutter_basico/controller/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;
  const CustomLoginButtonComponent({required this.loginController, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.loading,
      builder: (_, loading, __) {
        return loading
            ? CircularProgressIndicator()
            : ElevatedButton(
              onPressed: () {
                loginController.authentication().then((isValidLogin) {
                  if (isValidLogin) {
                    Navigator.of(context).pushReplacementNamed("/home");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: const Text("Login failled")),
                    );
                  }
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateColor.resolveWith((states) {
                  return Colors.green;
                }),
              ),
              child: Text("Login", style: TextStyle(color: Colors.white)),
            );
      },
    );
  }
}
