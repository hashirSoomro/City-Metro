

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';


import '../main.dart';
import '../view/Event/event.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  // void handleMessage(RemoteMessage? message) {
  //   if (message == null) {
  //     // return  Navigator.push(context,
  //     //                           MaterialPageRoute( builder: (context) => const Splash(),
  //     //                           ),
  //   };
  //   // 
  // }

  // Future initPushNotificatios() async {
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  //   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  //   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  //   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  // }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final FCMToken = await _firebaseMessaging.getToken();
    print("Token:$FCMToken");
    // initPushNotificatios();
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("title:${message.notification?.title}");
  print("body:${message.notification?.body}");
  print("payload:${message.data}");
}
