import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments
            as String; // ! garante que o argumento opcional foi preenchido
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop('retorno');
            }
          },
          child: Text(
            "Voltar para a pagina anterior $args",
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ),
    );
  }
}
