import 'package:flutter/material.dart';
import 'package:flutter_basico/components/login/custom_login_button_component.dart';
import 'package:flutter_basico/controller/login_controller.dart';
import 'package:flutter_basico/widgets/custom_textfield_widget.dart';

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
              CustomTextfieldWidget(
                label: "login",
                onChanged: _loginController.setLogin,
              ),
              CustomTextfieldWidget(
                label: "senha",
                onChanged: _loginController.setPassword,
                isPassword: true,
              ),
              SizedBox(height: 30),
              CustomLoginButtonComponent(loginController: _loginController),
            ],
          ),
        ),
      ),
    );
  }
}
