import 'package:flutter/material.dart';

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
            Navigator.of(context).pushNamed('/PageTwo', arguments: 'Test');
            //.then((value) => var valor = value);
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
