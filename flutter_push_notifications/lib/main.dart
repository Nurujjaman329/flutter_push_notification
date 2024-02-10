import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/page/home_screen.dart';
import 'package:flutter_push_notifications/page/notification_screen.dart';

import 'firebase_set/firebase_api.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotificaions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push',
      navigatorKey: navigatorKey,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        NotificationScreen.route: (context) => NotificationScreen(),
      },
    );
  }
}
