import 'package:bloc_project_structure/localization/localization.dart';
import 'package:flutter/cupertino.dart';

/// This is commonData class with method.
class CommonDatas {
  static List<String> getLicenseTypes(BuildContext context) {
    AppLocalizations locals = AppLocalizations();
    List<String> licenseTypes = [
      locals.codeResent,
      locals.welcomeTo,
    ];
    return licenseTypes;
  }
}
