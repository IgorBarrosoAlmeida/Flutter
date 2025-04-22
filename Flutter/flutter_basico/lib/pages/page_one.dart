import 'package:flutter/material.dart';
import 'package:flutter_basico/widgets/custom_button_widget.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButtonWidget(
          onPressed: () {},
          title: "Button",
          isDisable: false,
        ),
      ),
    );
  }
}
