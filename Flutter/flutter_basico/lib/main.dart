import 'package:flutter/material.dart';
import 'package:flutter_basico/pages/page_one.dart';
import 'package:flutter_basico/pages/page_two.dart';

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
          primary: Colors.green,
          onPrimary: Colors.white,
          secondary: Colors.blue,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PageOne(),
        '/PageTwo': (context) => const PageTwo(),
      },
    );
  }
}
