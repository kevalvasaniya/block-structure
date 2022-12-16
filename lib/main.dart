import 'dart:io';
import 'package:bloc_project_structure/helpers/getit.dart';
import 'package:bloc_project_structure/notification/local_notification_service.dart';
import 'package:bloc_project_structure/notification/push_notification_services.dart';
import 'package:bloc_project_structure/structure.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main() async {
  /// the binding needs to be initialized before calling runApp
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize Firebase app
  await Firebase.initializeApp();

  /// initialize Service locator
  GetItHelper.init();

  /// Load configuration into memory from file
  await dotenv.load(fileName: ".config");
  /// Handle background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler,);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  /// Called push notification init method.
  PushNotificationServices().initMethod();

  /// Called local notification setup method.
  await LocalNotificationService().setupInteractedMessage();

  /// Overall app security of http request and response.
  HttpOverrides.global =  MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Project Structure',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:  SplashScreen(),
      home: const Structure(),
    );
  }
}



