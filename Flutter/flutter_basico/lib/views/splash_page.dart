import 'package:flutter/material.dart';
import 'package:flutter_basico/services/preference_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      PreferenceService.isAuth(),
      Future.delayed(Duration(seconds: 3)),
    ]).then((list) {
      list[0]
          ? Navigator.of(context).pushReplacementNamed('/home')
          : Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade600,
      child: Center(child: CircularProgressIndicator(color: Colors.white24)),
    );
  }
}
