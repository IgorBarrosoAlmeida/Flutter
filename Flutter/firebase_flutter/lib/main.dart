import 'package:firebase_flutter/notifications/firebase_messaging_service.dart';
import 'package:firebase_flutter/utils/Routes.dart';
import 'package:firebase_flutter/notifications/local_notification_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        Provider<LocalNotificationService>(
          create: (context) => LocalNotificationService(),
        ),
        Provider<FirebaseMessagingService>(
          create:
              (context) => FirebaseMessagingService(
                context.read<LocalNotificationService>(),
              ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initializeFirebaseMessagingService();
  }

  initializeFirebaseMessagingService() async {
    await Provider.of<FirebaseMessagingService>(
      context,
      listen: false,
    ).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.amber),
      routes: Routes.routes,
      initialRoute: Routes.initial,
      navigatorKey: Routes.navigatorKey,
    );
  }
}
