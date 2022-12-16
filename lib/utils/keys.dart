import 'package:flutter/widgets.dart';

/// This class contains all app specifics keys.
/// All Key objects should be created here as static final members.
class AppKeys {
  // Splash Screen
  static const splashScreen = Key('__splashScreen__');

  // Login Screen
  static const loginScreen = Key('__loginScreen__');

  // Register Screen
  static const registerScreen = Key('__registerScreen__');

  // Home Screen
  static const homeScreen = Key('__homeScreen__');

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static BuildContext? get context => navigatorKey.currentContext;
}

class FirestoreKeys {
  static String chatGroups = 'chat-groups';
  static String chatMessages = 'chat-messages';
  static String firestoreUsers = 'users';
}

/// Login Screen
const login = "Login";

/// Home Screen
const home = "Home";
const noDataFound = "No Data Found!";