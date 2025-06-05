import 'package:firebase_flutter/notifications/custom_notification.dart';
import 'package:firebase_flutter/notifications/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valor = false;

  showNotification() {
    setState(() {
      valor = !valor;

      if (valor) {
        Provider.of<LocalNotificationService>(
          context,
          listen: false,
        ).showNotification(
          CustomNotification(
            id: 1,
            title: "teste",
            body: "Acesse o app!",
            payload: "/notificacao",
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListTile(
            title: const Text("Lembrar-me mais tarde"),
            trailing:
                valor
                    ? Icon(Icons.check_box, color: Colors.amber.shade600)
                    : const Icon(Icons.check_box_outline_blank),
            onTap: showNotification,
          ),
        ),
      ),
    );
  }
}
