import 'package:firebase_flutter/notifications/custom_notification.dart';
import 'package:firebase_flutter/notifications/local_notification_service.dart';
import 'package:firebase_flutter/utils/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingService {
  final LocalNotificationService _notificationService;

  FirebaseMessagingService(this._notificationService);

  Future<void> initialize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          badge: true,
          sound: true,
          alert: true,
        );

    getDeviceFirebaseToken();
    _onMessage();
    _onMessageOpenedApp();
  }

  getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();

    debugPrint("===========================");
    debugPrint("TOKEN: $token");
    debugPrint("===========================");
  }

  // Trata a notificação quando o aplicativo está aberto ou em segundo plano
  _onMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _notificationService.showNotification(
          CustomNotification(
            id: android.hashCode,
            title: notification.title,
            body: notification.body,
            payload: message.data["route"] ?? "",
          ),
        );
      }
      _navigation(message);
    });
  }

  _onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _navigation(message);
    });
  }

  _navigation(RemoteMessage message) {
    String route = message.data["route"] ?? "";
    if (route.isNotEmpty) {
      Routes.navigatorKey?.currentState?.pushNamed(route);
    }
  }
}
