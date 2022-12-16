import 'package:bloc_project_structure/presentation/pages/home/home_screen.dart';
import 'package:bloc_project_structure/presentation/widgets/app_buttons.dart';
import 'package:bloc_project_structure/presentation/widgets/appbars.dart';
import 'package:bloc_project_structure/utils/keys.dart';
import 'package:bloc_project_structure/utils/routes.dart';
import 'package:bloc_project_structure/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// Body Widget
    Widget body() {
      return Center(
        child: appButtonBig(
          text: home,
          height: size40,
          width: size180,
          onTap: () => buttonOnClick(context),
        ),
      );
    }

    return Scaffold(
      appBar: appBarTitle(title: login),
      body: body(),
    );
  }
  /// buttonOnClick Event
  void buttonOnClick(BuildContext context) {
    Navigator.pushNamed(context,AppRoutes.home);
  }
}
