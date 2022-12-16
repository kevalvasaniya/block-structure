import 'package:bloc_project_structure/localization/localization.dart';

/// Separate Class Of Validation.
class KMValidators {

  /// Need a validator for US only
  static String? phoneNumberValidator(String phoneNumber) {
    var locals = AppLocalizations();

    if (phoneNumber.isEmpty) return null;

    if (phoneNumber.startsWith('+91')) {
      if (phoneNumber.length == 13) {
        return null;
      } else {
        return locals.codeResent;
      }
    } else {
      if (phoneNumber.length == 10) {
        return null;
      } else {
        return locals.welcomeTo;
      }
    }
  }
}
