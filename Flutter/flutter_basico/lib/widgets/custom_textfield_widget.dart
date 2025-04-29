import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final bool isPassword;

  const CustomTextfieldWidget({
    super.key,
    required this.onChanged,
    required this.label,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
      obscureText: isPassword,
      onChanged: onChanged,
    );
  }
}
