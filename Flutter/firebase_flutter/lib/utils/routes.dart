import 'package:firebase_flutter/pages/home_page.dart';
import 'package:firebase_flutter/pages/notificacao_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    "/home": (_) => const HomePage(),
    "/notificacao": (_) => const NotificacaoPage(),
  };

  static String initial = "/home";

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
