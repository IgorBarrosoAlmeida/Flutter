import 'package:flutter/material.dart';
import 'package:flutter_basico/views/home_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black54,
          onPrimary: Colors.white,
          secondary: Colors.black54,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.black87,
          onSurface: Colors.white70,
        ),
      ),
      initialRoute: '/home',
      routes: {'/home': (_) => HomePage()},
    );
  }
}
