import 'package:firebase_flutter/firebase_messaging/custom_local_notification.dart';
import 'package:firebase_flutter/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class CustomFirebaseMessaging {
  final CustomLocalNotification _customlocalNotification;

  CustomFirebaseMessaging._internal(this._customlocalNotification);
  static final CustomFirebaseMessaging _singleton =
      CustomFirebaseMessaging._internal(CustomLocalNotification());

  factory CustomFirebaseMessaging() => _singleton;

  Future<void> inicialize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(badge: true, sound: true);

    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _customlocalNotification.androidNotifier(notification, android);
      }
    });

    // Redirecionamento caso o usuario clique na notificação com o app fechado ou em background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data['goTO'] != null) {
        navigatorKey.currentState?.pushNamed(message.data['goTO']);
      }
    });
  }

  getFirebaseToken() async {
    debugPrint("Token firebase:");
    debugPrint(await FirebaseMessaging.instance.getToken());
  }
}
