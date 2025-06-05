import 'package:firebase_flutter/notifications/custom_notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidNotificationDetails;

  LocalNotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const android = AndroidInitializationSettings("@mipmap/ic_launcher");
    await localNotificationsPlugin.initialize(
      const InitializationSettings(android: android),
    );
  }

  showNotification(CustomNotification notification) {
    androidNotificationDetails = const AndroidNotificationDetails(
      "lembrete_notification_x",
      "lembrete",
      channelDescription: "Este canal é para lembretes!",
      importance: Importance.max,
      priority: Priority.max,
    );

    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(android: androidNotificationDetails),
      payload: notification.payload,
    );
  }
}
