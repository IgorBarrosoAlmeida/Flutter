import 'package:flutter/material.dart';
import 'package:flutter_basico/pages/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/PageTwo', arguments: 'Test')
                .then((value) => print(value));
          },
          child: Text(
            "Ir para a segunda page",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
