// ignore_for_file: annotate_overrides

import 'dart:async';
import 'package:bloc_project_structure/helpers/shar_pref.dart';
import 'package:bloc_project_structure/presentation/pages/auth/login_screen.dart';
import 'package:bloc_project_structure/presentation/pages/home/home_screen.dart';
import 'package:bloc_project_structure/utils/keys.dart';
import 'package:bloc_project_structure/utils/routes.dart';
import 'package:bloc_project_structure/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Structure extends StatefulWidget {
  const Structure({super.key});
  @override
  State<Structure> createState() => _StructureState();
}

class _StructureState extends State<Structure> {
  Function? onTap;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    bool? checkUserIsLogin;
    Future<bool> checkLogin() async {
      checkUserIsLogin =  await  SharePref.prefGetBool(SharePref.keyUserLogin, false);

      return checkUserIsLogin!;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppKeys.navigatorKey,
      theme: Themes.defaultTheme(),
      navigatorObservers: [MyNavigatorObserver()],
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
      // Turn off Accessibility settings
      builder: (context,Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0, boldText: false),
          child: child!,
        );
      },
      home: const LoginScreen(),
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  List<Route<dynamic>> routeStack = [];

  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
    //print('Route pushed: ${route.settings.name}');
  }

  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      routeStack.removeLast();
    });
    //print('Route popped: $route');
  }

  @override
  void didRemove(Route? route, Route? previousRoute) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      routeStack.removeLast();
    });
    //print('Route removed: $route');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      routeStack.removeLast();
      routeStack.add(newRoute!);
    });
    //print('Route replaced: $newRoute, previous route: $oldRoute');
  }
}
