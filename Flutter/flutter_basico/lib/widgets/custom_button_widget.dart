import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isDisable;
  final double titleSize;
  final String title;
  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.isDisable = false,
    this.titleSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisable ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return Colors.red;
          if (states.contains(WidgetState.pressed)) return Colors.blue;
          return Colors.green;
        }),
        shape: WidgetStateOutlinedBorder.resolveWith((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          );
        }),
        textStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return TextStyle(fontSize: titleSize * 2);
          }
          return TextStyle(fontSize: titleSize);
        }),
      ),
      child: Text(title, style: TextStyle(color: Colors.black)),
    );
  }
}
