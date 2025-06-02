import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CustomLocalNotification {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel androidChannel;

  // construtor inicializa e configura o plugin e o canal de notificações
  CustomLocalNotification() {
    // configura o canal
    androidChannel = const AndroidNotificationChannel(
      "high_importance_channel",
      "High Importance Notifications",
      description: "this channel is used for important notifications",
      importance: Importance.max,
    );

    // configura o plugin
    _configureAndroid().then((value) {
      flutterLocalNotificationsPlugin = value;
      inicializeNotifications();
    });
  }

  Future<FlutterLocalNotificationsPlugin> _configureAndroid() async {
    var setFlutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await setFlutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(androidChannel);

    return setFlutterLocalNotificationsPlugin;
  }

  inicializeNotifications() async {
    const android = AndroidInitializationSettings("@mipmap/ic_launcher");

    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(android: android),
    );
  }

  androidNotifier(
    RemoteNotification notification,
    AndroidNotification android,
  ) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidChannel.id,
          androidChannel.name,
          channelDescription: androidChannel.description,
          icon: android.smallIcon,
        ),
      ),
    );
  }
}
