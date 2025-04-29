import 'package:flutter/material.dart';
import 'package:flutter_basico/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = LoginController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color.fromRGBO(67, 160, 71, 1),
        padding: EdgeInsets.symmetric(vertical: 120, horizontal: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 100),
              TextField(
                decoration: InputDecoration(label: Text("Login")),
                onChanged: _loginController.setLogin,
              ),
              TextField(
                decoration: InputDecoration(label: Text("Password")),
                obscureText: true,
                onChanged: _loginController.setPassword,
              ),
              SizedBox(height: 30),
              // loading se estiver tentando logar
              ValueListenableBuilder<bool>(
                valueListenable: _loginController.loading,
                builder: (_, loading, __) {
                  return loading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: () {
                          _loginController.authentication().then((
                            isValidLogin,
                          ) {
                            if (isValidLogin) {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed("/home");
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: const Text("Login failled")),
                              );
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateColor.resolveWith((
                            states,
                          ) {
                            return Colors.green;
                          }),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
