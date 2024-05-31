import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:london_metro/view/splash/splash.dart';


import 'package:provider/provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'adMobHelper/adMobHelper.dart';
import 'api/firebase_api.dart';
import 'firebase_options.dart';
import 'getLanguage/getLanguage.dart';
import 'localization/localization.dart';


void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  AdMobHelper.initialization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("9ebc3534-7d06-4203-bfc7-d7eaec1c0099");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);
  // await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => (LanguageProvider()),
      child: GetMaterialApp(
          locale: Locale("English"),
          translations: Languages(),
          fallbackLocale: Locale("English"),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: const TextTheme(
                  displayLarge: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  displayMedium: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  displaySmall: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  bodySmall: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black))),
          // ignore: prefer_const_constructors
          home: SplashScreen()),
    );
  }
}
