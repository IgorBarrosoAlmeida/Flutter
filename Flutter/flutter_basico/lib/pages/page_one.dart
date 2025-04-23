import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_basico/widgets/custom_button_widget.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  ValueNotifier<int> randomValue = ValueNotifier<int>(0);

  void changeRandomValue() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      randomValue.value = Random().nextInt(1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: randomValue,
              builder: (context, value, __) {
                return Text("O valor eh: $value");
              },
            ),
            CustomButtonWidget(
              onPressed: changeRandomValue,
              title: "Button",
              isDisable: false,
            ),
          ],
        ),
      ),
    );
  }
}
